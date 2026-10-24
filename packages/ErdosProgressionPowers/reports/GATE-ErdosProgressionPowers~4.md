# ErdosProgressionPowers review response

## H01 (CBirkbeck) — applied

Generic local proofs → NeronModelsAndSemistableAbelianVarieties §§5.3g–5.3h and SerreWeightAndLevelOptimisation §§6.1–6.3; the three unlocated modular gaps → EllipticCurveModularity R29.3/R29.4/R29.6 and AutomorphicGaloisRepresentations §1.5 (`TauCetiRoadmap/ErdosProgressionPowers/README.md:39`, `:276`, `:773`, `:814`). The contracts retain actual torsion, ell≥5 for the general residual deletion formula, an actual modularity witness, the coefficient-prime exclusions and split/nonsplit signs; the progression wrapper, local verifications, level bounds and coefficient-prime bridge remain here, with discriminating Checks at line 834 (BS20 line 169, BS20 line 184, BS20 line 191).

## H02 (CBirkbeck) — answered

The dependency description must identify the nine open suppliers in the table below, place ErdosProgressionPowers after them, and distinguish those roadmap contracts from the unsubmitted LG/EC obligations and the unproved numerical inputs. The requested PR-description edit is outside this job's permitted files, so the worker must replace its “no prerequisites” and “no open PR before this one” claims with that statement; every listed supplier precedes ErdosProgressionPowers in the merge order, and the dependency check reports zero problems.

## H03 (CBirkbeck) — applied

The k=3 target restricted to ell=3 → every prime ell≥3, using the forced powers-of-two coefficients and equal products at length a<ell, including the a=0,1 repetition cases (`TauCetiRoadmap/ErdosProgressionPowers/README.md:1932`; ErdosSelfridge1975 line 329). New Checks compute 2·2=4·1 and 2⁴=16·1³, reject extending distinctness to length ell, and clarify why m=0,k=4 lies outside Theorem 2's least-prime hypothesis (`:1973`, `:2010`).

## Dependency correction for the worker

Replace the dependency and merge-order claims with: “This roadmap consumes the open supplier contracts listed below as well as the named roadmaps on main; these suppliers precede ErdosProgressionPowers in the merge order. The LG/EC contracts are unsubmitted obligations, and the seven analytic numerical inputs remain explicit proof obligations; neither is an unconditional supplied theorem.” The formalization of all supplier proofs need not be complete before a human decides to merge a roadmap.

| Open supplier | Inspected head | Consumed contract | Merge-order position |
| --- | --- | --- | --- |
| ArithmeticGaloisRepresentations | bef111d | §1.9 and §§3.1–3.3 | 50 |
| NeronModelsAndSemistableAbelianVarieties | 3710abd | §§5.3g–5.3h | 58 |
| AnalyticNumberTheoryPartI | 4ba2e21 | §§0.1–0.8, 0.16–0.20, 0.24–0.25, 1.4, 1.7, 3.1–3.2, with the stated input hypotheses | 98 |
| HeightsRationalPointsAndObstructions | 82cf8af | §§5.12 and 6.4, shared native Mordell theorem | 156 |
| WeightsInEtaleCohomology | 84a13f1 | R34.5–R34.6 | 163 |
| MordellLawrenceVenkatesh | 73dc3e8 | §6.4, ordinary coefficient model | 175 |
| SerreWeightAndLevelOptimisation | c9bed25 | §§6.1–6.3 | 182 |
| AutomorphicGaloisRepresentations | 81e9d0f | §1.5, arithmetic dual | 184 |
| EllipticCurveModularity | ed342f3 | R29.3, R29.4, R29.6 | 188 |

ErdosProgressionPowers is at position 263. No supplier was moved down and no new foundational construction was assigned here.

## Ownership, citations and pinned interfaces

Ownership searches covered main d225eaf, the indexed new-roadmap heads, board packages and all 32 sibling folders supplied in the brief, by the conductor, residual-discriminant, trace, consecutive-product and powerfree-coefficient objects. The generic elliptic results have the owners in H01; §7.1 retains ownership of its consecutive-product application and elementary length-three distinctness argument, and reuses §4.3's deletion theorem. The sibling matches concern function-field wild conductors and quadratic local twists, not a competing length-three theorem or rational elliptic residual-discriminant construction. LG.0–LG.5 and EC.0–EC.5 remain the two explicit board-design obligations, with their required statements preserved. No new Lean declaration or supplier import was introduced.

The four new supplier locators were read at the indexed heads in the table. All retained cross-roadmap citations were resolved against main or the permitted indexed new-roadmap heads: EllipticCurves Layers 2–6 and 8 and its Frey example; ModularForms Layers 2–4, 8 and 10; ModularCurves §4C; MordellLawrenceVenkatesh §§6.4/11.6; HeightsRationalPointsAndObstructions §§5.12/6.4; WeightsInEtaleCohomology R34.5–R34.6; LocalFieldsRamification Layers 3–4; ClassicalArithmeticCompletion §§1.51/4.41; ImaginaryQuadraticClassNumber H3.1; AlgebraicCurves Layers 7/12E; EtaleCohomologyFoundations §F.4.0; ArithmeticGaloisRepresentations §1.9 and §§3.1–3.3; and the listed AnalyticNumberTheoryPartI sections. Main's EllipticCurves and Completed/EffectiveBounds were read as shape references. Progress/revision pull requests were not substituted for main suppliers.

The final resolver's five missing-name leads are supplier targets: EtaleCohomologyFoundations §F.4.0 names `ContinuousRep.exists_stable_lattice_iff`; ArithmeticGaloisRepresentations §1.9 names `IntegralModel.residualSS`, §3.2 names `Conductor.artinConductor` and `Conductor.artinConductorNat`, and §3.3 names `Conductor.primeToPConductor`. Its remaining line, `1916: ErdosSelfridge1975, §2.1: no roadmap ErdosSelfridge1975 on main or in an open pull request`, is a source-citation false positive, referring to ErdosSelfridge1975 line 246.

Mathlib 6b7abb3 and Tau Ceti a91d3aa were confirmed against the content manifest. Native declaration lookup was repeated against those pins; no replacement carrier or generic conductor implementation was added. In particular:

| Native input | Pinned locator and condition |
| --- | --- |
| Weierstrass model and ellipticity | `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:76`, `:366`: the carrier is five coefficients and ellipticity asserts a unit discriminant; over a ring it is stronger than merely a nonzero discriminant. |
| Projective trace | `TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean:73`, `:102`, `:115`: affine equation solutions plus the point at infinity, trace q+1 minus that count; identification with the point group requires ellipticity and finiteness. |
| Twist scaling | `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean:169`, `:239`, `:952`: parameters t,n, discriminant t²−4n, sixth-power discriminant scaling and the Galois-equivariance sign. |
| Halving | `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/XSubT.lean:855`, `:961`: existing nonsingular point carrier, normal-form hypotheses and kernel equal to the image of doubling. |
| Squareclass character input | `TauCeti/NumberTheory/Multiquadratic/FundamentalDiscriminant/Character.lean:34`, `:94`, `:103`: actual character at level the absolute fundamental discriminant, primitivity and the odd-prime Legendre comparison. |
| Stirling inputs | `Mathlib/Analysis/SpecialFunctions/Stirling.lean:55`, `:131`, `:239`, `:276`: the existing sequence, telescoping logarithmic bound, limit and lower factorial estimate. |
| Bertrand | `Mathlib/NumberTheory/Bertrand.lean:222`: n≠0 and n<p≤2n, retaining the nonzero hypothesis. |

The arithmetic elliptic conductor, deletion level and residual-comparison carriers required by the two omitted headlines are absent from the pinned elliptic modules; the module docstring continues to name those missing interfaces. The native model, point-count and character declarations alone do not supply them.

All unsettled referenced works were accessed through the sources service or its legal cached extracts; no missing text remains. The publisher landing-page responses for Schoenfeld1976 and RamareRumely1996 were not treated as article text: their existing publisher/author PDF extracts supplied the cited passages. The four waived references and Mazur1978's existing uncertified status remain settled. No manifest was edited: only the two roadmap content files and this report are authorized, and the repair introduces no new cited work.

The relevant primary locators are BS20 line 169 (deletion, including the coefficient prime), BS20 line 184 (weight-two result), BS20 line 191 (both congruences), BS20 line 235 and Kraus1997 line 284 (full-two-torsion realization); ErdosSelfridge1975 line 70 (distinct products), ErdosSelfridge1975 line 329 (length three), ErdosSelfridge1975 line 340 (cubic ranges starting at four), and ErdosSelfridge1975 line 405 (higher odd exponents). Retained numerical obligations agree with Schoenfeld1976 line 1293 and RamareRumely1996 line 1385; no source was used to turn the seven conditional numerical inputs into proved supplier outputs.

One scratch module with `#check @name` for all nine declarations was elaborated and compared with README §§0.1, 1.9, 6.2–6.5 and 7.1. All three definitions and six theorem signatures retain their domains, nonzero/positivity conditions, primitivity, prime/composite distinctions and genus-range hypotheses; no binder was dropped and no signature changed, so `Suggested.lean` needed no edit. Effectivity remains the additional README proof obligation beyond its existential signature.

## Adversarial mathematics pass

The table records evaluated instances and boundaries for the retained statements and the repairs. Forced coefficient patterns are consequences of the contrary valuation hypothesis, not claimed actual progression solutions; H and H⁺ have no small-length examples. Numerical witnesses test the formulas and hypotheses; they do not prove the admitted deep theorems or discharge every finite-range inequality or supplier input.

| Statement | Instances tried | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Zero-based term | n=2,d=3,i=0,1; n=−3,d=2,i=2 | 2+0=2; 2+3=5; −3+4=1 | Matches | Retained |
| Nonnegative gcd convention | n=−3,d=2; n=d=0 | gcd=1; gcd=0 | Signs and zero retained | Retained |
| Primitive solution conjunction | (1,24,3,35,2); (−3,2,4,3,2) | 1·25·49=1225=35²; (−3)(−1)1·3=9=3²; both gcd=1 | Positive and signed witnesses | Retained |
| Positive length and primitivity | k=0; n=4,d=2,k=1,y=2,ell=2 | Empty product=1; 4=2² but gcd=2≠1 | Both excluded | Retained |
| Nonzero terms | n=−2,d=1,k=3 | Product (−2)(−1)0=0; y·d≠0 forces y≠0 | Zero-term equation excluded | Retained |
| H and H⁺ | k=0,1,2 | k−10⁸<0 and k−2·10¹⁰<0 in each case | Both predicates false | Retained |
| Gcd of terms | n=1,d=24,i=0,j=2; n=−3,d=2,i=0,j=3 | gcd(1,49)=1 divides 2; gcd(−3,3)=3 divides 3 | Signed divisibility holds | Retained |
| Large-prime valuation | S(8,19,2,6,3), q=2,3 | v₂(8)=3, v₂(27)=0; v₃(8)=0,v₃(27)=3 | Each divisible by ell=3 | Retained |
| Strict signed factorization | Same S at k=2 | A=(1,1), z=(2,3); 8=1·2³,27=1·3³ | Prime equal to k stays large | Retained |
| Small powers retained | n=64,d=0,k=3,ell=3 | A=64,z=1 gives 64; A=1,z=4 gives 64 but z has forbidden prime 2<3 | Wrong model excluded | Retained |
| Signed odd root | n=−8,d=7,k=2,ell=3 | (A,z)=(1,−2),(1,−1); product 8=2³ | Negative factors retained | Retained |
| Strict progression triples | k=0,1,2,3,5 | Cardinalities 0,0,0,1,4; at k=3 only (0,1,2) | No constant or empty-range triple | Retained |
| Equal-sum quadruples and κ | (0,1,1,2); (0,1,2,3); (1,2,2,3) | κ=−1,−2,−1; sums 2=2,3=3,4=4 | Sign fixed | Retained |
| Quadruple exclusion | (0,1,1,3) | Middle sum 2≠3 endpoint sum | Excluded | Retained |
| Divisibility index set | n=1,d=2,k=6,r=3; r=0 | I₃={1,4}; I₀=∅ since no term is zero | Native divisibility, no quotient | Retained |
| Empty and right-end indices | k=0; n=d=1,k=3,r=4 | Empty; index 3 would give 4 but is outside range | Endpoint excluded | Retained |
| One-class count | I₃ above; n=d=1,k=3,r=1000 | 2≤6/3+1=3; 0≤3/1000+1 | Large divisors retain +1 | Retained |
| θ versus ψ | x=2,4 | θ(2)=log 2; ψ(4)=2 log 2+log 3 | Prime powers separated | Retained |
| Euler-product domain | x=1 | Product=1; 2 log 1=0 | Lower domain needed | Retained |
| Divisor subpower input | n=4=2² | τ(4)=3, squarefree count would be 2 | Nonsquarefree input retained | Retained |
| Mod-eight endpoint errors | k=2·10¹⁰, ε=0.002811 | Endpoints k,k/2 contribute 3εk/8, versus incorrect 4εk/8 | k/2 remains included | Retained |
| Arithmetic Frobenius convention | c_p=0,p=3 | Polynomial T²+3, determinant +3 | Sign fixed | Retained |
| Residual conductor at good reduction | dim=2, fixed dim=2, Sw=0 | 2−2+0=0 | No prime factor | Retained |
| Raw tame-unipotent conductor | Fixed dimension 1 versus semisimplified dimension 2 | 2−1=1 versus 2−2=0 | Cannot semisimplify inertia first | Retained |
| Multiplicative residual discriminant formula | v_p(Δ_min)=ell or 1 | Residual exponents 0 or 1; Tate-module exponent=1 in both cases | Invariants distinguished | Consumed from Néron-model supplier |
| Coefficient-prime exclusion | Mod-ell cyclotomic character | Away-from-ell exponents all 0, prime-to-ell conductor=1 | Does not assert unramifiedness at ell | Retained |
| Martin bound | N=1,11 | g⁺=0≤2/12; g⁺=1=(11+1)/12 | Positive levels retained | Retained |
| Γ₀ index | N=1,4,11,44 | μ=1,6,12,72 | Correct prime and prime-power factors | Retained |
| Kraus F,G,H | N=1 and N=11 | (1,4,4); (9,169,169) | Maximum and newspace matter | Retained |
| Kraus realization input | Full-two-torsion curve y²=x³−x, N=32 | μ=48, g⁺=1, H=81; ell=83>81; choosing F=E preserves conductor 32 | Consistent native witness; source requires input two-torsion | Retained |
| Removed-prime nonzero norm | p=2,5 | p+1−2√p≈0.171573,1.527864, both positive | Norm comparison cannot be zero | Retained |
| Irreducibility cutoff domains | ell=5,7,11 | Full-two-torsion cutoff accepts 7,11; one-point cutoff accepts only 11 | Distinct cutoffs retained | Retained |
| Rational-isogeny surjectivity domain | ell=37,41 | 37>37 false; 41>37 true; CM j=1728 fails non-CM input | Boundary and CM exclusion retained | Retained |
| First Frey normalization | n=d=1; n=2,d=1, triple (0,1,2) | g=1,(a,b,c)=(1,−4,3); g=2,(1,−3,2) | Positive gcd used | Retained |
| First discriminant identity | Same two triples | Δ=2304=64·1²·2²·3²; Δ=576=64·2²·3²·4²/2⁶ | Both formulas agree | Retained |
| First c₄ identity | Same two triples | c₄=16(1+12)=208; c₄=16(1+6)=112 | Native normalization | Retained |
| Generalized Fermat identity | n=d=1, indices 0,1,2 | 1−2·2+3=0 | Index coefficients fixed | Retained |
| Second Frey A−B identity | n=d=1,q=(0,1,1,2); n=−3,d=2 | 3−4=−1=κd²; −3−1=−4=κd² | Signs agree | Retained |
| Second discriminant | Same two q | −64(−1)³3²·4=2304; −64(−1)³(−3)²·1=576 | Correct sign and powers | Retained |
| Second c₄ | Same two q | 16(−1)(−4−9)=208;16(−1)(−16+9)=112 | Agrees with native coefficients | Retained |
| Second-family local domain | q with κ=−1, prime p=2 | c₄=208 has v₂=4, not a unit | Odd/half-interval local restrictions needed | Retained |
| First deletion-level bounds | k=1,2 boundary | 2⁷∏_(q≤k)q=128,256; k<10⁸ prevents H applications | Primorial convention and domain retained | Retained |
| Second deletion-level factor | κ=−2 | κ²=4; signed κ itself=−2 | Positive exceptional factor, not signed κ | Retained |
| Half-interval headline | k=1,2 | H false in both; at k=2 the interval contains p=2, but theorem cannot be applied | H remains essential | Retained |
| Coefficient-prime bridge | Tate valuation ell, p≠ell | Deletion exponent=0=residual exponent; rational elliptic exponent=1 | Equality is a theorem, not a definition | Retained |
| Kraus threshold comparison | N=1,11 | H_K=4,169; exp(10^k)>169 already for k≥1 | Numerical direction correct; progression level hypotheses still required | Retained |
| Comparison-curve headline | F=E:y²=x³−x, conductor 32, ell=83 | Both conductors 32; both traces at 5 equal −2; identity residual intertwiner | Consistent actual-curve test; headline still unstatable | Retained |
| Good-prime integer trace lifting | p=5, candidate traces −2 and 2, ell=7 | Difference 4≠0 mod 7; Hasse width 4√5<9 | Congruence alone needs ell>4√p | Retained |
| Symmetric trace-zero test | p=3,7, curve y²=x³−x | Counts 4,8; p+1−count=0,0 | Trace sign consistent; supersingular p≥5 clause retained | Retained |
| Scaled Legendre coefficients | D=2,λ=1/2 | a₂=−3,a₄=2, Δ=64; D=1 gives Δ=1 | Scale-two normalization | Retained |
| Degenerate Legendre inputs | D=0 or λ=0,1 | Δ=16D⁶λ²(λ−1)²=0 | Not elliptic | Retained |
| Arbitrary twist needed | D=3,λ=−1 | Equation x³−9x; root differences ±3,±6 are not 2 times nonzero rational squares | Cannot force D=2 | Retained |
| Six labelled orderings | λ=2 | Values 2,1/2,−1,−1,2,1/2; six labels but three values | No six-element-set assertion | Retained |
| Root normalization | Roots 0,3,−3 | D=3,λ=−1; Dλ=−3 for reversed last roots | Scale changes with ordering | Retained |
| Good-prime unit/support contract | λ=2 at p=5; squareclasses 2,−2 | v₅(2)=v₅(−1)=0; conductors 8,8 have odd part 1 | Units and dyadic conductor retained | Retained |
| Twist-trace comparison | p=5,λ=4,D=1,2 | Counts 8,4; traces −2,2; (2/5)=−1 | Trace multiplied by twist character | Retained |
| Odd-field square-parameter subgroup | p=7,λ=2=3²; p=3,λ=2 | Counts 8 and 4; second parameter nonsquare | Generalization and negative control agree | Retained |
| Exact two-primary symmetric count | p=5,λ=−1 | #=8; v₂=3 | Not divisibility by 16 | Retained |
| Case-II corrected point | λ=1/2, t=v=1/2, i²=−1 | P=(1+i,−1+i); both sides of equation=−2i; 2P=(1,0) | Order four, correct twist | Retained |
| Case partition | λ=3,−1,2,0; k=0 | 3 outside both classes; −1 in −ℚ²;2 in 2ℚ²;0 in both; A(0)=∅ | Exhaustive relative partition | Retained |
| Case-I mod-eight projection | p≡3,5 mod8 | Signs for p≡3 give μ₁−μ₂−μ₃+μ₄=4(λ/p); p≡5 gives 0 | Projection direction fixed | Retained |
| Prime-to-von-Mangoldt margin | ε=0.002811 | (1−3ε)/8=0.123945875; subtract 0.000045875 gives 0.1239 | Strict margin preserved | Retained |
| Case-II positive normalization | t=v=1/2 | 2t²+2v²=1;λ=1/2;tv=1/4 square | Positive rational witness | Retained |
| Both Case-II point-count signs | p=5, symmetric a_p=−2 | p+1−a_p=8; p+1+a_p=4; neither divisible by 16 | Both signs needed | Retained |
| CM integrality obstruction | Coprime a=1,b=−4,c=3 | j=256·13³/12²=35152/9, not integral | Odd denominator obstructs CM | Retained |
| Quartic descent input | T=V=U=1; T=V=2,U=4 | 1+1=2;16+16=2·16 but gcd=2 | Primitivity excludes scaling | Retained |
| Character conductor convention | Fundamental discriminants −4,8,24 | Conductors 4,8,24; odd parts 1,1,3; 2-parts 4,8,8 | Nontrivial odd part is extra | Retained |
| Character-family point values | Primitive conductor 5 | χ(1)=1,χ(0)=0; principal conductor1 instead has χ(0)=1 | Principal family excluded | Retained |
| Half-interval weighted sum | k=0,1,2,4, value=1 | 0,0,log2,log3+log2 | Upper endpoint and prime power correct | Retained |
| Exceptional-zero interval | N=1; c*=log2,N=2 | log1=0 invalid denominator; at N=2 lower endpoint=0 | Strict positive width restrictions retained | Retained |
| Repulsion iteration | j=1,2 | N₁=N₁^(2⁰); N₂>N₁² | Strictness starts at j=2 | Retained |
| Largest-prime conductor bound | N=4,8,24,16 | P=2,2,3,2; 0.94log24≈2.987<3;16 not primitive quadratic conductor | Primitive and dyadic inputs essential | Retained |
| Smooth-sum r=1 domain | q=5 | Max includes 5^(1/4); minimum R=5^(3/2)≈11.1803 | Empty other-modulus list does not erase q factor | Retained |
| Finite Gram inequality | x=e₁; y₁=e₁,y₂=e₂, then y₁=y₂=e₁ | LHS=1≤1, then LHS=2≤2 with row maxima 1 and 2 | Diagonal-only bound fails in the second case | Retained |
| Off-diagonal correlation domain | Equal real quadratic characters at modulus5 | χ² values 1,1,1,1,0 per period; mean 4/5 | No strict power saving for equal functions | Retained |
| Harmonic criterion cutoff | Reciprocal mass 0.166 | 2.13/0.166≈12.8313; exp≈373743.608<400000 | Integer conductor≤373743 | Retained |
| Many-character mean-square margin | Constants 1/68 and 0.1239² | 0.0147058824<0.01535121 | Correct square, not fourth power | Retained |
| Quantitative Roth cutoff | δ=10⁻⁵ | 132log2/δ≈9149542.783 lies between 10⁶ and 10⁷ | Certified larger cutoff retained | Retained |
| Thin prime intervals | k=1,2,16 | T_pr=∅,{2},{5,7,11,13}; U_pr(1)=∅ | Open lower endpoints retained | Retained |
| Sieve survivor definition | n=d=k=1,S=∅ | No forbidden prime divides term1; J={0} | Not identically empty | Retained |
| Thin-set condition | k=9,S=∅,{7},{2},{9} | Masses 0,1/7,1/2,1/9; last is not prime | Only first two thin | Retained |
| Maximal-valuation deletion | n=d=1,k=5,A=(1,2,3,4,1) | Remove indices2,3; J₁={0,1,4}; product2 divides24 | General coefficient wrapper reused | Retained |
| Deletion tie and empty value | J=∅; J={2,5}, A≡1 | Selected junk index0; nonempty tie chooses2 | Empty value not used as member | Retained |
| Deletion least tie | n=d=1,k=4,A=(1,2,1,2) | v₂ at indices1,3 both1; removes1 | Deterministic tie convention | Retained |
| Stirling upper adapter | m=1 | 1! =1; sqrt(2π)e^(−1+1/12)≈1.002274>1 | Correct denominator and sign | Retained |
| Sieve density margin | Main losses log(16/7)+0.17 | 1−0.826678573−0.17≈0.003321427>0.0032 | Positive margin before errors | Retained |
| Coefficient-density exponent | 0.00319 retained density, product exponent0.44 | 0.44/139≈0.003165468; difference≈0.000024532>10⁻⁵ | Markov step has margin | Retained |
| Thin witness dyadic allowance | k=256 | 2⁸ k⁴¹⁷=k⁴¹⁸ at256; strict inequality for larger k | Large-k restriction needed | Retained |
| Smoothness endpoint | logk=2 | 2^(1−10⁻⁴)<2^(1−1/20000) | Closed first bound becomes strict second bound | Retained |
| Landau–Page boundary transport | c=c₀/2,T=e | 1−c₀/2>1−c₀ | Closed narrow strip inside strict wide strip | Retained |
| T total function | k=0,1 or c=0 | Total exponent0, hence T=1 | Junk values separated from analytic domain | Retained |
| Exceptional set size bound | k=0; any k with q=0 or q>k⁴ | q-range empty at0; forbidden q not in range | Bounds enforce finiteness | Retained |
| Exceptional zero witness | χ₅ even at ρ=0,k=16,c=0 | L(0)=0; T=1;1−3loglog16/log16≈−0.103<0 | Nonempty witness example | Retained |
| Principal pole exclusion | χ=1,ρ=1 | Both alternatives ρ≠1 and χ≠1 false | Cannot witness a zero at pole | Retained |
| Common-height kernel | ρ=0 | Integral from k/2 to k of dt/t=log2≈0.693147;1/abs(ρ) undefined mathematically | Integral removes singularity | Retained |
| Bad-index divisor threshold | q=8 and q=1000 | q^(1/3)/2=1 and5; r=1000>k=3 is admissible | Divisors cannot be truncated at k | Retained |
| Summed residue rounding | k=3,r=1000 | k/r=0.003 versus allowed one residue; k/r+1=1.003 | +1 cannot be omitted | Retained |
| Granville size inequality | k=64 | 8·64^(7/2)=64⁴=16777216 | Equality pins threshold | Retained |
| Exceptional conductor detection | Nodd=30, supported across coefficients2,3,5 | Product of gcds=30≥N/8 when N≤240 | Same conductor support used | Retained |
| Granville contradiction constant | Lower bound0.1239k, upper Ck/logk | At logk=2C/0.1239 upper=0.06195k<0.1239k | Effective large-k contradiction direction | Retained |
| Shared Mordell native genus | Diagonal k=3,ell=4 versus k=4,ell=2 | Genus3 meets ≥2; genus1 fails | Correct owner, no genus-one finiteness inference | Retained |
| All coefficient embeddings bound | Weight2,p=5, c₅=−2 on y²=x³−x | abs(c₅)=2≤2√5≈4.472136; at p=2 bound still concerns coefficients if p∤N | All embeddings and away-level premise retained | Retained |
| Effective prime-bound zero branch | n=d=y=0 | y·d=0 but gcd0=0 fails; n=y=1,d=0 gives gcd1 and y·d=0 | Nontrivial branch cannot erase the disjunction | Retained |
| Signed hyperbolicity | (k,ell)=(3,4),(4,3),(5,2) | 2g−2=4,18,8; genera3,10,5 | Positive canonical degree | Retained |
| Signed elliptic boundary | k=4,ell=2,n=−3,d=2 | 2ell+k=kell=8; product9; genus1 | Strict inequality necessary | Retained |
| Positive elliptic boundaries | (4,2),(3,3),n=d=1 | Products24 and6; genera1,1 | Arithmetic exclusions, not Mordell, handle them | Retained |
| Correct diagonal elimination | One-based t₁=a+d,t₂=a+2d,j=3 | 2t₂−t₁=a+3d; incorrect3t₂−2t₁=a+4d | Correct source-index adapter | Retained |
| Signed projective lifting | Nonzero primitive vector v and scalar r | Integral primitive representatives v and −v; scaling by2 gives gcd2 | Finite fibre, no arbitrary integral scaling | Retained |
| Composite exponent identity | y=−2,ell=6,p=3 | (−2)⁶=64=((−2)²)³ | Signed power law | Retained |
| Absolute base exclusion | k=3,d=1, terms−1,0,1 | Product0 cannot equal ±1; three nonzero distinct terms cannot all have abs1 | y=0,±1 cannot supply nontrivial long solution | Retained |
| Root/exponent fibre | Y=64 | (y,r)=(64,1),(8,2),(−8,2),(4,3),(2,6),(−2,6) | Six pairs; bounded exponent by v₂=6 | Retained |
| Fixed-length finiteness quantifiers | Prime exponents p for fixed k | p≤floor(exp(10^k)) gives finitely many p; k still unbounded across statements | Does not assert one finite set over all k | Retained |
| Consecutive headline hypotheses | n=1,k=2; n=4,k=1; n=0,k=2 | Product2; product4=2² excluded by k; product0 excluded by n>0 | Positivity and k≥2 essential | Retained |
| Sylvester–Schur input | m=4,k=3 | Product5·6·7=210; prime7>3 divides it | Positive concrete instance | Retained |
| Size reduction under contrary valuation hypothesis | k=3,ell=2 | (k+1)^ell−k=13>k^ell=9 | Inequality m+k≥16 forces m>9 | Retained |
| Strong valuation theorem boundary | m=0,k=3 and 4,ell=2,3 | v₃(6)=1 at prime 3≥k; v₃(24)=1 at 3<k and 4<5=least prime≥4 | First is in the theorem; second fails its hypothesis | Boundary Check clarified |
| Powerfree coefficient definition | Terms8,9 at ell3 | 8=1·2³;9=9·1³ | Full-small-part alternative differs | Retained |
| Powerfree uniqueness | Terms4,5 at ell2 | 4=1·2²;5=5·1²; alternative a=4 for term4 is not squarefree | Wrong factorization excluded | Retained |
| Powerfree support clause | m=3,k=2,ell=2 | a=(1,5), prime5≥2; full product20 has v₅=1 | Support needs valuation hypothesis | Retained |
| Unit coefficient case | m=0,k=1,ell=2,3 | Term1 gives a=x=1 in both | Positive unit and exponent domain retained | Retained |
| Product distinctness empty multiset | r=0 | Both products1; both multisets empty | No false strictness at r=0 | Retained |
| Product distinctness positive witness | m=28,k=3,ell=3,r=2 | Products841,870,899,900,930,961; six distinct exponent vectors modulo3 | No rational-cube ratio collision | Retained |
| Product distinctness negative control | m=1,k=7,ell=3 | a=(2,3,4,5,6,7,1);2·6=3·4=12;1≤7³ | Size hypothesis indispensable | Retained |
| Square distinctness negative control | m=1,k=7,ell=2 | a=(2,3,1,5,6,7,2), repeated2 | Size hypothesis indispensable | Retained |
| Reused deletion support | m=0,k=5,ell=2 | Retained a-product5 does not divide24; support fails at prime5=k | Correct application requires support | Retained |
| Exact retained cardinal padding | k=5, π(k−1)=2 | Required retained cardinal3; deleting an extra factor1 preserves any divisibility | Padding direction correct | Retained |
| Rectangle-free graph inequality | Empty graph; star s=1,t=2 | 0≤s+binom(t,2); star edges2=1+1 | Includes empty parts | Retained |
| Rectangle exclusion negative control | K₂,₂ | Edges4>2+binom(2,2)=3; one four-cycle | Missing condition would be false | Retained |
| Multiplicative cover corollary | B={1,2,3},U=B,V={1} | Products1,2,3,4,6,9 distinct; cardB=3=3+0 | Positive saturating example | Retained |
| Multiplicative distinctness exclusion | B={1,2,4} | 1·4=2·2=4 | Repeated factors must be included | Retained |
| Smooth covering sets | Support≤7,size≤36; support≤11,size≤100 | Cardinalities25,55;11 and13 excluded respectively | Not all integers in interval | Retained |
| Ordered coefficient lower bounds | i=422,6993 | At422: i=422 versus3.5694·118≈421.1892; at6993:3.5694·6689≈23875.7166 versus4.3402·5501≈23875.4402 | Source crossover ranges agree | Retained |
| Large-length factorial comparison | k=30000, π(k)=3245 | log lower-product−log(k!)≈968.348>0 | Positive boundary witness; universal inequality remains target | Retained |
| Large-length persistence samples | k=30001,100000 | Log margins≈969.644 and15873.087 | Correct direction beyond boundary | Retained |
| Small cubic count | k=4,m=2 | f≥4;f(f−1)≥12>3²=9 | Smallest finite interval begins at4 | Retained |
| Cubic interval boundaries | k=9,10,27,28 | Lower f=5,8,11,16; ratios20>9,56>27,110>27,240>81 | Adjacent ranges covered | Retained |
| Cubic later interval boundaries | k=76,77,142,143 | Lower f=22,30,38,50; ratios462>81,870>243,1406>243,2450>729 | Adjacent ranges covered | Retained |
| Cubic final small boundaries | k=339,340,645,646,999 | Lower f=70,91,110,145,164; ratios4830>729,8190>2187,11990>2187,20880>6561,26732>6561 | Endpoint choices consistent | Retained |
| Middle-range cubic count | k=1000,r=4,q₁=19 | F≥255;64770>45927=3⁷·21 | First middle endpoint covered | Retained |
| Square-root prime boundary | k=10609=103²,r=19,q₁=23 | Include prime103;F≥1957;3827892>2499741 | Closed √k endpoint is usable | Retained |
| Last middle cubic count | k=29999,r=31,q₁=29 | F≥4853;23546756>19545219 | Last endpoint covered | Retained |
| Uniform higher odd prime, small range | ell=5,k=4,m=2 | binom(7,4)=35>5²=25 | Does not stop at ell=3 | Retained |
| Uniform higher odd prime, middle range | ell=5,k=1000,r=4,F=255 | binom(258,4)=180352320>5⁷binom(8,4)=5468750 | Formula's r and ell factors agree | Retained |
| Ratio pattern count | r=1,2 | r²+r+1=3,7: zero, signed singles, and ordered distinct numerator/denominator primes | Includes cancellation | Retained |
| Square residue density | Modulus36 | Divisible by4:9, by9:4, intersection1; union12, complement24 | Wrong subtraction gives23 | Retained |
| Square branch prime-product range | k=71,72,296,297 | θ(k−1)≈57.3236,61.5863,277.0250,277.0250, each<k | Finite-range endpoint witnesses | Retained |
| Square support-count branch | Primes {2,3}, {2,3,5}, {2,3,5,7} | Squarefree possibilities4,8,16 versus required5,9,21 | Counting contradiction direction fixed | Retained |
| Four consecutive factors identity | m=0,1 | Products24=5²−1;120=11²−1 | Strictly between consecutive squares | Retained |
| Erdős threshold predicate | K=0,3; n=1,d=24,k=3,y=35,ell=2 | 1225=35² and gcd1 | Both thresholds false | Retained |
| Threshold monotonicity | K=3,L=4 | Range k≥4 is a subset of k≥3 | Implication is upward in threshold | Retained |
| Smooth multiplier equation | τ=0,b=1, primitive square example | 1225=1·35²; multiplier prime support empty | Recovers primitive predicate | Retained |
| Nonunit multiplier endpoint | n=d=y=1,k=2,ell=2,b=2 | Product2=2·1²; support needs2≤2τ, exactlyτ≥1 | Closed endpoint, outside τ<1/2 discussion | Retained |
| Zero multiplier exclusion | b=0 | RHS0; definition requires0≠0 | Excluded independently of support | Retained |
| Supplied lower Stirling inequality | m=0,1 | 0≤1; sqrt(2π)/e≈0.922137≤1 | Includes the natural zero case | Retained |
| Supplied good/multiplicative conductor values | Fixed dimensions 2 and 1, Swan 0 | 2−2+0=0; 2−1+0=1 for either multiplicative sign | Matches §5.3g | Local proof → supplier |
| Rational wild bounds | Normalized v₂(2)=v₃(3)=1; Q₂ curve y²=x³−x | Bounds 2+6=8 and 2+3=5; the Q₂ example has f₂=5>2 | A tame-only bound fails | Consumed from §5.3g |
| Residual multiplicative formula | p=11, v₁₁(Δ_min)=5, ell=5 and 3 | 5 mod5=0 gives exponent0; 5 mod3=2 gives exponent1 | Actual torsion, p≠ell | Consumed from §5.3h |
| Prime-to-ell global deletion | 11a1, M=11, ell=5 | 11/11=1 equals residual conductor1 | Does not preserve the elliptic conductor11 | Explicit supplier contract |
| General residual comparison range | Supplier's 141a1, ell=3, M=141, v₃(Δ_min)=7, v₄₇=1 | M₀=141 while N(E[3])=47 | ell=3 additive comparison would fail | ell≥5 retained |
| Modularity witness at exact conductor | 11a1 and its attached f₁₁, good p=3 | Level11=conductor11, a₃=c₃=−1; polynomial T²+T+3 | Actual attached form, every good prime | Replaced unlocated modularity gap |
| Witness and irreducibility requirements | 11a1 at ell=5 | M₀=1 but g₀⁺(1)=0; rational 5-torsion makes E[5] reducible | Local deletion alone cannot produce a cuspidal form | Inputs retained in §6.2 contract |
| Deletion includes coefficient prime | M=33, v₃(Δ)=6, v₁₁(Δ)=2, ell=3 | Correct 33/3=11; omitting coefficient-prime deletion gives33 | Arithmetic data are not curve data | New Check |
| Deletion retains higher conductor powers | M=45, v₃(Δ)=v₅(Δ)=7, ell=7 | Remove5 only, M₀=9; removing3 too would give3 | Condition p∥M essential | Supplier contract tested |
| Empty deletion and domain | M=1, Δ=1, ell=3; M=0 or Δ=0 | Empty product1 gives M₀=1; 0 fails M>0 or Δ≠0 | No valuation at zero used | Domain retained |
| Good-prime congruence | Attached form of 11a1 at p=3, ell=7 | a₃=c₃=−1≡6 mod7; determinants3≡3 | Same form and residue embedding | Prove → consume §6.3 |
| Removed-prime trace signs | p=7, ell=5, split/nonsplit local type | +(7+1)=8≡3; −(7+1)=−8≡2 | Both local signs required | New Check |
| Excluded coefficient prime | p=ell=5 | p divides ell M₀ for every M₀, so p∤ell M₀ is false | Neither trace-congruence clause applies | Exclusion retained |
| Arithmetic dual convention | Weight2, trivial character, p=3, c₃=−1 | Arithmetic polynomial T²+T+3; cohomological dual at arithmetic Frobenius T²+T/3+1/3 | Constants3 and1/3 differ | Replaced newform-representation gap |
| Reduction characteristic polynomial | Previous polynomial reduced modulo5 | T²+T+3, determinant3 in F₅; dual constant1/3=2 mod5 differs | Arithmetic convention survives reduction | Supplier specialization retained |
| Coefficient-field scalar extension | Nontrivial tame unipotent matrix over F₅, then F₂₅ | Fixed-space dimensions1,1 and conductors1,1 | Actual action survives extension | Wrapper retained |
| Stable-lattice context | Rank0; S₃ permutation action on Z₅³ | Zero lattice rank0; transposition matrix preserves rank3 lattice and has fixed dimension2 | Compact finite group works without commutativity | Retained |
| Native ellipticity over a ring | Scaled λ=1/2 equation over Z with Δ=64 | 64≠0 but64 is not a unit in Z; over Q it is a unit | Nonzero discriminant alone is insufficient over rings | Retained carrier condition |
| Two Frey local adapters | First model n=d=1, p=3 and p=5 | Δ=2304, c₄=208; at3: v₃(Δ)=2, c₄ mod3=1; at5: Δ mod5=4 | Multiplicative and good branches have correct hypotheses | Application verification retained |
| Length-three support | k=3, prime ell=3 or5, contrary valuation condition | Only prime below3 is2; all coefficient exponents are in {0,…,ell−1} | No omitted odd support | Uniform k=3 target added |
| Length-three even offset | Forced odd-term coefficients, m even | Two one-factor products1=1 at distinct indices | Violates distinctness at1<ell | New Check |
| Length-three odd offset, a=0 | Forced coefficients1,2,1 | Repeated one-factor products1=1 | Covers remainder0 | New Check |
| Length-three odd offset, a=1 | Forced coefficients1,2,2 | Repeated one-factor products2=2 | Covers remainder1 | New Check |
| Length-three odd offset, ell=3 | a=2, coefficients1,2,4 | 2·2=4·1=4 at length2<3 | Different multisets | Scope extended beyond a cubic-only plan |
| Length-three odd offset, ell=5 | a=2,3,4 | Products4=4·1,8=8·1²,16=16·1³ at lengths2,3,4<5 | Every nonrepeating remainder covered | New uniform argument |
| Length-three higher odd primes | ell=7,11, maximal remainder a=ell−1 | 2⁶=64·1⁵=64; 2¹⁰=1024·1⁹=1024; lengths6<7 and10<11 | Same general identity reaches the last remainder | New uniform argument |
| Distinctness strict length boundary | ell=3, coefficients1,2, length3 | Ratio2³/1³=8 is a rational cube with distinct multisets | Cannot extend the lemma to r=ell | Negative-control Check added |
| Least-prime range in valuation theorem | m=0,k=4 | Product24 has v₂=3,v₃=1 and no prime≥4; m+k=4<5 | Outside theorem, not a counterexample | Check clarified |
| Smooth-conductor error exponent | log k=16, c₁=1/4 and3/4 | 16^min(1/4,1/2)=2; 16^min(3/4,1/2)=4 | Does not always use c₁ | Retained |
| Raw versus semisimplified local action | Nonidentity unipotent 2×2 matrix over F₅ and its inertia semisimplification | Fixed dimensions1 and2; codimensions1 and0 | Conductors must be computed before this local semisimplification | Retained |


## Build and gate outcomes

Commit: `e007747` (README only). `Suggested.lean` is unchanged; no push or external reply was made.

The nine-declaration scratch signature elaboration exited 0, with the six expected admission warnings. The specified build exited 0:

```text
⚠ [8976/8976] Built TauCetiRoadmap.ErdosProgressionPowers.Suggested (2.3s)
warning: TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean:47:8: declaration uses `sorry`
warning: TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean:53:8: declaration uses `sorry`
warning: TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean:59:8: declaration uses `sorry`
warning: TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean:65:8: declaration uses `sorry`
warning: TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean:72:8: declaration uses `sorry`
warning: TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean:81:8: declaration uses `sorry`
Build completed successfully (8976 jobs).
```

The final dependency-direction check exited 0; its entire output is:

```text
depcheck: 33 roadmaps, 303 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The pre-commit gate failed only on `dirty=1` for the authorized README edit; after the required commit, the same specified gate exited 0 with this exact summary:

```text
gate ErdosProgressionPowers: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
