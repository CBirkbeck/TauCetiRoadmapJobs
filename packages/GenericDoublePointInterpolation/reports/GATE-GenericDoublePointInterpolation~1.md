## H01 (CBirkbeck) — applied

`TauCetiRoadmap/GenericDoublePointInterpolation/README.md:717` replaces the regular-equation-plus-colon nonflat contract with flat base change of all three ideal-sheaf terms and their maps, and adds the affine negative controls at line 721 (residual sequence: BO line 407). For A=k[t,x], I=(t,x), B=k[t], the colon comparison is B≅B but the middle modules are B⊕B/(t) versus B and the traces are k versus 0, so the suggested deletion is necessary; the unrelated finite locally free pushforward and explicit quotient-family base changes remain valid.

## H02 (CBirkbeck) — applied differently

`TauCetiRoadmap/GenericDoublePointInterpolation/README.md:50` assigns interpolation and Horace to this supplier, line 575 states the determinant-d chart row change, and line 1623 supplies ArithmeticStatisticsPartV §3.28 with the full d≥2 nonexceptional interface using R=r+1; the quadratic rank formula is now a headline at `TauCetiRoadmap/GenericDoublePointInterpolation/Suggested.lean:109`, with README formula and discriminating Checks at line 875 (BO line 22 and BO line 278). ArithmeticStatisticsPartV at 7f06cfc still contains the competing `FieldStatistics.doublePointInterpolation` proof programme in §3.28: replacing that programme with this import is a required companion change outside the authorized files, so the local ownership declaration does not by itself resolve the cross-roadmap conflict.

## H03 (CBirkbeck) — applied

`TauCetiRoadmap/GenericDoublePointInterpolation/README.md:1194` strengthens 0≤u to u≥r−1≥e using the critical lower bound and Pascal, and line 1218 replaces unspecified specialization/transversality with an independent full-double witness, a projective coordinate change taking its selected e supports onto H, deletion of the normal rows, and rank openness on the incidence parameter (BO line 807). For (r,d,q)=(3,6,21), (u,e)=(9,1), the lower-degree full rank is 48≤56 and the mixed rank is 47=56−9; the new below-critical Check (2,4,3) gives (u,e)=(−1,1), excluding that extension of the inequality.

## H04 (CBirkbeck) — applied

`TauCetiRoadmap/GenericDoublePointInterpolation/README.md:1147` makes compatible bad-incidence specialization the first substantial geometric milestone, and line 1311 specifies the additional local property: after taking the selected generic bad point's irreducible closure, specializing the F parameters and saturating by transverse coordinates and the remaining support parameters, a prime through the same zero point must contract to zero in the mixed support ring. This remains an explicit interpolation proof obligation, beyond BO line 882 and BO line 890: the product-incidence Check has saturated ideal (0), whereas the graph s·v=t on s=0 has saturation (1), so the criterion distinguishes compatible dominance from proper trait limits without claiming that closure or modification alone proves it.

## H05 (CBirkbeck) — answered

The whole-roadmap merge account omits GroebnerGeometry: AlgebraicModuliForArithmeticGeometry at 0b84954 names it as a prerequisite, and §1.5 consumes its G2/G4 Hilbert theory, so the description must include GroebnerGeometry before AlgebraicModuliForArithmeticGeometry and withdraw the no-other-author claim; editing that description is outside this job's authorized files. The additional proposed dependency on the StableReduction revision is not adopted: StableReduction Layer 2 already owns relative Proj on main, SchemeAndStackFoundations §0.3 supplies its carrier comparison there, and revisions of an existing roadmap are consumed from main under the standing dependency rule.

Validation and remaining boundaries:

- Commit: `2a1b40c`, `GenericDoublePointInterpolation: review repairs (flat base change, interpolation ownership, and Horace proof contracts)`; only the two permitted roadmap files changed; nothing pushed.
- Build command: `lake build TauCetiRoadmap.GenericDoublePointInterpolation.Suggested`; exit 0, with 16 admitted-theorem warnings and no errors. Exact outcome: `Build completed successfully (8976 jobs).`
- Elaborated one scratch file containing `#check @name` for every declaration, and compared all 29 types with the README: no lost section binders; the added quadratic theorem explicitly retains `[Field k]`, `[CharZero k]`, r≥1, every q≥0 and the saturated quadratic formula. The existing 28 signatures are unchanged.
- Supplier citations were resolved against main fe54001 and the indexed open heads; checked the actual sections of AlgebraicVectorBundles L0B, DiophantineApproximationAndTranscendence §2.7, SchemeAndStackFoundations §§0.28, 2.6, 4.12, 5.12, and AlgebraicModuliForArithmeticGeometry §§1.1–1.2, 1.7, 2.1. IntegralLattices Layer 0 remains the lattice owner; ArithmeticStatisticsPartV is a later consumer, not a supplier.
- Ownership searches covered the main/open roadmap index, the supplied sibling folders and board packages; the matching full interpolation programme is ArithmeticStatisticsPartV §3.28. This roadmap is the earlier supplier in the prescribed merge order and owns the moved general interpolation objects; no earlier owner's construction was copied or assigned its fully qualified name.
- Both library checkouts match the manifest pins: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The native bounded submodule is the support restriction at `Mathlib/RingTheory/MvPolynomial/Basic.lean:164`, with coefficient support bounded by total weight, not by individual coordinate degree; its support basis is at line 95. The square-zero carrier at `Mathlib/Algebra/TrivSqZeroExt/Basic.lean:67` has products of infinitesimals zero (line 452), rather than the reduced-point multiplication.
- The row adapter uses the pinned Euler identity `MvPolynomial.IsHomogeneous.sum_X_mul_pderiv` at `Mathlib/RingTheory/MvPolynomial/EulerIdentity.lean:73`; the library law permits degree zero, whereas invertibility of this adapter requires d≠0 in k. No pinned double-point interpolation or quadratic evaluation-rank theorem was found by object searches.
- All cited source texts were legally readable: BO line 22 (full exceptions), BO line 278 (quadrics), BO line 407 (residuals), BO line 765 and BO line 807 (Horace arithmetic and mixed residual), BO line 882 and BO line 890 (the incidence proof step), COU line 179 and COU line 242 (coefficient/jet and minor/grid interpretation), VAK line 14724, VAK line 23876, VAK line 23946 and VAK line 28564 (the cited 2017 definitions and theorems). Stale extraction-line locators were refreshed while preserving the works and theorem/page locators; no passages or source files were copied.
- The existing ST citation was resolved legally to ST line 8610, Lemma 10.78.2 (00NX); the supplied package source manifest contains BO, COU and VAK but no ST entry, so registering ST remains a worker metadata follow-up outside the permitted edit set. There are no unreadable-source requests.
- Dependency direction output, verbatim: `depcheck: 33 roadmaps, 306 edges, 0 problem(s)`. No UPWARD or CYCLE line was emitted.
- Final gate exited 0; exact summary:

```text
gate GenericDoublePointInterpolation: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Adversarial mathematics pass:

The rows below test each mathematical target and the standing conventions, including its defining formulas and API. Ranks labelled mod 101 were computed from integer polynomial evaluation matrices; they test the statements and do not replace the planned proofs. The incidence prime-existence assertion remains a proof target, as does the diagram it is intended to construct.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Universe, coefficients and length conventions | Empty finite scheme; double point in A²; square-zero base | Lengths 0, 3; k[ε]/ε² has dimension 2, not 1 | Consistent | None |
| Row and projective-dimension conventions; JetRows | n=2,r=2; R=r+1 | 2·3=6 rows; P² has 3 homogeneous coordinates | Consistent | R=r+1 consumer translation added |
| Independence versus maximal rank | r=1,d=5,q=4 | Rank 6=min(6,8), while target dimension 8 | Surjectivity cannot be inferred | Retained |
| Integer Euclidean division convention | r=2,d=4,q=3 | Dividend −1=2·(−1)+1, not 2·0+0 | Critical-range hypothesis necessary | Negative Check added |
| Binomial count of bounded monomials; Monomials | r=0,d=2; r=d=2; d=0 | Counts 1=choose(2,2), 6=choose(4,2), 1=choose(r,0); coordinatewise bound would give 9 | Correct | None |
| monomialsFintype | r=d=2 | Six admissible exponents; each coordinate ≤2; cube has 9 exponents | Finiteness and total-weight bound distinguished | None |
| Dimension of bounded polynomials; Bounded | r=0,d=0; r=2,d=2 | Dimensions 1=choose(0,0), 6=choose(4,2) | Correct | None |
| Coefficient coordinates and inverse | 2+3x² in degree ≤3; zero polynomial | Coordinates (2,0,3,0) reconstruct 2+3x²; (0,0,0,0) reconstructs 0 | Both inverse directions agree | None |
| Fixed-degree homogenization and multiplication | d=2,f=1+x; d=e=1,f=g=1+x; zero ring | H₂(f)=X₀²+X₀X₁; H₂(fg)=(X₀+X₁)²=H₁(f)H₁(g); zero ring gives 0=0 | Correct | Source locator refreshed |
| Homogeneous forms and twisting sections | P¹,d=2; chart X₀=1 | Three sections X₀²,X₀X₁,X₁² restrict to 1,x,x²; both dimensions 3 | Chart normalization agrees | None |
| Coefficient Gram form | x,y; 2+x; constants a=2,b=3 | G(x,y)=0; G(x,x)=1; G(2+x,2+x)=5; G(2,3)=6 | Correct orthonormal normalization | Source locator refreshed |
| First-jet algebra evaluation; jetAlgebra | x at 0; x² at 0; x² at 3 | (0,1); (0,0); (9,6); (3+ε)²=9+6ε | Correct; quadratic infinitesimals excluded | None |
| Kernel of one first jet | x,x² at 0; r=0 | Jets (0,1) and (0,0); kernel (x²); for r=0 map k→k is identity with kernel 0 | Both inclusions agree | None |
| Distinct point ideals and their powers | 0,1 over a field; 0,2 over ℤ | x−(x−1)=1; sum over ℤ is (x,2), with quotient 𝔽₂≠0 | Field hypothesis essential | None |
| Squared union ideal; doubleIdeal | Empty tuple; one origin; repeated origin | Ideals (1), (x²), (x²); empty quotient dimension 0; repetitions do not give (x⁴) | Correct native definition | None |
| Double-point quotient comparison; doublePointQuotient | A² origin; A¹ supports 0,1; empty tuple | Dimensions 3=1·3, 4=2·2, 0=0; x(x−1) has jets (0,−1),(0,1), square 0 | Nonreduced algebra retained | None |
| Length of distinct double points | r=0,n=1; r=2,n=2; n=0 | Dimensions 1=1·1, 6=2·3, 0=0 | Correct | None |
| Bounded first-jet evaluation; firstJetMap | A² origin,d=1; d=0; x² at 3 | Identity rank 3; constant column (1,0,0) rank 1; jet (9,6) | Correct | None |
| Value projection | x at supports 0,1; empty support set | (0,1); zero-dimensional target and entire kernel | Correct | None |
| Derivatives of vanishing polynomials | x at 0; x(x−1) at 0,1 | Derivatives 1 and (−1,1), despite zero values | Zero derivative map excluded | None |
| Surjectivity through the value kernel | One A¹ origin,d=1 and d=0 | d=1: value rank 1, kernel derivative rank 1, jet rank 2; d=0: ranks 1,0,1 | Both directions agree | None |
| Monomial first-jet matrix; firstJetMatrix | One A¹ origin,d=1; r=2,n=2,d=2 | Matrix diag(1,1), rank 2; shape 6×6, not 2×18 | Correct | None |
| Full row rank criterion | One A² origin,d=1 and d=0 | Ranks 3=target dimension 3 and 1<3 | Iff agrees in both cases | None |
| Well-poised double points; WellPoised | One point,d=1; one point,d=0,r=2; seven collinear,d=5 | Ranks 3,1,11 against targets 3,3,21 | Predicate separates examples | None |
| Restriction to projective double points | P¹ support [1:0],d=1; empty tuple | Columns X₀,X₁ give chart jets (1,0),(0,1); rank 2=2; empty rank 0=0 | Same chart trivialization | None |
| Homogeneous partials and affine first jets | X₀²+X₀X₁ at x=2; X₀X₁ at x=2 | (3,1)↦(4,1), determinant 2; (2,1)↦(2,1), while wrong plus sign gives 6 | Invertible row change verified | Adapter added |
| Homogeneous row-change boundary | F=1,d=0; F=X₀²,char 2 | Affine value 1 maps to homogeneous zero; determinants 0 and 0 | Both excluded by d≥1,char 0 | Negative Checks added |
| Finite locally free pushforward of a line bundle | B=k×k; base k[δ]/δ²→k; empty scheme; identity | Ranks 2→2, 0,1; A²⊗_A k=k² | Arbitrary base change valid for this finite-free contract | Retained |
| Relative generic smoothness and differential | Projection A²→A¹; x↦x² at 0,1; dual numbers; generic point | Jacobian ranks 1,0,1; relative dimension 2−1=1; dual-number tangent 1 versus dimension 0; generic-point local tangent 0 versus geometric tangent 1 | Stated hypotheses and geometric tangent convention necessary | VAK locators refreshed |
| Restriction rank of a finite scheme | One simple point,d=0; D=0; one A² double,d=1 | h=1=1−0; h=0=0−0; h=3=3−0 | Correct actual range dimension | None |
| Restriction rank on disjoint unions | P¹ simple points 0,1; d=1 then d=0 | d=1: 2=1+1; d=0: 1=1+0 | Kernel system essential | None |
| Cartier residual and trace, affine formulas | I=(t,x),H=(t); flat B=A[y] | Colon A and B; traces (x) in k[x] and k[x,y]; multiplication kernel generated by t | Flat sequence agrees | Arbitrary-base-change extension deleted |
| Nonflat ideal and trace comparisons | A=k[t,x], B=A/(x), I=(t,x) | Colon A⊗B=B=(IB:t); I⊗B=B⊕B/(t) versus IB≅B; old trace⊗B=k versus new trace 0 | Former contract false | Counterexamples added |
| Finite-scheme residual and trace | Double origin in A³; transverse/tangent length-two direction; empty X | Length decompositions 4=1+3; 2=1+1; 2=0+2; 0=0+0 | Orientation agrees | None |
| Castelnuovo dimension bound | One plane double,d=1,H through support | Kernel dimensions 0≤0+0; rank bound 3≥1+2=3 | Left exactness suffices | Source locator refreshed |
| Ordinary Horace criterion | Quartic P⁷,q=41,42,u=30 | Trace rank 210; residual ranks 118,120; totals 328=min(330,328),330=min(330,336) | Matched inequality branches agree | None |
| Independent subschemes | A² double,d=1; simple subscheme; overfilled P¹,d=1 | Surjective rank 3 restricts to rank 1; injective rank 2 persists after adding supports | Both monotonicities agree | None |
| Curvilinear criterion at one support | A² double with D=span(1,x); y-direction; full linear system | Total rank 2<3; y-direction rank 1<2; full ranks 3 and 2 | Missing derivative detected | None |
| Curvilinear reduction | Two A¹ supports 0,1; d=3 then d=2 | Full ranks 4 and 3 against length 4; the curvilinear union itself has ranks 4 and 3 | Failure detected in correct direction | None |
| Universal length-two direction family | A² direction e₁; zero tangent space; dual-number parameter base | Quotient k⊕kε length 2; P(0)=empty; A⊕Aε free rank 2 | Nonzero direction and nilpotents retained | VAK locators refreshed |
| Rank in flat point families | Matrix [t] at t=0,1; matrix [ε] over k[ε]/ε² | Geometric ranks 0,1; minor ideal (ε)≠0 although every geometric rank 0 | Rank cannot increase under specialization | None |
| Proper limits of curvilinear failures | Constant transverse direction; graph [s:t] | Direction lengths 2→2; axis limits [0:1] and [1:0] differ | Trait limits do not give compatibility | Retained separate contract |
| Exact integer rank witnesses | diag(1,2); scalar 101; degree-2 Euler at (1,2) | Determinants 2 mod 101 and 0 mod 101; latter integer determinant 101≠0; Euler 2·3=4+2=6 | Sufficient modular criterion; no converse claimed | Source locator refreshed |
| Quadrics with prescribed singular points; quadraticDoublePointRank | r=1,q=0,1,2,3; r=2,q=2,3,4 | Ranks 0,2,3,3 and 5,6,6; 76 modular ranks r=1..8 agree with N−choose(r+2−min(q,r+1),2) | Formula includes defects and saturation | Headline and Checks added |
| Low-degree near-exception ranks; nearExceptionRanks | All twelve specified configurations | Mod 101 ranks 9,10,20,30,35,120 and 12,15,32,35,65,70 equal required ranks | All witnesses reach upper bound | None |
| Veronese morphism and tangent spaces, normalization | P¹,d=2; rescaling (1,1)→(2,2); d=0; polarization | Coordinates (1,1,1)→(4,4,4); constant image 1; symmetric coefficient 2 times pairing 1/2 gives 1 | Correct scaling and pairing | None |
| Veronese tangents and double-point conditions | P¹,d=2 at e₀; d=1 | Tangent span has dimension 2 and annihilator span(X₁²) of dimension 1; at d=1 annihilator 0 | 2+1=3; 2+0=2 | None |
| Terracini span for the Veronese family | P¹ conic,q=1,2 | Affine tangent dimensions 2,3 equal double-point ranks 2,3; projective dimensions 1,2 | Cone/projective shift correct | None |
| Plane singular-curve incidence | F=x² and F=x; ℓ=1,2 | Normal derivatives 2x and 1; multiplicities 2 and 1; support bounds 2 and 5 | Nonzero reduced curve hypotheses effective | None |
| Contact curve in the defective plane case | Quartic plane,q=5 | Double conic has ℓ=2,2ℓ=4=d; point bound 5=2·5/2 | Defective example fits conclusion | None |
| Plane contact numerical reduction | d=5,6,7,8 | Critical q=7,9,12,15; maximal curve bounds 5,9,9,14 | Only d=6 survives these boundaries | None |
| Exact sextic plane critical ranks; sexticPlane | q=9,10 | Mod 101 ranks 27,28=min(28,27),min(28,30) | Both critical counts agree | None |
| Plane interpolation input; planeDoublePointRank | d=0,q=0,1,2; d=3,q=3,4; d=4,q=4,6 | Ranks 0,1,1;9,10;12,15 equal min dimension/length | Degenerate and low-degree ranges agree | None |
| Projectively distinct supports; ProjectivelyDistinct | e₀,e₁; e₀,2e₀; empty; zero singleton | Pair rank 2 versus 1; proportionality c=1/2; empty predicate true; zero singleton false | Vector injectivity insufficient | None |
| Three-subspace cubic base rank witnesses; threeSubspaceCubicBases | r=5,6,7 | Mod 101 containment ranks 30,57,93; combined ranks 56,84,120; kernels 26,27,27→0 | Source and support counts agree | None |
| Three-subspace cubic recursion | Starting dimensions r=5,6,7 | Base full ranks 56=choose(8,3),84=choose(9,3),120=choose(10,3) | Numerical induction bases agree | None |
| Two-subspace cubic base rank witnesses; twoSubspaceCubicBases | r=5,7 | Containment ranks 20,66; combined ranks 56,120; off-space counts 3,3 | Exact ambient dimensions reached | None |
| Two-subspace cubic recursion | r=5,7 | Support totals 2·3+3=9,2·5+3=13; full ranks 56,120; omitted ambient rows leave at least 18,24 dimensions | Three ambient supports essential | None |
| One-subspace cubic base rank witnesses; oneSubspaceCubicBases | r=5,7 | Containment ranks 10,35; before remainder 55,120; after remainder 56,120 | Transverse condition needed in r=5 | None |
| One-subspace cubic recursion | r=5,7,8 | On/off counts (3,6),(7,8),(9,9); remainder lengths 2,0,3; trace remainder lengths 1,0,2 | Congruence and support counts agree | None |
| Cubic critical-count remainder | r=2,3,5,7,8; excluded r=4 | 3·3+1=10;5·4=20;9·6+2=56;15·8=120;18·9+3=165; r=4 arithmetic 7·5=35 alone does not establish rank | Exceptional dimension excluded | None |
| Cubic maximal-rank input; cubicDoublePointRank | (r,q)=(2,3),(2,4),(4,6),(4,8),(7,15) | Ranks 9,10,30,35,120 equal minima; (4,7) omitted | Counts and exception agree | None |
| Quartic P⁵ critical rank; quarticFive | q=21 | Mod 101 rank 126=21·6=choose(9,4) | Square critical system | None |
| Horace trace-size inequality | (r,d,q)=(3,6,21); (3,4,8),(3,4,9) | u+re=12≤21;4≤10;8≤10 | Matches Lemma 6.3(i) | None |
| Horace residual-size inequality | Same three cases | 35≤44;10≤16;10≤12 | Matches Lemma 6.3(ii) | None |
| Large-dimensional quartic residual bound | r=10,d=4,q=91 | (u,e)=(71,5); q−u−e=15≥11 | Sharp bound exceeds r+1 | None |
| Nonnegative critical Horace data | r=2,d=4,q=5; r=3,d=4,q=8,9; below-critical q=3 | (u,e)=(2,1),(4,0),(5,1); excluded (−1,1); 1654 critical divisions tested | u≥r−1≥e justified | Stronger inequality and identity added |
| Mixed residual rank in degree d−1 | (3,6,21),(3,4,8),(3,4,9),(2,4,5),(4,5,25) | Full ranks 48,16,16,9,60; mixed ranks 47,16,15,8,57; remaining dimensions 9,4,5,2,13 | Full systems independent before row deletion | Coordinate-change proof route added |
| Injective residual restriction to H | r=3,d=6,Σ count 11 | Degree-4 source 35; 11 doubles give 44 conditions and zero kernel; restriction kernel 0 | Lower-degree injectivity used | None |
| Killing a residual system with simple points | r=3,d=6,q=21; zero system | Residual dimension 9; nine simple evaluations reduce 9→0, total rank 47+9=56; zero system needs 0 points | Count matches filled residual | None |
| Underfilled trace with simple remainder | r=3,d=6,q=21 | ru+e=3·9+1=28=N(2,6); deleting remainder gives 27 | Independence passes to subsets | None |
| Moving supports and hyperplanes | A²,δ(t)=(a,t),H_t=(y=t); t=0 | Full lengths 3→3; restricted lengths 2→2; ε²=0 before and after base change | No reduced specialization introduced | None |
| Compatible bad-incidence specialization, diagram | e=1; F/G split with one index each; e=0 | Transverse lengths 1+1=2; mixed residual lengths 1+2=3, trace lengths 1+0=1; rank<0 gives empty W | Local numerical laws agree; compatibility remains theorem target | Promoted milestone |
| Saturated-ideal prime property | Product incidence I=0; graph s·v=t on s=0 | Product saturation 0, prime contraction 0; graph ideal (t), saturation by t is (1), with no prime | Detects actual obstruction; no universal flatness claim | Local algebraic proof obligation and controls added |
| Transverse curvilinear limit rank | r=3,d=6,q=21,f=1,g=0 | Trace 3·9+1=28; comparison residual rank 9+44+1=54; total 82 | Counts match proper comparison scheme | None |
| Tangent directions in the moving residual | Same data,f=0,g=1 | Special comparison rank 9+44+2=55; mixed residual lower bound 55; trace 27; total 82 | Tangent directions stay off H during estimate | None |
| Underfilled differential Horace contradiction | Same data with (f,g)=(1,0),(0,1) | Lower bounds 54+28=82 and 55+27=82 against strict upper bound <80+2=82 | Algebraic contradiction consistent, conditional on incidence milestone | Milestone retained explicitly |
| Overfilled partial-length reduction | r=3,d=4,q=9 | u=5,e=1,ν=0; partial length 8·4+1·3=35=N(3,4); full length 36 | Partial system has correct length | None |
| Overfilled differential Horace contradiction | Same data,f=0,g=1 | Residual lower bound 5+12+2=19; trace 15; curvilinear total 34 against <8·4+2=34 | Uses selected trace; all restricted indices tangent | None |
| Differential Horace induction step | r=3,d=6,q=21 | Predecessor counts (2,6,9),(3,5,12),(3,4,11); target min(84,84)=84 | Three inputs have correct counts | None |
| Univariate Hermite interpolation; univariateHermiteRank | Supports 0,1; char 2,3,101; d=0,1,2,3,5 | In each characteristic ranks 1,2,3,4,4=min(d+1,4) | No factorial inverses needed | None |
| Quartic P⁷ ordinary Horace input | q=41,42,u=30 | 210+118=328 and 210+120=330; residual lengths 118,126 | Both ordinary branches agree | None |
| Quartic induction inputs; quarticDoublePointRank | r=5,q=21; r=6,q=30; r=8,q=55; r=9,q=71,72 | Base 126; division (u,e)=(21,0),(41,2),(54,4),(55,5); quadratic counts 9,12,13,12 exceed respective r | No quadratic or cubic exception entered | None |
| Exception-avoiding induction schedule | (r,d,q)=(3,5,14),(4,5,25),(4,5,26),(4,6,42) | Predecessor pairs (degree,count): (4,7)/(3,7);(4,12)/(3,9);(4,11)/(3,11);(5,21)/(4,21); none equals excluded count for that dimension | Low-degree boundary schedule consistent | None |
| Generic characteristic-zero double-point rank; genericDoublePointRank | r=1,d=5,q=0,1,4; excluded r=0,q=2 | Ranks 0,2,6=min(6,0),min(6,2),min(6,8); in A⁰ both supports identical | Generality and injectivity bound agree | None |
| Passing to the dense affine chart | P¹,d=2; affine supports 0,1 | Homogeneous/affine rank 3=3; chart point representatives (1,0),(1,1) nonproportional | Restriction retains rank | None |
| Universal first-jet matrix; universalJetMatrix | r=n=d=1; x² at P=3; d=0 | U=[[1,T],[0,1]], det=1; entry evaluation (9,6); derivative entries 0 at d=0 | Specialization agrees | None |
| Selected determinant; selectedMinor | One point with swapped columns; two univariate supports 0,1 and 0,0 | Determinants 1,−1,1,0 | Sign and repeated-row conventions verified | None |
| Degree of a first-jet minor | r=1,n=2,d=3; zero minor; empty determinant | Δ=(Q−P)⁴ has total and individual degree 4≤12; zero polynomial degree 0≤12; empty det=1 degree 0 | Inclusive bound handles junk degrees | None |
| Evaluation prime; evaluationPrime | P=0 and P=1 in one variable; no coordinates | Ideals (T),(T−1), with eval(T)=0,1; empty-coordinate kernel (0) | Prime and point distinction agree | None |
| Principal-open full-jet locus | Δ=(Q−P)⁴ at (0,1),(0,0); Δ=0 | Values 1,0; ranks 4,2; D(0)=empty | Nonzero value gives both distinctness and surjectivity | None |
| Bounded integer specialization; integerGridForMinor | r=1,n=2,d=3; n=0; r=0,n=1,d=0 | B=12 and (0,1) gives Δ=1; empty Δ=1,B=0; scalar case Δ=1,B=0 | Empty box and zero-degree boundaries agree | None |
| Nonzero maximal minor | r=1,n=2,d=5 | Columns 1,x,x²,x³ at 0,1 give determinant 1; 4≤choose(6,5)=6 | Existence separate from arbitrary minor choice | None |
| Generic affine Hermite interpolation; genericAffinePrincipalOpen | Same r=1,n=2,d=5; r=2,n=6,d=5 | Nonzero minor 1 at 0,1; mixed-trace example rank 18=min(21,18) | Endpoint and row counts agree | None |
| Polynomial parameter pullback; parameterPullback | P=0,Q=u,d=3; collapse Q=0; empty parameter set with Δ=1 | Pullback u⁴ has degree 4 and value 1 at u=1 in [0,4]; collapse gives 0; empty assignment gives 1 | Explicit nonzero-pullback hypothesis needed | None |
| Special collinear configurations fail | Seven supports (i,0),degree 5 | Mod 101 rank 11=6+5, against target/source 21 | Refutes arbitrary-distinct formulation | None |
| Full low-degree consumer adapter | (R,d,n)=(3,2,2),(3,5,6),(2,2,2) | Ranks 5<6;18=min(21,18);3=min(3,4) | Correct exceptions and variable shift | Consumer contract added |
