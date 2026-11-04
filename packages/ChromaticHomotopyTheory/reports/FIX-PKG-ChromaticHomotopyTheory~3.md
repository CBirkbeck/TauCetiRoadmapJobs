# ChromaticHomotopyTheory repair report

## F01 (P2) — applied

Undefined height-zero periodicity on arbitrary endpoints → the relative condition on πₖ(f)⊗ℤ[1/p], k≥2, with its fiber equivalence proved by flat exact tensor. Updated §§3.1, 6.3, 6.4, Layer 3 dependencies and the Lean headline description. Added the BS₃ identity and both prime cases of the Eilenberg–Mac Lane projection.

## F02 (P2) — applied

Associative unital rings → spectra with specified multiplication and two homotopy unit identities. Replaced the associative-unit argument by smash nilpotence followed by a fixed iterated multiplication. Updated scope, §3.3, both dependency occurrences and the Lean description. Added the nonassociative rational example and retained associative rings as applications.

## F03 (P2) — applied differently

E∞-only hypotheses → absolute Dₚ, relative Dₚ-E and homotopy-E-algebra hypotheses, with E∞ consequences. Updated scope, §§10.1–10.4, dependencies, source locators and Lean descriptions. Relative Definition 3.1 omits the absolute unit square: its operation need not preserve 1. Accordingly the general operation states zero-detection; coherent multiplicative/unit laws remain in the E∞ specialization.

## F04 (P2) — applied

Level three → every integer N≥1, on smooth level stacks over ℤ[1/N]. Updated ownership, both supplier contracts, §12.3, §12.4’s specialization, Layer 12 dependencies and the Lean description. Retained N=1,2 as stacks and N=3 at 2 as the supersingular input; added group-order, action-order and determinant witnesses.

## F05 (P3) — applied

An implicit construction inside the route → a nullification target before use, with derived mapping-space universal property, natural unit, functoriality, null output, equivalence on null inputs and idempotence. Added the precise p-local periodic-comparison range and all three requested evaluations. Distinguished the source’s rational comparison from arbitrary-input p-inversion. Updated ownership and the Lean description.

## F06 (P3) — applied

The BHM locator ending at Lemmas 3.2–3.3 → that unchanged locator followed by Lemma 3.5, p.6, in the existing manifest entry and References item. The key, retrieval fields and other locators are unchanged.

## Evidence and mathematical qualifications

The six findings were settled separately. None requires an edit to another package or a merge-order decision. No new supplier gap was needed.

| Finding | Source and direct verification |
| --- | --- |
| F01 | lmmt line 386 and line 398 formulate the all-basepoint map theorem and reduce it to the fibers; lmmt line 394 supplies simply connected p-inversion acyclicity. In the fiber sequence, tensor the abelian segments πₖ₊₁X→πₖ₊₁Y→πₖF→πₖX→πₖY. Isomorphisms in degrees k and k+1 give πₖF[1/p]=0. Conversely vanishing for all k≥2 gives isomorphisms for k≥3, and π₁F=0 supplies the k=2 endpoint. The component and fundamental-group conclusions come from connectivity, including for nonabelian π₁. |
| F02 | lmmt line 317 explicitly gives the unital-magma generality. The E₁ telescope construction is lmmt line 304 through line 310. Apply smash nilpotence to the tensor’s unit; composing a zero tensor power with any fixed parenthesized multiplication gives the zero unit. The unit identity then gives id=0. Associativity of the other tensor factor never enters. |
| F03 | Absolute data: hahn line 22 through line 36. Relative data and base change: hahn line 187 through line 202. Upward acyclicity: hahn line 422. Dₚ Tate consequence and weaker intermediate result: hahn line 432 through line 450. The h=0 Dₚ argument is identified at hahn line 43 and line 87. These are the numbered results in the retrieved v2, whose header dates that revision to 2022. |
| F04 | mm line 1757 fixes an arbitrary positive level; line 1764 gives the full GL₂ torsor, line 1774 restricts scheme representability to N≥3, line 1776 explains the level-two inertia, and line 1801 states the faithful Galois theorem. No scheme restriction is added to the theorem. |
| F05 | bhm line 210 through line 222 defines nullification, its unit and periodic comparisons; line 225 states the connectivity range. Its p-local convention is bhm line 30. With d the first nonzero homotopy degree of V, “d-connected” there means vanishing through degree d, as now written explicitly. The three evaluations follow from this reflector’s universal property and H̃*(V;ℚ)=0. |
| F06 | bhm line 258 through line 265 is precisely the fiber-sequence homology comparison used in §6.1; line 233 is instead the connected-cover periodicity lemma. |

The relative-operation distinction in F03 is essential to making the requested generalization true. Definition 3.1 supplies an E-linear map from cyclic homotopy orbits that restricts to multiplication; it does not require its value on the extended unit to be the constant unit. For R=E at p=2, multiply the usual relative factorization by the class 1+z in E⁰(BC₂). At z=0 its restriction remains 1, so the underlying product is unchanged, but P(1)=1+z. At height two, reduction modulo (2,u₁) gives the ring 𝔽₄[[z]]/(z⁴); there z≠0 and (1+z)²−(1+z)=z²+z≠0. Thus neither the unit law nor multiplicativity follows from the relative data alone. Theorem 3.3’s zero-detection statement still applies to those data. No free predicate or stronger substitute for that definition was introduced.

The Tate route likewise uses only the homotopy-unital action supplied by the weaker algebra structures. Its unit retract suffices to transfer acyclicity; the text does not assume an unprovided coherent module structure on a Dₚ-algebra.

## Computed adversarial mathematics pass

This pass records computations, including negative controls. It checks statements and interfaces, not formal proofs of their constructions. Coherent identities and naturality are evaluated on the indicated zero, identity, unit and finite-source cases. No claim that an admitted Lean build verifies truth is made. All new and changed mathematical assertions, and the unchanged targets and examples they interact with, are covered below; the remaining layers were also recomputed to check consistency of the generalizations.

| Statement | Instances tried | Values or maps computed | Result | Change |
| --- | --- | --- | --- | --- |
| Universe comparison | point; countable wedge | cardinalities 1, ℵ₀; enlargement preserves the indexed summands | Consistent | None |
| Suspension grading | S; ΣS | π₁ΣS=π₀S=ℤ | Consistent | None |
| Symmetry convention | degrees (1,1), (0,1) | signs −1, +1 | Consistent | None |
| Cofiber convention | id:S→S; 0→S | cofibers 0, S; boundary goes k→k−1 | Consistent | None |
| Finite p-local carrier | S_(p); S/p; infinite wedge | π₀=ℤ_(p), 𝔽_p; an infinite-wedge identity cannot factor through a finite subwedge | Consistent | None |
| P-local duality | S/p; S_(p) against Hℤ | D(S/p)=Σ⁻¹S/p; integral Hom π₀=0 versus tensor π₀=ℤ_(p) | Target locality necessary | None |
| Bousfield class order | S/p, Hℚ | Hℚ∧S/p=0 while S/p≠0, fixing the implication direction | Consistent | None |
| Bottom detector convention | S/q, q≠p; S_(p) | S[1/p]∧S/q=S/q, Hℚ∧S/q=0; both bottoms give Hℚ on S_(p) | Consistent | None |
| Connected-cover indexing | K(A,2); pointed two-point set | K(A,2)⟨3⟩=*; τ≤₂ retains A; X⟨1⟩ is one point | Consistent | None |
| Formal-coordinate sign | multiplicative law at 2,3 | [2]=2X+X²; [3]=3X+3X²+X³; residues X²,X³ | Consistent | None |
| Morava periodicity sign | h=1; ψ⁻¹ | u has degree −2, w=u⁻¹ degree +2; both go to their negatives; square=id | Consistent | None |
| Modular weight convention | Δ, Δ²⁴ | weights 12,288; degrees 24,576 | Consistent | None |
| Zero and sphere localization | detectors 0,S,Hℚ on S | outputs 0,S,Hℚ | Consistent | None |
| Complex orientation | Hℤ; KU | additive law X+Y; KU coordinate gives X+Y+XY | Consistent | None |
| Geometric height | additive and multiplicative laws over 𝔽₂,𝔽₃ | zero p-series has height ∞; X² and X³ have height 1 | Consistent | None |
| Height’s field domain | characteristic-p field; square-zero extension | field computes height; nilpotent thickening is tested through field points, not a new field | Consistent | None |
| BP grading | p=2,3; v₀,v₁ | degrees 0,2,4; at 3 π₂BP=0 versus π₂MU_(3)=ℤ_(3) | Consistent | None |
| Morava coefficients | K(0), K(1) at 2, H𝔽₂ | ℚ only in degree 0; 𝔽₂ in all even degrees; 𝔽₂ only in degree 0 | Consistent | None |
| Periodic cofibers | n=1,p=2 | BP⟨1⟩/v₁=Hℤ_(2); k(1)/v₁=H𝔽₂; π₀ differs | Consistent | None |
| Type | S_(p), S/p,0 | types 0,1,∞; smash types max(0,1)=1, max(1,∞)=∞ | Consistent | None |
| Nilpotence endpoints | H𝔽_p; zero ring | finite-height detectors vanish on H𝔽_p but H𝔽_p∧H𝔽_p≠0; zero unit has first power 0 | Consistent | None |
| Thick subcategories | sphere, Moore,zero | generated categories C₀,C₁,{0}; rational smashes Hℚ,0,0 | Consistent | None |
| Self-map degree | p on S/p; v and v² | p acts by 0 on K(1); degrees d,2d | Consistent | None |
| Eventual compatibility | id; v and v²; sign | exponents (1,1), (2,1); (−1)²=1 | Consistent | None |
| §3.1 periodic groups | *; Hℤ; finite Postnikov spaces | mapping colimits 0,0,0 at positive height | Consistent | None |
| Periodic functor identity/composition | id_*; id on type-n source | maps 0→0; surviving periodic identity remains the identity | Consistent | None |
| Periodic shift and powers | transition v; even subsequence | degree changes k→k+d; the even subsequence has the same colimit | Consistent | None |
| Stable/Ω∞ periodic comparison | X=0,T(n) | groups 0 on both sides; nonzero telescope groups on both sides | Consistent | None |
| Absolute height zero | ℤ/q, q≠p; ℤ/p | tensor with ℤ[1/p] gives ℤ/q,0 | Consistent | None |
| Relative height-zero domain | id on BS₃ | π₁=S₃; higher maps 0→0 and fiber groups 0 | Admitted without abelian π₁ | F01 |
| Relative fiber equivalence | projection with fiber K(ℤ/p,2) | only fiber group ℤ/p becomes 0; maps on p-inverted higher groups are isomorphisms | Both directions agree | F01 |
| Relative negative control | projection with fiber K(ℤ/q,2), q≠p | π₂F[1/p]=ℤ/q; map ℤ/q→0 is not injective | Excluded | F01 |
| Relative endpoint exact sequence | 2-connective map; k=2 | π₁F=0; exact tensor sequence ends at zero, yielding surjectivity as well as injectivity | No nonabelian tensor used | F01 |
| §3.2 connective-cover invariance | Hℤ; Σ⁻¹Hℚ | all positive-height periodic groups vanish before/after cover | Consistent | None |
| Telescope orthogonality | K(n), K(i), Hℚ,H𝔽_p | K(n)∧T(n)≠0; the others give 0 for i≠n, including 0,∞ | Consistent | None |
| Completion comparison | S→S_p^∧ | positive-height equivalence; degree-zero p-inverted map ℤ[1/p]→ℚ_p is not onto | Consistent | None |
| Periodic detection of acyclicity | Hℤ; type-n V | groups vanish and T(n)∧Hℤ=0; periodic id_V survives and T(n)∧V≠0 | Consistent | None |
| §3.3 magma unit diagrams | zero magma; nonzero vector space with zero product | on 0 both diagrams are id₀=0; zero product on nonzero input gives 0≠id | Correct object distinguished | F02 |
| Magma comparison | R=0,K(n) | detector pairs (0,0), (nonzero,nonzero) | Both implications consistent | F02 |
| Nonassociative example | rational basis 1,a,b | (a²)a=ba=0; a(a²)=ab=1; both positive-height smashes are 0 | General input accepted | F02 |
| Unit-nilpotence route | zero η^⊗r in a unital magma | iterated multiplication gives η=0; μ(η⊗id)=id=0 | Associativity unnecessary | F02 |
| Height-zero exception | H𝔽_q, q≠p | T(0)-smash H𝔽_q≠0; K(0)-smash 0 | Excluded from comparison | None |
| Telescope construction | Tel(0); Tel(id_V) | outputs 0,V; positive powers have cofinal identical limit | Consistent | None |
| §4.1 finite towers | n=0; S/q | bottoms Hℚ,S[1/p]; outputs on S/q are 0,S/q | Consistent | None |
| Tower units and transitions | X=0,Hℚ | all maps zero on 0; all units/transitions id on Hℚ | Consistent | None |
| Smashing/idempotence API | localized Hℚ; zero input | Hℚ⊗Hℚ=Hℚ; L(0)=0=L(S)⊗0 | Consistent | None |
| §4.2 finite kernels | n=0; S/p,S/q | p-inversion kills S/p and fixes S/q; rationalization kills both | Consistent | None |
| §4.3 p-local restriction | S_(p); S/q | common output Hℚ; unrestricted outputs S/q and 0 | Exact domain retained | None |
| §4.4 fracture | (E,F)=(0,S),(S,0) | vertices (X,X,0,0), (X,0,X,0); both pullbacks X | Consistent | None |
| §4.5 bottom comparison | S/q,0 | L₁^(p,f) values S/q,0 equal p-inversions S/q,0 | Consistent | None |
| Layer 4 examples | Hℚ,H𝔽_p | both towers give Hℚ,0 respectively at every n | Consistent | None |
| §5.1 finite telescopic functor | *,finite Postnikov X | spectra 0,0; all homotopy colimits zero | Consistent | None |
| Finite-source contravariance | identity on V; v→v² | precomposition id; power comparison an equivalence of the same colimit | Direction consistent | None |
| §5.2 Bousfield–Kuhn comparison | Ω∞0, Ω∞T(n) | Φ values 0,L_T(n)T(n)≠0 | Consistent | None |
| Local-valued uniqueness range | Σ⁻¹Hℚ at height 0 | Ω∞=* but T(0)-local output Σ⁻¹Hℚ≠0 | Height-zero extension excluded | None |
| §5.3 detection retract | identity; negative rational spectrum | id retracts to id; Σ∞Ω∞Σ⁻¹Hℚ=0 loses nonzero height-zero input | Consistent | None |
| Absent arbitrary preservation | Hℤ→0 | T(n)∧Hℤ=0; Σ∞ℤ has a sphere retract and nonzero T(n)-smash | Consistent | None |
| Layer 5 discrete example | S⁰ | Φ_nS⁰=0; L_T(n)Σ∞S⁰=L_T(n)S≠0 | Consistent | None |
| §6.1 Serre grading | single cell; d₂ at (2,t) | graded piece Σ²(E∧F₊); d₂ lands (0,t+1), total degree drops 1 | Consistent | None |
| Serre monodromy | reflection torus | differential 2; kernel 0,cokernel ℤ/2; H₁=ℤ⊕ℤ/2,H₂=0 | Consistent | None |
| Wrong constant transport | same torus | differential 0; H₁=ℤ²,H₂=ℤ | Excluded | None |
| Serre convergence range | E=KU, base ℂP∞ | E² nonzero only when s,t even; every differential 0; bounded-below exhaustive filtration computes KU_*ℂP∞ | Consistent | None |
| Serre zero/basepoint cases | E=0; Y=* | all pages 0; single-column value E_*F₊ | Consistent | None |
| §6.2 arbitrary-base comparison | id_Y; ∅→*; two-point fiber | augmentations id_E, 0→E, fold E⊕E→E with fiber E | Precise hypothesis necessary | None |
| Fiber Kan formula | id_Y; X→* | point-fiber colimit D_y; total colimit colim_XD | Naturality directions consistent | None |
| Nullity definition | Z=*; Z=K(ℚ,2) | evaluation *=*; pointed mapping groups H̃^(2−j)(V;ℚ)=0 | Null outputs identified | F05 |
| Nullification unit/universal property | X=V; null target Z | Map(*,Z)=Z≃Map(V,Z); pointed mapping spaces both contractible | Correct reflector | F05 |
| Nullification on null input | X=K(ℚ,2) | N_VX=X, unit id up to equivalence; π₂=ℚ | Constant-point alternative excluded | F05 |
| Nullification on V | noncontractible V | N_VV=*; identity alternative gives V≠* | Identity alternative excluded | F05 |
| Nullification on wedge | V∨K(ℚ,2) | output K(ℚ,2); Map_* into null Z is *=factor times Map_*(K(ℚ,2),Z) | Unit is collapse of V | F05 |
| Nullification functoriality | identities of V,K(ℚ,2) | induced identities on *,K(ℚ,2); composing collapse with id changes nothing | Consistent | F05 |
| Null output and idempotence | V; K(ℚ,2) | N²V=*=NV; N²K(ℚ,2)=K(ℚ,2)=NK(ℚ,2) | Both unit comparisons equivalences | F05 |
| Periodic-comparison range | high-connected p-local rational K(ℚ,r), r>d | unit equivalence; π_r=ℚ on both sides and all positive periodic groups 0 | Rational and p-inverted meanings agree here | F05 |
| Periodic unit law on V | type-(n+1) suspension V | rational groups 0, v_i groups 0 for 1≤i≤n; output * has those same values | Consistent | F05 |
| §6.3 sharp bound | n=1, F=*; F=K(ℤ/p,n) | m=2, reduced spectrum 0; boundary input has connectivity n and nonzero K(n)-homology | Sharp range respected | F01,F05 |
| §6.3 nonabelian base | BS₃×K(ℤ/p,2)→BS₃ | π₁ iso S₃→S₃; all positive periodic fiber groups 0; π₂F[1/p]=0 | Admitted | F01 |
| §6.3 prime-to-p obstruction | replace p by q≠p in fiber | H̃₂(F;ℤ[1/p])=ℤ/q≠0, matching failed height-zero hypothesis | Excluded | F01 |
| §6.4 suspension–loop preservation | id; Hℤ→0 | identity cofiber 0; Hℤ fiber has π₀=ℤ and fails m≥2 | Consistent | F01 route |
| §6.4 relative bottom comparison | finite-local equivalence with connective fiber | T(0) smashes its cofiber to 0, so each higher π-map tensored with ℤ[1/p] is an isomorphism | Correct map hypothesis supplied | F01 |
| §7.1 deformation coefficients | h=1,2,3 | parameter counts 0,1,2; coefficient rings ℤ_p,W(𝔽_p²)[[u₁]],W(k)[[u₁,u₂]] | Consistent | None |
| Marked realization range | height ∞ additive law | p-series 0, no finite h coefficient presentation | Excluded | None |
| Orientation grading map | v_i↦u_i u^(1−pⁱ) | degree (−2)(1−pⁱ)=2(pⁱ−1) | Consistent | None |
| §7.2 actions | height-one sign; residue fields h=2,3 | π₀ fixed, u↦−u; residue Galois orders 2,3 | Nontrivial spectrum action retained | None |
| Adams convention | a∈ℤ_p^×; degree 2m | action a^m; on u in degree −2 it is a⁻¹u | Consistent | None |
| §8.1 height ideal | multiplicative law; additive field law; zero ring | (p,v₁)=(1); all generators 0≠1; 0=1 in zero ring | Exact object and zero case agree | None |
| Locality of modules | R=0; height-one periodic R | sole zero module; v₁ unit gives L₁-local modules | Consistent | None |
| §8.2 restricted telescope comparison | X=L_(n−1)S,K(n) | localization pairs (0,0),(K(n),K(n)) | Consistent | None |
| KU coefficient distinction | KU_(p), KU_p^∧ | π₀=ℤ_(p),ℤ_p | Completion not erased | None |
| §8.3 telescope separation | n=1; BHLS witness n≥2 | equality at 1; L_T(n)X=X≠L_K(n)X above 1 | No conflict with zero-detector comparison | None |
| §8.4 truncation support | BP⟨0⟩; i>n | BP⟨0⟩=Hℤ_(p), positive T(i)-smash 0; cofiber induction gives T(i)∧E(n)=0 | Consistent | None |
| BP inversion boundary | n=1, rational degree −(2p−2) | coefficients 0 before inversion, ℚ after | Stronger finite-local equivalence excluded | None |
| Ravenel class versus object | BP[p⁻¹],Hℚ | same acyclics; degree 2p−2 contains ℚ,0 | Class equality not spectral equality | None |
| Hopkins–Ravenel smashing | n=0, X=S/p | L₀S∧X=Hℚ∧S/p=0=L₀X | Consistent | None |
| §9.1 local norm | G=1; ℚ with C₂ | id with cofiber 0; multiplication 2 with inverse 1/2 | Consistent | None |
| Raw norm negative control | H𝔽₂ with C₂ | degree-zero norm 0; raw Tate nonzero | Consistent | None |
| §9.2 transfer normalization | C₂,C₃,S₃ on rational constants | maps 2,3,6 and sections 1/2,1/3,1/6 | Nonabelian test agrees | None |
| Transfer versus augmentation | integral C₂ | transfer degree 2 has no degree-zero integral section; augmentation has a basepoint section | Correct map distinguished | None |
| §9.3 localized Tate vanishing | KU_p^∧, trivial C_p | raw π₀=ℚ_p(ζ_p)≠0; T(1)-localization 0 | Localization essential | None |
| Induced Tate input | Ind₁^G L_T(n)S, G=C₂,S₃ | Shapiro gives both local norm endpoints L_T(n)S and map id; raw Tate 0 | No illicit averaging | None |
| §9.4 raw blueshift | n=1, KU_p^∧; X=0 | rational raw output; zero output 0 | Loss is a bound, not exact height | None |
| §9.5 Euler inversion at 2 | p=2 | polynomial 2+z; z=−2; invert z to obtain ℚ₂ | Consistent | None |
| Euler inversion at 3 | p=3 | polynomial z²+3z+3; (ζ₃−1)²=−3ζ₃; field ℚ₃(ζ₃) | Nonzero denominator justified | None |
| Layer 9 Hℤ example | trivial C₂ | π_even Tate=ℤ/2, π_odd=0; p-inverted and positive-height smashes 0 | Input is not finite-local | None |
| Absolute Dₚ underlying laws | H𝔽_p with retained structure | unit product 1·x=x; P(0)=0,P(1)=1 | General data sufficient | F03 |
| Absolute Dₚ unit square | θ=0 on H𝔽_p | extended unit goes to 0 while η sends 1 to 1 | Wrong factorization excluded | F03 |
| Absolute Dₚ obstruction | K(r), r≥1 | K(r−1)-smash 0, K(r)-self-smash nonzero | Bare multiplication insufficient | F03 |
| Relative Dₚ-E base change | A=0; A an E∞ sphere | L_K(E⊗0)=0; L_K(E⊗S)=E | Relative objects determined | F03 |
| Relative operation | R=0; standard R=E | zero map 0→0; P_E(0)=0,P_E(1)=1 | Coherent specialization retained | F03 |
| Relative unit negative control | p=2,R=E, twist θ by 1+z | restriction at z=0 remains 1; P(1)=1+z≠1 | Unit square not silently assumed | F03 |
| Relative multiplicativity negative control | height two, reduce (2,u₁) | in 𝔽₄[[z]]/(z⁴), b²−b=z²+z≠0 for b=1+z | General relative law not asserted | F03 |
| E∞ power laws | x=0,1; x+y=1+1 | P(0)=0,P(1)=1; cross term is transfer, not generally zero | Consistent | F03 scope |
| Divisibility range | p=2,h=2,k=1 | mod (2,u₁), [2](z) starts u₂z⁴, so g₂ starts u₂; before reduction u₁z² obstructs division | Correct quotient | None |
| Empty quotient range | h=0,1 | no k with 1≤k<h | Separate May/Bockstein routes retained | F03 |
| Relative zero-detection | x=0; R=0; coefficient g₂ case | 0 maps to 0; all cofibers 0 for R=0; regular quotient kills the stated ideal | Consistent | F03 |
| §10.2 Hahn implication | Dₚ H𝔽_p; zero ring | consecutive K-smashes (0,0); (0,0) | Includes weakened inputs | F03 |
| Hahn negative control | bare K(h), h≥1 | lower detector 0, next detector nonzero | Dₚ hypothesis substantive | F03 |
| Hahn bottom implication | H𝔽_p; H𝔽_q, q≠p | T(0)-smashes 0,H𝔽_q; rational smashes 0,0 | Only implication, not equality | F03 |
| §10.3 height threshold | 0,H𝔽_p,Hℚ,H𝔽_q | heights −1,−1,0,0; latter two have nonzero T(0) and zero T(1) | E∞ definition unchanged | None |
| Height monotonicity | Hℤ_(p)→H𝔽_p | heights 0→−1, inequality −1≤0 | Correct direction | None |
| Height-one example | KU_p^∧ | T(1)-smash nonzero, T(2)-smash 0; height 1 | Consistent | None |
| §10.4 Dₚ Tate consequence | retained Dₚ H𝔽_p | finite K(i)-smashes of its Tate module and of input are all 0 | Generalization agrees | F03 |
| Tate-converse starting height | KU_p^∧, i=1 | T(1)-Tate smash 0; T(2)-input smash 0 but T(1)-input smash nonzero | j starts at i+1 | None |
| Rational Tate converse | Hℚ, i=0 | raw Tate 0; all positive-height smashes 0 | Bottom case agrees | F03 |
| Homotopy-E intermediate | M=0,E_(i+1) | input/Tate detector pairs (0,0), (nonzero,nonzero); at i=0 rational fields nonzero | No Dₚ hypothesis needed here | F03 |
| Weaker Tate action route | unit retract; zero detector | M→R^tC_p⊗M→M=id; middle smash 0 forces K(i)⊗M=0 | Coherent module not assumed | F03 |
| §11.1 Bott inversion | ko,KO at degree −8 | rational coefficients 0,ℚ; positive heights agree | Height-zero exclusion necessary | None |
| Real Bott relation | complexification of α²=4β | (2b²)²=4b⁴; proposed α²=β would give 4b⁴=b⁴ | Factor 4 fixed | None |
| Relative Bott base change | A=0,ko | outputs 0,KO; positive-height comparisons 0=0 and supplied ko→KO | Consistent | None |
| Real coefficients | degrees 0,1,2,3,8 | ℤ,ℤ/2,ℤ/2,0,ℤ with Bott generator in degree 8 | Consistent | None |
| §12.1 spectral affineness | affine chart; M=0,O | Γ0=0; ΓO=A; module tensor unit A | Quasicoherence essential | None |
| Projection comparison | V=0,S,S∨ΣS | outputs 0,ΓM,ΓM∨ΣΓM on both sides | Consistent | None |
| §12.2 chromatic bounds | n≥3; height 2; height 0 | high T-smashes 0; Δ inversion gives same T(2)-output; rational connective cover loses negative classes | Consistent | None |
| Faithful Galois definition | G=1; B=0 over Hℤ | comparisons id and Hℤ⊗Hℤ=Hℤ; zero algebra kills nonzero Hℤ | Independent faithfulness enforced | F04 |
| Tensor Galois map | trivial C₂-torsor | B=A²; B⊗_AB=A⁴=∏_GB; B^hG=A | Map formula agrees | None |
| Nonabelian Galois check | trivial S₃-torsor | B=A⁶; tensor and product each A³⁶; fixed points A | All factors retained | None |
| Full-level N=1 | trivial torsion basis | GL₂(ℤ/1)=1; extension TMF→TMF | Included | F04 |
| Full-level N=2 | basis of E[2] | group order (4−1)(4−2)=6; −1 acts trivially on E[2] and remains inertia | Stack retained | F04 |
| Full-level N=3 | full basis | order (9−1)(9−3)=48; invert 3, still valid at 2 | Supersingular input retained | F04 |
| Full-level N=5 | full basis | order (25−1)(25−5)=480; invert 5 | General level tested | F04 |
| Right basis/left section action | g upper, h lower unipotent at 3 | gh gives (2P+Q,P+Q); hg gives (P+Q,P+2Q); pullback reverses composition | Noncommuting direction fixed | F04 |
| Determinant component | diag(−1,1) at level 3 | pairing ζ↦ζ⁻¹≠ζ for primitive cube root | Full GL₂ retained | F04 |
| §12.4 supersingular orders | p=2,3 | geometric orders 24,12 times residue degree 2 give 48,24 | Both residue factors retained | None |
| Elliptic height strata | ordinary,supersingular,nodal | heights 1,2,1; additive field law has ∞ and is excluded | Consistent | None |
| Descent grading | bidegree (1,2r) | total degree 2r−1 odd | Even sheaves need not give even globals | None |
| Discriminant powers | exponents 8,3,24 | degrees 192,72,576; 24 divisible by 8 and 3 | Consistent | None |
| §13.1 spectral units | H𝔽₂,H𝔽₃ | unit components 1,2 versus additive components 2,3 | Correct carrier distinguished | None |
| Thom colimit and base change | point; two-point trivial system | R; R⊕R; scalar extension gives R′,R′⊕R′ | Universal property agrees | None |
| §13.2 selected unit | p=2,3 | 1−p=−1,−2, both p-adic units | Correct class | None |
| Completed Thom comparison | mod-p; integral cover | π₀=𝔽_p,ℤ_p | Rings distinguished | None |
| Completed Postnikov fiber | (S³)_p^∧→K(ℤ_p,3) | id on ℤ_p gives kernel,cokernel 0; uncompleted domain gives cokernel ℤ_p/ℤ in π₂ | Correct domain essential | None |
| §13.3 finite stage | m=0; p=2,m=1 | p⁰−1=0 gives S_p^∧; J₁S²=S² gives π₀y(1)=𝔽₂ | Boundary separated | None |
| Integral James family | z(1)→y(1) | π₀ map ℤ₂→𝔽₂ is reduction; degree-two Postnikov fiber has π₂=0 | Correct cover and map | None |
| Completed colimit API | y and z systems | colimit π₀ values 𝔽_p,ℤ₂, agreeing with H𝔽_p,Hℤ₂ | Completion convention retained | None |
| §13.4 acyclicity range | m=1,2 | y lower ranges {0},{0,1}; z positive ranges ∅,{1}; rational z has π₀=ℚ₂≠0 | No false rational vanishing | None |
| Adams slope denominators | (p,m)=(2,1),(3,1) | denominators 2,4; v₀ has degree 0 and is handled separately | No division by zero | None |
| §13.5 arbitrary coefficient | E=Hℚ,W=K(ℤ/p,1) | reduced E-homology 0; positive tensor powers and reduced tensor algebra all 0 | Consistent | None |
| Reduced James splitting | W=*,S¹,S² | wedges 0,⋁_(r≥1)Sʳ,⋁_(r≥1)S²ʳ; r=0 would add S | Correct indexing | None |
| James connectedness | W=S⁰ | π₀J∞S⁰=ℕ versus π₀ΩS¹=ℤ | Disconnected case excluded | None |
| Finite James cells | J₀S²,J₁S²,J₂S² | reduced cell degrees ∅,{2},{2,4} | Consistent | None |
| James type application | finite p-primary type m>n, n=1 | T(1)-smash 0 and S[1/p]-smash 0 | Both lower detectors included | None |
| p-local finite-duality gap | S_(p),S/p,infinite wedge | duals S_(p),Σ⁻¹S/p; finite-subwedge colimit recovers the infinite wedge | Contract remains precise | None |
| Spectral ringed-site gap | affine chart, modules 0,O | sections 0,A; tensor unit A | Contract remains distinct from ordinary modules | None |
| Stable James splitting gap | W=S² | reduced summands S²,S⁴,S⁶,…; no sphere term | Contract remains necessary | None |

The six Worked examples were recomputed in the corresponding rows: the two bottom detectors, additive versus multiplicative p-series, both KU Tate fields, the real Bott factor, sign monodromy, and the completed Postnikov fiber. Zero objects, empty ranges, p=2 and 3, nonabelian S₃, identity maps and the inadmissible nonreduced coefficient substitution are explicit. No denominator added in this repair can vanish: p is prime, Euler inversion names the element being inverted, and the g-series quotient is taken only after the stated ideal reduction. The theorem n≥1 and the positive-level theorem N≥1 do not admit junk values n=0 or N=0.

## Suppliers, ownership and pinned APIs

Read the main versions of GeneralizedCohomology, BordismFormalGroups and ModularCurves before editing for shape. Ownership searches used `roadmaps list`, `roadmaps grep` and `roadmaps show`, plus object searches of the board packages and the pinned source trees. The index includes 357 open roadmap pull requests. Open files were read through the supplied roadmap tools; revisions of existing roadmaps were not substituted for their main versions. The content checkout used for local main has head 5f173a7b9ac37eb6b62d01eb3db5047b92d19363. The citation resolver separately reports indexed main 6383577; its results were treated as leads, with the supplier contracts checked in the actual main checkout or the new-roadmap head as appropriate.

The nullification reflector, Dₚ-specific operations and spectral Galois theorem have no other owner in the readable object-search results. Generic spectral tensor, homotopy orbits, transfers, level stacks and sheaves retain their supplier ownership. Thus this package owns the special chromatic constructions and conclusions, rather than planning a second spectral or elliptic foundation. No declaration names are introduced in Lean and there can be no fully qualified collision.

| Supplier | Locations resolved and consumed |
| --- | --- |
| GeneralizedCohomology, main | G2 spectral model and multiplicative/module carriers; G3.4/G3.7 colimits and compact-source comparisons; G3.8 covers/towers; G3.9 integer localization and completion; G4.5 orientations; G5.1 finite duality; G5.4 real/complex Bott models and maps. |
| BordismFormalGroups, main | F1–F3/F5 formal laws, coefficients and deformations; F6.1 localization; F6.2–F6.3 nilpotence, type, periodicity and telescope classes; F6.4 class identities, smashing and fracture; F6.5 coherent actions, BG colimits, norms, Tate products, unit retracts, straightening/Kan formulas and K(n)-completion. Cyclic extended powers use these generic tensor and homotopy-orbit constructions; the Dₚ factorization is a structure defined here. |
| EnhancedDerivedSheaves, main | E0.4–E0.5 stable and space-indexed categorical interfaces; E5:abstract.4 monoidal enhancement; E5:presentability.1 compact/Ind comparison. The spectral ringed-stack construction remains the explicit existing gap. |
| AlgebraicTopology, main | Stages 4–5 cellular and twisted ordinary homology and fibration comparisons; Stage 8 higher homotopy exactness, transport and Hurewicz. The new relative comparison uses only its abelian part in degrees ≥2 and the simply connected fiber. |
| ModularCurves, main | §3D naive comparison only with N inverted; §§4B–4C Weierstrass groupoid and level-three torsor; §5B full ordered-basis scheme and right action only for N≥3; §§7E–7F formal heights and Serre–Tate deformation comparison. No small-level scheme assertion was attributed to it. |
| StableHomotopyKTheory, new-roadmap head 00bfbf7 | §§3.18, 3.21 Postnikov and twisted obstruction data; §§7.21–7.27 filtered spectra, including §7.24’s bounded-below exhaustive homological convergence and §7.26’s separate complete-tower criteria. |
| HomotopySpheres, new-roadmap head fb7c47e | §§3A–3B pointed stabilization, finite James filtration and connected James equivalence; §4B real Bott. The stable splitting is still an additional gap addressed to §3B, not supplied by its regression mention. |
| TopologicalKTheory, new-roadmap head 7575afa | T7 Clifford coefficients, a²=4b and complexification; real Bott proof remains HomotopySpheres §4B. |
| EllipticCohomology, new-roadmap head f0df48d | E1 moduli and compactification; E2.2–E2.3 marked low-height realization and obstruction machinery; E3 sheaf and global spectra; E4 discriminant; E6 level-stack/sheaf pullbacks for Γ(N), Γ₁(N), Γ₀(N) with level inverted and stack/representability ranges. N=1,2 are retained at that stack level. |
| RefinedTraceMethods, new-roadmap head 9dd2691 | §2.3 Segal comparison; §§2.6, 2.9, 2.10 THH, TC and categorical comparison; §4.9 connective/nonconnective K-theory; §4.11 trace; §6.8 K(1)/completed KU comparison. |

Mathlib is pinned at 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, as read from the content manifest. Direct pin inspection established:

| Declaration or object | Pinned location and actual content |
| --- | --- |
| `IsLocalization.flat` | `Mathlib/RingTheory/Flat/Localization.lean:37`: a commutative-semiring localization is flat, retaining its submonoid and localization binders. |
| `Module.Flat.lTensor_exact` | `Mathlib/RingTheory/Flat/Basic.lean:323`: exact tensor of linear maps over a commutative ring with the explicit flat-module binder. |
| `FormalGroup`, `FormalGroup.IsComm`, `FormalGroup.Point` | `Mathlib/RingTheory/FormalGroup/Basic.lean:56`, `:74`, `:126`: native series with normalized coefficients and associativity; a separate commutativity class; substitution-qualified series as points. These do not bundle spectra or a topological separation/completeness hypothesis. The additive/multiplicative models and coefficient transport are in the same file. |
| `CategoryTheory.ObjectProperty.isLocal` | `Mathlib/CategoryTheory/Localization/Bousfield.lean:55`: a predicate on morphisms requiring ordinary Hom precomposition bijections; no derived spectral reflector is constructed. |
| `WeierstrassCurve.formalGroup` | `TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Basic.lean:58`: the reindexed addition series over a commutative ring; no nonsingularity binder is part of this definition. |
| `TopPair.HomologyPretheory` | `Mathlib/AlgebraicTopology/EilenbergSteenrod.lean:36`: relative and absolute functors, comparison and boundary data; homotopy invariance is a separate class at line 144. No spectral carrier, excision or weak-equivalence invariance is bundled. Tau Ceti’s additional axioms in `TauCeti/AlgebraicTopology/EilenbergSteenrod.lean` do not supply the missing spectral data. |
| Algebraic homotopy fiber | `Mathlib/Algebra/Homology/HomotopyFiber.lean:55` constructs a homological complex; this is not a homotopy fiber of spaces. |

Object searches for prespectra, symmetric spectra, suspension spectra, ring spectra, Morava theories, Bousfield–Kuhn and Thom spectra found no native carriers for these headline theorems at either pin. The additional generalities in this repair are therefore listed explicitly as not statable in `packages/ChromaticHomotopyTheory/Suggested.lean`; none is replaced by a free predicate or an algebraic stand-in.

The three existing gaps match between `packages/ChromaticHomotopyTheory/design/plan.json` and Exact supplier contracts: p-local-finite-duality, spectral-ringed-sites, stable-james-splitting. No part of the plan was edited. Main and new-roadmap ownership were checked through the available files and supplied tools; these searches do not certify any unavailable files outside that set.

## Required checks and exact outcomes

- **Final Lean elaboration:** the prescribed `lake env lean` invocation on `packages/ChromaticHomotopyTheory/Suggested.lean`, from the pinned content checkout, exited 0 with no output and no warnings. It imports only Mathlib; no TauCeti object build was required. No bare build, update or cache command was run.
- **Mechanical signature audit:** enumerated every declaration in the final Lean file. The inventory is empty: zero definitions, instances, theorems or other declarations. Thus there are zero own `#check @name` cases and no vanished standing binders. A single scratch signature file additionally checked the two flatness declarations and the native formal-group, localization and pretheory carriers against Mathlib; it elaborated once, exited 0, and its printed binders agree with the README. No Lean signature repair was needed.
- **Acceptance-test shape:** one `import Mathlib`, one module docstring, the required namespace, no admitted data, no declarations, no options and no padding. All 25 headline groups remain described, with the generalized magma, Dₚ, nullification and full-level carriers named explicitly where missing.
- **Dependency check:** the prescribed movable dependency check exited 0. Its complete output was:

```text
depcheck: 51 roadmaps, 583 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line.

- **Citation resolver:** exited 0; “Cross-roadmap citations found nowhere: None” and “Lean names found nowhere: None.” It reports that external Lean names were not checked by the resolver; the direct pin reads and scratch elaboration above provide that check for the new library inputs.
- **Manifest checks:** `sources.toml` parses under tauceti-roadmap-sources/v1, with 19 unique keys, 18 certified readable cached extractions and one settled uncertified entry, abs. No source was fetched or requested again. Only BHM and Hahn locator text changed; retrieval fields are unchanged. `metadata.toml` parses with topic math.AT.
- **Scope checks:** `git diff --check` exited 0. The edited deliverables are README.md, Suggested.lean, sources.toml and this report, all under the package. metadata.toml and design/plan.json are unchanged. No repository files outside the authorized set were edited. No machine paths are present in these deliverables.
- **Gate failures supplied in the brief:** none beyond the six findings; there is no separate gate-failure repair to report.

## Maintainer notes

No public Lean declaration was added, deleted or renamed. Consumers citing sections retain their section numbers. §12.4 still consumes exactly the N=3, p=2 instance of §12.3; the other positive levels are part of the general theorem. GeneralAlgebraicKTheoryPartII can use the broader homotopy-unital and Dₚ input statements without a reverse dependency.

The frozen design prose and non-gap plan records were outside the authorized edits and were left intact. The package README and Lean headline descriptions agree on the repaired scope. The mathematical computations here are evidence for the repairs, not independent acceptance; a fresh review is still required. No source text was copied, no suspicious instructions were followed, no missing source request remains, and no commit or external write was made.
