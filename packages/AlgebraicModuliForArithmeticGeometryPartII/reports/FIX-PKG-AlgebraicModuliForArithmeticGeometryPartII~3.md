# Repair report: AlgebraicModuliForArithmeticGeometryPartII

The reviewed package files are `packages/AlgebraicModuliForArithmeticGeometryPartII/README.md` and `packages/AlgebraicModuliForArithmeticGeometryPartII/Suggested.lean`. All three findings are applied. Elaboration is evidence of well-formed signatures; the mathematical evidence is recorded separately below.

## F01 (P2) — applied

Missing §2.10/§4.2 headlines → two numerical-constancy equivalences using the actual geometric quotient, semilinear pullbacks and projection-marked graph isomorphisms. Added the real definitions HasTrivialNumericalGaloisAction and componentGraph; registered all four names in §§2.7, 2.10, 4.1, 4.2 and How to read the build. Corrected every numerical-local-system unstatability assertion and added concrete boundary Checks.

## F02 (P3) — applied

Three abstract Check bullets → deleted, with their API assertions retained. Sections 0.4, 2.7 and 5.9 retain respectively five, four and four concrete Checks. The remaining projection, Galois and AHK examples still distinguish the intended objects. No Lean declaration was added for a Check.

## F03 (P3) — applied

§5.7’s CT20 locator pp. 16–17 → pp. 16–18. CT20 line 630 states the lemma; CT20 line 690 starts page 18; CT20 lines 692–702 contain the section, curve and negative-degree contradiction used by the roadmap. The manifest already gives pp. 16–18. No other occurrence needed correction.

## Mathematical evidence and pattern search

SCH23 lines 167–188 describe the geometric numerical lattice and its actual Galois action for arbitrary proper schemes, explicitly admitting nonreduced and nonequidimensional schemes. SCH23 lines 191–231 give the positive-power argument. Its printed nonnegative exponent must be positive: exponent zero also works on the nonconstant swap lattice. The package already imposed positivity and the new signature preserves it.

For the forward implication of §2.10, the numerical lattice is finitely generated. For each basis element, the Picard-torsor obstruction is killed by a positive finite-extension degree, and its Picard-point obstruction is killed by a positive Brauer exponent. The product of these finitely many positive integers works uniformly; for the zero lattice the empty product is 1. For the reverse implication, an element v satisfies d(σv−v)=0 because dv is a descended class; torsion-freeness and d>0 give σv=v. These are the two implications, rather than an assumed constancy conclusion or a rank-only surrogate. The subgroup used by the signature equals the numerical kernel by §§0.4 and 1.1, so equality in its quotient is exactly the permitted numerically trivial twist.

The two projection equations in HasTrivialNumericalGaloisAction specify a unique morphism g by the pullback universal property. Existence follows because σ fixes the image of k; the compatibility equation is therefore the base-change square. Inverses are obtained from σ⁻¹. Thus the universal quantifier is not vacuous. In positive characteristic, if a lies in K and a^(p^r) lies in k^sep, an automorphism τ of k^sep has a unique extension value on a, namely the unique p^r-th root of τ(a^(p^r)). In characteristic zero K=k^sep. This explains why Aut(K/k) tests precisely the same triviality as Gal(k^sep/k), including over imperfect k.

SCH23 lines 232–259 give the component graph and curve criterion. On a proper pure curve, multidegrees identify the rational numerical space with the space on the geometric components: Cartier divisors supported away from the other components and associated points give a positive multiple of each coordinate. Galois acts by the actual component permutations. It acts trivially precisely when every component orbit has one member. Those orbits are the components over k; purely inseparable base change changes multiplicities, not their underlying topological components. Bijectivity of the projection on components reflects adjacency by faithful flatness of their intersections. The closure-of-image equation fixes this particular bijection. A zero-dimensional component has no multidegree coordinate, explaining the purity hypothesis and the mixed-dimensional negative control.

The pattern search covered every local-system claim in Suggested.lean, both equivalences, the subgroup-to-quotient identification, the graph definition, all README registrations and their consumers. Besides deleting the two incorrect unstatability sentences, it removed the same local-system excuse from the projective-contraction and negative-curve discussions in the module docstring; their other missing carriers remain identified. No existing theorem or definition name changed. The repeated-Check search found exactly the three remaining abstract repetitions named in F02. The CT20 page-range search found the one F03 occurrence.

## Computed adversarial pass

Rows identify assertions, including the assertions shared by a definition, its API and its examples. The computations test boundaries and conventions; the source arguments above establish the general equivalences. “Retained” means the statement did not require a change.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Proper objects may be empty | X=∅ | Pic=1, Num=0, Γ has 0 vertices, Γ(O)=0 ring | Both new equivalences hold | Explicit empty Checks |
| Degree normalization | O(−1), O, O(1) on P¹ | χ=0,1,2; subtract χ(O)=1 to obtain −1,0,1 | Degree is not χ | Retained |
| Restriction versus extension of constants | P¹_ℂ over ℝ, then over ℂ | ℝ-degree 4−2=2; geometric degrees 1+1=2 | Constants factor and splitting agree | Retained |
| Positive powers | swap on ℤ², v=(1,0) | 0v=(0,0) fixed; σ(dv)=(0,d)≠(d,0) for d>0 | Positivity necessary | Expanded §2.10 Check |
| Numerical groups are abelian | ℤ³; permutations of three components | e₁+e₂=e₂+e₁; (12)(23)≠(23)(12) as actions | Nonabelian acting groups are allowed, Pic remains abelian | Retained |
| Finite dimension before total finrank | zero space and ⊕ℕℝ | finrank=0 for both; actual dimensions 0 and ℵ₀ | finrank alone cannot assert finiteness | Retained |
| §0.1 tensor and inverse degree | O(2), O(−3), O(2)⁻¹ | deg tensor=−1=2−3; inverse degree=−2 | Additive sign correct | Retained |
| §0.1 integer-power degree | O(2), powers −1,0,2 | degrees −2,0,4 = 2n | Includes zero and negative powers | Retained |
| §0.1 component-length degree | double P¹ and two reduced P¹s | double O(1): 4−2=2=2·1; disjoint O(1): 1+1=2 | Full degree retains multiplicities | Recomputed for §4.2 |
| §0.1 zero-dimensional degree | Spec k[ε]/(ε²) | χ(O)−χ(O)=2−2=0 | No numerical curve class | Recomputed for §2.10 |
| §0.1 finite curve pullback | P¹→P¹, t↦t², O(−1) | degree −2=2·(−1) | Positive degree factor, inverse sign retained | Retained |
| §0.2 geometric component factor | real conic; P¹_ℂ/ℝ; purely inseparable degree p | mr=1,2,p; conic descended generator has degree 2=1·2; constant-extension O(1) degrees are 2=2·1 and p=p·1 | Geometric component factor differs from conic index 2 | Retained |
| §0.3 field-extension numerical kernel | O(m) on P¹_ℝ; purely inseparable constants | m=0 iff geometric m=0; pm=0 iff m=0 | Numerical triviality survives both kinds of extension | Retained |
| §0.4 absolute numerical predicate | O(m) on P¹, m=−1,0,1 | test-curve degrees −1,0,1 | Only m=0 is trivial | Retained |
| §0.4 relative numerical predicate | pr₁:P¹×P¹→P¹, L=O(−1,0), O(0,1) | fibre degrees 0,1; horizontal degrees −1,0 | Relative and absolute kernels differ | Retained after F02 deletion |
| §0.4 identity morphism | id on P¹, O(1) | each fibre dimension 0; all relative tests empty, absolute degree 1 | Relative Picard kernel is all Pic | Retained |
| §0.4 numerical subgroup laws | O(a,b) for pr₁, b=0; inverses and products | 0+0=0; −0=0; O has degree 0 | Generated subgroup equals numerical kernel | Used in §2.10 signature |
| §0.4 nontrivial degree-zero class | elliptic O(p−q), p≠q; Enriques ω, char≠2 | degrees 1−1=0; 2[ω]=0 but [ω]≠0 in Pic and [ω]=0 in Num | Numerical quotient is essential | Retained |
| §0.5 closed-fibre testing | P¹_R, O(m); exceptional E in Bl_x P¹_R | special degree m=generic degree m; E has generic degree 0 but E·E=−1 | Generic-only testing fails | Retained |
| §0.6 surjective pullback detection | Bl_p P²→P², O(1); nodal cubic normalization | exceptional degree 0, strict-line degree 1; normalization preserves degree d | A single contracted curve does not detect kernel | Retained |
| §1.1 absolute quotient | P¹; elliptic curve; Enriques ω | Pic(P¹)/0=ℤ; (E(k)×ℤ)/E(k)=ℤ; ω maps to 0 | Correct numerical object | Retained |
| §1.1 relative quotient | pr₁; id | ℤ²/(ℤ×0)=ℤ; Pic(S)/Pic(S)=0 | Correct relative kernel | Retained |
| §1.1 torsion-free quotient | integer degree m and n=2 | 2m=0 implies m=0; torsion class ω already maps to 0 | Torsion-free cancellation available | Used in §2.10 |
| §1.2 absolute finite free headline | P⁰, P¹, P¹×P¹ | numerical ranks 0,1,2; ℤ-modules 0,ℤ,ℤ² | No nonemptiness or positive-rank hypothesis | Retained |
| §1.2 finite-coefficient bound | P¹ over algebraically closed k, ℓ≠char k; point | rank and dim H²(μ_ℓ): 1≤1; 0≤0 | Invertible coefficients retained | Retained |
| §1.2 elliptic-product ranks | rank End(E)=1,2,4 | ρ=2+rank End(E)=3,4,6 | Supersingular boundary included | Retained |
| §1.3 relative finite free headline | P¹×P¹/k, pr₁, id | ranks 2,1,0 | Proper and Noetherian binders retained | Retained |
| §1.3 finite-point detection | two disjoint lines, O(1)⊔O(−1) | total Euler difference 1−1=0, component vector (1,−1)≠0 | Contract tests individual curves | Retained gap |
| §1.3 Noetherian boundary | P¹ over Spec ∏ℕk | characteristic sequences e_n give infinitely many independent degree functions | Infinite rank excluded by hypothesis | Retained |
| §1.4 cycle duality and pushforward | pr₁, ruling curves | pairing O(a,b) with vertical/horizontal curves is b/a; pr₁* vertical=0, horizontal=[P¹] | Pairing and map directions agree | Retained |
| §1.4 cones and closure | abelian-surface matrix A=[[1,√2],[√2,2]] | det A=0; det(A+I)=4; det(A+I/2)=7/4 | Irrational extremal boundary is a closure point | Retained |
| §1.5 nef definition and dual cone | P¹ O(−1), O, O(1); exceptional E | degrees −1,0,1; E·E=−1 | Zero is nef; effectivity alone insufficient | Retained |
| §1.5 relative nefness | pr₁, O(−1,0), O(0,−1) | fibre values 0,−1 | First is relatively nef, second is not | Retained |
| §1.6 section-growth bigness | P⁰ O, P¹ O, P² O(1), P¹×P¹ O(1,0) | h⁰=1,1,(m²+3m+2)/2,m+1; top intersections 1,0,1,0 | Dimension zero and nef nonbig boundaries agree | Retained |
| §1.6 birational comparison | blow-up P², pullback O(1) | h⁰=(m+1)(m+2)/2 on both; square 1=1 | No section-growth loss in this witness | Retained gap |
| §2.1 proper Picard representability | P¹, nodal rational curve, finite dual numbers | Picard components ℤ; nodal Pic⁰=G_m with tangent dimension 1; finite Pic=0 | Gluing and nonreduced constants kept | Retained |
| §2.2 affinization | P¹, P¹_ℂ/ℝ, two P¹s, double P¹ | constants k,ℂ,k×k,k[ε]/(ε²) | Constants cannot be reduced or forced to k | Retained |
| §2.2 units | dual numbers, units 1+εa and 1+εb | product=1+ε(a+b), rather than 1 | Nilpotent subgroup retained | Retained |
| §2.3 finite-algebra Brauer torsion | ℂ/ℝ; ℝ×ℝ; ℝ[ε]/(ε²) | Brauer groups 0,(ℤ/2)²,ℤ/2; twice every displayed class=0 | Affinization-valued target required | Used in positive-power proof |
| §2.4 representative obstruction | pointless real conic; P¹_ℂ/ℝ | image 2ℤ⊂ℤ with cokernel ℤ/2; diagonal ℤ maps bijectively to Picard ℝ-points | Picard points need not be actual sheaves | Used in positive-power proof |
| §2.5 τ-component and numerical kernel | P¹, elliptic, classical and ordinary Enriques | τ=0,E,ℤ/2,μ₂; μ₂ has one geometric point and length 2 | Torsion component includes nonreduced groups | Retained |
| §2.6 geometric numerical local system | P¹, finite Spec E, P¹_ℂ/ℝ | lattices ℤ,0,ℤ²; actions id,id,swap | Geometric lattice differs from arithmetic image | Retained |
| §2.7 semilinear-map specification | σ=id on P¹; conjugation for P¹_ℂ/ℝ | first forces g=id in identity case; conjugation exchanges the two geometric components | Both projection equations exclude arbitrary maps | New definition |
| §2.7 triviality predicate | O(m) on P¹; e₁ on conjugate pair | [g*O(m)]=m=[O(m)]; σe₁=e₂≠e₁ | Predicate has a positive and a negative witness | New definition |
| §2.7 constant versus nonconstant quadric | split and nonsplit ruling lattices | split (a,b)↦(a,b); nonsplit (1,0)↦(0,1) | Retained four Checks discriminate | F02 deletion |
| §2.7 separably closed fields | separably closed imperfect k, then K | Aut(K/k)=1; every orbit size 1; action on every class is identity | Purely inseparable stage adds no automorphisms | API retained |
| §2.7 preservation by field extension | nonsplit real ruling lattice after ℂ; split P¹ after any K | swap restricts to identity after splitting; identity restricts to identity | Constancy preserved, converse not asserted | Retained |
| §2.8 norm composition and direction | P¹, extensions degrees 2 then 3, O(−1) | degree −1↦−3↦−6; composite norm degree −6; identity degree −1 | Positive field degrees multiply; norm is not inverse | Retained |
| §2.9 torsor killing | conic generator, split extension ℂ/ℝ; degree-one splitting | τ=0 gives torsor class 0 and 2·0=0; degree one gives 1[T]=0 | Brauer obstruction remains separate | Retained |
| §2.10 positive-power equivalence | P¹, pointless real conic, conjugate pair | images ℤ,2ℤ,diag ℤ; d=1,2,none; actions id,id,swap | Both directions match | New headline |
| §2.10 uniform exponent order | conic, geometric classes −1,0,1 | d=2 gives −2,0,2 in image; d=1 fails on 1 | One d works for every class | Explicit signature |
| §2.10 zero lattice | empty, finite reduced, finite dual-number scheme | q(L)=0 for all L; 1·0=0 comes from O | d=1, not an absent positive exponent | Added Check |
| §2.10 finite basis bound | illustrative fixed lattice with image 2ℤ⊕3ℤ | d=6 sends (a,b) to (6a,6b) in image; d=1 fails on (1,0) | Product of exponents works uniformly | Proof route retained |
| §2.10 nonabelian action boundary | P¹_E over ℚ, E a cubic field with normal closure group S₃ | geometric ℤ³; transposition sends e₁ to e₂; d e₁∉diag ℤ for d>0 | No accidental abelian-Galois restriction | No narrowing |
| §2.11 doubled Picard lift | ℤ/4→ℤ/2; ℤ/8→ℤ/2 | d(1)=2 mod 4, projection=0=2·1; kernel element 2 mod 8 maps to 4≠0 | 2-torsion-kernel hypothesis needed | Retained |
| §2.12 finite-field torsion headline | elliptic curves y²+y=x³ over 𝔽₂, y²=x³−x over 𝔽₃ | affine counts 2,3; total orders 3,4; 3P=0,4P=0 | Characteristics 2 and 3 included | Retained |
| §3.1 contraction definition | id, pr₁:P¹×P¹→P¹, P¹_ℂ→Spec ℝ | section maps id, O→O, ℝ→ℂ; last not isomorphism | Proper connected fibre alone insufficient | Retained |
| §3.1 finite normalization boundary | cusp normalization | k[t²,t³]⊊k[t], with t absent in source | Finite birational need not be contraction | Retained |
| §3.2 rigidity | blow-up f; g=f and g=id | f(E) is a point, id(E) has dimension 1 | First factors, second cannot | Retained |
| §3.3 semiampleness | O, torsion L of order r, infinite-order degree-zero L on elliptic | O has section 1; L^r=O; all positive powers of infinite-order L have h⁰=0 | Nef need not be semiample | Retained |
| §3.4 semiample contraction dictionary | O(1,0), O on P¹×P¹ | degrees on two rulings 0,1 and 0,0; targets P¹ and point | Numerical curve kernel determines contraction | Retained |
| §3.5 finite field of definition | identity contraction | extension degree 1, cartesian identity square | Marked source retained | Retained |
| §3.6 purely inseparable descent headline | identity extension; separable conjugate pair | identity squares commute; conjugation exchanges contractions with dimension vectors (0,1) and (1,0) | Separable counterexample excluded | Retained |
| §3.7 constant-Num contraction descent | split P¹×P¹; P¹_ℂ over ℝ | split projection numerical vector fixed; conjugate collapse vectors (0,1)≠(1,0) | New predicate agrees with existing hypothesis | Docstring carrier explanation updated |
| §3.8 openness of ampleness | P¹×Y, O(1) and O | fibre degrees 1 and 0; ample loci Y and ∅ | No ampleness at a fibre for O | Retained |
| §4.1 componentGraph definition | disjoint lines, meeting lines, irreducible nodal curve, empty | (vertices,edges)=(2,0),(2,1),(1,0),(0,0); Adj(A,A)=false | Excludes complete graph and looped dual graph | New definition |
| §4.1 symmetry | meeting lines A,B | A∩B and B∩A contain same intersection point; both adjacency values true | Undirected relation | New definition |
| §4.1 edge collapse | V(x²+y²) over ℝ, then ℂ | source has 2 vertices and 1 edge, target 1 vertex and 0 edges | Edges may collapse | Retained |
| §4.1 adjacency reflection boundary | normalization of two meeting projective lines | vertex map bijective; source edges 0, target edges 1 | Arbitrary vertex bijection insufficient | Retained |
| §4.2 graph-descent equivalence | two k-lines meeting at k-point; P¹_ℂ/ℝ | trivial action on ℤ² and graph 2→2 with 1 edge; swap action and vertex map 2→1 | Both implications match | New headline |
| §4.2 purity boundary | P¹_ℝ⊔Spec ℂ | numerical lattice ℤ fixed, vertex counts 3→2, component dimensions 1 and 0 | Purity excludes counterexample | Retained negative Check |
| §4.2 empty boundary | X=∅ | component condition vacuous; graph 0→0 isomorphism; Num=0 fixed | Empty case included | Added Check |
| §4.2 projection marking | split disjoint P¹s, proposed swapped graph isomorphism | closure π(C₁)=C₁, proposed e(C₁)=C₂≠C₁ | Unmarked swap rejected by equation | Added Check |
| §4.2 nilpotent thickening | P¹ over k[ε]/(ε²) | reduced degree O(1)=2−1=1; full degree=4−2=2; graph (1,0) | Definition tests integral reduced curves | Added Check |
| §4.2 imperfect base | P¹ over k(a^(1/p)), p=2,3, a∉k^p | geometric graph (1,0), reduced degree 1, full degrees 2 and 3, Num=ℤ | Multiplicity creates no extra vertices | Added Check |
| §4.3 intersection sign and labels | two lines; exceptional curve; smooth fibre | matrices [[1,1],[1,1]], [−1], [0] | Negative is not positive convention | Retained |
| §4.3 field-degree factors | P²_κ/k with [κ:k]=2; inseparable transverse divisors | intersections 2 versus 1; full inseparable p² versus reduced 1 | Full Cartier pullback keeps multiplicities | Retained |
| §4.4 contraction trichotomy | surface→point; blow-up; pr₁ | target dimensions 0,2,1; generic birational degree 1 | Three cases separated | Retained |
| §4.5 exceptional negativity | blow-up; A₂ resolution | E²=−1; form −2a²+2ab−2b²=−(a−b)²−a²−b² | Negative definite | Retained |
| §4.6 Zariski form | I₂; irreducible fibre | form −2(a−b)², kernel a=b; one-component form 0 | Proper singleton [−2] definite, full form not | Retained |
| §4.7 negative-curve rigidity | two conjugate exceptional curves; ruling of quadric | squares −1, mutual 0, difference pairs to −1; ruling square 0 | Distinct negative curves cannot have equal classes | Retained |
| §4.8 fibre graph descent | blow-up of rational smooth fibre point; nonsplit conic fibre | matrix [[−1,1],[1,−1]], two vertices descend; conjugate fibre 2→1 | Constancy distinguishes cases | Retained |
| §4.9 reducible-fibre image | rational reducible fibre; smooth fibre at degree-2 point | residue degrees 1 and 2; geometric component counts ≥2 and 1 | Irreducible case outside assertion | Retained |
| §4.10 label descent | blown-up smooth fibre; irreducible fibre | label 1=1 after extension; irreducible has 0 edges | No spurious residue factor | Retained |
| §5.1 numerical restriction | P¹_R; Spec R; quadric over ℤ_(5) | maps ℝ→ℝ identity, 0→0, ℝ→ℝ² diagonal | Injective need not be surjective | Retained |
| §5.2 numerical versus exact lift | stated elliptic curve at 7 | affine counts 0,1,2,0,2,2,2 sum 9; total 10; rational image order 5 | Numerical degree 0 has lift O, some exact degree-zero classes do not | Retained |
| §5.3 complete-DVR headline | P¹_R, O(d), d=−1,0,1 | H²=0; restrictions have degrees −1,0,1; obstruction 0 | Actual sheaf lifts, not just classes | Retained |
| §5.3 ampleness continuation | P¹_R, O(1), O(−1) | special degrees 1,−1; only first ample | Extra ampleness carrier still needed | Retained docstring limitation |
| §5.4 cone identification | P¹_R and Spec R | both cones ℝ≥0 in dimension 1; both {0} in dimension 0 | Zero case permitted | Retained |
| §5.5 special-to-generic nef and big | O(1) on Pⁿ_R; three-section blow-up | top degree 1 on both; H²=4−1−1−1=1; special H·ℓ=2−1−1−1=−1 | Converse fails while top degree stays fixed | Retained |
| §5.6 semiample numerical descent | pr₁ and O(a,0); infinite-order degree-zero elliptic L | fibre degree 0 and m=1 pullback O(a); elliptic powers all nontrivial | Semiampleness necessary | Retained |
| §5.7 vertical numerical descent | id; projective bundle pullback; blow-up with L=−E | M=L; fibre degree 0; (−E)·E=1 but any pulled-back degree=0 | Divisor-image hypothesis necessary | Locator expanded |
| §5.7 section-degree contradiction | effective nonzero point divisor on P¹, opposite L | section vanishes at one point; deg(−L)=1>0; deg L=−1<0 | Contradicts nefness exactly as CT20 page 18 | Locator verified |
| §5.8 normalized minimum | P¹_ℂ/ℝ; normalized H-values 1,2, D=−2H | degree/index=2/2=1; D-values −2,−4; H′=3H gives 3,6 | Minimum H maximizes negative D | Retained |
| §5.9 AHK definition | P² and blow-up | identity 1−0=1; blow-up 2−1=1 | Resolution witness survives Check deletion | F02 deletion |
| §5.9 dimension-zero boundary | Spec ℂ | ρ−e=0−0=0 | No positivity at dimension zero | Retained |
| §5.9 divisorial resolution | projective quadric surface cone | F₂ has ρ=2, e=1, rank 2−1=1 | Rank-drop sign correct | Retained |
| §5.9 small resolution | projective quadric threefold cone | smooth resolution ρ=2, e=0, AHK=2; Cartier rank of cone=1 | Equality with Cartier rank needs ℚ-factoriality | Retained |

## Sources, ownership and supplier citations

The source passages used for the repairs were read directly from the certified legal extractions: SCH23 lines 167–259 for constancy, the norm/Brauer route and component graphs; CT20 lines 630–702 for the vertical-descent statement and proof. No new work is cited, no inaccessible text is needed, and no source fetch or manifest change was necessary. All fourteen source records remain certified. There is no missing-reference request.

The library check used Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, exactly the manifest pins; main is `8888d45eea61a0573e32d9b39a00c833f844fc44`. Native ingredients were checked by object and definition:

| Pinned object | Evidence and boundary |
| --- | --- |
| Line-bundle classes and representatives | `TauCeti/AlgebraicGeometry/LineBundle/Class.lean:50`, `:58`, `:76`, `:82`, `:142`: Skeleton of invertible sheaves, mk, isomorphism criterion, representative surjectivity and commutative group structure. |
| Actual pullback functor | `TauCeti/AlgebraicGeometry/LineBundle/Pullback.lean:72`: source InvertibleSheaf Y, target InvertibleSheaf X for f:X→Y; its body is native module pullback. |
| Degree, not unconditionally a curve theorem | `TauCeti/AlgebraicGeometry/LineBundle/Degree.lean:70`: degree-two truncated Euler difference. Proper curve finiteness/vanishing remain supplier inputs. `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/EulerCharacteristic.lean:303` and `:343` retain integral-curve/local-DVR and finite-dimensional-H¹ hypotheses. |
| Properness and fibres | `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean:41` and `:82`; `Mathlib/AlgebraicGeometry/Fiber.lean:37`–`:46`: properness has separation, universal closedness and local finite type; base change is proper; fibres are actual pullbacks. No nonemptiness or flatness is built in. |
| Algebraic and inseparable closures | `Mathlib/FieldTheory/IsAlgClosed/Basic.lean:264`; `Mathlib/FieldTheory/IsSepClosed.lean:226`, `:322`; `Mathlib/FieldTheory/PurelyInseparable/Basic.lean:107`, `:481`. Normality is retained for separableClosure.isGalois; algebraicity for its purely inseparable complementary stage. |
| Pullback existence and uniqueness | `Mathlib/CategoryTheory/Limits/Shapes/Pullback/HasPullback.lean:174`, `:179`, `:222`: lift projections and hom_ext pin both equations for g. |
| Graph substrate | `Mathlib/Topology/Irreducible.lean:103` defines maximal irreducible subsets; `Mathlib/Combinatorics/SimpleGraph/Basic.lean:93` requires symmetric irreflexive adjacency. These give the native carriers, not a second geometric graph theory. |
| Other retained numerical inputs | `Mathlib/RingTheory/PicardGroup.lean:545` (finite maximal spectrum); `Mathlib/LinearAlgebra/Dimension/Finrank.lean:61`; `Mathlib/AlgebraicGeometry/Morphisms/FlatRank.lean:88`; `Mathlib/AlgebraicGeometry/Noetherian.lean:277`. Their finiteness, flatness and Noetherian hypotheses remain explicit where used. |
| Matrix sign input | `TauCeti/LinearAlgebra/Matrix/NegSemidef.lean:91`, `:104`; `TauCeti/AlgebraicGeometry/Curves/StableReduction/NumericalType/IntersectionForm.lean:163`: the I₂ witness above recomputes the negative sign. |

Ownership searches used the roadmap service on main and the available open heads, and searched the board packages and pinned geometry objects. The general proper numerical-constancy criterion and pure-curve criterion are extensions of this package's existing targets, not new ownership claims. StableReduction owns nodal graphs with branch/genus data; componentGraph is the specified simple graph of arbitrary scheme components. The Enriques and K3 roadmaps consume numerical/contraction extensions and supply no premise of these two theorems. The Enriques supplier gap for general numerical contraction descent is a request, not a supplier construction. No later roadmap was introduced as an input, and no declaration uses a readable roadmap's fully qualified name.

Cross-roadmap locators were rechecked against main for existing roadmaps and the indexed head for new folders:

| Supplier | Resolved sections and consumed objects |
| --- | --- |
| SchemeAndStackFoundations | §§0.9, 0.11, 0.23; §§1.1–1.11; §§2.1–2.2, 2.6, 2.10–2.11, 2.15, 2.22; §3.5 norm; §§4.9–4.12; §§5.2–5.3, 5.9–5.10. In particular finite_pushforward_exact is small-étale; c1_degree_curve and Num.free_finiteRank are supplier targets. The resolver's original Num.free_finiteRank lead is resolved by the explicit target in `TauCetiRoadmap/SchemeAndStackFoundations/README.md:7221`, not a claimed pinned theorem. |
| AlgebraicModuliForArithmeticGeometry | §§1.4–1.6, 2.1, Layer 3, §§7.3, 7.6.1–7.6.1a, 7.9; projective parameters/bigness, Picard sheafification and framed infinitesimal lifting. |
| ComplexComparisonPartII | §§C3.2d.2, C3.2d.4, C3.2e, C3.2f.1–C3.2f.2; universal-functions relative Picard/Brauer statement and projective torsion component have their stated restricted domains. |
| JacobianChallenge | Layers A–D; degree, coherent cohomology and projective geometrically integral Picard theory. |
| StableReduction | Layers 1, 2 and 4, especially J-A2; curve degree, relative Proj, ampleness openness, universal contraction descent and regular-model intersections. |
| AlgebraicVectorBundles | L0A–L0C and L1A–L1B; tensor/dual operations and relative Spec. |
| AbundanceStatement | Layers 4A–4D and 5; characteristic-zero projective numerical spaces, cones, ampleness and semiampleness. |
| EtaleCohomologyFoundations | §F.3 proper constructibility/finite-coefficient finiteness; the invertible-annihilator domain is retained. |
| ResolutionOfSingularitiesCharacteristicZero | §7.8 field specialization; projective regular resolutions in characteristic zero and common smooth dominations. |

The citation resolver found no unresolved cross-roadmap citations. Its run did not inspect external Lean names because it reported no pinned Lake packages; the pinned-source checks above and elaborations provide that separate check. No supplier target, section, gap or merge-order entry changed. The six existing supplier contracts remain declared in the README and plan.

## Signature comparison and exact check outcomes

All fourteen declarations were copied into one scratch file followed by one `#check @name` for each declaration and elaborated once. Each elaborated type was compared with its README statement. All required binders survive; none required repair:

| Declarations | Elaborated hypotheses compared with README |
| --- | --- |
| NumericallyTrivial, numericallyTrivialClasses, numericalClassGroup_free_finite | Field k, Scheme X, explicit structure morphism x and IsProper x. |
| RelNumericallyTrivial, relNumericallyTrivialClasses | Proper f, with no Noetherian requirement on their definitions. |
| relNumericalClassGroup_free_finite | IsProper f and IsNoetherian S both retained. |
| HasTrivialNumericalGaloisAction, constantNumericalClasses_iff_positivePowerDescent | Fields k,K, Algebra k K, IsAlgClosure k K, x and IsProper x. In the theorem d precedes every L, and d>0 is explicit. |
| numericallyTrivial_torsion_of_algebraic_finiteField | Prime p, algebraic extension of ZMod p, proper x, numerically trivial L, and positive torsion exponent. |
| IsContraction | Scheme morphism f; properness and sectionwise isomorphism are in the predicate body. |
| contraction_descends_purelyInseparable | Pure inseparability, both proper structure maps, contraction and base compatibility, cartesian target square and commuting source square. |
| componentGraph | Arbitrary Scheme X; its adjacency has both distinctness and nonempty intersection. No accidental Noetherian requirement. |
| constantNumericalClasses_iff_componentGraphDescent | All field/algebraic-closure/properness binders, componentwise topological dimension one, and the closure-of-image equation. |
| lineBundle_lifts_completeDVR_of_h2_zero | Domain DVR R, adic completeness, proper flat x, native H²(O) vanishing and the actual residue-field pullback. |

- Acceptance command: `lake env lean <Suggested.lean>` from the content checkout, with the package file supplied by its full path to the command. Exit 0; no errors; seven expected “declaration uses sorry” warnings at lines 83, 94, 130, 153, 175, 213 and 232. No missing Tau Ceti object file occurred, so no targeted module build was needed.
- Signature command: `lake env lean <scratch signature file>` from the same checkout. Exit 0; all fourteen signatures printed; the same seven expected sorry warnings; no binder mismatch. The scratch file is not part of the package.
- Dependency command: the prescribed `gate --depcheck` with name AlgebraicModuliForArithmeticGeometryPartII, the prescribed order and `--movable`. Exit 0. Exact output:

```text
depcheck: 51 roadmaps, 585 edges, 0 problem(s)
```

- No UPWARD, CYCLE or moved line was produced.
- `git diff --check`: exit 0, no output.
- Structural checks: 247 Lean lines; one `import Mathlib` plus the two used TauCeti line-bundle imports; seven sorry theorems and seven real definitions; no set_option, admitted data or admitted examples. Every one of the fourteen own Lean names appears in the README. F02’s remaining Check counts are exactly 5, 4, 4.
- Gate failure tex=2: both hits came from the brace subscript and exponent in §4.2's purely inseparable Check. The formula is now the ASCII code span `P^1_{k(a^{1/p})}`; the mathematical statement is unchanged. The gate's own scanners return `tex=0`, `latex=0`, `residue=0`. The dependency check again exits 0 with `depcheck: 51 roadmaps, 585 edges, 0 problem(s)` and no UPWARD, CYCLE or moved line. Suggested.lean is unchanged by this formatting repair, so its elaboration and signature results above still apply. No source, gap or metadata entry changed.

## Maintainer consequences

Changed only the package README, Suggested.lean and this report. New names in the package namespace are HasTrivialNumericalGaloisAction, constantNumericalClasses_iff_positivePowerDescent, componentGraph and constantNumericalClasses_iff_componentGraphDescent. All existing names and supplier contracts remain stable. No other roadmap needs an edit to consume the existing targets; the new names make their acceptance signatures explicit. No commit, push, issue write or pull-request write was performed, and no Lean process was left running.
