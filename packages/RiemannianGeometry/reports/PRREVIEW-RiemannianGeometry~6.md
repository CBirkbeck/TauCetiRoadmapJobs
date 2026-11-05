# Review of RiemannianGeometry (pull request #1683 at ff13a77)

**Verdict:** needs changes

## R01 (P2) — Restore the existing owner of the smooth operator core

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md:24`, and R7A at 2091–2324: “R7A owns the shared smooth differential-operator, jet, symbol, formal-adjoint and Bochner-connection core”.

**Claim:** This repeats PseudodifferentialOperators P1.0's constructions and reverses its explicit supply contract. It also replaces this roadmap's existing deferral on main. These are generic finite-rank bundle operators, not new Riemannian variants.

**Witness:** `TauCetiRoadmap/PseudodifferentialOperators/README.md:376–492` owns jets, operators, symbols, adjoints and Bochner connections; lines 438 and 473 explicitly name RiemannianGeometry R7 as consumer. Main RiemannianGeometry lines 144–157 already import that core.

**Repair:** Delete the generic R7A construction targets and restore PseudodifferentialOperators P1.0 as their named supplier. Keep R7's geometric curvature identities and consequences. Remove the reverse P1.0 supply claim at lines 26–28 and update the supplier contracts and `Suggested.lean:30` accordingly. Preserve the separate downstream P7a quotient application. P1.0 precedes this roadmap in the merge order. Test the restored contract on ∂²: its double commutator with x is 2Id, and its geometric/Fourier symbols at ξ=2 are 4/−4. For the weighted-circle example the Bochner connection coefficient at x=0 is 1/2, so metric compatibility would require 0=1. P1.0 already includes these exact distinguishing tests. Main ComplexKahlerGeometry lines 570–577 and 984–986 also consume P1.0; there is no unowned gap to fill here.

## R02 (P2) — State the statable Synge headlines

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md:1091–1096`: “Prove Synge's compact connected even positive-dimensional oriented positive-sectional-curvature theorem”; “Include the odd-dimensional orientability consequence”. Neither appears in `Suggested.lean` or its unavailable-headline list.

**Claim:** These are substantive global conclusions of R4.6, and their carriers already exist at the pins. They are not prevented by the missing index-form carrier needed to prove them. Omitting them leaves an explicit end theorem outside the acceptance test.

**Witness:** `TauCeti/Geometry/Manifold/Orientation.lean:345` defines `TauCeti.Orientable`; `Mathlib/AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean:40` defines `SimplyConnectedSpace`. Scratch statements of both Synge conclusions elaborate with the native curvature tensor and no new definitions or options.

**Repair:** Add both headline statements on the standing smooth, boundaryless, compact connected positive-definite Riemannian carrier. In even positive dimension assume orientability and positive sectional curvature, and conclude simple connectivity. In odd dimension assume positive sectional curvature and conclude orientability. Express positivity on independent tangent pairs, retaining the Gram nondegeneracy. Add their names to the README. The scratch copy with the additional individual orientation-module import exited 0, adding only two sorry warnings. Controls: S² is orientable and simply connected; RP² has K=1 and π₁ of order 2 but is nonorientable, so the even statement must exclude it. RP³ is orientable with π₁ of order 2, so the odd conclusion is orientability, not simple connectivity. The compact flat torus is orientable with nontrivial π₁ and K=0, so strict curvature positivity remains essential.

## R03 (P3) — Delete the coordinate companion acceptance file

**Location:** `TauCetiRoadmap/RiemannianGeometry/ParaboloidTargets.lean:6–9`: “These real-coordinate targets illustrate its integral and crossing statements.”

**Claim:** The five definitions and three admitted coordinate statements are auxiliary illustrations after the actual geometric headlines were added to `Suggested.lean`. They do not belong in an acceptance-test Lean file. The definitions lack declaration docstrings, and the eight names are absent from the README.

**Witness:** `ParaboloidTargets.lean:55–62` assumes three equations on arbitrary real functions r and θ. `Suggested.lean:235,256` already states the native-geodesic crossing and exponential-pole headlines on the induced paraboloid metric.

**Repair:** Delete `ParaboloidTargets.lean`; delete this padding from the acceptance files rather than proving it in place. Keep the integral estimates and coordinate route in README R5a.3. Test preservation on a=1,R=2: the time and angle integrals are approximately 5.097894983 and 2.841188645, above their bounds 3 and 2log2. The false circular candidate r=1,θ=t has radial-equation residual −1 and is excluded by the retained native geodesic premise. This is a form/padding finding, not a claim that the companion's three statements are false.

## R04 (P3) — Complete claim-level locators and source tracking

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md:296`: “Lee, Chapter 7, curvature derivatives”; normal-coordinate expansions at 604–610; References at 2650. There is no `sources.toml`.

**Claim:** The seeded curvature, local-symmetry and jet targets still lack theorem/section-and-printed-page locators at their claims. O'Neill's theorem/corollary reference gives no pinpoint page. Adding KMS/Gilkey and Axler locators repairs those blocks, but does not locate these earlier claims or record the 19 cited works.

**Witness:** §2.2 gives quadratic and cubic metric coefficients without any source locator. §1.2 gives only a chapter; §1.3 names O'Neill Theorem 2 and Corollary 1 without their printed pages.

**Repair:** Add verified claim-level locators, and record each work once in the required source manifest with its version and legal-access status. Preserve inaccessible citations as uncertified where appropriate; do not invent theorem numbers or treat access pages as article text. The Milnor and Axler locators checked below can be retained. The jet test remains `(sin t/t)²=1−t²/3+O(t⁴)` in a transverse unit-sphere normal-coordinate direction, versus coefficient 1 in the radial-parallel orthonormal frame. The defect is the missing locator, not that coefficient.

## R05 (P3) — Give the radial-parallel frame its own API and Checks

**Location:** `TauCetiRoadmap/RiemannianGeometry/README.md:590–607`: “Build smooth orthonormal geodesic frames at a point, including their induced tensor frames. Pin their radial-parallel construction.”

**Claim:** This definition has useful mathematical prose, but no definition-specific API bullet list or three discriminating Checks. The two layer examples at 617–619 test the exponential derivative, not all the defining frame laws. The new Rop, A/T and defect Checks elsewhere do not complete this definition.

**Witness:** On the unit sphere at radius t=π/2, a transverse coordinate vector has norm 2/π, whereas its radial-parallel counterpart has norm 1. The flat example alone cannot distinguish these frames.

**Repair:** Keep the definition and expose its smoothness, orthonormality, radial parallelism and basepoint derivative laws as its API. Add three frame Checks: Euclidean transport keeps each eᵢ constant; spherical transverse transport has norm 1 while d exp(eᵢ) has norm 2/π at t=π/2; transporting initial vector 2eᵢ gives norm 2 and fails the orthonormal-frame condition. The latter two reject the coordinate-frame substitution and a wrong normalization. Keep the existing jet examples separately. No extra Lean declarations are needed.

## Verified sound

This full review has **five findings: two P2 and three P3; no P1**. The worktree was not edited. The numerical and model calculations below test the stated mathematics and conventions; they are not proofs of the analytic existence, compactness or minimax theorems.

### Previous findings checked against this head

All six findings from the review at 5020009 were checked before the full pass. No supplied repair disposition marks any of them “not actionable in this package”.

| Previous finding | Passage or evidence at ff13a77 | Disposition |
|---|---|---|
| R01 operator ownership | README 24–28 still says “R7A owns” the generic core and “P1.0 uses this core”. | Not repaired; R01 above. |
| R02 projective form duplication | README 37–40: “DGFloer Layer 1 item 7 owns the complex projective form comparison ω_g=π·ω_FS”. The construction target was deleted here. | Repaired. Main DGFloer 831 supplies it; CP¹ area π versus normalized integral 1, CP⁰ both forms 0. |
| R03 missing Fischer headline | README 2513–2520 names the new acceptance statements; Suggested 311 and 320 state the splitting and finite decomposition. | Repaired over both real and complex coefficients, on native polynomials. |
| R04 companion padding | Companion 6–9 still describes “real-coordinate targets” that “illustrate” the route. | Not repaired; R03 above. |
| R05 locators/manifest | R7A now has KMS/Gilkey locators; R8.1 has Axler Proposition 5.5 and Theorem 5.7, pp. 76–77. §1.2 remains chapter-only and §2.2 lacks a locator. | Partly repaired; R04 above. |
| R06 definition-specific Checks | README 371–437 adds separate Rop/horizontal/vertical/A/T tests; 1299–1322 gives nonzero geodesic-defect controls. | Partly repaired. The previously identified T≡0 and mixed-sign Rop defects are repaired; R05 identifies a remaining definition. |

### Gate, scope, elaboration and signatures

The worker's gate at this exact head reports every counter zero and **OK**, including targeted build, dependency check, outside-folder, stray-files, source-material, imports, sorry-data and set_option. The independent outside-folder diff is empty. No gate failure is being omitted.

Independent dependency-check output:

```text
depcheck: 204 roadmaps, 1598 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. This mechanical result does not resolve R01: the ownership contradiction is between the prose contracts, not a detected upward supplier edge.

Direct `lake env lean` elaboration of `TauCetiRoadmap/RiemannianGeometry/Suggested.lean`, from the prescribed worktree, exited 0 with **15 sorry warnings only**. Scratch copies of both Lean files also elaborated. Each of all **18 admitted theorems** was tried separately with one-tactic `simp`, `rfl` and `infer_instance`; none closed. Object-based inspection of the pinned declarations did not identify a single exact library lemma proving a kept headline. R03 is auxiliary padding by purpose and carrier, not by a successful simplifier probe.

A scratch `#check @name` was elaborated for every actual declaration: **19 in Suggested** (15 theorems, four definitions), and **eight in the companion** (three theorems, five definitions). The scanner's twentieth Suggested entry is the word “is” in the module docstring, not a declaration. The flagged lost boundaryless binder belongs to `IsJacobiFieldOn`: its actual body is the along-curve differential equation, and README 519–520 explicitly permits that definition independently of the later boundaryless theorem context. The relevant theorem signatures retain their manifold/metric, connectedness, dimension, compactness or completeness hypotheses. No signature was changed.

The Jacobi uniqueness theorem uses a genuine interval and matching covariant initial data; the endpoint-zero theorem has a<b. Einstein constancy uses n≥3 and connectedness. Bonnet–Myers retains positive curvature parameter and dimension; two-geodesic multiplicity retains compactness and positive dimension. The two-sphere theorem has an actual smooth diffeomorphism to the sphere. Both paraboloid headlines tie the metric to the graph's differential and use native geodesics/exponentials. Smooth distance duality retains second countability and intrinsic metric compatibility without introducing completeness. Fischer's finite index range prevents natural-subtraction junk terms and supports RCLike coefficients.

### Headline coverage

Fifteen statable headlines are represented by the following statements in `Suggested.lean`. The two additional Synge conclusions in R4.6 are missing (R02), despite being statable at the pins:

| Headline | Declaration and line |
|---|---|
| Constant sectional curvature determines the tensor | `constant_sectional_tensor_iff`, 58 |
| Schur | `schur`, 67 |
| Einstein-factor constancy | `einstein_factor_constant`, 78 |
| Jacobi interval uniqueness | `jacobi_eq_of_initial_data`, 105 |
| Jacobi initial-data existence | `exists_jacobi_initial_data`, 117 |
| No endpoint-zero Jacobi field in nonpositive curvature | `jacobi_eq_zero_of_nonpositive_curvature`, 130 |
| Cartan–Hadamard covering | `cartanHadamard_isCoveringMap`, 155 |
| Bonnet–Myers distance bound | `bonnetMyers_distance`, 165 |
| Two geodesics between distinct points of a closed manifold | `two_distinct_geodesics`, 176 |
| Three simple closed images on a smooth two-sphere | `three_simple_closed_geodesics`, 205 |
| Paraboloid transverse crossings | `paraboloid_geodesic_crossings`, 235 |
| Vertex is a pole | `paraboloid_vertex_pole`, 256 |
| Smooth-function distance duality | `riemannianDist_eq_sSup_smooth`, 286 |
| Fischer splitting | `fischer_split`, 311 |
| Iterated finite Fischer decomposition | `fischer_decomposition`, 320 |

The module docstring names the index/focal-index theorems, Gauss–Codazzi–Ricci and volume variations, Bochner vanishing and Takahashi as lacking the required index-form, immersion/pullback-connection, form-Laplacian/cohomology or spherical-Laplacian carriers. The generic Bochner-connection entry is also named there, but should become a supplier deferral under R01. The two Synge scratch signatures were also inspected with `#check @name`; compactness, connectedness, even/odd dimension, strict curvature positivity and the even-case orientability premise are present. The four retained definitions have real bodies on native carriers. There is no admitted data, free placeholder predicate, `set_option`, foreign-roadmap import or route-specific arithmetic shortcut.

### Pinned objects opened and compared

The library pins are Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. Paths below are within those pinned libraries, not newer online documentation.

| Pinned location | What was checked, including limitations |
|---|---|
| `Mathlib/Geometry/Manifold/Riemannian/Basic.lean:79` | `IsRiemannianManifold` identifies ambient edist with intrinsic Riemannian edist; it does not add connectedness or completeness. Those are explicit where used. |
| `Mathlib/Topology/MetricSpace/Lipschitz.lean:308` | `LipschitzOnWith.extend_real` supplies the real extension; the empty-set branch exists. R7 consumes it instead of planning another extension theorem. |
| `Mathlib/Topology/Compactness/CompactlyGeneratedSpace.lean:94` | `eq_compactlyGenerated` requires the compact-generation class; it is not an arbitrary-topology equality. |
| `Mathlib/MeasureTheory/Covering/Besicovitch.lean:455` | `exist_disjoint_covering_families` gives finitely many pairwise-disjoint closed-ball families and an open-ball cover, subject to its satellite bound. The finite extraction/cutoffs are separate roadmap work. |
| `Mathlib/MeasureTheory/Function/Jacobian.lean:645` | The zero-Jacobian image-measure result has the differentiability/measure hypotheses, not a claim that every continuous curve has zero area. |
| `Mathlib/RingTheory/MvPolynomial/Homogeneous.lean:46`; `Mathlib/Algebra/MvPolynomial/PDeriv.lean:61` | Homogeneity and genuine polynomial partial derivations exist over the native polynomial carrier. They support the new finite Fischer statements. |
| `TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Metric.lean:141,172` | Constant-curvature tensor predicate and metric specialization fix the sphere-positive convention. |
| `TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Sectional.lean:140,164,186,202` | Sectional predicates quantify over independent tangent vectors. The supplied tensor-to-sectional direction is not the full new iff; n<2 does not determine κ. |
| `TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Ricci.lean:101`; `Curvature/Scalar.lean:112` | Constant-curvature contractions already give (n−1)κg and n(n−1)κ. They remain supplied inputs. |
| `TauCeti/Geometry/Manifold/Riemannian/Geodesic/Basic.lean:97,113` | Native geodesics include the actual covariant-acceleration equation and within-set regularity. A bare speed/momentum pair is not the definition. |
| `TauCeti/Geometry/Manifold/Riemannian/Geodesic/Exponential.lean:92,98` | The exponential has a natural domain and totalizes outside it by the basepoint. The global theorems require the geometric hypotheses making the domain global. |
| `TauCeti/Geometry/Manifold/Riemannian/Induced.lean:92,124` | The induced metric uses the injective differential of an immersion; the graph metric is not arbitrary data. |
| `TauCeti/Geometry/Manifold/Riemannian/Homogeneous.lean:69–83` | The homogeneous completeness construction uses finite-dimensional/T3 and transitive isometry data. It is not a completeness result for arbitrary metrics. |
| `TauCeti/Geometry/Manifold/SmoothEmbedding/NormalSpace.lean:57,108` | The supplied normal fibre is a quotient with its quotient projection. The metric orthogonal representative is an additional comparison, not another quotient definition. |
| `TauCeti/Geometry/Manifold/TubularNeighborhood/Euclidean.lean:497` | The compact C² normal-tube result does not assert a uniform radius for every noncompact closed embedding. |
| `TauCeti/Geometry/Manifold/Orientation.lean:345`; `Mathlib/AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean:40` | Native orientability is existence of a compatible positively oriented atlas, not a condition on every chart of the installed atlas. Native simple connectivity is available; both support R02. |
| `TauCeti/Geometry/Manifold/Morse/Index.lean:74` | The native chart-Hessian index is not already the path index form or the focal index theorem. |

Object searches covered curvature/contractions, transport, Jacobi/index/focal structures, induced metrics and normal spaces, differential operators/jets/Bochner connections, smoothing and harmonic polynomials. No existing scalar Fischer splitting or complete kept geometric headline was found under a different library name. Searches also checked the actual fully qualified roadmap names rather than merely similar theorem titles.

### Supplier and ownership audit

All `*Needs:*` lines and supplier prose were read. Resolution used main for existing roadmaps and the supplied open head for new folders, including the tool's object searches and direct file reads. Searches also included the board packages and supplied sibling work. The following are the resolved contracts; line references give reproducible entry points, not just remembered section names.

| Supplier and repository-relative location | Resolved input / boundary |
|---|---|
| `Completed/HopfRinow/README.md:229–530` | Layers 0–4: distance, Levi-Civita/along-curve derivatives, spray/exponential, normal balls, completeness. R2 extends the native carrier. |
| `TauCetiRoadmap/DifferentialGeometry/README.md:535–766,998–1013` | Forms/flows/integration plus §5.6 AC-curve, index and Green comparisons; canonical geometric objects remain here. |
| `TauCetiRoadmap/SmoothBundlesConnections/README.md:1115–1304,1306–1420` | B5.1 owns the full transport inverse dictionary; B5.2 the stated countability theorem; B6.0 the compact-set uniform radii. B1.4–B4 supply quotient, tensor and connection constructions. |
| `TauCetiRoadmap/GeometricTopology/README.md:214–224,641–670,930–946` | Normal/tubular bundles, intrinsic curvature/volume, smooth triangulation. R5a's metric quotient comparison and R3's finite marked refinement are additional adapters. |
| `TauCetiRoadmap/ComplexKahlerGeometry/README.md:570–577,907–926,984–1045,1407–1439` | K5a's early density versus later analytic/Hodge scale; K7.1 projective carrier. Its P1.0 imports corroborate R01. |
| `TauCetiRoadmap/PseudodifferentialOperators/README.md:376–492` | New open folder, earlier in order: P1.0 already owns all generic R7A objects. R7 supplies subsequent geometric identities; P7a is a different downstream application. |
| `TauCetiRoadmap/PDE/README.md`, A.1–6/D16–19/E20–22 | Scalar Sobolev, trace and elliptic inputs; no claim that interior regularity supplies the normal-Jacobi boundary H² domain. |
| `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:512–619,871–877` | §4.7 UO-D06 owns closed semibounded forms and represented self-adjoint operators. |
| `TauCetiRoadmap/VariationalMethods/README.md:494–538,839–910` | §§2.3,5.1–5.2 consume UO-D06 and specialize its energy/compact-pair theory. The repaired direction is retained. |
| `TauCetiRoadmap/GeneralizedCohomology/README.md:1082,2608–2614`; `TopologicalKTheory/README.md:1083–1111` | G4.0b supplies early quaternionic smooth carriers, with no reverse R1 premise; T6.6 supplies its later homogeneous comparison. |
| `TauCetiRoadmap/CharacteristicClasses/README.md:552` and C1.5/C2/C3; `AlgebraicTopology/README.md`, Stage 6 | Disk/sphere bundle cells, finite projective cup/Thom and singular cup/cap/small-chain APIs. The curve-space cover cocycle/localization is additional work here. |
| `Completed/ConformalMapping/README.md:102–146`; `TauCetiRoadmap/GeometricMeasureTheory/README.md:106–147,183–305`; `Isoperimetry/README.md:182–222,397–413` | Riemann/Jordan correspondence, rectifiable/BV/Gauss–Green floor and Euclidean Jordan inequality. Spherical applications remain explicit targets. |
| `TauCetiRoadmap/SpinGeometry/README.md:155–169,316–336,389–394` | Early wedge/contraction and exterior-connection symbols. No later Dirac/index theorem is used as an earlier input. |
| `TauCetiRoadmap/AlgebraicTopology/README.md:1949–1993`; `Completed/UniversalCovers/README.md:63–152` | AT8.11a actually supplies mapping/loop CW type, fixed-interval/Kelley and interval-product relative comparisons; cover/lift inputs also resolve. |
| `TauCetiRoadmap/DGFloer/README.md:258–300,442,825–835` | Moore-path comparison, Layer 1 item 2 Hopf/weak-equivalence input, item 7 projective form comparison. The last now appears only as a deferral here. |
| `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:233–299`; `ClassicalGroups/README.md:237–271,297–309`; `CompactGroups/README.md:205–270` | Lie/Ad/closed-subgroup, orthogonal highest-weight and compact-representation inputs. R8 constructs the particular harmonic representation. |
| `TauCetiRoadmap/MorseTheory/README.md:90–429,611–681`; `HeegaardFloer/README.md`, Lane M | Ordinary Morse, handle/Morse–Bott and trajectory theory. The complete-manifold finite-vertex carrier and sphere path calculations remain R3 targets. |
| `TauCetiRoadmap/Yamabe/README.md:308–335` | Y9 item 3 supplies the complete Obata radial-rigidity theorem separately from the scalar Bochner estimate. |
| `TauCetiRoadmap/AffineMorseLefschetz/README.md`; `RicciFlow/README.md`, scope/consumer passages | Downstream complex focal and Ricci-flow applications, not suppliers of their earlier real geometry. |

No declared supplier gaps exist. Apart from R01, the inspected inputs have owners and the stated section-level order is consistent. In particular the abstract form arrow is UO → VM → geometric boundary specialization. The review does not replace main with a proposed revision when main already owns an object. Open PositiveMass's spinorial/monogenic Fischer construction has different carriers and operators from scalar harmonic polynomials; it does not duplicate R8's Δ-kernel splitting. Open-work searches are limited to the supplied readable checkouts and tool index, not imagined unpublished work. No duplicate fully qualified acceptance declaration was found.

### Computed adversarial pass

Here Δ⁺ is the nonnegative geometric Laplacian; Δ_poly is the sum of second polynomial derivatives. Sphere radii are 1 unless specified. “Retain” means the tested instance agrees with the written hypotheses and conclusion, not that the general theorem has been proved. The 161 rows cover the sampled targets, all acceptance statements, the missing Synge headlines, conventions, definition APIs and the other target families. Algebraic-characteristic/DVR tests do not apply to the real smooth-manifold scope; zero dimensions, zero fibres, empty domains and total-function endpoints do.

| Statement / target | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| R1 curvature sign and tensor slots | Orthonormal e₁,e₂ on S² | R(e₁,e₂)e₂=e₁; sectional numerator=1, denominator=1, K=1 | Retain positive-sphere convention. |
| R1 skew and pair symmetries | Same plane; interchange e₁,e₂ | R₂₁e₂=−e₁; paired scalar changes from 1 to −1 under one skew interchange | Retain; no new carrier. |
| R1 first Bianchi | Constant κ tensor, e₁,e₂,e₃ | Each term with three distinct orthogonal vectors is 0; repeated-vector terms e₁ and −e₁ cancel | Cyclic sum=0. |
| R1 matrix curvature / noncommutative convention | A=e₁₂ dx+e₂₁ dy on trivial rank two | dA=0; A∧A=diag(1,−1)dx∧dy, not 0 | Retain column convention and matrix product. |
| R1 covariant exterior square / second Bianchi | Same connection | (d_∇)²s=Fs; d∇F is a 3-form and equals 0 in dimension two | Reject commuting-matrix replacement. |
| R1 Ricci identity / torsion correction | Flat connection, coordinate fields; torsionful comparison | T=0 gives skew Hessian=0=R; for T≠0 the formula includes −∇_T s | Keep the explicit torsion correction. |
| Constant sectional tensor iff | n=0,1 and n=2, κ=1 | n<2: both the algebraic κ tensor and actual tensor are 0, plane tests empty; n=2: R₁₂e₂=e₁ both ways | Iff retained; no unique κ in small dimensions. |
| Curvature contractions | Unit S³ and n=1 | Ric=2g, Scal=6; in n=1 both 0=(n−1)κg and 0=n(n−1)κ | Existing pinned contractions imported. |
| Schur | Connected S³; disconnected radii 1 and 2 | K=1 everywhere on first component, 1/4 on second; unequal across components | Connectedness excludes the counterexample. |
| Einstein-factor constancy | S³ radii 1,2; warped surface f=e^(x²) | a=2,1/2; in dimension two a=K=−2−4x² | n≥3 and connectedness retained. |
| Local symmetry | Flat, sphere, warped surface | ∇R=0,0; warped ∂ₓK at 1=−8 | Nonflat sphere passes; warped surface fails. |
| Transport curvature characterization | Sphere versus warped surface | Parallel orthonormal planes keep K=1; warped K at x=0,1 is −2,−6 | Tests preservation in both directions. |
| Flat local Euclidean models | Euclidean space and flat cylinder | R=0 in each; cylinder circumference 2π prevents a single global Euclidean chart | Local quantifier retained. |
| Constant metric rescaling | g↦4g on S² | K↦1/4; lengths multiply by 2; connection unchanged | Retain scale factors. |
| Conformal curvature | Euclidean base, u=x in dimensions 2 and 3 | n=2: K=−e^(−2x)Δu=0; n=3: Ric=diag(0,−1,−1), Scal=−2e^(−2x) | Dimension dependence retained. |
| Curvature operator | S²×H², oriented factor/mixed bivectors | Eigenvalues 1,−1,0; constant curvature gives κId | New mixed-sign Check repairs old R06 part. |
| Invariant metric and Koszul / SU(2) | [e₁,e₂]=2e₃ cyclically | ∇₁e₂=e₃; −¼[[e₁,e₂],e₂]=e₁; K=1 | Nonabelian normalization checked. |
| Horizontal/vertical projections | Identity submersion, map to point, projection plane→line | (h,v)=(Id,0),(0,Id), and ((a,0),(0,b)); h²=h,v²=v,hv=0 | Wrong swapped projections rejected. |
| O'Neill A | Product and round Hopf submersion | Product A=0; Hopf horizontal pair has ‖A‖²=1; K_base=1+3=4 | Retain; source access limited below. |
| O'Neill T | Warped dx²+e^(2x)dy² and dx²+e^(4x)dy² | Unit-vertical T_UU=−∂ₓ and −2∂ₓ; norms 1 and 2, versus product 0 | Repairs zero-T ambiguity. |
| Projective homogeneous metric | Horizontal versus vertical tangent blocks | Chosen trace metric gives horizontal norm²1 and vertical norm²1/2 | Distinguishes Hopf quotient from indiscriminate trace normalization. |
| Projective curvature/period | CP¹, HP¹ and point | K=4, primitive length π; dimension-zero has no unit-speed closed orbit | Retain positive-dimension qualification. |
| Projective form deferral | CP¹, CP⁰ | Metric area π versus normalized integral 1; both two-forms 0 on point | Prior R02 repaired; DGFloer owns comparison. |
| Along-curve derivative / transport dictionary | ∇=d+a dx on a line | Pₓᵧ=e^(−a(y−x)); derivative of a section is s′+as | Existing transport reconstruction cited. |
| Jacobi-field definition | Flat γ, J=u+tv and J=t²E | J″+R(J,T)T=0 and 2E respectively | Real-body predicate rejects the wrong field. |
| Jacobi existence | Flat data (u,v), constant γ allowed | J(0)=u, DJ(0)=v; solution u+tv, dimension 2n; n=0 zero field only | Suggested 117 agrees. |
| Jacobi interval uniqueness | Difference data (0,0) | Flat difference u+tv has u=v=0; sphere A cos t+B sin t also A=B=0 | Suggested 105 retains both data. |
| Jacobi variation realization | Flat γ=t e₁, varying initial velocity e₁+s e₂ | ∂ₛγₛ=t e₂; derivative data (0,e₂), residual 0 | Milnor compact-segment statement checked. |
| Jacobi model solutions | K=1,0,−1; normal initial derivative 1 | sin t, t, sinh t; J″+KJ=0 in all three | Sign agrees with curvature. |
| Jacobi Wronskian | J=sin t, H=cos t | JH′−J′H=−sin²t−cos²t=−1 | Constant; swapping fields gives +1. |
| Exponential derivative | Sphere normal initial variation | d exp_(tT)(tY)=sin(t)P(Y); squared norm sin²t | Matches stated convention. |
| Endpoint-zero Jacobi theorem | Flat/hyperbolic [0,L], L>0 | J=tv or sinh(t)v, value at L forces v=0; sphere L=π has sin(t)E≠0 | Curvature≤0 excludes spherical counterexample. |
| Radial-parallel frame | Euclidean frame; sphere t=π/2 | Transported norm 1 in both; transverse coordinate vector norm 2/π | R05 adds frame-local Checks. |
| Frame normalization | Transport eᵢ versus 2eᵢ | Norms 1 versus 2; Gram entries δᵢⱼ versus 4δᵢⱼ | Reject rescaled wrong frame. |
| Normal-coordinate quadratic jet | Sphere / hyperbolic transverse direction | (sin t/t)²=1−t²/3+…; (sinh t/t)²=1+t²/3+… | R04 adds missing source locator. |
| Normal-coordinate cubic jet | Locally symmetric sphere | ∇R=0 and cubic coefficient 0; quartic coefficient 2/45 | −1/6 term vanishes as required. |
| Uniform jet remainder | Sphere, unit transverse vector | After 1−t²/3 remainder is (2/45)t⁴+O(t⁶) | Actual O(t⁴) bound locally; not an equality of frames. |
| Index form / second energy variation | Flat unit interval, V=sin(πt)E | I(V,V)=π²/2; negative curvature adds a nonnegative term | Positive sign retained. |
| Conjugacy versus index/nullity | Sphere, interval L=π or 3π/2 | I(sin(πt/L)E)=0 or −5π/12; indices 0 or n−1, endpoint nullity n−1 or 0 | Interior/endpoint distinction retained. |
| H¹ path energy | γ=t and γ=t² on [0,1] | Length 1 in both; E=1/2 and 2/3; L²≤2E gives 1≤1 and 1≤4/3 | Speed affects energy, not length. |
| H¹ norm / weak derivative | Scalar t on [0,1] | ∫t²+∫1=1/3+1=4/3 | Genuine derivative control. |
| Speed topology versus uniform topology | Triangular oscillations height 1/(2n), slopes ±1 | Uniform norm→0; speed integral=1, energy=1/2 | Uniform convergence does not supply speed convergence. |
| Broken-geodesic energy | Vertices 0,1/2,1 with two half-intervals | E=½[(1/2)²/(1/2)+(1/2)²/(1/2)]=1/2 | Equals unbroken linear energy. |
| Shortening / refinement | Vertices 0,1,0 versus endpoints 0,0 | Fine energy 2; shortened energy 0 | Nonincrease and fixed endpoint laws discriminate. |
| Marked-point refinement | Insert marked midpoint 1/2 into [0,1] | Two edge lengths sum 1; energy stays 1/2 | Additional finite adapter, not new triangulation. |
| Finite-sublevel admissibility | Constant path and antipodal sphere edge | Constant energy 0; antipodal distance π violates a normal-radius<π condition | No global unique-log assumption. |
| Round-sphere path indices | S³ endpoints angle π/2 | Critical lengths π/2,3π/2,5π/2; indices 0,2,4 | Matches conjugate-point counts. |
| Low-dimensional path components | S¹ and S² | S¹ windings k∈ℤ, each based component contractible; Hⱼ(ΩS²;ℤ)=ℤ for every j≥0 | Avoids applying n≥3 cell pattern to S¹. |
| Hopf map / chart clutching | z=(1/√2,i/√2); equatorial overlap | h(z)=(0,1,0); transition e^(−iθ) has degree −1 | Sign fixed, not an unmarked isomorphism. |
| Antipodal Morse–Bott bundle | S³, first nonminimal antipodal family | Index 4, nullity 2; negative bundle 2TS² has rank 4 and positive orientation determinant | Bundle, not only dimension, checked. |
| Suspension normalization / Freudenthal | Sphere dimensions 2,3 | Degree correction (−1)^(n+1)=−1,+1; n=3 isomorphism through q=2 and surjection q=3 | Keep reflection correction and endpoint range. |
| Rauch model comparison | t=π/2, curvature 1,0,−1 | Normal Jacobi norms 1,π/2,sinh(π/2) | Ordered 1<1.5708<2.3013 before conjugacy. |
| Hessian comparison | Radius π/4 in sphere and Euclidean plane | Transverse Hess distance cot(π/4)=1 versus 4/π | Positive cotangent sign. |
| Riccati equation | S² at r=π/2 | h=0,h′=−1,Ric=1; h′+h²+Ric=0 | Trace signs consistent. |
| Bishop–Gromov ratio | Euclidean plane / S² at r=π/2 | Euclidean ratio 1; spherical volume 2π, Euclidean π³/4, ratio 8/π² | Smaller spherical volume, not inverse ratio. |
| Rays and compactness | ℝ from 0; compact sphere | d(γ(s),γ(t))=t−s on line; sphere distances≤π prevent a ray | Noncompactness premise retained. |
| Local isometry versus covering | Punctured line mapping to S¹ | Local derivative norm 1 and surjective image, but missing lift through removed point | Completeness retained for global covering theorem. |
| Cartan–Hadamard | Euclidean space and flat cylinder | exp(v)=p+v is bijective on ℝⁿ; cylinder exponential has deck translations 2πk | Covering theorem is correctly weaker than injectivity. |
| Bonnet–Myers | S³ radii 1 and 2 | Ric factors 2 and 1/2; bounds π and 2π equal diameters | Positive bound and dimension retained. |
| Injectivity radius | Sphere, circle, Euclidean space | π,π,∞ | Cut/conjugate alternatives not conflated. |
| Synge even-dimensional theorem (missing) | S², RP², flat T² | S²: orientable, π₁=1; RP²: nonorientable, π₁=ℤ/2, K=1; T²: orientable, π₁=ℤ², K=0 | R02 adds headline with both necessary restrictions. |
| Synge odd-dimensional consequence (missing) | RP³ and S¹ | RP³ orientable, π₁=ℤ/2; S¹ orientable, π₁=ℤ with empty sectional-plane test | R02 adds orientability, not simple connectivity. |
| Space forms / projective low ranks | RP⁰, RP¹, RP², RP³ | Fundamental groups 1,ℤ,ℤ/2,ℤ/2; orientability yes,yes,no,yes | Low-dimensional exceptions retained. |
| Two fixed-interval geodesics | S¹ from angle 0 to π/2 | Angles πt/2 and −3πt/2; midpoint separation π | Distinct images as maps; ℝ uniqueness excluded by compactness. |
| Three simple closed images | Round S² coordinate great circles | Period 2π, each image distinct; double traversal period 4π is not injective modulo that period | Primitive/simple condition retained. |
| Curve space V / point locus | Latitude radius r collapsing to pole | Length 2πsin r→0, Fréchet distance r→0; point length 0 | Length component detects collapse, reversal identified. |
| Complement-side double cover | Equator and point curve | Side areas (2π,2π) and (0,4π); exchanging sides twice is identity | Nontrivial sheet choice survives point limit. |
| Relative Thom/cap classes | Tautological disk bundle over RP² | Fibre Thom evaluation 1; top u² pairing 1 mod2; u³ on base 0 | Degree and relative/absolute roles retained. |
| Widths / scaling | Round metric and 4g | Three round widths 2π; rescaled widths 4π; zero chain has width 0 and class 0 | Nonzero class requirement matters. |
| Geodesic defect | Great circle; latitude r=π/6, arc parameter π/8 | Great defect 0; latitude arc .392699082, chord-distance .385057876, defect .007641206 | New nonzero Check rejects identically zero defect. |
| Defect scale law | Multiply metric by 4 | Both arc and distance double; defect .015282412 | Linear in length scale. |
| Primitive annular limit | Embedded loop in annulus | Essential winding ±1; winding 2 cannot be embedded | Excludes iterated geodesic limit. |
| Round CSF area identity | Latitude r=π/3 | A=π,A′=−π=A−2π; r′=−1/√3 | Correct signed inward evolution. |
| CSF length identity | Same latitude | L=π√3,L′=−π/√3=−∫k² | Dissipation sign retained. |
| Round extinction/bisection | Same latitude; equator | T=−log cos(π/3)=log2; equator k=0, T=∞ | Zero-area Jordan extension keeps bisection criterion. |
| Annular barrier area | Two round evolving boundary components | A_ann′=A_ann, since the two ±2π contributions cancel | No disk formula on an annulus. |
| Circular chord–arc function | Euclidean circle radius r, shorter angle θ≤π | Chord=2r sin(θ/2)=ψ_CA; ratio 1 | Distinguishes chord from arclength. |
| Leafable graph windows | Latitude u≠0 near y on g | cos d=cos u cos s; spatial radius C permits smaller abs(s) than C | Full projection-window coverage is necessary; repaired margins retain it. |
| Buffered window inclusion | C_space=.4,C_glue=.3,R_evol=.05 | cos(.05)cos(.3)≈.95414 > cos(.4)≈.92106 | Gluing cylinder lies inside spacing ball. |
| Linear parabolic model | u=sin(2πs)e^(−4π²t) | u_t=u_ss=−4π²u | Principal evolution sign checked. |
| Zero-number alternatives | sin(2πs), positive constant, zero solution | Periodic zero counts 2,0,identically zero | Identically-zero branch not assigned a finite simple count. |
| Harnack positive solution | u=1 | Earlier supremum=1=later infimum | Positivity essential; sign-changing sine excluded. |
| Dirichlet spectral gap | Round segment length π/2 | First −∂² eigenvalue 4, curvature correction 1, gap 3 | Nonconjugate/short-segment assumptions retained. |
| Gaussian density / monotonicity | Static line through center | Density 1; shrinker residual and ambient/cutoff errors 0 in flat uncut setting | Reference density is one sheet. |
| Nonflat shrinker control | Shrinking circle r²=2(T−t) | Density √(2π/e)>1; (T−t)k²=1/2 | Distinguishes line tangent from circular tangent. |
| Local mass consequence | Chord–arc lower bound d≥βl | Ball intersection lies in intrinsic arc of total length≤4R/β | Linear mass bound, not derivative estimates alone. |
| Curvature total-variation budget | Euclidean circle; round latitude | No sign-changing zeros; V′=0 in plane and ∫K abs(k) in sphere | Cubic terms cancel in total variation. |
| Shrinker first integral | k+a⟨X,N⟩=0 | dₛ(k e^(−a abs(X)²/2))=e^(−a abs(X)²/2)(k′−ak⟨X,T⟩)=0 | Exponential sign retained. |
| Type-II chord–arc exclusion | Grim reaper ends at equal large height | Ambient separation stays bounded while connecting arclength→∞; ratio→0 | Cannot satisfy the positive chord–arc lower bound. |
| Curvature energy evolution | Euclidean circle radius r | E₀=2π/r,E₁=0,E₀′=2π/r³=∫k⁴ | Correct quartic coefficient and sign. |
| Fermi graph flow | Sphere G(r)=cos r, graph u constant | Q=cos u sin u; u_t=tan u=k; first linear term u | Checks metric factor and velocity sign. |
| Current tests / orientation | Equator, α=x dy | Integral π; reversed orientation −π; latitude integral πsin²r→0 | Detects signed current, collapses at point. |
| Length-cutoff clock | χ=0 below cutoff, χ=1 above | Physical time t(τ)=0 or τ respectively | Fixes point/low-length locus. |
| Stopping / weighted times | Entry times 1 and 3, weight 1/2 | Weighted time 2≥first entry 1, although 2<3 | Uses post-entry confinement, not a false maximum inequality. |
| Intrinsic cap comparison | Safe cap endpoints b₀=1,b₁=3, weight 1/2 | Interpolated cap 2≤max(1,3)=3; whole safe interval required | Choice comparison is on the same input/flow. |
| Relative prism / point fixation | Constant curve family at a point | Homotopy constant, length 0, relative chain class 0 | No introduced side section or point motion. |
| Cap localization at equal width | Finite union of smooth geodesic images | Surface area 0, versus area(S²)>0 | Finitely many images cannot meet every point. |
| Normal quotient comparison | Line in ℝ² and identity embedding | [(a,b)]↦(0,b); identity embedding normal fibre 0 | Metric adapter distinct from quotient construction. |
| Second fundamental form / shape | Plane, outward unit sphere | B=0; B(X,Y)=−g(X,Y)ν, S_ν=−Id | Sign pinned by actual normal. |
| Mean curvature normalization | Cylinder S¹×ℝ in ℝ³ | Principal curvatures −1,0; averaged H=−ν/2 | Distinguishes trace from mean. |
| Normal connection metric law | Rotating normal frame n₁′=n₂,n₂′=−n₁ | Derivative ⟨n₁,n₂⟩=0; connection pairings 1−1=0 | Preserves metric, not zero coefficients. |
| Gauss equation | Unit sphere in Euclidean space | Ambient R=0; B contribution 1; intrinsic sectional K=1 | Curvature sign consistent. |
| Codazzi flat test | Plane and round sphere | ∇B=0 in both; normal ambient curvature term 0 | Identity gives 0=0 with different B values. |
| Ricci normal equation | Shape matrices diag(1,−1) and off-diagonal ones | Commutator sends e₁ to −2e₂; pairing −2 | Noncommuting shape operators must remain. |
| Volume Jacobian | Homothety by 1+t in dimension m | J=(1+t)^m,J′(0)=m,J″(0)=m(m−1); m=0 gives J=1 | Rank-zero behavior retained. |
| First variation / position Laplacian | Sphere outward normal variation | Volume derivative mVol; Δ⁺f=mf=−mH | Averaged-H convention coherent. |
| Cone minimality | Cone over equator | Link H=0, cone H=0, cone is a Euclidean plane away from vertex | Vertex excluded from regular cone carrier. |
| Stereographic model | Coordinate origin | g=4Id, Γ=0, K=1 | Metric coefficient 4 does not mean curvature 4. |
| Helicoid model | Pitch 1, transverse coordinate 0 | H=0,K=−1 | Nonflat minimal example. |
| Paraboloid graph definition | x=0 and x=(1,0) | Graph=(0,0,0),(1,0,1); induced metric at (1,0) has diag(5,1) | Real body fixes graph and metric. |
| Paraboloid curvature | Radius 0 and 1 | K=4 and 4/25; mean-curvature magnitude 2 and 6/(5√5) | Positive, nonconstant curvature. |
| Companion integrands / endpoint | a=s=1; s>1 | Totalized quotient value 0 at endpoint; substitution s=√(1+u²) gives smooth time integrand √(5+4u²) | Single junk value does not affect integral; R03. |
| Companion lower estimates | a=1,R=2 | T≈5.097894983≥3; A≈2.841188645≥2log2≈1.386294361 | R03 deletes Lean padding, retains README estimate. |
| Companion strict monotonicity/limits | R=1 and R→∞, a=1 | T(1)=A(1)=0; transformed integrands>0; lower bounds R²−1 and 2logR→∞ | a>0 is necessary for angular divergence. |
| Native geodesic versus spurious circle | r=1,θ=t | Momentum=1,speed²=1, radial residual=−1 | Native geodesic hypothesis rejects it. |
| Paraboloid first crossing | a=1, A(R)=π | R≈2.275594330,T≈6.467619284; polar determinant .074453259, Cartesian .169425414 | Same point at ±T, transverse tangents. |
| Paraboloid successive crossings | A(R)=2π,3π | R≈10.289814508,49.358898184; T≈109.142120802,2441.526520415; polar determinants .000912441,.000008314 | Increasing radii/times; nonzero determinants. |
| Paraboloid vertex pole | Radial arclength ℓ(r) | ℓ′=√(1+4r²)>0,ℓ(0)=0,ℓ→∞ | Unique radial inverse, no angular ambiguity at origin. |
| Vertex Jacobi comparison | Radius 1 along a meridian | r″=−4/25 and Kr=4/25; sum 0; r stays positive for ℓ>0 | Positive curvature need not force vertex conjugacy. |
| Normal second variation | Flat minimal plane; equator Sᵐ⊂Sᵐ⁺¹ | Plane Q=∫‖∇V‖²≥0; constant unit normal on equator Q=−mVol | Ambient Ricci term retained. |
| Hypersurface scalar identity | Equator Sᵐ⊂Sᵐ⁺¹ | m(m−1)=m(m+1)−2m, B=0 | Trace convention checked. |
| Focal normal derivative | Unit circle, inward normal, t=.5,1,2 | Tangent factors 1−t=.5,0,−1 | Focal exactly at t=1. |
| Squared-distance Hessian/index | Same normal endpoints | Hess 2(1−t)=1,0,−2; index/nullity (0,0),(0,1),(1,0) | Degenerate endpoint handled separately. |
| Mixed-boundary focal index form | Affine test along normal length b=.5,1,2 | I=1/b−1=1,0,−.5 | Initial shape boundary term has negative sign. |
| Properness for nearest-point theory | Open unit disk, exterior point (2,0) | Infimum distance 1 is not attained | Closed/proper hypotheses cannot be dropped. |
| Finite jets | Functions x² and 0 at 0 | Same 0/1 jets; second derivatives 2 and 0 | R01: use PDO owner. |
| Differential order / commutators | ∂² and multiplication by 3 | [[∂²,x],x]=2Id, third commutator 0; [3,x]=0 though operator≠0 | R01: nonzero order-zero case. |
| Matrix-symbol commutators | e₁₂,e₂₁ | Commutator diag(1,−1)≠0 | No order drop without commuting symbols. |
| Principal-symbol conventions | ∂², ξ=2 | σ_geom=4,σ_F=−4; −∂² reverses signs | R01: same PDO convention. |
| Density transpose / adjoint | x∂ with dx; multiplication by i | (x∂)*1=−1; bilinear transpose of i is i, Hermitian adjoint −i | Distinguishes transpose and adjoint. |
| Rough Laplacian energy | Flat circle modes k=0,1,2 | Eigenvalues k²=0,1,4; integrated gradient energy gives same values times norm² | Generic operator belongs to PDO. |
| Negative trace requires metric connection | Real line ∇=d+dx, constant section | Negative trace −(∂+1)²1=−1; ∇*∇1=1 | Nonmetric counterexample excluded. |
| Bochner density normalization | −∂²−cos x∂ | a=cos x/2,V=a′+a²; at 0: a=1/2,V=1/4 | R01; arbitrary density does not imply metric connection. |
| Metric compatibility of that connection | Unit constant section at x=0 | Derivative norm²=0; sum of connection pairings=1 | False 0=1 rejected. |
| Laplace-type scaling / Dirac square | −∂²,−2∂²,−∂⁴ | Fourier symbols at 2: 4,8,−16; last has order 4 | Positive second-order scale and order retained. |
| Scalar Bochner | Flat f=x² at x=0 | Δ⁺‖df‖²=−8,2‖Hess f‖²=8; remaining terms 0 | Identity sums to 0. |
| Lichnerowicz equality | Unit Sⁿ coordinate function | λ=n=nκ, Hess f=−fg, Ric=(n−1)g | n≥2; Obata rigidity remains supplied separately. |
| Exterior number/pair operators | e¹∧e²; degree 0 | Number operator 2, pair operator 1; both 0 on scalars | Ordered-pair factors checked. |
| Weitzenböck curvature term | Constant κ, degree p | ℛ_p=κp(n−p); p=1 gives (n−1)κ, p=n gives 0 | Correct top-degree exception. |
| Curvature-operator lower bound | Rop=κId | Potential bound is equality κp(n−p) on unit forms | No missing factor 2. |
| Section norm / Kato | Flat φ=x off 0 | abs(d abs(φ))=1=abs(∇φ); Δ⁺abs(φ)²=−2 and 2abs(∇φ)²=2 | At zero use weak/a.e. law, not classical derivative. |
| Bochner vanishing / Betti bound | Sphere and flat torus | Positive intermediate potential gives harmonic dimension 0; flat torus dimension binomial(n,p) | Positivity and nonnegativity distinguished. |
| Smooth distance duality | Interval x=.25,y=.75; point | f(t)=t gives .5=distance; diagonal supremum {0}=0 | No completeness hypothesis needed. |
| Bounded smooth dual functions | ℝ, points 0 and 2 | Smooth bounded 1-Lipschitz truncations approach difference 2, never exceed 2 | Supremum, not mandatory attainment. |
| Clifford commutator norm | f=2x on nonzero Clifford module | ‖[D,f]‖=‖c(df)‖=2; zero module would give 0 | Nonzero fibre qualification retained. |
| Polynomial Laplacian / squared radius | n=3,r²=ΣXᵢ²; h=X₁²−X₂² | Δ_poly r²=6; Δ_poly h=0 | Four real-body definitions support true headlines. |
| Fischer product coefficient | n=3,h=1 or X₁,k=1 | Δ(r²)=6; Δ(r²X₁)=10X₁; coefficient 2k(2l+n+2k−2) gives 6,10 | Normalization agrees. |
| Fischer unique split | n=3,p=r² or X₁²−X₂² | (q,h)=(1,0) or (0,p), respectively | New Suggested 311 passes distinct positive/negative controls. |
| Complex Fischer split | n=3,p=i r² | Δp=6i; q=i,h=0 | RCLike scope includes complex coefficients. |
| Squared radius is a polynomial | Complex vector (1,i) | Σzᵢ²=0 whereas Hermitian norm²=2 | Rejects using complex norm square in polynomial ring. |
| Finite decomposition | p=r⁴,n=3,d=4 | h₀=1 at k=2, other harmonic terms 0; Δr⁴=20r² | Correct finite range and iteration. |
| Decomposition boundary degrees | p=1,d=0; p=X₁,d=1 | Only k=0, h=p; no negative-degree term | Native subtraction junk cannot enter range. |
| Dimension hypotheses | n=0, degree-two zero polynomial | r²=0, every constant q maps to same zero product | n≥2 excludes nonunique zero-variable splitting. |
| Harmonic dimensions | n=3,d=0,1,2 | dimP=1,3,6; dimH=1,3,5; radial dimensions 0,0,1 | Negative-degree summands treated as zero. |
| Sphere eigenvalues | S²,d=0,1,2 | λ=d(d+1)=0,2,6 | Consistent with Δ⁺ sign. |
| Spectral completeness / orthogonality | S¹ Fourier modes | ∫e^(ikθ)e^(−ilθ)=2π if k=l, 0 otherwise | Constants alone miss all nonzero modes. |
| Highest weights / low rank | SO(2), degree d≥1 | Harmonics span weights +d and −d, dimension 2; d=0 dimension 1 | Not a single irreducible weight in low rank. |
| Full eigenspace normalization | S² degree-one orthonormal basis | Σfᵢ²=3/(4π),Σdfᵢ²=3g/(4π) | Full basis plus common scaling needed. |
| Takahashi radius | S² degree two, λ=6 | Unit-target pullback=3g; target radius √(2/6)=1/√3 restores g | λ>0 and isometric scale retained. |
| Five-coordinate quadratic map | North pole and unit tangent eₓ | Image=(0,0,0,0,1); derivative norm²=3; after scale 1/√3 norm²=1 | Even degree identifies antipodes, gives projective example. |
| Source Hodge display control | Flat T³, φ=sin x dx | dφ=0 so 2d*dφ=0; Δφ=sin x dx and dd*φ=sin x dx | Source misprint below; README uses correct sum. |

### Source verification

All **19 works** were attempted through the sources service: **12 readable legal texts and seven unavailable texts**. There were no additional explicit “unverified” locators in the README. No manifest was edited. All six unresolved non-paywall requests remain together in the missing-reference ledger; Lee's paywalled/uncertified result is not requested again.

| Seeded target | Text and locator read | Outcome |
|---|---|---|
| 1.1 Curvature identities | Lee Chapter 7 citation; native curvature/tensor declarations at the pins | Sphere, matrix, rank-zero/one and contraction tests above agree. No precise claim locator and no readable Lee text: not source-certified. |
| 1.2 Local symmetry and Einstein factor | Lee Chapter 7, “curvature derivatives”; warped/disconnected controls recomputed | No pinpoint theorem/page and no readable Lee text. The controls distinguish both missing hypotheses; source certification unavailable. |
| 1.3 Metric changes, Lie groups and submersions | O'Neill Theorem 2/Corollary 1; official DOI resolution | No readable article. Numbering, printed pages and exact source hypotheses cannot be certified. Submersion/Hopf/SU(2)/rescaling tests agree independently. |
| 2.1 Jacobi fields and initial data | `milnor1963 line 3351` through 3375, §14 p. 77; Lemmas 14.3/14.4 at lines 3496/3514, pp. 80–81; extension at lines 3562–3568 | Verified the 2n initial-data solutions and realization by geodesic variation on a compact segment, with common small variation parameter. Curvature slot/sign translation gives the stated sphere equation. |
| 2.2 Normal-coordinate jets | README 588–610; Lee/Wang retrieval attempts | No source locator is attached to the expansion and no readable supporting text was obtained. The frame, quadratic and symmetric cubic controls agree; R04/R05 remain. |

Additional passages read, with the versions kept distinct:

- `milnor1963 line 1600`, Lemma 6.5, p. 36, identifies focal nullity; line 1677, Lemma 6.9, pp. 37–38, identifies nondegenerate squared-distance index. The roadmap derives its degenerate-endpoint extension from its Hessian calculation. Theorem 15.1 begins at line 3592, p. 83.
- `axler2001 line 2812` fixes complex homogeneous polynomial spaces. Proposition 5.5 at line 2829, printed p. 76, and Theorem 5.7 at line 2859, printed p. 77, give the direct sum and its unique finite iteration. The real version follows by conjugation/uniqueness. These support the newly added headlines; no algorithm from later source material is imported.
- `kms1993 line 5318`, §12.2, p. 117; line 5332, §12.3, p. 118; line 5638, §12.16, p. 124; line 5687, §12.17, p. 125, give jets, composition, section jets and vector-bundle structure. They support the generic construction, whose owner is the issue in R01.
- `gilkey2007 line 102`, Lemma 2.1 and following paragraph, printed p. 289, give the unique connection/endomorphism decomposition. Gilkey's E is the negative of the roadmap's V. The formal self-adjoint/metric implication uses the canonical Riemannian density; the weighted-circle counterexample is consistent with that restriction.
- `homma2003 line 1006`, Theorem 7.1, p. 24, and lines 1106–1138, Example 8.2, pp. 27–28, support the complex associated-bundle formulas and integrated Ricci estimate. The real/orientation-free extension remains an explicit target. The erroneous repeated summand at line 1119 is recorded below; the roadmap itself uses d*d+dd*. See the [version actually read](https://arxiv.org/pdf/math/0307022v1).
- `gage1990 line 379` through 394, Theorems 2.12–2.13/3.1, supports smooth existence, continuation and embeddedness. Lines 714–744, Theorems 4.10/4.12, have boundedness/orientation hypotheses for subsequential primitive geodesic limits. Theorem 5.1, line 746, additionally assumes total space curvature less than 3π; it is not the unrestricted shortening theorem by itself.
- `ma2020 line 372` through 395, Theorem 4.1, p. 10, and lines 953–984, Theorem 5.4, p. 21, were checked for the comparison and Type-I route. R4.9 separately states its mass, error, compactness and nonflatness inputs; this review does not certify their full proofs by citation to that argument.
- `lauer2016 line 25` through 35, Theorem 1.1, p. 1: zero-area Jordan trace gives uniqueness up to reparametrization and immortality exactly for bisection. The roadmap keeps the zero-area hypothesis and owns its additional graph-window comparisons.
- `allen2015 line 70` through 79, Theorem 1, p. 2: fixed endpoints, constant-curvature convex region, boundary compatibility and nonconjugacy are genuine restrictions. It does not supply an arbitrary-metric boundary theorem.
- `dobbins2021 line 193` through 199, Lemma 2.2, p. 5: finite pre-extinction times and Fréchet initial convergence imply Hausdorff convergence. The claimed length and positive-time smooth upgrades are additional targets here.
- `azagra2006 line 89` through 97, Theorem 1, p. 2: separability, a positive continuous error and positive Lipschitz excess are retained. Completeness is not required. A bounded input and error≤1 keep the smoothed function bounded for the distance formula.
- `tothziller line 62` through 83, Introduction p. 85, specifies full eigenspace maps using an orthonormal harmonic basis up to homothety. It supports the full-basis normalization, not a substitute for Axler's finite polynomial theorem.

## Not verifiable

The following seven texts were not available as readable legal full text in this run. Their locators and hypotheses are not certified; mathematical consistency tests above are not presented as substitutes for reading them.

- **lee2018:** DOI `10.1007/978-3-319-91755-9` resolved to paywalled access. The source service records it as uncertified. Seeded curvature/local-symmetry/jet references and other Lee chapter claims remain unverified against the book.
- **oneill1966:** DOI `10.1307/mmj/1028999604` reached the official Project Euclid landing without a readable PDF. Theorem 2/Corollary 1 and pinpoint pages remain unverified.
- **wangnotes:** The cited xumin.net URL failed DNS resolution. Chapters 5–6 could not be read.
- **taimanov1993:** DOI `10.1070/IM1993v040n03ABEH002177` reached the MathNet landing without a readable PDF. The three-simple-geodesic article, pp. 565–590, was not read.
- **grayson1989:** DOI resolution led to JSTOR's access page, not readable full text of pp. 71–111. No access control was bypassed.
- **angenent1988:** Bibliographic lookup through the service found no legal readable text of the zero-set article, pp. 79–96.
- **white2005:** DOI `10.4007/annals.2005.161.1487` reached the Annals publisher landing but the service did not yield a readable article. The precise regularity theorem, pp. 1487–1519, remains uncertified.

The review is complete with these access limits. It does not certify the full analytic proof of R4.9 from unavailable sources, nor infer its compactness/nonflatness steps from successful Lean elaboration. The source ledger preserves unresolved requests together, without editing the roadmap or replacing missing text with guesses.

## Source issues

- **Misprint** in homma2003 at Example 8.2, display immediately after (8.1), printed page 27: the source says the Hodge operator adds two copies of d*d; it should be d*d+dd*, with the second composition reversed; affects a stated result.
