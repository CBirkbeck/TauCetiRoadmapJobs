# Review of RiemannianGeometry (pull request #1683 at 5020009)

**Verdict:** needs changes

## R01 (P2) — The smooth operator core has another owner

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md:24`, repeated at 1942–2110: “R7A owns the smooth differential-operator, jet, symbol, formal-adjoint and Bochner-connection core”.

**Claim:** These are the generic constructions already owned by PseudodifferentialOperators P1.0 at its supplied open head. Calling that roadmap a downstream consumer reverses its explicit contract; this is not a new Riemannian specialization. Main ComplexKahlerGeometry also consumes that P1.0 core.

**Witness:** `TauCetiRoadmap/PseudodifferentialOperators/README.md:380–394,414–438,457–474` constructs these same objects and explicitly makes RiemannianGeometry R7 their consumer. Main `TauCetiRoadmap/ComplexKahlerGeometry/README.md:575–577,984–986` imports P1.0.

**Repair:** Delete the generic R7A construction targets and consume PseudodifferentialOperators P1.0 by section in the supplier contracts. Retain R7's geometric curvature identities and consequences. Remove the claimed reverse supply, including README 161 and 218–221, and update the Lean docstring's ownership description. P1.0 is earlier in the merge order. No new supplier gap is necessary. Repair tests: ∂² has double commutator 2 and symbols 4/−4 at ξ=2; the weighted-circle Bochner coefficient at 0 is 1/2, nonmetric. P1.0 already states these.

## R02 (P2) — The projective form comparison replans DGFloer

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md:417–423`: “Compare the complex Kähler form with K7.2's integral-one normalization: `ω_g=π·ω_FS`”.

**Claim:** This exact comparison, on the same supplied projective carrier and round Hopf metric, is already a target on main. The metric construction here and that later form comparison have intentionally separate owners.

**Witness:** Main `TauCetiRoadmap/DGFloer/README.md:831`, Layer 1 item 7, owns closedness, `ω_g=π·ω_FS`, the integral-one normalization, the radius-1/2 line calculation and the dimension-zero case.

**Repair:** Delete this additional form-comparison target here and record the deferral to DGFloer Layer 1 item 7 in Scope and ownership. Retain the quotient metric, curvature and geodesic-period construction in R1. Do not make the earlier metric construction depend on DGFloer's later comparison: DGFloer already consumes R1's metric. The split preserves the computed witnesses: CP¹ has metric area π whereas the normalized form integrates to 1; on CP⁰ both 2-forms are zero. Thus the scalar π is unchanged, with one owner for its proof.

## R03 (P2) — The Fischer decomposition is statable but absent

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md:2251–2255`: “giving P_d=H_d directsum r^2 P_(d-2), and iterating gives the harmonic homogeneous decomposition”; `Suggested.lean:16–32` omits it.

**Claim:** R8.1's finite harmonic-polynomial decomposition is a substantive end theorem, independent of the missing spherical Laplacian and spectral completeness. Native homogeneous multivariate polynomials and partial derivatives suffice to state it. Its absence cannot be explained by the docstring's Takahashi limitation.

**Witness:** A scratch statement using only `MvPolynomial`, `MvPolynomial.IsHomogeneous`, `MvPolynomial.pderiv` and a real-body finite-sum Laplacian elaborates at these pins with one `sorry` warning and no options.

**Repair:** Add the finite Fischer decomposition as a headline in `Suggested.lean`, with the few simple polynomial definitions it needs, and list its Lean name in R8.1. For n≥2 and a homogeneous p of degree d+2, state existence and uniqueness of a homogeneous q of degree d such that p−(Σ Xᵢ²)q is harmonic; iterate this for the full decomposition. Cover the stated real/complex coefficient versions. On ℝ³, p=Σ Xᵢ² gives q=1 and h=0, while p=X₁²−X₂² gives q=0 and h=p: their Laplacians are 6 and 0. These distinguish the actual splitting from declaring every homogeneous polynomial harmonic. Keep degree-zero/one examples in the README.

## R04 (P3) — Remove the coordinate companion acceptance file

**Location:** `TauCetiRoadmap/RiemannianGeometry/ParaboloidTargets.lean:6–10`: “These real-coordinate targets illustrate its integral and crossing statements.”

**Claim:** The repaired geometric headlines are now in `Suggested.lean`, but this file still adds five auxiliary definitions and three admissions about coordinate integrals/free functions. It is the illustrative coordinate substitute identified last round, not an additional geometric headline. Its five definitions also lack declaration docstrings, and its eight declaration names are absent from the README.

**Witness:** `ParaboloidTargets.lean:55–62` quantifies over `r θ : ℝ → ℝ` and three coordinate equations; `Suggested.lean:233–265` now states the actual native-geodesic crossing and exponential-pole results.

**Repair:** Delete `ParaboloidTargets.lean`; equivalently, delete this padding from the acceptance-test Lean files, rather than proving it in place. Keep the integral estimates and the coordinate proof route in README R5a.3. Retained tests: at a=1,R=2 the time lower bound is 3 and angular lower bound is 2 log 2; the false circular candidate r=1,θ=t has radial residual −1. The native geometric theorem now excludes that candidate through its geodesic hypothesis. This is the remaining, now P3, part of previous R06.

## R05 (P3) — Claim-level locators and source tracking are still incomplete

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md:256–286,292,404–405,534–559` and References at 2377–2425; no `sources.toml` is present.

**Claim:** Most of the seeded targets still lack exact theorem/section-and-page locators at their claims. A chapter-wide convention reference does not locate the curvature identities, local-symmetry equivalence or normal-coordinate jets. O'Neill's article range does not identify the printed page of the cited theorem/corollary. None of the eighteen works is in the required manifest.

**Witness:** §2.2 states its quadratic and cubic normal-coordinate expansions without a source locator; §1.2 cites only Lee Chapter 7. §1.3 names O'Neill Theorem 2/Corollary 1 without pinpoint pages.

**Repair:** Attach checked locators to the individual claims and record each of the eighteen works once in `sources.toml`, with the legal-access/version status. Do not label the Project Euclid error response a retrieved article. The Milnor Jacobi locator now checks out; retain it. Preserve the jet witness while adding its source: in unit-sphere normal coordinates, a transverse metric coefficient is `(sin t/t)²=1−t²/3+O(t⁴)`, whereas a parallel orthonormal frame has coefficient 1. The current mathematical distinction is correct; the missing locator is the defect. Inaccessible texts are itemized below, not silently certified.

## R06 (P3) — The definition-specific Checks remain incomplete

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md:360–374`: “the O'Neill tensor API uses restriction, horizontal/vertical type, and the curvature comparisons above.”

**Claim:** A shared three-bullet block does not give three discriminating Checks for each defined object. The displayed Rop tests occupy two bullets; the only A/T tests are a product and the Hopf example, both with T=0. Consequently the wrong definition T≡0 passes every displayed T check. Similar dense blocks, such as the geodesic defect at 1241, have no definition-specific three-Check list.

**Witness:** For the submersion `(ℝ², dx²+e^(2x)dy²)→ℝ`, the unit vertical field U=e^(−x)∂y has `T_U U=−∂x`, of norm 1. Both displayed T examples instead have value 0.

**Repair:** Give each definition its own API and at least three discriminating Checks, grouping shared prose only when each object still meets the requirement. For T use the product value 0; the above warped example with norm 1; and its rescaling `dx²+e^(4x)dy²`, where `T_U U=−2∂x` has norm 2. These reject T≡0 and an incorrect normalization. For Rop add a mixed-sign product, e.g. S²×H² with bivector eigenvalues 1,−1,0, beyond the existing constant-curvature and zero cases. Complete target-local dependencies and locators alongside the remaining long blocks, rather than treating a layer-wide Needs line as the prerequisites of each separate theorem.

## Verified sound

Full review of all three files: **six findings, three P2 and three P3; no P1**. Numerical tests are consistency checks, not proofs; source-certification limits are below.

### Previous findings, checked first against this head

No supplied repair report marks a finding “not actionable in this package”.

| Previous finding | Passage at this head, or concrete removal | Status |
|---|---|---|
| R01 unsupplied normal/marked adapters | README 1472–1479: “construct the smooth fibrewise equivalence”; 783–792 explicitly constructs finite marked-point subdivision. | Repaired. The line quotient sends [(a,b)] to (0,b); inserting an interior marked point splits its edge. |
| R02 reversed UO/VM arrow | README 169–171: “UnboundedOperators §4.7 → VariationalMethods §2.3 and §§5.1–5.2 → R5b.” | Repaired; both supplied open heads say this. |
| R03 countability supplier | README 994–996 names “SmoothBundlesConnections B5.2”. | Repaired; main B5.2 supplies the precise countability argument. |
| R04 repeated transport, contractions, extension | README 18–20: “owns reconstruction from smooth transport”; 33–36 defers curvature contractions and Lipschitz extension; 81,95–100,132–135 give their contracts. | Repaired for those objects. R01/R02 above concern different remaining duplicates. |
| R05 two missing headlines | Suggested 76–82 `einstein_factor_constant`; 174–181 `two_distinct_geodesics`. | Repaired; both elaborate and retain the needed hypotheses. |
| R06 coordinate paraboloid substitute | Suggested 233–265 now states geometric crossings and the vertex pole. Companion 6–9 still says “real-coordinate targets illustrate”. | Partly repaired; R04 above removes the surviving companion. |
| R07 shape/Checks/Needs | Required top-level headings and layer-ending Examples/Dependencies now exist; README 520–528 contains flat, spherical and non-Jacobi tests. | Substantial repair; R06 and R05 above identify remaining object-level defects. |
| R08 focal-index locator | README 1874–1880 separates “Lemma 6.9, pp. 37–38” from the endpoint-nullity calculation. | Repaired; Milnor 6.5 is nullity, 6.9 is index. |
| R09 source manifest and projective locator | README 404–405 still gives “Theorem 2 and Corollary 1”; References has an article page range. No manifest. | Not repaired for source tracking/pinpoint pages; R05 above. |

### Gate, build, declarations and scope

The worker's gate at 5020009 reports every counter zero, including imports, sorry-data, set_option, forbidden syntax, outside-folder, stray-files, depcheck and targeted build: **OK**. There is no failing gate check to report. The diff outside `TauCetiRoadmap/RiemannianGeometry` is empty. The worktree was not edited.

Independent dependency-check output:

```text
depcheck: 204 roadmaps, 1560 edges, 0 problem(s)
```

No UPWARD/CYCLE. The movable check handles placement after suppliers; it does not settle R01's ownership conflict.

Direct `lake env lean` elaboration of the absolute `Suggested.lean` path, run from the worktree, exited 0 with **13 admission warnings only**. Scratch copies of both Lean files also elaborated. Each of their 16 sorried theorems was tried with single-tactic `simp`, `rfl` and `infer_instance`; all remained admitted. Object searches of the pinned libraries did not identify a single exact library lemma closing one of the 13 kept headline statements. R04 is padding by its illustrative coordinate scope, not by a claim that its calculus is one-tactic trivial.

I appended and elaborated `#check @name` for **every actual declaration: 15 in Suggested (13 theorems, 2 definitions), and 8 in the companion (3 theorems, 5 definitions)**. I compared the resulting binders with the prose. No necessary standing hypothesis was lost. The supplied scanner's apparent sixteenth Suggested declaration, `is`, is a word in a docstring, not a declaration. `IsJacobiFieldOn` does not retain Boundaryless, consistently with README 465–466; the theorems that need it do retain it. The explicit compactness, connectedness, completeness, positive dimension, nonpositive curvature, closed-interval, induced-metric and nonzero angular-momentum assumptions are present where used.

No sorry-backed data, free proposition placeholder, set_option, algorithm or external-folder edit was found. The repairable overlaps are R01/R02. Normative README/CONTRIBUTING and main Completed HopfRinow/OrthogonalL2Bases were read for form.

The pins checked in `lake-manifest.json` are Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`.

### Headline coverage

| README headline family | Acceptance-test disposition |
|---|---|
| R1 constant-sectional tensor characterization, Schur, Einstein-factor constancy | Suggested 56,65,76. |
| R2 Jacobi initial-value existence and uniqueness | Suggested 103,115; real-body predicate at 90. |
| R3/R4 no endpoint-zero Jacobi field under K≤0 | Suggested 128. |
| R3 Morse index and R6 focal index | Named unstatable in docstring 24–26: section/index-form and multiplicity carriers. |
| R4 Cartan–Hadamard and Bonnet–Myers | Suggested 153,163, on native exponential/geodesic/metric carriers. |
| R4.8 two geodesics, R4.9 three simple closed images | Suggested 174,203. Distinctness is on the fixed interval/image, not arbitrary extensions. |
| R5 Gauss–Codazzi–Ricci, first/second volume variation | Named unstatable in docstring 26–29: second fundamental form/pullback connection. |
| R5a.3 paraboloid crossings and vertex pole | Suggested 233,254 with induced metric and explicit graph. |
| R7A canonical Bochner connection | Named unstatable in docstring 29–30, but ownership needs R01's correction. |
| R7 Bochner/Weitzenböck vanishing consequences | Named unstatable in docstring 30–31: Hodge-Laplacian and de Rham carriers. |
| R7.8 smooth distance duality | Suggested 284. |
| R8.1 finite Fischer decomposition | Statable and absent: R03. Its finite algebra does not need the later spherical operator. |
| R8 spectral/eigenmap programme, Takahashi | Takahashi named unstatable at 31–32: spherical Laplacian. Polynomial splitting must be separated from this limitation. |

This is the real Fischer probe that elaborated, with only one admission and no options:

```lean
import Mathlib
noncomputable section
open MvPolynomial
namespace FischerProbe
def polynomialLaplacian {n : ℕ} (p : MvPolynomial (Fin n) ℝ) :=
  ∑ i, pderiv i (pderiv i p)
theorem fischer (n d : ℕ) (hn : 2 ≤ n) (p : MvPolynomial (Fin n) ℝ)
    (hp : p.IsHomogeneous (d + 2)) :
    ∃! q : MvPolynomial (Fin n) ℝ, q.IsHomogeneous d ∧
      polynomialLaplacian (p - (∑ i : Fin n, (X i) ^ 2) * q) = 0 := by
  sorry
#check @fischer
end FischerProbe
```

### Pinned-library and ownership audit

Object searches used roadmap grep/show, main, supplied sibling checkouts and board packages. Overlaps are R01/R02. No duplicate fully qualified name of a kept Suggested declaration was found.

These **26 pinned file/declaration entries** were opened; paths are library-relative.

| Pin and file:line | Declaration/content checked and limitation |
|---|---|
| Mathlib `Topology/MetricSpace/Lipschitz.lean:308` | `LipschitzOnWith.extend_real`: any subset of a pseudometric space, K nonnegative; no nonempty-subset premise. |
| Mathlib `Topology/Compactness/CompactlyGeneratedSpace.lean:94` | `eq_compactlyGenerated` and sequential-space instance; metrizable spaces retain their topology. Not an unrestricted mapping-space exponential law. |
| Mathlib `Geometry/Manifold/Riemannian/Basic.lean:79` | `IsRiemannianManifold` identifies edist with the Riemannian path edistance. It does not itself supply connectedness or completeness. |
| Mathlib `MeasureTheory/Covering/Besicovitch.lean:455` | `exist_disjoint_covering_families`: disjoint closed-ball families with open-ball cover and the satellite bound; finite extraction/cutoffs are additional work. |
| Mathlib `MeasureTheory/Function/Jacobian.lean:645` | `addHaar_image_eq_zero_of_det_fderivWithin_eq_zero`: equal-dimensional derivative/determinant null-image theorem, sufficient for the stated normal-projection critical values. |
| Mathlib `RingTheory/MvPolynomial/Homogeneous.lean:46,87` | `IsHomogeneous`, `homogeneousSubmodule`; native polynomial carriers for R8.1. |
| Mathlib `Algebra/MvPolynomial/PDeriv.lean:61` | `pderiv`, real-body partial derivative; permits the Fischer probe. |
| Mathlib `RingTheory/MvPolynomial/EulerIdentity.lean:47,73` | Homogeneous partial derivative and Euler identity, not the entire Fischer theorem. |
| Tau Ceti `Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Tensor.lean:148,187` | `curvatureTensor`, antisymmetry; the native tensor sign was retained. |
| Tau Ceti `Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Metric.lean:111,141` | Metric skew-adjointness and `IsConstantCurvatureTensor`; latter is the full vector identity, not a free scalar predicate. |
| Tau Ceti `Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Sectional.lean:140,164,202` | `HasSectionalCurvatureAt`, constant sectional curvature, tensor-to-sectional implication. Independent vectors are required; dimensions 0/1 need separate reasoning for the converse. |
| Tau Ceti `Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Ricci.lean:101` | `ricciTensor_eq_of_curvatureTensor_eq_smul_sub` already gives (n−1)B. |
| Tau Ceti `Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Scalar.lean:112` | `scalarCurvature_eq_of_curvatureTensor_eq_smul_inner_sub` already gives n(n−1)κ. |
| Tau Ceti `Geometry/Manifold/VectorBundle/CovariantDerivative/AlongCurve/Basic.lean:124` | `alongCurveWithin`, defined with the chart's `symmL`; arbitrary raw sections are not automatically regular. |
| Tau Ceti `Geometry/Manifold/VectorBundle/CovariantDerivative/AlongCurve/Chart.lean:69` | `symmL_alongCurveInChartWithin`, with differentiability/unique-differentiability conditions. |
| Tau Ceti `Geometry/Manifold/Riemannian/Geodesic/Basic.lean:97,113` | `IsGeodesicCurveOn` includes unique differentiation, C² regularity and zero covariant acceleration; global predicate is its full-domain version. |
| Tau Ceti `Geometry/Manifold/Riemannian/Geodesic/Exponential.lean:92,98` | Exponential domain and `riemannianExp` at time 1; outside-domain totalization is not a completeness theorem. |
| Tau Ceti `Geometry/Manifold/Riemannian/Induced.lean:92,124` | `inducedRiemannianMetric`, `inducedRiemannianMetric_inner`: injective differential into a real inner-product space. |
| Tau Ceti `Geometry/Manifold/Riemannian/Homogeneous.lean:69–79` | Homogeneous intrinsic completeness with finite-dimensional, separation and transitive isometry-action assumptions. |
| Tau Ceti `Geometry/Manifold/SmoothEmbedding/NormalSpace.lean:57,108` | Quotient `NormalSpace` and `normalClassL`; not yet the new smooth metric orthogonal-to-quotient comparison. |
| Tau Ceti `Geometry/Manifold/Morse/Index.lean:74` | `manifoldMorseIndex` uses the chart Hessian; R6's shape-operator calculation is additional. |
| Tau Ceti `Geometry/Manifold/TubularNeighborhood/Euclidean.lean:497` | Compact C² immersion/embedding normal-radius statement; retained compactness and differential hypotheses. |
| Tau Ceti `AlgebraicTopology/UniversalCover/RealProjective/FundamentalGroup/Basic.lean:134` | `fundamentalGroupMulEquivAt`, with 2≤n; does not include RP¹'s infinite cyclic group. |
| Tau Ceti `Geometry/Manifold/Riemannian/Isometry/Euclidean.lean:123` | `RiemannianIsometry.affineIsometryMulEquiv`; existing Euclidean isometry classification is consumed. |
| Tau Ceti `Geometry/Manifold/Riemannian/Isometry/Sphere/Basic.lean:124` | `LinearIsometryEquiv.unitSphereIsomHom`; used as the native round action. |
| Tau Ceti `RepresentationTheory/ClassicalGroups/WeylDimension/EvenOrthogonal.lean:183,300` and `OddOrthogonal.lean:87` | Numerical Weyl-dimension constructions. These do not construct the new harmonic-polynomial representation or identify its highest weight. |

### Resolved roadmap contracts and supply direction

Existing roadmaps were checked on **main**; new PDO, VM and nested UnboundedOperators at their supplied open heads. These **25 contract groups** resolve the supplier citations.

| Supplier / repository-relative README location | Resolution |
|---|---|
| `Completed/HopfRinow/README.md`, Layers 0–4 | Levi-Civita, along-curve derivative, geodesic flow, exponential/normal balls, first variation, completeness; not a second Jacobi/index implementation. |
| `TauCetiRoadmap/DifferentialGeometry/README.md:268,311,341,371,503,535,782,816,862,877,910` | Layers 0–3,5–10,12: forms, flows, integration, Jordan/Green, de Rham comparison, Sard, metrics and densities. Scalar Laplacian sign is reversed explicitly for Δ⁺. |
| `TauCetiRoadmap/SmoothBundlesConnections/README.md:421,498,559,605,776` | B1.4–1.5/B2: smooth quotient/pullback/associated bundles, L², densities. |
| Same, 871–978,979,1072 | B3/B4/B5.0: induced/metric connections, curvature and parallel transport. |
| Same, 1115–1174,1227–1235,1306–1327 | B5.1 inverse transport dictionary, B5.2 π₁ countability, B6.0 uniform compact-set radii; previous R03/R04 repaired. |
| `TauCetiRoadmap/GeometricTopology/README.md:218–222,627,696,938–943` | Layers 1,7,8 and smooth triangulation. The two extra adapters are now explicit targets here. |
| `TauCetiRoadmap/ComplexKahlerGeometry/README.md:626,651,984–986` | K5a density, distributions, real/complex elliptic/Hodge realization; smooth operator supplier is PDO P1.0. R01 applies. |
| Same, 1407–1439,1444–1461 | K7.1 projective smooth carrier; K7.2 normalized form and projective bundles. Metric scale is additional R1 work, with R02's separate form comparison. |
| `TauCetiRoadmap/PDE/README.md`, A.1–6/D16–19/E20–22 | Scalar weak derivatives, trace and elliptic estimates. R3 explicitly owns the vector-valued interval comparison; R5b explicitly owns its boundary H² estimate. |
| `TauCetiRoadmap/VariationalMethods/README.md:45–56,499–556,841–910` | §§2.3–2.4,5.1–5.2 consume the represented operator; no input back into UO-D06. |
| `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:512,871–875` | §4.7/UO-D06 owns representation/complexification. One-dimensional form 2uv gives A=2 and inverse 1/2 before the compact-pair specialization. |
| `TauCetiRoadmap/GeneralizedCohomology/README.md:1082–1183` | G4.0b native quaternionic/Grassmannian carriers and smooth Hopf comparisons; no Riemannian metric dependency. |
| `TauCetiRoadmap/TopologicalKTheory/README.md:1083–1096` | T6.6 block U(r−1)×U(1), last-coordinate line and tautological comparison; compatible with R1's ordered blocks. |
| `TauCetiRoadmap/CharacteristicClasses/README.md:552–588`, C1.5/C2/C3 | C2.0 relative bundle-disc/sphere CW models; ordinary RP²/Thom classes for finite detection. No curve-space cocycle supplied. |
| `Completed/ConformalMapping/README.md:102–148` | L3/L5 Riemann map, Jordan boundary/separation/filled-hull inputs. Does not supply spherical curve shortening. |
| `TauCetiRoadmap/GeometricMeasureTheory/README.md:106,183,210,248,275` | G1/G3–G6 arclength, BV, variation/perimeter; spherical comparison and flow adapters remain here. |
| `TauCetiRoadmap/Isoperimetry/README.md:182,397` | I3/I6 Euclidean Jordan inequality; the spherical sharp inequality is a separate target here. |
| `TauCetiRoadmap/AlgebraicTopology/README.md:544–580,1949–1998`, Stages 2,4–8 | Raw suspension/sphere homeomorphism and AT8.11a mapping-CW/fixed-interval comparisons are supplied. R3 adds the specified curried suspension and path comparisons. |
| `Completed/UniversalCovers/README.md` | Covering/fundamental-group floor; countability for the smooth universal cover comes separately from SBC B5.2. |
| `TauCetiRoadmap/DGFloer/README.md:258–296,461`, Layer 1 item 2 and Layer 2 item 3 | Moore lengths, Hopf exact sequence, weak-equivalence homology and evaluation/currying. Its R2–R3 applications are downstream. Item 7 at 831 owns R02's form comparison. |
| `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:233,261,275` | L0–L2 Lie carriers, Ad/dAd=ad; compactness is imposed separately for averaged invariant metrics. |
| `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md:237,265,297` and `RepresentationTheory/CompactGroups/README.md:226,248` | Orthogonal highest weights/dimension, averaging/reducibility. R8 must construct its actual harmonic representation. |
| `TauCetiRoadmap/SpinGeometry/README.md:136,166–169,293,351` | G1.2/G2.2/G3.4 finite Clifford/exterior symbols and compatible connections; later Dirac/index analysis is not an input. |
| `TauCetiRoadmap/MorseTheory/README.md`, M1–M6; `HeegaardFloer/README.md`, Lane M | Ordinary Morse/Morse–Bott attachment and gradient theory versus Morse–Smale homology. R3's finite broken-geodesic carrier remains its own target, not HomotopySpheres Stage 4B. |
| `TauCetiRoadmap/Yamabe/README.md:308–325`, Y9 | Separate complete Obata rigidity after R7.0's Hessian equality. No reliance on later R7 harmonic-form vanishing. |

Downstream boundaries were checked for PositiveMass §2.3 (AE lower-volume limit), CalibratedGeometry C3 (C² volume), SpectralManifolds (commutator distance), OptimalTransport Layer 7 (cut locus), AffineMorseLefschetz (real focal geometry) and RicciFlow (sphere/positive-Ricci consequences). Main `TauCetiRoadmap/NoncommutativeGeometry/README.md:410–432` supplies general spectral triples; `SpinGeometry/README.md:569` is the later Dirac example. Internal order separates direct models from comparisons, cut-locus input from polar integration, and UO → VM → R5b. No declared gaps were supplied.

### Adversarial calculations

The following **83 retained rows** cover the seeded sample, headline theorems and findings. Other per-target calculation rows are omitted for comment length. “Retain” means no defect in that instance, not source certification. R1–R8 are README targets; calculations use its curvature and nonnegative-Laplacian signs.

| Statement | Instances tried | Values computed on the two sides / excluded model | Result/change |
|---|---|---|---|
| R1 curvature convention | Unit sphere, orthonormal e₁,e₂ | R(e₁,e₂)e₂=e₁; numerator=1, Gram denominator=1, K=1 | Retain. |
| R1 antisymmetry and pair symmetry | Sphere R₁₂₂₁ | R₁₂₂₁=1, R₂₁₂₁=−1; paired exchange gives 1 | Retain. |
| R1 first Bianchi | Sphere e₁,e₂,e₁ | Three terms −e₂, e₂, 0 sum to 0 | Retain. |
| R1 second/contracted Bianchi | Constant κ, n=3 | ∇R=0; div Ric=0=(1/2)d Scal | Retain. |
| Constant tensor iff sectional, Suggested 56 | Dimensions 0,1; sphere/hyperbolic | In dimensions 0/1 tensor RHS=0 for every κ and two-plane condition is vacuous; sphere/hyperbolic both sides give ±1 | Retain iff; no unique κ in low rank. |
| Curvature polarization | κ=1 model | Plane (e₁,e₂) gives 1; replacing e₂ by 2e₂ gives numerator4/denominator4=1 | Retain independent-vector premise. |
| Ricci/scalar contractions | S³; flat; n=0,1 | Ric=2g, Scal=6; flat0; n(n−1)κ=0 at n=0,1 | Retain supplied contractions. |
| R1.2 local symmetry | Sphere; metric dx²+e^(2x²)dy² | Sphere ∇R=0 and radial reflection isometric; warped K=−2−4x², K′(1)=−8≠0 | Retain; excludes arbitrary metric. |
| Schur, Suggested 65 | S³; variable-curvature surface | κ=1 at any two sphere points; surface κ(0)=−2, κ(1)=−6 | Retain n≥3. |
| Einstein constancy, Suggested 76 | S³, radius-two S³ | Factors 2 and 1/2; each connected component constant, disjoint union not globally constant | Retain connectedness. |
| Einstein dimension restriction | Warped surface above | Ric=K g with factors −2 and −6 | Retain n≥3. |
| Constant metric rescaling | g′=4g on sphere | Length2×, K′=1/4, Ric as (0,2) unchanged; scalar divided by4 | Retain. |
| Conformal connection law | Euclidean g, u=x₁ | ∇′₁∂₁=∂₁; ∇′₂∂₂=−∂₁; RHS gives same | Retain. |
| Conformal Ricci/scalar law | u=x₁ at origin, n=2/3 | n=2 Ric=0; n=3 Ric diag(0,−1,−1), scalar−2 from both formulas | Retain. |
| Bi-invariant connection/curvature | Nonabelian so(3), [e₁,e₂]=e₃ | ∇₁e₂=e₃/2, R(e₁,e₂)e₂=e₁/4; abelian group gives0 | Retain; not abelian-only. |
| Curvature operator definition | Constant ±1, rank1 | Eigenvalues ±1; Λ² of a line is0 | Retain sign; R06 adds third object test. |
| Rop mixed product | S²×H² | Sphere plane1, hyperbolic plane−1, mixed plane0 | R06 repair distinguishes mixed curvature. |
| Submersion A | Product; Hopf S³→CP¹ | Product A=0; Hopf vertical bracket norm²4, Kbase=1+3·4/4=4 | Retain. |
| Submersion T | Product; warped e^(2x) fibre | Product0; unit vertical U gives T_UU=−∂x, norm1 | R06: missing nonzero test. |
| T normalization | Warped e^(4x) fibre | T_UU=−2∂x, norm2, not1 or0 | R06 repair test. |
| Projective quotient norm | Off-diagonal rotation; vertical diag(0,i) | Horizontal −tr X²/2=1=orbit norm²; vertical values1/2≠1 | Retain horizontal restriction. |
| CP/HP curvature range | Complex/quaternionic line; totally real plane | K=1+3=4 on a line; K=1+0=1 on totally real plane | Retain d≥2 attainment restriction. |
| Projective low dimensions | d=0,1 | d=0 point/no plane; CP¹/HP¹ radius1/2 gives K=4 | Retain. |
| Primitive projective period | Horizontal γ(t)=cos t z+sin t v | γ(π)=−z same line; at π/2 line[v]≠[z] | Retain π. |
| Kähler form scale | CP¹ and CP⁰ | ∫ω_g=π versus ∫ω_FS=1; dimension0 both0 | Correct mathematics; R02 ownership repair. |
| IsJacobiFieldOn definition | Flat γ(t)=te₁, J=u+tv | J″=0 and R term0, residual0 | Retain. |
| Jacobi negative control | Flat J=t²e₂ | J″=2e₂, R term0, residual2e₂≠0 | Retain. |
| Jacobi sphere/hyperbolic | J=sin(t)E / sinh(t)E | −sin(t)E+sin(t)E=0; sinh(t)E−sinh(t)E=0 | Retain sign. |
| Initial-data existence, Suggested 115 | Flat arbitrary u,v | J(0)=u, D J(0)=v; zero tangent space gives unique0 | Retain. |
| Initial-data uniqueness, Suggested 103 | Two flat affine fields | Same u,v gives difference0 throughout interval; arbitrary outside extension irrelevant | Retain interval-only conclusion. |
| Variation realizes Jacobi | Flat γ_s(t)=te₁+s(u+tv) | ∂sγ=u+tv; ∂t²γ_s=0 | Retain compact-interval flow premise. |
| Wronskian constancy | Sphere cos(t)E and sin(t)E | cos²t+sin²t=1 at t=0 and π/2 | Retain. |
| Exponential derivative via Jacobi | Sphere transverse tE | d exp(tE)=sin(t) transported E; radial derivative has factor1 | Retain. |
| R2.2 parallel versus coordinate frame | Sphere t=π/2 | Parallel frame norm1; transverse coordinate vector norm sin(t)/t=2/π | Retain distinction. |
| R2.2 normal metric quadratic jet | Sphere transverse coordinate | (sin t/t)²=1−t²/3+O(t⁴); curvature term coefficient−1/3 | Retain; R05 locator. |
| R2.2 cubic jet | Constant-curvature space | ∇R=0; cubic coefficient0 in both expansion and sin-series | Retain; R05 locator. |
| Normal Christoffel/first jet | Flat/sphere at origin | Metric first derivatives0, Γ(0)=0; flat all higher terms0 | Retain. |
| R3 index form and energy factor | Flat interval [0,1], X=sin πt E | I(X,X)=π²/2; for E=half integral this is the Hessian, not twice it | Retain. |
| Nullity at first conjugate endpoint | Sphere segment lengthπ | I(sin t E)=0; endpoint-zero solution dimension n−1, index0 | Retain endpoint convention. |
| Interior conjugate index | Sphere length L=3π/2 | I(sin(πt/L)E)=π²/(2L)−L/2=−5π/12; index n−1 | Retain strict-interior count. |
| No Jacobi zeros, Suggested 128 | Flat interval distinct endpoints | J=u+tv, J(a)=J(b)=0 implies v=0,u=0; sphere sin t E is excluded by K≤0 | Retain. |
| Cartan–Hadamard, Suggested 153 | ℝⁿ; flat circle | exp identity (one sheet); ℝ→S¹ period2π covering, not injective | Retain covering conclusion without simple connectivity. |
| Myers bound, Suggested 163 | Unit Sⁿ, n≥2 | Ric=(n−1)g and diameterπ=π/√1; n=1 Ric0 gives no such positive-Ricci argument | Retain dimension/κ assumptions. |
| Two geodesics, Suggested 174 | Circle from angle0 toπ/2 | Angles πt/2 and−3πt/2; t=1/2 images antipodal; line has unique segment | Retain compactness and in-interval distinction. |
| Three simple images, Suggested 203 | Unit S² coordinate great circles | Period2π; each injective on [0,2π); xy,yz,zx planes yield3 distinct images | Retain image distinctness, not reparametrization count. |
| Short-arc defect | Geodesic arc; small latitude arc | Geodesic length−distance=0; curved short arc length−distance>0 | Retain; add object-specific Checks per R06. |
| Smooth orthogonal normal adapter | Line in ℝ²; identity embedding | [(a,b)]→(0,b); normal fibre of identity is0 | Previous R01 repaired. |
| Gauss equation | Unit sphere / affine plane | Extrinsic term1−0=1; plane B0 gives0 | Retain outward B=−gν convention. |
| Codazzi/Ricci normal equations | Sphere hypersurface | ∇B=0, normal curvature0; shape commutator of scalar operators0 | Retain. |
| Relative-volume density | Homothety f_t=(1+t)f, dimension2 | J=(1+t)²; J′(0)=2, J″(0)=2; dimension0 J1, derivatives0 | Retain real C² density target. |
| First volume variation | Unit S^m outward radial speed1 | −m⟨H,ν⟩=m; derivative of (1+t)^m=m | Retain averaged-H factor. |
| Paraboloid graph definition | x=0; x=(1,0) | Images (0,0,0),(1,0,1); differential has injective first two coordinates | Retain native induced metric. |
| Clairaut/radial equation | a=1 at turning point r=1 | r′=0, r″=1/5; circular r1,θ=t residual−1 | Retain actual geodesic premise. |
| Companion integrands | a=1, s=1; s>1 | Totalized endpoint value0; substitution s=√(1+u²) removes square-root singularity | Correct coordinate math; R04 delete extra Lean file. |
| Companion lower estimates | a=1,R=2 | Time lower bound R²−a²=3; angular lower bound2log2 | R04 keeps README calculations. |
| Companion monotonicity/limits | a>0, R=a and R→∞ | Integrals start0, transformed integrands>0; lower bounds R²−a² and2a log(R/a)→∞ | R04; a=0 angular conclusion would fail. |
| Native paraboloid crossings | Turning radiusa, outward speedv>0 at radiusR | Polar determinant2av/R²≠0; Cartesian chart determinant2av/R≠0; equal points when angle difference2πk | Suggested 233 retains geometric statement. |
| Vertex pole | Meridians arclengthℓ(r) | ℓ′=√(1+4r²)>0, ℓ(0)=0, ℓ→∞; unique radial inverse | Suggested 254 retains global pole. |
| Normal second variation | Equator in S², unit constant normal variation | Q=−∫1=−2π; totally geodesic Euclidean plane Q=∫‖∇V‖²≥0 | Retain ambient curvature sign. |
| Focal normal derivative | Circle inward normal at t=1/2,1,2 | Tangent factors1−t=1/2,0,−1; focal only at1 | Retain shape sign. |
| Squared-distance Hessian/index | Same circle | Hess2(1−t)=1,0,−2; index/nullity=(0,0),(0,1),(1,0) | Previous R08 repaired. |
| Mixed-boundary focal index form | Normal segment lengthb | Test affine scalar with value1 at0 gives1/b−1: at b=1/2,1,2 values1,0,−1/2 | Retain negative initial shape term. |
| R7A finite jets | x² and0 at0 | Value/first jet both0; second derivative2 versus0 | R01: supplied PDO object. |
| Differential order/commutators | ∂² and multiplication by3 | [[∂²,x],x]=2, third commutator0; [3,x]=0 | R01; order-zero need not mean zero. |
| Geometric/Fourier symbols | ∂², ξ=2 | σ_geom=4, σ_F=−4; −∂² reverses these | R01, retain conventions. |
| Formal adjoint | x∂ with density dx | (x∂)*=−x∂−1; on constant1 gives−1, not0 | R01. |
| Rough-Laplacian energy | Flat circle e^(ikx) | ∇*∇ eigenvalues k²=0,1,4 for k=0,1,2; energy same | R01. |
| Bochner decomposition/density | −∂²−cos x∂ | Connection a=cos x/2, V=a′+a²=−sin x/2+cos²x/4; at0 a1/2,V1/4 | R01; nonmetric for standard fibre metric. |
| Metric compatibility control | Unit section, above connection at0 | Derivative of norm²0; sum of two connection pairings1 | Retain canonical-density hypothesis. |
| Laplace scaling/Dirac square | D=∂, operators −∂²,−2∂² | Fourier symbols at2 are4,8; c=1,2; −∂⁴ order4 excluded | R01. |
| Scalar Bochner identity | Flat f=x² | Δ⁺‖df‖²=−8; 2‖Hess f‖²=8; remaining terms0 | Retain sum0. |
| Lichnerowicz/equality | Unit Sⁿ coordinate f | λ=n=nκ atκ1; Hess f=−fg; Ric=(n−1)g | Retain n≥2 and separate Obata input. |
| Weitzenböck curvature term | Unit sphere p-forms | ℛ_p=p(n−p)Id; p=1 gives n−1, p=n gives0 | Retain top-degree exception. |
| Curvature-operator bound | Constant sectional κ | Bound reduces to equality p(n−p)κ on both sides | Retain normalization. |
| Bochner vanishing | Sphere versus flat torus | Sⁿ positive intermediate potential forces harmonic0; flat torus parallel p-forms dimension binomial(n,p) | Retain positivity, not mere nonnegativity. |
| Smooth distance duality, Suggested 284 | Open interval; x=y | f(t)=t realizes distance abs(x−y); diagonal supremum of {0}=0 | Retain no completeness assumption. |
| Fischer product identity | ℝ³, h=1 or x₁, k=1 | Δr²=6; Δ(r²x₁)=10x₁, matching2k(2l+n+2k−2) | R03: state finite theorem. |
| Fischer unique splitting | ℝ³ p=r² / x₁²−x₂² | q=1,h=0 / q=0,h=p; Laplacians6/0 | R03. |
| Harmonic dimension | n=3,d=0,1,2 | dimP=1,3,6; dimH=1,3,5; radial term0,0,1 | Retain negative-degree convention. |
| Harmonic restriction eigenvalue | S² d=0,1,2 | λ=d(d+1)=0,2,6; constants/coordinates/quadratics agree | Retain scalar-Laplacian sign. |
| Spectral completeness check | S¹ Fourier modes | Different integers orthogonal; constant misses every nonzero Fourier pair | Retain entire-eigenspace target, not finite inclusion alone. |
| Full eigenspace normalization | S² degree1 orthonormal basis | Σf_i²=3/(4π); Σdf_i²=3g/(4π); scaling√(4π/3) gives position map | Retain full basis premise. |
| Takahashi radius | S² d2, λ6 | Unit-target map pulls metric to3g; target radius√(m/λ)=1/√3 restoresg | Retain λ>0. |

### Source verification

All **18 works** were attempted through the sources service: **11 readable legal texts**, seven unavailable. No manifest was edited. The README has no additional “unverified” markers; missing locators are R05.

| Seed target | Source text and locator examined | Outcome |
|---|---|---|
| §1.1 Curvature identities | Lee second edition, Chapter 7 as named in References; native tensor/sign definitions also opened | Mathematical sphere/flat/low-rank tests above pass. No exact claim locator is supplied and Lee's text was unavailable; not source-certified. |
| §1.2 Local symmetry and Einstein factor | README 292's Lee Chapter 7; contracted-Bianchi route and explicit warped-surface control | No pinpoint theorem/page and no readable Lee text. Not source-certified. |
| §1.3 Metric changes, Lie groups, submersions | O'Neill Theorem 2/Corollary 1, article pp. 459–469; requested official text | Publisher retrieval produced an access-error page, not a paper. The theorem numbering/pages/hypotheses cannot be certified. Projective/trace examples were independently recomputed. |
| §2.1 Jacobi initial data | `milnor1963 line 3351–3375`, printed p. 77; Lemmas 14.3/14.4 at lines 3496/3514, printed pp. 80–81; extension step lines 3562–3567 | Verified initial data give all 2n solutions; variation realization is on a compact segment with a common small parameter interval. Milnor's curvature-slot/sign presentation is translated to the stated sphere-positive convention. |
| §2.2 Normal-coordinate jets | README 534–559 gives no mathematical source locator; Lee/Wang legal-access attempts | No theorem/page to certify. Parallel-versus-coordinate frame and quadratic/cubic coefficients were independently tested; R05 remains. |

Additional source evidence, read in its stated version:

- **Milnor:** `milnor1963 line 1600` (Lemma 6.5, printed p. 36) gives focal nullity; line 1677 (Lemma 6.9, printed pp. 37–38) gives the nondegenerate squared-distance index. The README now derives the degenerate-endpoint extension separately from its Hessian calculation. Line 3592 begins Theorem 15.1, printed p. 83, the fixed-endpoint index theorem.
- **Homma, [arXiv v1](https://arxiv.org/abs/math/0307022v1):** `homma2003 line 1006`, Theorem 7.1, printed p. 24, and lines 1106–1138, Example 8.2, pp. 27–28, support the associated-bundle/form Bochner route. The real/orientation-free comparison is additional work. Rendering p. 27 confirmed the misprint below; the roadmap uses the correct operator.
- **Gage:** `gage1990 line 379–394`, Theorems 2.12–2.13/3.1, gives smooth existence, continuation and embeddedness; lines 714–744, Theorems 4.10/4.12, gives subsequential convergence and primitive embedded limit under its bounds/orientation. Lines 746–749, Theorem 5.1, has the extra total-space-curvature bound 3π. R4.9 owns the stronger route without that extra bound.
- **Ma, arXiv v3:** `ma2020 line 372–395`, Theorem 4.1, printed p. 10, and lines 953–984, Theorem 5.4, printed p. 21, were read for distance comparison and Type-I passage. The roadmap separately owns the mass, nonflatness, error and compactness steps.
- **Lauer, arXiv v1:** `lauer2016 line 25–35`, Theorem 1.1, printed p. 1: zero-area Jordan trace supplies uniqueness up to reparametrization and immortality exactly for area bisection. Lines 12–15 distinguish the positive-area annular outcome. The roadmap retains the zero-area restriction.
- **Allen–Layne–Tsukahara, arXiv v2:** `allen2015 line 70–79`, Theorem 1, printed p. 2: constant-curvature convex-domain hypotheses, fixed distinct nonconjugate endpoints and boundary curvature compatibility are retained. This is not a general arbitrary-metric boundary-flow supplier.
- **Dobbins, arXiv v1:** `dobbins2021 line 193–199`, Lemma 2.2, printed p. 5: Fréchet initial convergence and finite pre-extinction times give Hausdorff convergence. Length/parabolic upgrades are separate targets here.
- **Azagra–Ferrera–López-Mesas–Rangel, arXiv v1:** `azagra2006 line 89–97`, Theorem 1, printed p. 2: separable Riemannian manifold, arbitrary positive continuous error and positive Lipschitz excess. Completeness is not imposed. For bounded input, choosing error bounded by1 keeps the approximation bounded, as needed for distance duality.
- **Toth–Ziller:** `tothziller line 62–83`, Introduction, printed p. 85, defines full eigenspace maps using an orthonormal harmonic basis up to homothety. This supports the distinction from arbitrary lists. It is not a pinpoint source for the complete Fischer proof; R8.1 supplies its own algebraic derivation and R03 adds its acceptance statement.
- **Kolář–Michor–Slovák:** `kms1993 line 5318,5332` (§12.2, printed pp. 117–118), 5638 (§12.16, p. 124), and 5687 (§12.17, p. 125) identify jets, composition and vector-bundle structure. §§1.5–1.6 and Lemma 3.3 concern local smooth factorization. These generic constructions belong to PDO.
- **Gilkey:** `gilkey2007 line 102–107`, §2 Lemma 2.1 and following paragraph, printed p. 289: unique connection/endomorphism decomposition and metric compatibility for a self-adjoint operator relative to the canonical density. Gilkey's E has the opposite sign to the roadmap's V. The local formula gives the weighted-circle test; no noncompact analytic theorem is inferred.

## Not verifiable

These seven texts and their locators/hypotheses are **not certified**. The scratch missing-reference ledger was completed; successful Milnor retrieval removed its obsolete failed lookup. The review is finished.

- **lee2018:** Source-service title search failed. The author's University of Washington book page and Springer DOI `10.1007/978-3-319-91755-9` supplied bibliographic/access information, not the textbook. This affects the seeded curvature/local-symmetry/jet citations and other broad Lee chapter references.
- **oneill1966:** DOI `10.1307/mmj/1028999604`, official Project Euclid landing page and explicit PDF endpoint were attempted. The latter returned an Incapsula access-error HTML body. Theorem 2, Corollary 1 and their printed pages remain uncertified; the error body is not evidence for the article.
- **wangnotes:** The cited xumin.net PDF failed DNS resolution. Chapters 5–6 could not be read.
- **taimanov1993:** Source-service DOI lookup reached a MathNet request that timed out. The three-simple-geodesic paper, pp. 565–590, was not read.
- **grayson1989:** The DOI/title resolution led to JSTOR's access page for the article, not readable legal full text. No paywall was bypassed.
- **angenent1988:** Source-service bibliographic lookup found no readable legal text of the zero-set paper, pp. 79–96.
- **white2005:** Source-service resolution reached the Annals publisher landing page for DOI `10.4007/annals.2005.161.1487`, but did not produce a readable article. The precise regularity criterion was not source-certified.

Locators refer to the versions read, not assumed published numbering. The R4.9 tests do not prove its singularity/compactness/minimax targets. Ownership coverage is limited to supplied readable open checkouts, main and board packages.

## Source issues

- **Misprint** in homma2003 at Example 8.2, display immediately after equation (8.1), printed page 27: the source says the Hodge operator repeats the codifferential-after-differential composition twice; it should be the sum of codifferential-after-differential and differential-after-codifferential; affects a stated result.
