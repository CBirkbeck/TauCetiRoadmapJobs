## H01 (CBirkbeck) — applied differently

`TauCetiRoadmap/EllipticCurveModularityPartII/README.md:11` and `:1028` now separate the common theta/Siegel units, ordered symbols, weight-two moment/reciprocity and rank-zero CM adapter from PadicFamilies' higher-weight moments, interpolation and cyclotomic bounds; the downstream paragraph also drops the unverified KatoEulerSystems and FaltingsFinitenessAndIsogenyTheoremsPartII section claims. The coordinated transfer remains incomplete: indexed PadicFamilies head `ed1464b` still constructs the shared objects in `TauCetiRoadmap/PadicFamilies/README.md:2355`, `:2371` and `:2384`, and its ownership/supplier paragraph at `:85` still needs the companion import and specialization contract; those files are outside this job's expressly authorized two-file edit scope.

## H02 (CBirkbeck) — applied differently

`TauCetiRoadmap/EllipticCurveModularityPartII/README.md:684` now distinguishes Kato's positive Chern-character map from the ordinary product-normalized finite Chern operation: cup = −Chern on integral reductions, hence the same sign after the weight-two moment, transfer and arithmetic/eigenform maps, while an adapter already using Kato's positive map has no additional minus sign (Kato2004 line 2583; K2SymbolsBrauerPartII §5.5). The dictionary at `:686` fixes the coefficient completion, W_f(1), Poincaré pairing, oriented periods and unchanged smoothing factors, `:700` tests the actual cubic symbol {3,7} over ℚ₇ with coordinates 1 and 2, and `TauCetiRoadmap/EllipticCurveModularityPartII/Suggested.lean:42` uses the matching cup-normalized terminology.

## H03 (CBirkbeck) — applied

`TauCetiRoadmap/EllipticCurveModularityPartII/README.md:688` replaces the undifferentiated reciprocity interface with the raw weight-two formula under prime(M) ⊆ prime(N), its actual cohomological source/de Rham target and its constant, linear and quadratic p-Euler operators; `:690` separately states the pushforward labels, smoothing/support conditions, auxiliary-level independence and coefficient-extended eigenform projection (Kato2004 line 1395, line 2474, line 2671 and line 2797). The Check at `:701` distinguishes symbol existence from raw reciprocity at (M,N)=(2,5) and computes the three factors as 1, 5/7 and 6/7, without imposing the raw support restriction on the final eigenform level and conductor.

## H04 (CBirkbeck) — applied

`TauCetiRoadmap/EllipticCurveModularityPartII/README.md:724` changes BPR Proposition 4.8, p. 14 → p. 13: BPR2013 line 615 starts printed p. 13, line 647 states the proposition, and line 659 starts p. 14 during its proof. The range remains 11 ≤ p < 10¹⁴, p ≠ 13, and its overlap with the large-prime exclusions is unchanged.

---

**Verification record.** Commit `46ba4f11865b63eb821a1720ea8194ee75dfa12c` is the local repair commit; no push or external comment was made. H01 is a local ownership/interface repair with an outstanding companion change, not a claim that PadicFamilies has already adopted it.

Ownership was searched by object in main `7bd35ba`, the available board packages, the indexed open roadmap inventory and all 46 supplied sibling checkouts. The indexed PadicFamilies text confirms the overlap, and the supplied ModularIwasawaMainConjectures §Scope and ownership still attributes the geometric constructions to PadicFamilies; its later consumer description will also need to follow the transfer. The common geometric construction and its weight-two arithmetic adapters move from the later PadicFamilies development to this earlier roadmap, at merge-order positions 191 and 189 respectively; no reverse dependency is introduced. Generic symbol products/transfers and the finite Chern sign retain SchemeKTheoryOperations, K2SymbolsBrauer and K2SymbolsBrauerPartII as owners, and generic conditional descent retains EulerSystemsAndKolyvaginSystems as owner. No Lean declaration was added or assigned another roadmap's fully qualified name. Ownership against unprovided open pull-request files was not independently checked beyond the indexed text; the report makes no broader head-verification claim.

Cross-roadmap references were resolved again against main and indexed heads, with the pinned package directory supplied: no unresolved roadmap citations or Lean names remain. The section audit found the 99 numbered supplier locators examined, including K2SymbolsBrauerPartII §§1.1/5.5, AlgebraicModularFormsAndSerreWeights §§R15.5A.1–R15.5A.2, FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P3 and EulerSystemsAndKolyvaginSystems §4.17(c); the latter requires a finite singular-local index and does not impose the finite local condition at p on the Euler-system class.

The library revisions were confirmed as Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Native Kummer and ordered cup maps were read at `TauCeti/FieldTheory/GaloisCohomology/Kummer.lean:249`, `:277` and `TauCeti/RepresentationTheory/Homological/ContCohomology/Cup/Product.lean:595`, `:790`: Kummer needs the coefficient invertible in the field, and the cup requires its continuous equivariant coefficient pairing; neither declaration constructs modular units or a modular explicit-reciprocity comparison. These generic maps remain supplier inputs, with no replacement in Suggested.lean.

All 24 declarations were put through `#check @name` in one scratch module and elaborated against the final acceptance file. Every elaborated signature was compared with its README statement: no binder changed or disappeared; positive-level `NeZero`, number-field and ideal hypotheses, `E.IsElliptic`, prime instances, geometric non-CM, cyclic degree and prime cutoffs remain explicit. The Lean change is confined to its module docstring: modular reciprocity remains unstatable because the normalized modular symbols/classes and filtered eigenform realization are missing, so no substitute theorem or data declaration was introduced.

The legal cached BPR text supplies the corrected locator. Kato2004 was read from Numdam, including §8.4's positive map, §9's three reciprocity stages and Theorem 12.5; GaudronRemond2011, Chen1998 and DeSmitEdixhoven2000 were also retrieved legally for the existing citations. No missing legal text remains; Kenku1982 retains its settled uncertified status. The authorized edit scope excludes `packages/EllipticCurveModularityPartII/sources.toml`: its existing eight entries were left unchanged, so recording those four additional already-cited works in that manifest remains source bookkeeping for the worker.

**Computed adversarial pass.** These are instance and normalization probes, not proofs of the admitted targets. “Unchanged” means the tested statement was retained, not that the numerical probe establishes its general theorem.

| Statement | Instances tried | Values computed on the two sides or against the wrong model | Result | Change |
|---|---|---|---|---|
| Arithmetic Frobenius convention | E:y²=x³−x over 𝔽₅ | #E=8, a₅=−2; det(1−FT)=1+2T+5T² | Compatible | Unchanged |
| Γ₀ index convention | N=1,11,44 | μ=1,12,72; μ(44)/6=12 | Compatible | Unchanged |
| Deletion level versus prime-to-ℓ conductor | Good, multiplicative exponent ℓ, multiplicative exponent 1, additive at ℓ | Coefficient-prime exponents after deletion are 0,0,1,positive; prime-to-ℓ conductor exponent is always 0 | Distinct notions retained | Unchanged |
| Geometric cyclic-isogeny convention | Identity and [2] | Degrees 1,4; kernel types 0 and (ℤ/2)²; cyclicity true,false | Degree alone excluded | Unchanged |
| Joint Cartan placement | p=2 and p=5, δ=2 | At 2: |G|=6, |Nsp|=2, |Nns|=6; at 5: 480,32,48 and intersection 16 | Small-prime and relative-placement conventions agree | Unchanged |
| Exact-divisor convention | r=5,p=11; r=p=5 | gcd(121,5)=1; gcd(25,5)=5 | Second input excluded | Unchanged |
| Differential and winding convention | q+2q², upward and downward paths | −1−2/2=−2; reversed value +2; at width 11 the cusp coefficient is 11 | Sign/width fixed | Unchanged |
| `localTerms` (§1.1) | (p,e)=(0,0),(0,1),(2,2),(3,2),(2,3) | (1,1,1,1,1); zero; (1/4,0,−1,1,0); (5/9,1,1,−1,0); (3/8,0,1,0,0) | Branches and junk values agree | Unchanged |
| `martinValue` (§1.2) | N=0,1,11,13,30,35,37 | 0,0,1,0,1,3,2; empty product gives 1/12−1/2−1/4−1/3+1=0 | Compatible | Unchanged |
| `newDimension` (§1.3) | Levels 1,11,13 | Trivial-character dimensions 0,1,0; full Γ₁(13) dimension 2 | Character intersection essential | Unchanged |
| `dimension_comparison` (§1.3) | Levels 1,11,30,35 | Arithmetic values 0,1,1,3 equal the stated newspace dimensions 0,1,1,3 | Compatible | Unchanged |
| `martin_bound` (§1.4) | N=1,11,13,30,35,37 | 12g=0,12,0,12,36,24 versus N+1=2,12,14,31,36,38; equality only 11,35 in this list | Both directions of equality criterion agree | Unchanged |
| F♯ (§1.5) | Levels 1,11,35 | 1,3+2√2,(1+√8)⁶; exponent at 35 is 6 | Compatible | Unchanged |
| G♯ (§1.6) | Levels 1,4,11 | 4,4,13+4√3; replacing lcm(4,4) by 16 gives 9 | Wrong level rejected | Unchanged |
| H♯ (§1.7) | Levels 1,4,11 | max(1,4)=4 twice; max(3+2√2,13+4√3)=13+4√3 | Maximum and both inequalities agree | Unchanged |
| Numerical majorants (§1.8) | N=1,4,11 | At 1 both F=1 despite √(1/6)>1/6; at 11 F_K=9, G_K=169 exceed sharp values ≈5.828,19.928 | Small-level exception retained | Unchanged |
| `norm_bound` (§2.1) | K=ℚ, I=(5), x=5; x=0 control | 5≤5≤5; x=0 would give 5≤0 | Nonzero condition excludes control | Unchanged |
| Removed-prime bound (§2.2) | p=2,M₀=11 | Gap 3−2√2≈0.171573>0; upper bound (√2+1)²≈5.828427 excludes ℓ≥7 | Compatible | Unchanged |
| `rationality_of_small_prime_coefficients` (§3.1) | Level-11 normalized form | μ/6=2; a₁,a₂,a₃,a₄=1,−2,−1,2; recurrence a₄=a₂²−2=2 | Prime test and recurrence agree | Unchanged |
| Small-prime integrality (§3.2) | N=11,ℓ=7 | q≤2 and F♯≈5.828<7, hence q≠ℓ; bad prime 11 lies outside tested set | Hypotheses align | Unchanged |
| Rational exact-conductor realization (§3.3) | Displayed cubic with discriminant −343; level 1 | Rational two-torsion fixed dimension 1 versus semisimple fixed dimension 2; level-one cusp dimension 0 | Actual/semisimple distinction and empty case retained | Unchanged |
| Local filters (§4.1) | (2,0,3),(2,2,0),(3,1,−1),(3,2,0) | 1−3X+2X²; 1; 1−5X; 1−4X+3X² in the indicated entries | Signs/branches agree | Unchanged |
| `integral_sturm_congruence` (§4.2) | k=0,N=1,J=(2); Δ at k=12,N=1; J=(1),(0),(6) | Constant difference a₀=1∉(2); Δ has a₁=1 at cutoff 1; unit ideal accepts all, zero ideal gives equality, 6 is composite | Coefficient zero and arbitrary ideals retained | Unchanged |
| Mod-four point recognition (§4.3) | y²=x³−x, conductor 32, good q=3,5 | Point counts 4,8 both 0 mod 4; bad-prime expression at odd a_q=−1 is −2(q+1), divisible by 4 | Compatible | Unchanged |
| Point-count transfer (§4.4) | N=11,largest eligible q=7 | 4√7≈10.583<13+4√3≈19.928 | Strict trace gap retained | Unchanged |
| Mod-four subgroup selection (§4.5) | A=[[1,1],[0,1]], B=[[1,0],[2,1]] | det(1−A)=det(1−B)=0; AB=[[3,1],[2,1]], det(1−AB)=2 mod 4 | Individual matrices do not suffice | Unchanged |
| Two-isogeny repair (§4.6) | Identity, degree 2 at ℓ=3 and ℓ=2 | Identity degree 1; gcd(2,3)=1 versus gcd(2,2)=2 | Odd-ℓ transport only | Unchanged |
| Full-two realization (§4.7) | N=11,ℓ=23; lower control ℓ=19 | H♯≈19.928; 23>H♯ but 19<H♯ | Both thresholds enforced | Unchanged |
| Weight-two reduction alternative (§4.7a) | Minimal discriminant exponents 0,ℓ,1 | Residues 0,0,1 mod ℓ | Multiplicative exponent 1 excluded | Unchanged |
| Level adapter (§4.8) | Good, deleted multiplicative, additive at ℓ | Coefficient-prime exponents 0,0,positive versus residual away-from-ℓ exponent 0 | No unconditional identification | Unchanged |
| `NonCM` (§5.0a) | j=1728,0; 11a curve | CM automorphisms have orders 4,3; 11a j=−122023936/161051 is nonintegral | Geometric, not rational, endomorphisms tested | Unchanged |
| `HasCyclicIsogeny` (§5.0a) | Identity, order-2 quotient, [2] | Degrees 1,2,4 and cyclic kernel sizes 1,2 versus noncyclic size 4 | Cyclic geometric kernel essential | Unchanged |
| `prime_isogeny_degrees` (§5.0a) | p=19,37,41,163 | Membership true,true,false,true | Full list includes CM cases | Unchanged |
| `noncm_prime_isogeny_degrees` (§5.0a) | p=19,37,41,163 | Membership false,true,false,false | Non-CM hypothesis changes the list | Unchanged |
| Class-number-one input (§5.0a) | D=−20,−16 | Primitive reduced-form counts 2,1; −16=4·(−4) is an order discriminant | Field/order distinction retained | Unchanged |
| `cyclic_isogeny_degrees` (§5.0b) | n=1,12,14,20,22 | Membership true,true,true,false,false | Identity and composite cases covered | Unchanged |
| `GeometricTorsion` (§5.1) | n=0,1,2 | All geometric points; zero group of size 1; geometric group of size 4 | No finite-rank assertion at n=0 | Unchanged |
| `torsionModule` (§5.1) | A two-torsion point P | 3P=P, 2P=0; 3≡1 and 2≡0 mod 2 | Native quotient scalar action agrees | Unchanged |
| `torsionRepresentation` (§5.1) | S₃ action on roots of x³−2 | (στ)P₀=P₁ while (τσ)P₀=P₂; identity gives P₀ | Noncommutative composition order detected | Unchanged |
| `FullRationalTwo` (§5.1) | Cubics x³−x, x³−2x, x³+x+1 | Rational two-torsion cardinalities 4,2,1; predicate true,false,false | Correct rational/geometric distinction | Unchanged |
| `RationalTwo` (§5.1) | Same three curves | Nonzero rational killed-by-two counts 3,1,0; predicate true,true,false | Identity is not a witness | Unchanged |
| Composite-degree exclusions (§5.2) | ℓ=3,5,7,11 | 4ℓ=12 allowed,20/28/44 absent; 2ℓ=6/10/14 allowed,22 absent | Cutoffs necessary for this route | Unchanged |
| Stable-line kernel construction (§5.3) | ℓ=3,5 and order-2/order-4 kernels | Coprime cyclic products have orders 6,10 and 12,20 respectively | Target isogeny degree agrees | Unchanged |
| `full_two_irreducible` (§5.4) | ℓ=5,7; excluded ℓ=3 | 4ℓ=20,28 absent; 12 present; odd conjugation determinant −1≠1 | Absolute upgrade retains oddness | Unchanged |
| `rational_two_irreducible` (§5.5) | ℓ=11; excluded ℓ=7 | 22 absent; 14 present | Lower prime control retained | Unchanged |
| Normalized coordinates (§6.0a) | r=2,t=8 and r=13,t=−1 | j=1728,576; replacing t=8 by u=16 without changing formula gives 2048 | Scalar normalization matters | Unchanged |
| Rational j-tables (§6.0b) | Levels 11 and 17 | Level 11 has 3 entries including −32768; level-17 denominators 2 and 131072 | CM and nonintegral entries retained | Unchanged |
| Cuspidal-divisor torsion (§6.0c) | X₀(1),X₀(11); h=7,m=5 | Cusp class orders 1,5; hm=35 kills descended image | Torsion need not be zero | Unchanged |
| Winding quotient/lattice (§6.0d) | J_new=0, identity quotient, [q] | A_e=0; pullback lattice O; [q] pullback qO with quotient O/qO | Connected-kernel/saturation condition retained | Unchanged |
| Theta unit and distribution (§6.0e) | c=5,p=7; c=1; scalar 2 | Orders 24 and twenty-four copies of −1 sum to 0; c=1 gives unit 1 and symbol 0; multiplying by 2 changes leading coefficient by 2 | Wrong constant/scalar units excluded | Unchanged |
| Finite cup/Chern dictionary (§6.0e) | m=1,2,3,6 | (cup,Chern) coordinates (0,0),(1,1),(1,2),(1,5); negating Chern recovers cup in each case | Minus sign works at all moduli | Added |
| Actual cubic normalization (§6.0e) | F=ℚ₇,m=3,s={3,7}; unit input | Invariants 1/3 and −1/3; −2=1 mod 3; unit input gives 0 on both maps | Odd modulus detects sign | Strengthened Check |
| Integral-reduction restriction (§6.0e) | m=3 with μ₃⊂ℚ₇ | K₁(F)[3] has 3 elements, whereas the integral-reduction image has Bockstein 0 | No formula asserted on the extra quotient | Added |
| Coefficient/characteristic scope of dictionary | F=𝔽₂,m=3; F=𝔽₂,m=2 | In first case m=1 in F and H²=0 on both sides; in second m=0 is not a unit | Invalid characteristic coefficient excluded | Explicit scope retained |
| Arithmetic sign adapter (§6.0e) | Linear transfer of degree 2 on cup coordinate 1 mod 3 | Transferred cup 2; transferred Chern 2·2=1; −1=2 mod 3 | Dictionary commutes with transfer | Added |
| Positive Chern-character adapter (§6.0e) | Positive-map coordinate 1 mod 3 | Its weight-two image is 1; an extra minus gives 2 | No double sign conversion | Added |
| Weight-two moment (§6.0e) | k=2,r=r′=1 | k−2=0, k−r=1, 0!=1 | Twist one and no factorial denominator | Explicit |
| Coefficient realization (§6.0e) | E:y²=x³−x,q=5,p=7 | H¹ trace/determinant −2/5,1/5; twist one −2,5; twist two −10,125 | W_f(1) selected | Added dictionary |
| Period-line comparison (§6.0e) | q+2q²; Ω→2Ω | Upward integral −2, reverse +2; L/Ω=2 becomes L/(2Ω)=1 | Orientation/scalar ambiguity excluded | Explicit dictionary |
| Identical smoothing/transfer data (§6.0e) | c=5,d=11,p=7,M=1,N=5; transfer degrees 2,3 | gcd(5,42)=gcd(11,210)=1; composite multiplier 2·3=6 | Same data and norm maps required | Explicit dictionary |
| Raw reciprocity domain (§6.0e) | (M,N)=(1,5),(2,5),p=7,c=5,d=11 | Sums 6,7; smoothing gcds both 1; support inclusions true,false | Symbol existence does not imply raw formula's hypothesis | Added |
| Raw source/filtered target (§6.0e) | Weight-two two-term differential | Twist one selects Fil¹ of untwisted H¹; upward value −2 versus reversed +2 | Map lands in the correct filtered realization | Specified |
| Raw p-dividing-M branch (§6.0e) | p=7,M=7,N=35 | Support {7}⊆{5,7}; Euler multiplier 1 | Constant branch retained | Specified |
| Raw p-dividing-N branch (§6.0e) | p=7,M=1,N=7,A_p=2 | 1−2/7=5/7 | Linear branch retained | Specified |
| Raw good-p branch (§6.0e) | p=7,M=1,N=5,A_p=2,B_p=1 | 1−2/7+1/7=6/7; omitting quadratic term gives 5/7 | Quadratic branch distinguished | Specified |
| Pushforward domain (§6.0e) | N=5,m=A=1,S={7},c=5,d=11,label a(1) | prime(mA)=∅⊆S and gcd(55,6)=gcd(11,5)=1; SL₂ label would require 5∈S | Two label domains differ | Specified |
| Auxiliary-level independence (§6.0e) | Same label with lifts (M,L)=(7,35),(49,245) | Both have prime(M)={7}, prime(L)={5,7}; degree changes preserve corestriction law 2·3=6 in the transfer model | Equality target retains the construction's support conditions | Specified |
| Eigenform projection (§6.0e) | Coefficient degree d=2, λ of local degree 1 or 2 | Each λ-summand has K_f,λ-rank 2 and ℚ_p-rank 2 or 4 | Coefficient extension is explicit | Specified |
| Base-field central specialization (§6.0e) | Cyclotomic conductor m=1 | [ℚ(μ₁):ℚ]=1; localization retains W_f(1), with trace/determinant −2,5 in the example | No raw level-support condition imposed on m=1 output | Specified |
| Modular-function-field comparison (§6.0e) | Residue fields 𝔽₇ and 𝔽₇(t) | p-basis sizes 0,1; [k:k⁷]=1,7; dlog t∧dlog(1−t)=0 agrees with the Steinberg cup value 0 | Finite-p-basis domain is broader than perfect residue fields | Existing target retained in staged formula |
| Singular-local descent (§6.0e) | ℤ₅²,finite line ℤ₅×0 | Images of (1,0),(0,5) in quotient are 0,5; indices infinite,5 | Finite-at-p wrong model excluded | Unchanged |
| Arbitrary-degree rank zero (§6.0e) | d=2; finite factors of orders 5,7 | Each rank-zero completion gives total rational rank 0; finite-factor product order 35 | No elliptic-only restriction | Unchanged |
| Mordell–Weil finiteness (§6.0e) | ℤ/5 and ℚ/ℤ | Both have rational rank 0, cardinalities 5 and infinite | Finite generation remains necessary | Unchanged |
| Quantitative isogeny existence (§6.0f) | d=1,H=0,−1; d=2,H=0 | B=9702250000000 at both first inputs; quadratic-field B≈39027787481241.41; identity degree 1 | Negative heights and field degree handled | Unchanged |
| Surface degree convention (§6.0f) | Product principal polarization | Top intersection 2, polarization-map degree 1; weighted/graph value 2nΔ | Degree notions separated | Unchanged |
| Cyclic-isogeny non-CM corollary (§6.0f) | CM E over ℚ(i),[10⁷+i] | Smith invariants 1,10¹⁴+1, exceeding B(2,h_F)<4·10¹³; identity still degree 1 | CM control excludes false universal corollary | Unchanged |
| BPR finite/large range (§6.0f) | Cutoffs 14000000,170000000000,10¹⁴; p=13,m=1 | 170000000000<10¹⁴ with margin 99830000000000; equality at large cutoffs is finite-range, equality at 10¹⁴ is large-range; p=13,m=1 excluded | Coverage intact | Locator only: p.14→p.13 |
| Exceptional projective images (§6.0g) | A₄,S₄,A₅; p=17,19 | Largest element orders 3,4,5; orders 12,24,60; 19>17 but 17≯17 | Inertia input cannot be replaced by oddness alone | Unchanged |
| Néron torsion specialization (§6.0h) | q=23,e=1; q=2,e=1 | 1<22 true,1<1 false; displayed rational 2-torsion point reduces to [0:1:0] | Boundary counterexample excluded | Unchanged |
| `ImageInNonsplitCartanNormalizer` (§6.1) | p=11, field, scalars,split algebra | Sizes 121,11,121; units 120 for the field; split idempotents multiply to 0; normalizer order 240 versus GL₂ order 13200 | Field and cardinality conditions essential | Unchanged |
| Potential good reduction (§6.2) | p=5, q=2 versus q≡±1 | 2²=4≠1 mod 5; ±1 both square to 1 | Local cyclotomic-square obstruction agrees | Unchanged |
| Exact-divisor differentials (§6.3) | r=5,p=11 | Level 605,exact divisor 121,gcd=1; weight-two normalization 11⁰=1 | Compatible | Unchanged |
| Chen correspondence/isogeny (§6.4) | p=2,5; old level r=1,11 | Permutation dimensions 3+1=1+3 and 15+1=10+6; old dimensions 0,1 | General old-to-old assertion distinct from genus-zero vanishing | Unchanged |
| Five-level winding nonvanishing (§6.5) | q+2q² and q−2q²; D of order 11 | Periods −2,0; upward endpoint −D=10D, boundary of absolute class 0 | Nonzero differential alone is insufficient | Unchanged |
| Rank-zero winding quotient (§6.6) | Zero quotient versus factors of orders 5,7 | Zero cotangent dimension 0; nonzero finite product order 35 | Nonzero optimal quotient is a separate target | Unchanged |
| Cotangent support/immersion (§6.7) | p=11,q=23,f=t+2t² | ω=(11+22t)dt,cusp value 11dt≠0; df gives 1dt instead | Width and lattice reduction agree | Unchanged |
| Cusp formal immersion/torsion (§6.8) | h=7,m=5 | 35u(P)=0; 1<23−1 permits full torsion injection | Descent does not assume A(K) finite | Unchanged |
| Denominator exclusion (§6.9) | p=11 and p=17 | First primes ≡±1 are 23,67; both exceed 13 and avoid every r in {2,3,5,7,13} | Smooth-model hypotheses align | Unchanged |
| `nonsplit_of_not_surjective` (§6.10) | p=37 versus 41 | 37 in non-CM isogeny list,41 absent; GL₂(𝔽₄₁) order 2755200 | Strict p>37 and non-CM remain | Unchanged |
| `lemos_integral_j` (§6.11) | CM j=1728,r=2,p=11; nonintegral 11a j | 1728∈ℤ; −122023936/161051∉ℤ | First satisfies integral conclusion; second cannot satisfy all hypotheses | Unchanged |
| j-numerators (§6.12) | r=2,3,5,7,13; r=11 | Constant terms 4096,729,125,49,13; degrees 3,4,6,8,14; outside value 0 | Formula branches agree | Unchanged |
| Integral parameter criterion (§6.13) | f=(t+16)³,t=8,1/2,0 | f(8)/8=1728; f(1/2)/(1/2)=35937/4∉ℤ; t=0 denominator excluded | Both divisibility and nonzero parameter matter | Unchanged |
| Finite j-sets (§6.14) | Five allowed levels | Signed-divisor counts 26,14,8,6,4; distinct j counts 25,13,8,6,4 | Duplicate values handled | Unchanged |
| Integral modular j-values (§6.15) | r=2,t=8,−16; r=13,t=−1 | 1728,0,576; rescaled parameter u=16 gives wrong 2048 | Coordinate and arithmetic criteria agree | Unchanged |
| Twist invariance (§6.16) | p=5,a=2,quadratic χ | a²=4≠1; det(χρ)=χ²detρ=detρ; full order 480 | p=3 would lack this perfectness witness | Unchanged |
| Finite-j divisibility (§6.17) | j=576,integral curve x³+24x+64 | At q=5,7,11,13,17,19 counts 8,12,15,16,13,21 give traces −2,−4,−3,−2,5,−1 | Traces recomputed | Unchanged |
| Finite-j square-class exclusions (§6.17) | d=−1,2,−2,3,−3,6,−6 with displayed Q_d | Every Legendre value −1; gcds 1,1,2,1,1,1,1, so B_j=6·2=12 | No exceptional p>37 divides this B_j | Unchanged |
| Nonsplit other coset trace (§6.17) | p=5,a=b=1,δ=2 | Matrix [[1,3],[1,4]] has trace 0,determinant 1 | Distinguishes multiplication from conjugate-linear coset | Unchanged |
| `lemos_surjectivity` (§6.18) | n=1 control; n=5,p=41 non-CM case | n>1 rejects identity; p=41 full target order 2755200,normalizer order 3360 | Headline retains all three essential scope conditions | Unchanged |

**Build outcome.** `lake build TauCetiRoadmap.EllipticCurveModularityPartII.Suggested` exited 0; the warnings are the expected admitted headline theorems.

```text
Build completed successfully (9233 jobs).
```

**Dependency direction.** The required movable dependency check exited 0, with no UPWARD, CYCLE or moved line:

```text
depcheck: 47 roadmaps, 537 edges, 0 problem(s)
```

**Gate summary.** The required gate against `origin/main` exited 0 on the committed, clean worktree:

```text
gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
