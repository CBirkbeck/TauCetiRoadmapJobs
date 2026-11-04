# Human-review response

## H01 (CBirkbeck) — answered

The competing ownership remains at ArithmeticStatisticsPartV head `7f06cfc`: `TauCetiRoadmap/ArithmeticStatisticsPartV/README.md:1825–1837`, §3.28, still specifies the complete interpolation theorem and ordinary/differential Horace programme; it must instead consume GenericDoublePointInterpolation §§1.4, 3.1–3.3 and 4.6–4.8, retaining the mixed-trace Jacobian, minor selection, arithmetic exception exclusion and finite-fibre argument there. `TauCetiRoadmap/GenericDoublePointInterpolation/README.md:50–55` and `:1647–1667` already give that boundary and the complete nonexceptional d≥2 interface with R=r+1, so no local repair is needed; the consumer edit is outside the two permitted files and this finding remains unresolved.

## H02 (CBirkbeck) — answered

The whole-roadmap prerequisite omission is confirmed: AlgebraicModuliForArithmeticGeometry head `0b84954`, `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:707–722`, §1.5, consumes GroebnerGeometry G2/G4, and its description explicitly requires the open GroebnerGeometry roadmap at `163d43c`; the GenericDoublePointInterpolation description still omits it and makes the unrestricted no-other-author claim. The description should put GroebnerGeometry before AlgebraicModuliForArithmeticGeometry and delete that claim, or expressly describe only the sections consumed here (§§1.1–1.2, 1.7, 2.1); the description and merge-order file are outside this job's edit scope, so neither was changed and this finding also remains unresolved.

---

**Verification scope and ownership.** No roadmap files changed and no commit was created. The two numbered findings above are the review's requested changes; its resolved findings and source-history correction were checked as supporting evidence. Main was checked at `63835771ae53669f03c706d3df5ed5605e046e3f`; the open-roadmap index covered 357 pull requests, including the supplied sibling heads, and the ownership search also covered the board packages. The relevant full-programme overlap is ArithmeticStatisticsPartV §3.28: GenericDoublePointInterpolation owns the interpolation library and Horace argument, while that consumer owns its arithmetic use. No ownership was moved, no supplier was added, and no consumer was made a supplier.

The direct contracts were resolved against main's AlgebraicVectorBundles L0B, DiophantineApproximationAndTranscendence §2.7, SchemeAndStackFoundations §§0.28, 2.6, 4.12, 5.12, and IntegralLattices Layer 0, and the specified AlgebraicModuliForArithmeticGeometry head §§1.1–1.2, 1.7, 2.1. The citation resolver reported no missing cross-roadmap citations or Lean names; its external-library limitation was handled by inspecting the pinned sources directly. Its section-level success does not establish a complete transitive whole-roadmap merge order.

**Sources.** BO line 22, Theorem 1.1, gives the full characteristic-zero exception list, with the plane, cubic and Horace inputs at BO lines 245, 481, 486, 514, 539, 765 and 798; these agree with the supplied d≥2 adapter after R=r+1. Visual examination of COU printed p.491 confirms d≥5 and r≥1 at COU line 172 and d≥5 at COU line 201; the text extraction's strict inequalities misread the printed glyphs, so the review's correction requires no roadmap edit. The geometric conventions were checked at VAK lines 14724, 23876, 23946 and 28564, and the finite-projective comparison at ST line 8610, tag 00NX; no unavailable source is needed for these replies.

**Pinned carriers and signatures.** The checked checkouts match Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. In `Mathlib/RingTheory/MvPolynomial/Basic.lean:164`, the native bounded carrier is `restrictSupport R { n | (n.sum fun _ e => e) ≤ m }`: it bounds total degree and includes zero, without a field or nontriviality requirement; its restricted basis is at line 95. In `Mathlib/Algebra/TrivSqZeroExt/Basic.lean:67`, the carrier is `R × M`, with square-zero multiplication at line 452; it supplies neither distinct-support hypotheses nor a CRT comparison. The required coprime-ideal CRT is `Ideal.quotientInfRingEquivPiQuotient` in `Mathlib/RingTheory/Ideal/Quotient/Operations.lean:248`; Euler's identity is in `Mathlib/RingTheory/MvPolynomial/EulerIdentity.lean:73`, and the finite product-grid theorem carries its domain and strict degree/cardinality hypotheses in `Mathlib/Combinatorics/Nullstellensatz.lean:62`.

The Tau Ceti total-degree inclusions and span API were inspected in `TauCeti/RingTheory/MvPolynomial/RestrictTotalDegree.lean:39`; relative differentials in `TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.lean:85`, the affine comparison in `TauCeti/AlgebraicGeometry/Modules/Differentials/Quasicoherent.lean:180`, and the residue-field tangent dual in `TauCeti/AlgebraicGeometry/TangentSpace/Basic.lean:65`. The latter does not itself give the relative differential at a geometric point, consistently with §2.0's explicit construction.

A scratch file containing `#check @name` for every one of the 29 declarations was elaborated once successfully after the targeted build. All 29 fresh types exactly match the supplied elaborated types after whitespace normalization and agree with their README statements: rings for the algebraic maps, fields for CRT and WellPoised, characteristic zero and the declared dimension/degree bounds for the generic results, rational carriers for the finite bases, and the independent parameter universe for parameterPullback; no binder or hypothesis changed or disappeared.

**Adversarial calculations.** Rows identify statements by their unchanged README line; the corresponding Lean declarations are included where applicable. Finite ranks below were recomputed over ℚ for the small affine cases and modulo 101 for the larger integer matrices, with support distinctness and the stated subspace incidences checked; a nonzero minor modulo 101 gives a characteristic-zero witness. These calculations test examples and quantifiers, not the unbounded geometric proofs. Every row has change “none”; no mathematical statement was added or changed.

| Statement | Instances tried and computed values on both sides | Result; change |
| --- | --- | --- |
| Conventions: total degree and empty carriers; Bounded, Monomials, monomialsFintype | (r,d)=(0,2),(2,0),(2,2): admissible counts 1,1,6 = choose(2,2),choose(2,0),choose(4,2); coordinatewise bound would give 9 in the last case. Zero ring has one polynomial although its formal monomial index still has 6 elements. | Matches; none |
| Conventions: JetRows and actual derivatives | (n,r)=(0,2),(2,2): 0,6 rows = n(r+1); x² at 3 has (value,derivative)=(9,6), and at 1 over 𝔽₂ has (1,0). | Matches; none |
| Conventions: projective dimension, length and maximal rank | Ambient A³ double length 4; hyperplane double length 3; n=0 quotient dimension 0; A¹, d=5,n=4 has rank 6 = min(6,8), with no surjectivity onto dimension 8. | Matches; none |
| Conventions: exceptional list and R=r+1 | Quadrics (R,d,n)=(3,2,2): rank 5<6; cubic (5,3,7): 34<35; quartics (3,4,5),(4,4,9),(5,4,14): 14<15,34<35,69<70. | Required exclusions retained; none |
| 243: binomial count | r=d=2 gives six exponents, slack exponents 2,1,1,0,0,0; both sides count 6. | Matches; none |
| 262: bounded dimension | r=2,d=1: basis 1,x,y has dimension 3 = choose(3,1); r=0,d=2 gives 1=choose(2,2). | Matches; none |
| 270: coefficient coordinates | 2+3x² at d=3 maps to (2,0,3,0); inverse sum is 2+3x²; zero maps to (0,0,0,0). | Matches both inverses; none |
| 292: fixed homogenization | H₂(1+x)=X₀²+X₀X₁; X₀=1 gives 1+x; H₂(x²)=X₁²=H₁(x)². At d=0, H₀(3)=3; in the zero ring all values are 0. | Matches; none |
| 316: forms and sections | At r=1,d=2, section X₀X₁ in the X₀ chart is x; degree zero constant 3 restricts to 3. | Matches chart normalization; none |
| 326: coefficient Gram form | G(x,y)=0, G(x,x)=1, G(2+x,2+x)=5, G(0,0)=0; coefficient norms give the same values. | Matches positivity and normalization; none |
| 360: jetAlgebra | At 0: X↦(0,1), X²↦(0,0), C3↦(3,0); (0,1)²=(0,0), distinguishing reduced and higher-order models. | Matches; none |
| 380: one-jet kernel | At 0 in k[x], x² and x³ have zero jets; x has derivative 1 and is outside (x²). This remains true in 𝔽₂. | Both kernel directions tested; none |
| 388: comaximal point ideals | Over ℚ at 0,1, x−(x−1)=1; modulo squared factors CRT target dimension is 4. Over ℤ at 0,2, the sum is (x,2) and 1 is absent. | Field hypothesis necessary; none |
| 398: doubleIdeal | n=1,P=0 gives (x²); n=0 gives top and quotient dimension 0; duplicated 0 still gives (x²), not quotient dimension 4. | Matches; none |
| 419: doublePointQuotient | At P=(0,1), x(x−1) has jets (0,−1),(0,1), nonzero but square zero; both quotient and product have dimension 4. Empty tuple gives dimension 0 on both sides. | Matches map and multiplication; none |
| 439: double-point length | r=2,n=1: basis 1,x,y gives 3=1·3; r=1,n=2: 4=2·2; n=0 gives 0. | Matches; none |
| 449: firstJetMap | At origin in A²,d=1, columns 1,x,y form I₃; d=0 gives rank 1<3; x² at 3 gives (9,6). | Matches; none |
| 469: value projection | At supports 0,1, x gives (0,1); at 0 it gives 0 while its derivative is 1; empty target has dimension 0. | Matches; none |
| 489: derivatives on value kernel | At 0,d=2, x and x² both have value 0 and derivatives 1,0; at d=0 the value kernel has dimension 0. | Distinguishes value vanishing from double vanishing; none |
| 509: value-kernel surjectivity | One support,d=1: value rank 1, derivative-kernel rank 1, full rank 2; d=0: ranks 1,0,1 and full target dimension 2. | Both iff directions agree; none |
| 519: firstJetMatrix | r=1,d=1,P=0 gives I₂; r=2,n=2,d=2 gives 6×6 matrix, rank 5 at (0,0),(1,0), rank 3 at repeated origin. | Matches actual matrix; none |
| 539: full row rank | At one A² support,d=1: rank 3=target dimension 3 and onto; at d=0: rank 1<3 and not onto. | Both iff cases; none |
| 547: WellPoised | One A² support,d=1 is onto (rank 3); d=0 is not (rank 1); empty tuple is onto the zero module (rank 0). | Matches; none |
| 567: projective restriction | At one origin and d=1, sections X₀,X₁,X₂ restrict to 1,x,y and produce I₃; at d=0 both maps have rank 1. | Matches trivialization; none |
| 575: homogeneous-partial adapter | d=2,x=2: [[2,−2],[0,1]](3,1)=(4,1), determinant 2; F=X₀X₁ gives (2,1)↦(2,1), while wrong sign gives 6 first. At d=0 or for X₀² in 𝔽₂ the partial rank is 0 versus affine value rank 1. | Nonzero d and characteristic zero retained; none |
| 619: finite locally free pushforward | B=k×k,M=B: rank 2, including base change to k[ε]/ε² and its nonflat quotient k; empty source gives rank 0; identity gives rank 1. | Matches all base changes tested; none |
| 645: relative generic smoothness | Projection A²→A¹: tangent rank 1, kernel dimension 1; x↦x² over ℚ: rank 1 off 0 and 0 at 0; over 𝔽₂ rank 0 everywhere. Dual numbers have tangent dimension 1 versus scheme dimension 0. | Hypotheses exclude negative controls; none |
| 673: restriction rank | Simple point with constants: 1=min(1,1); zero system: 0; A² double with linear forms: 3=min(3,3). | Matches rank, not ambient length alone; none |
| 693: disjoint rank identity | Values at 0,1 on span(1,x): total rank 2=1+1; constants only: 1=1+0. | Both full and proper systems; none |
| 703: Cartier residual sequence | I=(t,x) in k[t,x], after adjoining y: colon is whole ring, trace is (x); after quotient by x: I⊗k[t]=k[t]⊕k[t]/(t), versus image ideal (t)≅k[t], and trace pullback k versus new trace 0. | Flat hypothesis excludes mismatch; none |
| 727: finite residual and trace | Double origin in A³: 4=1+3; transverse direction (x,y,z²): 2=1+1; tangent direction (y,z,x²): 2=0+2; empty: 0=0+0. | Matches orientation; none |
| 747: Castelnuovo bound | A² double,d=1, H=(y): residual rank 1 and trace rank 2, total rank 3≥1+2=3. Empty scheme gives 0≥0+0. | Matches; none |
| 759: ordinary Horace | A¹,d=3,q=2,u=1: trace 1/1 and residual 3/3 give rank 4=min(4,4); q=3 gives residual length 5, rank 3, total 4=min(4,6). | Both inequality directions; none |
| 769: independent subschemes | A¹,0 and 1,d=3: four jets have rank 4; deleting one derivative leaves rank 3 on length 3. At d=2 full rank 3 is injective and remains 3 on adjoining supports. | Surjective and injective monotonicity; none |
| 777: one-support curvilinear criterion | A² double, D=span(1,x,y): rank 3, every directional quotient rank 2; D=span(1,x): rank 2<3 and y-direction quotient rank 1<2. | Positive and negative direction tests; none |
| 785: curvilinear reduction | Two A¹ doubled supports,d=3: rank 4=length 4; d=2: rank 3<4, witnessed by the union of the two length-two components. | Both iff cases; none |
| 795: direction family | At A² origin, (dx,dy)↦(1,0),(1,1) give ideals (y,x²),(y−x,x²), each length 2; rank-zero cotangent gives empty P(0), while A¹ has one direction; over k[δ]/δ², rank remains 2. | Quotient convention and nilpotents agree; none |
| 821: rank in families | Matrix [t] has rank 1 for t≠0 and 0 at 0; rank≥1 locus is D(t), whereas rank≥0 is the whole base. | Correct specialization direction; none |
| 833: proper limits | D=span(1,x), support (0,t), vertical length-two direction: generic and special restriction ranks both 1<2, with length 2 throughout. | Failure persists in a proper direction parameter; none |
| 869: integer rank lifting and Euler | A 1×1 matrix [2] has rank 1 modulo 101 and over ℚ; zero determinant gives rank 0. For X₀X₁ at (1,2), Euler gives 1·2+2·1=4=2·2; degree 0 gives 0=0 without forcing F=0. | Correct nonzero-degree use; none |
| 877: quadraticDoublePointRank | r=1,q=0,1,2,3 gives ranks 0,2,3,3; r=2,q=0,1,2,3,4 gives 0,3,5,6,6; r=7,q=7,8,9 gives 35,36,36, exactly the formula with min(q,r+1). | Correct saturated count; none |
| 891: nearExceptionRanks | Cubic ranks recomputed 9,10,20,30,35,120; quartic ranks 12,15,32,35,65,70, equal to all twelve declared targets and dimensional maxima. | Witnesses found; none |
| 901: Veronese and normalization | [1:1]↦[1:1:1], [2:2]↦[4:4:4]; d=0 maps both coordinate points to [1]; cone coordinates (1,2,1) pair with mixed weight 1/2 to give 1. | Scaling, constant boundary and pairing agree; none |
| 931: Veronese tangents | At e₀,d=2,r=1, derivative image span(e₀²,e₀e₁) has dimension 2; annihilator span(X₁²) has dimension 1=3−2 and double-point rank is 2. | Matches; none |
| 939: Terracini | Conic q=1 has affine tangent rank 2, projective tangent dimension 1; q=2 has affine rank 3, secant dimension 2. | Cone/projective shift is 1; none |
| 957: plane incidence | x² singular on x=0 gives multiplicity 2 and 2·1=2; x has derivative 1. Line incidence permits 2 general points, conics 5, matching ℓ(ℓ+3)/2. | Positive and negative models; none |
| 977: defective plane contact | Quartic at five general plane points: rank 14<15; doubled conic has ℓ=2, 2ℓ=4 and q=5=ℓ(ℓ+3)/2; source incidence dimension 14 exceeds secant dimension 13 by 1. | Matches contact example; none |
| 999: plane contact numerical bound | d=5,6,7,8: floor(N/3)=7,9,12,15, while maximal ℓ(ℓ+3)/2=5,9,9,14; among 5≤d≤100 only d=6 survives. | Samples match; not unbounded proof; none |
| 1007: sexticPlane | q=9,10: recomputed ranks 27,28 = min(28,27),min(28,30). | Witnesses found; none |
| 1015: planeDoublePointRank | d=0 gives rank 1 at one support; d=1 gives 3; d=2,q=2 has rank 5<6 and is excluded; d=4,q=5 has 14<15 and is excluded; neighboring ranks are 12,15. | Exceptions and degree-zero range agree; none |
| 1025: ProjectivelyDistinct | e₀,e₁: independent rank 2; e₀,2e₀: proportional rank 1, c=1/2; empty predicate true, zero singleton false, e₀ singleton true. | Correct projective rather than vector distinction; none |
| 1047: threeSubspaceCubicBases | r=5,6,7: containment ranks 30,57,93; full ranks 56,84,120 = choose(r+3,3); vector dimensions 3,4,5, pair intersections 0,1,2 and triple intersection 0. | Incidences and full ranks attained; none |
| 1061: three-space recursion | Base r=7 has kernel 120−120=0; at next r=8 the coefficient dimensions are N(8,3)=165=N(7,3)+N(8,2)=120+45; the proof's quadric kernel is required to be 0, as BO line 500 specifies. | Dimension identity matches; general kernel result remains a target; none |
| 1069: twoSubspaceCubicBases | r=5,7: containment/full ranks (20,56),(66,120); containing dimensions 36,54. Removing outside doubles leaves at least 36−18=18,54−30=24. | Incidences and full ranks attained; none |
| 1083: two-space recursion | r=6: on each space r−2=4 supports, specialize r−5=1 and retain 3; three ambient supports enter the third space, leaving nine supports for the three-space kernel. Dimension count 45=27+18 agrees with BO line 529. | Counts match recursion; none |
| 1091: oneSubspaceCubicBases | r=5: containment rank 10, doubles rank 55, transverse remainder rank 56; r=7: 35,120,120. In r=5 η has length 2, trace 1, residual 1; tangent remainder would add 0 normal conditions. | Transverse condition supplies the missing rank; none |
| 1105: one-space recursion | r=5: (r+1)(r−2)/6=3 on-space, r+1=6 outside, δ=2, trace 1; r=7: r(r−1)/6=7 on-space, 8 outside, no remainder. | Matches the two base branches; none |
| 1113: cubic remainder | r=2,3,5,6,7,8: (q,δ)=(3,1),(5,0),(9,2),(12,0),(15,0),(18,3); (r+1)q+δ=10,20,56,84,120,165=N(r,3). | Modulo-three normalization agrees; none |
| 1121: cubicDoublePointRank | r=4,q=6,7,8: ranks 30,34,35 versus expected 30,35,35; only q=7 is excluded. | Both neighboring counts supplied; none |
| 1131: quarticFive | r=5,d=4,n=21: target 126=choose(9,4)=21·6; sampled modular ranks 125 then 126. The full-rank tuple is the witness, not every tuple. | Full-rank witness found; none |
| 1172: trace inequality | (r,d,q)=(3,6,21) gives (u,e)=(9,1), left 12≤21; (2,4,3) gives u=−1,e=1 and 1≤4. | Integer division, including negative quotient, agrees; none |
| 1180: residual inequality | Same tuples: 35≤44 and 6≤9; (2,4,5) gives equality 6=6. | Matches; none |
| 1188: large quartic residual | r=10,d=4,q=91: u=71,e=5 and q−u−e=15≥11; r=9,q=71 gives 13≥10 but no extrapolation below the stated bound is used. | Boundary consistent; none |
| 1196: critical nonnegativity | (2,4,5): u=2≥e=1; (3,4,8),(3,4,9): (u,e)=(4,0),(5,1). Below critical, (2,4,3): u=−1<e=1. | Critical-range hypothesis discriminates; none |
| 1220: mixed residual rank | (3,6,21): full lower-degree rows 48≤56, delete one normal row to obtain rank 47=56−9; (3,4,8): 16=20−4; (2,4,5): 8=10−2. | Independence supports deletion; none |
| 1243: residual restriction injectivity | (3,6,21): degree-4 source dimension 35, Σ doubled conditions 44, so predecessor maximal rank leaves kernel 0; for quartic P⁷ seven coordinate supports leave quadratic kernel 1, eight leave 0. | Predecessor and spanning conditions discriminate; none |
| 1251: simple-point killing | Two-dimensional system span(1,x) on A¹: evaluation at 0,1 is [[1,0],[1,1]] with determinant 1; zero system needs 0 points. | Exact u conditions; none |
| 1259: underfilled trace | (3,6,21): ru+e=28=N(2,6); deleting the simple remainder leaves 27 independent double-point rows. | Full and subcollection counts agree; none |
| 1269: moving families | δ(t)=(a,t), H_t=(y=t): fibres have doubled length 3 and restricted length 2 at t=0 and t≠0. | No reduction at the special fibre; none |
| 1289: compatible bad-incidence target | Product incidence I=0: face and saturation remain 0 with contraction 0. Graph s·v=t on s=0: ideal (t), saturation by t is (1), hence no prime. e=0 requires rank<0, an empty locus. | Positive/negative controls distinguish the added geometric target; no claim it follows from properness; none |
| 1360: transverse limit rank | (3,6,21), f=1,g=0: trace 28, residual 54, sum 82; local transverse lengths 1+1=2. | Matches selected trace and residual subset; none |
| 1368: tangent residual rank | Same tuple, f=0,g=1: residual 55, trace 27, sum 82; tangent direction has special trace length 2 and residual 0, so its length-2 residual contribution is evaluated off H. | Correct mixed parameter, not special residual; none |
| 1378: underfilled contradiction | Both preceding choices give 82=(r+1)(q−e)+2e=4·20+2, contradicting the proposed strict rank bound <82. | Arithmetic matches conditional argument; none |
| 1386: overfilled partial length | r=9,d=4,q=72: u=55,e=5,ν=0; length 67·10+5·9=715=N(9,4), versus full doubled length 720. | Selected trace length correct; none |
| 1394: overfilled contradiction | Same tuple, F empty,G of size 5: trace 495, residual 185, sum 680=67·10+2·5; compatible bad rank would be <680. Full partial scheme length is 715. | Curvilinear test length distinguished from full length; none |
| 1404: differential step | r=3,d=6,q=21: predecessors (2,6,9),(3,5,12),(3,4,11); their expected ranks 27,48,35 and target rank 84. | Counts and degree decrease agree; general geometric step remains a target; none |
| 1414: univariateHermiteRank | At supports 0,1 over 𝔽₂, d=0,1,2,3,4 gives 1,2,3,4,4=min(d+1,4); over ℚ, supports 0,1,2,3 at d=5 give 6=min(6,8). | Includes characteristic two and overfilling; none |
| 1424: quartic P⁷ ordinary Horace | q=41: trace 210,residual 118,total 328=min(330,328), kernel 2; q=42: 210+120=330=min(330,336). Seven coordinate supports leave singular quadric X₇², eight kill it. | Restriction-kernel repair retained; none |
| 1454: quarticDoublePointRank | r=6,q=30: (u,e)=(21,0); r=8,q=55: (41,2); r=9,q=71: (54,4); source dimensions 210,495,715 and target row counts 210,495,710. | Initial schedule agrees; none |
| 1462: exception avoidance | 2,655 distinct critical tuples for 2≤r≤80,4≤d≤30 satisfy the inequalities; no exceptional predecessor in the checked r≥3,d≥5 schedule. At (3,5,14), predecessors (2,5,7),(3,4,7),(3,3,7) are all nonexceptional. | Finite check, not proof of unbounded schedule; none |
| 1472: genericDoublePointRank | r=1,d=5,q=0,1,4: ranks 0,2,6=min(6,0),min(6,2),min(6,8); r=0,q=2 admits no injective tuple. | r≥1 and existential genericity necessary; none |
| 1507: dense affine chart | In P¹,d=1, affine supports 0 and 1 give value/jet rank 2, matching the two-dimensional homogeneous source; the affine chart itself contains both supports. | A rank witness meets the chart; none |
| 1519: universalJetMatrix | r=n=d=1 gives [[1,T],[0,1]], evaluation at T=3 gives [[1,3],[0,1]]; x² column in d=2 specializes to (9,6). | Specialization agrees; none |
| 1541: selectedMinor | Ordered columns (1,x) give 1; swapped columns give −1. Two univariate supports 0,1 with degree 3 give determinant 1; repeated 0 gives 0. | Sign and diagonal controls; none |
| 1559: minor degree | n=r=1,d=2, columns x,x² give Δ=T²: total/individual degree 2≤md=4. Zero minor has degree 0≤4; empty minor is 1 of degree 0. | Total-function zero degree handled; none |
| 1567: evaluationPrime | At P=0, T evaluates 0 and 1 evaluates 1; at P=1, T evaluates 1 and T−1 evaluates 0; with no coordinates the kernel is 0 in k. | Correct kernels and domains; none |
| 1585: principal-open full jets | Δ=T² at T=1 gives value 1, rank 2=target dimension 2 and membership in D(Δ); T=0 gives value 0 and no membership for this chosen minor. Empty minor 1 gives the whole spectrum. | Both membership directions; none |
| 1595: integerGridForMinor | Same Δ=T² has B=4, witness T=1 in {0,…,4}, value 1 and rank 2; n=0 gives Δ=1,B=0 and the unique empty tuple. | Inclusive box and empty indices; none |
| 1603: nonzero maximal minor | r=n=1,d=5: columns 1,x give Δ=1≠0, m=2≤N=6; choosing 1,x² gives Δ=2T and evaluation 0 at T=0, so not every selected minor is a witness. | Existential choice required; none |
| 1611: genericAffinePrincipalOpen | r=n=1,d=5, Δ=1 gives D(1) and rank 2 at T=0; n=4 gives 8>6, outside the full-row-rank endpoint. | Endpoint inequality discriminates; none |
| 1619: parameterPullback | Two supports θ=(0,t),d=3: Δ∘θ=t⁴, degree bound 4, u=1 has value 1 and rank 4; constant θ=(0,0) gives pullback 0, excluded by hΔ. Empty parameter set with Δ=1 has unique assignment and value 1. | Nonzero pullback and empty parameters handled; none |
| 1629: collinear counterexample | Seven supports (i,0),0≤i≤6,d=5: exact rational rank 11=6+5<21; row count and column count both 21. | Refutes universal distinct-tuple surjectivity; none |
| Downstream d≥2 adapter | (R,d,n)=(3,5,6) gives 18=min(21,18); (2,2,2) gives 3=min(3,4); (3,2,2) gives 5<6 and is excluded. Euler row determinant at degree 2 is 2. | Complete range and R=r+1 agree; none |

**Dependency-direction output (exit 0).** No UPWARD, CYCLE or moved line was emitted.

```text
depcheck: 50 roadmaps, 580 edges, 0 problem(s)
```

**Build outcome.** `lake build TauCetiRoadmap.GenericDoublePointInterpolation.Suggested` exited 0; the only warnings were the 16 admitted theorem declarations using `sorry`.

```text
Build completed successfully (8976 jobs).
```

**Gate summary (exit 0).**

```text
gate GenericDoublePointInterpolation: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
