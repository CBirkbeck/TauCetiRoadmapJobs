# Human review response

The single numbered finding contains four distinct requests, recorded below in their order: common ownership, the weight-two adapter, the extension boundary, and the downstream re-export. **The companion ownership transfer and equality adapter remain unresolved; “answered” does not mean they were applied.**

## H01 (CBirkbeck) — answered

The ownership overlap is confirmed: `TauCetiRoadmap/PadicFamilies/README.md` at `ed1464b5910f2ebc09bb6391f852f5747ae9b6a3`, line 85 and §§4.0.1–4.0.3, lines 2355–2386, still constructs the theta/Siegel units, ordered symbols, weight-two classes, reciprocity and CM branch assigned to `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:678` and line 692. Completing that transfer requires changing PadicFamilies, outside the two authorized roadmap files; the required direction remains EllipticCurveModularityPartII → PadicFamilies, and no additional local construction would remove the competing ownership.

## H02 (CBirkbeck) — answered

The exact weight-two comparison is already a target at `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:684` and line 686: Kato's positive Chern-character construction agrees with the ordered cup at k=2, r=r′=1, retaining W_f(1), duality, periods, transfers and smoothing factors, while the ordinary finite Chern operation has the negative comparison on integral reductions (Kato2004 line 2559, line 2583 and line 2591; K2SymbolsBrauerPartII §5.5). PadicFamilies §§4.0.1–4.0.3 contains neither the import nor the equality adapter identifying its modularZeta specialization with that construction, so the companion repair remains necessary; adding a minus sign to the positive-map adapter would be incorrect.

## H03 (CBirkbeck) — answered

The requested boundary is already explicit at `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:11` and line 1028: higher-weight moments, family interpolation and broader cyclotomic bounds belong to the PadicFamilies extension, while §6.0e keeps the unconditional modular-abelian rank-zero application in arbitrary coefficient degree, including CM. Kato Theorem 14.2(2) and Corollary 14.3(2) support that endpoint under the stated central-value nonvanishing hypothesis (Kato2004 line 4595 and line 4609), so no local scope change is needed.

## H04 (CBirkbeck) — answered

The downstream ownership mismatch is also confirmed: `TauCetiRoadmap/ModularIwasawaMainConjectures/README.md:89` and line 91 at `e954663f74ace51abd8bc5cc4fc45a6d0a309c40` still import the shared classes through PadicFamilies and explicitly assign their construction there. A documented PadicFamilies re-export can preserve that interface while naming §6.0e as the common owner, but neither companion file is editable in this job; the review expressly withdraws the separate ordering allegation, and the supplied order already places EllipticCurveModularityPartII before both consumers.

## Ownership, citations and pins

The object search covered the indexed main/open roadmap content and the board packages, including normalized theta/Siegel units, ordered symbols, modular zeta moments, reciprocity and induced-character/elliptic-unit comparisons. The relevant open PadicFamilies head was read through the indexed roadmap reader; ModularIwasawaMainConjectures and K2SymbolsBrauerPartII were read in their supplied sibling checkouts. No additional unprovided open checkout was sought. These reads establish a real overlap, not its resolution. Section 6.0e is the common owner under the required supply direction because its rank-zero application must precede the higher-weight/family consumers; importing those later consumers here would reverse supply. No new construction or declaration was introduced, and no declaration was renamed into another roadmap's namespace.

The citation resolver found no unresolved roadmap citations or Lean names, but reported that it could not check external Lean names against pinned packages. The relevant packages were therefore inspected directly at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, matching the supplied manifest; the object search there found no theta/Siegel-unit or modular-zeta construction to substitute for the proposed common owner. Native torsion is the killed-by-integer subgroup (`Mathlib/Algebra/Module/Torsion/Basic.lean:972`), its module is at line 1010, and additive linearization is `Mathlib/Algebra/Module/ZMod.lean:81`; none of those definitions asserts a finite rank-two torsion theorem. The pinned Galois action and agreement on coordinates are `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean:64` and line 85. Native irreducibility is `Mathlib/RepresentationTheory/Irreducible.lean:29`, through the simple subrepresentation order, rather than just absence of a proper nonzero subspace without nontriviality.

The directly relevant supplying sections were read: K2SymbolsBrauerPartII §§1.1 and 5.5; EulerSystemsAndKolyvaginSystems §§4.3, 4.17(c) and 4.20; ModularSymbolsPadicLFunctions §§0.6–0.8 and 1.1; AlgebraicModularFormsAndSerreWeights §§R15.5A.1–R15.5A.2; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P3; AutomorphicGaloisRepresentations §7.5; and SelmerIwasawaCohomology §2.12a. In particular, the symbol supplier's period normalization includes 2πi, its periods depend on a chosen nonzero basis, the cohomological summand must retain its dual/twist, and the descent supplier distinguishes strict Selmer finiteness from the singular-local-index bound for the usual finite condition. These match the existing local contract. The main-branch ModularForms and EllipticCurves roadmaps were read as the base developments; neither was revised or replanned.

Kato2004 was read from the legal Numdam archive. Besides the positive cup and moment maps in §8.4, Theorem 9.5 retains the raw prime-support hypothesis and three Euler cases (Kato2004 line 2797), while Theorems 9.6–9.7 treat the pushforward and eigenform formulas separately (line 2806 and line 2815). The modular-function-field comparison allows finite p-basis residue fields rather than assuming perfection (line 2826). The CM induced-character comparison has its own fixed realization and reciprocity (line 5664 and line 5677); it cannot be replaced by a non-CM unipotent-image assumption. Kenku1982 remains settled as uncertified and was not requested again. No source passage was copied into a deliverable.

## Computed adversarial pass

No definition, convention or mathematical statement was added or changed. The following finite calculations retest the reviewed interface and the native headlines against their README descriptions; they are consistency and countermodel tests, not proofs of the admitted deep theorems. The arithmetic Martin formula was also evaluated with exact rational arithmetic at every level 1–1000: all values were nonnegative integers, the bound held, and equality occurred precisely at 35 and the tested primes congruent to 11 modulo 12. Values reported as dimensions below are the arithmetic predictions checked against the specified native-space comparison, not a computation of Lean finrank.

| Statement | Instances tried; values computed on the compared sides | Result | Change |
| --- | --- | --- | --- |
| localTerms | (0,0) gives (1,1,1,1,1); (0,1),(1,2),(4,1) give zero; (2,2) gives (1/4,0,−1,1,0), (3,2) gives (5/9,1,1,−1,0) | Zero-exponent priority and exceptional primes agree | None |
| martinValue | Levels 0,1,2,3,4,11,13,30,35,47 give 0,0,0,0,0,1,0,1,3,4 | Empty products and Möbius/correction signs agree | None |
| newDimension | Level 13 predicts trivial-character dimension 0 rather than full Γ₁ newspace dimension 2; levels 11 and 35 predict 1 and 3 | The intersection in the signature is essential | None |
| dimension_comparison | At 1 the expression is 1/12−1/2−1/4−1/3+1=0; at 11 it is 1 | Matches the specified zero and one-dimensional newspaces | None |
| martin_bound | N=11,35,47: 12g=N+1=12,36,48; N=30: 12<31; N=1: 0<2 | Both equality alternatives and strict cases distinguished | None |
| norm_bound | K=ℚ, ℓ=5,x=5,B=5: 5≤5≤5; K=ℚ(√2), x=5,B=5: 5≤25≤25; x=0 would give 5≤0 | Nonzero input and prime-above condition matter | None |
| rationality_of_small_prime_coefficients | N=11: μ=12 and cutoff μ/6=2; integral a₂=−2, with first coefficients 1,−2,−1,2 | Actual normalized weight-two coefficients fit the hypothesis | None |
| integral_sturm_congruence | k=0,N=1: 1 versus 0 differs at a₀ modulo 2; k=12,N=1: Δ differs from 0 at a₁=1 and 12·1=12 | Coefficient zero and inclusive endpoint retained | None |
| NonCM | j=1728 admits i with i²=−1, which no integer scalar satisfies; j=0 admits a nontrivial cube root; −2¹²·31³/11⁵ has denominator 161051 | Geometric CM differs from rational endomorphisms | None |
| HasCyclicIsogeny | id has degree 1/kernel order 1; a two-isogeny has order 2; [2] has degree 4/kernel (ℤ/2)² of exponent 2 | Degree alone does not impose cyclicity | None |
| prime_isogeny_degrees | Membership values: 19 and 37 true, 41 false; 0 and 1 are not prime | CM-inclusive list and prime hypothesis retained | None |
| noncm_prime_isogeny_degrees | 19 is in the full list but absent here; 37 is in both; 41 is in neither | Geometric non-CM restriction retained | None |
| cyclic_isogeny_degrees | 1,12,14,21,25,27 belong; 20,22,28 do not | Composite restrictions carry information beyond prime degrees | None |
| GeometricTorsion | n=0 kills every geometric point; n=1 kills only O; n=2 in characteristic zero has 4 points | No finite/rank-two assertion at junk n=0 | None |
| torsionModule | On a two-point P, 3P=P and 0P=0, with 3≡1 modulo 2; at n=1 the module is zero | Native scalar action agrees | None |
| torsionRepresentation | On roots ζⁱ∛2, σ:i↦i+1 and τ:i↦−i: στ sends 0 to 1; τσ sends 0 to 2; id sends 0 to 0 | Nonabelian composition order agrees with the pinned action | None |
| FullRationalTwo | Cubics x³−x, x³−2x, x³+x+1 have 3,1,0 rational roots, giving torsion cardinalities 4,2,1 | Exactly the first satisfies cardinality four | None |
| RationalTwo | The same three curves have 3,1,0 nonzero rational two-points | Identity cannot witness the existential | None |
| full_two_irreducible | ℓ=5,7 give forbidden cyclic degrees 20,28; ℓ=3 gives permitted 12; odd conjugation has distinct eigenvalues 1,−1 | Lower bound and absolute-upgrade route retain their inputs | None |
| rational_two_irreducible | ℓ=11 gives forbidden 22; ℓ=7 gives permitted 14; at odd ℓ, conjugation eigenvalues differ | Sharp negative control is preserved | None |
| ImageInNonsplitCartanNormalizer | At p=11: field size 121, unit order 120, normalizer order 240, GL₂ order 13200; split algebra has size 121 but diag(1,0)diag(0,1)=0 | Field condition rejects the split algebra; full image cannot normalize it | None |
| nonsplit_of_not_surjective | At p=41: 41·40²·42=2755200=GL₂ order; 41 is absent from the isogeny list; 19>17 but 17>17 is false | Determinant and strict prime ranges agree with the route | None |
| lemos_integral_j | CM example has j=1728 and permits p=11; the level-11 nonintegral example has denominator 11⁵=161051 | Containment theorem includes CM, and is not unconditional integrality | None |
| lemos_surjectivity | n=1 fails 1<n, p=37 fails 37<p, p=41 passes; j=1728 fails NonCM | Necessary exclusions stay in the signature | None |
| F♯ | Levels 1,4 give 1; level 11 gives 3+2√2≈5.828427; level 35 gives (1+√8)⁶≈3148.634919 | Square root precedes exponent; exponent zero is harmless | None |
| G♯ | lcm(1,4)=lcm(2,4)=lcm(4,4)=4 and μ(4)=6 give 4; level 11 has μ(44)=72 and gives 13+4√3≈19.928203 | Using 4N at N=4 would give 9 | None |
| H♯ and majorants | At 11 max(5.828427,19.928203)=19.928203; majorants are 9 and 169; at N=1 both F values are 1 | Maximum and small-index exception agree | None |
| Removed-prime bound | At p=2 the nonzero gap is 3−2√2≈0.171573; M₀=11 gives exponent 2 and bound 3+2√2≈5.828427 | Vanishing norm input and primes ℓ≥7 are excluded in this instance | None |
| Actual versus semisimple torsion | (x−1)(4x²+5x+23) has quadratic discriminant −343: actual rational two-torsion dimension 1 versus semisimple fixed dimension 2 | The irreducibility upgrade cannot be omitted | None |
| Local filters | (2,0,3) gives (1−3X+2X²,1); (2,2,0) gives (1,1); (3,1,−1) gives (1,1−5X); (3,2,0) gives (1,1−4X+3X²) | Exceptional and bad-prime branches remain distinct | None |
| Mod-four recognition side condition | For q=3,a_q=−1, (q+1)(a_q−1)=−8≡0 modulo 4; a_q=1 gives 0 | Elliptic bad-prime side condition holds, rather than disappearing from the general theorem | None |
| Trace transfer | At N=11 the tested upper bound is 12 and largest eligible prime 7; 4√7≈10.583005<19.928203 | Strict trace comparison is consistent | None |
| Matrix selection | U=[[1,1],[0,1]], V=[[1,0],[2,1]]: det(1−U)=det(1−V)=0, but UV=[[3,1],[2,1]] has det(1−UV)=2 modulo 4 | Testing separate matrices cannot replace a subgroup hypothesis | None |
| Two-isogeny repair | Degree 2 is coprime to ℓ=3,5 but not to ℓ=2; identity degree is 1 | Torsion invariance has the stated odd-prime range | None |
| Coefficient-prime reduction adapter | At ℓ=11, exponents 0 and 11 are 0 modulo 11, exponent 1 is 1; an additive exponent ≥2 remains positive in M₀ versus 0 in the away-from-ℓ conductor | Deletion level and residual conductor are distinct without the local alternative | None |
| Coprime cyclic kernels | C₂×C₁₁ has order and exponent 22; C₄×C₅ has order and exponent 20; C₂×C₂ has order 4 but exponent 2 | Cyclicity and the isogenous-curve degree-four construction matter | None |
| Normalized modular coordinate | r=2,t=8 gives 1728; t=−16 gives 0; u=2t=16 in the unchanged formula gives 2048 | A rescaled unmarked coordinate fails | None |
| Rational j-tables | At level 11 the CM entry is −32768, making 3 rather than 2 entries; level-17 denominators are 2 and 131072 | Integral or non-CM-only truncation loses points | None |
| Cuspidal-divisor torsion | X₀(1) has zero class of order 1; the X₀(11) cusp difference has order 5; m=5,h=7 gives annihilator 35 | Torsion does not mean zero or finite points over the cusp field | None |
| Winding quotient/lattice | Zero new quotient gives e=0 and A=0; id pulls O back to O; [q] pulls back to qO with quotient O/qO | Nonzero quotient and saturation need separate inputs | None |
| Theta divisor | c=5: order 24 at zero and −1 at each of 24 other points; total 24−24=0; constant 1 has all orders 0 | Constant unit fails; divisor has degree zero | None |
| Theta normalization | Leading coefficient a≠0 becomes 2a after scalar multiplication by 2, while divisor orders remain 24,−1; c=1 gives divisor zero and stipulated unit 1 | Tate leading coefficient excludes the wrong scalar | None |
| Ordered cup and finite Chern | Over ℚ₇, 3²=2 modulo 7 selects cubic coordinate 1; Chern gives −1=2 modulo 3, and its negative gives 1 | Positive-map adapter has sign +1; ordinary-Chern adapter has sign −1 | None |
| Coefficient and ordered-slot edges | Modulo 1 both classes are 0; modulo 2 both signs give 1; modulo 6 cup 1 gives Chern 5; swapping slots gives −1 and a slot 1 gives 0 | Odd/composite coefficients detect the sign; zero input stays zero | None |
| Weight-two moment | k=2,r=r′=1: k−r=1, k−2=0 and (k−2)!=1 | Twist one, degree zero and no factorial denominator agree | None |
| Raw support and smoothing | p=7,c=5,d=11: (M,N)=(1,5) has both gcds 1 and support inclusion; (2,5) still has gcds 1 but 2∤5 | Smoothing does not imply the raw support hypothesis | None |
| Three raw Euler operators | p=7,A=2,B=1 at (M,N)=(7,7),(1,7),(1,5) gives 1,5/7,6/7 | Removing the quadratic term changes 6/7 to 5/7 | None |
| Transfer and coefficient naturality | Degrees 2 then 3 send 1 to 2 then 6, equal to degree-six transfer; reducing modulo 5 sends either result to 1 | Inverse restriction, which would retain 1 before reduction, is wrong | None |
| Cohomological realization | For y²=x³−x over 𝔽₅, #E=8 and a₅=−2; arithmetic H¹ has (tr,det)=(−2/5,1/5), twist one (−2,5), twist two (−10,125) | W_f(1) matches the Tate-module convention | None |
| Period orientation | For q+2q² the upward modular period is −(1+2/2)=−2; reverse path gives +2; q−2q² gives 0 | Orientation and frequency factors are visible | None |
| Period rescaling and reciprocity | L/Ω=2 becomes L/(2Ω)=1; swapping the ordered class changes 2 to −2; the zero class has value 0 | Equality requires the same scalar, order and period | None |
| Singular-local descent | In ℤ₅²/(ℤ₅×0), (1,0) maps to 0, (0,5) maps to 5 of index 5; zero image has infinite index | A finite-at-p class cannot supply the singular index | None |
| CM induced-character route | On a split coefficient realization χ⊕χᶜ the off-diagonal entries are 0; a nontrivial unipotent [[1,1],[0,1]] has off-diagonal entry 1 | A non-CM unipotent requirement cannot replace the CM branch | None |
| Modular rank zero and finiteness | Coefficientwise rank 0 in degree 2 gives total rank 0; finite groups of orders 5 and 7 give product order 35; ℤ/5 has rank 0/order 5 but ℚ/ℤ has rank 0/infinite order | Arbitrary coefficient degree and finite generation matter | None |
| Quantitative isogeny bound | B(1,0)=B(1,−1)=9702250000000; B(2,H≤985)≈39027787481241.41; id has degree 1, while [n] has degree n² | Existence bound neither vanishes at negative height nor bounds all isogenies | None |
| Non-CM cyclic corollary | CM matrix [[10⁷,−1],[1,10⁷]] has gcd of entries 1 and determinant 100000000000001, exceeding the quadratic-field bound above | CM cannot be included in that cyclic corollary | None |
| Surface polarization degree | Product principal polarization: intersection 2, polarization-map degree 1; changing one line-bundle degree to n gives intersection 2n | The two degree notions differ | None |
| BPR ranges | 14000000<170000000000<10¹⁴; finite range covers both strict-cutoff equalities, and 10¹⁴ exceeds both cutoffs | No numerical gap; p=13 remains excluded | None |
| Exceptional projective range | A₄,S₄,A₅ have largest element orders 3,4,5 and orders 12,24,60; 19>17, while 17>17 fails | Oddness of order 2 alone cannot exclude them | None |
| Full Néron torsion specialization | q=23,e=1: 1<22; q=2,e=1: 1<1 fails; in the formal multiplicative group −1 has order 2 and reduces to 1 | Strict ramification bound cannot be weakened | None |
| Cartan normalizer convention | p=5: group orders GL₂=480,Nsp=32,Nns=48,intersection=16; independently conjugating Nns by [[0,1],[1,1]] gives intersection 8 | Relative position is part of the correspondence | None |
| Chen permutation dimensions | p=2 gives 3+1=1+3=4; p=5 gives 15+1=10+6=16; p=3 gives 6+1=3+4=7 | The p=2 monomial convention and old terms are necessary | None |
| Exact divisor and differential | r=5,p=11: level 605, divisor 121, gcd(121,5)=1 and weight-two factor 1; r=p=5 gives gcd(25,5)=5 | Wrong divisor and noncoprime input excluded | None |
| Winding nonvanishing and endpoint | q+2q² gives −2, q−2q² gives 0; at p=11 the upward endpoint is −D=10D while absolute homology boundary is 0 | Nonzero function alone does not prove nonzero winding; groups remain distinct | None |
| Coefficient support/cotangent | p=11,q=23: t+2t² gives ω=(11+22t)dt with cusp value 11dt≠0; omitting width gives dt | Fixed width factor preserved, even though both are units | None |
| Formal immersion and point torsion | q=23,e=1 satisfies 1<22; m=5 and #A(ℚ)=7 imply 35u(P)=0 after descent, without asserting A(K) finite | Local and descent inputs remain separate | None |
| j denominators | ℤ[1/11] allows 1/11 but not 1/2; excluding the remaining 11-denominator makes the intersection ℤ | Away-from-p and at-p steps have different jobs | None |
| j-numerator definition | Levels 2,3,5,7,13 have degrees 3,4,6,8,14 and constant terms 4096,729,125,49,13; outside the set the polynomial is 0 | Powers and total-function convention agree | None |
| Integral parameter theorem | f=(T+16)³,t=8 gives 1728 and 8 divides 4096; t=−16 gives 0; degree-one f=T+1,t=1/2 gives integral 3 but nonintegral t | Degree and nonzero-input hypotheses discriminate | None |
| Finite integral j-sets | Signed divisor counts 26,14,8,6,4 give distinct-value counts 25,13,8,6,4; level 13 gives −39091613782464,576,2101248,2045023375454208 | Both signs and repeated values are handled | None |
| Integral modular j characterization | r=2,t=8 gives 1728 and t=−16 gives 0; r=13,t=−1 gives 576 and pole degrees 1+13=14 | Arithmetic values agree with the fixed modular coordinate | None |
| Quadratic twisting | At p=5, a=2 has a²=4≠1; χ²=1 preserves determinant; full group order is 5·4²·6=480; at p=3 nonzero squares are 1 | The perfectness input has its intended prime range | None |
| Finite-j integral model | j=576 gives k=1/2,u=2,(a,b)=(24,64), discriminant −2654208=−2¹⁵·3⁴; 1728k/(k+1)=576 | Model and scaling reproduce j; k=0 would be singular | None |
| Normalizer trace/ramification route | Over 𝔽₂₅, conjugate multiplication with a=b=1 gives [[1,3],[1,4]], trace 0, determinant 1; multiplication alone has trace 2 | Quotient character and outside coset cannot be omitted | None |
| Exceptional-prime divisibility | j=576 traces at 5,7,11,13,17,19 are −2,−4,−3,−2,5,−1; all 21 specified character values are −1; gcds are 1,1,2,1,1,1,1 and B=12 | Includes q=p through the q factor; no p>37 divides this B | None |
| Final Frobenius exclusion | For p=41,q=5,a=−2 the trace is 39 and discriminant is 25=5² modulo 41, with distinct roots 22 and 17; trace 0 would not exclude the outside coset | Both nonzero trace and a nonzero square discriminant are required, not assumed | None |

## Elaborated signatures

All 24 supplied `#check @name` elaborated types were compared individually with the README. No necessary section binder is lost, and no type change is needed. Suggested.lean is unchanged, so the supplied elaboration remains the mechanical signature audit; no additional scratch elaboration is claimed.

| Declaration | README comparison |
| --- | --- |
| localTerms | §1.1: ℕ bases/exponents, ℚ⁵, exponent-zero priority |
| martinValue | §1.2: ℚ-valued five-product expression, zero-level convention |
| newDimension | §1.3: NeZero level, complex finrank of native new/trivial-character intersection |
| dimension_comparison | §1.3: same positive level, cast to ℚ |
| martin_bound | §1.4: positive level, inequality and both equality alternatives |
| norm_bound | §2.1: Field/NumberField, prime ℓ, nonzero prime ideal above ℓ, nonzero integral x, every embedding |
| rationality_of_small_prime_coefficients | §3.1: normalized newform, weight 2, trivial character, exact prime cutoff |
| integral_sturm_congruence | §4.2: nonnegative weight, fixed embedding, arbitrary ideal, a₀ included |
| NonCM | §5.0a: geometric endomorphisms, integer scalars, E.IsElliptic |
| HasCyclicIsogeny | §5.0a: rational elliptic source/target, degree and geometric cyclic kernel |
| prime_isogeny_degrees | §5.0a: prime degree, full CM-inclusive list |
| noncm_prime_isogeny_degrees | §5.0a: geometric NonCM, shorter prime list |
| cyclic_isogeny_degrees | §5.0b: full natural degree list including 1 |
| GeometricTorsion | §5.1: actual killed-by-n subgroup over ℚ̄, E.IsElliptic |
| torsionModule | §5.1: ZMod n on that same subgroup |
| torsionRepresentation | §5.1: pinned absolute Galois action, its native linearization |
| FullRationalTwo | §5.1: four rational killed-by-two points |
| RationalTwo | §5.1: nonzero rational point killed by two |
| full_two_irreducible | §5.4: Fact ell.Prime, ell≥5, full rational two-torsion, actual and scalar-extended conclusions |
| rational_two_irreducible | §5.5: Fact ell.Prime, ell≥11, rational two-point, both conclusions |
| ImageInNonsplitCartanNormalizer | §6.1: Fact p.Prime, field subring of cardinality p², actual conjugation action |
| nonsplit_of_not_surjective | §6.10: NonCM, Fact p.Prime, p>37, failed surjectivity |
| lemos_integral_j | §6.11: five isogeny degrees, prime outside that set, containment, no NonCM assumption |
| lemos_surjectivity | §6.18: NonCM, cyclic n>1, Fact p.Prime, p>37, full automorphism image |

## Validation and repository outcome

No authorized roadmap file changed. HEAD remains `46ba4f11865b63eb821a1720ea8194ee75dfa12c`; no commit was created and nothing was pushed. Neither companion roadmap nor the merge order was edited. Successful local checks do not resolve H01, H02 or H04.

Build: `lake build TauCetiRoadmap.EllipticCurveModularityPartII.Suggested` — exit status 0, with 13 expected admitted-theorem warnings. Exact final line:

```text
Build completed successfully (9233 jobs).
```

Dependency check with the supplied order and `--movable` — exit status 0; complete output:

```text
depcheck: 50 roadmaps, 580 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The order places EllipticCurveModularityPartII at 188, PadicFamilies at 190 and ModularIwasawaMainConjectures at 250; this checks direction, not agreement of their ownership contracts.

Full gate against `origin/main` — exit status 0; exact summary line:

```text
gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
