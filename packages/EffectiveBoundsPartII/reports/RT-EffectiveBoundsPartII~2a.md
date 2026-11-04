<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1411#issuecomment-6395275955 -->
Red team round 2 pass a (codex) of 2ceb0e0

Verdict: accepted

No new package finding has been established. The two counting results remain conditional on the declared isolated-affine-Bézout supplier contract.

## Earlier findings: repair verification

| Earlier finding | Status at this head | Repaired passage and witness |
| --- | --- | --- |
| r1a F01: both counting headlines absent | Repaired | `packages/EffectiveBoundsPartII/Suggested.lean:148,163` declares `bounded_systems_field_class_bound` and `discriminant_field_class_bound`. The module says “All six are statable at the pins.” The finite families carry actual field instances, pairwise nonisomorphism, and bounded systems or exact degree/discriminant hypotheses. Full numerical tests follow below. |
| r1b F01: discriminant headline absent | Repaired | `packages/EffectiveBoundsPartII/Suggested.lean:159` now says “One absolute constant bounds every finite family of pairwise nonisomorphic number fields”. Taking representatives of the finite class set gives the original count; injecting any such family gives the converse. For degree 2 and cutoff 3, both counts equal 1. |
| r1b F02: running-head locator | Repaired | `packages/EffectiveBoundsPartII/README.md:657` now cites “COU20 line 20, Theorem 1, p.487; proved at lines 381–425”. Verified against COU20 line 20 and lines 381–425; line 420 is only a running head. The worked example now cites lines 421–430. |
| r1b F03: corrupted morphism words | Repaired | README line 3 now says “unweighted number Nₙ(H) of ℚ-isomorphism classes”; the mathematical map symbol remains φ. The complete scan finds zero in-word φ substitutions; six standalone φ symbols remain. |

## Verified sound

Read all 790 README lines and all 174 Suggested.lean lines, and both repository rules. Coverage: **11 Lean declarations (six theorems, five definitions/abbreviations), 26 numbered targets, 58 API bullets, 100 Checks, four bold worked examples, and 39 COU20 citation paragraphs (including all 26 primary target locators)**. The computation ledgers below include the conventions and negative controls. Each retained definition has at least three discriminating README Checks. The six headline theorems are §§0.5, 1.2, 4.2, 5.2, 5.5 and 5.6; all six appear in Lean.

### Lean declarations and actual contexts

All names belong to `TauCetiRoadmap.EffectiveBoundsPartII`. There are no section `variable` or `include` blocks. I compared all eleven supplied elaborated signatures with the source and README. Field and NumberField instances survive, including the dependent instances for both counting families. No Lean process was run. “Range” below means r≥1, d≥5 and M=choose(d+r,d)≥n(r+1); a number field has n≥1 and δ≥1.

| Declaration; layer; Suggested.lean line | Variables and instances actually retained | Instances and computed sides | Result / change |
| --- | --- | --- | --- |
| exists_short_integral_basis; 0; 28 | K:Type u, Field K, NumberField K; basis indexed by Fin n | ℚ: house(1)=1=δ²; ℚ(i): houses 1,1≤4; ℚ(√5): houses 1,√5≤5, integral index 2 | Sound on these tests; no change |
| exists_bounded_first_jet_generators; 1; 39 | K, Field, NumberField, r,d and all three Range assumptions; actual ring embeddings K→ℂ | ℚ,r=1,d=5,u=0: M=6,D=10, house 0≤10, (1,X) jet determinant 1. √2: u=(0,1), D=20, house √2≤320; four-column confluent determinant at ±√2 is (2√2)^4=64 | No arbitrary data or missing instance; no change |
| jacobianPolynomial; 4; 65 | implicit r; E:Fin r→MvPolynomial (Fin r) ℤ | (X,Y) gives 1; (Y,X) gives −1; X² at 3 gives 6; r=0 gives 1 | Native determinant fixes equation-row convention; no change |
| JacobianOpenAlgebra; 4; 72 | same r,E; rational quotient localized at actual determinant | X²−2 gives ℚ(√2); X² gives zero; X(X−1) gives ℚ×ℚ; r=0 gives ℚ | Singular factor removed, empty product allowed; no change |
| HasBoundedModel; 4; 81 | K:Type u, Field, NumberField; r,d:ℕ,H:ℝ; integral κ, E, actual compatible surjection and étaleness | ℚ,E=X,κ=0,r=d=H=1: degree 1, height 1, J=1, map=id. E=X²,κ=0 fails 0≠0. r≥1,H<0 fails coefficient inequality 0≤H outside support; r=0 can hold for ℚ even when H<0 | Definition determines the map via polynomial compatibility; no change |
| explicitCoefficientBound; 4; 103 | n,r,d:ℕ,δ:ℝ; no standing arithmetic assumptions | B(1,1,5,1)=5^(5/2)√6·10⁵≈13693063.9376; δ→2δ multiplies by 1024. B(0,1,5,1)=6^0√6·0⁵=0; B(1,0,0,1)=1 | Total junk values excluded by existence theorem; no change |
| exists_explicit_small_model; 4; 112 | K, Field, NumberField, r,d, Range | ℚ,E=X at 0: 1≤13693063.9376. √2,E=X²−2,r1,d5: degree 2≤5,height 2≤4√6·40⁵·8⁵,J=2√2 | Same point, equations, determinant and component map; no change |
| centralBinomialRank; 5; 126 | n:ℕ; positive admissible indices in sInf | n=0,1,2,14,15,42,43 give r=1,1,2,4,5,5,6; Catalan values at r=1,…,6 are 1,2,5,14,42,132 | Set nonempty, no accidental index 0; no change |
| exists_logarithmic_small_models; 5; 132 | ∃Q≥3 precedes every K:Type u and both instances; threshold n>Q; r fixed by n | n15 gives r5,M252,ℓ237, log B=90.0488785781+10logδ. n1 would require 1≤Qlog1=0 and is excluded | Constant and variable count have required uniformity; no change |
| bounded_systems_field_class_bound; 5; 148 | r,d,C,m:ℕ,r,d≥1; K:Fin m→Type u; every Field/NumberField instance; pairwise absence of AlgEquiv; actual bounded E and surjective map | Two distinct quadratic factors of X⁴−5X²+6: 2≤13⁵·4=1485172. Two ℚ copies fail hsep; one satisfies 1≤54. C0 forces zero algebra, so m=0; empty family 0≤d^r | Repaired headline is the full unweighted bound; no change |
| discriminant_field_class_bound; 5; 163 | ∃Q≥3 before n,H,m,K and dependent instances; exact degree, inclusive absolute discriminant, pairwise nonisomorphism | H1,n>1 forces m0: 0≤n^(Qnlog³n). n2,H3 has one class and maximum family size 1; this tests equivalence, outside n>Q. S₃ cubic has three embedded copies but only one allowed representative | Full counting conclusion, not an assumed bound; no change |

No theorem passes the one-tactic padding probe: the first two require successive minima and arithmetic generic interpolation; explicit models require the relation-lattice argument; logarithmic models require uniform parameter estimates; the two counts require finite geometric factors and the isolated-point bound. None merely unfolds a definition, computes a boundary value or applies one pinned theorem. All five definitions have real bodies and are used by these headlines. All eleven own names occur in the README, and every backticked own name denotes one of them.

### Numbered README targets

Each row records the actual statement under its hypotheses, including failures of plausible weakened versions. All locators in the source column were read in the published COU20 extraction; rendered pages additionally fix the inequality glyphs and the tensor-product misprint.

| Target; README line | Instances and computed sides | Source locator | Result / change |
| --- | --- | --- | --- |
| 0.1 weighted canonical measure; 100 | ℚ: interval volume 2=2¹. ℚ(i): scale determinant 2, disk measure 2π≥4; z1 has house 1 and g-norm √2 | COU20 line 104, §2 p.489 | Correct pairing/measure distinction; none |
| 0.2 discriminant covolume; 127 | ℚ(i): Gram diag(2,2), determinant 4, canonical covolume 2 versus product 1. √5: rational basis discriminant20 versus field5 | COU20 line 127, §2 p.490 | Actual integral basis required and present; none |
| 0.3 short half-family; 145 | ℚ: product 1≤1. n4,m3: exponent4/(2·2)=1; n5,m3:5/(2·3)=5/6≤1; both 2m>n | COU20 line 140, §2 p.490 | Correct tail and strict majority; none |
| 0.4 product span; 173 | K=k,V=K: dim products1=dimK. Quadratic,V=k: 2dimV=n but products dim1<2. Inseparable 𝔽₂(t)/𝔽₂(t²),V=K: 1,t span dim2. k⁴,V=k³×0: 6>4 but products dim3<4 | COU20 line 150, §2 p.490 | Finite field extension, not arbitrary algebra; none |
| 0.5 short rational basis; 192 | ℚ:1≤1; ℚ(i):1,1≤4; √5:1,√5≤5 with index 2 | COU20 line 161, Proposition 1 p.490 | No maximal-order-basis overclaim; none |
| 1.1 parameter equivalence; 222 | α=(1,√5): embedding determinant −2√5; u=(0,1) gives √5; zero u gives0; α=(1,1) determinant 0 | COU20 line 207, §3 p.492 | Inverse over ℂ, not ℤ; none |
| 1.2 bounded first jets; 251 | ℚ,r1,d5: M6,D10,u0 gives minor1. Repeated quadratic supports give rank 2<4. Degree2 grid polynomial T(T−1): values 0,0,2. Seven collinear quintic jets: rank 6+5=11<21 | COU20 line 242, §3 p.492 | Correct D+1 grid over ℂ and genericity; none |
| 1.3 value descent; 272 | κ=√2: value span dim2. κ=√5: rational dim2, integral index 2. κ0 in quadratic: dim1<2 | COU20 line 249, §3 p.492 | No integral surjectivity claimed; none |
| 2.1 relation kernel; 302 | κ=√2,d3: rank 4−2=2, relation Gram diag(5,5). κ0 in quadratic,d2: actual kernel rank 2 versus false M−n=1. d0 gives kernel 0 | COU20 line 255, §3 p.493 | Full value-rank assumption retained; none |
| 2.2 transpose index; 333 | √5,d2: q2,covolL=√26,covolS=2√26. Abstract z↦2z: kernel covol1, transpose covol2; ratio2=index 2 | COU20 line 269, §3 p.493 | Index and inequality direction correct; none |
| 2.3 Gram/discriminant; 362 | √5,d2: detBBᵗ104,detVV*520,520/5=104. ℚ(i):4/4=1; without conjugation numerator −4 | COU20 line 278, §3 p.493 | Conjugation and basis normalization correct; none |
| 2.4 monomial height; 382 | r2,d2,C₀1: M6,H₀1,G6. n2,r1,d5: C₀40δ²,H₀40⁵δ¹⁰,G6·40¹⁰δ²⁰. κ0 retains constant 1 | COU20 line 291, §3 pp.493–494 | C₀≥1 handles constants; none |
| 2.5 covolume bound; 402 | √5,d2: √26≤√(520/5)=2√26. κ0 overℚ,d2: covolL1=√(1/1) | COU20 line 309 and line 285, §3 pp.493–494 | Discriminant denominator retained; none |
| 3.1 short relations; 432 | √2,d3: two orthogonal relation norms √5, product 5≤2·covolL=10. Intrinsic line unit volume2 versus ambient planar area 0; dimension 2 cube area2≤π | COU20 line 323, §3 p.494 | Correct intrinsic measure and independent witnesses; none |
| 3.2 truncation; 460 | n2,ℓ4: k3,codim 1,tail 2. Norms1,2,4,8 give product 64=4²·4 and retained max4≤8; n1 discards0 | COU20 line 330, §3 p.494 | Exactly n−1 removed; none |
| 3.3 all gradients; 480 | At0,d1: X↦1; d0: kernel 0 and derivative rank 0. At0,1,d3: derivative columns(−1,1),(0,1), determinant−1 | COU20 line 342, §3 p.494 | Full first jets, not just values, are used; none |
| 3.4 full block; 498 | Diagonal ℂ⊂ℂ²: codim 1,ranks1,1. Hyperplane in ℂ⁴: codim 1,ranks1,2. Zero in ℂ²: codim 2,ranks0,0 | COU20 line 343, §3 p.494 | Strict codimension is necessary; none |
| 3.5 common minor; 518 | X²−2: values±2√2; θ³2: norm(3θ²)=3³·2²=108; X² at 0: derivative 0 | COU20 line 349, §3 p.494 | Same integer minor works without normality; none |
| 4.1 component map; 548 | X²−2: (2√2)(√2/4)=1. Product quadratics: two factors; X²: zero localization. Dual numbers:2ε≠0 but (2ε)²=0, not a unit | COU20 line 354, Proposition 2 p.495 | Unit condition and actual compatible map correct; none |
| 4.2 explicit model; 588 | ℚ,E=X: height 1≤13693063.9376. Plane E=(X(X−1),XY): J=X(2X−1),J(1,0)=1; entire line X0 removed | COU20 line 354, Proposition 2 p.495 | Only the Jacobian open is asserted finite; none |
| 5.1 least rank; 628 | Catalan 1,2,5,14,42; r1=1,r2=2,r14=4,r15=5. n15:90≤252≤360. n1:1>3log1=0 | COU20 line 385, equation (1) p.495 | Eventual qualifiers and minimality correct; none |
| 5.2 logarithmic model; 657 | n15:r5,M252, logB=90.0488785781+10logδ. δ1 deletes the last term. Leading log orders are (logn)² and logn·logδ | COU20 line 20 and lines 381–425, pp.487,495–496 | Repaired locator supports the statement; none |
| 5.3 integer systems; 677 | r0:0 slots,1 tuple; d0:r slots; C0:1 tuple. r2,d2:12 slots versus wrong18 | COU20 line 425, §4 p.496 | Ordered native systems, not new polynomial carrier; none |
| 5.4 box size; 707 | r1, d2, C1:3³=27; r2,d0,C1:3²=9; r0,C0:1⁰=1; B3.7:seven integer choices, not nine | COU20 line 425, §4 p.496 | Both directions of floor equivalence; none |
| 5.5 class bound; 727 | Product quadratics:4 geometric points,2 factors,2 classes,2≤1485172. X(X−1):2,2,1. X²:0,0,0. Plane line+point:1≤4 | COU20 line 425, §4 p.496 | Counts unweighted classes; conditional on declared gap; none |
| 5.6 discriminant bound; 749 | H1,n>1:N0; n1,H1:N1 excluded from parameter inference. logB=Q₀log²n+(Q₀/n)logn·logH; multiplying by rM=O(nlog²n) gives nlog⁴n and log³n·logH | COU20 line 35 and lines 425–430, pp.488,496 | Correct uniformity and exponents; none |

### All 100 README Checks

Each row is one Check at the indicated README line. “Pass” includes the intended failure of an excluded wrong model. No Check requires repair.

| README line | Instance and computed values | Result / change |
| --- | --- | --- |
| 114 | ℚ: length [−1,1]=2=2¹; half-length gives1. | Pass / none |
| 115 | ℚ(i): canonical disk area2π versus product areaπ. | Pass / none |
| 116 | Totally real quadratic:r₂0, scaling2⁰1; square volume4=4. | Pass / none |
| 117 | One complex coordinate z1: gauge 1, g(1,1)=2, norm √2. | Pass / none |
| 133 | ℚ basis1: Gram determinant 1,covolume 1,absolute discriminant1. | Pass / none |
| 134 | ℚ(i) basis1,i: Gram diag(2,2),det 4,covolume 2; product covolume 1. | Pass / none |
| 135 | √5: basis discriminants20 and5; ratio4=index²2². | Pass / none |
| 159 | ℚ:n=m=1,house 1=δ1,product 1≤1. | Pass / none |
| 160 | n4:m3,2m6>4,third exponent4/(2·2)=1. | Pass / none |
| 161 | n5:m3,2m6>5,third exponent5/6≤1. | Pass / none |
| 179 | K=k,V=K:2dimV2>1,product span dim1=dimK. | Pass / none |
| 180 | V=ℚ in quadratic:2dimV2=n,product span dimension 1<2. | Pass / none |
| 181 | 𝔽₂(t)/𝔽₂(t²):degree 2;1·1=1 and1·t=t span dimension 2. | Pass / none |
| 182 | k³×0⊂k⁴:dimV3,2dimV6>4,but product span dimension 3<4. | Pass / none |
| 198 | ℚ:b1,house 1=δ²1; degree 0 would force1=0. | Pass / none |
| 199 | ℚ(i):houses1,1≤δ²4. | Pass / none |
| 200 | √5:houses1,√5≤5; coordinates in maximal-order basis have determinant 2,index 2. | Pass / none |
| 236 | ℚ:κ=3·1=3,fixing parameter-map direction. | Pass / none |
| 237 | Zero tuple in quadratic:two value rows(1,0,…) have rank 1<2. | Pass / none |
| 238 | √5 rational basis(1,√5):integral-coordinate determinant 2≠±1,rational rank 2. | Pass / none |
| 239 | Repeated basis candidates(1,1):embedding matrix all ones,determinant 0. | Pass / none |
| 257 | ℚ,r1,d5:M6≥2,D10,u0;jet matrix on1,X is I₂,determinant 1. | Pass / none |
| 258 | Quadratic zero tuple:value rank 1 and total jet rank 2<4. | Pass / none |
| 259 | D2:T(T−1) has values 0,0,2 at 0,1,2;D0:empty product 1 evaluates1=0!. | Pass / none |
| 260 | Seven collinear points,d5:horizontal value/derivative slice dimension 6,vertical slice5,total11<21. | Pass / none |
| 278 | κ√2:1,√2 rationally independent,span dimension 2. | Pass / none |
| 279 | κ√5:integer imageℤ+ℤ√5,index 2; rational dimension 2. | Pass / none |
| 280 | κ0 in quadratic:all rational polynomial values lie inℚ,dimension 1<2. | Pass / none |
| 317 | κ0,d2:kernel coefficient vectors(0,1,0),(0,0,1),rank 2;constant 1 evaluates1≠0. | Pass / none |
| 318 | d0:constant kernel 0; in quadratic,value rank 1<2 despite truncated1−2=0. | Pass / none |
| 319 | κ√2,d3:relation vectors(−2,0,1,0),(0,−2,0,1),norm²5,5,dot0,rank 2. | Pass / none |
| 320 | κ1/2 overℚ:evaluation X↦1/2∉ℤ. | Pass / none |
| 321 | κ0 in quadratic,d2:kernel rank 2,whereas M−n=3−2=1. | Pass / none |
| 348 | κ√5,d≥1:imageℤ+ℤ√5,index 2;higher powers add no new lattice;transpose index 2. | Pass / none |
| 349 | κ√2,d≥1:1,√2 integral basis,index 1;S=L⊥. | Pass / none |
| 350 | Map z↦2z:kernel 0 with covolume 1,orthogonalℤ with covolume 1,dual image2ℤ with covolume 2. | Pass / none |
| 368 | ℚ(i):B=I₂,detBBᵗ1,detVV*4,ratio4/4=1;unconjugated determinant−4. | Pass / none |
| 369 | √5:B rows(1,−1,5),(0,2,0),Gram determinant 27·4−4=104;value Gram determinant 31²−21²=520;520/5=104. | Pass / none |
| 370 | Rational basis1,√5:coordinate Gram diag(26,1),det 26;520/20=26 versus wrong520/5=104. | Pass / none |
| 388 | r2,d2:monomials1,X,Y,X²,XY,Y²,number6 rather than9;C₀1 gives H₀1,G6. | Pass / none |
| 389 | κ0:constant monomial1,all positive-degree monomials0;C₀0 would falsely bound1≤0. | Pass / none |
| 390 | n2,r1,d5:D20,C₀40δ²,H₀40⁵δ¹⁰,G6·40¹⁰δ²⁰. | Pass / none |
| 408 | √5,d2:relation generator(−5,0,1),norm √26;transpose covolume √104=2√26. | Pass / none |
| 409 | Same data:√(520/5)=2√26,not√520. | Pass / none |
| 410 | κ0 overℚ,d2:kernel basisX,X² orthonormal,covolume 1;value-Gram determinant 1 and discriminant1. | Pass / none |
| 446 | X²−2:coefficient norm √5,max coefficient 2,value at√2 equals0. | Pass / none |
| 447 | Integral monomialX:norm 1; rational constant 1/2:norm 1/2<1,outside integer lattice. | Pass / none |
| 448 | Vectors(2,0),(0,1):real rank 2,determinant 2,integral index 2≠1. | Pass / none |
| 449 | Intrinsic line:unit ball length 2=2¹·1^(−1/2);as subset of plane,area 0. | Pass / none |
| 450 | Dimension2:cube half-side1/√2,area2,vertex norm 1;disk areaπ≥2;unscaled cube vertex norm √2>1. | Pass / none |
| 466 | n2,r1,d5:M6,ℓ4,k3,codimension 1=n−1,last retained tail length 2=n. | Pass / none |
| 467 | n1:k=ℓ,discard0,codimension 0;discarding one more givescodim1=n. | Pass / none |
| 468 | Norms1,2,4,8:product 64=4²·4;largest retained4≤4^(4/4)√4=8. | Pass / none |
| 486 | At0,d1:value kernel spanX,derivativeX↦1,rank 1. | Pass / none |
| 487 | At0,d0:values onto dimension 1,kernel 0,derivative rank 0. | Pass / none |
| 488 | At0,1:derivative columns(−1,1),(0,1),determinant−1,rank 2. | Pass / none |
| 504 | Diagonal inℂ²:dimension 1,codimension 1,both block ranks1. | Pass / none |
| 505 | First-coordinate hyperplane inℂ⁴:dimension 3,codimension 1,block ranks1 and2. | Pass / none |
| 506 | Zero inℂ²:codimension 2=n,both block ranks0. | Pass / none |
| 524 | θ³2:Normθ2,Norm(3θ²)=27·4=108;all derivative moduli 3·2^(2/3). | Pass / none |
| 525 | X²−2:derivative values 2√2,−2√2,both nonzero. | Pass / none |
| 526 | X² at 0:derivative 0,so cannot invert it in a field. | Pass / none |
| 568 | X²−2 at√2:inverse derivative √2/4,product(2√2)(√2/4)=1;quotient field degree 2. | Pass / none |
| 569 | X⁴−5X²+6:four roots,two quadratic factors;derivative values−2√2 and2√3 retain both. | Pass / none |
| 570 | X² quotient:(2X)²=0;inverting2X forces1=0,so no map ontoℚ. | Pass / none |
| 571 | X²−2 at 3:derivative 6 versus polynomial value 7. | Pass / none |
| 572 | X² at 0:J0,no field unit is its image. | Pass / none |
| 573 | (X,Y):J1;(Y,X):J−1;both are units and give the same quotient. | Pass / none |
| 574 | r0:empty determinant 1;in zero ring1=0. | Pass / none |
| 575 | Dual numbers:ε²0,E(ε)0,J(ε)2ε≠0,but(2ε)²0,not a unit. | Pass / none |
| 576 | 𝔽₂:derivatives ofX²−X andX² are1 and0;𝔽₃:derivativeX³−X=−1=2. | Pass / none |
| 601 | ℚ,r1,d5:M6,ℓ5,E=X,κ0,height 1≤5^(5/2)√6·10⁵≈13693063.9376,J1. | Pass / none |
| 602 | √2,E=X²−2:degree 2≤5,height 2,J2√2≠0;A_E has degree 2. | Pass / none |
| 603 | E=(X(X−1),XY):J=X(2X−1),J(1,0)=1;J vanishes alongX0,so localized algebraℚ. | Pass / none |
| 604 | Height2 equations meet bothH2 andH3;zero function sends1 to0≠1,so fails algebra-map law. | Pass / none |
| 605 | δ→2δ at d5:bound ratio2^(2·5)=1024. | Pass / none |
| 606 | n0,r1,d5,δ1:ℓ6,exponent6/0=0,6^0=1,remaining0⁵=0;B0. | Pass / none |
| 642 | n1:r1,Catalan 1,central2; n2:r2,Catalan 2,central6. | Pass / none |
| 643 | CatalanF₄14,F₅42: r14=4,r15=5. | Pass / none |
| 644 | r1=1>3log1=0. | Pass / none |
| 645 | n0:all positive indices admissible,minimum 1;not0. | Pass / none |
| 663 | n14:r4,M70; n15:r5,M252;90≤252≤360,only r5 has d≥5. | Pass / none |
| 664 | n1:Qlog1=0<r1=1 for everyQ. | Pass / none |
| 665 | δ1:height logarithmQ(logn)²;δ→2 addsQlogn·log2,no reciprocallogδ. | Pass / none |
| 692 | r0:zero slots,one empty ordered tuple,count 1. | Pass / none |
| 693 | d0:M1,each of r coefficients has2C+1 choices;count(2C+1)^r. | Pass / none |
| 694 | C0:every coefficient 0,exactly one zero tuple. | Pass / none |
| 695 | r2,d2:six monomials each, twelve slots;coordinatewise degree gives18 slots and wrongly admitsX²Y² of degree 4. | Pass / none |
| 713 | r1, d2, C1:three coefficients,3³=27. | Pass / none |
| 714 | B3.7:floor3,integers−3,…,3 give7;ceiling4 gives9. | Pass / none |
| 715 | r0:count 1 evenC0; r2,d0,C1:3²=9. | Pass / none |
| 733 | Product quadratics:four points,two factors,two classes;discriminants 8≠12;2≤13⁵·4=1485172. | Pass / none |
| 734 | X(X−1):two points,two factors,one class;twoℚ copies fail hsep;one gives1≤3³·2=54. | Pass / none |
| 735 | X²:localized algebra0,zero points,zero factors,zero classes. | Pass / none |
| 736 | Plane line+point system:one isolated simple point,1≤2²=4 despite the line. | Pass / none |
| 737 | m0:0≤(2C+1)^(rM)d^r. AtC0,all E and J are0,so A_E0 and no nonempty field family can be represented. | Pass / none |
| 755 | H1,n>1:discriminant lower bound ≥ π²/4>1 excludes fields,N0;empty-family inequality0≤positive RHS andlogH0. | Pass / none |
| 756 | Nonnormal cubic:Aut cardinal1,embedded multiplicity3/1=3,class contribution1. | Pass / none |
| 757 | n1,H1:class count 1;r1=1>Qlog1=0,excluded from eventual parameter bound. | Pass / none |
| 758 | n2,H3:squarefreeD−3 givesdisc−3;D−2,−1,2,3 give−8,−4,8,12;exactly one class and maximal distinct-family size1. | Pass / none |

### All 58 README API assertions

These are prose API assertions, not additional Lean acceptance declarations.

| README line | Assertion | Instance and computed values | Result / change |
| --- | --- | --- | --- |
| 106 | Canonical Haar scaling | For ℚ(i), μ_can=2·area: a fundamental square has measures 2 and 1. | Pass / none |
| 107 | Measurable-set scaling | Unit disk: μ_can(D)=2π=2·volume(D). Empty set: 0=2·0. | Pass / none |
| 108 | Pairing contributions | Real coordinates 1,1 pair to 1; complex coordinates 1,1 pair to 2; g(i,1)=0. | Pass / none |
| 109 | House-body volume | r₁=0,r₂=1 gives 2π; r₁=2,r₂=0 gives 4. | Pass / none |
| 110 | Gauge on embedded field | In ℚ(i), x=1+i has embedding modulus and house gauge √2; its g-norm is 2. | Pass / none |
| 151 | Ordered independent witness/product | For ℚ(i), (1,i) has houses (1,1), product 1≤δ^(n/2)=2. | Pass / none |
| 152 | First m rational rank | For ℚ(i), n=m=2; the embedding determinant of (1,i) is −2i≠0, giving rank 2. | Pass / none |
| 153 | First m embedding bounds | For ℚ(i), every modulus is 1≤δ=2; for ℚ, the modulus is 1=δ. | Pass / none |
| 154 | Full product bound | For ℚ(i), 1·1=1≤2; for ℚ, 1=1. | Pass / none |
| 155 | Witness gauge equals house | For x=1 in ℚ(i), gauge=house=1 while the g-norm is √2. | Pass / none |
| 228 | Integral finite-sum construction | For α=(1,√5), u=(0,1), κ=0·1+1·√5=√5 is integral. | Pass / none |
| 229 | Embedding finite-sum identity | At the negative embedding, τκ=−√5=0·1+1·(−√5). | Pass / none |
| 230 | Parameter equivalence | The embedding matrix of (1,√5) has determinant −2√5≠0; repeated basis entries give determinant 0. | Pass / none |
| 231 | Parameter house estimate | Over ℚ, α=1,D=u=3 gives house(κ)=3=nDδ². Zero parameters give 0≤nDδ². | Pass / none |
| 232 | Reindexing and inverse basis change | Swapping (1,√5) and (0,1) together preserves κ=√5. In basis (1,√5+1), coefficients (−1,1) give −1+(√5+1)=√5. | Pass / none |
| 308 | Kernel definition | At κ=0,d=2, X+X² evaluates to 0 and lies in L; the constant 1 evaluates to 1 and does not. | Pass / none |
| 309 | Membership iff | At κ=√2,d=2, X²−2 has degree 2 and value 0. X has value √2≠0. X³−2X vanishes but has degree 3>2. | Pass / none |
| 310 | Kernel rank at full value rank | At κ=√2,d=3, M=4,n=2 and kernel rank 2=4−2. At κ=0 in a quadratic field, d=2 gives rank 2≠3−2. | Pass / none |
| 311 | Nonzero integer saturation | At κ=0, evaluation of 2f is 0 iff 2·constant(f)=0, forcing constant(f)=0. Scalar 0 would allow f=1 and invalidate the implication. | Pass / none |
| 312 | Complex kernel comparison | At κ=√2,d=3, the two relations have Gram determinant 25; the value rank is 2, so the complex kernel has dimension 2. | Pass / none |
| 313 | Degree inclusion | X²−2 has coordinates (−2,0,1) at degree 2 and (−2,0,1,0) at degree 3; both evaluate to 0. | Pass / none |
| 339 | Transpose construction | For √5,d=2,β=(1,(1+√5)/2), the dual coordinate functionals give rows (1,−1,5) and (0,2,0). | Pass / none |
| 340 | Transpose monomial coordinate | The second dual functional sends κ=√5 to 2 and κ²=5 to 0, the stated X and X² coordinates. | Pass / none |
| 341 | Transpose injectivity | A combination a(1,−1,5)+b(0,2,0)=0 forces a=0 from the constant coordinate and then b=0 from 2b=0. | Pass / none |
| 342 | Containment and rank | Both transpose rows pair to 0 with (−5,0,1); their rank is 2=n. | Pass / none |
| 343 | Index equality and covolume | The evaluation index and transpose index are both 2; √104=2√26. | Pass / none |
| 344 | Integral basis invariance | Swapping the two integral basis vectors swaps the rows; the row lattice and Gram determinant 104 remain unchanged. | Pass / none |
| 438 | Sorted short relation product | At √2,d=3, the two norms are √5,√5, with product 5≤2·covol(L)=10. | Pass / none |
| 439 | Witness vanishing and degree | X²−2 and X³−2X have values 0,0 at √2 and degrees 2,3≤3. | Pass / none |
| 440 | Real/complex basis of relation span | The relation vectors have Gram determinant 25≠0 and span dimension 2 over both ℝ and ℂ. | Pass / none |
| 441 | Lower coefficient norm | The integer monomial X has norm 1; the excluded rational constant 1/2 has norm 1/2. | Pass / none |
| 442 | Coefficient dominated by norm | X²−2 has maximum coefficient modulus 2≤√5; constant 1 gives equality 1=1. | Pass / none |
| 554 | Evaluated determinant | E=X²−2 at κ=3 over ℚ has derivative determinant 6, also the value of 2X. | Pass / none |
| 555 | Ring-map compatibility | Under ℤ→𝔽₂, the derivative of X²−X at 0 maps from −1 to 1, equal to the derivative over 𝔽₂. | Pass / none |
| 556 | Localization extension criterion | At √2, J=2√2 is a unit. At ε in the dual numbers, J=2ε≠0 is nilpotent and no localization evaluation exists. | Pass / none |
| 557 | Polynomial compatibility | For X²−2, φ([X])=√2 and φ([X²])=2=(√2)². | Pass / none |
| 558 | Image of inverse | φ(J⁻¹)=√2/4 and φ(J)φ(J⁻¹)=1. | Pass / none |
| 559 | Uniqueness of extension | Compatibility fixes X↦√2 and J⁻¹↦√2/4; these generate the localized algebra, leaving exactly one possible map. | Pass / none |
| 560 | Surjection from polynomial evaluation | Every a+b√2 is φ([a+bX]); both basis vectors 1 and √2 are hit. | Pass / none |
| 561 | Compatible field factor | For A_E=K₂×K₃, the first projection sends (1,0) to 1 and (0,1) to 0; its selected factor is K₂. | Pass / none |
| 562 | Characteristic-zero specialization | E=X²−2 at 3 gives derivative 6 over both ℚ and ℂ; the integer and rational determinant evaluations agree. | Pass / none |
| 563 | Quotient and localization maps | X²−2 maps to 0 in the quotient; the class of 2X times its localization inverse is 1. | Pass / none |
| 564 | Equation-row permutation | (X,Y) has J=1; (Y,X) has J=−1. Their ideals agree and both localizations invert a unit. | Pass / none |
| 594 | Same point/system across predicate | E=X²−2 at √2 has value 0 and J=2√2; changing the point to √3 gives E(√3)=1 and fails the predicate. | Pass / none |
| 595 | Monotonicity and field transport | Height-2 degree-2 equations also satisfy H=3,d=3. Conjugation √2↦−√2 preserves the coefficient bounds and sends J to −2√2. | Pass / none |
| 596 | Positive explicit bound and expansion | For n=2,r=1,d=5, ℓ=4 and √G=√6·40⁵δ¹⁰; hence B=4√6·40⁵δ¹⁰>0. | Pass / none |
| 597 | Forced inverse under compatibility | For X²−2, compatibility fixes J↦2√2, whose only inverse is √2/4 since their product is 1. | Pass / none |
| 634 | Least positive admissible rank | For n=15, F₄=14<15≤42=F₅, so the least positive admissible rank is 5. | Pass / none |
| 635 | Admissibility and minimality | For n=15,r=5, 90≤252. At positive indices 1–4, Catalan values 1,2,5,14 are all below 15. | Pass / none |
| 636 | Monomial interval | n=15,r=5 gives 90≤252≤360; n=1,r=1 gives 2≤2≤8. | Pass / none |
| 637 | Eventual rank bounds | n=15 gives r=5 and 5≤3log15≈8.124; n=1 fails 1≤0, confirming the eventual qualifier. | Pass / none |
| 638 | Monotonicity of rank | r(14)=4≤5=r(15)=r(42); at n=43 the least rank rises to 6. | Pass / none |
| 683 | Box conjunction | At r=1,d=2,C=1, X²−1 belongs; 2X fails its height bound 2≤1 and X³ fails its degree bound 3≤2. | Pass / none |
| 684 | Membership including zero | The zero polynomial has degree 0 and every coefficient 0, so belongs when d=C=0; constant 1 fails C=0. | Pass / none |
| 685 | Coefficient product equivalence | For r=1,d=2, (a,b,c) maps to a+bX+cX², whose coefficients recover exactly a,b,c. | Pass / none |
| 686 | Box finiteness | For r=2,d=2,C=1, twelve coordinates give 3¹²=531441 ordered tuples. | Pass / none |
| 687 | Inclusions | X²+2 satisfies d=2,C=2 and d=3,C=3; it fails d=1,C=2 and d=2,C=1. | Pass / none |
| 688 | Bounded-submodule projection | For r=d=2, X² and XY both have degree 2; X²Y² has degree 4 and is excluded. | Pass / none |


### Conventions and bold worked examples

| Statement and location | Instances and computed sides | Result / change |
| --- | --- | --- |
| Summary; README 3–7 | n15 gives common r5,M252; the logarithm of the class bound has terms Q·15·(log15)^4 and Q·(log15)^3logH. For H1 the second term is0 | Same threshold and exponents as §5.6; none |
| Number-field denominators; README 21,29–36 | ℚ:n1,disc 1,δ1; ℚ(i):n2,disc−4,δ2. Positive n and absolute discriminant exclude both denominators0. At n0,r1,d5 the total formula gives B0 | No arithmetic use of junk denominator; none |
| Hermitian direction; README 27 | Rows1,i give VV*=[[1,−i],[i,1]] and native Gram=[[1,i],[−i,1]],both determinant 0. Full quadratic embedding matrix gives determinant 4 versus unconjugated−4 | Supplier/consumer conventions agree; none |
| Intrinsic rank-zero volume; README 25 | Empty Gram determinant 1,covolume of zero lattice in zero space 1; line interval embedded in plane has ambient area 0 but intrinsic length 2 | Fullness is taken inside the span; none |
| General base versus field; README 78,544–576 | Over DVR O=ℤ_p,E=pX−1 gives O[X]/(pX−1)=ℚ_p,J=p a unit there,étale but not finite over O. Over ℚ,κ1/p is nonintegral and fails HasBoundedModel | General-base finiteness and integral arithmetic model are distinct hypotheses; none |
| Characteristic/zero-ring boundaries; README 544–576 | In 𝔽₂ derivativeX²0 versus derivativeX²−X1; in 𝔽₃ derivativeX³−X2. Empty determinant 1=0 in zero ring; a zero algebra cannot surject to a field | Ring identities remain general; number-field model has characteristic0; none |
| Finite-family universes; README 21,723,745 | Zero-index family has m0; duplicate ℚ family of size2 has an AlgEquiv and fails hsep; single ℚ family is pairwise vacuous but has m1,correctly representing one class | No lost instance or spurious count from vacuity; none |
| Nonabelian versus cyclic multiplicity; README 40,88 | Nonnormal cubic normal closure has group S₃,field stabilizer C₂,index 6/2=3 embedded fields; one class. Quadratic group C₂ gives one embedded field and one class | No automorphism weight inserted; none |
| Empty, constant and nonsmooth systems; README 36,673 | r0:one system,A_Eℚ. r≥1,d0:any constant system has J=0,so A_E0;E0 likewise. AtX²−2,J invertible and one degree 2 factor survives | Counting theorem excludes d=0 but definitions handle it; none |
| An integral index survives rational surjectivity; README 778 | β-coordinate columns(1,0),(−1,2),(5,0),index 2. Kernel norm √26;transpose Gram determinant 104;value-Gram determinant 520=5·104 | q2 and discriminant denominator agree across §§2.1–2.5; none |
| The minor selection uses all embedding blocks; README 780 | ℓ4,n2,k3,codim 1. Joint derivative kernel has dimension 2,so W of dimension 3 cannot annihilate both blocks. X²−2 derivatives±2√2; cubic derivative norm 108 | Joint map is used before truncation; none |
| One model may represent several classes; README 782 | Product quadratics:4 points,2 factors,2 classes. X(X−1):2,2,1. X²:0,0,0. Line+point system:one isolated point,1≤4 | Factor-to-class image handles multiplicities; none |
| Uniform parameters and inclusive height; README 784 | n15:r5,M252,rM1260,r^r3125. logB=Q₀log²15+(Q₀/15)log15·logH. At H=1 second term 0; at H=3 field discriminant −3 is included | Correct flooring, order of quantifiers and inclusive cutoff; none |

The fields, finite-dimensional spaces and finite index sets rule out rank-zero number fields, infinite families, noncompact convex bodies and inseparable number fields. Inseparability is explicitly allowed in §0.4 and tested there. Flatness, smoothness, separation, ramification and universe concerns that could affect a generic scheme assertion enter only through the stated supplier hypotheses; the arithmetic targets do not quantify over arbitrary schemes or topological spaces.

### Supplier contracts, ownership and dependency direction

Re-resolved **23 named section/target contracts across five supplier roadmaps**: the two Completed/EffectiveBounds layers, ten GeometryOfNumbersAndQuadraticArithmetic targets, seven GenericDoublePointInterpolation sections, two SchemeAndStackFoundations sections, and the two named ArithmeticStatisticsPartI field-count contracts. Repeated citations were checked against the same current statements. The arithmetic-family inclusive cutoff was additionally read. The resolver now reports no missing cross-roadmap citation or Lean name; its explicit disclaimer about not checking pinned packages was handled by direct pin inspection below.

| Supplier and exact current locator | Hypotheses and convention witness | Consequence for this package |
| --- | --- | --- |
| Completed/EffectiveBounds/README.md:104,125, Layers 1–2 | Number fields; fixed ambient extension in Hermite count. A quadratic class has one embedded representative; a nonnormal cubic has three | Existing discriminant and primitive-polynomial infrastructure is consumed, not planned again |
| TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:251, §0.1.2 | Normed RCLike inner-product space; no independence needed. Gram of (1,i) has determinant 0; Gram of the single vector i has determinant 1 rather than −1 | VV* is the transpose of the supplier's native Gram; same determinant and diagonals |
| Same README:282,332,382, §§0.2.1,0.2.6,0.3.3 | Discrete full self-dual ambient lattice and rational intersection. Diagonal/antidiagonal in ℤ² have covolumes √2=√2; twice a primitive generator gives2√2 | Standard monomial lattice meets self-duality, not merely covolume-one, hypothesis |
| Same README:416, §1.1.2 | Monotone sequence with each term≥1. (1,2,4),V8 gives last bound4≤8 with exponent1; (1/2,2) fails2≤1 | Supplier uses zero-based n−i; consumer's one-based n+1−i is identical |
| Same README:425,434,443, §§1.1.3–1.1.5 | Real orthonormal coordinates and intrinsic Euclidean volume; positive dimension for dividing by √ℓ. Dimensions1,2,4 give lower constants2,2,1 | Intrinsic coefficient-space ball estimate is already supplied; no extra gap needed |
| Same README:531,885, §§1.2.7,1.5.21 | Full discrete lattice, compact convex body with 0 interior; symmetry for upper second Minkowski; same explicit Haar measure. L2ℤ,K[−3,3]: (2/3)·6=2·2=4 | Both applications use the full required hypotheses and an independent attaining family |
| TauCetiRoadmap/GenericDoublePointInterpolation/README.md:241,324, §§0.1,0.3 | Native degree-bounded polynomials over commutative rings, real metric specialization. r2,d2 gives6 monomials; 2+X has norm²5 | Generic carrier, count and metric remain supplier-owned |
| Same README:447,517, §§1.3–1.4 | Ordinary derivatives and Option-indexed values/partials. At0,1 the two kernel derivatives give determinant−1; X² at 3 gives6 | Full joint derivative map and its actual matrix are present with matching conventions |
| Same README:1505,1539,1593, §§5.1–5.3 | Nonzero integer minor in characteristic0 for r,n≥1,d≥5,M≥n(r+1); total degree≤dn(r+1). One point minor1, swapped minor−1; repeated supports give0 | Arithmetic pullback uses a complex linear equivalence; grid theorem is applied overℂ, not the narrower integer-parametrization export |
| TauCetiRoadmap/SchemeAndStackFoundations/README.md:900, §0.10 | r equations/r variables over a commutative ring; localization at actual Jacobian is étale and finitely presented. Over A[t],tx−1 gives A[t,t⁻¹],not finite | Package only deduces finiteness after passing to the field baseℚ |
| Same README:7336, §5.12 | Projective equidimensional intersection inequality, with multiplicity equality under proper intersection; it does not explicitly export the arbitrary affine system version | The precise isolated-affine contract is declared, not falsely attributed to an existing theorem |
| TauCetiRoadmap/ArithmeticStatisticsPartI/README.md:1302,1338, §0.7 | Finite-dimensional intermediate fields of characteristic-zero A; choose A=ℚ̄ to represent every class. Embedded, isoSetoid, isoFamily and isoDegree are all named targets. Nonnormal cubic gives3 embedded/1 class; quadratic gives1/1 | Both citation leads resolve. This package introduces no second quotient and counts unweighted classes |

The isolated-affine gap has exactly the same slug, supplier, section and needs sentence in `packages/EffectiveBoundsPartII/design/plan.json` and README line82. It specifies r,d≥1, algebraically closed base, r polynomials in r variables, isolated local multiplicities in the presence of other components, and multiplicity1 at invertible Jacobian points. These are the geometric conditions needed by §5.5. The published supplier exports do not already give that whole affine-system statement; the package does not own an alternative intersection theory. The diff of plan.json changes only its top-level gaps list, as permitted.

Object searches used the required roadmap grep/show service, the supplied main/Completed copies, all board package READMEs and acceptance modules, and all **48 supplied sibling folders (96 files)**. The arithmetic kernel into 𝓞_K is not a class-group relation lattice; generic interpolation, Jacobian étaleness and lattice geometry resolve to the owners above. There was no duplicate fully qualified name among the eleven acceptance declarations. The earlier `packages/EffectiveBoundsCompactModels/design/` route is explicitly identified with this Part II's arithmetic scope at `packages/EffectiveBoundsPartII/design/README.md:61`; it has no separate package acceptance module. This is the same earlier route, not evidence of a second exported owner. Generic coefficient boxes are already represented by coefficient coordinates; §5.3 specializes those coordinates to ordered integral systems and does not reconstruct a polynomial carrier.

Every local Needs edge points to earlier targets or the cited generic suppliers. The component theorem uses no Bézout input; only the counting step uses the declared isolated-point contract. No consumer is used as a supplier. The read-only mechanical check exited 0 with this exact output:

```text
moved: EffectiveBoundsPartII moved in the merge order from #99 to #123, right after its last supplier ArithmeticStatisticsPartI; checked as moved (the worker moves it there when it submits)
depcheck: 49 roadmaps, 557 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The move is permitted by the brief and is not a finding. The merge-order file was not changed.

### Pinned-library evidence

The inspected checkouts match the content manifest: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. All named imports were resolved locally. The direct inspections include every pinned declaration named in the supplier contracts and the additional span, dimension and discriminant-bound inputs.

| Pinned declaration(s) and file | Actual content or hypothesis boundary |
| --- | --- |
| NumberField.discr, discr_ne_zero, discr_eq_discr_of_algEquiv; Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean:36,41,50 | Signed integral basis discriminant; nonzero; invariant under ℚ-algebra equivalence. At ℚ(i) the signed value is−4 and absolute value 4 |
| NumberField.rootDiscr, mixedEmbedding.covolume_integerLattice, finite_of_discr_bdd; Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:77,124,494 | Root exponent is inverse finrank; mixed standard-volume factor is (2⁻¹)^r₂; bounded set consists of finite-dimensional intermediate fields of one fixed characteristic-zero field |
| NumberField.abs_discr_ge; same file:242 | For degree n>1, (4/9)(3π/4)^n≤absolute discriminant. At n2 this isπ²/4>1; higher n only increase it, proving the H1 Check |
| mixedEmbedding.finrank, mixedEmbedding.latticeBasis, canonicalEmbedding.norm_le_iff; Mathlib/NumberTheory/NumberField/CanonicalEmbedding/Basic.lean:212,637,79 | Mixed-space dimension n; actual integer lattice basis; canonical supremum norm bounded iff every embedding modulus is bounded |
| NumberField.house, house_eq_sup', house_sum_le_sum_house, house_mul_le, house_intCast, one_le_house_of_isIntegral; Mathlib/NumberTheory/NumberField/House.lean:38,41,45,51,74,93 | House is defined by `‖canonicalEmbedding K α‖`; no coefficient norm. The ≥1 result needs both integrality and nonzero. Zero has house 0 |
| MvPolynomial.restrictTotalDegree, mem_restrictTotalDegree, basisRestrictSupport; Mathlib/RingTheory/MvPolynomial/Basic.lean:164,174,95 | Support exponents satisfy sum≤d; membership iff totalDegree≤d. This is not separate coordinatewise degree; zero polynomial belongs at d0 |
| MvPolynomial.aeval and pderiv; Mathlib/Algebra/MvPolynomial/Eval.lean:572 and Mathlib/Algebra/MvPolynomial/PDeriv.lean:61 | Genuine algebra evaluation and ordinary derivation on native multivariate polynomials; exponent factors are retained, including in characteristics2 and3 |
| MvPolynomial.eq_zero_of_eval_zero_at_prod_finset; Mathlib/Combinatorics/Nullstellensatz.lean:62 | Integral-domain coefficient ring, finite variables, and degreeOf strictly less than each grid cardinality. D+1 integer images inℂ meet this; D points do not |
| Algebra.discr_not_zero_of_basis, discr_eq_det_embeddingsMatrixReindex_pow_two; Mathlib/RingTheory/Discriminant.lean:127,143 | Finite separable field extension; embedding formula uses an algebraically closed extension and bijection of basis index with embeddings. Number fields satisfy these conditions |
| ZLattice.covolume_eq_det_mul_measureReal, covolume_div_covolume_eq_relIndex'; Mathlib/Algebra/Module/ZLattice/Covolume.lean:115,170 | Determinant times reference-domain measure; ratio for nested full discrete lattices in the same finite-dimensional real inner-product space with Borel structure |
| AddSubmonoid.ker_saturated; Mathlib/GroupTheory/Subgroup/Saturated.lean:62 | Additive-group domain, additive torsion-free target; natural-multiple saturation. Integer form follows by additive inverses, no field or surjectivity assumption |
| Ideal.Quotient.mk; Mathlib/RingTheory/Ideal/Quotient/Defs.lean:83. Localization.Away; Mathlib/GroupTheory/MonoidLocalization/Away.lean:140 | Actual quotient map and localization at the powers of the chosen element. Localizing at 0 gives zero; localizing at 1 preserves the algebra |
| Algebra.Etale.iff_exists_algEquiv_prod; Mathlib/RingTheory/Etale/Field.lean:271 | Finite product, possibly empty, of finite separable field extensions. The formally étale companion at line194 requires EssFiniteType; no general-ring finiteness theorem is supplied |
| Nat.centralBinom, succ_mul_centralBinom_succ, four_pow_le_two_mul_add_one_mul_centralBinom; Mathlib/Data/Nat/Choose/Central.lean:36,78,123 | choose(2r,r), exact recurrence and 4^r≤(2r+1)choose(2r,r). At r0 the lower inequality is1≤1 |
| catalan, succ_mul_catalan_eq_centralBinom; Mathlib/Combinatorics/Enumerative/Catalan/Basic.lean:52,126 | Native sequence and (r+1)Fᵣ=centralBinom r; at r4, 5·14=70 |
| NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le, hermiteCountBound; TauCeti/NumberTheory/EffectiveBounds/HermiteCount/Basic.lean:172,202 | Fixed-ambient subfield bound (2C+1)^(D+1)D; this is not the new exact-degree cubic-logarithmic count |
| ZLattice.covolume_sq_eq_det_gram; TauCeti/Algebra/Module/ZLattice/Covolume.lean:42 | Actual ℤ-basis, full discrete lattice, real finite-dimensional inner-product space and Borel structure. Empty basis gives1²=1 |
| Submodule.span; Mathlib/LinearAlgebra/Span/Defs.lean:46. Module.finrank; Mathlib/LinearAlgebra/Dimension/Finrank.lean:61 | Native submodule span and natural dimension; target §0.4 assumes finite field extension, so dimension does not use the infinite-rank junk value |

Object searches for houses, root discriminants, bases, Jacobian localizations and relation covolumes found no pinned version of the six acceptance theorems. In particular, `NumberField.house.basis_repr_norm_le_const_mul_house` at House.lean:145 bounds coordinates in a chosen basis; it does not supply a basis whose house is bounded by δ².

### Source and policy verification

COU20 is the only directly cited work. Its sole manifest key identifies the legal publisher-open published Annals version; no additional source fetch or missing-text request was needed. Read all 496 extraction lines. The primary target locators are listed in the target ledger; the remaining thirteen citation paragraphs attach conventions, contracts, examples and the reference entry to the same passages. Inspected rendered pp.489,493,494,495: the extraction's strict-looking signs at the house lower bound and Proposition 2 are printed ≥, and the source really permits d≥5,r≥1. The two actual source misprints below were not propagated into the package. The repaired Theorem 1 locator points to line20, while lines381–425 contain its parameter proof. The cubic-log bound is Theorem 2 at line35 and the final count at lines425–430.

The head is `2ceb0e0`. Its diff from origin/main changes seven files, all inside `packages/EffectiveBoundsPartII/`: README, Suggested.lean, the permitted gaps-list addition, metadata, sources, and two earlier reports. No package file was edited by this pass; the only new repository file is this report. `git diff --check` returned no output. The Lean file has one `import Mathlib`, one module docstring, the prescribed namespace and layer order, six theorem sorries, no admitted data, no `set_option`, no `lemma`, no examples, no free Prop placeholder, and no hypothesis containing a counting conclusion. README/docstrings contain no pull-request numbers or review narrative. Every target has a locator, and no computational enumeration algorithm is planned.

## Not verifiable

- Fresh Lean elaboration was prohibited by the read-only/no-build brief. All eleven supplied elaborated signatures were compared individually with the source and README; none loses a necessary binder. I did not claim a new build or run a replacement `#check` file.
- The isolated-affine-Bézout export is a declared supplier obligation, not an implemented theorem certified here. The counting proof is accepted conditionally on precisely that contract; its absence from the current supplier is not a finding.
- This pass verifies the cited current supplier statements, hypotheses and conventions, not complete proofs of their roadmaps. Secondary books and papers appearing inside their proof routes are not independently certified by this report.
- Ownership against open pull requests without supplied files was not fully checked. The required index searches were used for leads; the detailed ownership conclusions cover the supplied main, packages, cited supplier exports and all 48 explicitly supplied sibling folders. No unprovided sibling checkout was fetched independently.

## Source issues

- **Misprint** in COU20 at §3, printed p.493 (COU20 line 266): the source says the integral relation lattice is tensored with the reals over ℚ; it should be tensoring over ℤ, or rationalizing before extending scalars from ℚ; affects the proof.
- **Misprint** in COU20 at §3, printed p.494 (COU20 line 324): the source says the norm-at-most-one set is a sphere; it should be called the closed unit ball, whose intrinsic volume is used; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "2ceb0e094062e0701e23e9a4eb29f5b2fe4bb14e", "job": "RT-EffectiveBoundsPartII~2a", "model": "gpt-6-astra", "worker": "chris-6"} -->
