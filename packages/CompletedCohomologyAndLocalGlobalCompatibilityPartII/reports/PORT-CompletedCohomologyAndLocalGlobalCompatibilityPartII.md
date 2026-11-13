# Port report: CompletedCohomologyAndLocalGlobalCompatibilityPartII

Branch: `roadmap/completed-cohomology-and-local-global-compatibility-part-ii`.
Head commit: `1a53e38363d3db2c1dcf0b170d6ee927e7f70403`.
Base: `42813dd`; the initial working tree was clean.

The commit adds only `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md`, `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibilityPartII/Suggested.lean` and `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibilityPartII/metadata.toml`. The source package and other roadmap folders were not edited. No push or GitHub write was performed.

## Draft pull request body

Build arithmetic component detection and local faithfulness for the general GL_d(F) patched module, then derive density of crystalline, potentially crystabelline and induced supercuspidal points in unrestricted framed local deformation rings. The continuation starts from CompletedCohomologyAndLocalGlobalCompatibility’s patched-module and support theorems, adding continuous testing modules, smooth-family capture and fixed-centre algebraic detection. A separate local route proves crystalline and benign density at every prime; prescribed-type and minimal-stratum variants retain the hypotheses of the patched construction.

## Validation

Final build outcome: `Build completed successfully (18239 jobs).`
Warning count: 0. There are no admitted declarations and consequently no sorry warnings.

The first build succeeded with two module-system warnings. Adding the Lean `module` header eliminated both; the single `import Mathlib` is retained. No mathematical declaration was added.

Gate summary: 

```text
gate CompletedCohomologyAndLocalGlobalCompatibilityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The precommit gate had zero content/dependency failures and reported only a dirty working tree; this gate requires the commit before its final clean-tree run. The postcommit gate exits 0 and reports every counter zero. The working tree is clean.

The separate required dependency check printed:

```text
depcheck: 213 roadmaps, 1929 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line appeared. The merge-order file was not edited.

The citation resolver found no cross-roadmap citation or Lean name found nowhere. Its warning that it could not inspect pinned Lake packages was handled by opening the local pinned sources directly. Mathlib is `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti is `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

## Port changes and upstream mathematical pass

The full six-layer specification, all hypotheses, source locators, API bullets, worked examples, supplier contracts and seven headlines are retained. Metadata is unchanged, `topic = "math.NT"`, matching main’s metadata form. Main models read were PadicMeasuresIwasawaAlgebras, ProfiniteCohomology and ClassFieldTheory, with the analytic-stage and reductive-group suppliers also inspected.

Concrete fixes after rereading the README:

1. Section 3.3’s general closed-subspace theorem includes H={1}, but its route used the exponent δ/dim H. The zero-dimensional case now has its own direct proof: compact torsion-free dimension-zero H is trivial; the positive lower bound forces invariant dimension 1, so Π=L. A Check compares dimensions 1 and 0 against index 1. The theorem retains its full domain, and the positive-dimensional route retains its precise filtration hypotheses.
2. Section 1.1 defines four point sets, not three. The coefficient-change API now says four.
3. Sections 5.2 and 6.1 now distinguish the inputs of the all-prime local route from those of the p∤2d patched route. Thus a proof at p=2 is not assigned patched faithfulness as a prerequisite.
4. The build explanation now calls a named gap an additional exact requirement on its owner, rather than asserting that every such theorem is already stated in that supplier’s section. This preserves the accepted conditional interfaces without inventing supplier declarations.
5. The References paragraph no longer refers to a manifest that is absent from the three-file roadmap folder. The version and pagination data remain in the bibliography. Checkout-specific wording in the pinned supplier introductions is replaced by revision-independent wording.
6. The module header fixes the pinned Lean warning described above.

The accepted review has no findings or non-blocking mathematical notes to apply. Its summary lists thirteen conditional contracts, while the accepted README contains seventeen explicit contracts: capture-formalism, fixed-centre-specialisation, smooth-test-quotients and torsion-free-iwasawa-domain are additional to that summary. All seventeen are preserved. The accepted correction placing EP Lemma 2.9 on printed page 344 is retained; the source’s page marker and lemma were rechecked (EP line 313).

## Lean acceptance and binder audit

Nothing moved from Lean to README. The package already has zero declarations and correctly names all seven non-statable headlines: local faithfulness; crystalline density; fixed-weight potentially crystabelline density; unramified-induced supercuspidal density; benign density; prescribed-type density; and minimal-stratum density.

Object searches in both pinned libraries found no universal framed local Galois deformation ring with its arithmetic specializations, actual patched module, crystalline/benign representation predicate or Berthelot generic fibre needed for those signatures. The completed group algebra exists, and is not substituted for the patched module. No headline becomes statable from a few simple definitions. No stand-in, free Prop field, sorry’d data or padding is added.

The mechanical declaration inventory gives zero named declarations. Therefore the requested scratch `#check @name` list is empty and there is no elaborated signature or binder to compare; no Lean command beyond the required module builds was run. This is an empty audit, not an assertion that an untested declaration retains its binders.

## Suppliers, replacements and ownership

No new supplier replacement or duplication removal was needed during the port. Scope and ownership retains all package deferrals: pinned kernels/annihilators/spectrum closure, the native completed group algebra, generic completed tensor products and their dimensions, continuous induction, Banach duality, locally analytic function spaces, rational highest-weight representations, algebraic Peter–Weyl, the Amice basis, parent patching/support/benign geometry and smooth type theory. None was reintroduced as a Lean declaration. No section id moved or disappeared.

Every consumed supplier section was opened at main or the service’s open head:

| Supplier | Sections consumed and scope verified |
| --- | --- |
| CompletedCohomologyAndLocalGlobalCompatibility | 5.1, 5.2, 5.2a, 5.3: actual CEGGPS module, fixed-centre projectivity, typed quotients, benign/trianguline geometry, union-of-components support; extra contracts are explicit. |
| LocalGaloisDeformationRings | F.0.1, 1.1, 1.19, 3.1, 3.4, 3.9: coefficient products, dimensions, framed points, characters, Hodge/type quotients and generic geometry. |
| DeformationAndDerivedPatchingAlgebra | 1.12, 4.4, 4.6, 4.7: complete local coproduct, Jacobson arithmetic points, geometrically integral component pairs and reduced-flat point detection. |
| CompletedCohomologyPartII | F.1, F.2, F.4, 3.2, 5.8: the two dual topologies, compact tensors, torsion-free biduality, analytic vectors and uniform power-filtration growth with positive dimension. |
| NoncommutativeAndEquivariantIwasawa | F.1, 0.11: noetherianity, grade, finite-index comparison and canonical/global dimensions, including the zero-module convention. |
| PadicLocalLanglandsForGL2Qp | 0.1: general compact analytic foundations and analytic-vector density; 3.6a: rank-two, base-field-ℚ_p benign density distinguished from this continuation’s arbitrary F,d. |
| SmoothRepresentationsOfLocalGroups | SR.2.1, SR.3.1, SR.3.2, SR.5.2: induction, Bernstein/type background and shared WD carrier; three finite-coefficient families remain exact extra contracts. |
| EndoscopicTransferAndUnitaryTraceComparison | 10.21, 10.26, 10.30: supercuspidal and full WD correspondence and geometric normalization, with the CEGGPS twist applied here. |
| ModularityAndLanglandsExtensions | 2.1: potential diagonalizability and component transport; universal lift and prescribed determinant remain explicit contracts. |
| ArithmeticGaloisRepresentations | 1.3: continuous induction from open subgroups with finite-transversal topology, both adjunctions, projection formula and duality. |
| PadicHodgeTheory | 3.3–3.6: periods, WD, characters and residual/torsion-matching crystalline lifts, including unramified factor; signs transported. |
| ClassFieldTheory | Former 2.6 maps explicitly to Conventions C.6; Layers 7 and 9 give reciprocity and Weil groups. |
| ReductiveGroups | Layers 6, 10B, 10D: complete reducibility, split rational highest weights, coefficient transport and algebraic coefficient decomposition. |
| PadicFunctionalAnalysis | 4.3–4.4: analytic stages, polynomial density and the factorial-normalized Amice basis. |
| PadicMeasuresIwasawaAlgebras | Layer 1, 1.7: native completed algebra and regular measure module; projective products remain an explicit additional contract. |
| AdicSpacesPartIII | R2.9 and R3.4: the appropriate finite-reduction formal generic fibre, closed immersions and quasi-Stein Theorem A. |

Pinned definitions were read with their hypotheses: Module.annihilator is the kernel of the scalar-action map, Module.comap_annihilator retains its scalar tower, and Module.annihilator_eq_bot requires a ring/additive group. PrimeSpectrum.vanishingIdeal is the intersection of primes and zeroLocus_eq_univ_iff detects the nilradical, not zero. LinearMap.ker is comap of bottom; FaithfulSMul has no arithmetic content. Submodule.mem_iInf supplies the testing-kernel intersection. The three formally-smooth/inverse-function declarations used in 3.4 were opened with their completeness and invertible-linear-term hypotheses. The completed-algebra carrier and compact action were read in `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean` and `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Module.lean`; they do not provide compact projectivity or the fixed-centre decomposition.

Object searches used `roadmaps grep` across main and indexed open heads and a scan of every board-package README, followed by inspection of the matching scopes. Search objects included crystalline/benign density, capture of compact projectives, continuous tests, fixed-centre density, algebraic function density, simple characters/strata, completed tensor components and Berthelot fibres. The supplied 207-head index was also searched directly. The closest candidates have distinct ownership: HilbertModularVarietiesAndShimuraCurvesPartII owns the BHHMS global module; PotentialAutomorphyInfrastructurePartII owns polarized global lifting; TriangulineVarietyAndItsLocalModel owns local-model/refinement comparisons; CompletedCohomologyPartII supplies the general functional analysis; PadicHodgeParametersInLocallyAnalyticRepresentations owns Ext/trianguline parameter comparisons; SmoothRepresentationsOfLocalGroupsPartII owns unitary/smooth representation comparisons. None owns these general BIP arithmetic endpoints. The scope of 3.4’s algebraic-function density was searched separately; the Amice and Peter–Weyl inputs have their named owners and the general analytic density argument remains here.

The supplied overlap report has no other change to this folder, dropped cited id or citation defined only by an open revision. A fresh `roadmaps overlaps` call cannot examine this new local folder because it is not yet main or an open roadmap; this is a service lookup limitation, not a claim that the supplied overlap report was recomputed. No unknown open head was sought independently of the supplied tools/index.

## Dependencies still in open pull requests

- CompletedCohomologyAndLocalGlobalCompatibility
- LocalGaloisDeformationRings
- DeformationAndDerivedPatchingAlgebra
- CompletedCohomologyPartII
- NoncommutativeAndEquivariantIwasawa
- PadicLocalLanglandsForGL2Qp
- SmoothRepresentationsOfLocalGroups
- EndoscopicTransferAndUnitaryTraceComparison
- ModularityAndLanglandsExtensions
- ArithmeticGaloisRepresentations
- PadicHodgeTheory

Only an open revision defines: none identified. The other five suppliers are on main. No forbidden supplier or later roadmap is an input.

## Source verification

All thirteen legal source PDFs were fetched to scratch and their SHA-256 hashes matched `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/sources.toml`. The record here uses line numbering of the fresh text extraction; the roadmap retains the accepted source-version locators.

Primary endpoint and proof inputs read include BIP line 2217 (three densities), BIP line 2243 (component factorization), BIP line 2298 (inverse central character), BIP line 2332 (algebraic detection), BIP line 2347 (faithfulness); BIPD line 265 (prescribed determinant), BIPD line 331 (all-prime crystalline density), BIPD line 430 (rigid-to-scheme comparison); EP line 313 (tensor capture), EP line 554 (growth capture), EP line 780 (minimal-type occurrence and tame induction), EP line 854 (exact-depth counting), EP line 1193 (scheme support); DPS line 1828 (smooth-affine density), DPS line 1867 (tensor evaluation), DPS line 1897 (fixed-centre density); CEGGPS line 1566 (N=0 recognition), CEGGPS line 2673 (central transpose), CEGGPS line 2803 (fixed-centre projectivity); EG line 6766 (potential diagonalizability), EG line 6781 (universal regular crystalline lifts); NAK line 1311 (local benign points); HP line 2633 (completed-product dimensions), HP line 2687 (geometric splitting); IYE line 983 (closure), IYE line 994 (components); CON line 1054 (images of normalized components); AB line 369 (torsion-free domain theorem). DEJ’s noisy extraction was compared with the explicit BIPD point/completion restatement. No fetched text was treated as an instruction.

The inherited source corrections remain: the unramified character factor, a component through one point rather than containing the whole support, nonzero tensor factor, admissible-depth counting with bounded gaps, compact/dual central inversion, and reducedness when passing from pointwise vanishing to zero functions. This port does not restore any of the source formulas those witnesses refute.

## Adversarial mathematics record

Each row is a definition, assertion, API statement or convention. Computed controls test consistency and necessity of hypotheses; they are not proofs of the deep density or patching theorems. “Keep” means the recorded instance agrees with the retained statement. The source routes and exact hypotheses are in the corresponding README section.

| Statement | Instances tried | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Standing rank and residue size | d=1, p=2, f=1; excluded d=0,q=1 | d=1 and q=2>1; 2 divides 2d=2 | Local routes apply; patched route excluded | Keep |
| Coefficient splitting and set indexing | μ trivial; μ of order 2 | Number of characters 1; 2 | Components indexed by characters, not embeddings of residue fields | Keep |
| Compact dual topology | O^ℕ; coordinate vectors e_n | e_n→0 pointwise; supremum norms all 1 | Product topology differs from lattice norm | Keep |
| Arithmetic points and special fibre | R=O, generic point | kernel 0; closure V(0) contains (ϖ) | Scheme density includes special fibre | Keep |
| Rigid closed-set versus function density | L[x]/(x²) | One point is dense; x vanishes there but x≠0 | Reducedness needed for function converse | Keep |
| HT and dual algebraic convention | d=2, k=(2,0); k=(1,0) | a=(1,0), dual=(0,−1); a=(0,0), dual=(0,0) | Undualized (1,0) fails first witness | Keep |
| Supplier Hodge sign conversion | (2,0), (1,1), ε | (0,−2), (−1,−1), weight −1 here versus +1 there | Regularity preserved; repetition preserved | Keep |
| Reciprocity and central dual | F=ℚ_5,d=2,ψ=1,u=2 | Geometric δ(2)=2; arithmetic 1/2; compact 1/2, dual 2 | Inversion fixed on both sides | Keep |
| LLC twist | d=1; d=2 at diag(ϖ,1) | Twist 1; q^(1/2), opposite q^(−1/2) | Normalization discriminated | Keep |
| Native annihilator contraction | R→R/I, M=R/I | Ann_R M=I; contraction of 0 equals I | Scalar tower retained | Keep |
| Native faithfulness and nilradical | ℤ/4 acting on ℤ/2; L[x]/x² | Ann=(2)≠0; nilradical=(x)≠0 | Action zero does not force scalar zero; dense points miss nilpotents | Keep |
| Native kernel intersection | H=1, M=O; empty tests | ker(O→L)=0; empty intersection=M | Capture kernel convention fixed | Keep |
| Native completed action | H=C₂ with generator s; H=S₃ | s·(s·m)=m; (12)(23)≠(23)(12) | Multiplicative order and commuting scalars retained | Keep |
| Formal-smooth and inverse-function inputs | X=𝔸¹; X cut by t²=0 | Identity derivative 1 invertible; conormal t² has derivative 0 at 0 | Smooth finite-type hypothesis excludes thickening | Keep |
| Fixed-centre supplier contract | d=1, x_Z(5)=[2] | Compact [3], dual [2]; [2][3]=[1] | Transpose correct; contrary source labels cannot be imported literally | Keep |
| Capture-formalism supplier contract | H=1, O and O/ϖ | Maps O→L have kernel 0; every O/ϖ→L is 0 | Captured modules torsion-free | Keep |
| Algebraic-capture supplier contract | Group scheme 1 | Algebraic trivial line detects O by inclusion | Base case nonvacuous | Keep |
| Smooth-test supplier contract | GL₂ Steinberg versus separated-conductor type | Steinberg N≠0; principal-series N=0 | N=0 recognition requires the every-π clause | Keep |
| Crystalline-closure supplier contract | Two disjoint components both met | Closure union contains 2 of 2 components | Meeting each component completes union argument | Keep |
| Local-benign supplier contract | Rank one; rank two eigenvalues 1,p | No pair exclusions; ratio p forbidden | Regular weights alone insufficient in rank two | Keep |
| Framed-component supplier contract | F=ℚ_2,d=1,ρ̄=1 | det(−1)=+1 or −1; 2 generic factors | Both χ required | Keep |
| Completed tensor reducedness contract | O[[u]] and O[[v]]; factor O[x]/x² | Tensor O[[u,v]] reduced; x²=0≠x in bad factor | Reduced factor hypothesis matters | Keep |
| Geometric splitting contract | A=O[x]/(x²−ϖ) | 1 component before √ϖ; 2 after, factors x−a and x+a | Domain alone insufficient | Keep |
| Torsion-free Iwasawa domain contract | H=ℤ_p; H=C_p | k[[T]] domain; s·s^(p−1)=0 in k[s]/s^p | Torsion exclusion necessary | Keep |
| Projective-products contract | H=1; H=∏ℕℤ_p | Product O^I; regular local algebra has one indecomposable regular projective | General profinite scope retained, not restricted to analytic groups | Keep |
| Potentially diagonalizable lift contract | d=1; p=d=3 | One crystalline summand; 3 divides 6 | Lift exists outside patched range | Keep |
| Prescribed-determinant lift contract | d=1, determinant ψ | ρ=ψ, determinant ψ | Arbitrary crystalline ψ retained | Keep |
| Berthelot point/component contract | Dual numbers; cusp x=t²,y=t³ | One arithmetic point; cusp tangent dimension 2 versus normalization 1 | Component is an image, not normalization isomorphism | Keep |
| Crystalline inertial type contract | Trivial rank-one τ; W=0 | Genuine type dimension 1; zero dimension 0 | Zero test cannot be σ(τ) | Keep |
| Principal-series type contract | d=1,q=5,n₀=2,n=4 | Conductor count 125−25=100; shifted count 25−5=20 | Correct conductor convention retained | Keep |
| Minimal-stratum type contract | d=1; ramified quadratic | Heisenberg J/H index 1 and dimension² 1; even-depth class count 0 | Wrong hereditary-unit index and universal exact-depth count excluded | Keep |
| 1.1 point-set definition | d=1; Steinberg rank two | Σspcd=Σprnc=Σ_k; N≠0 excludes latter two | Rank and N distinguished | Keep |
| 1.1 coefficient extension API | Degree-two arithmetic residue extension, then degree two | Same point predicate at all four sets; total degree 4 | Transitivity preserves membership | Four sets, not three |
| 1.1 crystabelline API | Direct sum of two characters; nonzero N | WD character sum with N=0; N≠0 excluded | Principal-series cuspidal support does not force irreducibility | Keep |
| 1.1 induced irreducible API | Unramified quadratic ψ≠ψ^c; ψ=χ∘N | End dimension 1; χ⊕χη has End dimension 2 | Irreducibility must be imposed | Keep |
| 1.1 weights API | k=(2,0) | Dual highest weight (0,−1), not (1,0) | Agrees with conventions | Keep |
| 1.1 arithmetic avoidance API | R=O, O→L | p maps to nonzero p; residue L | No special-fibre arithmetic point | Keep |
| 1.2 lift application and coefficient descent | Rank one; p=d=3; O′ free of rank e over O | One PD summand; 3∣6; a⊗1=0 forces a=0 by faithful flatness | Globalisation remains separate hypothesis | Keep |
| 2.1 determinant/auxiliary component pairs | μ=1; A geometrically integral; A=O[[u,v]]/(uv) | 1 χ; 1 auxiliary prime or 2 primes | 1 or 2 patched components per χ | Keep |
| 2.1 geometric-integrality requirement | A=O[[x]]/(x²−ϖ) | After a²=ϖ: (x−a)(x+a)=0, 2 minimal primes | Domain variant too weak | Keep |
| 2.1 determinant-torsion versus determinant | d=1,F=ℚ_5 | μ_5∞=1, yet unramified variable remains | χ fixes no unramified value | Keep |
| 2.2 central character definition | d=1,ψ=1; d=2,ψ=1,u=2 | Exponent 0, δ=1; exponent 1, δ(2)=2 | Algebraic central exponents correct | Keep |
| 2.2 specialization sign | d=1,F=ℚ_5,x_Z(5)=[2] | Compact [3], smooth/Banach dual [2] | Opposite convention fails | Keep |
| 3.1 scalar consequence | R=ℤ/4,M=ℤ/2; captured O | Scalar 2≠0 acts as 0; inclusion O→L forces scalar 0 | Faithfulness needed to identify scalar | Keep |
| 3.1 capture necessity for endomorphisms | M=O⊕O/ϖ, φ(a,b)=(0,a mod ϖ) | φ(1,0)=(0,1)≠0; every test composite 0 | Capture cannot be omitted | Keep |
| 3.1 nonzero tensor | H=1,M=O,W=0 or L | Common kernels O or 0 | W≠0 necessary | Keep |
| 3.1 nonabelian and cyclic controls | S₃ over ℚ_5; cyclic C₃ | Trivial test misses 2-dimensional standard; trivial test misses nontrivial rank-one character | Group action is part of capture | Keep |
| 3.2 testing definition | H=1,M=O/ϖ; M=O²; V=0 | Double O-duals 0; O²; zero test 0 | Torsion-free biduality used only in its domain | Keep |
| 3.2 lattice independence API | Θ and ϖΘ | Integral lattice map multiplies by ϖ; rational map invertible | Rational comparison canonical | Keep |
| 3.2 dual-Hom API | M=O[[H]],dim V=r | Test rational dimension r; Hom(V,Π(M)) dimension r | Contragredient appears once | Keep |
| 3.2 finite-sum API | Test dimensions r=1,s=2 | Sum test dimension 3=1+2 | Additivity on finite sums | Keep |
| 3.2 scalar-precomposition API | H=1,M=O,a=ϖ | Test multiplication ϖ≠0; inclusion composed with ϖ≠0 | Zero action equivalent to vanishing all composites | Keep |
| 3.2 induction API | [K:H]=2,r=1; H=K | Dimensions 2=2; r=r | Cosets cannot be omitted | Keep |
| 3.2 continuous nonsmooth induction | K=ℤ_5×,H=1+5ℤ_5,χ(u)=u | Index 4; both Hom dimensions 4; χ nontrivial on every open subgroup | Smooth induction insufficient | Keep |
| 3.2 fibre occurrence API | M=O,Θ=O; zero fibre | Nonzero fibre L and Hom dimension 1; zero and Hom 0 | Coefficient extension understood | Keep |
| 3.2 agreement with parent type API | H=K,ξ=1,rank-one trivial type | Both constructions augmentation O | No second type carrier | Keep |
| 3.2 reducedness is arithmetic | B=O[[x]],M=B/x²,H=1 | Test M, Ann=(x²), x≠0 and x²=0 | Finiteness/projectivity do not imply reduced image | Keep |
| 3.3 closed-subspace criterion | H=1,Π=L or 0 | Invariants 1 or 0, index 1 | Positive lower bound forces Π=L | Add dimension-zero route and Check |
| 3.3 uniform growth input | H=ℤ_p²,N=k[[T₂]], power p^n | Coinvariants p^n; index p^(2n), exponent 1/2 gives p^n | Correct positive-dimension formula | Keep |
| 3.3 power-filtration restriction | Same N, p^nℤ_p⊕p^(2n)ℤ_p | Coinvariants p^(2n); predicted p^(3n/2) | Anisotropic replacement false | Keep |
| 3.3 cyclic full-dimension criterion | Domain k[[T]],I=(T); H=ℤ_p×C_p,I=(s) | Dimensions 0<1 in domain; dimension 1 in torsion case with quotient rank 1 versus regular rank p | Domain and torsion-free hypotheses essential | Keep |
| 3.3 principal-family growth | d=1; d=2 | q^n; q^(2n)·q^(2n)=q^(4n) | Squares times counts match group index exponent d² | Keep |
| 3.3 admissible-depth capture | E=ℚ_5(√5), n odd/even | Odd depths have classes; even depths 0; predecessor gap 1, admissible gap 2 | Cumulative estimate survives absent even depths | Keep |
| 3.3 bounded-gap argument | e=2,q_E=5,n₀=1 | j≡1 mod 8; gcd(2,j)=1; residue u^j=u | Bounded gaps, no universal depth assumption | Keep |
| 3.4 smooth-affine density | 𝔸¹; empty rational component | Polynomial image dense; empty-target space 0 | Rational Zariski-density hypothesis unnecessary in route | Keep |
| 3.4 polynomial convergence Check | p=2,n=1, P=1−x² | On 2ℤ₂ error norm≤1/4; on 1+2ℤ₂ error norm≤1/4; limiting values 1 and 0 | Locally analytic density differs from equality | Keep |
| 3.4 algebraic evaluation | G_m,V=z^n | f(h)=h^(−n); translation g gives g^n; opposite h^n gives g^(−n) | Inverse action fixed | Keep |
| 3.4 all irreducibles needed | GL₂, determinant powers; h₁₁ on SL₂ | det=1 at identity and rotation; h₁₁=1 versus 0 | Determinant characters insufficient | Keep |
| 3.4 Cδ definition | H=Z_H=ℤ_5×,δ(z)=z | f(h)=h^(−1)f(1); 2 acts by 2; constant 1 fails 1=1/2 | Object and sign determined | Keep |
| 3.4 fixed-centre evaluation | Same H,T=δ,Π=Cδ or trivial L | Image line=L; Hom(δ,1)=0 and image 0 | Direct-summand hypothesis discriminated | Keep |
| 3.4 T≠0 and zero Π | H=1,T=L^r,r>0; T=0; Π=0 | e₁*⊗e₁↦1; zero factor image 0; zero target image 0 | Nonzero factor necessary | Keep |
| 3.5 algebraic detection | d=1; d=2 central exponent ±1 | Character θ; dominant (1,0) and (0,−1), sums +1 and −1 | Every integer exponent represented | Keep |
| 3.5 central-character realization API | d=2, determinant powers only | Central exponents 2n miss ±1 | General highest weights required | Keep |
| 4.1 component through a point | L[x,y]/xy; points (1,0),(0,0) | First lies on one axis; second on two; union contained in neither one | Select a component through y | Keep |
| 4.1 contraction dimension | R=O[[u]],A=O[[x]]/x(x−ϖ) | Minimal quotient dimension 2=2+1−1, contraction 0; (x,u) quotient dimension 1, contraction (u) | Minimality essential | Keep |
| 4.1 determinant-character uniqueness | μ=C₂, characteristic zero versus mod 2 | +1≠−1; both reduce to 1 | χ unique only in generic fibre | Keep |
| 4.2 local faithfulness | Two χ,two auxiliary components; dual numbers | One selected per χ gives 2/2 local but 2/4 patched; nilradical (x)≠0 in dual numbers | Local conclusion and reducedness exact | Keep |
| 5.1 vanishing-ideal criterion | O[[x]]/x²; O[[x]]/(ϖx) | x vanishes at all points but x≠0; x becomes 0 after inverting p but x≠0 | Both reducedness and flatness necessary | Keep |
| 5.1 zero tests | N=0; empty capturing family | Ann N=R∞, quotient 0, spectrum empty; empty capture forces M=0 | Unit ideal/zero ring conventions agree | Keep |
| 5.1 nonfaithful support variant | R=O[[x]],M=R/(x) | Ann=(x); generic test closure V(x) | Additional Σ⊆V(Ann) gives both inclusions | Keep |
| 5.2 crystalline density | p=2,d=1,F=ℚ_2,ρ̄=1 | (−1)^n=+1 for even n, −1 for odd; 2 of 2 components met | All-prime route needed | Split route inputs |
| 5.2 rigid component image | Cusp x=t²,y=t³ | Tangent dimensions 2 versus 1 at origin | Normalization image, not isomorphism | Keep |
| 5.3 fixed-weight crystabelline density | Rank one characters order dividing p^n; fixed τ and k | p^n characters; fixed τ,k restrict to one Hodge/type quotient | Vary smooth type while fixing weight | Keep |
| 5.3 N=0 recognition | GL₂ finite Steinberg K-test | Generic principal-series K(1)-invariants 1⊕St, N=0; Steinberg constituent N≠0 | Broad K-test cannot force N=0 | Keep |
| 5.4 supercuspidal density | E/F unramified quadratic,ψ=χ∘N versus ψ≠ψ^c | χ⊕χη reducible versus irreducible rank 2 | Irreducibility clause necessary | Keep |
| 6.1 benign density | d=1,p=2; eigenvalues 1,p at f=1 | Benign=crystalline, both parity components; forbidden ratio p | Weights vary; local route independent of patching | Split route inputs |
| 6.2 prescribed-type ideals definition | W=0; genuine nonzero type family | J=R,C=∅; J=0,C=Spec R | Zero data excluded from types | Keep |
| 6.2 radical/p-saturated API | R=O[[x]],test quotient O via x=0 | J=(x) radical, ϖa∈J forces a∈J | Flat/reduced quotient conditions used | Keep |
| 6.2 point-recognition API | Rank-one trivial τ | Test point inertia trivial after algebraic factor; N=0 | Image lies in Στ | Keep |
| 6.2 vanishing-ideal API | R=O,nonzero trivial test | Generic arithmetic kernel 0=J | Equality uses characteristic-zero tests | Keep |
| 6.2 full-support API | μ=C_(p^a) and varying exponents | n mod p^a gives p^a distinct torsion characters; a=0 gives 1 | All components available | Keep |
| 6.2 zero-test API | W=0 | Intersection of unit annihilators R; V(R)=∅ | Degenerate test computed | Keep |
| 6.2 single-weight restriction API | Rank one,τ=1,k=0 | Inertia forced unramified; ramified finite-order characters excluded | Proper support possible | Keep |
| 6.3 prescribed-type density | Fixed τ, varying weights; W=0 control | p^a torsion restrictions; zero test contributes 0 points | Nonzero σ(τ), varying weights indispensable | Keep |
| 6.4 minimality definition | Totally ramified uniformizer; unramified generating unit | gcd(e,1)=1,residue degree 1; gcd(1,−n)=1,residue ξ̄ | Positive and negative valuations consistent | Keep |
| 6.4 embedding/conjugacy API | Change basis P; order 𝔄 | Chain P𝔭_E^i, order P𝔄P⁻¹, same occurrence predicate | Marking does not change set | Keep |
| 6.4 potential-crystalline API | Supercuspidal parameter | Irreducible inertia orbit, monodromy N=0 | N≠0 excluded | Keep |
| 6.4 deep-to-full inclusion API | F=ℚ_3(ζ_3),d=1,shallow depth 1 | Least m=1, deep n≥3; shallow character trivial on U², deep θ nontrivial on U^n | Inclusion strict | Keep |
| 6.4 tame induction API | E=ℚ_5(√5); wild cubic over ℚ_3 | e=2 prime to 5; e=3 divisible by 3 | Character equivalence used only tame | Keep |
| 6.4 coefficient extension API | Scalar extension degree e then e′ | Same stratum occurrence, total degree ee′ | Underlying point predicate unchanged | Keep |
| 6.4 minimal-element nonexample | e=6,f=2 over ℚ_5 | Sixth powers in 𝔽₂₅× have size 24/6=4=|𝔽_5×| | Cannot generate degree-two residue extension | Keep |
| 6.5 minimal-stratum density | p=5,d=2,E=ℚ_5(√5); p=d=3 | 5∤4, minimal uniformizer; 3∣6 excludes wild case | Density scope exact | Keep |
| 6.5 deep versus full sets | Rank-one unramified point; shallow depth-one point | First has no positive-depth stratum; second n=1<3 lies in full but no deep subset | Density by inclusion, not equality | Keep |
| Downstream local versus patched faithfulness | Two auxiliary components, one selected per χ | Coverage 1/2 per χ versus all χ locally | No unsupported Ann_R∞=0 conclusion | Keep |
| Worked unramified lift correction | κ(5)=[2] over ℚ_5 | Units-only lift residual value 1; corrected unramified factor residual value 2 | Required residual character recovered | Keep |
| Worked tensor source correction | H=1,M=O,W=0 | M⊗W=0, original common kernel 0, tensor-family kernel O | Nonzero rank needed to descend equality | Keep |

## Unresolved conditions and limits

The accepted conditional supplier work remains conditional. The seventeen interfaces are: fixed-centre-specialisation; capture-formalism; algebraic-capture; smooth-test-quotients; crystalline-closure-components; local-benign-crystalline-points; framed-ring-components; completed-tensor-reduced-equidimensional; geometric-component-splitting; torsion-free-iwasawa-domain; crystalline-inertial-types; principal-series-types; minimal-stratum-types; projective-products; pd-crystalline-lift; crystalline-lift-prescribed-determinant; and berthelot-points-components. The count is the mechanical inventory of the explicit “What … must provide” paragraphs, rather than the historical review summary.

The parent’s fixed-centre labels still use the opposite character at its head. The retained exact contract states the transpose-compatible sign proved in BIP line 2298 and CEGGPS line 2693. No supplier file was edited or silently assumed corrected. These contracts specify future library work; the port does not claim their implementations exist. No port-specific build, gate, ownership or dependency defect remains after validation.

No suspicious instruction passage was encountered. No source-manifest, Lake pin, repository infrastructure, top-level roadmap list or merge-order file was changed.


Pull request: #2262 (roadmap/completed-cohomology-and-local-global-compatibility-part-ii at 1a53e38)
