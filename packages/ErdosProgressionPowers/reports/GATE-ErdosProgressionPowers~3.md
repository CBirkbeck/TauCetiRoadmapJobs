# ErdosProgressionPowers review response

## H01 (CBirkbeck) — applied

Unconditional LG/EC supplier claims → explicit `gap:legendre-character-interfaces` and `gap:effective-modular-comparisons`, preserving every obligation and marking their uses in Layers 1–2 (`TauCetiRoadmap/ErdosProgressionPowers/README.md:418`, `:437`, `:466`); Kraus realization now explicitly retains full rational two-torsion on the input E (`:450`; Kraus1997 line 284). The specifications exist at `packages/EllipticLegendreCharacterInterfaces/design/README.md` LG.0–LG.5 and `packages/EllipticModularityEffectiveComparisons/design/README.md` EC.0–EC.5, but neither is a submitted repository supplier; the ordinary model remains MordellLawrenceVenkatesh §6.4.

## H02 (CBirkbeck) — applied

The unlocated Faltings gap → HeightsRationalPointsAndObstructions §§5.12/6.4 `mordell_finite`, with smoothness, properness, geometric connectedness, dimension one, finite-dimensional H¹, native genus and points over Spec K retained (`TauCetiRoadmap/ErdosProgressionPowers/README.md:278`, `:1648`, `:1672`). AlgebraicCurves Layer 12E remains the genus comparison, and MordellLawrenceVenkatesh §11.6 is identified as an alternative proof of the shared declaration; Faltings1983 line 682 gives the classical endpoint.

## H03 (CBirkbeck) — answered

The dependency paragraphs should list MordellLawrenceVenkatesh #1231 §6.4, ArithmeticGaloisRepresentations #856 §1.9 and §§3.1–3.3, AnalyticNumberTheoryPartI #1126, HeightsRationalPointsAndObstructions #1017 §§5.12/6.4, and WeightsInEtaleCohomology #1001 R34.5–R34.6 as open suppliers, while EllipticCurveModularity #1018, SerreWeightAndLevelOptimisation #1013 and AutomorphicGaloisRepresentations #1007 are named owners of the remaining modular gaps, and LG/EC remain explicit unsubmitted obligations. Merge after these suppliers and discharge the stated gaps before treating their applications as unconditional; the description itself is outside this job's permitted edits, and the dependency check finds no upward edge or cycle.

## H04 (CBirkbeck) — applied

The unlocated DeligneWeightsAndPurity coefficient-bound gap → WeightsInEtaleCohomology R34.6 `newform_ramanujan`, with R34.5 realization/purity, specialized to cuspidal weight two and trivial nebentypus while retaining every complex embedding and p away from the level (`TauCetiRoadmap/ErdosProgressionPowers/README.md:268` and §1.1). The bound allows p=ell; only the Frobenius comparison excludes it, exactly as the supplier's theorem and BS20 line 202 require.

## H05 (CBirkbeck) — applied

The one-line prerequisite list → six proof stages in `TauCetiRoadmap/ErdosProgressionPowers/README.md:1758`: Sylvester–Schur and powerfree coefficients, multiplicative distinctness, reuse of §4.3 deletion, rectangle-free counting and k≥30000, the odd-prime finite ranges, and the separate square branch. The finite obligations specify all intervals, endpoint counts and uniform prime-exponent inequalities, with computed positive and negative Checks; the six headline signatures are unchanged (ErdosSelfridge1975 lines 55, 70, 164, 204, 246, 340, 363, 405, 440).

## Ownership, citations and signature comparison

The ownership searches covered main at 6bddefd, the indexed open roadmap heads, the board packages, and the supplied sibling checkouts by object: split cubics and halving, conductor comparisons, Mordell points, coefficient embeddings, consecutive products, powerfree factors, multiplicative distinctness and rectangle-free edge counts. Main roadmaps were read from main, rather than from progress/revision pull requests; new suppliers were read at the indexed heads, including 82cf8af for HeightsRationalPointsAndObstructions and 84a13f1 for WeightsInEtaleCohomology. No new ownership move or later supplier was introduced. The supplied sibling checkouts contain no competing owner of the added consecutive-product arithmetic or counting statements; §7.1 therefore owns these supporting results for its existing headline, and imports §4.3 rather than duplicating deletion. The two LG/EC board designs are acknowledged as obligations, with no claim that their absence from the repository supplies a theorem.

The native inputs were checked at Mathlib 6b7abb3 and Tau Ceti a91d3aa. `Mathlib/NumberTheory/Bertrand.lean:222` requires a nonzero natural argument and gives n<p≤2n. `Mathlib/Combinatorics/SimpleGraph/Extremal/Zarankiewicz.lean:33` supplies a native extremal carrier; its comparison lemmas do not state the required s+binom(t,2) count, which is a target on native simple graphs here. `TauCeti/AlgebraicGeometry/Cohomology/Genus.lean:64` defines genus by the dimension of H¹ with an explicit finite-dimensionality binder, without asserting smoothness, properness, connectedness or dimension one; those are retained separately. `TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean:109` fixes q+1 minus the full projective count; line 115 requires ellipticity to identify that count with the point group.

The five initial unresolved-name leads are supplied roadmap targets, not missing pinned declarations: EtaleCohomologyFoundations main §F.4.0 explicitly names `ContinuousRep.exists_stable_lattice_iff`, and ArithmeticGaloisRepresentations §1.9 and §§3.1–3.3 explicitly name `IntegralModel.residualSS`, `Conductor.artinConductor`, `Conductor.artinConductorNat` and `Conductor.primeToPConductor`. The final resolver's `ErdosSelfridge1975, §2.1: no roadmap ErdosSelfridge1975` is a false positive: it is a source citation to the large-length argument (ErdosSelfridge1975 line 246), not a supplier. Its library scan also reported that no pinned packages were configured on its host; the pin checks above and signature elaboration were performed separately.

All unsettled cited works were fetched through the sources service from publisher, author or open-repository copies; initial failures for BS20, Kraus1997, Schoenfeld1976 and RamareRumely1996 were resolved, with no missing-text request remaining. The four waived references and Mazur1978's existing uncertified primary-text status were retained. No source manifest was changed because this job authorizes only the two roadmap files and the report; the repair adds locators to an already cited work, ErdosSelfridge1975, rather than introducing a new work.

Additional exact locators: BS20 lines 195–207 (removed-prime norm bound), 213–239 (thresholds and realization), 526–557 (units, conductors and halving), 663–672 (two-primary count); Kraus1997 line 284 (input two-torsion and realization); Lemos2017v2 line 44 (non-CM rational-isogeny surjectivity); Martin2003v1 line 113 (positive-level newspace bound); Faltings1983 line 682 (Mordell). The Erdős–Selfridge plan uses Theorems 1–2 at line 29, Lemma 1 at line 70, Lemma 2 at line 164, Lemma 3 at line 204, large-length bounds at line 246, finite odd ranges at lines 340 and 363, uniform odd exponents at line 405, and squares at line 440.

A single scratch module with `#check @name` for all nine declarations was elaborated after the README repair. Each type was compared to §§0.1, 1.9, 6.2–6.5 and 7.1; no binder was lost, no signature changed, and no Lean edit was needed. In particular, all six theorem statements retain their integer/natural domains, positivity or nonzero conditions, prime-versus-composite exponent conditions and genus-range inequalities. Effectivity remains an additional README proof obligation beyond the existential signature. The comparison-curve and simultaneous-character headlines remain explicitly unstatable at the pins for the reasons in the module docstring.

## Adversarial mathematics pass

These are evaluated instances and boundary checks, not proofs of the admitted deep theorems or of every integer in a specified finite range. Rows with impossible large-exponent progression hypotheses record the relevant numerical or local interface boundary, without claiming an actual H-solution. All new mathematical statements and the retained target families were checked; the general supplier contracts remain subject to their stated hypotheses and gaps.

| Statement | Instances tried | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Zero-based term | n=2,d=3,i=0,1; n=−3,d=2,i=2 | 2+0=2; 2+3=5; −3+4=1 | Matches | None |
| Nonnegative gcd convention | n=−3,d=2; n=d=0 | gcd=1; gcd=0 | Signs and zero retained | None |
| Primitive solution conjunction | (1,24,3,35,2); (−3,2,4,3,2) | 1·25·49=1225=35²; (−3)(−1)1·3=9=3²; both gcd=1 | Positive and signed witnesses | None |
| Positive length and primitivity | k=0; n=4,d=2,k=1,y=2,ell=2 | Empty product=1; 4=2² but gcd=2≠1 | Both excluded | None |
| Nonzero terms | n=−2,d=1,k=3 | Product (−2)(−1)0=0; y·d≠0 forces y≠0 | Zero-term equation excluded | None |
| H and H⁺ | k=0,1,2 | k−10⁸<0 and k−2·10¹⁰<0 in each case | Both predicates false | None |
| Gcd of terms | n=1,d=24,i=0,j=2; n=−3,d=2,i=0,j=3 | gcd(1,49)=1 divides 2; gcd(−3,3)=3 divides 3 | Signed divisibility holds | None |
| Large-prime valuation | S(8,19,2,6,3), q=2,3 | v₂(8)=3, v₂(27)=0; v₃(8)=0,v₃(27)=3 | Each divisible by ell=3 | None |
| Strict signed factorization | Same S at k=2 | A=(1,1), z=(2,3); 8=1·2³,27=1·3³ | Prime equal to k stays large | None |
| Small powers retained | n=64,d=0,k=3,ell=3 | A=64,z=1 gives 64; A=1,z=4 gives 64 but z has forbidden prime 2<3 | Wrong model excluded | None |
| Signed odd root | n=−8,d=7,k=2,ell=3 | (A,z)=(1,−2),(1,−1); product 8=2³ | Negative factors retained | None |
| Strict progression triples | k=0,1,2,3,5 | Cardinalities 0,0,0,1,4; at k=3 only (0,1,2) | No constant or empty-range triple | None |
| Equal-sum quadruples and κ | (0,1,1,2); (0,1,2,3); (1,2,2,3) | κ=−1,−2,−1; sums 2=2,3=3,4=4 | Sign fixed | None |
| Quadruple exclusion | (0,1,1,3) | Middle sum 2≠3 endpoint sum | Excluded | None |
| Divisibility index set | n=1,d=2,k=6,r=3; r=0 | I₃={1,4}; I₀=∅ since no term is zero | Native divisibility, no quotient | None |
| Empty and right-end indices | k=0; n=d=1,k=3,r=4 | Empty; index 3 would give 4 but is outside range | Endpoint excluded | None |
| One-class count | I₃ above; n=d=1,k=3,r=1000 | 2≤6/3+1=3; 0≤3/1000+1 | Large divisors retain +1 | None |
| θ versus ψ | x=2,4 | θ(2)=log 2; ψ(4)=2 log 2+log 3 | Prime powers separated | None |
| Euler-product domain | x=1 | Product=1; 2 log 1=0 | Lower domain needed | None |
| Divisor subpower input | n=4=2² | τ(4)=3, squarefree count would be 2 | Nonsquarefree input retained | None |
| Mod-eight endpoint errors | k=2·10¹⁰, ε=0.002811 | Endpoints k,k/2 contribute 3εk/8, versus incorrect 4εk/8 | k/2 remains included | None |
| Arithmetic Frobenius convention | c_p=0,p=3 | Polynomial T²+3, determinant +3 | Sign fixed | None |
| Residual conductor at good reduction | dim=2, fixed dim=2, Sw=0 | 2−2+0=0 | No prime factor | None |
| Raw tame-unipotent conductor | Fixed dimension 1 versus semisimplified dimension 2 | 2−1=1 versus 2−2=0 | Cannot semisimplify inertia first | None |
| Multiplicative residual discriminant formula | v_p(Δ_min)=ell or 1 | Residual exponents 0 or 1; Tate-module exponent=1 in both cases | Invariants distinguished | None |
| Coefficient-prime exclusion | Mod-ell cyclotomic character | Away-from-ell exponents all 0, prime-to-ell conductor=1 | Does not assert unramifiedness at ell | None |
| Martin bound | N=1,11 | g⁺=0≤2/12; g⁺=1=(11+1)/12 | Positive levels retained | Explicit gap |
| Γ₀ index | N=1,4,11,44 | μ=1,6,12,72 | Correct prime and prime-power factors | Explicit gap |
| Kraus F,G,H | N=1 and N=11 | (1,4,4); (9,169,169) | Maximum and newspace matter | Explicit gap |
| Kraus realization input | Full-two-torsion curve y²=x³−x, N=32 | μ=48, g⁺=1, H=81; ell=83>81; choosing F=E preserves conductor 32 | Consistent native witness; source requires input two-torsion | Binder stated |
| Removed-prime nonzero norm | p=2,5 | p+1−2√p≈0.171573,1.527864, both positive | Norm comparison cannot be zero | Explicit gap |
| Irreducibility cutoff domains | ell=5,7,11 | Full-two-torsion cutoff accepts 7,11; one-point cutoff accepts only 11 | Distinct cutoffs retained | Explicit gap |
| Rational-isogeny surjectivity domain | ell=37,41 | 37>37 false; 41>37 true; CM j=1728 fails non-CM input | Boundary and CM exclusion retained | Explicit gap |
| First Frey normalization | n=d=1; n=2,d=1, triple (0,1,2) | g=1,(a,b,c)=(1,−4,3); g=2,(1,−3,2) | Positive gcd used | None |
| First discriminant identity | Same two triples | Δ=2304=64·1²·2²·3²; Δ=576=64·2²·3²·4²/2⁶ | Both formulas agree | None |
| First c₄ identity | Same two triples | c₄=16(1+12)=208; c₄=16(1+6)=112 | Native normalization | None |
| Generalized Fermat identity | n=d=1, indices 0,1,2 | 1−2·2+3=0 | Index coefficients fixed | None |
| Second Frey A−B identity | n=d=1,q=(0,1,1,2); n=−3,d=2 | 3−4=−1=κd²; −3−1=−4=κd² | Signs agree | None |
| Second discriminant | Same two q | −64(−1)³3²·4=2304; −64(−1)³(−3)²·1=576 | Correct sign and powers | None |
| Second c₄ | Same two q | 16(−1)(−4−9)=208;16(−1)(−16+9)=112 | Agrees with native coefficients | None |
| Second-family local domain | q with κ=−1, prime p=2 | c₄=208 has v₂=4, not a unit | Odd/half-interval local restrictions needed | None |
| First deletion-level bounds | k=1,2 boundary | 2⁷∏_(q≤k)q=128,256; k<10⁸ prevents H applications | Primorial convention and domain retained | None |
| Second deletion-level factor | κ=−2 | κ²=4; signed κ itself=−2 | Positive exceptional factor, not signed κ | None |
| Half-interval headline | k=1,2 | H false in both; at k=2 the interval contains p=2, but theorem cannot be applied | H remains essential | None |
| Coefficient-prime bridge | Tate valuation ell, p≠ell | Deletion exponent=0=residual exponent; rational elliptic exponent=1 | Equality is a theorem, not a definition | None |
| Kraus threshold comparison | N=1,11 | H_K=4,169; exp(10^k)>169 already for k≥1 | Numerical direction correct; progression level hypotheses still required | None |
| Comparison-curve headline | F=E at a fixed residual prime | Identity intertwiner gives identical trace and conductor | No freely assigned conductor substitute | Unstatable headline retained in docstring |
| Good-prime integer trace lifting | p=5, candidate traces −2 and 2, ell=7 | Difference 4≠0 mod 7; Hasse width 4√5<9 | Congruence alone needs ell>4√p | None |
| Symmetric trace-zero test | p=3,7, curve y²=x³−x | Counts 4,8; p+1−count=0,0 | Trace sign consistent; supersingular p≥5 clause retained | None |
| Scaled Legendre coefficients | D=2,λ=1/2 | a₂=−3,a₄=2, Δ=64; D=1 gives Δ=1 | Scale-two normalization | Explicit LG gap |
| Degenerate Legendre inputs | D=0 or λ=0,1 | Δ=16D⁶λ²(λ−1)²=0 | Not elliptic | Explicit LG gap |
| Arbitrary twist needed | D=3,λ=−1 | Equation x³−9x; root differences ±3,±6 are not 2 times nonzero rational squares | Cannot force D=2 | None |
| Six labelled orderings | λ=2 | Values 2,1/2,−1,−1,2,1/2; six labels but three values | No six-element-set assertion | Explicit LG gap |
| Root normalization | Roots 0,3,−3 | D=3,λ=−1; Dλ=−3 for reversed last roots | Scale changes with ordering | None |
| Good-prime unit/support contract | λ=2 at p=5; squareclasses 2,−2 | v₅(2)=v₅(−1)=0; conductors 8,8 have odd part 1 | Units and dyadic conductor retained | Explicit LG gap |
| Twist-trace comparison | p=5,λ=4,D=1,2 | Counts 8,4; traces −2,2; (2/5)=−1 | Trace multiplied by twist character | Explicit LG gap |
| Odd-field square-parameter subgroup | p=7,λ=2=3²; p=3,λ=2 | Counts 8 and 4; second parameter nonsquare | Generalization and negative control agree | None |
| Exact two-primary symmetric count | p=5,λ=−1 | #=8; v₂=3 | Not divisibility by 16 | Explicit LG gap |
| Case-II corrected point | λ=1/2, t=v=1/2, i²=−1 | P=(1+i,−1+i); both sides of equation=−2i; 2P=(1,0) | Order four, correct twist | Explicit LG gap |
| Case partition | λ=3,−1,2,0; k=0 | 3 outside both classes; −1 in −ℚ²;2 in 2ℚ²;0 in both; A(0)=∅ | Exhaustive relative partition | None |
| Case-I mod-eight projection | p≡3,5 mod8 | Signs for p≡3 give μ₁−μ₂−μ₃+μ₄=4(λ/p); p≡5 gives 0 | Projection direction fixed | None |
| Prime-to-von-Mangoldt margin | ε=0.002811 | (1−3ε)/8=0.123945875; subtract 0.000045875 gives 0.1239 | Strict margin preserved | None |
| Case-II positive normalization | t=v=1/2 | 2t²+2v²=1;λ=1/2;tv=1/4 square | Positive rational witness | None |
| Both Case-II point-count signs | p=5, symmetric a_p=−2 | p+1−a_p=8; p+1+a_p=4; neither divisible by 16 | Both signs needed | None |
| CM integrality obstruction | Coprime a=1,b=−4,c=3 | j=256·13³/12²=35152/9, not integral | Odd denominator obstructs CM | None |
| Quartic descent input | T=V=U=1; T=V=2,U=4 | 1+1=2;16+16=2·16 but gcd=2 | Primitivity excludes scaling | None |
| Character conductor convention | Fundamental discriminants −4,8,24 | Conductors 4,8,24; odd parts 1,1,3; 2-parts 4,8,8 | Nontrivial odd part is extra | None |
| Character-family point values | Primitive conductor 5 | χ(1)=1,χ(0)=0; principal conductor1 instead has χ(0)=1 | Principal family excluded | None |
| Half-interval weighted sum | k=0,1,2,4, value=1 | 0,0,log2,log3+log2 | Upper endpoint and prime power correct | None |
| Exceptional-zero interval | N=1; c*=log2,N=2 | log1=0 invalid denominator; at N=2 lower endpoint=0 | Strict positive width restrictions retained | None |
| Repulsion iteration | j=1,2 | N₁=N₁^(2⁰); N₂>N₁² | Strictness starts at j=2 | None |
| Largest-prime conductor bound | N=4,8,24,16 | P=2,2,3,2; 0.94log24≈2.987<3;16 not primitive quadratic conductor | Primitive and dyadic inputs essential | None |
| Smooth-sum r=1 domain | q=5 | Max includes 5^(1/4); minimum R=5^(3/2)≈11.1803 | Empty other-modulus list does not erase q factor | None |
| Finite Gram inequality | Two orthogonal unit vectors; two equal units | Gram row maxima 1 and 2 | Diagonal-only estimate fails for equal vectors | None |
| Off-diagonal correlation domain | Equal real quadratic characters at modulus5 | χ² values 1,1,1,1,0 per period; mean 4/5 | No strict power saving for equal functions | None |
| Harmonic criterion cutoff | Reciprocal mass 0.166 | 2.13/0.166≈12.8313; exp≈373743.608<400000 | Integer conductor≤373743 | None |
| Many-character mean-square margin | Constants 1/68 and 0.1239² | 0.0147058824<0.01535121 | Correct square, not fourth power | None |
| Quantitative Roth cutoff | δ=10⁻⁵ | 132log2/δ≈9149542.783 lies between 10⁶ and 10⁷ | Certified larger cutoff retained | None |
| Thin prime intervals | k=1,2,16 | T_pr=∅,{2},{5,7,11,13}; U_pr(1)=∅ | Open lower endpoints retained | None |
| Sieve survivor definition | n=d=k=1,S=∅ | No forbidden prime divides term1; J={0} | Not identically empty | None |
| Thin-set condition | k=9,S=∅,{7},{2},{9} | Masses 0,1/7,1/2,1/9; last is not prime | Only first two thin | None |
| Maximal-valuation deletion | n=d=1,k=5,A=(1,2,3,4,1) | Remove indices2,3; J₁={0,1,4}; product2 divides24 | General coefficient wrapper reused | None |
| Deletion tie and empty value | J=∅; J={2,5}, A≡1 | Selected junk index0; nonempty tie chooses2 | Empty value not used as member | None |
| Deletion least tie | n=d=1,k=4,A=(1,2,1,2) | v₂ at indices1,3 both1; removes1 | Deterministic tie convention | None |
| Stirling upper adapter | m=1 | 1! =1; sqrt(2π)e^(−1+1/12)≈1.002274>1 | Correct denominator and sign | None |
| Sieve density margin | Main losses log(16/7)+0.17 | 1−0.826678573−0.17≈0.003321427>0.0032 | Positive margin before errors | None |
| Coefficient-density exponent | 0.00319 retained density, product exponent0.44 | 0.44/139≈0.003165468; difference≈0.000024532>10⁻⁵ | Markov step has margin | None |
| Thin witness dyadic allowance | k=256 | 2⁸ k⁴¹⁷=k⁴¹⁸ at256; strict inequality for larger k | Large-k restriction needed | None |
| Maximal-family dichotomy | |B|≤17logk, complementary primes>10⁴logk | Complement mass≤17/10⁴=0.0017;0.17−0.0017=0.1683>0.166 | Correct mass direction | None |
| Smoothness endpoint | logk=2 | 2^(1−10⁻⁴)<2^(1−1/20000) | Closed first bound becomes strict second bound | None |
| Landau–Page boundary transport | c=c₀/2,T=e | 1−c₀/2>1−c₀ | Closed narrow strip inside strict wide strip | None |
| T total function | k=0,1 or c=0 | Total exponent0, hence T=1 | Junk values separated from analytic domain | None |
| Exceptional set size bound | k=0; any k with q=0 or q>k⁴ | q-range empty at0; forbidden q not in range | Bounds enforce finiteness | None |
| Exceptional zero witness | χ₅ even at ρ=0,k=16,c=0 | L(0)=0; T=1;1−3loglog16/log16≈−0.103<0 | Nonempty witness example | None |
| Principal pole exclusion | χ=1,ρ=1 | Both alternatives ρ≠1 and χ≠1 false | Cannot witness a zero at pole | None |
| Common-height kernel | ρ=0 | Integral from k/2 to k of dt/t=log2≈0.693147;1/abs(ρ) undefined mathematically | Integral removes singularity | None |
| Bad-index divisor threshold | q=8 and q=1000 | q^(1/3)/2=1 and5; r=1000>k=3 is admissible | Divisors cannot be truncated at k | None |
| Summed residue rounding | k=3,r=1000 | k/r=0.003 versus allowed one residue; k/r+1=1.003 | +1 cannot be omitted | None |
| Granville size inequality | k=64 | 8·64^(7/2)=64⁴=16777216 | Equality pins threshold | None |
| Exceptional conductor detection | Nodd=30, supported across coefficients2,3,5 | Product of gcds=30≥N/8 when N≤240 | Same conductor support used | None |
| Granville contradiction constant | Lower bound0.1239k, upper Ck/logk | At logk=2C/0.1239 upper=0.06195k<0.1239k | Effective large-k contradiction direction | None |
| Shared Mordell native genus | Diagonal k=3,ell=4 versus k=4,ell=2 | Genus3 meets ≥2; genus1 fails | Correct owner, no genus-one finiteness inference | Supplier repaired |
| All coefficient embeddings bound | Weight2,p=5, c₅=−2 on y²=x³−x | abs(c₅)=2≤2√5≈4.472136; at p=2 bound still concerns coefficients if p∤N | All embeddings and away-level premise retained | Supplier repaired |
| Effective prime-bound zero branch | n=d=y=0 | y·d=0 but gcd0=0 fails; n=y=1,d=0 gives gcd1 and y·d=0 | Nontrivial branch cannot erase the disjunction | None |
| Signed hyperbolicity | (k,ell)=(3,4),(4,3),(5,2) | 2g−2=4,18,8; genera3,10,5 | Positive canonical degree | None |
| Signed elliptic boundary | k=4,ell=2,n=−3,d=2 | 2ell+k=kell=8; product9; genus1 | Strict inequality necessary | None |
| Positive elliptic boundaries | (4,2),(3,3),n=d=1 | Products24 and6; genera1,1 | Arithmetic exclusions, not Mordell, handle them | None |
| Correct diagonal elimination | One-based t₁=a+d,t₂=a+2d,j=3 | 2t₂−t₁=a+3d; incorrect3t₂−2t₁=a+4d | Correct source-index adapter | None |
| Signed projective lifting | Nonzero primitive vector v and scalar r | Integral primitive representatives v and −v; scaling by2 gives gcd2 | Finite fibre, no arbitrary integral scaling | None |
| Composite exponent identity | y=−2,ell=6,p=3 | (−2)⁶=64=((−2)²)³ | Signed power law | None |
| Absolute base exclusion | k=3,d=1, terms−1,0,1 | Product0 cannot equal ±1; three nonzero distinct terms cannot all have abs1 | y=0,±1 cannot supply nontrivial long solution | None |
| Root/exponent fibre | Y=64 | (y,r)=(64,1),(8,2),(−8,2),(4,3),(2,6),(−2,6) | Six pairs; bounded exponent by v₂=6 | None |
| Fixed-length finiteness quantifiers | Prime exponents p for fixed k | p≤floor(exp(10^k)) gives finitely many p; k still unbounded across statements | Does not assert one finite set over all k | None |
| Consecutive headline hypotheses | n=1,k=2; n=4,k=1; n=0,k=2 | Product2; product4=2² excluded by k; product0 excluded by n>0 | Positivity and k≥2 essential | None |
| Sylvester–Schur input | m=4,k=3 | Product5·6·7=210; prime7>3 divides it | Positive concrete instance | Added plan |
| Size reduction under contrary valuation hypothesis | k=3,ell=2 | (k+1)^ell−k=13>k^ell=9 | Inequality m+k≥16 forces m>9 | Added plan |
| Strong valuation theorem boundary | m=0,k=3 and4,ell=2,3 | v₃(6)=1 and v₃(24)=1; 1 mod2=1,1 mod3=1 | Least-prime boundary included | Added plan |
| Powerfree coefficient definition | Terms8,9 at ell3 | 8=1·2³;9=9·1³ | Full-small-part alternative differs | Added definition |
| Powerfree uniqueness | Terms4,5 at ell2 | 4=1·2²;5=5·1²; alternative a=4 for term4 is not squarefree | Wrong factorization excluded | Added API |
| Powerfree support clause | m=3,k=2,ell=2 | a=(1,5), prime5≥2; full product20 has v₅=1 | Support needs valuation hypothesis | Added API |
| Unit coefficient case | m=0,k=1,ell=2,3 | Term1 gives a=x=1 in both | Positive unit and exponent domain retained | Added Check |
| Product distinctness empty multiset | r=0 | Both products1; both multisets empty | No false strictness at r=0 | Added theorem |
| Product distinctness positive witness | m=28,k=3,ell=3,r=2 | Products841,870,899,900,930,961; six distinct exponent vectors modulo3 | No rational-cube ratio collision | Added Check |
| Product distinctness negative control | m=1,k=7,ell=3 | a=(2,3,4,5,6,7,1);2·6=3·4=12;1≤7³ | Size hypothesis indispensable | Added Check |
| Square distinctness negative control | m=1,k=7,ell=2 | a=(2,3,1,5,6,7,2), repeated2 | Size hypothesis indispensable | Recorded |
| Reused deletion support | m=0,k=5,ell=2 | Retained a-product5 does not divide24; support fails at prime5=k | Correct application requires support | Added negative Check |
| Exact retained cardinal padding | k=5, π(k−1)=2 | Required retained cardinal3; deleting an extra factor1 preserves any divisibility | Padding direction correct | Added adapter |
| Rectangle-free graph inequality | Empty graph; star s=1,t=2 | 0≤s+binom(t,2); star edges2=1+1 | Includes empty parts | Added theorem |
| Rectangle exclusion negative control | K₂,₂ | Edges4>2+binom(2,2)=3; one four-cycle | Missing condition would be false | Added Check |
| Multiplicative cover corollary | B={1,2,3},U=B,V={1} | Products1,2,3,4,6,9 distinct; cardB=3=3+0 | Positive saturating example | Added theorem |
| Multiplicative distinctness exclusion | B={1,2,4} | 1·4=2·2=4 | Repeated factors must be included | Added Check |
| Smooth covering sets | Support≤7,size≤36; support≤11,size≤100 | Cardinalities25,55;11 and13 excluded respectively | Not all integers in interval | Added constructions |
| Ordered coefficient lower bounds | i=422,6993 | At422: i=422 versus3.5694·118≈421.1892; at6993:3.5694·6689≈23875.7166 versus4.3402·5501≈23875.4402 | Source crossover ranges agree | Added target |
| Large-length factorial comparison | k=30000, π(k)=3245 | log lower-product−log(k!)≈968.348>0 | Positive boundary witness; universal inequality remains target | Added target |
| Large-length persistence samples | k=30001,100000 | Log margins≈969.644 and15873.087 | Correct direction beyond boundary | Recorded |
| Small cubic count | k=4,m=2 | f≥4;f(f−1)≥12>3²=9 | Smallest finite interval begins at4 | Added target |
| Cubic interval boundaries | k=9,10,27,28 | Lower f=5,8,11,16; ratios20>9,56>27,110>27,240>81 | Adjacent ranges covered | Added targets |
| Cubic later interval boundaries | k=76,77,142,143 | Lower f=22,30,38,50; ratios462>81,870>243,1406>243,2450>729 | Adjacent ranges covered | Added targets |
| Cubic final small boundaries | k=339,340,645,646,999 | Lower f=70,91,110,145,164; ratios4830>729,8190>2187,11990>2187,20880>6561,26732>6561 | Endpoint choices consistent | Added targets |
| Middle-range cubic count | k=1000,r=4,q₁=19 | F≥255;64770>45927=3⁷·21 | First middle endpoint covered | Added target |
| Square-root prime boundary | k=10609=103²,r=19,q₁=23 | Include prime103;F≥1957;3827892>2499741 | Closed √k endpoint is usable | Recorded |
| Last middle cubic count | k=29999,r=31,q₁=29 | F≥4853;23546756>19545219 | Last endpoint covered | Added target |
| Uniform higher odd prime, small range | ell=5,k=4,m=2 | binom(7,4)=35>5²=25 | Does not stop at ell=3 | Added theorem |
| Uniform higher odd prime, middle range | ell=5,k=1000,r=4,F=255 | binom(258,4)=180352320>5⁷binom(8,4)=5468750 | Formula's r and ell factors agree | Added theorem |
| Ratio pattern count | r=1,2 | r²+r+1=3,7: zero, signed singles, and ordered distinct numerator/denominator primes | Includes cancellation | Added counting target |
| Square residue density | Modulus36 | Divisible by4:9, by9:4, intersection1; union12, complement24 | Wrong subtraction gives23 | Added target and Check |
| Square branch prime-product range | k=71,72,296,297 | θ(k−1)≈57.3236,61.5863,277.0250,277.0250, each<k | Finite-range endpoint witnesses | Added target |
| Square support-count branch | Primes {2,3}, {2,3,5}, {2,3,5,7} | Squarefree possibilities4,8,16 versus required5,9,21 | Counting contradiction direction fixed | Added target |
| Four consecutive factors identity | m=0,1 | Products24=5²−1;120=11²−1 | Strictly between consecutive squares | Added target |
| Erdős threshold predicate | K=0,3; n=1,d=24,k=3,y=35,ell=2 | 1225=35² and gcd1 | Both thresholds false | None |
| Threshold monotonicity | K=3,L=4 | Range k≥4 is a subset of k≥3 | Implication is upward in threshold | None |
| Smooth multiplier equation | τ=0,b=1, primitive square example | 1225=1·35²; multiplier prime support empty | Recovers primitive predicate | None |
| Nonunit multiplier endpoint | n=d=y=1,k=2,ell=2,b=2 | Product2=2·1²; support needs2≤2τ, exactlyτ≥1 | Closed endpoint, outside τ<1/2 discussion | None |
| Zero multiplier exclusion | b=0 | RHS0; definition requires0≠0 | Excluded independently of support | None |

The lower factorial inequality needed in §7.1 is consumed directly as `Stirling.le_factorial_stirling` (`Mathlib/Analysis/SpecialFunctions/Stirling.lean:276`), rather than replanned. At m=0 its sides are 0 and 1; at m=1 they are approximately 0.922137 and 1.

| Additional statement | Instances tried | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Supplied lower Stirling inequality | m=0,1 | 0≤1; sqrt(2π)/e≈0.922137≤1 | Includes the natural zero case | Consumed, not duplicated |

## Build and gate outcomes

Commit: `c481345` (README only); `Suggested.lean` is unchanged, and the worktree is clean. No push or external reply was made.

`lake build TauCetiRoadmap.ErdosProgressionPowers.Suggested` exited 0:

```text
⚠ [8976/8976] Built TauCetiRoadmap.ErdosProgressionPowers.Suggested (2.4s)
warning: TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean:47:8: declaration uses `sorry`
warning: TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean:53:8: declaration uses `sorry`
warning: TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean:59:8: declaration uses `sorry`
warning: TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean:65:8: declaration uses `sorry`
warning: TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean:72:8: declaration uses `sorry`
warning: TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean:81:8: declaration uses `sorry`
Build completed successfully (8976 jobs).
```

The scratch signature elaboration exited 0 with the same six expected admission warnings and all nine elaborated types. The final dependency check exited 0; its entire output is:

```text
depcheck: 33 roadmaps, 299 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The final gate exited 0; its exact summary is:

```text
gate ErdosProgressionPowers: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
