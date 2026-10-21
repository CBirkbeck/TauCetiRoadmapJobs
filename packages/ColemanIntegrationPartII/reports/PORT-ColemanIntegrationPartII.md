# ColemanIntegrationPartII port report

Branch: `roadmap/coleman-integration-part-ii`.
Head commit: `bd972d91ed7d5d8bd3dd2e7ee84b35853db32ba4`.
Starting tree: clean at `93f0505`.

The commit adds only `TauCetiRoadmap/ColemanIntegrationPartII/README.md`, `TauCetiRoadmap/ColemanIntegrationPartII/Suggested.lean` and `TauCetiRoadmap/ColemanIntegrationPartII/metadata.toml`. The topic remains `math.NT`. No top-level index, supplier, pin, tooling or merge-order file changed. No push or GitHub write was performed.

## Validation

Command: `lake build TauCetiRoadmap.ColemanIntegrationPartII.Suggested`.

Exact final outcome:

```text
Build completed successfully (8989 jobs).
```

Warnings: **15**, all saying “declaration uses `sorry`” for the 15 theorem targets; zero other warnings and zero errors. All eight example blocks are proved. The final file contains seven real-bodied definitions/abbreviations and 416 lines. Its single Mathlib import and two individual Tau Ceti imports exist at the manifest pins. The actual dependency checkouts match Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

Every admitted target was also probed with its fully explicit `#check @name` form through the targeted module build. The probes were removed before the final build. There are no section-variable blocks; all field, characteristic, finite-type, smoothness, separatedness and connectedness assumptions remain in the elaborated types. These are checks of statements and examples, not proofs of the admitted mathematics.

Exact push-gate summary:

```text
gate ColemanIntegrationPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 check-labels-missing=0 empty-sections=0 round-labels=0 long-fences=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Earlier gate invocations exposed the expected dirty-tree failure and two raw-underscore TeX hits in the added Weil-restriction notation. The notation is now Unicode. The exact requested invocation was repeated on the final clean commit. `git diff --check` passed.

The separate prescribed dependency-direction command produced:

```text
depcheck: 4 roadmaps, 27 edges, 0 problem(s)
```

No UPWARD or CYCLE line occurs. The summary counts the checker's selected scope, not the whole upstream dependency graph. The additional Weil-restriction supplier is earlier in the order; no notion moved down from a later roadmap.

## Draft pull request body

This roadmap extends good-reduction Coleman integration to natural single integration over every closed subfield of ℂ_p and identifies its harmonic realization on arbitrary-reduction curves. It builds logarithmic annular double and triple indices, the graph-corrected global double pairing, wide-open triple sums and their pairing on actual Coleman one-forms, with branch, trace, divisor and model-descent laws. These interfaces supply the local integration and pairing theory needed by arithmetic height and regulator applications, including nonsplit poles, loops and parallel edges, and every prime.

AI assistance: Codex (GPT-6) performed the port, source and supplier inspection, example repairs and author-side mathematical audit. This report does not claim a new independent review.

## Dependencies still in pull requests

The direct suppliers absent from main are listed by roadmap name:

- ResolutionOfSingularitiesCharacteristicZero, §6.2.
- PadicPeriodRings, §§1.1–1.2.
- ReductiveGroupsPartII, §§RG2.0a.1–RG2.0a.2.
- PadicDifferentialEquationsAndRigidCohomology, §§RD.4.31–RD.4.33, RD.5.76, RD.6.1, RD.6.86, RD.6.88 and RD.6.92.
- ColemanIntegration, L0 and the exact L1 contracts specified in the README.
- AnabelianGeometryAndNonabelianChabauty, §5.8.

The Lean imports none of these roadmap modules. AlgebraicCurves, FormalLaurentPuiseux, RigidAnalyticGeometry, StableReduction, JacobianChallenge, EllipticCurves and ModularCurves are read at main; revisions or progress reports on an existing roadmap do not become dependencies.

## Port changes and upstream-review fixes

1. Applied the accepted review's attribution correction in §4.0e: `Curve.jacobianIntegrationBridge` constructs the Abel–Jacobi differential identification from the Jacobian tangent comparison and curve duality. JacobianChallenge Layer B is now named alongside Layers D–F, both locally and in the supplier contract. The differential identification remains an explicit local target. The source comparison remains colmez1998 line 3147 and colmez1998 line 3213; the curve application is besser-zerbes2017 line 142.
2. Replaced duplicate generic trace-torus construction with existing Weil restriction. ModularCurves §0F supplies the finite-presentation case. ReductiveGroupsPartII §RG2.0a.1 `weil-restriction-finiteness` supplies the determinant-norm open and change-of-basis presentation; §RG2.0a.2 supplies its group structure, `WeilRestriction.multiplicativeGroupPoints`, smoothness and separable splitting. The standalone `logTraceTorus_points` restatement is deleted. Section 4.0c retains the additional invariant trace forms, their scalar and rational-function pullbacks, and the fixed-field uniqueness argument. The mathematical norm-chart examples are preserved as Checks. The README records this ownership only in Scope and ownership and cites the precise supplier contracts when consuming them.
3. Replaced ten ambiguous uses of “finite-field” with “finite p-adic field”: the hypotheses are finite extensions of ℚ_p, not fields of characteristic p. No coefficient generality changed.
4. Replaced the References sentence claiming that a manifest accompanies the roadmap. Only the requested three files are ported; the bibliography now identifies its versioned extraction locators and independent theorem/page locators directly. The source manifest stays in the source package.
5. Repaired the actual example proofs. In the triangle proofs, simplifying an impossible loop hypothesis and then the remaining goal avoids the pinned tactic's “No goals to be solved” errors. Finite `ZMod 3` and `ZMod 2` equalities use decision proofs after simplification. Two coefficient contradictions use `simp ... at` to avoid unnecessary-`simpa` warnings. No example statement, theorem signature, real definition or admission count changed. The final build has only the 15 intended admissions.

6. Corrected the domain in §4.0d’s finite-degree target: the source wording put forms α,β on Y but called their pairing B_X before pullback. The definition now introduces B_C on forms on each curve C and states the degree law for pullbacks of forms on Y. This is a typing clarification, with the same ramification multiplicities and hypotheses (besser2005 line 365).

7. Converted the added restriction-of-scalars notation to Unicode after the gate detected its raw underscores. No formula or target changed.

## What moved from Lean to README

Nothing. The source Lean file already uses available carriers and real bodies, with headline signatures in Layers 1, 2 and 4 and the scalar branch-specialization definition in Layer 7. All seven definitions/abbreviations, all 15 theorem signatures and all eight example blocks are retained. Missing analytic, natural-integration, semistable and triple-primitive carriers continue to have full README targets; no weakened or admitted-data substitute was introduced.

## Supplier verification and duplication sweep

The sweep covered every active and completed roadmap at `93f0505` and all **312 open pull-request heads**, identified read-only. All 312 head objects were locally available. Main plus changed/added README and Suggested sources at those exact heads gave **1,182 distinct source blobs**; object searches matched **80 paths**. The three supplied model heads were included. Searches covered logarithmic primitives and residues, annular indices, harmonic cochains, Albanese, abelian logarithms, natural integration, fixed closures, field trace, Weil restriction and norm tori, followed by reads of the relevant contracts. Irrelevant uses of complex harmonic analysis, operator-theoretic Coleman transforms and annular operator algebras were not treated as overlap.

| Object | Verified supplier | Port result |
| --- | --- | --- |
| p-adic fields and completed algebraic closure | Mathlib `Padic`, `PadicComplex` and the listed norm, completeness and algebraic-closure declarations | Retained native carriers; no integration theorem inferred from them. |
| Graph incidence and simple Laplacian | Mathlib `Graph`, `Graph.IsLoopAt`, `Graph.banana`, `SimpleGraph.lapMatrix` and its kernel/nullity API | Metric multigraph extension and the signed simple-graph adapter are distinct targets. |
| Simple-graph cochains and quotient | Tau Ceti `SimpleGraph.oneCochains`, `coboundary`, `FirstCohomology`, coefficient and relabelling maps | Native quotient and functoriality stay supplied; only value-preserving and signed bridges are planned. |
| Laurent carrier, derivative and singleton coefficients | Mathlib `LaurentSeries`, `LaurentSeries.derivative`, `hasseDeriv_coeff`, `hasseDeriv_single`, `HahnSeries.map` and singleton coefficient API | Degree-one logarithmic presentation and indices are additional constructions. |
| Formal substitutions, residues and primitives | FormalLaurentPuiseux L1–L3 | Retained the package's supplier replacement; no second formal residue-calculus development. |
| Point completions, geometric residues and proper reciprocity | AlgebraicCurves Layers 5 and 9 | Retained exact general-residue contracts; analytic finite-map and point-germ adapters remain local. |
| Analytic logarithmic algebra and good-reduction integration | ColemanIntegration L0.A1–L0.A2, L0.11–L0.23; L1.2–L1.3, L1.17–L1.19, L1.17a, L1.43 | Only formal/general-coefficient logarithmic extensions, component adapters and full analytic Coleman coefficients are added. |
| Albanese predicate and curve Jacobian | Tau Ceti `AbelianVariety.IsAlbanese`, `.homEquiv`, `.uniqueUpToIso`; JacobianChallenge Layers B and D–F | Higher-dimensional existence and rational-form reduction remain local; curve differential comparison attribution repaired. |
| Abelian logarithms | AnabelianGeometryAndNonabelianChabauty §5.8, including `.cp` | Finite-model logarithms stay supplied. `abelianLogCp` covers arbitrary ℂ_p-defined abelian varieties. |
| Continuous action and fixed closure | PadicPeriodRings §§1.1–1.2 | Closed-subfield adapter and geometric primitive descent remain local. |
| Norm-open restriction of G_m | ModularCurves §0F; ReductiveGroupsPartII §§RG2.0a.1–RG2.0a.2 | New duplication removal: norm chart, group and point construction imported; retain trace-form adapter. |
| Trace, norm and uniqueness of extended norms | Mathlib `Algebra.trace`, `trace_trace`, `trace_eq_sum_embeddings`, `Algebra.norm`, `norm_eq_matrix_det`, `norm_ne_zero_iff`, `spectralNorm_unique_field_norm_ext` | Finite-free and separability conditions checked; only applications to primitives and complete scalar indices are added. |
| Rigid comparison, weights and Frobenius | PadicDifferentialEquationsAndRigidCohomology exact RD sections listed above | Retain semistable Čech, graph and index comparisons as additions. |
| Models, compactification and Tate points | StableReduction exact layers; ResolutionOfSingularitiesCharacteristicZero §6.2; EllipticCurves Layer 4; RigidAnalyticGeometry exact sections | No generic model, compactification or point-uniformization reconstruction; retain integration/differential adapters. |

No additional harmonic or local-index owner was found. No dependency on QWittVectors, ErdosProgressionPowers or ArithmeticDynamics was introduced. No removal is represented by a stub in a layer.

## Adversarial mathematics pass

Each subsection row covers its defining objects, every named API theorem and construction, its hypotheses, and the conventions used by those statements. The rows record calculations and mathematical inspection; they do not assert completion of the future proofs. The zero ring is tested only for the generic commutative-ring affine value space; field hypotheses exclude it elsewhere.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Standing coefficient, orientation and trace conventions | p=2,3; ramification e=2; edge reversal; quadratic scalar trace | Branch increment 2 gives 2/e; tail-minus-head gives −3; index order gives B(1,L)=1; complete scalar index traces to 2 | Clarified finite p-adic field wording |
| §1.1 `LengthCochains`, divergence and signed native bridges | Empty graph; isolated vertex; one edge with values 2,5; loop; length 1/2 | d=−3 versus native coboundary +3; loop flags cancel; weighted product of 2,3 is 12, divergence of 2 is ±4 | Repaired proved native triangle checks; no mathematical change |
| §1.2 harmonic projection, rank, decomposition and quotient bridge | Tree; two isolated vertices; rational cyclic triangle (3,0,0); characteristic-three triangle | Harmonic part (1,1,1); exact part (2,−1,−1); componentwise constants; characteristic-three counterexample confirms CharZero | Decision proofs make the negative control compile |
| §1.3 metric subdivision and residue invariance | Jump 6 split 1/3,2/3; identity; attached tree | Jumps 2,4 sum to 6 and preserve weighted product; tree harmonic part vanishes | None |
| §2.0 residue transport and point-germ comparison | z=t²; z=t⁻¹; identity; quadratic point; infinite negative Laurent tail | Residues 2,−1,1; trace 2; infinite negative tails excluded from bounded-below formal carrier | None |
| §2.1 logarithmic space, polynomial inclusion and differential | Constants; L; z⁻²; L²; characteristic-two z² | Kernel exactly scalars only in characteristic zero; primitive of z⁻² is −z⁻¹; X² outside degree-one image | Repaired coefficient and ZMod 2 proofs |
| §2.1a general analytic coefficients | ℚ₂; ℚ₃; trivial rational norm; closed annulus boundary | Characteristic-zero denominators are nonzero; interior radius margins absorb their growth; boundary convergence is not asserted | None |
| §2.2 double index, uniqueness, bilinearity and constant law | (1,L), (L,1), (z,z⁻¹), (L,L), two scalar shifts | Values 1,−1,−1,0; difference a Res(dG)−b Res(dF); integration by parts gives the second-slot minus sign | None |
| §2.3 double-index transport | Degree two; identity; reversal; coefficient embedding | Factors 2,1,−1; whole scalar coefficient extension agrees with residue extraction | None |
| §3.0a component Coleman domains | Smooth fibre; xy=π; self-node; pole on overlap | Smooth case recovers base; node orientations opposite; self-node needs subdivision; separated poles exclude singular overlap | None |
| §3.0b full analytic coefficient extension | Transcendental geometric-series coefficient; zero derivative; log z; residue-disc indicator | Full coefficients exceed finite tensor sums; global constant kernel excludes independent disc indicators | None |
| §3.0c Čech comparison, χ, N, cup and Frobenius | Smooth positive genus; total coboundary; diag(1,q); residue field 𝔽₄; residue-degree-two extension | Proper H¹ survives χ=N=0; coboundaries map to zero; Nφ=qN; identity coefficient lift requires a power of 4 over 𝔽₄ | None |
| §3.1 wide-open double end-sum and restriction | Zero form; rational core; proper second-kind cup value 1; filled nonsingular disc | Constant changes cancel by total residue; values 0 and 1 distinguish pairing; extension hypothesis controls excision | None |
| §3.1a cohomology projection, reciprocity and spectrum | Analytic exact; G_m dlog; degree-two reduced boundary over 𝔽₃ | Radical value 0; nonsplit eigenvalue −3 squares to 9; reciprocal 1/3 absent | None |
| §3.2 harmonic primitive data and jumps | Bridge jump 2; single component; cyclic triangle; common constant | Component shift kills bridge jump; cycle survives; ambiguity is one scalar on connected graph | None |
| §3.3 auxiliary graph correction | c=2,d=3,rη=5,rω=7; reversal; one component constant shift | Correction −11, invariant under reversal; arbitrary component shifts change both sides equally | None |
| §3.4 corrected pairing, proper cup and refinement | ℙ¹; proper second-kind cup value 1; total coboundary; split metric segment | Values 0 and 1; exact representatives vanish; length factor in N cancels inverse metric pairing weight | None |
| §3.5 Frobenius and monodromy laws | N=0; symplectic plane; identity in place of φ; q=2 and q=4 | diag(1,q) scales by q; N terms give 1−1; arbitrary identity fails scaling when q≥2 | None |
| §4.0 geometric abelian logarithm | Dimension zero; torsion; small nonzero tangent; transcendental-j elliptic curve | Values 0,0,v; local inverse not global inverse; arbitrary ℂ_p models exceed finite-model supplier | None |
| §4.0a abelian primitives and finite differences | Zero variety; invariant form; df; quadratic normalized trace | Logarithm and exact evaluation have required differences; unnormalized trace would multiply by 2 | None |
| §4.0b proper Albanese, descended logs and rational-form reduction | Point; ℙ²; A¹ dt; G_m dt/t; nonsplit quadratic poles; transcendental pole | Proper Albanese zero in rational examples; exact and log subspaces differ; traced generator covers quadratic poles; finite-algebraic span cannot create transcendental pole | None |
| §4.0c natural theory, trace forms, fixed-field descent and uniqueness | Equal endpoints; A¹; G_m; L=K; quadratic norm chart; completed unramified and nondiscrete fields; nonclosed ℚ̄_p | Values 0,b−a,T; norm-zero point excluded; trace form pulls back to dt/(t²−2); torsion open quotients avoid compactness; nonclosed coefficient counterexample retained | Imported norm-open group and point theory; retained differential adapter |
| §4.0d natural reciprocity, degree and projection | Nonzero constant f; f=0; dt with (t−a)/(t−b); z=t² | Constant divisor gives 0; f=0 excluded; infinity residue a−b; ramification multiplicity 2 retained | Clarified pairing domains before pullback |
| §4.0e Jacobian differential/topology bridge | Genus zero; split multiplicative elliptic curve; noncompact K× valuation | Zero genus-zero value; proper Jacobian compact without good reduction; noncompact valuation counterexample excluded | Corrected ownership of differential identification |
| §4.1 dlog residues and orthogonality | xy=π with f=x; nonzero constant f; f=0; rational exacts | Residue 1 equals head order minus tail order, namely −d(ord); constants give 0; harmonic-exact orthogonality applies | None |
| §4.2 smooth-residue harmonic comparison and divisors | Tree; cycle; df; dlog f; Tate valuations 1/3,2/3 | Tree jumps vanish; cycles survive; corrections −1/3 and −2/3 prohibit constant agreement across whole annulus | None |
| §4.3 valuation interpolation, reversal and base change | F_tail=2,c=6,t=1/3; reversed chart; ramification two | Both orientations give 4; refinement jumps 3+3 give 6 | None |
| §4.4 point-sum, exactness and constants | Empty boundary; holomorphic pair; proper second-kind representatives; cycle | Holomorphic sum 0; proper cup can be 1; graph correction essential | None |
| §5.1 labelled auxiliary data and its API | Three L functions; all zero functions; off-diagonal pair (1,−1) versus (1,0) | Half squares obey product rule; opposite constants allowed; incompatible pair fails | None |
| §5.2 triple index and characterization | (1,1;L); (z,z;z⁻²); (z,z⁻¹;L); three L functions | Values 1,−2,1,0; last uses nonzero 3, valid over ℚ₃ | None |
| §5.3 auxiliary constant laws | F=L,G=0,H=L; shifts 1,2; unused F,G entry | Changes −1,−2; unused pair no effect; zero function does not erase auxiliary choices | None |
| §5.4 simple-pole formula | (2+L,3;L); half-square data; parameter u=az | Value 6; pure-log value 0; constant term changes by −δ, full transported expression agrees | None |
| §5.5 triple-index transport | Degree two; identity; reversal; independent primitive shift | Factors 2,1,−1; untransported shift contributes residue error | None |
| §6.0 actual-form symbol and relation theorem | Analytic coefficient; nonzero symbol; G dC | Analytic tensors have zero symbol; nonzero symbol rules out zero actual form; G dC=0 | None |
| §6.1 global triple sum and global auxiliary choices | Zero data; rational core; positive genus with G=1 | Values 0,0,1; differential classes of all three functions cannot determine the value | None |
| §6.2 cancellation, constants, equality and shrinking | Global versus single-end primitive shift; second slot increased by 2 | Global residue error cancels; single-end error −1 survives; second-slot shift can add 2 | None |
| §6.3 Frobenius vanishing and iteration | Zero eigenclasses; q=2; residue-degree-two extension; F without eigencondition | Reciprocal functional eigenvalue 1/q excluded; both eigenconditions necessary; extension uses iterate | None |
| §6.4 actual Coleman-form pairing and relations | 1·dH; G dC; two presentations of d(GH) | Values B_U(F,H),0; equality of actual forms uses relation theorem | None |
| §7.0 Tate differential and charts | q=p³; n=1,2; q=1; p=2 | Final gluing subtracts log q and preserves dz/z; short cycles retain flags; q=1 excluded | None |
| §7.1 universal affine values, specialization and branch transport | Zero ring; arbitrary commutative ring; slopes 0,1,1/2; equal branches | Distributivity gives (λ′−λ)B; increment 2 gives 0,2,1; ring identity needs no field hypothesis | None |
| §7.2 proper holomorphic branch independence | ℙ¹; elliptic curves including transcendental j; nonproper G_m | Proper T coefficient zero; G_m dlog has slope 1 | None |
| §7.3 trace, tower, Galois and averaging | Identity extension; ramified quadratic at p=2; α²=π; equal endpoints | Tr(α)=0, Tr(α²)=2π; base scalar traces to degree times itself; averaging divides by nonzero degree | None |
| §7.4 degree-zero divisors and basepoint cancellation | Empty divisor; b−a; quadratic point minus 2[0]; incorrect degree | Values 0,I(a,b),π for t dt; degree-one error leaves basepoint dependence | None |
| §7.5 closed-point/end index trace and descent | Rational point; quadratic point; empty sum; product of traces | Trace 1 or 2; infinity −2 cancels; whole scalar index must be traced | None |
| §7.6 realization, models and wide-open descent | Good reduction; ramified splitting; common refinement; quadratic constant field | Intrinsic integral identifies realizations; scalar 1 over quadratic constants traces to 2; unrelated triple shifts remain excluded | None |
| §7.7 Tate normalization, periodicity and branch cancellation | q=p³,log(p)=1; multiplication by q; n=1,2; p=2 | F=log z−ν_p(z), jump −1; period and branch differences 0; n>0 justifies division | None |

### Representative Lean theorem audit

| Statement | Instances or argument | Result | Change |
| --- | --- | --- | --- |
| `Graph.simple_laplacian` | Potential (2,5) on one edge; zero graph | Outgoing native values +3,−3 equal negative Laplacian; explicit Field and CharZero binders retained | None |
| `Graph.simple_harmonic_exact_decomposition` | Tree, isolated vertices, rational triangle; ZMod 3 counterexample | Unique cochains, not unique potential; CharZero is essential | None |
| `LogarithmicFunctions.formal_primitive` | w=0,z⁻¹,z⁻² | Subtract residue term and import Laurent primitive, then add residue·L | None |
| `LogarithmicFunctions.differential_eq_zero_iff` | Constants, L, characteristic-two z² | Residue forces log coefficient zero; Laurent kernel then applies | Proved negative-control script repaired |
| `LogarithmicFunctions.differential_residue` | f+aL; a=0,1,3 | Derivative has zero residue; logarithmic residue is a | None |
| `LogarithmicFunctions.residue_zero_iff` | a=0 and a=1 | Zero-residue locus exactly Laurent pairs | None |
| `LogarithmicFunctions.toPolynomial_injective` | Scalar 2, L; polynomial coefficients 0,1 | Pair recovered over every field; no CharZero needed | None |
| `Annulus.doubleIndex_self` | Laurent part and log corrections | Residue of f df vanishes; corrections cancel | None |
| `Annulus.doubleIndex_add_left` | Zero and sum of two pairs | Differentiation and coefficient extraction are linear | None |
| `Annulus.doubleIndex_laurent_first` | Arbitrary f,G; f=1,z | Coefficient of f·z⁻¹ is coefficient zero of f | None |
| `Annulus.doubleIndex_laurent_second` | F=z+2L,g=z⁻¹; two Laurent monomials | Both B and −Res(g dF) are −1; general statement follows by integration by parts | None |
| `Annulus.doubleIndex_ext` | Laurent summands and multiples of L | Bilinearity and residue rule fix mixed terms; alternation fixes L,L | None |
| `Annulus.doubleIndex_add_constants` | One-sided shifts; both shifts | Difference aG₂−bF₂ with no cross term | None |
| `Annulus.doubleIndex_scalarExtension` | Identity and arbitrary field embedding | Derivative, products and coefficient extraction commute with coefficient map | None |
| `NaturalIntegration.properAlbanese_exists` | Spec k, ℙ², pointed proper curve, abelian variety | Proper Albanese exists in the stated characteristic-zero smooth finite-type class; pointed hypothesis and all morphism-property binders retained | None |

## Source and trust handling

The seven sources retain their exact numbered-result, printed-page and source-id line locators. The primary PDFs were inspected read-only; Colmez's legal Numdam PDF was extracted as text after the web viewer rejected its size. Source material was used as data, and no fetched code was executed. The inspected claims include colmez1998 line 246, colmez1998 line 2957, colmez1998 line 2982, colmez1998 line 3079, colmez1998 line 3169 and colmez1998 line 3376; besser2017 line 528, besser2017 line 738 and besser2017 line 807; besser-zerbes2017 line 88 and besser-zerbes2017 line 108; besser-dejeu2012 line 2277, besser-dejeu2012 line 2591 and besser-dejeu2012 line 2769; besser2005 line 355; vologodsky2001 line 1806; and serre1959 line 431. The source's p>2 restriction is used only for that Vologodsky comparison; the all-prime natural theorem uses Colmez. No suspicious passage asking for credentials, unrelated commands or an external write was encountered.

## Unresolved

None for this port. The admitted statements remain roadmap targets, and the new draft still requires the worker's check and human mathematical review. No background build or sweep process remains running.


Pull request: #1360 (roadmap/coleman-integration-part-ii at bd972d9)
