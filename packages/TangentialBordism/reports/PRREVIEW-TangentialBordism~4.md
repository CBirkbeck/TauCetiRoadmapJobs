# Review of TangentialBordism (pull request #942 at 0f021fa)

**Verdict:** needs changes

## R01 (P2) — Require the transfer fibre to have empty boundary

**Location:** `TauCetiRoadmap/TangentialBordism/README.md:2322`: “Construct the general associated-F-bundle bordism transfer for a compact smooth fibre”; also the boundary Check at :2353.

**Claim:** These hypotheses produce a total-space cycle over (X,A), and the boundary of I×F consists of the two copies of F. In this roadmap's manifold-with-corners setting, compactness does not imply empty boundary. Neither the statement nor the standing conventions impose that additional condition on F.

**Witness:** Take G=1, (X,A)=(pt,∅), base cycle pt and F=[0,1]. The total space has two boundary points, which cannot map into A. Moreover, ∂(I×F) has four edges, not two.

**Repair:** Require F to be a closed smooth manifold, with a specified smooth structure-preserving action and compatible vertical structure; state numerability for the principal bundle. Retain the general closed-fibre construction for all the structure groups it supports. Add the interval-fibre negative control. If fibres with boundary are intended, formulate a separate relative transfer retaining the vertical boundary; it does not land in the displayed absolute group. With F=S¹ the point transfer is a legitimate closed cycle and ∂(I×S¹)=S¹−S¹; with F=I the proposed hypothesis now fails. This is exactly the closed-fibre hypothesis in Führing §3, p.359 (`fuhring2022 line 175`), whose geometric comparison is Proposition 3.4, p.362 (`fuhring2022 line 332`).

## R02 (P3) — Supply claim-level locators for the unsourced splitting, detection and projective formula

**Location:** `TauCetiRoadmap/TangentialBordism/README.md:1421`: “Construct the underlying/additive equivalence MO≃∨_d Σ^d HF2”; :1449, “the converse detection theorem for ΩO_n(X,A)”; :2244, the formula for p(T HP^k).

**Claim:** These are substantial mathematical targets, but their subsections contain no source locator. A general References entry does not identify the result or distinguish the source's theorem from the extension over pairs.

**Witness:** Miller Chapter 1, Theorems 12.3–12.4, pp.32–34, give the additive splitting; Thom IV.10–IV.11, p.77, gives point detection; Borel–Hirzebruch I §15.5, equation (13), p.519, gives the quaternionic formula.

**Repair:** Add those locators at the claims. For 6.2 distinguish the classical closed-manifold statement from the arbitrary-CW-pair extension proved using B5.4, the additive splitting and field-coefficient duality. For 9.4 state the conversion q=k+1 and u=−c₂ of the designated quaternionic line. The source formula then gives p(T HP¹)=1 and p(T HP²)=1+2u+7u², exactly the two existing Checks. These edits need not change the mathematical targets. Also give 5.6's umkehr construction a precise source or explicit derivation locator; its present generic G5 citation identifies machinery but no external theorem locator.

## Verified sound

This was a full read of both files at the specified head: 2,728 README lines, 152 Lean lines and all 44 numbered subsections, including their API bullets, Checks, proof routes and dependencies. The review did not change the pull-request worktree. There are two findings, one blocking. The following finite computations test the statements; they are not proofs of their general forms.

### Previous findings, checked before the full pass

| Previous finding | Passage at this head | Disposition |
| --- | --- | --- |
| R01: shared structured/framed coefficient PT, π₃S and odd Spin/SO equivalence | README:1245–1257 consumes “StringOrientation S2.2”; :1312–1329 consumes S2.3; :1536–1544 consumes S5.3; :1900–1912 names S2.3 for π₃S; :2640–2643 says StringOrientation consumes nothing here. | Repaired. The finite embedded comparison and the comparison of theories over pairs remain here; the stable coefficient isomorphisms are imported. The corresponding supplier passages were reopened at the supplied head. |
| R02: Cayley-plane ownership | README:2055–2067 says “StringOrientation S1.5 owns the Cayley plane”; :2086–2095 imports its cells; :2114–2144 imports the action and isotropy; :2193–2214 imports its classes/lifts; :2233–2252 imports HP²/OP² and states the distinct general HP^k formula. | Repaired. The kept compact-Albert identification, charts, representation/sign comparisons and general quaternionic formula differ from S1.5's targets. |
| R03: undeclared own Lean name | README:2448–2449 now says “lift of the transfer through the fibre, a map Σ8 MSpin∧BG₊→F”. | Repaired. It no longer claims an undeclared backticked name. |

No finding below relies on an instruction in a previous review or source. No “not actionable in this package” disposition was supplied for these three findings.

### Gate, dependency direction and Lean acceptance test

The worker's gate for this head reports all scanner counts zero, dependency check zero and targeted build exit 0. The outside-folder diff against `origin/main` is empty. The folder contains only README.md, Suggested.lean and metadata.toml. I reran the requested dependency check with `--movable`:

```text
depcheck: 208 roadmaps, 1457 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. StringOrientation is before TangentialBordism, and the repaired citations follow that direction. A supplier absent from the order was not treated as an upward dependency merely because it was absent. No supplier gaps are declared. Within B5, the forward map uses B5.1, the inverse uses B5.1/B1.6 and the mapping-path supplier, and the two identities finish B5.2; the B5.2/B5.3 references are not circular assumptions of bijectivity. The coefficient/spectral branch of B4.8 precedes PT and does not consume geometric bordism coefficients.

I built the two individual Tau Ceti imports, then ran `lake env lean` on Suggested.lean. Exit 0; the only warnings were the four expected `sorry` declarations at lines 93, 102, 111 and 129. A separate scratch copy with `#check @name` for all nine declarations also elaborated. No binder disappeared: the Arf headlines retain finite dimension, nondegenerate polarization, and where applicable `Fintype V` and `finrank = 2*m`; the manifold theorem retains T2, second countability, smoothness and the chosen oriented atlas. README and elaborated generalities agree.

Each of the four admitted headlines was tried on a copy without the admitted targets, separately with `simp`, `rfl`, `infer_instance` and `exact?`: all 16 probes failed to close their goal. The five supporting declarations have actual bodies; the two proved adapters are needed to construct the invariant, not additional admitted tests. No sorry'd data, `set_option`, foreign roadmap import, admitted example, vacuous condition or duplicated fully qualified declaration was found.

The headline families are: finite quadratic Arf classification; smooth oriented three-manifold parallelization; geometric bordism homology and low coefficient classifications; finite/stable structured PT and its pair comparison; ordinary operations and Adams calculations; MO splitting/ring and SO ring/detection; ABS/Dirac and connective KO comparison; exceptional projective geometry; realization through degree six with its degree-seven obstruction; and projective-transfer kernel theorems. The four native signatures cover the selected Arf and parallelization headlines. The module docstring names the remaining families and their missing carriers: geometric bordism quotient, Thom spectra/stable homotopy, singular-cohomology Steenrod operations, KO spectrum and compact Albert algebra. None has been replaced by a bare predicate or a theorem about arbitrary scalars.

### Seeded source audit

All 15 requested sample targets were examined. There are no README locators explicitly flagged unverified. Every referenced work was attempted through the sources service; unavailable texts are listed below. Source line numbers refer to the service's extraction, while page numbers below are the printed page, not the extraction's page marker. No source passage was copied into the report.

| Sample target | Text and locator inspected | Support and limitation |
| --- | --- | --- |
| 4.1 Higher diagonals and squares | Milnor–Stasheff Chapters 8/11; Miller Chapter 1, Theorem 6.1, p.14 and Proposition 6.2, p.15 (`miller line 540`, `miller line 555`). | Ordinary square/top-square/Cartan conventions agree. The signed integral higher diagonal is expressly a construction here; its edge calculation is in the table below. Chapter-only README locators could be made more precise. |
| 4.3 Thom and Wu classes | Milnor–Stasheff §11, Lemma 11.13 and Theorem 11.14, pp.140–141 (`milnorstasheff1974 line 3622`, `milnorstasheff1974 line 3630`, `milnorstasheff1974 line 3651`). | Duality defines v and gives Sq(v)=w. The source is for closed manifolds; the relative/boundary pairing is a separate target, not a source theorem silently broadened. |
| 5.1 Normal classifier and collapse | Miller Chapter 1 §§2–3, especially Theorems 2.1–2.2, pp.3–4 (`miller line 155`, `miller line 173`); normal exact sequence at `miller line 134`. | Tubes and stabilized isotopy support the classical construction. The README retains actual normal lifts and owns the parameter/corner comparisons; the text does not claim those are already supplied by Miller. |
| 5.2 Finite embedded comparison | Thom IV.6, p.74 and IV.8, p.75 (`thom1954 line 2410`, `thom1954 line 2462`); StringOrientation S2.2. | The source's stable coefficient theorem is not mistaken for the fixed-rank statement. The finite embedded statement is explicitly an extension, with the nonabelian four-point counterexample preventing loss of embedding data. |
| 5.6 Umkehr comparison | GeneralizedCohomology G5.2/G5 finite duality; no external locator in this subsection. | Source and target, degree shift and virtual normal orientation are specified. The transverse relative hypotheses survive the earlier repair. This is a locator limitation, included in R02, not a claim to have verified an external arbitrary-pair theorem. |
| 6.1 Additive MO splitting | Miller Chapter 1, Theorems 12.3–12.4, pp.32–34 (`miller line 1239`, `miller line 1261`); additive/multiplicative distinction pp.35–36 (`miller line 1370`). | A-free calculation and underlying splitting agree. No ring-spectrum splitting is inferred. Missing README locator: R02. |
| 6.2 Characteristic-number detection | Thom IV.10 and Corollary IV.11, p.77 (`thom1954 line 2528`, `thom1954 line 2538`). | Supports the ordinary closed-manifold converse. The parameter-pair theorem requires the explicitly owned PT/splitting/duality argument. Point-only numbers are correctly not used over arbitrary X. Missing locator: R02. |
| 6.5 Rational and odd-local generators | Thom IV.17, p.84 (`thom1954 line 2774`); Milnor–Stasheff Problems 16-C–E, pp.203–204 (`milnorstasheff1974 line 5351`, `milnorstasheff1974 line 5370`). | Rational polynomial structure and the Newton formulas agree. The hypersurface formula has m,n≥2. Milnor's primary odd-local theorem could not be opened; the small gcd computations are independent tests, not certification of that theorem. |
| 8.2 Spin-surface filling | Atiyah §4, Proposition 4.1 and Theorem 3′, p.58 (`atiyah1971 line 419`, `atiyah1971 line 432`); Pyronneau §2.1, pp.4–5. | Atiyah gives the mod-two Spin-index boundary criterion and bounding-structure count. Identification with the geometric q and the explicit handle filling is owned here. Counts for genus 0,1,2 agree. |
| 8.3 Spin three-manifolds | StringOrientation S2.3 for π₃S and ν; the local route is B3.4 plus B5.4. | The zero ko₃ calculation and the framed-to-Spin distinction are consistent. The additional local proof is not attributed to a source that only gives π₃S. Primary ABP text remains unavailable. |
| 8.4 Low tables and parallelization | Benedetti–Lisca Theorem 1, p.1 and §2.1, pp.2–3 (`benedettilisca2018 line 15`, `benedettilisca2018 line 74`); TopologicalKTheory T7 for KO. | The source proves closed orientable three-manifold parallelization. README:1930 onward explicitly owns the noncompact/boundary extension through doubling, compact neighborhoods, Wu/Spin and the dimensional obstruction argument. Lean states that broader result honestly. |
| 8.5 Projective boundaries | Milnor–Stasheff §16.3, p.194 (`milnorstasheff1974 line 5072`); Lee Theorems 21.10/21.13 unavailable. | The complex-projective boundary observation is present; its fibre is S², despite the source misprint. The explicit bundle model and sign computation are additional targets. Dimensions and n=1,2 orientation controls agree. |
| 9.2 Compact automorphisms/Spin isotropy | Baez §3.4, pp.30–32 (`baez2002 line 1297`, `baez2002 line 1342`, `baez2002 line 1425`); Borel–Hirzebruch I §19, pp.533–535 (`borelhirzebruch1958 line 2952`). | The compact Albert/Spin(9) setting and dimensions agree. StringOrientation owns the homogeneous space. The specific ordered Clifford volume calculation was independently recomputed using the supplier's multiplication. |
| 9.4 Projective structures | Borel–Hirzebruch I §15.5, equation (13), p.519 (`borelhirzebruch1958 line 2417`), and Theorem 19.4, p.535 (`borelhirzebruch1958 line 3021`); StringOrientation S1.5. | Substituting q=k+1 gives the general HP^k formula. The sign conversion u=−c₂ is explicit. HP²/OP² classes/lifts are imports. Missing locator for the new general formula: R02. |
| 10.2 Associated-family transfers | Führing §3, pp.359–363, especially closed F at `fuhring2022 line 175`, Remark 3.2 at `fuhring2022 line 243`, Proposition 3.4 at `fuhring2022 line 332`; CharacteristicClasses C1.3–C1.4. | The geometric total-space interpretation agrees once closedness is imposed (R01). Remark 3.2 does not establish global choice independence; the README correctly makes coherent global comparison a target instead of inferring it from unrelated stagewise homotopies. |

Additional source checks: Guillou–Weibel arXiv:1301.0872v1 Definition 6.1/Theorem 6.2, p.18, and Theorem 6.5, p.19 (`guillouweibel2013 line 748`, `guillouweibel2013 line 752`, `guillouweibel2013 line 784`) support the simple-system and odd transgression signs; the README cites the version actually read. Wall Lemmas 7–13, Theorems 1–4 and Lemma 14, pp.300–310 (`wall1960 line 352`, `wall1960 line 467`, `wall1960 line 517`, `wall1960 line 567`, `wall1960 line 680`) distinguish the two derivations and supply the point ring calculation. Führing Theorems 1.1/1.3 and Remark 1.4, pp.355–356 (`fuhring2022 line 18`, `fuhring2022 line 66`, `fuhring2022 line 72`) and §9, p.384 (`fuhring2022 line 1415`) support the SO/O projective-transfer groups, including descent from SU₃⋊C₂ to PU₃⋊C₂. Kreck–Stolz Proposition 4.2/Lemma 4.3, pp.244–245 (`kreckstolz1993 line 494`, `kreckstolz1993 line 511`) support the Newton family/gcd. Rosenberg–Stolz Theorem 3.3, p.8 (`rosenbergstolz line 302`, discussion at line 309) states the point kernel and distinguishes the prime-local inputs. It does not supply an arbitrary-X kernel equality, and the README does not assert one.

### Pinned APIs and ownership

The following declarations were opened at the pins, not on a newer library. Paths here are library-relative.

| Pinned declaration/file | What its actual definition or hypotheses establish |
| --- | --- |
| `Mathlib/Geometry/Manifold/Bordism.lean:110`, :147, :238, :247 | `SingularManifold`, map, point-parameter product and sum. Compactness and boundarylessness are fields; T2/second countability and a bordism quotient are not. The roadmap adds T2 and constructs its own witnesses/quotient. |
| `Mathlib/Geometry/Manifold/WhitneyEmbedding.lean:131` | `exists_embedding_euclidean_of_compact`: compact T2 smooth manifold input. It does not prove the required neat relative embedding theorem. |
| `Mathlib/Geometry/Manifold/ChartedSpace.lean:236` | `ChartedSpace.secondCountable_of_sigmaCompact` needs the second-countable model and sigma compactness; compact Euclidean-model cycles qualify. |
| `TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean:301`, :309 | `IsAlt.exists_basis_toMatrix_eq_J`, `IsAlt.even_finrank`; finite dimension and nondegeneracy remain required. |
| `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:311` | `QuadraticMap.polar_self` is 2 times q, making the full polar alternating in characteristic two. No division by two is used. |
| `TauCeti/Geometry/Manifold/Orientation.lean:332`, :352 | `IsOrientedAtlas` includes membership in the maximal smooth atlas, coverage and positive transition data; `det_fderivWithin_pos` gives the stated determinant criterion. An empty atlas cannot fake orientation on a nonempty M. |
| `Mathlib/LinearAlgebra/Orientation.lean:116`, :217 | `Orientation.map_of_isEmpty` and `eq_or_eq_neg_of_isEmpty`: the two zero-dimensional signs are not represented by two different empty bases. |
| `TauCeti/Geometry/Manifold/Instances/ClosedBall.lean:413` | `orientable_closedBall` requires 2≤n; the roadmap correctly separates the one-dimensional half-space-atlas issue. |
| `TauCeti/Geometry/Lie/Subgroup/Embedded.lean:137` | The closed-subgroup existence theorem retains a finite-dimensional Lie ambient group and chosen embedded smooth data. It is not an automatic smooth structure on every subgroup. |
| `TauCeti/LinearAlgebra/CliffordAlgebra/RealForm/Basic.lean:124`; `Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean:292` | The real form has p positive and q negative squares; native Spin is the even part of the native Pin object. The positive-definite convention used for the Peirce module matches the supplier. |
| `Mathlib/RepresentationTheory/Homological/GroupHomology/FiniteCyclic.lean:85` | `Rep.FiniteCyclicGroup.groupHomologyIsoEven` is the positive-even cyclic-group homology comparison; its nonzero/even conditions are essential. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/Cup/Graded/Comm.lean:197` | Existing cup-one operates on the coinduced continuous-group-cohomology resolution. It is not ordinary normalized singular cochains/Sq on arbitrary pairs, so B4.1 is a different object. |

Object searches covered both pins, the main roadmaps, board packages and the supplied open-roadmap heads, using the roadmap search service and direct inspection of relevant hits. The native split Zorn/Albert algebra is not the positive-definite compact Albert algebra. `TauCeti.DivisionOctonionReal` and `compactAlbertAlgebra` are planned in LieHighestWeight Layer 8, not falsely claimed as implemented: see `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:1261`, :1333 and :1391. This resolves the citation scanner's lead. No coincident fully qualified name was found for the nine kept Lean declarations.

The following supplier citations were resolved against main unless explicitly marked open head. This lists the actual interfaces, rather than counting a successful text search as resolution:

| Supplier and repository-relative locator | Resolved interface |
| --- | --- |
| `TauCetiRoadmap/DifferentialGeometry/README.md:345`, :352, :528, :884 | Orientation quotient, preserving maps/product signs, abstract face boundary and manifold Sard. These do not already supply B1.6's relative transversality. |
| `TauCetiRoadmap/GeometricTopology/README.md:177`, :831, :938 | Collars/gluing/handles/tubes, simplicial CW realization, smooth triangulation. Relative face-compatible triangulation and rounding remain explicit adaptations here. |
| `TauCetiRoadmap/SmoothBundlesConnections/README.md`, B1.4 (open head) | Free proper smooth quotient/principal submersion and homogeneous-space comparison; the source hypotheses are retained. |
| `TauCetiRoadmap/GeneralizedCohomology/README.md:710`, :797, :878, G4 and G5.2–G5.5 | Arbitrary-CW comparison, mapping-space connective coreflection/module action, localization/completion, quaternionic carriers, unframed collapse, normal bundle diagrams and ABS orientation. TangentialBordism constructs the geometric structured comparison and its explicit fillings. |
| `TauCetiRoadmap/CharacteristicClasses/README.md:486`, :504, C2–C3/C6/C7.3a | Faithful compact-group representations/Stiefel approximations, relative smooth principal representatives, ordinary characteristic/Thom classes and projective tangent classes. The relative homotopy clause needed by 10.2 is actually present. |
| `TauCetiRoadmap/TopologicalKTheory/README.md:1148`, :1263 | Real Bott/ABS normalization: c(a)=2u² and c(b)=u⁴, with the eight coefficient groups. |
| `TauCetiRoadmap/SpinGeometry/README.md`, G4, G5.0, G6.0, G6.7 | Spin lifts and refinements, real Clifford spinor carrier, closed real Dirac realization/index, quaternionic degree-four comparison. Geometric ABS/PT equality is left here. |
| `TauCetiRoadmap/RiemannianGeometry/README.md:179`, :280–296 | Round Hopf quotient metric on HP^d with curvature in [1,4]; HP¹ has curvature 4. The PSp₃-invariance/associated-family contraction is additional here. |
| `TauCetiRoadmap/ClassifyingSpaces/README.md:222` | Stage 4 identifies topological BG homology with the native trivial-module group homology, retaining deck-action conventions. |
| `TauCetiRoadmap/AlgebraicTopology/README.md`, Stages 2–4, 6, 8; :98–121 | Ordinary chains/products, CW support, duality and EM/obstruction interfaces. DGFloer owns the actual abelian EM family; the citations respect that split. |
| `TauCetiRoadmap/DGFloer/README.md:522`, :544; `TauCetiRoadmap/DGAInfinity/README.md:263` | Serre homology/cohomology sequences including multiplicative construction; signed graded tensor/cochain infrastructure. Kudo/Borel/Steenrod comparison is not already supplied by those objects. |
| `TauCetiRoadmap/AffineMorseLefschetz/README.md:67`, :494, :535; `TauCetiRoadmap/ComplexKahlerGeometry/README.md:1407` | Projective zero-locus carrier, weak Lefschetz/Veronese and native complex projective atlas. |
| `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:275`, :326; `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:881` | Closed-subgroup charts/integration; real Clifford classification and compact Spin topology, including the quaternionic three-dimensional seed. |
| `TauCetiRoadmap/IntegralLattices/README.md`, Layers 0–1 | Integral/discriminant forms and finite quadratic modules with values in Q/Z are not the native F₂ quadratic-form invariant of 1.1. |
| `TauCetiRoadmap/IndexTheory/README.md`, I2.5/I5.4/I7.2/I7.5 (open head); `TauCetiRoadmap/PseudodifferentialOperators/README.md`, P5–P6 (open head) | Elliptic symbol/index and regularity, signature and analytic Rokhlin comparison. The homogeneous real-Clifford family comparison is explicitly built here. |
| `TauCetiRoadmap/StringOrientation/README.md:360`, :448, S2.3, S5.3 (open head) | Shared OP²/HP² data, structured coefficient PT, framed coefficient PT/π₃S and inverted-two Spin/SO equivalence. These are now consumed. |

The ownership search also located the following relevant boundaries: main BordismFormalGroups consumes the Adams inputs and owns formal laws and finite sub-Hopf algebras beyond A(1); the supplied FourManifolds head consumes B1.7, Arf, finite PT and higher diagonals; the supplied HomotopySpheres head consumes the early Arf algebra and owns the sphere-parallelization/Hopf-invariant-one application; AlgebraicTopologyPartII leaves the ordinary Wu theory here. The supplied GeometryOfNumbersAndQuadraticArithmeticPartII §0.4 extends the finite-field coordinate using absolute trace and distinguishes it from the F₂ invariant; its finite-field extension law is not being reconstructed in this roadmap. Its referenced HermitianKTheoryOfPoincareCategories source was not among the supplied checkouts and was not independently audited. Ownership against other open pull requests whose files the brief did not supply was not checked. No new upward edge was introduced to address those search hits.

### Adversarial mathematics table

“Pass” means that the two displayed values agree on the listed inputs; it does not replace a proof or an unavailable source. The 121 rows represent all 44 target subsections, with separate rows for independent identities and the four Lean headlines. Scratch arithmetic used exact integers/F₂ polynomials. For m=0,1,2 the Arf enumeration used respectively 1,4,16 refinements of the standard polarization and 1,6,720 ordered symplectic bases, totaling 11,545 form/basis pairs. Every half-dimensional subspace was checked for the Lagrangian test. The Clifford calculation used integer matrices from the supplier's Cayley–Dickson product, not floating point.

| Statement / target | Instances tried | Values computed on both sides | Result / change |
| --- | --- | --- | --- |
| Conventions: tangent/normal inverse | Oriented point; TS²⊕ε¹ | Rank-zero class 0 has inverse 0; [TS²]−2=0 and normal class also 0 | Pass |
| Conventions: boundary/cylinder | Positive I; I×positive point | ∂I=[1]−[0], coefficients (+1,−1); total coefficient 0 | Pass |
| 1.1 full polarization / symplectic basis | q=xy; q=x² on F₂¹ | Polar matrices [[0,1],[1,0]] versus [0]; ranks 2 versus 0, so the latter fails nondegeneracy | Pass |
| 1.1 paired-basis formula / basis independence headline | m=0,1,2, all enumerated bases | Arf distributions among refinements (1,0), (3,1), (10,6); every basis gives that same form's value 0 or 1 | Pass |
| 1.1 Gauss-sum headline | Zero form on zero space; hyperbolic H; anisotropic A; 4-dimensional forms | Sums 1,+2,−2,+4/−4 equal signed 2^m | Pass |
| 1.1 zero-Lagrangian headline | Same 21 forms; all m-planes | Existence true exactly for 1,3,10 Arf-zero refinements and false for 0,1,6 Arf-one refinements | Pass, both directions |
| 1.1 zero-count formula | m=0,1,2 | Counts 1; 3/1; 10/6 equal the separate zero-dimensional rule and 2^(2m−1)±2^(m−1) | Pass; no negative-exponent branch |
| 1.1 sum/classification | A⊕A and its diagonal | Arf=1+1=0; q(v,v)=0; diagonal dimension 2; Gauss (−2)²=4, same as H⊕H | Pass |
| 2.1 fixed-face transversality | f(t)=t, fixed face {0}, Z={0}; f(t)=1+t | Ambient derivative rank 1; face rank 0<codim 1, excluded; second map misses Z on the face | Pass |
| 2.1 tubes/neatness/rounding | I⊂I×R; quadrant corner | Normal rank 1, endpoint collars retained; smoothing one corner changes no exterior face identification | Pass on the local models |
| 2.1 doubles/compact neighborhoods | I; empty manifold; [−1,1]⊂R | Doubles S¹ and ∅; [−2,2] has interior containing [−1,1] | Pass |
| 2.2 zero-dimensional orientation | ±pt and its empty tangent basis | Two orientation rays, one empty basis; identity transport fixes each sign | Pass; point sign is extra data |
| 2.2 product/permutation sign | Two lines; point×line | Determinants −1 and +1 equal (−1)^(1·1) and (−1)^(0·1) | Pass |
| 2.2 half-space orientation | I endpoints; oriented half-space in dimension 3 | Endpoint charts have signs + and − in dimension 1; in dimension 3 a tangent reflection compensates a normal reflection with determinant +1 | Pass |
| 2.3 quotient adapters | Z acting on R; irrational R-flow on T² | First quotient S¹ is Hausdorff; second has dense nonclosed orbits, not Hausdorff, and fails properness | Pass, negative control |
| 2.3 disc/sphere bundle | Rank 1 and rank 0 over pt | D¹ has boundary S⁰ of cardinality 2; D⁰ is pt with empty sphere boundary | Pass |
| 2.3 finite support | Compact interval mapped into disjoint CW components | A connected image lies in one component; a compact discrete image is finite, unlike an arbitrary infinite set of isolated points | Pass |
| 2.4 collared witnesses | Identity witness I×M; reversed witness; empty M | Boundary M−M=0; reversal changes both signs; empty cylinder has empty boundary | Pass |
| 2.5 relative-cycle face | (I,∂I)→(I,∂I); (I,∂I)→(pt,∅) | First face maps to A; second requires a map from two points to ∅ and is impossible | Pass |
| 2.6 small representatives | Empty cycle and one labelled point | Representatives have cardinalities 0 and 1; changing ambient embedding leaves the stable labelled class 0 and 1 | Pass |
| 2.7 quartic | Degree-four surface in CP³ | c₁=0, c₂=6h², ∫h²=4: χ=24, p₁=−48, σ=−16, Â=2 | Pass |
| 2.7 orientation reversal | Same quartic with opposite orientation | Pontryagin number +48, signature +16, Â=−2, while χ stays 24 | Pass |
| 2.7 elliptic fibre | E(1)=CP²#9 CP²bar, F=3H−ΣE_i | F²=9−9=0; χ=3+9=12; σ=1−9=−8; c₁=F, hence its restriction to the complement is 0 | Pass; marked Spin comparison still needs its proof |
| 3.1 quotient/group inverse | O points; SO signed points | 1+1=0 in F₂; +1−1=0 in Z, but +1+1=2≠0 | Pass |
| 3.2 external product | Signed points; dimensions 1 and 1 | (+pt)(−pt)=−pt; swapping two degree-one factors contributes −1 | Pass |
| 3.2 target restriction for intersection | Two transverse lines in RP² | One mod-two intersection; SO intersection needs an orientation which RP² lacks | Pass |
| 3.3 connecting map / ∂² | (I,∂I) and oriented square | ∂[I]=[1]−[0]; four corner contributions cancel in pairs, giving ∂²=0 | Pass |
| 3.3 excision/additivity | Pair (X,X); disjoint two-point target | Relative group 0; degree-zero coefficients F₂² or Z², not a single copy | Pass |
| 3.4 orientation map | pt, ∅, signed points over x,y | Images 1,0,(1,0),(0,1); forgetting parameters adds coordinates | Pass |
| 4.1 signed diagonal | Edge e=[0,1] with endpoints v₀,v₁ | ∂(−e⊗e)=v₀⊗e+e⊗v₁−v₁⊗e−e⊗v₀=AW−T AW | Pass |
| 4.1 integral cup-one identity | Degree c=2, δc=3 | Evaluation of the chain equation gives δ(c cup₁ δc)=c cup δc−δc cup c−δc cup₁ δc; all three terms have degree 5 | Pass; degree/sign test |
| 4.1 Sq unit/instability/top square | a∈H¹(RP∞;F₂), 1 | Sq¹a=a², Sq²a=0; Sq⁰1=1 and higher squares of 1 vanish | Pass |
| 4.1 Cartan/Adem | a²; Sq¹Sq¹a | Sq¹a²=2a³=0, Sq²a²=a⁴; Sq¹Sq¹a=Sq¹a²=0 | Pass |
| 4.2 simple system | F₂[a], exponent 3 and 4 | a³=a·a² and a⁴ is a new generator, both nonzero; squarefree monomial coordinates encode binary digits | Pass |
| 4.2 transgression | Path-loop K(F₂,2) | Degree 1 fibre class maps to degree 2 base class under d₂:(0,1)→(2,0) | Pass |
| 4.2 dual Steenrod degrees/coproduct | ξ₁,ξ₂ | Degrees 1,3; coproduct middle term ξ₁²⊗ξ₁ has degree 2+1=3 | Pass |
| 4.2 Adams differential | (s,t)=(1,2), r=2 | Target (3,3), stem 1→0, as t−s decreases by 1 | Pass |
| 4.2 completion restriction | Prüfer 2-group versus Z | Classical completion 0 versus derived π₁=Z₂; for Z, tensor and derived π₀ both Z₂ | Pass; finite generation not dropped |
| 4.3 Wu relation | RP² | v=1+a; Sq(v)=1+a+a²=w, with v₂=0 | Pass |
| 4.3 Thom relation | Trivial line; tautological line over RP∞ | SqU=U versus Sq¹U=aU; w=1 versus 1+a | Pass |
| 4.3 homotopy invariance limit | S² and its stable tangent bundle | w₂ evaluates 2=0 mod2; stable tangent class is trivial, but no assertion identifies all tangent bundles from numbers | Pass on the example |
| 4.4 odd operations | p=3, degree-two y | P¹y=y³ of degree 6; β²y=0; P²y=0 by instability | Pass |
| 4.4 odd simple system | F₃[y], exponents 4,9 | y⁴=y·y³ and y⁹ is the next system element; neither is zero | Pass |
| 4.4 Kudo signs/degrees | p=3, τx=ι₂, y=βx | τy=−βι₂=2βι₂; secondary degree 8, P¹βι₂ degree 7, odd degree-three square 0 | Pass |
| 4.4 Milnor operation conventions | p=3, i=0 | ξ₁ degree 4, τ₀ degree 1; Q₁=P¹β−βP¹ degree 5 equals τ₁'s degree | Pass |
| 5.1 collapse/normal rank | Positive framed point in R; empty cycle | Collapse degree +1; empty collapse degree 0; normal rank 1 | Pass |
| 5.1 stabilization | Trivial normal line stabilized once | ν⊕ε¹ has rank 2; Thom space S¹ suspends to S², degree +1 retained | Pass |
| 5.2 finite embedding dependence | Labelled points a+,b+,a−,b− versus a+,a−,b+,b− | Reduced free words aba⁻¹b⁻¹ (length 4) versus identity (length 0); both abelianize to (0,0) | Pass, nonabelian control |
| 5.2 low-rank carrier | n=k=0; framed rank 1 | R⁰ admits 0 or 1 embedded point, not 2; π₁S¹=Z records signed counts | Pass |
| 5.3 inverse | Degree-one and constant Thom maps | Inverse images +pt and ∅; collapse returns degrees 1 and 0 | Pass |
| 5.4a absolute transformation | X={x,y}, n=0 | Geometric labels (1,0),(0,1) map to the corresponding two coefficient summands | Pass |
| 5.4b relative construction | (I,∂I) | Quotient I/∂I=S¹; oriented relative interval maps to suspension generator +1, boundary +1−1 | Pass |
| 5.4c stable comparison | Point; labelled commutator stabilized | Point reduces to imported coefficient isomorphism; commutator abelianizes to 0 on both stable sides | Pass |
| 5.5 framed/ordinary comparison | +pt; η³ | Point degree 1 maps to 1; η³=12ν in Z/24 maps to 0 in ΩSpin₃ | Pass; framed and Spin classes distinguished |
| 5.6 identity umkehr | id_N | Shift d−d=0 and fibre product M×_N N≅M, so identity on the class | Pass |
| 5.6 inclusion/transverse pullback | pt→oriented S¹, degree-one circle cycle | Shift −1, one positive inverse point; its image has coefficient +1 | Pass |
| 5.6 orientation and relative guard | Two lines in RP²; f(t)=t fixed at 0 | O count 1, no SO target orientation; fixed endpoint rank 0 fails transversality against codimension 1 | Pass |
| 5.7 AHSS | pt; total degree 0; two components | Only p=0 remains over pt; only (p,q)=(0,0) in total degree 0; two copies of Ω₀ for two components | Pass |
| 6.1 additive MO multiplicity | Degrees 0 through 4 | Multiplicities 1,0,1,0,2; degree 4 monomials x₄ and x₂² give 2, not 1 | Pass; R02 locator |
| 6.1 mod-two detection setup | π₀MO=F₂ | 2·1=0 and multiplication by 2 is null through the unit; not an integral free coefficient group | Pass |
| 6.2 joint characteristic numbers | RP², S²; x-point and y-point | (w₁²,w₂)=(1,1),(0,0); parameter class 1_x evaluates 1 and 0 respectively | Pass; R02 locator |
| 6.2 degenerate parameter pairs | (pt,pt); empty cycle | H*(pt,pt)=0 and ΩO(pt,pt)=0; all numbers of the empty class are 0 | Pass |
| 6.3 unoriented generators | RP², RP⁴, forbidden degree 3 | s₂=3=1 mod2; s₄=5=1; degree 3=2²−1 has no generator | Pass |
| 6.3 real hypersurface exception | H_R(2,4); H_R(1,2) | Newton mod2 binom(6,2)=15=1 in dimension 5; H_R(1,2) is a Klein bottle with s₂=0, so unrestricted binomial formula would fail | Pass, m,n restrictions matter |
| 6.4 odd Spin/SO equivalence | π₄ at p=3 | Spin generator forgets to 16 times oriented generator up to sign; 16 is a unit in Z_(3), but not in Z_(2) | Pass |
| 6.4 stable/fixed-rank distinction | Oriented real 2-planes | BSO(2) has Euler class in degree 2; stable BSO rational cohomology has no degree-two class | Pass |
| 6.5 rational rank | Degrees 4 and 8 | Partition counts 1,2; representatives CP² and {CP⁴,CP²×CP²} | Pass |
| 6.5 complex hypersurface | H_C(2,3); H_C(1,1) excluded | Complex dimension 4 and s₂=−10; excluded CP¹ has Chern Newton +2, not −2 | Pass |
| 6.5 incidence convention | v=w=(1,i,0) | Bilinear Σv_iw_i=1−1=0; Hermitian pairing=1+1=2 | Pass |
| 6.5 binomial gcd | N=2,…,12 | gcds 2,3,2,5,1,7,2,3,1,11,1 equal prime for prime powers and 1 otherwise | Pass |
| 6.6 Wall lift | RP²; oriented pt | H¹(RP²;Z)=0 cannot lift w₁≠0; reflection on ΩSO₀ is −1 so 1−ρ=2 | Pass |
| 6.6 two derivations | σ₄; cut twice | ∂₂σ₄=σ₂ and ∂₂²σ₄=1; ∂₁²=0 | Pass |
| 6.6 torsion multiplication | Y₆,Y₅ | δY₆=Y₅, δY₅=0; δ(Y₆Y₅)=Y₅²≠0 in the polynomial algebra | Pass |
| 6.6 pullback free quotient | Degree 4 | W homology generator Y₂² corresponds to h₄ mod2; free coefficient group Z maps onto F₂ | Pass |
| 7.1 ABS/Dirac normalization | +pt; nonbounding Spin circle; K3 | KO values 1,η,2u² after complexification in degree 4; K3 has quaternionic index 1 | Pass |
| 7.1 real Clifford signs | Tangent unit and external unit | Squares −1 and +1 respectively; their graded anticommutation gives mixed square 0 on equal lengths | Pass |
| 7.2 low connective comparison | Degrees 0,…,7 | Both coefficient lists Z,Z/2,Z/2,0,Z,0,0,0; K3 maps to degree-four generator, not twice it | Pass |
| 7.2 first excluded degree | Degree 8 | ΩSpin₈ has rank 2, ko₈ rank 1; HP² is a nonzero kernel class | Pass, range sharp |
| 8.1 surface refinement | Standard torus, bounding/bounding versus nonbounding/nonbounding factors | q(a),q(b)=(0,0) or (1,1); q(a+b)=1 in both cases, matching q(a)+q(b)+a·b | Pass |
| 8.2 filling criterion | Genus 0,1,2 | Bounding counts 1,3,10 versus total 1,4,16; nonbounding counts 0,1,6; Arf zero iff filling | Pass |
| 8.2 handle/Lagrangian | A⊕A | Diagonal q-zero 2-plane kills genus 2; single A has no nonzero q-zero vector | Pass, converse control |
| 8.3 Spin three-manifolds | Nonbounding-circle product T³; any Spin S³ | ΩSpin₃=0; η³ framing class 12ν≠0 in Z/24 nevertheless forgets to 0 | Pass |
| 8.4 coefficient tables | Degrees 0,…,4 | O: F₂,0,F₂,0,F₂²; SO: Z,0,0,0,Z; Spin: Z,F₂,F₂,0,Z | Pass |
| 8.4 parallelization headline | R³, R³ half-space, ∅, S³ | Coordinate frame determinant +1 and smooth linear inverse; empty requirements vacuous with empty frame; Lie frame on S³ has rank 3 | Pass |
| 8.4 orientability guard | RP²×R | w₁ is pulled-back nonzero a; no oriented atlas and no global tangent frame | Pass, negative control |
| 8.4 obstruction dimensions | BSpin(3)=BS³ and a 3-complex | First possible obstruction lies in H⁴; H⁴ of a 3-complex is 0 | Pass |
| 8.5 real projective filling | n=1,2 | ∂D²=S¹=RP¹; square of tautological line over CP¹ gives circle quotient S³/±1=RP³ | Pass |
| 8.5 complex projective filling | n=1,2 | Dimensions of total disk 3,7 and boundary 2,6; fibre dimension 2, not 1 | Pass |
| 8.5 twistor orientation | q=1, tangent (x,y) | Derivative −2xk−2yj has determinant −4 relative to (j,k); multiply by horizontal (−1)^(n−1) to get (−1)^n | Pass |
| 9.1 idempotent chart | v=(1,0,0); v=(1,1,0) | P=diag(1,0,0), or ½[[1,1,0],[1,1,0],[0,0,0]]; P²=P and trace=1 in both | Pass |
| 9.1 excluded wrong model | Zero idempotent; identity matrix | Traces 0 and 3, both excluded; trace-one idempotents have rank 1 | Pass |
| 9.1 chart denominators/cells | Chart origin; diagonal primitive frame | 1+norm²+norm²=1>0; three frame traces sum to 3; cells dimensions 0,8,16 give χ=3 | Pass |
| 9.2 compact type/isotropy | F₄/Spin(9) | Dimensions 52−36=16; Peirce tangent O² has real dimension 16 | Pass |
| 9.2 Clifford relations | All nine generators on O² | 81 anticommutators equal 2δ_ij I₁₆; each generator squares to +I | Pass |
| 9.2 Clifford volume | Ordered C₀…C₈; flip C₈ only | Product −I₁₆ sends (1,0) to (−1,0); flipped product +I₁₆ sends it to (1,0) | Pass |
| 9.3 normal Bott/sign | OP¹⊂OP², chosen u | e(ν)=u and ∫OP¹u=1; reversing the clutching sign gives −1 and is excluded | Pass on the orientation witness |
| 9.3 OP² imported characteristic data | p₂=6u,p₄=39u², ∫u²=1 | Signature (381·39−19·36)/14175=1; Euler 3; H³=H⁴=0 gives one String lift class | Pass |
| 9.4 HP^k formula | k=1,2,3 | Pontryagin coefficients (1,0), (1,2,7), (1,4,12,8); HP² signature (49−4)/45=1 | Pass; R02 locator |
| 9.4 obstruction table | RP²,CP²,HP²,OP² | w₁=a≠0; w₂=h≠0; λ=u≠0; H⁴=0 respectively | Pass |
| 10.1 realization low range | Degree 0; cyclic group C₃ in positive even degree | Positive point realizes 1; H_even>0(C₃;Z)=ker(3:Z→Z)=0, while odd homology is Z/3 | Pass |
| 10.1 degree-seven obstruction | Lens-space product, mod3 operations as displayed | Product coefficient −1=2 in F₃ on v₁v₂u₁³u₂³; evaluates nonzero | Pass |
| 10.2 closed-fibre transfer | F=S¹, G=1, base pt or empty | Total spaces S¹ and ∅; dimensions 1 and no cycle, classes [S¹] and 0 | Pass after R01 |
| 10.2 fibre-boundary counterexample | F=I, G=1, base pt, A=∅ | Total boundary has 2 points rather than 0; I×I has 4 boundary edges rather than the claimed 2 | Fail; impose closedness (R01) |
| 10.2 product/base change | Trivial F-bundle over closed M; pullback along id | Total M×F on both sides; dimension dim M+dim F; identity pullback changes nothing | Pass after R01 |
| 10.3 O/SO orientation kernels | Fibres RP², CP² | RP² gives nonzero ΩO₂ generator, CP² has σ=1 in ΩSO₄; target ordinary positive point homology 0 | Pass |
| 10.3 semidirect action | Complex conjugation, scalar i | Degree on CP²=(−1)²=+1; conjugation sends i to −i≠i, so scalar circle is normal but not central | Pass |
| 10.3 degree-five torsion | Dold P(1,2) | w₁=0, w₂=d, w₃=cd, ∫w₂w₃=∫cd²=1 | Pass |
| 10.4 Spin isotropy descent | Two quaternionic tangent blocks | Two full rotations have π₁SO₈ class 1+1=0; one block gives 1 | Pass |
| 10.4 PSC contraction input | HP², round quotient metric | Scalar lower bound 8·7=56>0, actual 128>0; point KO index 0 | Pass; no phantom vanishing inferred |
| 10.4 BG generators / adjoint | x₁=1,x₂=y₁=y₂=0 | (t₂,t₃,t₈,t₁₂)=(1,0,0,0); corrections give w₈=w₁₂=1 versus 0 without them | Pass |
| 10.4 Sq¹ table | Exact F₂ polynomials in four variables | Sq¹t₂=t₃; Sq¹t₃=Sq¹t₈=Sq¹t₁₂=0; all four differences 0 polynomials | Pass |
| 10.4 Sq² table | Same polynomials | Sq²t₂=t₂², Sq²t₃=t₂t₃, Sq²t₈=0, Sq²t₁₂=t₂t₁₂; all four differences 0 | Pass |
| 10.4 BH free basis/relation | Fibre over basepoint | t_i=0, u₈=u₄² and u₄³=0; basis 1,u₄,u₄² has rank 3, same as H*(HP²;F₂) | Pass |
| 10.4 vertical w and Gysin | Same HP² fibre | w=1+u₄+u₄²; π!1=π!u₄=0, π!u₄²=1; inverse w has 1+u₄ modulo u₄³ | Pass |
| 10.4 KO Pontryagin definition | Oriented real plane ℓ_R; zero virtual bundle | λ_t(ℓ_R−2)=1+([ℓ_R]−2)t/(1+t)²; π₁=[ℓ_R]−2, higher π_i=0; zero has π₀=1 | Pass |
| 10.4 cover index | Empty partition, (2), (3) | n=0,2,3 and k=0,8,10, respectively; uniform 4n would wrongly give 12 for (3) | Pass |
| 10.4 A(1) Ext/KO normalization | a² versus h₀²b; η³ | Both bidegrees (6,14); KO a²=4b and η³=0, not a²=b | Pass |
| 10.4 shifted polynomial summand | f=1 in t₁₂ F₂[t₂,t₃] | Sq²t₁₂=t₂t₁₂ while Sq²1=0, verifying the additional t₂ term | Pass |
| 10.4 Newton family | n=2,r=0; n=3,r=0,1 | −10; −28,−28, with gcds 10 and 28=4·7 | Pass |
| 10.4 Newton gcd | n=2,…,8 | 10,28,6,22,26,4,34 equal the stated 2-adic factor times the prime-power factor | Pass |
| 10.4 point kernel / low range | n<8; n=8 | Negative transfer domains 0, low ABS kernel 0; HP² supplies nonzero rank-one kernel in degree 8 | Pass |

Wall §9 Proposition 2 has an additional source-only zero-class exception: 0·[RP²]=0 is orientable. It is not a roadmap target; the source issue is recorded below.

The arithmetic rows also exclude the most plausible wrong models: half-polarization in characteristic two, the zero operation instead of Sq, additive MO multiplicities replaced by indecomposables, finite embeddings replaced by abstract cycles, a square-zero SO torsion ideal, the inverse quaternionic sign, one isotropy rotation, and a trivial transfer. Denominators in the idempotent charts are strictly positive; the integer L-genus divisions in the examples yield exactly 1 or −16. The relevant nonabelian test is the free-group commutator in 5.2; the cyclic test is C₃ homology in 10.1. Field/DVR and ramification examples do not instantiate these topological statements.

## Not verifiable

These are source-access limits, not assertions that the mathematics is false. The review was completed without waiting for additional texts. No missing text was downloaded from an unauthorized mirror.

- Lee, *Introduction to Smooth Manifolds* (2013), Chapter 6 and Theorems 21.10/21.13, pp.544–545 and 549: the service reached the Springer paywall and classified the source uncertified. The named roadmap quotient and transversality interfaces were checked independently.
- Milnor (1960), §4, Theorems 4–5, p.519: DOI 10.2307/2372970 led to JSTOR; no readable legal full text was obtained. This limits certification of 6.4–6.5's primary odd-local theorem.
- Atiyah–Bott–Shapiro (1964), *Clifford modules*: service classified the Elsevier source uncertified. The supplier conventions and finite KO tests were checked; the primary construction was not certified.
- Anderson–Brown–Peterson (1967), DOI 10.2307/1970690: JSTOR landing page only. The 2-local splitting, partition-cover lifts and their full cohomology proof in 7.2/10.4 were not verified against this primary text.
- McCleary (2001), Chapter 6, including Theorem 6.21: bibliographic lookup obtained no legal readable text. The separately cited Guillou–Weibel v1 algebraic/Kudo statements were opened, with their actual hypotheses and signs; that does not certify every ordinary topological construction in 4.2–4.4.
- Stong (1968): DOI 10.1515/9781400879977 led to the publisher's restricted book page. The connected-cover coordinate notation and full cobordism proofs were not certified from this book.
- Gompf–Stipsicz (1999), §§3.1 and 8.3: AMS ebook access was unavailable. Characteristic-number calculations were checked, but the marked elliptic-complement/Spin handle comparison is not source-certified.
- Stolz (1992), DOI 10.2307/2946598: JSTOR landing page only. Rosenberg–Stolz's statement of the point-kernel result was opened, but the detailed 2-primary A(1) resolution/transfer proof was not certified from the primary paper.
- The linked Mathlib proposal 31350 was not readable in the web lookup. It is explicitly only a proposed witness shape; the pinned `SingularManifold` definition was opened and does not depend on accepting that proposal.
- Several assertions are deliberately stronger construction targets than their references: signed higher diagonals, fixed-rank PT with arbitrary CW classifier, parameter-pair detection, noncompact/boundary parallelization, and global transfer coherence. The report checks their hypotheses, examples and declared inputs; it does not claim that the cited classical texts already prove those exact formal interfaces.

Adams–Atiyah was successfully fetched from the institutional redirected URL after the initial attempt; it is not an outstanding source request. No sources.toml was edited in this read-only review.

## Source issues

- **Misprint** in milnorstasheff1974 at §16.3, printed p.194 (TeXromancers edition): the source says odd complex projective space is a circle bundle over quaternionic projective space; it should be an S² bundle, with an associated rank-three disk bundle; affects the proof.
- **Misprint** in milnorstasheff1974 at §16.3, printed p.194 (TeXromancers edition): the source says the Pontryagin-number argument fails for even complex projective dimension; it should be odd complex projective dimension; affects the proof.
- **Misprint** in milnorstasheff1974 at §16.3, printed p.194 (TeXromancers edition): the source says the sphere has an orientation-reserving diffeomorphism; it should be orientation-reversing in this contrast with Pontryagin numbers; affects nothing.
- **Misprint** in pyronneau2024 at Lemma 2.12 proof, printed p.5: the source says Arf of one anisotropic and m−1 hyperbolic planes without completing the equation; it should be equal to 1; affects the proof.
- **Misprint** in pyronneau2024 at Lemma 2.13 proof, printed p.5: the source says dim V=2n while the parameter throughout is m; it should be dim V=2m; affects nothing.
- **Misprint** in pyronneau2024 at Lemma 2.13 proof, printed p.5: the source says both counting recurrences add q₀(v); it should be p(φ⊕q₀)=3p(φ)+n(φ) and n(φ⊕q₀)=3n(φ)+p(φ); affects the proof.

- **Error** in wall1960 at §9, Proposition 2, printed p.308: the source says multiplying an orientable class by a nonorientable class always gives a nonorientable class; it should require the orientable class to be nonzero; affects a stated result.
