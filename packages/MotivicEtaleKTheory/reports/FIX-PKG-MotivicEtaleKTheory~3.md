# Repair findings for MotivicEtaleKTheory

## F01 (P2) — applied

Smooth-only supported comparison → regular quasi-projective comparison over every field, including full support. Retained Theorem 2.7’s regular infinite-field relative-cycle input with explicit splitting and moving hypotheses. Separated the geometric construction from its smooth universal-class identification. Updated scope, conventions, build description, examples, references, source use and headline docstring; added characteristic 2 and 3 negative controls.

## Mathematical evidence and extent of the repair

Levine94 line 1101–1117 states Theorem 2.7 for regular quasi-projective schemes over an infinite field. Both its unit-ideal cover with split face cubes and its admissible-support enlargement condition are hypotheses. Levine94 line 739–752 and Levine94 line 1006–1018 describe the relative cycles and their homotopy relations. Section 2.0a now states this input on those carriers, with those hypotheses, rather than restricting its use to smooth schemes. Its three additional Checks distinguish the degree-zero map, the nonzero degree-one map and an inadmissible incidence. The support-local lift is stated on raw face-vanishing cycles with its pure-codimension and componentwise proper-face hypotheses, flat naturality and support enlargement, following Levine94 Lemma 2.2, Levine94 line 777–889.

Levine94 line 1405–1425 states Theorem 3.4 for regular quasi-projective schemes over k, with an arbitrary closed subscheme. Its support complex is the restriction fiber at Levine94 line 1399–1404; the iterated-fiber construction continues at Levine94 line 1424–1437. Section 2.3 now states the weightwise cycle-to-K isomorphism, its inverse total character, localization compatibility and full-support specialization on precisely these fibers. Singular closed supports are retained; no replacement by K(Z) is made.

Theorem 3.1’s header at Levine94 line 1210 assumes smoothness. The repair does not present that header as a regular-scheme theorem. Its proof’s coordinate splitting and support-enlargement argument at Levine94 line 1223–1269 uses products and coordinate retractions over the given regular X. Those operations preserve regularity and codimension without requiring smoothness over k. This is the relative-cycle route used in §2.3. For finite k, regular finite-type k-schemes are smooth, so the supplied finite-field moving/descent applies on its actual domain. Transfer degrees are inverted only rationally. In particular, the route does not base-change an imperfect-field regular scheme to its algebraic closure and assume regularity survives.

For ℓ=2 and 3, t has valuation 1 in 𝔽_ℓ(t), so it is not an ℓth power. Thus L=𝔽_ℓ(t)[s]/(s^ℓ−t) is a field of degree ℓ. Its maximal ideal is zero, giving local dimension and embedding dimension 0. The relative differential relation is 0·ds=0, so Ω¹_L/k=L ds has dimension 1. On base change, s′=s+ε gives L⊗ₖL=L[ε]/(ε^ℓ), whose basis is 1,ε for ℓ=2 and 1,ε,ε² for ℓ=3. In particular ε is nonzero. These are regular, nonsmooth examples; both now occur in the supported comparison.

All occurrences affected by the scope change were searched. The other edits are in Scope and ownership, Conventions’ componentwise grading, How to read the build, §2.0a’s relative-cycle scope and route, Layer 2 Examples, References, the existing Levine94 manifest entry, and the Layers 2.1–2.4 headline in Suggested.lean. Sections 2.0b–2.2 and 2.4 retain smooth universal-class and product scope. Sections 3–7 retain their stated complex-realization scope; §7.2 consumes §2.3 on smooth inputs. The supported API uses flat pullback in the regular scope and the supplied general pullback in the smooth scope. No unrestricted raw cycle pullback was added.

## Check outcomes

- Required elaboration of packages/MotivicEtaleKTheory/Suggested.lean, with the specified `lake env lean` invocation from the content checkout: **exit 0, empty output**, no warnings or errors. No Tau Ceti import or targeted module build was needed.
- Mechanical binder audit: stripped comments and inventoried every declaration; the file has **zero declarations**, hence zero `#check @name` commands. Elaborated a scratch copy prepared for these commands once: **exit 0, empty output**. There are no declaration binders to lose, no Lean signature to widen and no added, removed or renamed Lean name. The changed module docstring distinguishes the regular geometric theorem from the smooth universal-class identification. No stand-in theorem or Check declaration was added.
- Required dependency check with `--movable`: **exit 0**, with this complete output:

```text
depcheck: 29 roadmaps, 261 edges, 0 problem(s)
```

- There is no UPWARD, CYCLE or moved line. The merge-order file and tooling were not edited.
- Citation resolution: **exit 0**, checked against main 1c3cc07 and the 332 indexed open-roadmap heads of 2026-10-24T02:57:03Z; no unresolved cross-roadmap citation or Lean name. The resolver excludes pinned Lake packages, so the native declarations were inspected directly as recorded below.
- sources.toml and metadata.toml parse. The ten lifetime source keys remain unique: seven certified, one waived and two uncertified. Only the existing Levine94 cited-for list changed. There is no new missing-reference request.
- All 27 numbered sections retain at least three Checks; §2.0a has nine and §2.3 has five. Seven layers retain Examples and Dependencies. The two existing supplier gaps still match the README contracts. design/plan.json and metadata.toml are unchanged.
- No gate failure was supplied with this repair brief. `git diff --check` passes with no output. Final path, import, declaration and forbidden-option scans pass. Only README.md, Suggested.lean, sources.toml and this required report changed. No commit or GitHub write was made; no Lean process remains running.

## Supplier, ownership and pin verification

Read TauCetiRoadmap/ComplexTori/README.md and Completed/HodgeStructures/README.md on main for repository shape. The content checkout is main 1c3cc07; its manifest and actual library checkouts agree on Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.

Object searches used the roadmap service over main and indexed open heads, together with the board package READMEs and both pinned libraries. The searches covered relative cycles, higher Chow groups, motivic-to-K comparisons, supported K-theory and multi-relative cubes, including the named sibling roadmaps. KTheoryFiniteLocalFields §3.0a owns the shared simplicial cycles, localization, moving and transfers; MotivesAndAlgebraicCycles §§4.7–4.8a owns its adapters and relative-cycle specialization. SchemeKTheoryOperations owns scheme K, supported operations and weights. The relative face-vanishing cycle quotient, its explicit API and its comparison in §2.0a are the input to this package’s existing geometric comparison, not a second simplicial higher Chow theory or a repetition of the supplier’s specialization theory. No further prerequisite or supplier gap is needed for F01.

The review explicitly settles the previous companion-roadmap overlaps and does not re-raise them. Their consumer-import obligations remain in Scope and ownership and Downstream consumers. This repair neither claims those external edits happened nor invents reverse supplier gaps for them. No declaration-name collision is possible in the empty acceptance namespace.

Every cross-roadmap citation was re-resolved against main or the indexed new-roadmap head. The two design-only consumer labels were checked in the board designs, rather than reported missing because the roadmap service has no package-stage entry for them.

| Roadmap | Resolved sections and contract |
| --- | --- |
| GeneralAlgebraicKTheory | §§3.12, 4.6, 4.8, 4.14, 6.3, 7.4–7.7, 8.12–8.13: actual K-models, resolution, dévissage, localization, pairings and transfers. The DVR boundary is +1 on a uniformizer; the uniformizer-last adapter is (−1)ⁿ⁻¹ in degree n≥1. |
| SchemeKTheoryOperations | §§2.1–2.6, 3.1–3.6, 4.3, 6.1, 6.7–6.9, 7.1–7.3: perfect and supported scheme K, pullback, spectrum pairing, stabilized classifying models, regular ample-family operations, finite weights and degree-zero character. Section 6.9 includes regular-base, several-variable A¹ uniqueness. These hypotheses include the regular nonsmooth field examples. |
| KTheoryFiniteLocalFields | §3.0a, motivicCycles and motivicToK; §6.10, diagonalChernMilnor: shared integral cycles over every field, localization, smooth incidence moving, finite-field descent, transfer degrees, tower and diagonal normalization. Smooth incidence moving is not used on the nonsmooth examples; §2.0a supplies the regular relative-cycle argument. |
| MotivesAndAlgebraicCycles | §§4.7–4.8a, 4.14, 4.17–4.18: shared-cycle adapters, relative-cycle specialization and motivic comparisons with their perfect-field/resolution hypotheses. These additional categorical hypotheses do not restrict §2.3. |
| SchemeAndStackFoundations | §§2.1–2.2, 4.12, 4.17, 5.1–5.8: sheaf cohomology, Chow domination, SNC geometry, ordinary cycles, Chern classes, refined intersection and degree-zero K/Chow comparison. |
| ResolutionOfSingularitiesCharacteristicZero | §§5.1–5.6, 6.1–6.4: resolution preserving the smooth open and boundary, projective compactification in the quasi-projective case and SNC coordinates. |
| EtaleCohomologyFoundations | §§G.1–G.3: compactification objects, Nagata existence, common refinements and coherent comparisons. |
| ComplexComparisonPartII | §§C−1.1, C−1.4, C5.1, C5.3–C5.6, C6.0: analytification, ordinary/proper Hodge comparison, integration currents, holomorphic logarithmic forms and stratified topology. The trivial-connection residues are 0, satisfying the regular-singular comparison’s exclusion of positive integers. |
| EnhancedDerivedSheaves | §§0.1–0.4, E0.6, E1.4, E2.6: enhanced complexes, replacements, tensor, coherent diagram inversion and descent. |
| DifferentialGeometry | Layers 0–1, 5–9: forms, wedge, integration, Stokes, de Rham comparison and duality. The Whitney/flat-ideal extensions remain exactly the two declared gaps. |
| ComplexKahlerGeometry; ComplexManifolds | K1–K2; Milestones 1–2: type calculus, Dolbeault operators and transported complex orientation, with finite-dimensional Hausdorff second-countable hypotheses. |
| AlgebraicTopology | Stages 2–3, Stage 6 items 1–4, Stage 8 item 2: relative topology, excision, products, local duality and abelian Moore comparison. |
| Completed/HodgeStructures | Linear pure and mixed Hodge structures, with the actual pinned structures and strictness below; no geometric logarithmic construction is attributed to it. |
| Polylogarithms | §§5.2–5.3, 5.9–5.10, 5.13, 5.17: downstream auxiliary/support, explicit current, product and curve-regulator uses; the existing section-label dictionary is retained. |
| ColemanIntegration | §§L3.Fa.1–L3.Fa.3, L3.Fc.1: ordinary Quillen specialization, cube/import obligation, special-unit symbols and arithmetic regulator normalization. |
| BorelRegulators | §§6.0a–6.2: downstream generic Deligne import obligation, point quotient, universal realization and arithmetic calibration. |
| ZagierConjecturePolylogarithms | packages/ZagierConjecturePolylogarithms/design/README.md, requested M.8 labels: mapped to §§2.1–2.2, 7.1, 7.4 here. |
| MixedHodgeModulesAndIrregularHodgeTheory | packages/MixedHodgeModulesAndIrregularHodgeTheory/design/README.md, N/logarithmic-filtration: f=0 has pole divisor 0 and recovers ordinary filtered logarithmic forms. It is a consumer, not a supplier. |

Direct pin inspection reconfirmed all library names used in the exact contracts:

| Pin file | Declarations / mathematical content |
| --- | --- |
| Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44,69 | AlgebraicGeometry.AlgebraicCycle is a locally finitely supported coefficient function on scheme points; no dimension or face condition is built into it. Its map requires quasi-compactness and explicit dimension weights/residue degrees. |
| Mathlib/AlgebraicGeometry/Scheme.lean:40; Mathlib/Algebra/Category/ModuleCat/Basic.lean:56 | AlgebraicGeometry.Scheme and ModuleCat provide schemes and module objects, not higher-cycle or scheme K-spectrum constructions. |
| Mathlib/Algebra/Homology/HomologicalComplex.lean:59,72; DerivedCategory/Basic.lean:87 in the same homology directory | HomologicalComplex, d_comp_d and CategoryTheory.DerivedCategory provide square-zero complexes and derived localization. |
| Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean:57,261,269 | CochainComplex.mappingCone, inl_v_d, inr_f_d fix the source-shift-first cone differential. The transported pair fiber has the signs used here. |
| Mathlib/AlgebraicTopology/DoldKan/Equivalence.lean:167 | CategoryTheory.Abelian.DoldKan.equivalence requires an abelian category and relates simplicial objects to natural-number chain complexes. |
| TauCeti/Algebra/Homology/GradedCochainComplex.lean:59 | TauCeti.gradedCochainComplex uses actual graded submodules and a homogeneous square-zero linear map. |
| TauCeti/Geometry/Hodge/Structure.lean:62; Morphism.lean:69 | HodgeStructureOn and IsMorphism require opposed filtrations and, for morphisms, conjugation equivariance and filtration preservation. |
| TauCeti/Geometry/Hodge/Tate/Basic.lean:91,100,111 | tate, tate_F and tate_piece have type (−p,−p) for twist p; the lattice marking is distinct from the geometric factor (2πi)ᵖ. |
| TauCeti/Geometry/Hodge/Mixed/Basic.lean:72; Mixed/Strictness.lean:110 | MixedHodgeStructure and Hom.range_inf_F_eq_map_F provide linear mixed-Hodge data and strictness for actual morphisms. |

Searches by object at both pins found no higher-Chow, supported scheme K, multi-relative K or geometric Deligne-cohomology construction that would make the changed headline statable through a few simple definitions. No sorry'd data definition, free comparison predicate or scalar substitute was introduced.

## Adversarial mathematics pass

Each row records an instantiated calculation, not a proof of the general target. P denotes Spec k, h a positive hyperplane class, and L_ℓ=𝔽_ℓ(t)[s]/(s^ℓ−t), ℓ=2,3. API rows identify each mathematical operation; the support-local relative-cycle API is recorded alongside its construction. The table contains 147 computed rows. The regular/nonsmooth repair and every affected Check were recomputed; the table also audits the other target statements and conventions against their retained examples.

| Statement | Instances tried | Computed values on the two sides | Result / change |
| --- | --- | --- | --- |
| Conventions: component grading | ∅; P⊔ℙ¹ | 0 components; CH⁰=ℤ² and CH¹=0⊕ℤ | Pass; extended wording to regular components. |
| Conventions: motivic degree | (p,a)=(0,1),(1,1) | 2p−a=−1,1; corresponding groups 0,k× | Pass; integer subtraction retained. |
| Conventions: derived coefficients | ℤ/2⊗ᴸℤ/2; zero ring | Reduced resolution has differential 0 and groups ℤ/2 in degrees −1,0; zero coefficients give 0 | Pass. |
| Conventions: cube orientation | n=0,1,2 | J=(1,−1,1); ∂Γ_t=[0], δΓ_t=−[0] | Pass. |
| Conventions: mixed differential | Bidegree (1,1) | Cross coefficients −1,+1 give 0 | Pass. |
| Conventions: fiber shift and boundary | 0→ℝ[0]; graph t | Fiber has H¹=ℝ; d(Γ_t,0)=([0],t), so raw(t)=−[0] | Pass; adapter gives +[0]. |
| Conventions: Tate line and cone arrow | p=−1,0,1; point | Lines iℝ,ℝ,iℝ; weight-one quotient Re(log 2)=log 2 | Pass; 2πi≠0. |
| Conventions: critical differential | x=z z̄, p=1 | ∂∂̄x=dz∧dz̄; d_Dx=−2dz∧dz̄ | Pass. |
| Conventions: orientation and total product | Two disks; n=s=1 | Ordered residues +1,−1 after swap; Koszul multiplier −1 | Pass. |
| Whitney gap: extension | Jet coefficients 1,1,2 | Derivatives 1,1,4; polynomial 1+x+2x² realizes them | Pass. |
| Whitney gap: infinite order and parameters | Coefficients n!; normal order 2 at y=π/2 | Derivatives (n!)²; transverse value 4 | Pass; analytic radius 0. |
| Whitney gap: endpoints and uniqueness | Empty/full closed set; 0 and exp(−1/x²) | 0 conditions / original function; both jets 0, but values at 1 are 0,e⁻¹ | Pass; no uniqueness. |
| Flat-ideal gap: equal/empty sets | A=B={0}; A=∅,B=U; A=B=U | I=I+I; C∞=C∞+0; 0=0+0 | Pass. |
| Flat-ideal gap: sum | Coordinate axes; φ(x)+φ(y) | Jet at origin 0; value at (0,1) is e⁻¹ | Pass; excludes intersection of the ideals. |
| 1.1 definition and normalization | P,p=0,n=0,1,2 | Raw groups ℤ,ℤ,ℤ; normalized groups ℤ,0,0 | Pass. |
| 1.1 API: normalization quotient | Constant degree-one cube | Infinity map 1↦1; kernel 0 equals quotient ℤ/ℤ | Pass. |
| 1.1 API: direct cycle maps | ℙ¹→P; L_ℓ/k | Fundamental one-cycle pushes to 0; finite restriction/transfer gives ℓ·1 | Pass. |
| 1.1 API: J multiplication | Degrees (1,1),(1,2) | J₂=1=(−1)²; J₃=−1=(−1)·1 | Pass. |
| 1.1 API: native coefficients | Reduced/double point; p=−1 | Coefficients 1,2; negative-codimension group 0 | Pass. |
| 1.2 definition | Total degrees 0,2 | 1,3 summands; two cross terms sum to 0 | Pass. |
| 1.2 API: axes | Degree-zero cycle with coefficient 3 | Both images have coefficient 3 | Pass. |
| 1.2 API: total morphisms | Degree-two components 2,3,5 into ℤ | Sum image 10; all zero components give 0 | Pass. |
| 1.2 API: orientation | (n,m)=(1,0),(0,1),(1,1) | Multipliers −1,+1,−1 | Pass; excludes (−1)ⁿ⁺ᵐ. |
| 1.3 absolute comparison | P over 𝔽₂,p=0 | H₀=ℤ, higher homology 0 on both axes; 1↦1 | Pass integrally. |
| 1.3 support comparison | Z=∅,X | fib(id)=0; fib(C→0)=C in each model | Pass. |
| 1.3 coefficient comparison | Multiplication by 2; R=0 | Kernel/cokernel after reduction both ℤ/2; zero-ring result 0 | Pass. |
| 1.4 proper/flat maps | 𝔽₂(t)/𝔽₂(t²) | Degree 2 on CH⁰; both model composites send 1 to 2 | Pass. |
| 1.4 smooth products and pullback | Degrees (1,1),(0,1); mixed dimensions | Exchange multipliers −1,+1; CH¹(P⊔ℙ¹)=0⊕ℤ | Pass; smooth scope retained. |
| 1.4 supports and nilpotents | Identity; square-zero thickening | Identity coefficient 1; cycle generator groups ℤ,ℤ | Pass; no K nil-invariance inferred. |
| 2.0a supported cube definition/API 1 | n=0, full/empty support | K₀(k)=ℤ, rank-two class 2; empty support 0 | Pass. |
| 2.0a generalized weights | T=[[2,1],[0,2]] on ℚ² | (T−2)e₂=e₁; (T−2)²=0; generalized space dimension 2, eigenspace dimension 1 | Pass; distinction retained for arbitrary opens. |
| 2.0a weight rationality | K₀(ℙ²), h³=0 | ψ²h=2h−h²; eigenvectors 1,2h+h²,h² have determinant 2 | Pass; decomposition rational. |
| 2.0a API 2: common-base pairing | Two unit loops, over ℤ_(2),ℤ_(3) | ψ² product=4{u,v}=(2[u])(2[v]) | Pass. |
| 2.0a external-product domain | ℤ[i] self-product over ℤ | v(v+2i)=0; local dimension 1, cotangent dimension 2 | Pass; singular product excluded. |
| 2.0a API 3: one coordinate | Difference on (1,0),(0,1),(1,1) | Values +1,−1,0; same over ℚ,ℤ₂,ℤ₃ | Pass. |
| 2.0a API 3: double loop | {u,v} over ℚ(u,v) | Consecutive last-slot residues +1; swap gives −1; ψ² multiplier 4 | Pass. |
| 2.0a open-cube domain | Remove t=2 over ℤ₃ | Two face ranks of O are (1,1); difference 0 | Pass; no full-cube equivalence claimed. |
| 2.0a relative-cycle definition | D empty,V=Spec L_ℓ,c=0 | Generator 1, constant A¹ relation restricts to 0 because its 1-face is 0 | Pass; quotient ℚ. |
| 2.0a support-local lift | W=Spec L_ℓ,c=0; W={s}⊂□_(L_ℓ),c=1 | Leading rank class 1; relative unit class [s] has v_s=1; support enlargement retains coefficient 1 | Pass; Lemma 2.2 hypotheses explicit. |
| 2.0a relative-cycle theorem | V=Spec L₂,L₃ | CH⁰⊗ℚ=ℚ=K₀^(0); 1↦[L_ℓ]=1 | Pass; regular nonsmooth input added. |
| 2.0a relative-cycle normalization | V=□_(L_ℓ), cube point s | K₀(relative)^(1)=K₁(L_ℓ)⊗ℚ; v_s([s])=1 | Pass; excludes zero and inverse maps. |
| 2.0a split-cover hypothesis | z=t/(t−1); f=z,1−z | f₁+f₂=1; face values z=0,1 | Pass; each open has its remaining constant retraction. |
| 2.0a support-enlargement hypothesis | An interior point on the one-cube | W avoids both faces; W′=W, each face retraction still lands outside W | Pass on this instance; hypothesis retained in general. |
| 2.0a improper-incidence control | W={z=0},c=1 | Ambient codimension 1; face codimension 0<1 | Pass; excluded rather than moved by assertion. |
| 2.0a regularity under cube products | L_ℓ; affine one-cube local ring at a point | Base dimensions/embedding dimensions 0/0; polynomial local dimensions/embedding dimensions 1/1 | Pass without k-smoothness. |
| 2.0b Chern definition | Zero K-class; unit 2 | c₀,₀(0)=1 but ch(0)=0; v₂(c₁,₁[2])=1 | Pass; construction scope unchanged. |
| 2.0b API: Whitney sum | O(1)⊕O(−1) on ℙ² | c₂=−h², while individual c₂ values are 0 | Pass. |
| 2.0b API: diagonal coefficient | n=1,2,3 | (−1)ⁿ⁻¹(n−1)!=1,−1,2 | Pass. |
| 2.0b API: Newton conversion | Same diagonal degrees | Character factors 1,−1,1/2 give composites 1,1,1 | Pass; denominators nonzero in ℚ. |
| 2.1 actual character | P; O(±1) on ℙ¹; ∅ | Rank-two image 2; line images 1±h; empty image 0 | Pass. |
| 2.1 API: addition and naturality | O(1)+O(−1); unit 2 | Character 2; v₂ of degree-one image 1 | Pass; zero higher map excluded. |
| 2.1 finite/componentwise target | Two points with ranks 2,1 | Weight-zero value (2,1), all positive degree-zero weights 0 | Pass. |
| 2.2 isomorphism and Adams law | Weights 0,1,2; a=1,2 | Eigenvalues 1,2,4 for a=2; ψ¹ multiplier 1 | Pass. |
| 2.2 projector denominators | Weight pairs (0,1),(0,2),(1,2) | Differences −1,−3,−2 | Pass; no zero denominator. |
| 2.2 universal-class identification | Point class on ℙ¹; unit 2 | Both maps give h; both degree-one valuations 1 | Pass on instances; unread arbitrary-field source remains uncertified. |
| 2.2 higher normalization | {2,t} | Last-slot residue [2], v₂=1; right-linear B gives −[2], v₂=−1 | Pass; degree-two adapter restores +1. |
| 2.3 support-group definition | Z=∅,X | H(fib(id))=0; H(fib(M→0))=H(M) | Pass; same source fibers retained. |
| 2.3 field witness, ℓ=2 | L₂/k | dim=embdim=0; dim Ω¹=1; ε≠0,ε²=0 | Pass; smooth-only omission repaired. |
| 2.3 field witness, ℓ=3 | L₃/k | dim=embdim=0; dim Ω¹=1; ε²≠0,ε³=0 | Pass; no characteristic-2 shortcut. |
| 2.3 regular full support | Spec L₂,Spec L₃,n=p=0 | Source and target ℚ; 1↦1 in both cases | Pass; full-support specialization explicit. |
| 2.3 supported isomorphism | X=𝔸¹_(L_ℓ),Z={0},n=0,p=1 | Source ℚ, target K₀^Z weight 1=ℚ; [0]↦[O₀] with coefficient 1 | Pass. |
| 2.3 total comparison and components | P⊔ℙ¹,full support | K₀⊗ℚ has weights of dimensions 2,1; Chow summands ℚ²,ℚ | Pass; ranks (2,1) retained. |
| 2.3 smooth inverse identification | ℙ¹ and unit 2 over ℚ | Leading point image h; positive-degree valuation 1 | Pass; identification retains smooth scope. |
| 2.3 finite-field branch | Spec 𝔽₂,Spec 𝔽₃; degree-d extension | Rank map 1↦1; transfer composite 1↦d and d⁻¹d=1 in ℚ | Pass; no inseparable closure used. |
| 2.3 localization adapter | u on 𝔸¹_(L₂),𝔸¹_(L₃) | B[u]=+1; raw([u])=−1; −raw([u])=+1 | Pass in both characteristics. |
| 2.3 API: flat pullback | Spec L_ℓ→Spec k, full support | Cycle 1↦1; [k]↦[L_ℓ] of rank 1 | Pass; flat/smooth scopes stated separately. |
| 2.3 API: identity/enlargement | {0}⊂{0,1} in 𝔸¹_(L_ℓ) | Identity 1↦1; enlargement 1↦(1,0) | Pass. |
| 2.3 API: suspension dictionary | Degree-one uniformizer; degree-two {2,t} | Factors 1,−1; right boundaries +1,−[2] become +1,+[2] | Pass; no degree-zero boundary asserted. |
| 2.3 singular support | V(xy)⊂𝔸² | Leading component coordinates (1,1); no regularity at crossing | Pass; no K(Z) substitution. |
| 2.4 character products | Bundles of ranks 2,3 | ch₀ external product 6=2·3 | Pass; smooth scope unchanged. |
| 2.4 degree-zero agreement | O(a),O_point on ℙ¹ | ch=1+ah; ch(O_point)=1−(1−h)=h | Pass. |
| 2.4 higher Newton factor | p=1,2,3 | 1,−1,1/2; ch₂,₂=−c₂,₂ | Pass. |
| 2.4 internal product | ξ=1−O(−1) on ℙ¹ | ξ²=0; ch(ξ)²=h²=0 | Pass. |
| 3.1 logarithmic algebra definition | Coordinate rescaling z↦2z | Log generator changes by log 4; dlog changes by 0 | Pass; actual image algebra. |
| 3.1 API: differential | log|z|²; z z̄ | dlog=dz/z+dz̄/z̄; ∂∂̄x=dz∧dz̄, ∂̄∂x=−dz∧dz̄ | Pass. |
| 3.1 API: pullback | Power maps 2 then 3 | dlog multiplier 2·3=6, equal to power-6 pullback | Pass. |
| 3.1 API: inclusion and unit | D=∅; W=∅; identity | Native smooth algebra; zero algebra; 1·f=f | Pass. |
| 3.1 growth and orientation | z=e⁻ᴺ; circle; two disks | log|z|²=−2N versus |z|⁻²=e²ᴺ; period 2πi; residues ±1 | Pass. |
| 3.2 geometric weight | P; 𝔾_m | Point weight 0; dlog has residue weight 1 plus degree 1, giving 2 | Pass. |
| 3.2 comparison/refinement | Boundary blowup for 𝔾_m² | Betti dimensions (1,2,1) unchanged; boundary count 4→5 | Pass; F comparison not invariant residue complex. |
| 3.2 local division | exp(−1/|z|²)/z²; 1/z² | First has zero jets, value e⁻¹ at 1; second diverges at 0 | Pass; flatness essential. |
| 3.2 logarithmic powers | Flat f on zw=0; f log|z|²/(z w̄) | All axis jets 0; at (−2,1) value −e⁻¹ᐟ⁴ log(4)/2 | Pass. |
| 3.2 zero exponents | aᵢ=bᵢ=cᵢ=0 | Both expressions equal f; extension equals f | Pass. |
| 3.3 Deligne definition | Point, twists 0,1,−1 | (H⁰,H¹)=(ℝ,0),(0,ℝ),(ℝ(−1),0) | Pass in cone and small model. |
| 3.3 API: deformation retract | Point,p=1; log 2+iθ | Projection/inclusion fixes real r; other composite gives log 2, differing by iθ | Pass; difference is cone boundary. |
| 3.3 API: exactness | Split ℝ→ℝ²→ℝ in type (0,0),p=1 | H¹ dimensions 1,2,1; maps a↦(a,0),(a,b)↦b | Pass; kernel=image. |
| 3.3 API: shifts and sums | Point shifted by 1; two points | Degree −1 cannot be 2r for integer r; H¹ on two points is ℝ² | Pass; shift only on constructed cochain comparison. |
| 3.3 critical operator | p=1,x=|z|²; x=1 | Values −2dz∧dz̄ and 0; ordinary degree jump 0→2 | Pass. |
| 3.3 cone-arrow transport | z=3+4i,p=1,2,3 | Quotient coordinates 3,4i,3; negation gives −3,−4i,−3; transported coordinate restores originals | Pass. |
| 3.4 compactification definition/API 1 | Identity refinement; torus blowup | 1↦1; periods (2πi,0),(0,2πi) fixed under comparisons and composites | Pass. |
| 3.4 API: pullback | t² then t³; identity | Period multipliers 6 and 1 | Pass. |
| 3.4 API: descent and disjoint union | Cover P by P,P; ∅; P⊔ℙ¹ | Equalizer diagonal ℝ; 0; H⁰=ℝ² | Pass. |
| 3.4 API: colimit/skeleton | Two identical point choices | Compatible pair (r,r) induces value r from either choice | Pass; no presheaf-section equality claimed. |
| 4.1 product low/low | log 2,log|t| in weights 1,1 | Product i log 2 darg t; reversed product its negative | Pass. |
| 4.1 mixed branch below cutoff | Point x=log 2 at (a,p)=(1,1),y=3 at (b,q)=(0,0) | Projection of 3log 2 equals 3log 2 | Pass. |
| 4.1 mixed branch above cutoff | x=log|z| at (a,p)=(1,1), y=i at (b,q)=(0,−1) | l=1≥2r=0; r₁(x)=i darg z, so r₁(x)y=−darg z; correction type (−1,1)=0 | Pass; y belongs to ℝ(−1)=iℝ. |
| 4.1 high/high branch | Weight-zero constants 2,3 | Native product 6 | Pass. |
| 4.1 API: Leibniz and symmetry | x=|z|²,y=1,weights 1,1 | Product −z̄dz+z dz̄; d_D gives −2dz∧dz̄ on both sides | Pass. |
| 4.1 API: conditional unit/naturality | tℝ[t]⊂ℝ[t] | coeff_t(et)=0 for every source e; coeff_t(1·t)=1 in target | Pass; no unconditional unit. |
| 4.1 API: odd critical formula | log 2,log|t|; point logs | Four terms give i log 2 darg t; on point log 2•log 3=0 | Pass. |
| 4.2 associativity homotopy | Even critical x=Re z,2,3 in weight zero | Both bracketings 6 Re z, value 6 at z=1; h=0 though dx≠0 | Pass. |
| 4.2 cohomological associativity | Constants 2,3,5; tℝ[t] | Both bracketings 30; (t·t)·t=t·(t·t)=t³ | Pass; nonunital case retained. |
| 4.2 choice compatibility | Torus product period | (2πi)² in each refinement; exchanged order −(2πi)² | Pass. |
| 5.1 support-fiber definition | Empty/full support; 0→ℝ[0] | 0; original complex; H¹=ℝ | Pass. |
| 5.1 API: support direction | {0}⊂{0,1} | r↦(r,0), with identical direct/composite map | Pass. |
| 5.1 API: raw connecting map | Lift of unit t | [(0,t)]=−[0]; log lift gives −cl([0]) | Pass; same sign as §2.3. |
| 5.1 API: products | Disjoint divisors x=0,x=1 | Intersection support ∅; product 0 | Pass. |
| 5.1 API: pair identities | General pair (ω,g) | d² second coordinate=res(dω)−d(resω−dg)=0 | Pass. |
| 5.2 semipurity | Axes and cusp in 𝔸²,p=1 | Degree-two groups ℝ²,ℝ; classes (1,1),1; lower groups 0 | Pass. |
| 5.2 API: Betti component calculation | Origin in 𝔸²,p=1,2 | Degree-two group 0; degree-four group ℝ with orientation coefficient 1 | Pass. |
| 5.2 API: multiplicity/zero detection | V(x),2V(x),zero cycle | Coordinates 1,2,0; zero class iff coefficient 0 | Pass in both directions. |
| 5.2 API: normalized current criterion | f=t,d=p=1 | Form factor (2πi)⁻¹; point factor 1; d_D[−log|t|]=−δ₀ | Pass; representative has coordinate +1. |
| 5.2 codimension control | Point,full support,p=1 | H¹=ℝ≠0 although 1<2 | Pass; codimension hypothesis cannot be dropped. |
| 5.2 products | V(x)·V(y); 2V(x)·V(y) | Intersection lengths 1,2; supported coordinates 1,2 | Pass. |
| 5.3 auxiliary-complex definitions | (r,n)=(2p,1),(2p−1,1) | Total degrees 2p−1,2p−2; cube signs +1,−1 | Pass. |
| 5.3 API: cycle map | Origin and double origin | Fundamental class coordinates 1,2 | Pass. |
| 5.3 API: projection shift | Top form degree 2p,cube degree n | Degree 2p−n in source and Hₚ[−2p] target | Pass. |
| 5.3 API: forget support/constant cube | P,p=0 | Constant generator 1 maps to 1; positive normalized cube terms 0 | Pass. |
| 5.3 API: support colimit | Origins 0,1 with coefficients 2,3; zero support | The two inclusions and sum give coordinates (2,3) at their union; empty contribution 0 | Pass. |
| 5.3 good truncation | ω=Re(z₁)dz₂∧dz̄₂ | dω on (∂ₓ₁,∂ₓ₂,∂ᵧ₂) is −2i≠0 | Pass; top good truncation excludes ω. |
| 5.3 orientation transport | n=1 | J₀∂=∂=(−∂)(−1)=δJ₁ | Pass in the entire diagram. |
| 5.4 cycle resolution | Origin at n=0,p=1 | Class map sends 1↦1,2↦2; both groups ℝ | Pass. |
| 5.4 affine contraction | P→𝔸¹,p=0,1 | H⁰_D=ℝ and H¹_D=ℝ respectively on both sides; positive normalized columns 0 | Pass. |
| 5.4 product compatibility | n=s=1; n=0 or s=2 | Total product sign −1; then +1 | Pass. |
| 6.1 regulator definition/API lift | P,p=n=0; zero lift | Image of m is m in ℝ; zero lift gives 0 | Pass. |
| 6.1 API: integral source | Units −1,i | Torsion values log 1=0; integral rank 2 maps to 2 | Pass. |
| 6.1 API: geometric classes | O(1),O(−1) on ℙ¹ | Normalized integrals +1,−1; raw periods ±2πi | Pass. |
| 6.2 restriction/fiber theorem | Z=∅,X; identity | Zero map; absolute regulator; identity h=0 | Pass. |
| 6.2 API: pair-fiber homotopy sign | A=A′=ℤ[0],B=0,B′=(ℤ→ℤ),r=f′=h=1 | Correct image (1,1) has differential (0,0); wrong image (1,−1) gives (0,2) | Pass. |
| 6.2 boundary transport | t on punctured affine line | Raw log boundary −1; negative Green representative +1 | Pass; agrees with §2.3. |
| 6.3 pullback theorem | Point→ℙ¹ applied to O(1) | CH¹(point)=0 and H²_D(point,ℝ(1))=0 | Pass. |
| 6.3 embedding compatibility | Unit 2,ℚ→ℝ→ℂ or ℚ→ℂ | Both values log 2 | Pass. |
| 6.3 model independence | Cube degrees 0,1,2 | Axis values 1 in degree 0; transport signs 1,−1,1 on source and target | Pass. |
| 7.1 independent character | u=2eⁱθ,i | Real logarithm values log 2,0; adding 2πi changes each by 0 | Pass. |
| 7.1 API: additivity/products | Zero class; trivial line | Images 0,1; rank-two class 2 | Pass. |
| 7.1 API: geometric agreement | O(a) on ℙ¹ | Character 1+ah_D with normalized integral a | Pass. |
| 7.1 parity quotient | z=3+4i,p=1,2,3 | π_(p−1) values 3,4i,3; adding ℝ(p) changes them by 0 | Pass. |
| 7.1 Dold–Kan scope | Constant ℤ; constant S₃ | π₀=H₀=ℤ, positive groups 0; S₃ has nonabelian π₀ of order 6 | Pass; abelian comparison excludes S₃. |
| 7.2 Beilinson equality | Rank 2; O_point on ℙ¹ | Both maps give 2 and h_D of degree 1 | Pass on instances. |
| 7.2 higher-degree equality | Unit 2; unit −1; weight 2 coefficient | Both maps give log 2,0; Newton factor −1 | Pass on instances. |
| 7.2 supported equality | Full/empty support; (𝔸¹,{0}) | Absolute / zero maps; raw boundary coefficient −1 | Pass; smooth scope unchanged. |
| 7.3 integral multiplicativity | Units 2,t on 𝔾_m | Product i log 2 darg t; swapped negative; periods ±2πi log 2 | Pass. |
| 7.3 zero/unit cases | Weight-zero 1; zero cycle; empty factor; point units 2,3 | Preserved class; 0; 0; product regulator 0 | Pass. |
| 7.3 geometric product | Ruling divisors on ℙ¹×ℙ¹; double first ruling | Point coefficients 1,2 in both cycle and Deligne products | Pass. |
| 7.4 logarithm normalization | 2,3,6,1,i,1/2 | log 6=log 2+log 3; remaining values 0,0,−log 2 | Pass. |
| 7.4 unit-product form | f=2,g=t | i log 2 darg t has period 2πi log 2 | Pass; factor i required by twist. |
| 7.4 projective/Green sign | a=−1,0,1; tᵃ | Chern integrals −1,0,1; −a log|t| gives divisor coordinate a | Pass; unit regulator on open has opposite sign. |

## Source access and maintainer consequences

All cited works already have manifest entries. Levine94’s readable statements and proof steps settle the new finding directly. The repair uses no new source. Bloch86 §7 remains uncertified and Levine98 remains waived; Beilinson85 §§1–2 remains an uncertified historical reference. Their settled access statuses were not reopened. BF line 965–997 supplies the readable complex-field universal-class construction, not independent certification of its arbitrary-field extension. The instance calculations above do not certify the unread text.

Some scanned display glyphs in Levine94 and Burgos94 are absent from the supplied extraction. The numbered regularity hypotheses and the relative-cycle/support constructions used for this repair are readable at the cited lines. No unread displayed identity was supplied from memory as source evidence.

Consumers gain the regular nonsmooth geometric comparison in §2.3. The universal-class identification and analytic applications keep their previous hypotheses and normalization, so existing smooth consumers retain the same maps. No public Lean name or numbered section changed. The frozen design narrative and non-gap plan fields were left untouched as required by the edit boundary; the package README and acceptance docstring carry the repaired target. No external roadmap or merge-order change is needed to settle F01.
