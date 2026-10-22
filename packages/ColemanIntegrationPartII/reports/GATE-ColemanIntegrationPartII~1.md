## H01 (CBirkbeck) — applied

TauCetiRoadmap/ColemanIntegrationPartII/Suggested.lean:57–109 replaces the unit-length simple-graph stand-in with the full positive-rational-length multigraph harmonic/exact decomposition and retains higher-dimensional proper Albanese existence; its only definitions are the two edge maps needed for the graph headline. The graph statement allows loops, parallel edges, disconnected and empty graphs, finite actual sets inside infinite ambient types, and every characteristic-zero field (besser2017 line 553; TauCetiRoadmap/ColemanIntegrationPartII/README.md:134–185).

## H02 (CBirkbeck) — applied

TauCetiRoadmap/ColemanIntegrationPartII/Suggested.lean:13–43 now identifies each remaining headline group and the missing metric-subdivision, analytic-annulus, Coleman, differential/cohomology, natural-primitive, auxiliary-primitive, Tate or divisor carrier it requires. The former Laurent/scalar and affine-value substitutes are absent; the actual integration, pairing, branch and descent theorems remain specified in the README, including the closed-subfield and all-prime scope of colmez1998 line 2957 and line 2996.

## H03 (CBirkbeck) — applied

TauCetiRoadmap/ColemanIntegrationPartII/Suggested.lean is reduced from 22 named declarations and eight value-computing examples to two headline theorems and two necessary real-bodied definitions, with no examples, basic API theorems or scalar specialization layer. The removed primitive, differential, double-index and branch arithmetic remains mathematical prose and discriminating Checks in TauCetiRoadmap/ColemanIntegrationPartII/README.md §§1.1–1.2,2.1–2.3,7.1, rather than admitted acceptance-test padding (besser-dejeu2012 line 2232 and line 2243).

## H04 (CBirkbeck) — applied

TauCetiRoadmap/ColemanIntegrationPartII/README.md:112 inventories the headlines, its API labels throughout Layers 1–7 are replaced by prose and bullets, and its references to deleted Lean examples are replaced by their mathematical values. The four local declaration names it still presents in backticks are exactly those declared in Suggested.lean; §§1.1–1.2 also state the new signatures' actual-set finiteness, incidence, positive-length and coefficient hypotheses and add parallel-edge and negative-weight controls.

## Verification record

### Elaborated signatures

I put explicit `#check @name` commands for all four declarations in one scratch signature file and elaborated those checks once through a temporary append to the permitted build target, then removed the checks and rebuilt the final file. Comparing the elaborated types with README §§1.1–1.2 and §4.0b found no dropped binders; no hypothesis repair was needed for the retained Albanese theorem.

| Declaration | Explicit elaborated binders and README agreement |
| --- | --- |
| Graph.edgeDifferential | Arbitrary V,E,k; additive commutative group k; native G; tail/head into G.vertexSet; vertex potential; no finiteness or field hypothesis. |
| Graph.edgeDivergence | Field k, CharZero k, native G, Fintype G.edgeSet, actual endpoint functions, positive rational length subtype, edge function and actual vertex. Finiteness of the vertex set is not required by this definition. |
| Graph.harmonic_exact_decomposition | Field k, CharZero k, Fintype G.vertexSet and G.edgeSet, tail/head and the explicit native IsLink hypothesis, positive rational lengths and arbitrary edge cochain. The unique pair consists of cochains; the potential remains existential. |
| NaturalIntegration.properAlbanese_exists | Field k, CharZero k, native Over(Spec k), Smooth, LocallyOfFiniteType, QuasiCompact, IsSeparated, GeometricallyConnected and a k-point. The conclusion uses the native abelian-variety and IsAlbanese carriers; source properness is not assumed. |

The incoming signature inventory's extra Annulus.in entry was a parser artifact from a comment, not a declaration; the initial file actually had 22 named declarations. No sorry'd data or substitute predicates were introduced.

### Source and pinned-library evidence

All seven works use their existing certified manifest keys in packages/ColemanIntegrationPartII/sources.toml; all were read from the supplied legal cached extractions. No additional source, manifest change or unresolved-reference request was needed.

| Mathematical issue | Resolved evidence |
| --- | --- |
| Harmonic/exact decomposition and orientation | besser2017 line 528 defines the tail-minus-head differential; line 545 defines outgoing divergence; line 553 states the characteristic-zero direct sum. Positive rational weights use the rational-matrix rank argument already specified in README §1.2, not an assertion that the source states arbitrary weights verbatim. |
| Proper Albanese existence | serre1959 line 83 and line 431 give the maximal-morphism and geometric Albanese construction; line 463 compares the rational and morphic versions on smooth varieties. Pointed descent and arbitrary-field comparison remain explicit targets and arguments in README §4.0b. Colmez's complex discussion at colmez1998 line 2083 is not used as an arbitrary-field existence theorem. |
| Basic formal/index facts belong in prose | besser-dejeu2012 line 2232 supplies the formal polynomial-logarithm setting; line 2243 characterizes the double index and line 2246 describes its elementary construction. The full labelled primitive data begin at line 2251, and the triple-index characterization is at line 2277. |
| Integration generality | colmez1998 line 2957 fixes a closed subfield of ℂ_p; line 2986 gives naturality and line 2996 gives existence/uniqueness. The arbitrary geometric abelian-variety case in the open-quotient proof is at line 3113. Vologodsky's p>2 convention is vologodsky2001 line 51, and the comparison with Colmez is line 1806; it is not substituted for the all-prime theorem. |
| Harmonic and annular comparison | besser-zerbes2017 line 74 and line 88 give harmonic normalization and smooth-residue comparison; line 95 distinguishes annular points after extension and line 108 gives the valuation correction. |
| Reciprocity and actual-form pairing | besser2005 line 355, line 365 and line 369 give principal-logarithm reciprocity, degree and trace projection. The global triple-choice cancellation and q-eigenspace vanishing are besser-dejeu2012 line 2546 and line 2591; actual-form relations and pairing are line 2769 and line 2776. |
| Native graph floor | Mathlib/Combinatorics/Graph/Basic.lean:90 defines vertexSet, edgeSet and IsLink with the incidence laws; it imposes neither finiteness nor nonemptiness and allows loops and parallel edges. The new definitions use these sets as subtypes, and the theorem explicitly binds their finiteness and incidence. |
| Existing graph matrix and cochains | Mathlib/Combinatorics/SimpleGraph/LapMatrix.lean:80 defines the simple Laplacian, line 125 gives its action, and line 283 gives real nullity. TauCeti/Combinatorics/SimpleGraph/Cohomology/Basic.lean:54,79,92,99 supplies the multiplicative cochains, coboundary, head/source division and quotient. These are imported contracts; no duplicate simple-graph matrix or quotient is defined here. |
| Native Albanese floor | TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95 bundles the group scheme, properness and geometric integrality. TauCeti/AlgebraicGeometry/AbelianVariety/Albanese.lean:84 requires pointedness and unique factorization, but neither assumes smoothness of X nor asserts existence for arbitrary X. Its already-proved identity and trivial-source cases are at lines 227 and 233; they are tests of the general target, not new acceptance theorems. |
| Missing-carrier claims | Object searches at the verified pins found no harmonic multigraph cochain theory or actual Coleman/Vologodsky/index declarations. The Coleman text matches in Tau Ceti are provenance comments in formal-group and power-series files. Existing polynomial/Laurent and Kähler algebra is not a native analytic-annulus, actual Coleman-form, semistable comparison or natural integration carrier; no replacement algebra on unrelated free variables is stated. |

The checked revisions are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, matching the content manifest. The remaining library names in the supplier contracts were located at these pins, including the generated/module-qualified names; the citation resolver's outside-library scan was unavailable, so its empty result was not used as evidence about library declarations.

### Ownership and supplier citations

Ownership was checked by object in main at 0ed4485, the board packages, the roadmap index and all twelve supplied open-work folders: ComputationalNumberTheory, ConformalMappingPartII, EffectiveClassNumbers, AbelianSchemesAndArithmeticModuliPartII, GanGrossPrasadUnitaryGroups, SelmerIwasawaCohomologyPartII, QSeriesPartitionsAndMockModularForms, K3SurfacesAndSymplecticBoundedness, CohomologyComparisonsPartII, QWittVectors, ErdosProgressionPowers and ArithmeticDynamics. CohomologyComparisonsPartII's scope and downstream interface explicitly leave integration and index formulas to this roadmap. No declaration uses a readable supplier roadmap's fully qualified declaration name.

ColemanIntegrationPartII owns the general graph theorem and higher-dimensional Albanese existence: JacobianChallenge Layer F owns the curve Abel–Jacobi universal property, and the pinned Albanese module owns the predicate and its formal consequences. Neither supplies this general existence theorem. FormalLaurentPuiseux retains formal substitutions, residue-zero primitives and scalar kernels; their elementary coefficient specializations were removed from the acceptance test. No construction or dependency moved between roadmaps.

Every cross-roadmap citation was resolved again, and the named contracts were compared with main for existing roadmaps and the indexed head for new supplier roadmaps. The resolved contracts are:

| Supplier | Verified sections consumed |
| --- | --- |
| AlgebraicCurves | Layers 5 and 9: complete DVRs, local expansions, geometric/traced residues and the proper residue theorem. |
| FormalLaurentPuiseux | L1–L3: substitutions, Laurent calculus, residues and primitives. |
| ColemanIntegration | L0.A1–L0.A2, L0.11–L0.12, L0.15–L0.23; L1.2–L1.3, L1.17–L1.19 including L1.17a, and L1.43. The finite/algebraic coefficient and common-Frobenius-power bounds remain explicit. |
| PadicPeriodRings | §§1.1–1.2: continuous Galois action and the closed-subgroup fixed-closure theorem. |
| AnabelianGeometryAndNonabelianChabauty | §5.8: abelian logarithms of finite-field-model varieties and their ℂ_p-point extension; good reduction only for its Coleman comparison. |
| PadicDifferentialEquationsAndRigidCohomology | RD.4.31–RD.4.33, RD.5.76, RD.6.1, RD.6.86, RD.6.88 and RD.6.92: comparisons, dimensions, linear Frobenius, Gysin and weights. |
| ResolutionOfSingularitiesCharacteristicZero | §6.2: smooth projective SNC compactification of smooth quasi-projective varieties in characteristic zero. |
| RigidAnalyticGeometry | §§1.3,2.3,6.2,8.1: coefficient extension, reduction, rigid geometry and analytification, retaining quasi-separatedness. |
| StableReduction | Layers 0–2,4–5,7,9: generic fibres, nodes and graphs, positivity, regularization/refinements, all-genus nodal reduction and section separation. |
| JacobianChallenge | Layer B and Layers D–F: curve duality, projectivity, Jacobian and pointed Abel–Jacobi with base change. |
| ReductiveGroupsPartII | RG2.0a.1–RG2.0a.2: norm-open Weil restriction, group/point maps, smoothness and separable splitting. |
| EllipticCurves | Layer 4: point-level Tate uniformization for a field unit q with norm <1; differential charts remain here. |
| ModularCurves | §0F: finite-locally-free affine Weil restriction, cited only for ownership. |

README shape was compared with the main-branch FormalLaurentPuiseux and EllipticCurves roadmaps and Completed/EffectiveBounds. The final citation scan reports no unresolved cross-roadmap citations or roadmap declaration references.

### Adversarial mathematics record

The rows retain the original target labels solely as audit identifiers for the prose in TauCetiRoadmap/ColemanIntegrationPartII/README.md; they are not claims that those labels are Lean declarations. Values are exact rational, coefficient, finite-dimensional or residue computations on the displayed instances. They test the statements and conventions; source arguments, rather than these examples or admitted elaboration, justify the general claims. The rational-length graph extension uses the rational weighted incidence matrix: positive conductances give the real componentwise-constant kernel, and rational matrix rank is preserved under extension to every characteristic-zero field.

| Statement | Instances tried | Values on the two sides, or distinguishing values | Result | Change |
| --- | --- | --- | --- | --- |
| Graph.LengthCochains | one loop, one bridge, empty graph | loop C¹=k and div=1−1=0; bridge div(2)=(2,−2); empty dimensions 0,0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| LengthCochains.mk | one loop with two flags | flag values (1,−1), reversal twice gives (1,−1); a single flag would force 1=−1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| LengthCochains.ext | bridge cochains 2 and 3 | forward values 2≠3 and reverse values −2≠−3; agreeing forward gives both (2,−2) | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| LengthCochains.div_d_adjoint | length 1/2, f=(2,5), c=2 | 2·4+5·(−4)=−12=(−3)·2/(1/2) | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| LengthCochains.map | reverse one bridge | c=2 becomes −2; outgoing currents stay (4,−4) at length 1/2 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| LengthCochains.simple_laplacian | one unit edge, f=(2,5) | div(df)=(−3,3)=L f | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| Graph.simpleDivergence | pinned coboundary on f=(2,5) | head−tail=3; divergence (3,−3)=−L f | Consistent; excluded cases distinguished | Acceptance-test padding removed; prose retained |
| LengthCochains.simpleCochainsEquiv | one edge, f=(2,5) | value map sends 3 to 3; signed chain map sends −3 to 3 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| Graph.harmonic_exact_decomposition | weighted triangle; parallel edges; loop; empty graph | h=(3/4,3/4,3/2), r=(9/4,−3/4,−3/2), h+r=(3,0,0), div h=(0,0,0); parallels (1,−2)+(2,2)=(3,0); loop 2=2+0; empty 0=0+0 | Consistent; excluded cases distinguished | Full multigraph headline added to Lean |
| harmonicProjection | unit triangle c=(3,0,0) | P(c)=(1,1,1); P(P(c))=(1,1,1); P(2,−1,−1)=(0,0,0) | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| harmonicProjection_changePotential | add exact (2,−1,−1) on triangle | P(3,0,0)=P(5,−1,−1)=(1,1,1) | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| rationalLaplacian_rank | one vertex, one edge, triangle | ranks 0=1−1, 1=2−1, 2=3−1; isolated pair has rank 0 and nullity 2 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| Graph.simple_harmonic_exact_decomposition | unit triangle and characteristic 3 control | (3,0,0)=(1,1,1)+(2,−1,−1); in 𝔽₃, (1,1,1)=d(0,2,1) has div 0, so uniqueness fails | Consistent; excluded cases distinguished | Simple specialization stays in README; full theorem in Lean |
| harmonicProjection_simpleCohomologyEquiv | triangle and tree | cycle period 1+1+1=3 in both quotients; bridge exact class 3 has class 0 in both | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| Graph.harmonic_subdivision | lengths 1/3,2/3, jump 6 | jumps (2,4), sum 6; energies 4/(1/3)+16/(2/3)=36=6² | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| harmonic_subdivision_comp | split one edge into halves then quarters | 6/2/2=3/2=6/4 on each quarter; total 6 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| harmonic_subdivision_residue | jump 6, residue 5, lengths 1/3,2/3 | 2·5+4·5=30=6·5; reversing both signs still gives 30 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| Annulus.residueTransport | z=t²; reversed parameter t⁻¹ | Res(dz/z)=2=2·1; reversal gives −1=−1·1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| residueTransport_degree | n=1,2,3 | Res(n dt/t)=1,2,3 respectively; n=0 excluded | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| residueTransport_germ | meromorphic form (z⁻²+3z⁻¹)dz | formal coefficient −1=3=analytic residue; coefficient trace over quadratic field gives 6 on both | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| Annulus.LogarithmicFunctions | F=2+3L and L² | dF=3dz/z, Res=3; d(L²)=2Ldz/z is outside Laurent differentials | Consistent; excluded cases distinguished | Acceptance-test padding removed; prose retained |
| LogarithmicFunctions.mk | (f,a)=(2,3) and (0,1) | 2+3L has coefficients (2,3); L has (0,1), distinct from scalar (1,0) | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| LogarithmicFunctions.ext | F=2+3L, F′=2+4L | constant coefficients both 2; L coefficients 3≠4, hence unequal | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| LogarithmicFunctions.toPolynomial | (2,0), (0,1), quadratic logarithm | images 2 and X, coefficients (2,0) and (0,1); X² has coefficient 1 at degree 2 versus 0 in every image | Consistent; excluded cases distinguished | Acceptance-test padding removed; prose retained |
| LogarithmicFunctions.differential | 2+3L, z² and scalar 2 | d(2+3L)=3z⁻¹; d(z²)=2z; d2=0 | Consistent; excluded cases distinguished | Acceptance-test padding removed; prose retained |
| LogarithmicFunctions.formal_primitive | w=z⁻²+3z⁻¹+4 | F=−z⁻¹+3L+4z gives dF=w and logarithmic coefficient 3=w₋₁ | Consistent; excluded cases distinguished | Acceptance-test padding removed; prose retained |
| LogarithmicFunctions.differential_eq_zero_iff | constant 2, L; characteristic 2 control | d2=0 and scalar coefficient 2; dL=z⁻¹≠0; over 𝔽₂, d(z²)=0 although its z² coefficient is 1 | Consistent; excluded cases distinguished | Acceptance-test padding removed; prose retained |
| LogarithmicFunctions.differential_residue | F=2+3L | Res(dF)=3=logarithmic coefficient; scalar 2 instead gives 0=0 | Consistent; excluded cases distinguished | Acceptance-test padding removed; prose retained |
| LogarithmicFunctions.residue_zero_iff | F=2 and F=L | residues 0 and 1; Laurent membership true for 2, false for L, in both directions | Consistent; excluded cases distinguished | Acceptance-test padding removed; prose retained |
| LogarithmicFunctions.changeParameter | formal lift δ=2, u=az | L_z=L_u−2 gives constant coefficient −2; dL_z=du/u, residue 1=1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| AnnulusLogRing.generalCoefficients | L²/2 and L³/3 over ℚ₂,ℚ₃ | d(L²/2)=L dz/z and d(L³/3)=L² dz/z; denominators 2,3 remain nonzero | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| generalCoefficients_primitive | constant differential dz and logarithmic polynomial Ldz/z | primitives z and L²/2; two choices z and z+2 differ by scalar 2 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| generalCoefficients_base | L over a complete subfield of ℂ_p | both supplied and extended derivations give z⁻¹dz, residue 1; both kill scalar 2 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| Annulus.doubleIndex | (1,L), (L,1), (z,z⁻¹) | values 1,−1,−1 from both the residue formula and explicit Laurent/logarithm expansion | Consistent; excluded cases distinguished | Acceptance-test padding removed; prose retained |
| doubleIndex_self | F=L, z, 2+3L | indices 0,0,0; logarithmic corrections for 2+3L cancel as 6−6=0 | Consistent; excluded cases distinguished | Acceptance-test padding removed; prose retained |
| doubleIndex_laurent_second | F=z+2L, g=z⁻¹ | B(F,g)=−1=−Res(z⁻¹(1+2z⁻¹)dz) | Consistent; excluded cases distinguished | Acceptance-test padding removed; prose retained |
| doubleIndex_ext | alternating residue-rule pairing at 1,L | forced values B(1,L)=1, B(L,1)=−1, B(L,L)=0; zero pairing fails 0≠1 | Consistent; excluded cases distinguished | Acceptance-test padding removed; prose retained |
| doubleIndex_add_left | F=1,F′=2,G=L | B(3,L)=3=1+2 | Consistent; excluded cases distinguished | Acceptance-test padding removed; prose retained |
| doubleIndex_reverse | F=1,G=L | positive value 1; reversed value −1=−(1) | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| doubleIndex_add_constants | F=G=0 then G=L, A=1, B=0 | ΔB=1−0=1=1·1−0·0 | Consistent; excluded cases distinguished | Acceptance-test padding removed; prose retained |
| Annulus.doubleIndex_pullback | z=t² and z=t | B(1,2L)=2=2·B(1,L); identity gives 1=1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| doubleIndex_scalarExtension | ℚ→ℚ₂ and ℚ→ℚ₃, F=1,G=L | image of 1 is 1=B(1,L); no multiplication by extension degree | Consistent; excluded cases distinguished | Acceptance-test padding removed; prose retained |
| doubleIndex_shrink | F=1,G=L on common smaller annulus | residue coefficient 1 remains 1, hence B=1=1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| Semistable.colemanCover | smooth fibre; nodal xy=π | smooth case has 1 core and 0 connecting ends; node has two end residues +1,−1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| colemanCover_restrict | dlog x on node ends | restriction then d and d then restriction give dx/x with residues +1,−1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| colemanCover_refinement | jump 6 and a quadratic subdivision | new jumps 3,3 add to 6; assigning 6,6 instead gives 12≠6 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| ColemanWideOpen.fullAnalyticExtension | analytic (1−αz)⁻¹; scalar and log | d2=0; dlog z=dz/z≠0; geometric coefficient α need not have finite K-span powers | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| fullAnalyticExtension_ker | scalar 2 and log z | derivatives 0 and z⁻¹; a two-disc indicator taking 0,1 is excluded from the connected Coleman algebra | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| fullAnalyticExtension_integrate | R=G=H=L on an end | primitive of LdL is L²/2; derivative coefficient in L is 1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| fullAnalyticExtension_map | base analytic functions 1,z | inclusion sends coefficients 1,1 to 1,1; d(z)=1 before and after inclusion | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| Curve.semistableDeRhamComparison | smooth elliptic fibre, empty boundary | graph ranks 0, χ=N=0; proper H¹ has dimension 2, so graph alone would give wrong dimension 0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| semistableDeRhamComparison_exact | genus-zero smooth fibre; Tate cycle | genus-zero sequence is 0→0→0; Tate graph H¹ has dimension 1 and χ restricts as 1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| semistableDeRhamComparison_cup | ordered symplectic basis α,β | α∪β=1=local-primitive sum; reversed order gives −1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| semistableDeRhamComparison_operators | φ=diag(1,2), N(e₂)=e₁ | Nφ(e₂)=2e₁=2N(e₂); χφ(e₁)=e₁; N²(e₂)=0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| semistableDeRhamComparison_baseChange | unramified quadratic extension of ℚ₂ | geometric operator diag(1,2)²=diag(1,4); scalar extension alone still has eigenvalue 2≠4 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| ColemanWideOpen.doublePairing | rational core and positive-genus cup basis | rational end-sum 0; for cup-normalized α,β, end-sum 1=α∪β | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| doublePairing_eq_sum | F=∫α,G=∫β, cup value 1 | function notation and form notation both give 1; d1=0 gives 0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| doublePairing_constant_independent | end residues (1,−1), shift 2 | change 2·(1−1)=0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| doublePairing_restrict | fill a disc where both forms extend | new-disc residue contribution 0, so old value 1 becomes 1+0=1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| wideOpen_residue_sum_zero | annular rational wide open, dlog z | oriented residues +1,−1 sum to 0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| ColemanWideOpen.doublePairing_reciprocity | rational core; proper cup pair; nonsplit quadratic boundary | proper projection target dimension 0 gives 0; cup pair gives 1; boundary eigenvalue −3 squares to 9 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| doublePairing_analyticExact | analytic dz on rational core | class [dz]=0 and double pairing 0=0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| doublePairing_logUnit | G_m and f=z | [dlog z] is boundary; proper projection 0, pairing with every class is 0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| doublePairing_qRadical | q=2 and boundary class dlog z | φ[dlog z]=2[dlog z], pairing 0; forbidden reciprocal is 1/2≠2 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| Semistable.HarmonicPrimitiveData | bridge primitives (0,2), unit triangle jumps (1,1,1) | bridge normalizes to (0,0) with jump 0; triangle keeps jumps (1,1,1) | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| HarmonicPrimitiveData.mk | bridge potential a=(0,−2) | d a=2; c−d a=2−2=0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| HarmonicPrimitiveData.ext_mod_constant | two one-component primitives F and F+2 | difference 2 on every component; adding 2 on just one bridge component creates jump 2 and fails harmonicity | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| HarmonicPrimitiveData.linear | two normalized cyclic jump families (1,1,1), (2,2,2) | sum (3,3,3) has divergence (0,0,0); scalar zero gives (0,0,0) | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| HarmonicPrimitiveData.jump_change | F_tail=0,F_head=2, a=(0,−2) | new jump 0=2−(0−(−2)) | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| HarmonicPrimitiveData.jump_class | global form with f_e=0, F_tail=0,F_head=2 | χ=0−(0−2)=2=c | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| Semistable.auxiliaryDoubleIndex_formula | one connecting edge, c=2,d=3,rη=5,rω=7 | graph contribution 2·5−3·7=−11, equal to the constant-change residue expression | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| auxiliaryDoubleIndex_edgeReverse | negate all four edge quantities | (−2)(−5)−(−3)(−7)=−11, unchanged | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| auxiliaryDoubleIndex_changeConstants | shift F_head by 1, rη=5 | change of the edge correction is 1·5=5, matching the puncture-residue change with the paired-end sign | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| Semistable.correctedDoublePairing | graph term and order reversal | Bgraph=−11; exchanged inputs give +11=−(−11) | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| correctedDoublePairing_eq_aux | harmonic cω=cη=0 on good reduction | graph term 0; cup-normalized point sum 1=component pairing 1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| correctedDoublePairing_cup | proper symplectic basis | B_h(α,β)=1=α∪β; opposite order −1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| correctedDoublePairing_refinement | jump 6,residue 5, split into 2,4 | graph term 30=10+20; attached rational tail contributes 0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| correctedDoublePairing_ext | zero class represented by total coboundary | χ=0 and component cohomology class 0 give B_h=0; adding it leaves cup value 1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| Semistable.correctedDoublePairing_phi_N | B(e₁,e₂)=1, φ=diag(1,2), N(e₂)=e₁ | Frobenius value 2=2·1; skew-adjoint expression 1−1=0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| correctedDoublePairing_phi_iterate | q=2, second iterate | B(φ²e₁,φ²e₂)=4=2²·1; scalar extension alone yields 2 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| NaturalIntegration.abelianLogCp | dimension 0; small tangent vector v with ω(v)=1 | zero variety has log 0; local value ω(log(exp v))=1, excluding zero logarithm | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| abelianLogCp_openQuotient_torsion | zero abelian variety; torsion point order n | quotient has 1 element in dimension 0; n[x]=0 in quotient whenever [n]x lies in the open subgroup | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| abelianLogCp_unique | normalized local log versus doubled log | differentials 1 versus 2 on a one-dimensional tangent space; only 1 is allowed | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| abelianLogCp_functorial | identity and multiplication by 2 | log(id x)=log x; on v, log([2]exp v)=2v=d[2](v) | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| abelianLogCp_ofFiniteModel | finite-model elliptic curve, local v=1 after form evaluation | both geometric and supplied logarithms give 1, not [L:K]·1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| NaturalIntegration.abelianPrimitive | ω=df and invariant ω | based df integral f(b)−f(a); f=t,a=0,b=1 gives 1; invariant second difference 0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| abelianPrimitive_differenceSplitting | zero cocycle, n=1,2 | primitive 0 has first and second differences 0; additive log has second difference 0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| abelianPrimitive_square | invariant one-form | Δ_hΔ_kω=0 and normalized rational-log primitive 0; Δ_hΔ_k log=0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| abelianPrimitive_invariant | small invariant-form endpoint exp(v), ω(v)=1 | F(exp v)−F(0)=1=ω(log(exp v)); T coefficient 0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| abelianPrimitive_descent | K-rational exact form, quadratic extension | I(0,1;dt)=1 in both fields; normalized trace (1/2)Tr(1)=1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| NaturalIntegration.properAlbanese_exists | Spec k, ℙ², A¹, G_m, E×E | Albanese dimensions 0,0,0,0,2; on E×E the identity factors as id=id∘id, whereas zero map would give 0≠id | Consistent; excluded cases distinguished | Headline retained on native predicate |
| properAlbanese_functorial | identity on E×E; zero-dimensional source | comparison is id of dimension 2; zero source gives the unique homomorphism, cardinality 1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| NaturalIntegration.albaneseReduction | A¹ with dt, G_m with dt/t | Albanese part 0 in both; dt=d(t)+0, dt/t=0+dlog(t) | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| albaneseReduction_rationalForms | point and rational line | point quotient dimension 0; dt and dt/t both have quotient class 0 on the line | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| albaneseReduction_removeApparentPoles | zero form represented by df−df | primitive difference f−f=0 on the common domain extends as 0 across cancelling apparent poles | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| albaneseReduction_functorial | t↦t² on G_m | pullback dlog t=2dt/t and pullback of logarithm is 2log t, with derivative 2/t | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| albaneseReduction_primitiveDescent | K=ℚ₃, ω=dt, endpoints 0,1 | based geometric value 1 remains 1 under finite extension and Galois | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| descendedLogForms_add | dlog t plus 2dlog t | coefficient sums 1+2=3, yielding 3dt/t in the descended subspace | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| descendedLogForms_smul | c=1,a=0,2 and L=k | traced generator dt/t scales to 0 and 2dt/t; both coefficients 0,2 lie in k | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| descendedLogForms_split | α²=2, ω=dt/(t²−2), t=0,1 | trace partial fractions give −1/2 and −1, matching 1/(t²−2); at transcendental α over ℚ, finite-algebraic generators have residue 0 versus residue 1 of dlog(t−α) | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| descendedLogForms_tower | tower of degrees 2,2 on scalar 1 | iterated trace 2·2=4=direct degree-4 trace; normalized value 4/4=1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| SingleIntegral.naturalIntegration | A¹,dt and G_m,dlog t | I(0,1;dt)=1 with slope 0; I(1,p;dlog t)=T with slope 1, including p=2,3 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| singleIntegral_universalAffine | exact and logarithmic forms | coefficient pairs (1,0),(0,1); degree in T is 0 or 1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| singleIntegral_baseChange | K⊆L⊆ℂ_p, dt between 0,1 | values 1→1→1, versus unnormalized trace 2 for a quadratic extension | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| singleIntegral_goodReduction | good-reduction A¹ disc, dt between 0,1 | both constructions give endpoint difference 1−0=1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| singleIntegral_exact_log | f=t on A¹; f=t on G_m | I(0,1;df)=1; I(1,p;dlog f)=T; zero form gives 0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| singleIntegral_cp | transcendental-j elliptic curve, ω(v)=1 | I(0,exp v;ω)=1 and T coefficient 0; no finite-model hypothesis used | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| singleIntegral_closedFieldFixed | K=ℚ_p and K=ℂ_p; nonclosed ℚ̄_p control | fixed affine coefficients are respectively ℚ_p² and ℂ_p²; for nonclosed ℚ̄_p, invariants still ℂ_p², strictly larger | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| singleIntegral_geometricPrimitiveDescent | ω=αdt with α∈closed K, a=0,b=1 | based value α·(1−0)=α∈K; adding a non-K unbased constant changes value at a from 0 to that constant | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| singleIntegral_abelianOpenQuotient | zero abelian variety; torsion quotient element order n | quotient order 1 in dimension 0; nδ(x)=0 in torsion-free target forces δ(x)=0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| logTraceTorus_invariant | L=k, c=2, z=st | η=2dz/z; multiplication pullback is 2ds/s+2dt/t; dη=0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| logTraceTorus_pullback | α²=2, c=1/(2α), f=t−α, t=0,1 | trace-form coefficients −1/2,−1 equal coefficients of dt/(t²−2); z=0 has norm 0 and is excluded | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| singleIntegral_tracedLog_unique | L=K, c=2, z=p; quadratic c=0 | I(1,p;η_2)=2T=Tr(2log p); c=0 gives 0=Tr(0) | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| Curve.naturalIndexReciprocity | ω=dt, f=(t−1)/(t−2) on ℙ¹ | divisor integral −1; local indices at 1,2 sum −1, infinity contributes +1, total 0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| naturalIndexReciprocity_principal | same rational-line example | ∫_(f)dt=1−2=−1=Res∞(log f·dt) | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| naturalIndexReciprocity_constants | principal divisor [1]−[2], shift 3 | change 3·(1−1)=0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| naturalIndexReciprocity_finiteDegree | z=t² and dlog z at 0 | local B(1,2log t)=2=degree 2 times local value 1; global rational pairing 0=2·0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| naturalIndexReciprocity_projection | degree-two map z=t² and β=h*dlog z | Tr_h β=2dlog z; both global pairings 0 on the rational line, with local degree factor 2 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| naturalIndexReciprocity_rationalLine | f=t and g=t−a, a=0,1 | a=0 gives alternation 0; for a=1 the three local contributions at 0,1,∞ sum 0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| Curve.jacobianIntegrationBridge | ℙ¹; small elliptic point ω(v)=1 | J(ℙ¹)=0 and integral 0; elliptic integral 1=ω(log(exp v)) | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| jacobianIntegrationBridge_natural | elliptic class [exp(v)−0], ω(v)=1 | both integral and logarithm evaluation equal 1; basepoint change adds then subtracts the same value | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| jacobianIntegrationBridge_compact | ℙ¹ and multiplicative-group negative control | J(ℙ¹)(K) has 1 element and map value 0; valuation K×→K sends π to 1≠0, showing noncompact source cannot be used | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| jacobianIntegrationBridge_moving | zero divisor class | zero representative already avoids every pole set; degree 0 and integral 0 remain 0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| Semistable.dlog_residue_is_exact | xy=π, f=x | vertical orders (0,1) give −d(ord)=1=Res(dx/x); f=1 gives 0=0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| dlog_residue_orthogonal_harmonic | unit triangle, c=(1,1,1), potential (0,2,1) | residue cochain (2,−1,−1); scalar product 2−1−1=0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| Semistable.harmonicPrimitive_eq_singleIntegral | good reduction; Tate q=p³, log p=1 | one-component primitive differences 0 modulo a common constant; annular corrections at 1/3,2/3 are −1/3,−2/3, excluding whole-annulus constant comparison | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| harmonicPrimitive_divisor_eq | D=[b]−[a] for df, f(a)=0,f(b)=1 | both evaluations 1−0=1; common constant C contributes C−C=0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| harmonicPrimitive_goodReduction | one component and dt | graph jump space 0; both based primitives give 1 at endpoints 0,1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| Semistable.singleIntegral_on_annulus | F_tail=2,c=6,t=1/3 | F=2+6/3=4; boundary positions t=0,1 give 2,8 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| singleIntegral_annulus_reverse | same values, opposite parameter | 2+6/3=4=8−6·(2/3) | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| singleIntegral_annulus_baseChange | quadratic ramification, c=6 | new jumps (3,3), total 6; old valuation t=1/3 equals new valuation (2/3)/2 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| Semistable.globalDoublePairing_eq_pointSum | proper cup basis; Z empty with global holomorphic forms | second-kind point sum 1=B_h; holomorphic Z-empty sum 0 matches isotropic cup value 0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| globalDoublePairing_exact | ω=dt, rational line | cohomology class 0 and global sum 0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| globalDoublePairing_constants | global shift 2, residues (1,−1) | change 2·1+2·(−1)=0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| Annulus.TripleIndexData | three L functions; zero labelled functions | pair primitive L²/2 gives derivative Ldz/z and pair sum L²; at zero, opposite constants (1,−1) sum 0, unlike (1,0) | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| TripleIndexData.mk | R=S=L; R=0,S=L | diagonal primitive L²/2; off-diagonal entries 1,−1 satisfy 1+(−1)=0=RS | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| TripleIndexData.ext | same zero functions with entries (0,0) versus (1,−1) | entry values 0≠1 make the data unequal despite all function values 0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| TripleIndexData.changeConstant | zero pair shifted by C=2 | entries (2,−2) have derivatives (0,0), sum 0; shift is uniquely 2 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| TripleIndexData.pullback | z=t², R=S=L | primitive L²/2 pulls back to 2L_t²; derivative 4L_t dt/t equals (2L_t)d(2L_t) | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| TripleIndexData.linearCombination | R=L+L=2L | new diagonal (2L)²/2=2L²; derivative 4Ldz/z; merely adding two old diagonals gives L² and the wrong factor 2 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| Annulus.tripleIndex | (1,1;L), (z,z;z⁻²), (L,L;L) | values 1,−2,0 with compatible half-square data in the last case | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| tripleIndex_unique | same three generating triples | axioms force 1,−2,0; the zero operation fails 0≠1 on (1,1;L) | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| tripleIndex_symm | (1,2;L) and (2,1;L) | both values 2 by Res(2dz/z) | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| tripleIndex_threeTerm | (1,1;L) with mixed primitives L and 0 | cyclic terms 1,0,−1 sum 0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| tripleIndex_meromorphic | F=z,G=z⁻¹,H=L | T=1=Res(zz⁻¹dz/z) | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| Annulus.tripleIndex_changeConstant | F=L,G=0,H=L; C=1 | T changes 0→−1, difference −1=−1·Res(dL) | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| tripleIndex_changeBoth | Res dF=Res dG=1,C=2,D=3 | change −2−3=−5 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| Annulus.tripleIndex_simplePoles | F=2+L,G=3,H=L; relevant primitive constants 0 | T=2·3·1−1·0−0·0=6 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| tripleIndex_simplePoles_zeroConstantPrimitives | same simple-pole triple; all L triple | values 6=2·3·1 and 0=0·0·1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| Annulus.tripleIndex_pullback | z=t² and orientation reversal | T(1,1;2L)=2=2·1; reversed oriented value −1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| tripleIndex_pullback_comp | degrees 2 then 3 | T becomes 6=3·(2·1); identity degree 1 leaves value 1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| ColemanWideOpen.formSymbolRelations | analytic g=z, and η=dz | [dg]=0, so symbol [dg]⊗η=0; a nonzero pure tensor cannot be symbol of zero form | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| formSymbolRelations_kernel | tensor z⊗dz minus itself | product 0 and symbol 0−0=0; relation lies in analytic tensors | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| formSymbolRelations_restrict | zero form GdC, C=2 | form 0 and symbol [dG]⊗0=0 before and after restriction | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| ColemanWideOpen.tripleIndex | rational wide open; cup-normalized positive genus | rational T(F,1;H)=0; positive-genus T(F,1;H)=1=B_U(F,H) | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| tripleIndex_eq_endSum | zero functions, global zero auxiliary choices | all local indices 0; finite end-sum 0=global value 0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| tripleIndex_globalChoices | R=S=L on ends | global primitive class of RdS restricts to L²/2 plus a constant; reversed entry sums to L² | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| ColemanWideOpen.tripleIndex_laws | global shift C=2, residues (1,−1) | auxiliary change −2(1−1)=0; constant second slot 2 with B=1 gives T=2 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| tripleIndex_congr | zero global functions with two global auxiliary choices | residue sum 0 makes both values 0; local-only shift would instead give −1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| tripleIndex_add_const_second | B_U(F,H)=1,C=2 | ΔT=2=2·1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| tripleIndex_const_third | C=1, B_U(F,G)=1 | T(F,G;1)=−1−(−1)=0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| tripleIndex_restrict | one added nonsingular disc with extending data | new-disc total 0; old T=1 becomes 1+0=1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| ColemanWideOpen.tripleIndex_frobenius_vanishing | F=0, q=2; negative control G=1,B(F,H)=1 | valid F=0 gives T=0; dropping F eigencondition allows T=1≠0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| tripleIndex_frobenius_iterate | q=2,a=2; zero eigenclass | degree 4=2² and T=0; under residue degree 2 geometric eigenvalue is 4 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| ColemanWideOpen.colemanFormPairing | B_U(F,H)=1; scalar C=2 | P(F,1·dH)=1=T(F,1;H); P(F,GdC)=0=T(F,G;C) | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| colemanFormPairing_unique | one generator dH with B_U(F,H)=1 | forced value 1; a pairing assigned 0 on this generator fails 0≠1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| colemanFormPairing_relation | GdH−GdH=0 | T(F,G;H)−T(F,G;H)=0; zero third differential gives 0 separately | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| colemanFormPairing_restrict | extending generator with value 1 | restricted value 1=original 1; newly excised regular disc contributes 0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| TateCurve.uniformizationDifferential | q=p³, invariant dz/z | q-multiplication pullback d(qz)/(qz)=dz/z; last gluing log(z/q)−log z=−3 when log p=1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| uniformizationDifferential_pullback | z↦qz, q≠0 | coefficient q/(qz)=1/z; residue 1=1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| uniformizationDifferential_charts | Tate valuation n=1,2,3 | dual graphs have respectively 1 loop, 2 parallel edges, 3-cycle; cyclic total jump always −log q | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| SingleIntegral.branchTransport | I=(0,1), λ=0,λ′=2; ramified slope 1/2 | changes 2−0=2 and 1−0=1; exact slope 0 changes by 0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| branchTransport_comp | parameters 0→1→2, slope 1/2 | increments 1/2+1/2=1=(2−0)/2 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| branchTransport_exact | dt from 0 to 1; dlog t from 1 to p | branch slopes 0 and 1; corresponding changes under Δλ=2 are 0 and 2 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| SingleIntegral.properHolomorphic_branchIndependent | ℙ¹; small elliptic point with ω(v)=1 | values 0 and 1 respectively at both λ=0 and λ=2; slopes 0 in both | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| properHolomorphic_universalCoefficient_zero | holo elliptic integral 1 | universal pair (1,0); T coefficient 0, not 1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| SingleIntegral.coefficientTrace | quadratic L/K, ω=dt, endpoints 0,1 | Tr(I_L)=Tr(1)=2=I_K(Tr dt)=I_K(2dt) | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| coefficientTrace_tower | degrees 2,2, scalar integral 1 | Tr_direct(1)=4=Tr(Tr(1))=2·2 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| singleIntegral_galois | α²=π, integral α of αdt from 0 to1 | σ(I)=−α=I(−αdt); coefficient of T=0 remains 0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| primitive_galois_average | quadratic conjugate basepoints ±α, ω=dt | averaged primitive ((t−α)+(t+α))/2=t; nonaveraged trace gives 2t | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| Curve.divisorSingleIntegral | quadratic point α²=π and D=[α]−2[0] | degree 2−2=0; for ω=t dt value α²/2+(−α)²/2=π | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| divisorSingleIntegral_split | D=[1]−[0], ω=dt | divisor evaluation 1−0=1=I(0,1;dt) | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| divisorSingleIntegral_ext | [1]+[1]−2[0] versus 2[1]−2[0] | both degrees 0 and values 2; regrouping changes 1+1 to 2 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| divisorSingleIntegral_add | D₁=[1]−[0], D₂=[2]−[1], ω=dt | I(D₁+D₂)=2=1+1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| divisorSingleIntegral_baseChange | D=[α]−2[0], α²=π, ω=t dt | geometric split values π/2+π/2=π, same as descended value π | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| Curve.tracedLocalIndexSum | quadratic residue field, local B=1 | local trace 2=1+1; tracing inputs separately would give B(2,2L)=4≠2 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| tracedLocalIndexSum_split | quadratic local scalar index 1 | trace 2=sum of conjugate values 1+1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| tracedLocalIndexSum_tower | residue-field tower degrees 2,2 | Tr_direct(1)=4=Tr(Tr(1)) | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| tracedLocalIndexSum_congr | local constant/log pair under orientation-preserving parameter | B(1,L)=1; quadratic traced value 2 before and after coordinate change | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| tracedLocalIndexSum_bilinear | proper cup basis value 1, scalar 2 | traced global value scales to 2; exchanged inputs give −1; self-pair gives 0 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| tracedEndIndexSum | quadratic end field, local triple scalar 1 | trace 2 equals geometric end sum 1+1; constant field cannot be silently replaced by K | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| Curve.integrationRealization_descent | good reduction and quadratic divisor example | graph correction 0 in good reduction; divisor value π survives further refinement with contributions π/2+π/2 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| integrationRealization_commonExtension | two realizations of exact dt integral | values 1 and 1 embed as 1 in common field; no trace multiplication to 2 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| integrationRealization_divisor | D=[α]−2[0], ω=t dt | any temporary basepoint contributes −F(a)·(2−2)=0; resulting value π | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| wideOpenIndex_galoisDescent | quadratic constant field, local/global scalar 1 | K-valued trace is 2=1+1; coefficient-fixed value 1 itself remains 1 under embeddings | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| TateCurve.singleIntegral_normalization | q=p³, log p=1 | F(z)=log z−ν_p(z); F(1)=0; cyclic jump −3/3=−1 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| TateCurve.singleIntegral_q_periodic | n=3 and n=1,2 | F(qz)−F(z)=3−(3/3)3=0; n=1,2 give n−n=0; q=1 has n=0 and is excluded | Consistent; excluded cases distinguished | API label → prose; mathematics retained |
| TateCurve.singleIntegral_branch | e=2,n=3,νπ(z)=1, Δλ=2 | change 2(1/2−(1/3)(3/2))=0; same cancellation for n=1,2 | Consistent; excluded cases distinguished | API label → prose; mathematics retained |

| New edge differential, README §1.1 / Suggested.lean:57 | one edge, f=(2,5); loop; zero module | df=−3; loop df=2−2=0; zero-module differential 0 | Sign and zero cases agree | Simple real-bodied definition added |
| New weighted divergence, README §1.1 / Suggested.lean:65 | edge length 1/2, c=−3; one loop c=2 | edge divergence (−6,6); loop current 4−4=0 | Weight and both loop flags retained | Simple real-bodied definition added |
| New edge-map additivity and scalar law, README §1.1 | bridge potentials (2,5)+(1,1), scalar 2 | d(3,6)=−3=(−3)+0; d(4,10)=−6=2(−3); div(2+3)=(10,−10)=(4,−4)+(6,−6) at length 1/2 | Both maps have the stated linear laws | Prose API added |
| New orientation comparison, README §1.1 | reverse bridge with f=(2,5), length 1/2 | df goes −3→3; vertex divergence remains (−6,6) | Reorientation preserves the represented map | Prose API and Check added |
| Incidence and actual-set conventions, README §1.1 | ambient ℕ, vertices {0,1}, edge {7}; incompatible endpoint assignment | f=(2,5) still gives −3; extra ambient coordinates count 0; assigning edge 7 both endpoints 0 fails its native link predicate | Actual sets, not ambient finiteness; bad orientation excluded | Explicit incidence binder and scope explanation |
| Positive lengths and characteristic zero, README §1.2 | two parallel edges; lengths (1,−1); or length (1,1) in 𝔽₂ | exact cochain (1,1) has current 1−1=0 or 1+1=0; pairs (c,0) and (0,c) both reconstruct c | Dropping either condition destroys uniqueness | Negative-control Checks added; nonpositive lengths excluded by subtype |
| Characteristic-three uniqueness control, README §1.2 | unit triangle over 𝔽₃, f=(0,2,1) with tail-minus-head differential | df=(1,1,1)≠0 and div(df)=(0,0,0); decomposition pairs (df,0) and (0,df) differ | Characteristic-zero binder necessary | Existing Check retained as prose |
| Albanese pointedness and nontriviality, README §4.0b | Spec k; E×E; no chosen rational point | trivial source has one pointed map and Albanese dimension 0; id on E×E has dimension 2 and cannot factor through 0; absent basepoint supplies 0 inputs to this pointed theorem | Native universal property excludes the wrong zero model | No weakening to curves or proper sources |
| Smooth-source convention, README §4.0b | Spec(k[ε]/ε²) versus Spec k | ε²=0 with ε≠0 excludes smoothness of the thickening; Spec k has tangent dimension 0 and satisfies the theorem | Nonreduced thickening is outside the signature | Smoothness binder retained |
| Coefficient class and universe conventions | zero ring; ℚ₂,ℚ₃; nonabelian S₃ | zero ring has 0=1 and cannot be a Field; rational weighted triangle uses 3/4 in both ℚ₂,ℚ₃; (12)(23)=(123)≠(132)=(23)(12) excludes S₃ as additive commutative coefficients | No good-prime, finite-ambient-type or nonabelian loophole | Explicit native typeclasses and actual-set finiteness |
| Removed simple Laplacian theorem | one unit edge, potential (2,5) | native coboundary 3 has divergence (3,−3)=−(−3,3) | Negative native sign and positive roadmap sign agree | Basic identity stays in README |
| Removed polynomial injectivity theorem | degree-one pairs (2,0), (0,1); candidate X² | coefficient vectors (2,0),(0,1) are distinct; degree-2 coefficient is 0 versus 1 | No quadratic-logarithm stand-in | Elementary injectivity stays in README |
| Removed Laurent-first double-index theorem | f=1,G=L and f=z,G=z⁻¹ | B(1,L)=1=Res(dz/z); B(z,z⁻¹)=−1=Res(−dz/z) | Residue order agrees | Basic identity stays in README |
| Removed affine value space | (A,B)=(1,0),(0,1) and zero ring | evaluated values at λ=2 are 1,2; over zero ring every value is 0 | Coefficient arithmetic does not assert integration | Definition removed from Lean; coefficients described in prose |
| Removed specialization definition and examples | (0,1/2), λ=0,2; arbitrary exact pair (a,0) | differences 1−0=1 and a−a=0; reversed branch order gives −1 | Ramification and subtraction signs agree | Definition and all computing examples removed from Lean |
| Logarithm convention, README Conventions and §§4.0c,7.1,7.7 | Δλ=2; p and ramified π with e=2 | Δlog(p)=2, Δlog(π)=1; Tate residual branch term 2(1/2−(1/3)(3/2))=0 | Same normalization in all uses | Convention and prose Checks preserved |
| Jump sign, README Conventions and §§1.1,3.2,4.1 | F=(0,2), shift a=(0,−2); f=x at xy=π | c′=0=2−d a; d a=2; Res(dlog x)=1=ord_head−ord_tail=−(0−1) | Supplier sign and roadmap sign reconciled | Sign witnesses preserved |
| Graph metric, README §§1.3,3.4,4.3 | split jump 6 into lengths 1/3,2/3 | jumps 2,4; energy 12+24=36; residue contribution with r=5 is 10+20=30 | Metric refinement preserved | Generality retained; no unit-length substitute |
| Annular coordinate, README Conventions and §4.3 | F_tail=2,c=6,t=1/3; reversal | 2+6/3=4=8−6(2/3); t=0,1 give 2,8 | Both orientations agree | Existing witness preserved |
| Double-index sign, README Conventions and §§2.2,3.3–3.5 | constant/log pair and graph values (2,3,5,7) | B(1,L)=1, B(L,1)=−1; correction −11; reversal −11, exchanged slots +11 | Ordered cup and graph correction agree | Existing witnesses preserved |
| Čech and monodromy conventions, README Conventions and §3.0c | f_e=0,F_tail=0,F_head=2; ℓ=1/2,residue 4 | χ=0−(0−2)=2; N_ℓ coordinate 2 and weighted pairing c·2/(1/2)=4c | Scale and retraction direction agree | Existing convention retained |
| Frobenius coefficient convention, README §§3.0c,3.1a,3.5,6.3 | ℚ₂→unramified quadratic K, κ_K=𝔽₄, α²=α+1 | α²≠α, α⁴=α; q=2 fails identity lift, q=4 works; diag(1,2)²=diag(1,4) | Geometric iterate differs from scalar extension | Existing negative control retained |
| Triple-choice convention, README Conventions and §§5.1–5.5,6.2 | half squares for three L's; shift I(GdH) by 1; end residues ±1 | local values 0 and −1 after the shift; a global shift sums −1+1=0 | Local choice dependence and global cancellation differ | Scalar/function-only substitutes removed |
| Trace and divisor conventions, README §§7.3–7.6 | quadratic α²=π; D=[α]−2[0] | Tr α=0, Tr α²=2π, Tr 1=2; degree 2−2=0; t dt divisor integral π | Trace is applied after the index and basepoint cancels only in degree 0 | Existing general closed-point scope preserved |
| Zero divisions and excluded parameters | ℓ=0, q=1 for Tate, f=0 in dlog, constant finite-map candidate | ℓ=0 cannot inhabit positive-length subtype; ν(q)=0 at q=1; f⁻¹ and log f have no intended value at 0; constant map degree 0 | None of these junk inputs enter a retained headline | Explicit hypotheses retained; no total-function shortcut |

### Build and gate

Committed as 821d050f, `ColemanIntegrationPartII: review repairs (headline acceptance tests and prose API)`. Only TauCetiRoadmap/ColemanIntegrationPartII/README.md and TauCetiRoadmap/ColemanIntegrationPartII/Suggested.lean changed; the worktree is clean and nothing was pushed.

The exact command `lake build TauCetiRoadmap.ColemanIntegrationPartII.Suggested` exited 0. Its final output was:

```text
⚠ [8988/8988] Built TauCetiRoadmap.ColemanIntegrationPartII.Suggested (2.6s)
warning: TauCetiRoadmap/ColemanIntegrationPartII/Suggested.lean:80:8: declaration uses `sorry`
warning: TauCetiRoadmap/ColemanIntegrationPartII/Suggested.lean:102:8: declaration uses `sorry`
Build completed successfully (8988 jobs).
```

The preliminary gate found only the two uncommitted authorized files; after committing, the required gate exited 0. The final movable dependency check exited 0 with no UPWARD, CYCLE or moved line:

```text
depcheck: 13 roadmaps, 100 edges, 0 problem(s)
```

Exact final gate summary:

```text
gate ColemanIntegrationPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
