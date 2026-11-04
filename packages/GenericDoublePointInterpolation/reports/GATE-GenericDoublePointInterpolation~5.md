## H01 (CBirkbeck) — answered

ArithmeticStatisticsPartV §3.28 still assigns the complete interpolation theorem and ordinary/differential Horace development to its internal target (`TauCetiRoadmap/ArithmeticStatisticsPartV/README.md:1825–1836`, head `7f06cfc7da76cea84857868e92c0188862d57f95`), so the ownership conflict remains unresolved. `TauCetiRoadmap/GenericDoublePointInterpolation/README.md:50–55,1647–1664` already supplies the full nonexceptional characteristic-zero d≥2 contract with R=r+1 and the §1.4 adapter; the required repair is to replace the companion's internal interpolation programme and local supplier entry with that import, retaining its Jacobian, exception exclusion and finite-fibre arguments, but the companion is outside this job's permitted edits.

## H02 (CBirkbeck) — answered

The whole-roadmap prerequisite is real: `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:708–722` at `0b8495415c7a9102f90b1e2cb9993c40dc619f93` consumes GroebnerGeometry G2/G4, and its PR description explicitly requires GroebnerGeometry, whose open head is `163d43c3ec909a6ff5112e6b05359223cc677112`. The dependency paragraph and merge-order block of PR #1472 must include GroebnerGeometry before AlgebraicModuliForArithmeticGeometry and remove the unrestricted no-other-author claim; PR text is excluded from this job's edits, so this correction also remains unapplied, while the README's exact section contracts need no change.

## Scope, ownership and citations

No README or Lean statement changed; no commit was made. Neither answered finding is claimed resolved, and the successful local gates do not reconcile the companion specification or certify the PR description's transitive assertion.

Read the repository README and CONTRIBUTING, and the main-branch AlgebraicVectorBundles and completed EffectiveBounds roadmaps. Searched roadmap objects through the indexed main/open-head catalogue and the board packages, including Alexander–Hirschowitz, Horace, first jets, curvilinear schemes and Veronese maps; the explicit duplicate relevant to H01 is ArithmeticStatisticsPartV §3.28. This roadmap's proposed ownership is the reusable complete interpolation library, while the consumer keeps its arithmetic application; achieving single ownership still requires the companion edit. No ownership moved, new construction was introduced, or fully qualified declaration name was borrowed.

The indexed catalogue has 365 open roadmap PRs (2026-10-25T16:46:16Z); its target, companion, moduli and Groebner heads agree with the independently read PR metadata. Cross-roadmap resolution reported no missing roadmap citation or Lean name; its warning that external library names were not checked was supplemented by direct inspection of the actual pinned package copies. Main-branch supplier inspection used the content checkout whose HEAD and origin/main are both `a8132fb235144b25aba003881cc74e35d7d15f36`, rather than treating the catalogue's earlier main snapshot `bbed953` as that checkout.

The supplier contracts were compared with AlgebraicVectorBundles §L0B; DiophantineApproximationAndTranscendence §2.7, including both bounded/homogeneous inverse identities; SchemeAndStackFoundations §§0.28, 2.6, 4.12 and 5.12; and AlgebraicModuliForArithmeticGeometry §§1.1–1.2, 1.7 and 2.1. The supplied quotient convention, chart comparison, determinantal base change, proper flat Hilbert families and finite locally free subfunctor have the stated meanings. No later roadmap was added as a supplier.

The library checkout hashes equal the manifest pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Mathlib's native bounded carrier is defined by support exponent sum ≤d (`Mathlib/RingTheory/MvPolynomial/Basic.lean:164–165`), and its support basis is at line 95; this is a total-degree bound, with no distinctness condition. The Euler identity is `MvPolynomial.IsHomogeneous.sum_X_mul_pderiv` (`Mathlib/RingTheory/MvPolynomial/EulerIdentity.lean:73`); the product-grid theorem needs coordinate degree strictly less than the grid cardinality (`Mathlib/Combinatorics/Nullstellensatz.lean:62–66`). The absolute smooth-locus theorem requires a reduced source over a perfect field and local finite presentation (`Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:361–363`), and does not supply relative generic smoothness. Tau Ceti's tangent carrier is the residue-field dual of the local cotangent space (`TauCeti/AlgebraicGeometry/TangentSpace/Basic.lean:65–67`), so it alone does not give the geometric-point differential. Searches of both pinned trees for Alexander–Hirschowitz, Horace and double-point interpolation returned no matches; this is search evidence, not a completeness proof.

BO line 22, Theorem 1.1, pp.1–2, gives the full characteristic-zero theorem and the exception list; substituting projective dimension R−1 gives exactly the downstream exceptions. BO line 765, Lemma 6.3, and BO line 798, Theorem 6.4, give the signed division data and three predecessor statements; BO line 960 supplies the final quartic schedule. COU line 182 identifies homogeneous sections with bounded polynomials, COU line 191 identifies the jet restriction, and COU line 242 gives the minor and inclusive integer box. VAK line 14724 fixes smoothness, VAK line 23876 and VAK line 23946 identify diagonal conormals with differentials, and VAK line 28564 states source generic smoothness. ST was legally fetched under its existing cited key: ST line 8610, Lemma 10.78.2 (00NX), gives the finite-projective/finite-locally-free equivalence. No source passage was copied, no source was unavailable, and no source manifest was edited.

## Elaborated signatures

Compared all 29 supplied elaborated `#check @name` types with their README contracts and the unchanged Lean declarations. Field versus commutative-ring assumptions, characteristic zero, injectivity, dimension/degree bounds, all exceptional exclusions, the prescribed quotient map, finite-subspace incidence and transversality conditions, and the nonzero pullback and individual degree hypotheses agree; zero section binders were lost and no signatures changed. The file still has only `import Mathlib`, real-bodied supporting definitions, and admitted headline theorems; the docstring identifies the projective-section and relative-incidence carriers missing at the pins.

## Adversarial mathematics pass

Each row records computed instances, not a proof of the general target. “Agrees” means these instances give no counterexample and require no edit. The 22 finite rank witnesses were recomputed modulo 101 using integer support vectors and subspace frames; the seven subspace tests also verified nonzero pairwise nonproportional supports, the required on/off incidences, full pairwise sums, triple intersection zero where required, and the transverse remainder. Full column ranks lift to characteristic zero; sample containment evaluations are necessary conditions, without being asserted to be a basis for an ideal.

| Statement or convention | Instances and computed values on both sides | Result; change |
| --- | --- | --- |
| Universe and coefficient conventions | Fin 0 has 0 elements; its exponent function set has 1 element; zero-ring coefficient module has 1 element and 0 vector | Agrees; none |
| `Bounded`; dimension of bounded polynomials | (r,d)=(0,2),(2,0),(2,2): monomial counts 1,1,6 = choose(2,2), choose(2,0), choose(4,2) | Agrees; none |
| `Monomials`; binomial count and slack map | r=d=2: 6 exponents, slack 2,1,1,0,0,0; coordinatewise bounds instead give 9 | Agrees; none |
| `monomialsFintype` | r=0,d=2: 1 exponent; r=1,d=3: 4; r=2,d=2: 6, each coordinate ≤2 | Agrees; none |
| Coefficient coordinates | 2+3x² at d=3 ↔ (2,0,3,0); reconstruction 2+0x+3x²+0x³=2+3x² | Agrees; none |
| Fixed homogenization | H₂(1+x)=X₀²+X₀X₁; setting X₀=1 gives 1+x; H₁(1)H₁(x)=X₀X₁=H₂(x) | Agrees; none |
| Forms and twisting sections | In degree 2 on P¹, section exponents (2,0),(1,1),(0,2) restrict to 1,x,x²; 3=choose(3,2) | Agrees; none |
| Coefficient Gram form | G(x,y)=0; G(x,x)=1; G(2+x,2+x)=4+1=5; zero polynomial has 0 | Agrees; none |
| `JetRows`; row convention | n=2,r=2: 2·3=6 rows; n=0: 0; r=0,n=1: 1 value row | Agrees; none |
| `jetAlgebra` | At 0, x↦(0,1), x²↦(0,0), c↦(c,0); at 3, x²↦(9,6); over F₂, x² at 1↦(1,0) | Agrees; none |
| Kernel of one jet | At 0 in k[x], 1,x have images (1,0),(0,1), while x² maps to 0; kernel (x²), quotient dimension 2 | Agrees; none |
| Distinct point ideals and powers | Over Q, x−(x−1)=1; over Z at 0,2 the ideal sum is (x,2), with 1↦1 mod 2 | Agrees; field hypothesis retained |
| `doubleIdeal` | One origin gives (x²); no supports gives top and quotient dimension 0; repeated origin still gives (x²), not (x⁴) | Agrees; none |
| `doublePointQuotient` | P=(0,1): x(x−1) has jets (0,−1),(0,1), nonzero class with square 0; both quotient and product have dimension 4 | Agrees; none |
| Length of distinct doubles | r=2,n=1: basis 1,x,y has length 3=1·3; n=0: 0=0·3 | Agrees; none |
| `firstJetMap` | At origin in A², d=1, columns 1,x,y form I₃; at d=0 rank 1<3; x² at 3 gives (9,6) | Agrees; none |
| Value projection | Values of x at 0,1 are (0,1); at no supports the target dimension is 0 and kernel dimension d+1 | Agrees; none |
| Derivatives on value kernel | At 0, x↦1 and x²↦0; for constants at one support the kernel has dimension 0 | Agrees; none |
| Surjectivity through value kernel, both directions | At one origin,d=1: value rank 1, derivative-on-kernel rank r, total r+1; at d=0: ranks 1,0,total 1<r+1 for r>0 | Agrees; none |
| `firstJetMatrix` | At r=n=d=1,P=0: I₂; at d=0 column (1,0); r=n=d=2 gives 6×6 | Agrees; none |
| Full row rank criterion, both directions | One origin,d=1: rank 3=target dimension 3, onto; d=0: rank 1≠3, not onto; n=0: 0=0, onto | Agrees; none |
| `WellPoised` | One point,d=1: true by I₃; one A² point,d=0: false by rank 1<3; seven collinear points,d=5: false by 11<21 | Agrees; none |
| Projective restriction and chart trivialization | Degree-2 monomials X₀²,X₀X₁,X₁² restrict to 1,x,x²; jets at x=0 are (1,0),(0,1),(0,0) on both sides | Agrees; none |
| Homogeneous-partial adapter and Euler sign | F=X₀²+X₀X₁ at x=2: (3,1)↦(4,1), det 2; F=X₀X₁ gives 2·2−2·1=2, while the wrong sign gives 6 | Agrees; none |
| Adapter degeneracies | d=0,F=1: affine value 1, all homogeneous partials 0; F=X₀² in characteristic 2 gives 1 versus 0; plane distinct/repeated pairs have ranks 5/3 in both valid characteristic-zero models | Agrees; hypotheses necessary |
| Finite locally free pushforward | B=k×k,M=B gives dimension 2; after A=k[ε]/ε² then A→k, A²⊗k=k² has dimension 2; empty source gives rank 0 | Agrees; none |
| Relative generic smoothness | A²→A¹ projection: Jacobian rank 1, kernel 1=2−1; x↦x² over Q: ranks 1 off 0, 0 at 0; over F₂ rank 0 everywhere | Agrees; none |
| Geometric tangent convention | Generic point of A¹_k has local cotangent dimension 0; associated Ω-point on A¹_Ω has dimension 1; dual numbers have tangent dimension 1 and scheme dimension 0 | Agrees; none |
| Restriction rank | Simple point,d=0: 1=1−0; zero subsystem: 0=0−0; one double,d=1: r+1=(r+1)−0 | Agrees; none |
| Disjoint-rank identity | Constants on two reduced points: total 1 = rank at second 1 + rank of remaining zero kernel 0; linear polynomials on A¹: 2=1+1 | Agrees; none |
| Cartier residual sequence | I=(t,x) in k[t,x], flat adjoining y: colon ideal B, trace (x); multiplication t has image (t), quotient trace (x) | Agrees; none |
| Flatness restriction and nonflat negative control | For B=k[t], I⊗B=B⊕B/(t), whereas IB=(t)≅B; trace pullback is k, new trace ideal is 0 | Agrees; nonflat assertion excluded |
| Finite residual/trace lengths | Double origin in A³: 4=1+3; transverse (x,y,z²): 2=1+1; tangent (y,z,x²): 2=0+2; empty: 0=0+0 | Agrees; none |
| Castelnuovo rank bound | A² double origin,d=1,H=(y): rank 3≥residual rank 1+trace rank 2=3; empty 0≥0+0 | Agrees; none |
| Ordinary Horace matching inequalities | Quartic P⁷ q=41: 210≤210 and 118≤120, sum 328; q=42: 210≥210 and 126≥120, rank 210+120=330 | Agrees; none |
| Independent subschemes | I₃ first jets at an A² origin remain onto a length-2 quotient, rank 2; degree-1 injectivity on full double remains rank 3 after adding conditions | Agrees; none |
| One-support curvilinear criterion, both directions | Full span {1,x,y} has ranks 3 and 2 on every direction; span {1,x} has rank 2<3 and rank 1<2 on the y-direction | Agrees; none |
| Curvilinear reduction, both directions | Two A¹ double points at 0,1: d=3 rank 4=length 4; d=2 rank 3<4 and that same length-4 curvilinear union detects failure | Agrees; none |
| Universal direction family | dx↦1,dy↦0 gives (y,x²); dx,dy↦1 gives (y−x,x²); both length 2; Spec k gives no directions; A¹ gives one | Agrees; none |
| Direction base change and multiplication | Over k[δ]/δ² the module basis is 1,ε, rank 2; ε²=0, while the nonzero idempotent (1,0) in k×k has square itself | Agrees; none |
| Rank openness | Matrix [t]: generic rank 1, special rank 0; rank≥1 locus D(t), rank≥0 whole base | Agrees; none |
| Proper limits of failure | Fixed y-direction for system {1,x} on A² has restriction rank 1<2 generically and specially; length remains 2, transverse/tangent lengths 1+1 or 0+2 | Agrees; none |
| Exact integer-rank lifting | Integer 102 is 1 mod 101 and nonzero over Q; Euler on X₀² gives 2X₀²=2F; at degree 0 it instead gives 0=0 | Agrees; none |
| `quadraticDoublePointRank` | In A¹ q=0,1,2,3: ranks 0,2,3,3 = formula; in A² q=2,3: ranks 5,6 =6−1,6−0 | Agrees; none |
| `nearExceptionRanks` | Cubic ranks 9,10,20,30,35,120; quartic ranks 12,15,32,35,65,70; all equal the listed min(source,rows) values modulo 101 | Agrees; none |
| Veronese construction | [1:1]↦[1:1:1], [2:2]↦[4:4:4], same point; degree 1 identity; degree 0 maps both [1:0],[0:1] to [1] | Agrees; none |
| Polarization normalization | (e₀+e₁)² has coefficients (1,2,1); mixed pairing 2·(1/2)=1 gives complete-monomial coordinate 1; derivative pairing also 1 | Agrees; none |
| Veronese tangent annihilator | At [1:0],d=2, tangent directions span e₀²,e₀e₁; annihilator is span X₁², dimension 1=3−2 | Agrees; none |
| Terracini span | Rational normal conic: one tangent cone dimension 2, two general tangent spans dimension 3; jet ranks 2,3=min(3,2q) | Agrees; none |
| Plane singular-curve incidence | x² has double line multiplicity 2, x has normal derivative 1; line allows 2 general points, conic 5, equal to ℓ(ℓ+3)/2 | Agrees; none |
| Defective plane contact curve | Five plane double supports on a conic, quartic: square conic has 2ℓ=4=d, and q=5=2·5/2; space dimension 15, defective rank 14 | Agrees with BO exceptions; none |
| Plane contact numerical reduction | d=5,6,7,8: floor(N/3)=7,9,12,15 versus maximal ℓ(ℓ+3)/2=5,9,9,14; only d=6 permits the inequality | Agrees; none |
| `sexticPlane` | q=9,10: computed ranks 27,28=min(28,27),min(28,30) modulo 101 | Agrees; none |
| `planeDoublePointRank` | d=0,q=3: rank 1=min(1,9); d=1,q=2: rank 3=min(3,6); exceptional d=2,q=2 rank 5<6 is excluded | Agrees; none |
| `ProjectivelyDistinct` | e₀,e₁ independent, rank 2; e₀,2e₀ rank 1 and c=1/2 violates distinctness; empty passes, zero singleton fails | Agrees; none |
| `threeSubspaceCubicBases` | r=5,6,7: containment ranks 30,57,93; with singularities 56,84,120=source dimensions, leaving kernels 0,0,0 | Agrees; none |
| Three-subspace recursion | Base vector dimensions 3,4,5; pair intersections 0,1,2; triple intersection 0 in each recomputed case; cubic kernels 56−56=84−84=120−120=0 | Agrees in bases; general recursion remains target |
| `twoSubspaceCubicBases` | r=5,7: containment ranks 20,66; combined ranks 56,120; pair intersections 0,2=r−5 | Agrees; none |
| Two-subspace recursion | On-space singularities alone add ≤18 or ≤30 to containment; remaining dimensions ≥36−18=18, ≥54−30=24; adding three off-space supports gives kernel 0 | Agrees in bases; general recursion remains target |
| `oneSubspaceCubicBases` | r=5: containment 10, doubles total rank 55, transverse remainder raises to 56; r=7: containment 35, doubles rank 120 with no remainder | Agrees; none |
| One-subspace recursion | r=5: on/off counts 3,6, δ=2, trace length 1; r=7: on/off counts 7,8, δ=0; normal conditions match the recomputed base ranks 56,120 | Agrees in bases; general recursion remains target |
| Cubic remainder formula | r=2: q=3,δ=10−3·3=1; r=5: q=9,δ=56−6·9=2; r=7: q=15,δ=120−8·15=0 | Agrees; none |
| `cubicDoublePointRank` | r=4,q=6,8: ranks 30,35=min(35,30),min(35,40); excluded q=7 has source/row count 35 | Agrees; none |
| `quarticFive` | r=5,q=21: recomputed rank 126=choose(9,4)=21·6 | Agrees; none |
| Signed Horace division | (r,d,q)=(3,6,21): dividend 84−56=28=3·9+1; below critical (2,4,3): −1=2·(−1)+1 | Agrees; none |
| Horace trace-size inequality | (3,6,21): re+u=12≤21=N(2,5); (2,4,3): 2·1−1=1≤4 | Agrees; none |
| Horace residual-size inequality | (3,6,21): N(3,4)=35≤(21−9−1)·4=44; (2,4,3): 6≤(3+1−1)·3=9 | Agrees; none |
| Large-dimensional quartic bound | r=10,q=91: u=71,e=5, q−u−e=15≥11=r+1 | Agrees; none |
| Nonnegative critical data | (2,4,5): u=2≥e=1, residual count 2; (3,4,8): u=4≥e=0, residual count 4; below critical u=−1 fails, as excluded | Agrees; none |
| Mixed residual rank | (3,6,21): full rank 48 in source 56, delete one row gives 47=56−9; (3,4,8): 16=20−4; (2,4,5): 8=10−2 | Agrees; none |
| Injective residual restriction | (3,6,21): quadratic/quartic predecessor count 11 yields 44≥35, zero predecessor kernel; seven versus eight spanning P⁷ supports leave quadric kernel 1 versus 0 | Agrees; none |
| Simple points kill residual system | A u-dimensional injective restriction at u=0 needs 0 evaluations; span {1,x} at 0,1 has rank 2 and kernel 0 after 2 points | Agrees; none |
| Underfilled trace remainder | (3,6,21): trace length 3·9+1=28=N(2,6); deletion of remainder gives 27, not 28 | Agrees; none |
| Moving supports/hyperplanes | δ(t)=(a,t),H_t=(y=t): full algebra basis 1,x−a,y−t length 3; restricted basis 1,x−a length 2 at t=0 and t≠0 | Agrees; none |
| Compatible bad-incidence specialization | Product I=0,F={1},G={2}: saturated ideal 0, contraction 0; graph sv=t on s=0, saturated by t: unit ideal 1, no prime; e=0 requires rank<0, empty | Controls distinguish the target from false properness inference; no proof claimed |
| Transverse limit rank | (3,6,21),f=1,g=0: trace 27+1=28, residual 9+44+1=54; sum 82=(21−1)·4+2 | Agrees conditional on the diagram; none |
| Tangent directions in moving residual | Same data,f=0,g=1: mixed residual 9+44+2=55; trace 27; sum 82; taking the tangent special residual alone would give 0 for its local length | Agrees conditional on the diagram; none |
| Underfilled contradiction | Same data: mixed lower bound 54+28=82, strict failure rank≤81; 82>81 | Agrees conditional on the diagram; none |
| Overfilled partial-length reduction | (r,d,q)=(3,4,9): u=5,e=1,ν=15−15=0; partial length 8·4+1·3=35=N(3,4), full length 36 | Agrees; none |
| Overfilled contradiction | Same data: all restricted indices tangent; partial source dimension and target length both 35; rank 35 means kernel 0, and adding the 36th condition preserves kernel 0 | Agrees conditional on the diagram; none |
| Differential induction | (3,6,21): predecessors (2,6,9),(3,5,12),(3,4,11), expected ranks 27,48,35; combined endpoint rank 84=min(84,84) | Agrees numerically; geometric theorem remains target |
| `univariateHermiteRank` | Over F₂ at supports 0,1 and d=0,1,2,3: computed affine ranks 1,2,3,4=min(d+1,4); empty tuple rank 0 | Agrees; no factorial hypothesis needed |
| Quartic P⁷ ordinary Horace | q=41,42: cubic dimensions 120−88=32,120−96=24; residual ranks 118,120; totals 328,330=min(330,328),min(330,336) | Agrees; none |
| `quarticDoublePointRank` | r=5,q=21: rank 126; r=6 critical q=30: u=21,e=0,residual count 9; r=8 q=55: u=41,e=2,residual count 12 | Agrees with schedule; none |
| Exception-avoiding schedule | 514 distinct critical tests for 2≤r≤25,4≤d≤20; in r≥3,d≥5, exceptional predecessor count 0; r=9,d=4 gives residual counts 13,12≥10 | Agrees on tested range; not a general proof |
| `genericDoublePointRank` | r=1,d=5,q=0,1,4: computed ranks 0,2,6=min(6,0),min(6,2),min(6,8); r=0,q=2 permits only one support value | Agrees; r≥1 retained |
| Dense affine chart | [1:0],[1:1] on P¹ lie in X₀≠0 and give affine supports 0,1; d=3 jet rank 4=4 | Agrees; none |
| `universalJetMatrix` | r=n=d=1: [[1,T],[0,1]], det 1; substitution T=3 in x² column yields (9,6); d=0 derivative entry 0 | Agrees; none |
| `selectedMinor` and determinant sign | Ordered columns 1,x give det 1, swapped x,1 give −1; n=2,d=3 at supports 0,1 gives 1, repeated 0,0 gives 0; empty determinant 1 | Agrees; none |
| Degree bound including zero | Two univariate cubic supports: selected determinant (b−a)⁴ has total degree 4 and coordinate degrees 4≤md=12; zero polynomial has total/coordinate degree 0 | Agrees; none |
| `evaluationPrime` | At 0: T↦0,1↦1, kernel (T); at 1: T↦1,T−1↦0, kernel (T−1); no variables gives kernel 0 in k | Agrees; none |
| Principal open, both directions | Δ=1 gives all evaluation primes and rank 2 in the one-support linear case; Δ=0 gives no points; two-support cubic Δ=(b−a)⁴ is nonzero at (0,1) and zero at (0,0) | Agrees; none |
| `integerGridForMinor` | One-support linear minor 1 has origin witness in [0,2]; n=0 gives Δ=1 and unique empty assignment, B=0; two-support cubic witness (0,1) lies in [0,12]² | Agrees; none |
| Nonzero maximal minor | One A¹ support,d=5: select columns 1,x, determinant 1; m=2≤N=6; other columns x²,x³ have determinant T⁴, which vanishes at 0 | Agrees; existential column choice retained |
| `genericAffinePrincipalOpen` | r=n=1,d=5: D(1) nonempty, rank 2=target dimension; r=2,n=7,d=5 allows m=N=21 but collinear rank is 11 | Agrees; only the selected open promised |
| `parameterPullback` | Two cubic supports θ=(0,u): pullback u⁴, B=4, u=1 gives Δ=1; θ=(0,0) gives 0 and fails hypothesis; empty parameter set with θ=(0,1) gives constant 1 and unique assignment | Agrees; nonvanishing hypothesis retained |
| Special collinear configurations | Seven supports (i,0),d=5: computed rank 11=6 from f(x,0)+5 from ∂yf(x,0), below expected 21 | Agrees; none |
| Downstream R=r+1 convention and exceptions | (R,d,n)=(3,2,2): rank 5<6; (3,5,6): min(21,18)=18; (2,2,2): rank 3=min(3,4), not onto; cubic exception translates (r,q)=(4,7) to (R,d,n)=(5,3,7) | Agrees; complete d≥2 interface retained |

## Build and gates

`lake build TauCetiRoadmap.GenericDoublePointInterpolation.Suggested` exited 0. Exact completion line: `Build completed successfully (8976 jobs).` Each of the 16 warnings says the declaration uses `sorry`; there were no errors.

Exact gate summary (exit 0):

```text
gate GenericDoublePointInterpolation: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Exact dependency-direction output with `--movable` (exit 0):

```text
depcheck: 54 roadmaps, 612 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. No worktree change, commit, push, PR edit or posted reply was made.
