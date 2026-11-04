## H01 (CBirkbeck) — applied

The lower Rosser main-term domain D≥z became D≥z², while the upper domain remains D≥z and the lower sifted-sum bracket for 1≤s<2 now follows directly from nonnegativity (`TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md:3227`); the fundamental-lemma route and source convention were updated too. The supported-prime example has M⁻→1−log 4<0 and V→1/4, confirming that the raw main term cannot inherit the nonnegative sifted sum's bound (HB-SIEVES line 1755, line 1764 and line 1782).

## H02 (CBirkbeck) — applied

The maximal li-centered π transfer, its named target and its analytic requirement now use real 2≤y≤x, replacing unrestricted y≤x (`TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md:2526`, `TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md:2578`); the ψ range and fixed-x π-centered conclusion retain their stated domains. AnalyticNumberTheoryPartI §0.32 defines Li by the integral from 2, and the q=2,a=1 discrepancy diverges as y decreases to 1 from above; the new endpoint Checks give discrepancies 0 at q=2 and 1 at q=1 when y=2.

## H03 (CBirkbeck) — applied differently

The false unrestricted recombination and uniform quotient-by-quotient deduction became the mixed ordinary/corrected identity and the exact-valuation bound d_Q(p,e+j)≤C p^(−r(e+j)) on the original polynomial, with explicit zero-exponent cases (`TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md:1335`; KHAYUTIN-19 line 4434): for Q=x₀²,k₀=p,a=1 the old identity compares p with 0. The fixed-divisor conclusion retains its full generality as an explicit uniform analytic proof target, requiring summed lattice and factor-range estimates beyond the local bound and the separate R₂ replacement; the unit-congruence route now proves its preliminary quotient has the same C,r, then consumes that uniform target (`TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md:1370`, `TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md:1492`).

## H04 (CBirkbeck) — applied

Added the upper sifted-sum estimate for 0<s≤1, with error C_K s⁻¹((log D)^(−1/3)+(log D)⁻¹) and the same absolute remainder E(D), by S(z)≤S(D) and the dimension-product comparison (`TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md:3245`). Richert now uses it uniformly for s≥(γ−β)/α>0 and D_p≥N^(γ−β), retaining the original remainder budget and optimization; for r=3 the lower endpoint is 1/7, and the repeated-remainder bound is the one in HB-SIEVES line 2038 and line 2054 (`TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md:3325`).

## H05 (CBirkbeck) — applied

Split Q=1 off by Cauchy–Schwarz, with exact constant H, in both the sharp primitive-character route and the sharp forbidden-residue route; Q≥2 uses δ=Q⁻²≤1/4 (`TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md:2283`, `TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md:2305`). The headline signature retains Q≥1 and its docstring records the boundary branch (`TauCetiRoadmap/SieveMethodsAndPrimePatterns/Suggested.lean:173`); at Q=1,H=2,a=(1,1) both sides are 4, and the pinned modulus-one facts are `DirichletCharacter.level_one` and `DirichletCharacter.isPrimitive_one_level_one` in `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:201` and `:295` (KED-ANT-16 line 401).

## Sources, ownership and signatures

The relevant source passages were read in the legal cached extractions: KHAYUTIN-19 line 3415 (local counts), line 3430 (lifting), line 4333 (fixed divisor), line 4434 (recombination), line 4438 and line 4465 (unit congruence); HB-SIEVES line 1755 (signed main terms), line 1791 (sifted sums), line 2025 and line 2038 (Richert); IWA-ROSSER line 79 (sifted-sum theorem, OCR extraction); KED-ANT-16 line 401 (sharp primitive bound). No additional source was introduced, and no settled waived or uncertified citation was reopened. The raw lower-main-term correction is also verified by the independent counterexample, rather than inferred from Iwaniec's theorem about sifted sums.

Ownership was searched by object in the main roadmap catalog, the board packages, the indexed open roadmap heads and exactly the 48 supplied sibling roadmap folders. The only sibling match for corrected density concerns exactness of the Gauss map in ProbabilisticAndMetricNumberTheory §4.6, not polynomial congruence counts. No other owner was found for the valuation-restricted binary estimate or the small-s linear sifted-sum extension: both refine the sieve constructions already owned here in §§1.4 and 5.2. No supplier, ownership transfer or fully qualified Lean declaration was added. The existing separation of CongruenceSpectralGap's automorphic gap from the affine sieve is unchanged.

The library check used the manifest revisions Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, confirmed against both package checkouts. `BoundingSieve` in `Mathlib/NumberTheory/SelbergSieve.lean:53` has nonnegative weights and a real approximate mass, with no sign condition on that mass; its remainder at `:168` is multSum−νX, and its sifted sum at `:171` is the nonnegative weighted coprimality count. The corrections therefore carry X≥0 explicitly where a main-term inequality is multiplied by X, and retain R₁. Modulus-one uniqueness and primitivity were read at the pinned locations above. Searches of both pinned libraries found no existing polynomial corrected-density or linear-sieve-function theorem supplying the new estimates.

Citation resolution after the repairs reports no unresolved cross-roadmap citation or Lean name. The cited AnalyticNumberTheoryPartI §0.32 was read at its indexed head; current origin/main is `c4a16b1`, while the final resolver's catalog identifies its main snapshot as `6ef1bbd`, so absence from that snapshot was not used as evidence of absence from current main. Searches of current main and the supplied open folders supplied the additional ownership check.

All 50 declarations were placed in one scratch signature file with `#check @name` and elaborated together using the permitted module build; all 50 resulting types agree with the initial signatures, and each was compared with its README target. No type or section binder changed: the only Lean edit is the sharp primitive theorem's docstring. The Gram theorem retains its scalar, inner-product and finite-index instances; all other theorem hypotheses are explicit in their signatures. Temporary signature checks are absent from the committed acceptance test.

## Adversarial pass on the repairs

Each row records evaluated inputs rather than treating elaboration as proof. The full uniform binary analytic estimate remains a proof target; the finite local calculations do not certify its global conclusion.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Raw lower Rosser estimate | D=z=16, g(p)=1/p for 2≤p<16; increasing D with support above D^(1/4) | M⁻=−10331/30030, V=192/1001, f(1)=0; limits 1−log 4<0 versus 0 | Old domain false | Require s≥2 for M⁻ |
| Upper Rosser estimate | Empty prime set, s=1,2 | M⁺=V=1; F(1)=2e^γ, F(2)=e^γ, both >1 | Upper direction consistent | Preserve s≥1 |
| Lower sifted-sum bracket below s=2 | Empty population X=0, R=0, s=1 and 3/2 | S=0, lower expression 0 | Nonnegativity supplies the bracket | Separate from signed M⁻ |
| Lower main-term boundary | s=2, empty prime set | M⁻=1, f(2)=0; lower expression −error≤0 | Correct endpoint | Include D=z² |
| Rosser support and strictness | d=1,D=2; d=2,D=8; d=D=2; d=4,D=100 | Weights (1,1), (0,−1), (0,0), (0,0) | Cube equality and nonsquarefree cases discriminate | Definition retained |
| Small-s monotonicity | Population 1,…,16, all sieve primes; D=4,z=16 | S(16)=1≤S(4)=5; V(4)/V(16)=1001/576 | Direction and strict cutoffs correct | Added extension |
| Small-s leading function | s=1,1/2,1/7 | F(1)/s=2e^γ,4e^γ,14e^γ, exactly F(s) | Scaling agrees | Retain s⁻¹ |
| Small-s remainder support | Same 1,…,16 population, D=4 | R₁=0,R₂=0,R₃=−1/3; both remainder ranges sum to 1/3 | No larger remainder budget | Same E(D) |
| Uniform Richert range | r=1,2,3 in the optimized α,β | s₀=1,2/5,1/7; r=3 gives D_p≥N^(γ/28) | r≥2 uses the extension | Cite extension in route and Needs |
| Richert remainder multiplicity | k=30, p≥2, k<2^5 | Three eligible prime divisors 2,3,5; 3≤5=γ/α | Bounded repetition | Budget retained |
| Fundamental-lemma range | z=e^t,D=e^(t²), t≥2 | s=t≥2; log z/log D=1/t→0 | Both raw domains eventually hold | State eventual D≥z² |
| Exact-valuation definition at n=0 | Q=x₀,0,1; p=2 | Direct proportions 1/2,0,1; 1−ρ_Q(2)/4 gives 1/2,0,1 | Unit and zero cases agree | Explicit n=0 branch |
| Positive-valuation identity, smooth case | Q=x₀; p=2,3,5; n=1,2 | Both formulas give (1/4,1/8), (2/9,2/27), (4/25,4/125) | Six exact comparisons | Added identity |
| Positive-valuation identity, singular case | Q=x₀²; p=2,3,5; n=1,2 | Both formulas give (0,1/4), (0,2/9), (0,4/25) | Six exact comparisons | Retain nonlifting zeros |
| Positive-valuation identity, mixed smooth/singular | Q=x₀x₁; p=2,3,5; n=1,2 | Both formulas give (1/4,3/16), (8/27,4/27), (32/125,48/625) | Six exact comparisons | Smooth subtraction retained |
| Positive-valuation identity, constants | Q=0 and Q=2; p=2,3,5; n=1,2 | Q=0: all twelve expressions are 0; Q=2: d(2,1)=1, all other tested values 0, identically on both sides | Twelve exact comparisons | Constant cases covered |
| Valuation power bound | Q=x₀², C=1,r=1/2; n=2 | At p=2,3,5: d=1/4,2/9,4/25≤p⁻¹=1/2,1/3,1/5 | Constant independent of forced exponent | Use original polynomial |
| CRT for exact valuations | Q=x₀, v₂=v₃=1 | 72 pairs modulo 36: 72/1296=1/18=(1/4)(2/9) | Product law agrees | Added local API |
| Recombination at j=0 | Q=x₀²,k₀=p,a=1; p=2,3 | Left 2,3; ordinary factors 2,3; old corrected factors 0,0 | Old identity false | Ordinary zero-exponent factor |
| Recombination at j=1 | Q=x₀²,k₀=p,a=p; p=2,3 | Left 2·2=4, 3·6=18; corrected original counts 4,18 | Positive-exponent identity valid | Correct mixed formula |
| Recombination with e=2 | Q=x₀²,k₀=p²,a=1; p=2,3 | Left and ordinary factors 8,27; corrected counts 4,18 | e>1 distinguishes the factors | Include all positive e |
| Full finite recombination family | Q=x₀,x₀²,x₀x₁,0,2; p=2,3; e=1,2; j=0,1,2 | 60 exact equalities; e=j=1 at p=2 gives totals 4,4,5,0,0 respectively on both sides | All finite recombinations agree | Generality retained |
| Uniform quotient-density obstruction | Q=x₀²,k₀=p | ρ̃_(pu²)(p)=2,6,20 at p=2,3,5; divided by p^(3/2) these grow asymptotically like √p | No uniform quotient C | Delete that deduction |
| Fixed-divisor value/area branch | X<k₀; otherwise X≥k₀ and X≤A^δk₀^(1−2δ) | Empty branch: 0=0; nonempty branch: k₀^(2δ)≤A^δ gives A/k₀²≥1; A=16,k₀=2 gives 4 | Rescaled area justified | No extra hypothesis |
| Uniform fixed-divisor analytic target | k₀=1; Q=x₀²,k₀=p,j=0 | k₀=1 gives the original target exactly; forced p branch has d_Q(p,1)=0 instead of the spurious ordinary mass 1/p | Local obstruction removed; global estimate still requires proof | Explicit uniform analytic requirement |
| Unit-congruence preliminary quotient | Q=x₀, m=3 and r₀=2; m=4 and r₀=2, division by 2 | Q₁=3u+2 has no zero mod 3; Q₁=2u+1 has ρ̃(2)=0 and ρ̃(3)=3=ρ̃_Q(3) | Same C,r transport holds | Proved off/on-modulus split |
| Unit-congruence multiplicativity | k₀=2,k₁=k₂=3, r₀=6 modulo 9, u=0 | Q₁=2, Q₁/k₀=1; f(3)=f(3)f(1) | Required coprimality present | Consume uniform fixed-divisor target |
| Maximal li-centered π range | y=2; (q,a)=(2,1),(1,0); y↓1 above 1 in class (2,1) | Endpoint errors 0 and 1; excluded errors →+∞ | Lower endpoint necessary | 2≤y≤x throughout π contract |
| Maximal ψ range | y=0; y=2,q=1 | Errors 0 and 2−log 2≈1.30685281944 | No logarithmic singularity | Keep 0≤y≤x |
| Fixed-x π-centered transfer | x=10,q=3 | Counts 1,2; mean 4/2=2; maximal error 1 | Different center remains explicit | Preserve separate target |
| Sharp primitive Q=1 | H=1,a=(2+i); H=2,a=(1,1) | 5=5; 4=4 | Cauchy–Schwarz exact | Add boundary branch |
| Sharp primitive Q≥2 | Q=2,H=1,a=(1) | Only primitive modulus-one term: 1≤4; δ=1/4≤1/2 | Additive input admissible | Preserve statement Q≥1 |
| Sharp forbidden residues Q=1 | H=2,a=(1,1), empty forbidden sets | J=1; 1·|2|²=4=2·2 | Same boundary repair applies | Add Cauchy–Schwarz branch |

## Acceptance-test statement checks

The following table has one row for each of the 50 retained declarations. Numerical instances of an asymptotic theorem test its carriers and normalization, not the eventual quantifiers or the analytic proof; constants are left symbolic when the theorem only asserts existence.

| Statement | Instances tried | Computed values | Result | Change |
| --- | --- | --- | --- | --- |
| SieveGram.selberg_weighted_inner | x=1,y=(1,2); zero and empty rows | 1/3+4/6=1=‖x‖²; zero rows contribute 0 | Denominator and totalized zero agree | None |
| SieveBrun.HasProductDimension | Empty primes; w=z; κ=0,K=1 or 1/2 | Product=1; RHS=1 or 1/2 | First holds, second fails | None |
| SieveBrun.remainderMass | P=6, all R_d=1, D=1,2,3,6,7 | 0,1,2,3,4 | Strict cutoff retains R₁ | None |
| SieveRealCharacters.discriminantValue | D=5,n=0,1,2,4 | 0,1,−1,1 | Zero extension and dyadic factor agree | None |
| SieveBrun.fundamental_estimate | P=1,X=S=1,R=0,κ=1,K=2,u=10; u=20 | −1023≤1≤1025; 0.953510…≤1≤1.046490… | Correct lower sign and parameter range | None |
| SieveSelberg.diagonalMass | P=2,ν(2)=1/2,z=1,2,3 | 0,1,2 | d=1 enters only above one | None |
| SieveSelberg.selberg_upper_bound | P=2, support {1,2}, unit weights, X=2,ν(2)=1/2,z=3 | G=2,R₁=R₂=0,S=1=2/2 | Exact bound; no sign lost | None |
| SieveApplications.prime_interval_upper | x=y=2 | π(4)−π(2)=1; leading RHS=4/log 2≈5.77078 | Small endpoint consistent | None |
| SieveApplications.twin_goldbach_upper | x=3; N=4 | Twin count=1; Goldbach count=1; Goldbach local product=1 | Prime-two boundary and empty product agree | None |
| SieveApplications.progression_upper | k=1,a=0,x=4 | Count=2; RHS/C=4/log 4 | Modulus one present; denominator positive | None |
| SieveApplications.brun_reciprocals | Twin primes up to 19: 3,5,11,17 | Partial sums 1916/2805 and 4084/8645 | Both summands positive; no zero denominator | None |
| SieveTaper.additive_largeSieve | H=0; H=1,a=1,frequencies 0,1/2,δ=1/2 | 0≤0; 2≤5 | Empty interval and circular distance agree | None |
| SieveTaper.sharp_additive_largeSieve | H=1,a=1,frequencies 0,1/2,δ=1/2 | 2=2; δ=1 is outside the hypotheses | Sharp endpoint discriminates range | None |
| SieveCharacters.primitive_largeSieve | Q=0; Q=1,H=1,a=1 | 0≤1; 1≤3 | Empty modulus family and modulus one agree | None |
| SieveApplications.sharp_primitive_largeSieve | Q=1,H=1,a=2+i; H=2,a=(1,1) | 5=5 and 4=4 | Theorem includes boundary with exact constant | Docstring only |
| SieveApplications.leastNonresidue | p=0,1,2,3,5,7 | 0,0,0,2,2,3 | Excluded denominators return zero | None |
| SieveApplications.linnik_exceptional | N=2; N=7,ε=1/2 | Counts 0 and 1 (only p=7 in the second) | Strict threshold and odd-prime condition agree | None |
| SieveQuadratic.primeDenominatorSymbol | (a,p)=(2,2),(3,2),(1,3),(2,3) | 0,1,1,−1 | At two this differs from Kronecker | None |
| SieveQuadratic.prime_quadratic_bilinear | K=1,L=2,a₁=b₂=1,A=B=1,ε=1 | LHS=1; RHS/C=2²+1=5; A=0 forces both sides 0 | No arbitrary prime or numerator restriction | None |
| SieveQuadratic.jutila_mean_value | X=3,N=2,a₁=1,a₂=0 | Only D=−3 contributes: LHS=1; RHS/C≈3.64612401937 | Discriminant and square-pair ranges agree | None |
| SieveQuadratic.smith_prime_legendre_bilinear | X₁={3},X₂={5},t₁=3,t₂=5,ε=1/4 | |(3/5)|=1; RHS/C=30 | Disjoint odd-prime hypotheses present | None |
| SieveQuadratic.koymans_pagano_row_mean | Same singleton sets, c₂=c₄=1,a=1/10,ε=1/4 | Cardinality lower bounds ≈0.2731,0.3107≤1; LHS=1,RHS/C=3 | Quantifier order and normalizing powers agree | None |
| SievePolynomialFarey.coefficient | p=3,ℓ=1,G=1,H=T+1; ℓ=0,G=0,H=1 | First two coefficients 1,2; all zero-numerator coefficients 0 | Reversal and T⁻¹ indexing agree | None |
| SievePolynomialFarey.large_sieve | p=2,ℓ=m=0; ℓ=1,m=2,all f_j=1 | 1=1; two reduced fractions give 2≤4 | 0/1 included; exponent zero has value one | None |
| SieveVaughan.vaughan_identity | n=0,1; n=2,U=V=1; n=4,U=V=1 | 0=0; log 2=log 2; log 2=log 4−log 2 | Zero divisors and small-input term consistent | None |
| SieveDistribution.primeCountAP | x=−1,0,2,10; q=1 or 3 | Negative/zero cutoffs:0; π(2;1,0)=1; counts at 10 mod 3 are 1,2 | Inclusive floor convention agrees | None |
| SieveDistribution.discrepancy | x=10,q=3; q=0,1 | max(|1−2|,|2−2|)=1; q=0 and q=1 give 0 | Empty supremum and modulus one agree | None |
| SieveDistribution.PrimesHaveLevel | θ<0 and x>1; θ=0 | ⌊x^θ⌋=0, summed discrepancy 0; θ=0 retains only q=1 with discrepancy 0 | No unintended positivity restriction | None |
| SieveDistribution.ElliottHalberstam | θ=0; boundary θ=1 | θ=0 modulus sum 0; strict bound 1<1 is false | Predicate includes all lower levels and excludes one | None |
| SieveDistribution.primesHaveLevel_of_lt_half | θ=0 and θ=−1; θ=1/2 | For lower examples summed discrepancy 0; endpoint inequality 1/2<1/2 is false | Statement has correct strict upper range | None |
| SieveArithmeticDistribution.bombieri_vinogradov_maximal | q=1,y=0,2; q=2,a=1,y=2 | Errors 0,2−log 2,2 respectively | Native Λ includes prime powers; no Li introduced | None |
| SieveArithmeticDistribution.barban_davenport_halberstam | q=1,x=3; x=4 | Errors squared (log 6−3)²≈1.45984518; (log 12−4)² | Prime-power term Λ(4)=log 2 is retained | None |
| SieveMaynard.IsAdmissible | Empty H; H={0,1}; H={0,2,4} | Empty misses 0 at every prime; the latter images have sizes 2 mod 2 and 3 mod 3 | Negative examples fail admissibility | None |
| SieveMaynard.primeTranslates | Empty H; H={0,1}; H={0,2,4} | All naturals; exactly {2}; exactly {3} | Prime tuple conjecture needs infinitude | None |
| SieveMaynard.maynardSimplex | k=0; k=1,t=−1,0,1,2; k=2,t=(1,1) | Unique empty vector included; false,true,true,false; (1,1) has sum 2>1 | All coordinate and sum conditions matter | None |
| SieveMaynard.maynardI | F=1 on simplex, k=0,1,2 | I=1,1,1/2; zero F gives 0 | Cube restriction and simplex support agree | None |
| SieveMaynard.maynardJ | Same F, k=1 and 2 | J₁=1; each J₂=∫₀¹(1−t)²dt=1/3 | Extra cube coordinate has length one | None |
| SieveMaynard.IsMaynardAdmissible | Zero F; F=1 on simplex at k=1,2; F=1 on whole square | Zero fails I≠0; simplex examples have I=1,1/2 and J=1,1/3; square has value 1 at (1,1) outside simplex | Energy and support both discriminate | None |
| SieveMaynard.maynardRatio | Zero F; constant on k=0,1,2 simplex | 0/0=0; ratios 0,1,4/3 | Total division is only used outside admissibility for zero | None |
| SieveMaynard.maynardM | k=0,1; k=2 simplex witness | M₀=0,M₁=1; M₂≥4/3 | Empty-dimensional and rank-one extrema agree | None |
| SieveMaynard.infinite_many_primes_of_level | k=0; k=1,θ=1/2,h₀=0 | Thresholds ceil(0)=0 and ceil(1/4)=1; every n works in the first case, prime n works in the second | No zero-length tuple exception missing | None |
| SieveMaynard.eventually_log_sub_lt_maynardM | k=1, totalized log 0=0 | Lower expression −2; M₁=1, so −2<1 | Small input does not contradict eventual statement | None |
| SieveMaynard.maynardM_five_ge | Exact four-term rational polynomial | I₅=29509/1222452000; ΣJ=40493/838252800; ratio=1417255/708216>2 | Exact rational inequality reproduced | None |
| SieveMaynard.four_lt_maynardM_105 | All 42 displayed rational coefficients | I>0; ΣJ−4I>0 by exact fractions; ratio≈4.000543795842186 | Exact positive margin reproduced | None |
| SieveMaynard.frequently_nth_prime_succ_sub_le_600 | Prime indices n=0,1,2 | Consecutive gaps 1,2,2, all ≤600 | Zero-based indexing and natural subtraction agree | None |
| SieveMaynard.elliottHalberstam_gaps | Prime indices n=0,1,2 | Consecutive gaps 1,2,2; two-step diameters 3,4,6 | Both diameter normalizations agree; EH remains a hypothesis | None |
| SieveMaynard.exists_frequently_nth_prime_sub_le | m=1 and 2,n=0 | Diameters 1,3; scale factors m³e^(4m)=e⁴,8e⁸ | m=0 excluded, shift is m+1 primes | None |
| SieveMaynard.positive_proportion_prime_tuples | m=1,A={0,1,2}; empty A | All three singletons have infinitely many prime translates: 3=choose(3,1); empty gives 0=0 | Subsets counted once | None |
| SieveWeighted.chen_goldbach | N=4,10 | Accepted primes {2} and {3,5,7}; counts 1,3; at N=10 the rejected complement 8 has Ω=3 | Nonunit, multiplicity and subtraction conventions agree | None |
| SieveWeighted.chen_prime_shift | h=2,x=10 | Accepted primes {2,3,5,7}; Ω(p+2)=2,1,1,2; count 4 | Repeated prime factors permitted up to multiplicity two | None |

The standing convention witnesses also give: for support {0,1,2,3,6} and P=6, the exact Legendre calculation is 5−3−3+2=1, while P=1 retains all five points; at P=1,A₁=10,X=7 the signed remainder is R₁=3. For the conjugate-linear first-slot convention, x=1,y=i gives coefficient ⟨i,1⟩=−i and reconstructed vector (−i)i=1, with zero defect. For the half-norm matrix [[2a,b],[b,2c]], a=c=1,b=0 at (1,1) gives half-norm 2 and discriminant −4. For multiplicity, Ω(8)=3 and Ω(12)=3, whereas ω(8)=1 and ω(12)=2. These distinguish the zero label, signed mass error, Fourier sign, factor of two, discriminant sign and almost-prime conventions used by the repaired routes.

## Verification

`lake build TauCetiRoadmap.SieveMethodsAndPrimePatterns.Suggested` exited 0. Exact final build outcome: `Build completed successfully (8976 jobs).` The warnings are admitted theorem targets using `sorry`; there are no elaboration errors.

Exact gate summary line:

```text
gate SieveMethodsAndPrimePatterns: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency-direction output:

```text
depcheck: 49 roadmaps, 575 edges, 0 problem(s)
```

Committed as `09d27d8f`: `SieveMethodsAndPrimePatterns: review repairs (sieve ranges, valuation transport, and character boundary)`. Only the permitted README and Suggested.lean changed; the worktree is clean. Nothing was pushed and no pull-request or issue text was changed.
