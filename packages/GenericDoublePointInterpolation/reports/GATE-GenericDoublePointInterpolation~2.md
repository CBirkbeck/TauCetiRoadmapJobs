## H01 (CBirkbeck) — answered

ArithmeticStatisticsPartV §3.28 at head `7f06cfc` still owns its interpolation theorem and ordinary/differential Horace programme in `TauCetiRoadmap/ArithmeticStatisticsPartV/README.md:1826` and `:1832`, duplicating this roadmap’s ownership boundary and complete d≥2 interface (`TauCetiRoadmap/GenericDoublePointInterpolation/README.md:50` and `:1625`; BO line 22). The ownership blocker remains unresolved: the companion must replace that programme and its local Needs entry with an import of this roadmap’s low-degree results and §1.4 adapter, retaining its Jacobian/minor selection, arithmetic exception exclusions and finite-fibre argument; the consumer is later in the merge order (position 128 versus 37), and changing it is outside this job’s two permitted content files.

## H02 (CBirkbeck) — applied

`TauCetiRoadmap/GenericDoublePointInterpolation/README.md:587` changes identification of “nonempty maximal-rank opens” to identification of maximal-rank loci with conditional transfer of nonemptiness; the new Check at line 596 computes ranks 5 for distinct plane supports and 3 for repeated supports, so neither rank-6 locus is nonempty. The determinant-d row transformation and its sign witnesses remain valid (BO line 132; COU line 182), and the other nonemptiness assertions retain their witness, nonexceptional-range or nonzero-pullback hypotheses.

## H03 (CBirkbeck) — answered

The pull-request description’s complete-supplier merge-order claim is false: `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:723` at `0b84954` explicitly consumes GroebnerGeometry G2/G4, whose open head is `163d43c`. This documentation issue remains unresolved because the pull-request description is outside this job’s edit scope: include GroebnerGeometry before AlgebraicModuliForArithmeticGeometry in the complete-roadmap order and delete the unrestricted no-other-author claim; the zero-problem section dependency check below does not certify that transitive complete-roadmap account.

---

**Verification and ownership.** The committed change is `36c9f96` and changes only `TauCetiRoadmap/GenericDoublePointInterpolation/README.md`; `Suggested.lean` is unchanged. Ownership searches covered main, board package documents, the indexed open roadmap heads and all 45 supplied sibling folders; the remaining competing double-point/Horace owner is the one identified in H01. No new construction or supplier was introduced. The existing owners remain AlgebraicVectorBundles L0B, DiophantineApproximationAndTranscendence §2.7, SchemeAndStackFoundations §§0.28, 2.6, 4.12, 5.12 and AlgebraicModuliForArithmeticGeometry §§1.1–1.2, 1.7, 2.1; the first-jet, residual, direction and Horace specializations are this roadmap’s interpolation development.

Supplier citations were read against main `b41e47b` and the indexed moduli head `0b84954`. Library searches used the manifest pins Mathlib `6b7abb3` and Tau Ceti `a91d3aa`: Mathlib’s support submodule/basis are in `Mathlib/RingTheory/MvPolynomial/Basic.lean:91`, `:95`, `:164`; the native definition bounds the sum of exponents, and imposes neither distinct supports nor characteristic zero. Euler’s identity is `Mathlib/RingTheory/MvPolynomial/EulerIdentity.lean:73`; square-zero multiplication, CRT, matrix rank, spectrum and grid inputs were read at these pins, rather than inferred from the citation resolver. Legal cached sources were read at BO lines 22, 127, 217, 245, 486, 514, 539, 628, 765, 798, 879, 908, 960; COU lines 179, 242, 255; VAK lines 14724, 23876, 23946, 28564. Stacks Lemma 10.78.2 was legally resolved and read at ST line 8610; no missing text remains. ST is an existing README citation absent from the source manifest, which this job does not permit editing; that manifest was not changed.

All 29 declarations were mechanically elaborated with `#check @name` in one scratch file and compared individually with the README. All needed field, characteristic-zero, injectivity, dimension, degree, nonzero-minor and nonzero-pullback hypotheses remain present; no signature or binder repair was needed. The only import remains `import Mathlib`; the unstatable projective headlines remain identified in the module docstring. Citation resolution found no missing cross-roadmap citations or roadmap identifiers; its cached main was `ae2562c`, so the explicit main and pin reads above supply the current-copy checks.

**Adversarial mathematics pass.** Each named README statement has a row below; API identities, boundary values and conventions are included with their defining statement. Ranks marked mod101 were actually computed at distinct integral lifts, including all incidence requirements for the seven subspace bases; full rank modulo 101 supplies a nonzero characteristic-zero minor. These instance computations do not prove the unbounded geometric induction or compatible-specialization theorem. The changed chart assertion was tested in characteristic zero, zero degree, characteristic 2, distinct and repeated supports, and with the wrong-sign transformation.

| Statement (README line) | Instances tried | Computed values on the two sides / negative control | Result | Change |
| --- | --- | --- | --- | --- |
| Binomial count of bounded monomials (243) | (r,d)=(0,2),(2,0),(2,2) | cardinalities 1,1,6 = choose(2,2), choose(2,0), choose(4,2); coordinatewise bound would give 9 | Agrees in these instances | None |
| Dimension of bounded polynomials (262) | k=Q; (r,d)=(0,2),(2,0),(2,2) | basis sizes and finranks 1=1, 1=1, 6=6 | Agrees in these instances | None |
| Coefficient coordinates (270) | r=1,d=3; f=2+3x²; zero ring | coordinates (2,0,3,0); reconstruction 2+3x²; over the zero ring both modules have one element | Agrees in these instances | None |
| Fixed-degree homogenization (292) | d=2, f=1+x; d=0; r=0,d=2 | H₂(1+x)=X₀²+X₀X₁; at X₀=1 gives 1+x; H₀(3)=3; H₂(1)=X₀²; H₂(x)H₁(1)=X₀²X₁=H₃(x) | Agrees in these instances | None |
| Homogeneous forms and twisting sections (316) | P¹,d=2, f=1+x; zero ring | section coordinates (1,1,0); chart section 1+x; zero-ring base is empty and both section modules are zero | Agrees in these instances | None |
| Coefficient Gram form (326) | f=2+x; x,y in degree 2; constants | G(f,f)=4+1=5; G(x,y)=0; G(x,x)=1; G(2,3)=6 | Agrees in these instances | None |
| First-jet algebra evaluation (360) | P=0; f=x,x²,3; P=3,f=x² | jets (0,1),(0,0),(3,0),(9,6); over F₂ last jet is (1,0) | Agrees in these instances | None |
| Kernel of one first jet (380) | r=1,P=0; every characteristic | 1 and x map to (1,0),(0,1); x² maps to (0,0); kernel (x²); r=0 gives kernel 0 and target k | Agrees in these instances | None |
| Distinct point ideals and their powers (388) | Q, points 0,1; Z, points 0,2 | x+(1−x)=1; x²(3−2x)+(x−1)²(2x+1)=1; over Z sum (x,2) has quotient F₂, so 1 is excluded | Agrees in these instances | None |
| Squared union ideal (398) | r=1; empty tuple; P=0; P=(0,1) | empty ideal top, quotient dimension 0; one support ideal (x²); two supports ideal (x²(x−1)²); repeated zero still (x²) | Agrees in these instances | None |
| Double-point quotient comparison (419) | r=1,P=(0,1); empty tuple | x(x−1) has jets (0,−1),(0,1), while its square has both jets zero; quotient dimension 4=2·2; empty dimensions 0=0 | Agrees in these instances | None |
| Length of distinct double points (439) | (r,n)=(2,1),(1,2),(2,0) | quotient basis sizes 3,4,0 = n(r+1); repeating P=0 twice gives 2 rather than 4 in r=1 | Agrees in these instances | None |
| Bounded first-jet evaluation (449) | r=2,d=1,P=0; d=0; f=x²,P=3 | matrix I₃ has rank 3; constant column (1,0,0) has rank 1; x² gives (9,6) | Agrees in these instances | None |
| Value projection (469) | P=(0,1), f=x; n=0 | values (0,1); the empty evaluation has target dimension 0 and kernel dimension d+1 in one variable | Agrees in these instances | None |
| Derivatives of vanishing polynomials (489) | r=1,P=0, f=x,x²; d=0 | values both 0; derivatives 1,0; constant value kernel is 0 | Agrees in these instances | None |
| Surjectivity through the value kernel (509) | r=1,P=0; d=0,1 | d=0: value rank 1, kernel-derivative rank 0, jet rank 1<2; d=1: ranks 1+1=2 and onto; n=0: 0+0=0 | Agrees in these instances | None |
| Monomial first-jet matrix (519) | r=n=d=1,P=0; r=n=1,d=0 | I₂ times (a,b) is (a,b); constant column (1,0); zero exponent derivative is 0, not x⁰ | Agrees in these instances | None |
| Full row rank criterion (539) | one origin in A²; d=0,1 | ranks 1<3 and 3=3; only the second jet map is onto | Agrees in these instances | None |
| Well-poised double points (547) | one point, d=0,1; seven collinear plane points, d=5 | ranks 1<3, 3=3, 11<21; permutation preserves these ranks; degree inclusion retains the degree-1 three basis columns | Agrees in these instances | None |
| Restriction to projective double points (567) | [1:0:0],d=1; [1:3],d=2 | sections 1,x,y restrict to I₃; X₁² in chart gives (9,6), exactly the affine jet | Agrees in these instances | None |
| Homogeneous partials and affine first jets (575) | F=X₀²+X₀X₁ and X₀X₁ at x=2; two plane supports; d=0; F₂,d=2 | (3,1)→(4,1), (2,1)→(2,1), det=2; wrong sign gives 6; distinct-pair ranks 5=5<6, repeated-pair ranks 3=3; degree-zero and F₂ square have value 1 but partials 0 | Old nonemptiness assertion fails | README lines 587–588 make nonemptiness conditional; line 596 adds the exceptional Check |
| Finite locally free pushforward of a line bundle (619) | B=k×k; base A=k[δ]/δ²; empty scheme; identity | underlying dimensions/ranks 2,2,0,1; nonflat quotient A→k sends A² to k², preserving rank 2 | Agrees in these instances | None |
| Relative generic smoothness (645) | A²→A¹ projection; x→x²; dual numbers; generic A¹ point | Jacobian ranks 1; 2x gives 1 off 0 and 0 at 0; in F₂ it is 0 everywhere; dual-number tangent dimension 1 versus dimension 0; generic local tangent 0 versus geometric tangent 1 | Agrees in these instances | None |
| Restriction rank of a finite scheme (673) | simple point,d=0; D=0; double point in A²,d=1 | restriction ranks 1,0,3 = min(1,1), min(0,length), min(3,3) | Agrees in these instances | None |
| Restriction rank on disjoint unions (693) | simple points 0,1 on A¹; D=span(1,x) | union rank 2; rank at 1 is 1 and rank at 0 of span(x−1) is 1; 2=1+1; D=0 gives 0=0+0 | Agrees in these instances | None |
| Cartier residual and trace (703) | A=k[t,x], I=(t,x), H=(t); flat A[y] and nonflat A/(x) | flat colon B, trace (x); nonflat I⊗B=B⊕B/(t), extended ideal (t)≅B; pulled trace k differs from new trace 0 | Agrees in these instances | None |
| Finite-scheme residual and trace (727) | A³,H=(z); full double, transverse (x,y,z²), tangent (y,z,x²), empty | lengths 4=1+3, 2=1+1, 2=0+2, 0=0+0 | Agrees in these instances | None |
| Castelnuovo dimension bound (747) | double origin in P²,H through origin,d=1; empty | rank 3≥1+2=3; kernel dimensions 0≤0+0; empty ranks 0≥0+0 | Agrees in these instances | None |
| Ordinary Horace criterion (759) | P²,d=2,q=1,u=1; q=2,u=2 negative control | trace/residual ranks 2+1=3=min(6,3); for q=2 trace length 4>3 but residual length 2<3, so the hypotheses fail and actual rank is 5<6 | Agrees in these instances | None |
| Independent subschemes (769) | P²,d=1 full double and simple subscheme; A¹,d=1, superscheme | ranks 3→1 with target lengths 3→1; source rank 2 remains 2 after a third support; zero target gives 0 | Agrees in these instances | None |
| Curvilinear criterion at one support (777) | double origin in A²; D=span(1,x,y) and span(1,x) | full rank 3 and every direction rank 2; deficient rank 2 has y-direction rank 1<2; D=0 fails even the simple rank 1 requirement | Agrees in these instances | None |
| Curvilinear reduction (785) | two doubled points in A¹; D=degree≤3, then degree≤2 | all directions give ranks 4=length 4 and 3<4 respectively; the second whole union is itself a failing curvilinear subscheme | Agrees in these instances | None |
| Universal length-two direction family (795) | A² at 0, quotients (dx,dy)→(1,0),(1,1); A¹; point; nonreduced base | ideals (y,x²),(y−x,x²), both length 2; A¹ has one direction per point, point has no direction; A⊕Aε has rank 2 and ε²=0 | Agrees in these instances | None |
| Rank in flat point families (821) | matrix [t]; t generic and 0 | ranks 1→0; rank≥1 locus D(t), rank≥0 all; specialization never raises 0 to 1 | Agrees in these instances | None |
| Proper limits of curvilinear failures (833) | constant vertical direction at moving point (a,t), H=(y); D=constants | generic and special direction lengths 2=2; restriction ranks 1=1<2; special trace/residual lengths 1,1 | Agrees in these instances | None |
| Exact integer rank witnesses (869) | matrix diag(1,2); d=2, F=X₀X₁ at (1,2) | det=2 mod101≠0, rank 2 over Q; Euler 1·2+2·1=4=2F; d=0,F=1 gives 0=0 with nonzero value | Agrees in these instances | None |
| Quadrics with prescribed singular points (877) | P¹,q=0,1,2,3; P²,q=2,3 | formula ranks 0,2,3,3; exact plane ranks 5=6−1 and 6=6−0; repeated plane supports give 3, showing genericity is needed | Agrees in these instances | None |
| Low-degree near-exception ranks (891) | all twelve specified configurations, computed mod101 | cubic ranks 9,10,20,30,35,120; quartic ranks 12,15,32,35,65,70, each equal to its stated target | Agrees in these instances | None |
| Veronese morphism and tangent spaces (901) | P¹,d=0,1,2; v=(1,1); polarization | d=0 images both [1]; d=1 identity; d=2 images (1,1,1) and (4,4,4) agree projectively; symmetric coefficient 2 pairs with 1/2 to give 1; chart derivative (1,0) | Agrees in these instances | None |
| Veronese tangents and double-point conditions (931) | P¹,d=2,v=e₀; d=1 | tangent span(e₀²,e₀e₁) has dimension 2; annihilator span(X₁²) dimension 1; d=1 tangent is whole 2-space and annihilator 0 | Agrees in these instances | None |
| Terracini span for the Veronese family (939) | P¹,d=2,q=1,2; q=4 spanning case | affine tangent ranks 2,3,3; projective secant dimensions 1,2,2; ranks equal dimensions plus 1 | Agrees in these instances | None |
| Plane singular-curve incidence (957) | F=x² or x, C=(x); lines and conics | x² has normal derivative 2x vanishing on C, multiplicity 2; x has derivative 1 and multiplicity 1; curve incidence bounds 2 and 5 points | Agrees in these instances | None |
| Contact curve in the defective plane case (977) | P²,d=2,q=2; d=4,q=5 | double line: rank 5<6, contact degree 1 and 2·1=2; double conic: mod101 rank 14<15, contact degree 2 and 2·2=4; q bounds 2≤2, 5≤5 | Agrees in these instances | None |
| Plane contact numerical reduction (999) | d=5,6,7,8,9,10 | critical floor versus maximal curve count: 7>5, 9=9, 12>9, 15>14, 18>14, 22>20; only 6 survives these cases | Agrees in these instances | None |
| Exact sextic plane critical ranks (1007) | q=9,10, computed mod101 | ranks 27=min(28,27), 28=min(28,30) | Agrees in these instances | None |
| Plane interpolation input (1015) | d=0,q=0,1,2; d=1,q=1; exceptions | ranks 0,1,1 and 3; exceptional mod101 ranks 5<6 and 14<15; nonexceptional neighboring ranks match the twelve-entry table | Agrees in these instances | None |
| Projectively distinct supports (1025) | e₀,e₁; e₀,2e₀; empty; singleton 0 | first family has two projective images; second has one since e₀=(1/2)(2e₀); empty predicate true; singleton zero false | Agrees in these instances | None |
| Three-subspace cubic base rank witnesses (1047) | r=5,6,7, computed mod101; incidence and frame dimensions verified | containment ranks 30,57,93; full ranks 56,84,120 equal column counts; remaining containment kernels 26,27,27 | Agrees in these instances | None |
| Three-subspace cubic recursion (1061) | r=5,6,7 bases; first induction r=8 | computed base kernels after singularities 0,0,0; for r=8, quadric dimension 45 and restriction count 3·choose(7,2)−3·choose(4,2)=45, leaving 0 | Agrees in these instances | None |
| Two-subspace cubic base rank witnesses (1069) | r=5,7, computed mod101 | containment ranks 20,66; full ranks 56,120; omitted outside-support lower bounds 36−18=18 and 54−30=24 | Agrees in these instances | None |
| Two-subspace cubic recursion (1083) | r=3 direct case, r=5,7 bases | two fixed point-subspaces plus three ambient supports give five general cubic doubles in P³, rank 20; computed bases rank 56,120; excluded r=4 cubic rank 34<35 | Agrees in these instances | None |
| One-subspace cubic base rank witnesses (1091) | r=5,7, computed mod101 | r=5 containment 10, double-support rank 55, transverse row gives 56; r=7 containment 35 and final rank 120; tangent transverse-row replacement adds 0 | Agrees in these instances | None |
| One-subspace cubic recursion (1105) | r=3,5,7,8 support arithmetic | on/outside/remainder counts (1,4,0),(3,6,2),(7,8,0),(9,9,3); transverse remainder traces 1 and 2 versus lengths 2 and 3 | Agrees in these instances | None |
| Cubic critical-count remainder (1113) | r=2,3,5,7,8 | (q,δ)=(3,1),(5,0),(9,2),(15,0),(18,3); lengths 3·3+1=10, 5·4=20, 9·6+2=56, 15·8=120, 18·9+3=165 | Agrees in these instances | None |
| Cubic maximal-rank input (1121) | r=2,q=3,4; r=4,q=6,7,8; mod101 | ranks 9,10 and 30,34,35; the omitted middle case has 34<35, while neighbors equal their maxima | Agrees in these instances | None |
| Quartic P⁵ critical rank (1131) | r=5,d=4,q=21, computed mod101 | rank 126=choose(9,4)=21·6 | Agrees in these instances | None |
| Horace trace-size inequality (1172) | r=2,d=4,q=3,5; r=3,d=4,q=8,9 | u,e=(−1,1),(2,1),(4,0),(5,1); re+u=1≤4,4≤4,4≤10,8≤10; 213071 bounded cases have zero failures | Agrees in these instances | None |
| Horace residual-size inequality (1180) | same four instances | residual lengths 9,6,16,12 ≥ N(r,d−2)=6,6,10,10; negative u remains an integer | Agrees in these instances | None |
| Large-dimensional quartic residual bound (1188) | r=10,d=4,q=91; q=0 boundary | u,e=(71,5), residual count 15≥11; q=0 gives (−29,4), count 25≥11 | Agrees in these instances | None |
| Nonnegative critical Horace data (1196) | r,d,q=(2,4,5),(3,4,8),(3,4,9); below-critical q=3 in plane | (u,e)=(2,1),(4,0),(5,1), identities 10=9+2−1,20=16+4,20=16+5−1; below-critical u=−1<e=1 is excluded | Agrees in these instances | None |
| Mixed residual rank in degree d−1 (1220) | r,d,q=(3,6,21),(3,4,8),(2,4,5) | full/deleted ranks 48→47=56−9; 16→16=20−4; 9→8=10−2 | Agrees in these instances | None |
| Injective residual restriction to H (1243) | r,d,q=(3,6,21) | Σ count 11; degree-4 source 35 versus 44 double conditions, so predecessor kernel 0; multiplying any putative kernel by H gives 0 | Agrees in these instances | None |
| Killing a residual system with simple points (1251) | D=span(1,x) on P¹ chart; empty D | evaluation at 0,1 is [[1,0],[1,1]], det 1, rank 2; zero system needs 0 points and has kernel dimension 0 | Agrees in these instances | None |
| Underfilled trace with simple remainder (1259) | r,d,q=(3,6,21); (3,4,8) | trace lengths 3·9+1=28=N(2,6); 3·4+0=12≤15; deleting the simple remainder gives 27 and 12 | Agrees in these instances | None |
| Moving supports and hyperplanes (1269) | A², δ(t)=(a,t), H_t=(y=t); t=0 and t=1 | full fibres basis 1,x−a,y−t, length 3 at both; restricted fibres basis 1,x−a, length 2 at both | Agrees in these instances | None |
| Compatible bad-incidence specialization (1289) | constant incidence; graph sv=t on face s=0; e=0 | constant saturation (0), prime (0) contracts to (0); graph specializes to (t), saturation by t gives (1) with no prime; e=0 requires rank<0, an empty locus | Examples discriminate the additional geometric target; no general proof claimed | None |
| Transverse curvilinear limit rank (1360) | r=3,d=6,q=21,u=9,e=1,f=1,g=0 | trace rank 27+1=28; residual rank 9+44+1=54; sum 82=4·20+2 | Agrees in these instances | None |
| Tangent directions in the moving residual (1368) | same data, f=0,g=1 | residual rank 9+44+2=55; trace rank 27; total 82=4·20+2, with tangent direction length 2 retained off H | Agrees in these instances | None |
| Underfilled differential Horace contradiction (1378) | same two splits f=1 or g=1 | mixed lower bound 54+28=82 or 55+27=82 contradicts bad bound <82 in each split | Agrees in these instances | None |
| Overfilled partial-length reduction (1386) | r=9,d=4,q=72; r=4,d=5,q=26 | first u,e,ν=(55,5,0), partial length 67·10+5·9=715=N; second (15,0,−4), ordinary branch since ν<0 | Agrees in these instances | None |
| Overfilled differential Horace contradiction (1394) | r=9,d=4,q=72,ν=0; f=0,g=5 | trace rank 9·55=495; residual rank 55+12·10+10=185; sum 680=10·67+2·5; filling partial length 715 implies full rank 715<720 target length | Agrees in these instances | None |
| Differential Horace induction step (1404) | r=3,d=5,q=14 | u,e=(7,0); predecessor ranks 21,28,20 give trace+residual 21+35=56=N(3,5)=4·14; no moving directions | Agrees in these instances | None |
| Univariate Hermite interpolation (1414) | F₂ and F₃, supports 0,1, d=0,1,2,3; Q,d=5,n=4 | computed ranks 1,2,3,4 in each finite field = min(d+1,4); rational rank 6=min(6,8); n=0 rank 0 | Agrees in these instances | None |
| Quartic P⁷ ordinary Horace input (1424) | q=41,42,u=30 | trace 210=210; residual lengths 118≤120 and 126≥120; totals 328=min(330,328),330=min(330,336) | Agrees in these instances | None |
| Quartic induction inputs (1432) | r=6,8,9 critical data; r=5 base | (q,u,e)=(30,21,0),(55,41,2),(71,54,4),(72,55,5); degree-2 residual counts 9,12,13,12 exceed r; r=5 rank 126 | Agrees in these instances | None |
| Exception-avoiding induction schedule (1440) | r=3..30,d=5..15, both critical counts | 384 critical cases, zero exceptional predecessor triples; (3,5,14) gives (2,5,7),(3,4,7),(3,3,7) | Agrees in these instances | None |
| Generic characteristic-zero double-point rank (1450) | r=1,d=5,q=0,1,4; r=2,d=5,q=7; r=0,q=2 negative control | ranks 0,2,6 and mod101 rank 21 = min(21,21); r=0 affine space has 1 point, so 2 supports cannot be injective | Agrees in these instances | None |
| Passing to the dense affine chart (1485) | [1:0],[1:1] in P¹; plane quadrics q=2 | distinct affine supports 0,1 have cubic rank 4=4; quadratic plane rank-6 locus is empty on projective space and chart, so existence hypothesis is essential | Agrees in these instances | None |
| Universal first-jet matrix (1497) | r=n=d=1; d=0; x² at T=3 | matrix [[1,T],[0,1]], determinant 1; d=0 derivative row 0; x² entries (9,6) | Agrees in these instances | None |
| Selected determinant (1519) | one point, columns 1,x and x,1; two supports 0,1 then 0,0 | determinants 1,−1; confluent cubic determinants 1,0; empty row/column determinant 1 | Agrees in these instances | None |
| Degree of a first-jet minor (1537) | one linear jet; two cubic jets; zero minor | degrees 0≤2,4≤12 for (T₂−T₁)^4, and totalDegree(0)=degreeOf(0)=0≤md | Agrees in these instances | None |
| Evaluation prime (1545) | k=Q, points 0,1; no coordinate variables | ideals (T),(T−1); T evaluates 0,1; 1 evaluates 1 in both; with no variables kernel 0 and one spectrum point | Agrees in these instances | None |
| Principal-open full-jet locus (1563) | Δ=1 and Δ=0; cubic confluent determinant at (0,1),(0,0) | D(1) all and rank 2 for one linear jet; D(0) empty; cubic Δ values 1,0 with ranks 4,2, so nonzero implies distinctness and onto | Agrees in these instances | None |
| Bounded integer specialization (1573) | r=n=d=1; empty tuple; inclusive-grid negative control | Δ=1 at P=0 with 0≤0≤2; n=0 gives Δ=1 and B=0; polynomial T(T−1) has values 0,0,2 on 0,1,2, so degree-2 grid must include 2 | Agrees in these instances | None |
| Nonzero maximal minor (1581) | r=n=1,d=5 | select columns 1,x: Δ=1, eval at 0 is 1, rank 2=min(6,2); another selection x²,x³ has Δ=T⁴ and evaluates 0 at 0 | Agrees in these instances | None |
| Generic affine Hermite interpolation (1589) | r=n=1,d=5; n=4 dimension failure | selected Δ=1 gives full rank 2 and nonempty D(1); n=4 violates 8≤6 and rank is 6, preventing surjectivity | Agrees in these instances | None |
| Polynomial parameter pullback (1597) | two cubic jets with θ=(0,u); constant collision θ=(0,0); empty parameter set | Δ∘θ=u⁴, degree 4; at u=1 determinant 1 and rank 4; collision pullback 0 violates hypothesis; no parameters and Δ=1 gives unique empty parameter tuple | Agrees in these instances | None |
| Special collinear configurations fail (1607) | P_i=(i,0),i=0..6,d=5 | exact rational rank 11=6+5, homogeneous rank also 11; expected full rank would be min(21,21)=21 | Agrees in these instances | None |

| Conventions: coefficients and universes | Zero ring, F₂, Q; no variables; empty index sets | Zero-ring modules contain only 0; r=0 bounded dimension 1; n=0 quotient dimension 0; finite parameter carrier can have a separate universe | Agrees with the native carriers and elaborated types | None |
| Conventions: maximal rank and exceptions | r=1,d=2,n=2; all five sporadic/plane exceptional counts | Rank 3=min(3,4) is injective but not onto; mod101 exceptional ranks 5<6,14<15,34<35,34<35,69<70 | Nonemptiness cannot follow from a coordinate change | H02 |
| Conventions: integer subtraction and zero polynomial | r=2,d=4,q=3; Δ=0 | Euclidean dividend −1 gives (u,e)=(−1,1), not natural u=0; degreeOf(0)=totalDegree(0)=0 | Existing integer and degree conventions exclude junk-value errors | None |
| Downstream full low-degree interface | (R,d,n)=(3,2,2),(3,5,6),(2,2,2); R=r+1 | Ranks 5<6, mod101 18=min(21,18), and 3=min(3,4); exceptions translate exactly by R=r+1 | Complete d≥2 contract retained | H01 companion import remains unresolved |
| Worked examples: determinant dimensions | Three-space cubic r=5,6,7; two/one-space r=5,7; sextics; quartic P⁵ | Computed ranks 56,84,120; 56,120; 56,120; 27,28; 126, matching the stated determinant sizes | Agrees in these instances | None |

**Build and gate.** `lake build TauCetiRoadmap.GenericDoublePointInterpolation.Suggested` exited 0, with 16 expected admitted-theorem warnings and no errors. Exact final build line:

```text
Build completed successfully (8976 jobs).
```

The mechanical signature elaboration exited 0. The first gate invocation exited 1 solely with `dirty=1` for the uncommitted README repair; after the required commit, the final gate exited 0. The dependency-direction check exited 0 with no UPWARD, CYCLE or moved line; its complete output was:

```text
depcheck: 46 roadmaps, 506 edges, 0 problem(s)
```

Final gate summary:

```text
gate GenericDoublePointInterpolation: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
