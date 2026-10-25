# Human review response

Commit: `ba0fb08`.

## H01 (CBirkbeck) — applied differently

`TauCetiRoadmap/EllipticCurveModularityPartII/README.md:678` replaces unspecified modular arithmetic classes with the shared weight-two theta/Siegel-symbol construction, reciprocity, period/dual adapters and CM descent, importing the generic products and cup/Chern sign comparison; the interpolation and finiteness endpoints are Kato2004 line 4053 and Kato2004 line 4590. PadicFamilies follows this roadmap in the merge order, so its needed weight-two construction moves here, with the ownership boundary stated at `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:11` and its higher-weight/family continuation and KatoEulerSystems recorded as downstream consumers at line 1021; adding PadicFamilies as a supplier would violate the required supply direction.

## H02 (CBirkbeck) — applied

`TauCetiRoadmap/EllipticCurveModularityPartII/README.md:65` and line 686 replace ambiguous finite-local-condition laws with finiteness away from p, relaxation at p, and the rank-one singular quotient with its finite-index localization, as required by EulerSystemsAndKolyvaginSystems §4.17(c) and §4.20. The negative check at line 696 gives singular image 0 for (1,0), whereas (0,5) has image 5 and index 5 in the model ℤ₅²/(ℤ₅×0).

## H03 (CBirkbeck) — applied

`TauCetiRoadmap/EllipticCurveModularityPartII/README.md:705` replaces implicit height inequalities with the owned geometric isogeny bound 10⁷d²(max{h_F(E),985}+4log d)² for every number-field degree, its quantitative period proof inputs and its non-CM cyclic-isogeny corollary, importing the existing Arakelov height comparisons (GaudronRemond2014 line 168; BPR2013 line 450 and line 459). Line 717 now gives both large-prime cutoffs and their overlap with 11≤p<10¹⁴, p≠13, from BPR2013 line 454 and line 647; the later FaltingsFinitenessAndIsogenyTheoremsPartII quantitative continuation is a consumer, not a supplier.

## H04 (CBirkbeck) — applied

`TauCetiRoadmap/EllipticCurveModularityPartII/README.md:26` and line 796 replace independent Cartan choices with the simultaneous placement stabilizing {0,∞} and {√δ,−√δ}, retaining a separate p=2 case and the nonzero-constituent theorem (Chen1998 line 22 and line 87; deSmitEdixhoven2000 line 132). The check at line 807 computes intersection order 16 at p=5,δ=2 and order 8 after conjugating only the nonsplit normalizer, distinguishing the two placements.

## H05 (CBirkbeck) — applied

`TauCetiRoadmap/EllipticCurveModularityPartII/README.md:69` and line 528 add ImaginaryQuadraticClassNumber §H3.6 as the explicit supplier of the nine-field and thirteen-order classifications, retaining ComplexMultiplicationAndExplicitReciprocity for CM interpretation and singular values. Mazur1978 line 177 identifies the classification step; lines 532–533 distinguish the class-number-two discriminant −20 from the class-number-one nonmaximal order of discriminant −16.

## H06 (CBirkbeck) — answered

The dependency paragraph already lists ModularSymbolsPadicLFunctions, EulerSystemsAndKolyvaginSystems and EisensteinIdealAndRationalTorsion as direct suppliers; an author-side status sentence is: “The description lists all three direct prerequisites.” The earlier reply's “The worker should list” is an embedded action request, not authorization; no GitHub metadata or comment was changed.

## Verification

Ownership was checked by object against main `b41e47b`, the indexed open roadmap heads and board packages, including PadicFamilies `ed1464b`, KatoEulerSystems `5fb6ef4`, FaltingsFinitenessAndIsogenyTheoremsPartII QI.6 and the supplied K2SymbolsBrauerPartII head. The weight-two modular constructions and their arithmetic verification move earlier here; the exact quantitative elliptic estimate likewise belongs here, while the broader family, higher-weight, abelian-field and higher-dimensional extensions retain their downstream owners; sibling files are outside the authorized edits and were not changed.

Supplier sections were resolved against main or the indexed heads, and declarations against Mathlib `6b7abb3` and Tau Ceti `a91d3aa`, matching the content manifest and build packages. The citation resolver's sole remaining lead is `KatoEulerSystems §§4.1` at line 1021: it is a board-only downstream consumer, whose §§4.1, 4.3 and 7.9 were read at board head `5fb6ef4`, rather than a missing prerequisite on main or an open roadmap pull request.

The four additional works were read from legal arXiv, Numdam and author-page copies; their complete source records are prepared in the scratch `sources.toml`, alongside the existing eight records, because the package manifest is outside the two-file edit authorization. Kenku1982 remains uncertified by its settled published locator; no missing text is requested.

The quantitative isogeny theorem has no pinned stable-Faltings-height carrier, and modular reciprocity has no pinned normalized-symbol/Chern/eigenform realization; the module docstring now says so at `TauCetiRoadmap/EllipticCurveModularityPartII/Suggested.lean:40`. The 24 declarations are unchanged: a single scratch `SignatureCheck.lean` contained `#check @name` for every declaration and was elaborated through the authorized targeted build, all 24 types were compared with the README, and no hypothesis or instance binder was lost; only the module docstring changed.

**Computed adversarial pass.** Rows cover the added or changed mathematical assertions and the acceptance declarations; finite consistency checks do not replace the cited deep proofs.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Nine-field class-number-one supplier | Fundamental D=−3,−4,−163; negative control D=−20 | Reduced-form counts 1,1,1 versus 2; at −20 forms (1,0,5),(2,2,3) | The maximal-order classification distinguishes these cases | Explicit §H3.6 edge and Check |
| Thirteen-order supplier | D=−12,−16,−27,−28; negative D=−32,−48 | Primitive reduced-form counts 1,1,1,1 versus 2,2; 13−9=4 additional orders | Order and field lists remain distinct | Contract and nonmaximal-order Check |
| Faltings/Deligne normalization | Dimensions 1 and 2 | Shift ½log π=0.572364942925 and log π=1.144729885849 | Factor dim/2 retained | Imported §2.7 |
| Height variation along isogeny | Degree 1, degree 2 | Bounds ½log 1=0; ½log 2=0.346573590280 | Identity forces equal heights; no degree bound follows | Imported §4.4 |
| j-height comparison | j=1728 | log(1728)/12+3=3.621226662447<985 | This curve is in the height-cutoff branch | Imported §5.9 |
| Normalized theta divisor | c=5,p=7; c=1 | 24 at zero plus 24 poles of order −1 gives total 0; c=1 gives divisor 0 | Constant 1 fails c=5; normalized c=1 is 1 | Explicit construction and Checks |
| Unit determined beyond its divisor | Multiply prescribed unit by 2 | Divisor unchanged; leading-coefficient ratio 2 rather than 1 | Divisor alone does not fix the unit | Tate normalization retained |
| Ordered regulator and finite Chern sign | Cup coordinate 1 mod 3; unit input 1 | Regulator 1, finite Chern −1=2; trivial unit gives 0 on both sides | Intrinsic finite Chern sign is distinguished | Imported K2SymbolsBrauerPartII §5.5 and sign adapter |
| Transfers and coefficient compatibility | Consecutive degrees 2,3 on class 1 | Restriction/corestriction multiplies by 2 then 3: 6=2·3; inverse-restriction model gives 1 | Composite degree retained | Named transfer input and Check |
| Eigenform projection versus freely supplied classes | Idempotent matrix diag(1,0), vector (2,3) and scalar 5 | e(2,3)=(2,0); e²(2,3)=(2,0); e(10,15)=(10,0)=5e(2,3) | Actual projector is compatible with coefficient scaling | Specified projected geometric classes |
| Finite and relaxed local conditions | H¹=ℤ₅², H¹_f=ℤ₅×0; classes (1,0),(0,5),0 | Singular images 0,5,0; respective indices ∞,5,∞ in ℤ₅ | Finite at p is incompatible with required nonzero singular image | Both occurrences repaired |
| Rank-one singular-local finite index | ℤ₅/5ℤ₅; higher-rank negative control ℤ₅²/ℤ₅(1,0) | Cardinality 5, length 1; latter has rank 1 and infinite cardinality | A nonzero vector alone is insufficient in rank two | Rank one and finite index explicit |
| Reciprocity linearity and ordered sign | Values 2, −2, zero class | Swap gives −2; zero gives 0; a nonzero value cannot come from zero | Wrong class or sign excluded | Explicit class/reciprocity targets |
| Period rescaling and orientation | L=6, Ω=3; Ω′=6; f=q+2q² | L/Ω=2, L/Ω′=1; normalized integral −1−1=−2, reverse +2 | Scalar and direction cannot be dropped | Adapters and repeated orientation Check |
| Auxiliary-prime hypotheses | Upper-unipotent parameters 1,0,5 over ℤ₅ | Quotients ℤ₅; ℤ₅²; ℤ₅⊕ℤ/5 | Nonzero parameter is weaker than integral freeness | Arithmetic hypothesis verification retained |
| CM character branch | Gaussian ray moduli 3,5; torus element diag(2,3) over 𝔽₅ | Ray degrees 8/4=2,16/4=4; both eigenvalues differ from 1, fixed-space dimension 0 | CM is not forced through non-CM unipotent hypotheses | CM unit construction and descent explicit |
| Rank-zero conclusion in arbitrary coefficient degree | Two coefficient components of ranks 0,0; finitely generated rank-zero group; negative control ℚ/ℤ | Rational rank 0+0=0; ℤ/5 has size 5; ℚ/ℤ has rank 0 and infinite size | Mordell–Weil is essential | All coefficient degrees and finiteness preserved |
| Geometric isogeny bound B(d,H) | d=1,H=−1,0,985,986; identity | First three B=9,702,250,000,000; last B=9,721,960,000,000; identity degree 1 | Positive cutoff handles negative heights and d=1 | Explicit general bound |
| Quadratic-field scope and base change | d=2,H≤985; extend d=1 to 2 with same H | B=4·10⁷(985+4log 2)²≈3.9027787·10¹³, between 39·10¹² and 40·10¹² | Degree factor and logarithm both matter | All number fields, including quadratic |
| Existence rather than every isogeny | Identity and [n], n=10⁷ on one curve | Degrees 1 and 10¹⁴; B(1,H≤985)=9.70225·10¹² | Identity witnesses existence; large multiplication violates the stronger claim | Quantifier made explicit |
| Surface degree in period estimate | Product principal L; weight n=2; pullback degree Δ=3 | c₁(L)²=2, polarization-map degree 1; weighted intersection 4; pullback intersection 12=2·2·3 | The two degree conventions differ | Unnormalized intersection specified and checked |
| Non-CM period graph | E=E′, Δ=1; graph (y,x,y,x) | Dimension 2; intersection with {0}²×E² consists of (0,0,0,0), cardinality 1=Δ | Identity case matches Theorem 7.5 | Named period-graph theorem and proof inputs |
| Non-CM cyclic-isogeny corollary | δ=2, deg ψ=2, n=2; CM negative control [10⁷+i] | n²=4=2·2, δ divides n, δ≤deg ψ; CM degree 10¹⁴+1>4·10¹³ | Non-CM and cyclicity cannot be omitted | Separate corollary and negative Check |
| CM kernel really cyclic | Matrix [[10⁷,−1],[1,10⁷]] | Entry gcd 1; determinant 10¹⁴+1; Smith invariants (1,10¹⁴+1) | Counterexample is cyclic, not multiplication by an integer | Explicit CM Check |
| BPR prime ranges and endpoints | 14,000,000; 170,000,000,000; 10¹⁴ | First two are <10¹⁴; at 10¹⁴ both strict lower inequalities hold; 10¹⁴/170,000,000,000≈588.235 | Finite and infinite ranges cover endpoints | All cutoffs and overlap stated |
| BPR hypotheses and exponent descent | p=7,11,13,41; m=1,2,3,4,5 | Membership in allowed p-range: false,true,false,true; exponents 4→2,5→3; m=1 fails >1 | Small primes and exponent one are not generalized | Existing exclusions retained |
| Joint Cartan placement and intersection | (p,δ)=(3,2),(5,2),(7,3) | Group orders (48,480,2016); split orders (8,32,72); nonsplit orders (16,48,96); intersections (8,16,24)=4(p−1) | Compatible pair has the stated intersection | Joint placement fixed |
| Independent versus simultaneous conjugation | p=5,δ=2, g=[[0,1],[1,1]] | Independent conjugation gives intersection 8; simultaneous conjugation preserves 16 | Independent choices are not interchangeable | Negative Check added |
| p=2 Cartan convention and permutation identity | GL₂(𝔽₂)≃S₃; p=5 comparison | At 2: 3+1=1+3=4, intersection 2≠4; at 5: 15+1=10+6=16 | Odd-prime intersection law is not extended to 2 | Separate p=2 constituent calculation retained |
| Chen correspondence on p-new parts | Identity and zero endomorphism on positive-dimensional A | Identity kernel size 1; zero kernel A has infinitely many geometric points; both commute with Hecke | Permutation dimensions and equivariance do not prove the explicit map an isogeny | Nonzero-constituent theorem retained |
| Auxiliary-level distinction in Chen passage | r=1 and r=11; r=5,p=11 | dim J₀(1)=0, dim J₀(11)=1; rp²=605, exact divisor 121, gcd(121,5)=1 | Old-to-old is distinct from old-image vanishing | General coprime auxiliary level preserved |
| Critical Tate twist in the modular adapter | q=5 on y²=x³−x; coefficient prime 7 | Dual H¹: trace −2/5, determinant 1/5; twist one: −2,5; twist two: −10,125 | Critical moment must include cyclotomic untwisting | Twist-one step and Frobenius witness explicit |

**Acceptance declarations and signatures.** Every row's elaborated binders agree with its README statement; none changed.

| Declaration | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| localTerms | (0,0),(2,2),(3,2),(2,3) | (1,1,1,1,1); (1/4,0,−1,1,0); (5/9,1,1,−1,0); (3/8,0,1,0,0) | Zero-exponent and exceptional-prime conventions agree | None |
| martinValue | N=0,1,11,13,30,35 | 0,0,1,0,1,3 | Empty product and five local products agree | None |
| newDimension | N=1,11,13 | Dimensions 0,1,0; full Γ₁(13) new dimension is 2 | Trivial-character intersection retained | None |
| dimension_comparison | N=1,11,35 | Arithmetic and newspace values 0=0,1=1,3=3 | N≠0 binder retained | None |
| martin_bound | N=1,11,30,35 | 0<2; 12=12; 12<31; 36=36 | Both equality branches and strict case distinguish the criterion | None |
| norm_bound | K=ℚ,I=(2),x=2,B=2; excluded x=0 | 2≤2≤2; norm(0)=0 would fail lower bound | Nonzero, prime-above and embedding binders retained | None |
| rationality_of_small_prime_coefficients | Level 11 newform, Sturm prime range q≤2 | Index 12; a₂=−2; a₁=1,a₃=−1 integral | Trivial character and normalized native newform retained | None |
| integral_sturm_congruence | N=1,k=0,J=(2),constant forms 2 and 1 | Small range is n=0; 2 mod 2=0 versus 1 mod 2=1; later coefficients 0 | Constant coefficient remains in hypotheses | None |
| NonCM | j=1728 automorphism (x,y)↦(−x,iy) | Square equals [−1]; an integer scalar would require n²=−1, with no integer solution | Geometric endomorphisms, rather than rational ones, are tested | None |
| HasCyclicIsogeny | Identity; [2] | Degree 1, kernel size 1 and exponent 1; degree 4, kernel size 4 and exponent 2 | Cyclic geometric kernel excludes [2] | None |
| prime_isogeny_degrees | Candidate degrees 19,37,41 | Membership true,true,false | Prime and cyclic-isogeny hypotheses retained | None |
| noncm_prime_isogeny_degrees | Candidate degrees 19,37,43 | Membership false,true,false | NonCM explicitly retained | None |
| cyclic_isogeny_degrees | Degrees 1,12,14,20,21,22,27 | Membership true,true,true,false,true,false,true | Identity allowed, prohibited composites excluded | None |
| GeometricTorsion | n=0,1,2,3 in characteristic zero | All points at 0; finite sizes 1,4,9 at 1,2,3 | No finiteness assertion at 0 | None |
| torsionModule | P of order 2 | 3P=P; 2P=0; scalars reduce to 1,0 modulo 2 | ZMod action agrees with integer action | None |
| torsionRepresentation | S₃ example on roots of x³−2 | σP₀=P₁, τP₀=P₀; (στ)P₀=P₁, (τσ)P₀=P₂ | Identity and composition order agree | None |
| FullRationalTwo | x³−x, x³−2x, x³+x+1 | Rational killed-by-two cardinalities 4,2,1 | Predicate true,false,false | None |
| RationalTwo | Same three cubics | Nonzero rational two-point counts 3,1,0 | Predicate true,true,false | None |
| full_two_irreducible | Prime boundary 3 versus 5; rank-two F₅ model diag(2,3) and swap | Cyclic degrees 12 allowed,20 excluded; the two diagonal eigenlines are exchanged, so neither is invariant under both matrices | Lower bound and absolute-irreducibility conclusion retain their intended shape | None |
| rational_two_irreducible | Prime boundary 7 versus 11 | 2·7=14 permitted; 2·11=22 excluded | Bound 11 is retained | None |
| ImageInNonsplitCartanNormalizer | F₂₅ multiplication algebra; scalar algebra; split algebra | Cardinalities 25,5,25; split (1,0)(0,1)=0 | Cardinality plus field condition excludes scalars and split Cartan | None |
| nonsplit_of_not_surjective | p=37 versus 41; CM negative control at p=43 | Range predicates false,true; at 43 normalizer order 3696<3337488=order GL₂ | p>37 and NonCM remain explicit | None |
| lemos_integral_j | r=2,p=11,j=1728; excluded p=2,parameter t=3 | 1728∈ℤ; t=3 gives 19³/3=6859/3∉ℤ although the mod-2 normalizer is all GL₂ | Five-prime exclusion remains necessary; no NonCM binder added | None |
| lemos_surjectivity | CM j=1728,p=43; n=1; allowed-range p=41 | Proper normalizer order 3696<3337488; 1>1 is false; 41>37 true | NonCM, n>1 and p>37 retained | None |

Build command: `lake build TauCetiRoadmap.EllipticCurveModularityPartII.Suggested`.
Build exit status: 0; exactly 13 expected “declaration uses `sorry`” warnings, no errors.
Exact build outcome: `Build completed successfully (9233 jobs).`

Dependency direction output (no UPWARD or CYCLE line):

```text
depcheck: 47 roadmaps, 535 edges, 0 problem(s)
```

Exact gate summary:

```text
gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
