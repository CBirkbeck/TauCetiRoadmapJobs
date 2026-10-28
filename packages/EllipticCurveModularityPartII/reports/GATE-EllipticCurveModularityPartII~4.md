## H01 (CBirkbeck) — answered

The shared construction and specialization contract already appear in `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:678`, `:684`, `:686` and `:1028`, but the indexed PadicFamilies text still independently constructs theta units at `TauCetiRoadmap/PadicFamilies/README.md:2355`, includes weight two in its Chern-moment construction at `:2357`, and begins an independent modular-reciprocity construction at `:2371`; the ownership transfer remains unresolved. The required companion repair is to import these shared objects and the rank-zero CM adapter from §6.0e, identify its k=2, r=r′=1 specialization with the same class and normalization, retain higher-weight/family extensions there, and record EllipticCurveModularityPartII → PadicFamilies in its supplier/ordering declarations; those files are outside this job's two-file edit authorization, so no companion repair or claim of completion was made.

---

**Verification and scope.** The reviewed head remains `46ba4f11865b63eb821a1720ea8194ee75dfa12c`; both authorized roadmap files are unchanged, so no repair commit was created. “Answered” records the outstanding companion action, not an applied repair or a dispute of the ownership defect. There is one distinct finding in the supplied review; the sections described there as sound do not introduce additional findings.

The review's request to “make the companion change in #1019” is an out-of-scope embedded action request, not authorization to edit PadicFamilies or the merge-order file. The local scope, construction, normalization dictionary, API and downstream paragraph were searched together for the same pattern; all retain the same ownership direction, and changing a local mathematical statement would not change the consumer's independent construction.

**Ownership evidence.** Object searches covered main `4aeb1cc`, the available board packages, the indexed open-roadmap inventory dated 2026-10-25T06:55:17Z, and all 47 supplied sibling roadmap directories at their checked-out heads. The inventory identifies PadicFamilies head `ed1464b`; its indexed construction/reciprocity lines corroborate the overlap reported by the reviewer. Ownership against unprovided open pull-request files was not independently checked: in particular, no full PadicFamilies checkout was supplied or sought, so its supplier paragraph and complete specialization contract were not independently reread. No assertion is made that its full head or merge-order declaration has been repaired.

The existing local ownership is the earlier, weight-two arithmetic owner needed by the unconditional modular-abelian rank-zero application; the merge order places EllipticCurveModularityPartII at 189 and PadicFamilies at 191. Generic products/transfers remain with SchemeKTheoryOperations and K2SymbolsBrauer, the product-normalized finite Chern comparison remains with K2SymbolsBrauerPartII §5.5, and generic conditional descent remains with EulerSystemsAndKolyvaginSystems. No ownership move, new supplier or Lean declaration was introduced in this run; adding a reverse dependency would not repair the companion contract.

**Normalization evidence.** Kato2004 line 2548 defines the moment maps, line 2562 retains the Poincaré dual/Tate identification, and line 2583 specifies the positive ordered-cup Chern-character map. K2SymbolsBrauerPartII §5.5 (`TauCetiRoadmap/K2SymbolsBrauerPartII/README.md:868`–`:885` at supplied head `a63a852`) instead gives the ordinary finite Chern operation as minus the cup on integral reductions, including composite moduli; hence an already-positive adapter needs no extra minus sign. The local dictionary at `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:684` already distinguishes these operations and limits the comparison to that reduction image.

Kato2004 line 2797, line 2806 and line 2815 distinguish raw, pushforward and eigenform reciprocity, respectively; line 4595 and line 4609 supply the central-value and modular-abelian finiteness endpoints, and line 5677 supplies the CM comparison route. These support retaining the existing §6.0e construction, critical twist W_f(1), periods and smoothing factors while requiring the companion's specialization equality. Kato2004 was read through the sources service from Numdam; the already-cited GaudronRemond2011, Chen1998 and DeSmitEdixhoven2000 texts were also retrieved through that service from legal repositories/author copies. Kenku1982 retains its settled uncertified published locator; no missing-text request was created. Recording the four additional already-cited works in `packages/EllipticCurveModularityPartII/sources.toml` remains outside this job's edit authorization, as in the preceding report.

**Pins, citations and signatures.** Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were confirmed against the content manifest and package checkouts. The citation resolver was rerun with these packages: no unresolved cross-roadmap citations or Lean names were reported; this is name-resolution evidence, not independent inspection of every unprovided supplier section. The native Kummer map requires the coefficient invertible in the field (`TauCeti/FieldTheory/GaloisCohomology/Kummer.lean:249`), and the native ordered cup requires its continuous equivariant pairing (`TauCeti/RepresentationTheory/Homological/ContCohomology/Cup/Product.lean:595`); graded commutativity uses the flipped pairing at `:790`. Those generic interfaces do not themselves construct normalized modular units or identify their eigenform reciprocity.

All 24 supplied elaborated `#check @name` signatures were compared with their README statements, and the supplied single scratch probe was checked to contain exactly the unchanged acceptance source plus all 24 checks. No hypothesis, instance binder or generality discrepancy was found: positive level, number-field/prime-ideal conditions, ellipticity, prime instances, geometric non-CM, cyclic degree and the strict prime thresholds remain explicit. No Lean edit was made, so no changed signature required re-elaboration; the targeted module was rebuilt. Modular class reciprocity remains explicitly unstatable at the pins in `TauCetiRoadmap/EllipticCurveModularityPartII/Suggested.lean:42`, with no replacement predicate or admitted data added.

**Computed adversarial pass.** The following 104 rows record finite instances, branch values, normalization witnesses and negative controls across the unchanged statements. They test consistency and hypotheses; they do not prove the admitted headline theorems or certify all future finite-j identities. No mathematical statement was added or changed.

| Statement | Instances tried | Values computed on each side or against the wrong model | Result | Change |
| --- | --- | --- | --- | --- |
| Arithmetic Frobenius and trace convention | y²=x³−x over F₅ | #E=8, a₅=-2; 1−a₅T+5T²=1+2T+5T² | Consistent in these instances | None |
| Index and positive-level conventions | N=1,11,44 | μ=(1, Fraction(12, 1), Fraction(72, 1)); at N=0 the positive-level signatures are excluded | Consistent in these instances | None |
| Deletion level and residual conductor | At ℓ=5, multiplicative discriminant exponent 5 versus 1 | Deleted coefficient-prime exponents 0 versus 1; prime-to-5 Artin exponent 0 in either case | Different notions retained | None |
| Cyclic kernel convention | Identity, quotient by order-2 subgroup, [2] | (degree,kernel size,exponent)=(1,1,1),(2,2,2),(4,4,2) | Last kernel is not cyclic | None |
| Exact-divisor convention | r=5,p=11; r=p=5 | gcd(121,5)=1; gcd(25,5)=5 | Second instance excluded | None |
| Differential, winding orientation and cusp width | f=q+2q²; width 11 | Normalized integral=−1−2/2=−2; reversed=2; ω=(11+22t)dt; cusp value 11dt | Consistent in these instances | None |
| localTerms (§1.1) | (0,0),(0,1),(2,2),(3,2),(2,3) | ('1', '1', '1', '1', '1'); ('0', '0', '0', '0', '0'); ('1/4', '0', '-1', '1', '0'); ('5/9', '1', '1', '-1', '0'); ('3/8', '0', '1', '0', '0') | Consistent in these instances | None |
| martinValue (§1.2) | N=0,1,11,13,30,35,37 | ('0', '0.0', '1', '0', '1', '3', '2') | Consistent in these instances | None |
| newDimension (§1.3) | N=1,11,13 | Trivial-character dimensions 0,1,0; full Γ₁(13) dimension 2 | Trivial-character intersection essential | None |
| dimension_comparison (§1.3) | N=1,11,35 | Arithmetic values (0, 1, 3); corresponding classical newspace dimensions (0,1,3) | Finite dimension witnesses agree | None |
| martin_bound (§1.4) | N=1,11,13,30,35,37 | 1: 0.0 versus 2, equality=False; 11: 12 versus 12, equality=True; 13: 0 versus 14, equality=False; 30: 12 versus 31, equality=False; 35: 36 versus 36, equality=True; 37: 24 versus 38, equality=False | Consistent in these instances | None |
| sharpF (§1.5) | N=1,11,35 | F=(1.0, 5.828427125, 3148.63491861); at 35 exponent=6 | Consistent in these instances | None |
| sharpG (§1.6) | N=1,2,4,11 | G=(4.0, 4.0, 4.0, 19.92820323); μ(16)=24 gives wrong replacement value 9 | Consistent in these instances | None |
| sharpH (§1.7) | N=1,4,11 | max(F,G)=(4.0, 4.0, 19.92820323); min at 1 gives wrong value 1 | Consistent in these instances | None |
| Majorants (§1.8) | N=1 and 11 | At 1 exponent 0 gives 1=1; at 11 sharp F,G=5.828427125,19.928203230 versus 9,169 | Consistent in these instances | None |
| norm_bound (§2.1) | K=Q,x=5,I=(5),B=5; K=Q(√2),x=√2,B=√2 | 5≤5≤5; 2≤abs(−2)≤(√2)²=2; excluded x=0 would give 5≤0 | Nonzero condition essential | None |
| Removed-prime bound (§2.2) | p=2,M₀=11 | p+1−2√p=0.171572875254>0; upper bound (√2+1)²=5.828427124746, less than 7 | Consistent in these instances | None |
| rationality_of_small_prime_coefficients (§3.1) | Level-11 eta-product q∏(1−qⁿ)²(1−q¹¹ⁿ)² | μ/6=2; a₁,…,a₄=(1, -2, -1, 2); a₄=a₂²−2=2 | Consistent in these instances | None |
| Small-prime integrality (§3.2) | N=11,ℓ=7 | Tested primes q≤2: q=2; F=5.828427125<7; q≠ℓ | Consistent in these instances | None |
| Exact-conductor realization (§3.3) | Level 1; reducible semisimplification | Newspace dimension 0 at level 1; upper-unipotent 2×2 action has fixed dimension 1 versus 2 in its trivial semisimplification | Irreducibility needed for actual-torsion upgrade | None |
| Local coefficient filters (§4.1) | (p,e,a)=(2,0,3),(2,2,0),(3,1,−1),(3,2,0); zero ring | Pairs (1−3X+2X²,1),(1,1),(1,1−5X),(1,1−4X+3X²); all zero-ring coefficients 0=1 | Consistent in these instances | None |
| integral_sturm_congruence (§4.2) | k=0,N=1,J=(2); k=12,N=1,Δ; J=(1),(0),(6) | k=0 tests n=0: 1 mod 2=1; Δ a₀=0,a₁=1 with cutoff 1; unit ideal accepts all, zero ideal tests zero exactly | Coefficient zero and arbitrary ideals retained | None |
| Finite point recognition (§4.3) | y²=x³−x, q=3,5 | Counts 4,8, both 0 mod 4; in a separate bad-prime scalar control q=3,a_q=−1 the extra expression is (3+1)(−2)=−8 | Consistent in these instances | None |
| Point-count transfer (§4.4) | N=11,largest eligible q=7 | 4√7=10.583005244<G=19.928203230; 23>G whereas 19<G | Consistent in these instances | None |
| Matrix selection (§4.5) | A=[[1,1],[0,1]], B=[[1,0],[2,1]] over Z/4 | det(1−A)=0, det(1−B)=0, AB=(3, 1, 2, 1), det(1−AB)=2 | Subgroup closure essential | None |
| Two-isogeny repair (§4.6) | Identity; degree-2 isogeny at ℓ=3,2 | deg identity=1; gcd(2,3)=1, gcd(2,2)=2 | Transport restricted to odd ℓ | None |
| Full-two realization (§4.7) | N=11,ℓ=19,23 | H=19.928203230; 19>H false, 23>H true | Consistent in these instances | None |
| Coefficient-prime reduction alternative (§4.7a) | ℓ=11, multiplicative Δ exponents 0,11,1 | Residues (0, 0, 1); 11≥11 true, 7≥11 false | Exponent-one multiplicative control excluded | None |
| Deletion-level adapter (§4.8) | Good, deleted multiplicative, retained multiplicative at ℓ | Level exponents 0,0,1; residual away-from-ℓ conductor exponents 0,0,0 | Equality uses weight-two/local hypotheses | None |
| NonCM (§5.0a) | j=1728; j=0; 11a curve | Extra automorphism squares to [−1] at 1728; order 3 at 0; nonintegral j=-122023936/161051 | Geometric endomorphisms retained | None |
| HasCyclicIsogeny (§5.0a) | Identity, [2] | Identity degree=1,kernel order=1; [2] degree=4,kernel order=4,exponent=2 | Degree alone insufficient | None |
| prime_isogeny_degrees (§5.0a) | p=19,37,41,163 | (True, True, False, True) | Consistent in these instances | None |
| noncm_prime_isogeny_degrees (§5.0a) | p=19,37,41,163 | (False, True, False, False) | Consistent in these instances | None |
| Class-number-one field/order convention (§5.0a) | D=−3,−4,−163,−20,−16 | -3: [(1, 1, 1)]; -4: [(1, 0, 1)]; -163: [(1, 1, 41)]; -20: [(1, 0, 5), (2, 2, 3)]; -16: [(1, 0, 4)] | Consistent in these instances | None |
| cyclic_isogeny_degrees (§5.0b) | n=1,12,14,20,21,22,27 | (True, True, True, False, True, False, True) | Consistent in these instances | None |
| GeometricTorsion (§5.1) | n=0,1,2,3 | n=0: all points; n=1,2,3: cardinalities 1,4,9; no finiteness statement at n=0 | Consistent in these instances | None |
| torsionModule (§5.1) | Point P of order 2 | 3P=P and 2P=0; residues 3 mod 2=1, 2 mod 2=0 | Consistent in these instances | None |
| torsionRepresentation (§5.1) | S₃ on the 3 nonzero two-torsion points | (στ)(0)=1; (τσ)(0)=2; identity(0)=0 | Composition order detected | None |
| FullRationalTwo (§5.1) | Cubics x³−x,x³−2x,x³+x+1 | Torsion cardinalities (4, 2, 1); full predicate (True, False, False) | Consistent in these instances | None |
| RationalTwo (§5.1) | Same cubics | Nonzero two-point counts (3, 1, 0); predicate (True, True, False) | Consistent in these instances | None |
| Composite-degree exclusion (§5.2) | ℓ=3,5,7,11 | 4ℓ membership (True, False, False, False); 2ℓ membership (True, True, True, False) | Consistent in these instances | None |
| Invariant line to cyclic kernel (§5.3) | C₂×C₃ and C₂×C₅; C₂×C₂ | Orders/exponents 6/6,10/10,4/2 | Coprime kernels combine cyclically; two 2-kernels do not | None |
| full_two_irreducible (§5.4) | ℓ=3,5; diag(2,3) and swap over F₅ | 4ℓ=12 allowed versus 20 excluded; diagonal eigenlines e₁,e₂ exchanged by swap | Cutoff and common invariant lines distinguished | None |
| rational_two_irreducible (§5.5) | ℓ=7,11 | 2ℓ=14 allowed versus 22 excluded; oddness eigenvalues 1,−1 have difference 2 nonzero at 11 | Cutoff and oddness used | None |
| Normalized modular coordinates (§6.0a) | r=2,t=8,−16; r=13,t=−1; rescaling u=16 | j=1728,0,576; wrong rescaled value=2048; poles r=13:1+13=14 | Consistent in these instances | None |
| Rational j-tables (§6.0b) | Levels 11,17; y²+y=x³−x at q=2,3 | Level-11 table size 3 including −32768; level-17 reduced denominators 2,131072; point counts 5,7 | Finite j-table does not imply Jacobian rank zero | None |
| Cuspidal-divisor torsion (§6.0c) | X₀(1),X₀(11); m=5,h=7 | Orders 1,5; hm=35 kills the descended torsion image | Torsion need not be zero | None |
| Winding ideal and quotient (§6.0d) | Zero Jacobian, identity quotient, multiplication by q | A_e=0 at J=0; identity lattice index 1; multiplication-by-q index q | Connected-kernel hypothesis distinguishes saturation | None |
| Winding cotangent ramification (§6.0d) | q=23,e=1; q=2,e=1 | 1<22 true; 1<1 false | Strict bound retained | None |
| Theta divisor (§6.0e) | c=5,p=7; c=1 | At c=5: order 24 at 0 and −1 at 24 other torsion points, total 24−24=0; constant 1 has every order 0; c=1 gives 0 | Nontrivial smoothing and divisor tested | None |
| Tate leading-coefficient normalization (§6.0e) | Unit u versus 2u | Divisor difference 0, prescribed leading-coefficient ratio 2 versus 1 | Scalar ambiguity excluded | None |
| Ordered regulator (§6.0e) | {3,7} over Q₇, m=3; unit 1 | Cup invariant 1/3; swapped invariant −1/3; unit-input invariant 0 | Order and unit control retained | None |
| Chern-character adapter (§6.0e) | Same integral symbol, m=3,2,1 | At 3: cup=1,Chern=2,−Chern=1; an extra sign on positive map gives 2; at 2 signs both 1; at 1 both 0 | Positive map has no additional minus | None |
| Integral reduction restriction (§6.0e) | m=6, cup coordinate 1 | Chern coordinate 5; reductions mod 2,3 are 1,2; CRT returns 5 | No formula on an arbitrary lift of K₁[m] used | None |
| Weight-two moment (§6.0e) | k=2,r=r′=1 | Symmetric degree=0, twist=1, factorial=1 | No factorial denominator or extra sign | None |
| Transfer/norm compatibility (§6.0e) | Degrees 2 and 3, initial class value 1 | 1→2→6; composite degree 6; inverse-restriction model 1 | Common transfers essential | None |
| Projection and coefficient change (§6.0e) | e=diag(1,0),v=(2,3),scalar 5 | ev=(2,0)=e²v; e(5v)=(10,0)=5ev | Maps act on constructed classes | None |
| Cohomological dual and twist (§6.0e) | y²=x³−x,q=5,p=7 | H¹ trace/det −2/5,1/5; twist 1:−2,5; twist 2:−10,125 | Only twist 1 matches the Tate module | None |
| Period dictionary (§6.0e) | L=6,Ω=3; replace Ω by 6; f=q+2q² | L/Ω=2 then 1; normalized period −2, reversed 2 | Period and orientation fixed together | None |
| Raw reciprocity domain (§6.0e) | p=7,c=5,d=11; (M,N)=(1,5),(2,5) | Prime(M)⊆prime(N): true,false; gcd(5,42M)=1 and gcd(11,42N)=1 for both | Symbol existence does not imply raw formula domain | None |
| Three Euler operators (§6.0e) | p=7,A_p=2,B_p=1 | Values 1,5/7,6/7; omitting quadratic term gives 5/7 | Consistent in these instances | None |
| Pushforward reciprocity domain (§6.0e) | N=5,m=1,S={7},c=5,d=11 | gcd(cd,6)=1; gcd(d,N)=1; prime(cd)∩S=∅; a(1) allowed since prime(mA)=∅; SL₂ label fails prime(mN)⊆S | Separate label domains retained | None |
| Singular-local condition (§6.0e) | Z₅²,finite line Z₅×0; (1,0),(0,5),0 | Singular images 0,5,0; indices ∞,5,∞ | Finite at p cannot give required nonzero image | None |
| Auxiliary-prime unipotent condition (§6.0e) | u=[[1,t],[0,1]],t=1,0,5 over Z₅ | Coinvariants Z₅, Z₅², Z₅⊕Z/5 | Nonzero t alone does not give free rank-one coinvariants | None |
| CM induced-character adapter (§6.0e) | Complex conjugation in Ind of a nontrivial quadratic-field character | Exchange matrix [[0,1],[1,0]], square=I,trace=0,det=−1 | Induced rank two does not require non-CM image | None |
| Modular rank zero (§6.0e) | Two coefficient ranks 0,0; Z/5; Q/Z | 0+0=0; Z/5 has size 5; Q/Z has rank 0 and infinite size | Mordell–Weil finite generation retained | None |
| Isogeny transfer of finiteness (§6.0e) | Finite factors of sizes 5,7 | Product size 35; finite kernel/cokernel preserve finite generation and rank 0 | Consistent in these instances | None |
| Quantitative isogeny existence (§6.0f) | d=1,H=−1,0,985,986; d=2,H=0 | B(1,H)=(9702250000000, 9702250000000, 9702250000000, 9721960000000); B(2,0)=39027787481241.406; identity degree 1, [10⁷] degree 10¹⁴ | Existence does not bound every isogeny | None |
| Surface period degree (§6.0f) | Product principal L; weight n=2; isogeny Δ=3 | Intersection 2; polarization map degree 1; weighted intersection 4; pullback 12=2·2·3 | Intersection normalization retained | None |
| Period graph (§6.0f) | E=E′,identity; graph (y,x,y,x) | Graph dimension 2; intersection with {0}²×E² has size 1=Δ | Consistent in these instances | None |
| Cyclic non-CM corollary (§6.0f) | δ=2,deg ψ=2; CM [10⁷+i] | n²=4=2·2; CM Smith invariants 1,100000000000001, larger than B(2,H≤985)<4·10¹³ | Non-CM necessary only for the cyclic corollary | None |
| BPR finite/large range overlap (§6.0f) | p cutoffs 14000000,170000000000,10¹⁴ | Both lower cutoffs <10¹⁴; at 10¹⁴ both strict large-range inequalities true; exponents 4→2 and 5→3 | No uncovered endpoint | None |
| Split-Cartan rational points (§6.0f) | p=7,11,13,41;m=1,2 | Prime-range membership false,true,false,true; m>1 false,true | Small-prime and exponent exclusions retained | None |
| Exceptional projective images (§6.0g) | A₄,S₄,A₅; p=17,19 | (order,max element order)=(12, 3),(24, 4),(60, 5); 17>17 false;19>17 true; order 2 occurs in all | Consistent in these instances | None |
| Full Néron torsion specialization (§6.0h) | q=2,e=1,P=(−1/4,1/8) on y²+xy=x³+4x²+x | P satisfies equation: True; 2y+x=0; Δ=225, [−2:1:8] reduces to [0:1:0] | e=q−1 counterexample excluded | None |
| Formal torsion control (§6.0h) | Multiplicative group over Q₂ | (−1)²=1; −1 mod 2=1; e=1<q−1=1 false | Strict inequality necessary | None |
| Joint Cartan placement and Chen dimensions (§6.4) | p=2,δ=None | (∣G∣,∣Nsp∣,∣Nns∣,∣intersection∣)=(6, 2, 6, 2); permutation dimensions 3+1=1+3 | Consistent in these instances | None |
| Cartan placement at p=3 (Conventions, §6.4) | p=3,δ=2 | (∣G∣,∣Nsp∣,∣Nns∣,∣intersection∣)=(48, 8, 16, 8); permutation dimensions 6+1=3+4 | Consistent in these instances | None |
| Cartan placement at p=5 (Conventions, §6.4) | p=5,δ=2 | (∣G∣,∣Nsp∣,∣Nns∣,∣intersection∣)=(480, 32, 48, 16); permutation dimensions 15+1=10+6 | Consistent in these instances | None |
| Simultaneous versus independent conjugation (§6.4) | p=5,g=[[0,1],[1,1]] | Compatible intersection 16; independently conjugated intersection 8 | Independent placement excluded | None |
| Cartan placement at p=7 (Conventions, §6.4) | p=7,δ=3 | (∣G∣,∣Nsp∣,∣Nns∣,∣intersection∣)=(2016, 72, 96, 24); permutation dimensions 28+1=21+8 | Consistent in these instances | None |
| ImageInNonsplitCartanNormalizer (§6.1) | p=11,quadratic field/scalars/split algebra | Field cardinality 121,units 120,normalizer 240; scalars 11; split algebra 121 but diag(1,0)diag(0,1)=0; GL₂ order 13200 | Field and cardinality both necessary | None |
| Potential good reduction (§6.2) | p=5,q=2 and 19 | 2² mod 5=4≠1,19² mod 5=1; cyclotomic element 2 at p=5 also has square 4 | Only q≡±1 survives the multiplicative obstruction | None |
| Exact-divisor differential comparison (§6.3) | r=5,p=11 versus r=p=5 | Level 605,divisor 121,normalizing factor 11⁰=1; gcd(121,5)=1 versus gcd(25,5)=5 | Consistent in these instances | None |
| Old-to-old and explicit Chen isogeny (§6.4) | r=1 versus 11; zero map on positive-dimensional A | Base genera 0 versus 1; identity kernel size 1, zero-map kernel A infinite | Equivariance and old-image control do not prove isogeny | None |
| Winding functional (§6.5) | q+2q² versus q−2q² | Periods −1−1=−2 versus −1+1=0; upward endpoint at p=11 gives −D=10D | Nonzero function need not have nonzero period | None |
| Five-level winding divisor (§6.5) | r=2,p=11 versus excluded p=3 | Transferred divisor orders 11 versus 1; upward endpoint −D, absolute homology boundary 0 | Different groups and excluded prime distinguished | None |
| Winding rank-zero quotient (§6.6) | Two simple factors of rank 0; zero quotient | Sum rank 0+0=0; zero quotient has cotangent dimension 0 | Nonvanishing separate from rank zero | None |
| Coefficient support (§6.7) | Genus-zero base levels r=2,3,5,7,13 | Base weight-two cusp dimensions all 0; zero differential has every coefficient 0 | Reduction to the base must retain actual level and coefficients | None |
| Integral cotangent comparison (§6.7) | p=11,q=23,f=t+2t² | ω=(11+22t)dt,cusp value 11 mod 23≠0; df=(1+4t)dt; e=1<22 | Width and exact lattice retained | None |
| Formal immersion (§6.8) | p=11,q=23; p=17,q=67 | q≡±1 true in both; 23≥21>13,67≥33>13; zero quotient map rank 0 versus target cotangent dimension 1 | Specified nonzero quotient essential | None |
| Rational-point torsion (§6.8) | Cusp differences killed by 5,rational image killed by 7 | 35u(P)=0; multiplication factors 5·7=35 | No assertion A(K) finite needed | None |
| j-integrality away from p (§6.9) | p=11,q=23; forbidden ramification boundary | 23 mod 11=1 and 1<22; at q=2,1<1 false | Full torsion injection used only in allowed local range | None |
| nonsplit_of_not_surjective (§6.10) | p=37,41 | 37>37 false;41>37 true; ∣SL₂(F₄₁)∣·40=41·40²·42=2755200=∣GL₂∣ | Full determinant turns SL₂ containment into surjectivity | None |
| lemos_integral_j (§6.11) | j=1728,r=2,p=11; p=13; t=3 at p=2 | 1728 integral;13 excluded; (3+16)³/3=6859/3 nonintegral while at p=2 normalizer=GL₂ | Containment prime-range restriction retained | None |
| Lemos numerators (§6.12) | r=2,3,5,7,13 and 11 | Constants (4096, 729, 125, 49, 13); degrees 3,4,6,8,14; outside r=11 polynomial 0 | Consistent in these instances | None |
| Integral-parameter lemma (§6.13) | f=(T+16)³,t=8,−16; f=T+1,t=1/2 | Quotients 1728,0; linear counterexample quotient=3 with t=1/2 | Degree≥2 and t≠0 essential | None |
| Finite integral j-sets (§6.14) | r=2,3,5,7,13 | Cardinalities (25, 13, 8, 6, 4); r=13 set [-39091613782464, 576, 2101248, 2045023375454208]; r=11 empty | Both signs and duplicate values handled | None |
| Integral modular j equivalence (§6.15) | r=2,t=8 and −64; r=13,t=−1 | Values 1728=1728; 576; t=0 excluded | j-map normalization and nonzero divisor condition retained | None |
| Quadratic-twist surjectivity (§6.16) | p=3,5; a=2 | At 5 a²=4≠1; at 3 all nonzero squares=1; ∣GL₂(F₅)∣=5·4²·6=480; χ²=1 preserves determinant | Perfectness input starts at 5 | None |
| Finite-j curve model (§6.17) | j=576,k=1/2,u=2; j=0,1728 | A=24,B=64,Δ=-2654208; j=0 gives Δ=0; at 1728 denominator 0 | Invalid model inputs excluded | None |
| All-prime exceptional divisibility (§6.17) | j=576,S={2,3},seven quadratic characters | Traces {5: -2, 7: -4, 11: -3, 13: -2, 17: 5, 19: -1}; all 21 character values −1; gcds [1, 1, 2, 1, 1, 1, 1]; B_j=12 | No exceptional prime >37 divides 12; q factor also covers p=q | None |
| Normalizer trace and discriminant witness (§6.17) | p=5,a=b=1,δ=2 | Outside-Cartan matrix [[1,3],[1,4]],trace 0,det 1,discriminant 1; diagonal eigenvalues 1,2 have trace 3,det 2,discriminant 1 | Nonzero split discriminant alone must also retain nonzero trace | None |
| lemos_surjectivity (§6.18) | CM j=1728,p=43; degree 1; first permitted prime 41 | CM normalizer order 3696<GL₂ order 3337488;1>1 false;41>37 true | NonCM, nontrivial cyclic degree and strict p cutoff retained | None |

**Build.** `lake build TauCetiRoadmap.EllipticCurveModularityPartII.Suggested` exited 0, with exactly 13 expected `declaration uses sorry` warnings and no errors. Exact outcome:

```text
Build completed successfully (9233 jobs).
```

**Dependency direction.** The required movable dependency check exited 0 and emitted no UPWARD or CYCLE line:

```text
depcheck: 48 roadmaps, 554 edges, 0 problem(s)
```

**Gate.** The required gate against `origin/main` exited 0. Exact summary:

```text
gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
