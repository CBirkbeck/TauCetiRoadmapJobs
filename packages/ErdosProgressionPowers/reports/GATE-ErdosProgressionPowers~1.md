## H01 (CBirkbeck) — applied

The acceptance test now states six full headline theorems, from half-interval prime divisibility through the exponent and finiteness theorems to Erdős–Selfridge, supported only by the three real-bodied definitions they use: 77 named declarations → 9 in `TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean:33`. Their integer domains, prime/composite exponent distinctions and hyperbolicity hypotheses are unchanged; the headline list is at `TauCetiRoadmap/ErdosProgressionPowers/README.md:303`.

## H02 (CBirkbeck) — applied

The comparison-curve theorem and full simultaneous character-family theorem require the Frey curve's arithmetic conductor, deletion level and residual comparison, which the pinned Weierstrass and character carriers do not supply; `TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean:12` identifies these missing interfaces. The previous partial character signature, which omitted divisibility by the deletion level, is deleted rather than retained as a substitute; its full simultaneous conclusion remains at `TauCetiRoadmap/ErdosProgressionPowers/README.md:926` (BS20 line 503 and BS20 line 746).

## H03 (CBirkbeck) — applied

All 48 Lean examples and the auxiliary API, numerical, boundary and specialization declarations are removed; `TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean:47` begins the remaining headline theorems. The corresponding mathematics remains in README prose and Checks, including the Euler boundary exclusions and the distinct signed hyperbolic and positive finiteness ranges at `TauCetiRoadmap/ErdosProgressionPowers/README.md:1473`.

## H04 (CBirkbeck) — applied

Undeclared local names in backticks → mathematical descriptions and API bullets throughout `TauCetiRoadmap/ErdosProgressionPowers/README.md`, starting at line 318; all nine remaining Lean declaration names appear there. The zero-term audit also replaces the singular factor min(1,1/|ρ|) by min(1,2/(1+|ρ|)) for 0≤Re ρ≤1, with the integral value log 2 at ρ=0, at `TauCetiRoadmap/ErdosProgressionPowers/README.md:1356`.

## Verification record

The six retained theorem statements were compared with their README hypotheses and the source arguments: BS20 line 395 (half-interval divisibility), BS20 line 107 (the signed prime-exponent bound), DG95 line 325 and DG95 line 338 through DG95 line 367 (positive finiteness and the diagonal-curve route), Faltings1983 line 682, and ErdosSelfridge1975 line 29. The signed extension keeps finite sign patterns and the strict genus inequality; the effectivity requirement stays explicit in the README because the existential Lean statement alone does not encode it.

A scratch file containing `#check @name` for every one of the nine retained declarations was elaborated once and each resulting type compared with its README statement: zero missing hypotheses and no binder repairs were needed. The checked pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; the final file has one `import Mathlib`, six theorem bodies containing `sorry`, and no examples or admitted data.

Ownership was searched by object in main, the indexed open roadmaps, board packages and all twelve supplied open-head folders. The retained definitions concern this roadmap's progression terms and solution conditions; no generic representation, curve, conductor or character carrier is introduced, no supplier declaration's fully qualified name is reused, and no ownership or dependency direction moves. Existing citations were resolved against main, and ArithmeticDynamics §6.35 against its supplied head; in particular `ContinuousRep.exists_stable_lattice_iff` exists in `TauCetiRoadmap/EtaleCohomologyFoundations/Suggested.lean:275`, so the initial missing-name lead is not a defect. The Legendre-interface board design overlaps the existing §2.1 targets and is not added as a reverse dependency.

The conductor limitation was checked by object at the pins: `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Galois.lean:71` supplies an actual Tate-module representation, but no arithmetic elliptic conductor/deletion-level interface is available for the full omitted headlines. Native character primitivity means conductor equality (`Mathlib/NumberTheory/DirichletCharacter/Basic.lean:291`), while `MulChar.IsQuadratic` means values in {0,1,−1} (`Mathlib/NumberTheory/MulChar/Basic.lean:442`); neither supplies an elliptic conductor. The regular-point and positive-modulus guards in README §5.2 agree with `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean:50` and `Mathlib/NumberTheory/LSeries/Nonvanishing.lean:397`.

Every additional cited work was fetched through a legal publisher, author or repository copy, except the settled waived citations and Mazur1978's settled uncertified locator; no missing text remains. Existing source keys were reused, and the source manifest was left unchanged under the two-file content edit restriction. The computed instances below test the statements and conventions; they are not proofs of the admitted theorems.

### Adversarial mathematics pass

| Statement | Instances tried | Computed values | Result | Change |
| --- | --- | --- | --- | --- |
| term; zero-based indexing | (n,d)=(2,3), i=0,1; (−3,2), i=2 | [2, 5]; 1 | Pass | Retained real-bodied definition |
| primitive_solution; signs and gcd | (1,24,3,35,2); (−3,2,4,3,2); (4,2,1,2,2) | Products 1225=35²=1225; 9=3²=9; 4=2² but gcd(4,2)=2 | Pass | Retained exact five-conjunct predicate |
| primitive_solution; empty range and nonzero terms | k=0; (n,d,k)=(0,1,3) | Empty product=1, but 0<0 is false; product(0,1,2)=0, y*d=0 if y=0 | Pass | Prose only; hypotheses retained |
| H; H⁺ length and exponent conventions | k=0,1,2; sample k=3, ell=2 | 0,1,2<10⁸<2·10¹⁰; log(2)=0.693147181<10³=1000; both large-exponent predicates reject the samples | Pass | H retained; H⁺ is prose |
| Term gcd and large-prime valuation | n=1,d=24,i=1,j=2; k=3,ell=2,q=5,7 | gcd(25,49)=1 divides 1; v₅(25)=2, v₇(49)=2, both divisible by 2 | Pass | Prose only; hypotheses retained |
| Signed factorization and uniqueness | k=2,ell=3,terms 8,27; k=3,term 64; term −8 | 8=1·2³; 27=1·3³; 64=64·1³; alternative 1·4³ has forbidden small prime 2 in z; −8=1·(−2)³ | Pass | Prose only; hypotheses retained |
| Strict triples: membership, spacing, monotonicity | k=0,1,2,3,5 | Cardinalities [0, 0, 0, 1, 4]; A(3)=[(0, 1, 2)]; spacing 1=1; constant (1,1,1) fails 1<1 | Pass | Prose only; hypotheses retained |
| Equal-sum quadruples and κ sign | k=2,3; tuples (0,1,2,3),(1,2,2,3) | I(2)=[]; I(3)=[(0, 1, 1, 2)]; κ values [-1, -2, -1] | Pass | Prose only; hypotheses retained |
| Divisibility indices; range endpoint | n=1,d=2,k=6,r=3; n=d=1,k=3,r=4 | Indices [1, 4]; []; excluded index 3 would give 4 | Pass | Prose only; hypotheses retained |
| Residue count and rounding | n=1,d=2,k=6,r=3; n=d=1,k=3,r=1000 | 2=6/3; error 0<1; 0≤3/1000+1=1.003; r=1 gives k≤k+1 | Pass | Prose only; hypotheses retained |
| Explicit prime estimates and prime-power tail | x=1,2,4 | θ(1)=ψ(1)=0; θ(2)=log2=0.693147<2.000162; ψ(4)−θ(4)=log2=0.693147 | Pass | Prose only; hypotheses retained |
| Weighted reciprocal-prime sign | x=2; E≈−1.33258 | Σ log(p)/p=0.346574; log2+E=-0.639433; lower endpoint=-1.360780 | Pass | Prose only; hypotheses retained |
| Divisor-subpower and totient-product domains | n=1,2; x=2 | τ(1)=1=1^ε; τ(2)=2>sqrt(2)=1.414214, so a threshold is needed; ∏(1+1/p)=1.5>2log2=1.386294 outside x≥10⁸ | Pass | Prose only; hypotheses retained |
| Frobenius, conductor and coefficient-prime conventions | c_p=0,p=5; good versus multiplicative prime | Frobenius polynomial T²+5 has determinant 5; conductor exponents good=0, multiplicative=1; residual exponent=0 when ell divides the Tate-parameter valuation | Pass | Prose only; hypotheses retained |
| Γ₀ index and Kraus majorant | N=0,1,4,11,44 | μ values 0,1,6,12,72; F_K(1)=1, G_K(1)=4, H_K(1)=4; F_K(11)=9, G_K(11)=169, H_K(11)=169 | Pass | Prose only; hypotheses retained |
| First Frey normalization | n=d=1; n=2,d=1; a=(0,1,2) | (g,coefficients)=(1, (1, -4, 3)); (2, (1, -3, 2)); both coefficient sums 0 and all pairwise gcds 1 | Pass | Prose only; hypotheses retained |
| First Frey invariants and sign | (a,b,c)=(1,−4,3),(1,−3,2) | (Δ,c₄)=(2304, 208) and (576, 112); 16(abc)²=2304,576; 16(a²−bc)=208,112 | Pass | Prose only; hypotheses retained |
| Second Frey model, difference and invariants | n=d=1,a=(0,1,1,2); κ=−1,A=3,B=4 | A−B=−1=κd²; coefficients a₂=−2,a₄=−3; (Δ,c₄)=(2304, 208); −64κ³A²B=2304,16κ(4κd²−3A)=208 | Pass | Prose only; hypotheses retained |
| First/second reduced-level bounds | k=3; kappa=−1 | 2⁷∏_(q≤3)q=768; 2⁷·3⁵·κ²·(2·3)²=1119744; ∣κ∣=1<9; no odd factor 3² in the first primorial | Pass | Prose only; hypotheses retained |
| half_primes_divide_d | signed sample (−3,2,4,3,2), p=3 | 4<2·3=6 and 3≤4, but 3∤2; H fails since 4<10⁸ and log2<10⁴ | Pass | Full theorem retained with all H hypotheses |
| Comparison curve and trace equality | p=3,5, symmetric model | Projective counts 4,8 give traces 0,−2; at p=3, p≡3 mod4; distinct traces −2 and 2 differ by 4, below ell when ell>4sqrt5 | Pass | Full arithmetic-conductor comparison remains prose; no stand-in |
| Scaled Legendre discriminant and root orderings | λ=0,1,1/2,−1 | Δ=1024λ²(λ−1)² gives 0,0,64,4096; six labels at −1 have values −1,−1,2,1/2,1/2,2 | Pass | Prose only; hypotheses retained |
| Case-II order-four witness | t=v=1/2, λ=1/2 | P=(1+i,−1+i); y²=x(x−2)(x−1)=−2i; tangent slope i gives x(2P)=1,y(2P)=0 | Pass | Prose only; hypotheses retained |
| Two-primary counts, twists and CM | p=5; λ=−1; symmetric versus twist | Symmetric count=8, scaled twist count=4; 8 is divisible by 8 and not 16; λ=1/2 has j=1728 | Pass | Prose only; hypotheses retained |
| Legendre case partition | L={−1},{2},{3},{0}; k=0 | −1=−1² and 2=2·1² lie in Case II; 3 lies in neither rational squareclass; 0 lies in both; empty A(0) gives two empty parts | Pass | Prose only; hypotheses retained |
| Character-family conductor support and mass | primitive χ₅; principal modulus one | χ₅(0)=0,χ₅(1)=1,Nodd=5,N=5≤40; principal modulus one has Nodd=1 and is rejected; 0.1239²=0.015351209999999999 | Pass | Full deletion-level divisibility kept in README; partial Lean statement deleted |
| Half-interval Mangoldt sum | constant weight, k=0,1,2,4 | Sums 0,0,log2=0.693147,log3+log2=1.791759; 4 contributes log2, not 0 | Pass | Prose only; hypotheses retained |
| Quadratic conductor largest-prime estimate | N=4,8,24,16 | 0.94logN=[1.303117, 1.954675, 2.987371]<2,2,3; N=16 is not a primitive quadratic conductor | Pass | Prose only; hypotheses retained |
| Smooth-modulus bound and correlation | r=1,q=3; equal versus distinct χ | R≥q^(3/2)=5.196152; factor 4sqrt(2/3)=3.265986; χ₅² on (5,10] has sum 4, so equality of characters is excluded from off-diagonal saving | Pass | Prose only; hypotheses retained |
| Finite Gram inequality | orthogonal e₁,e₂; duplicated e₁,e₁; empty family | For x=e₁: sums of squared inner products 1,2,0; row bounds 1,2,0 give right sides 1,2,0 | Pass | Prose only; hypotheses retained |
| Harmonic and many-character margins | c1=1/20000; coefficients 1/68,0.1239² | 1/68=0.014705882<0.1239²=0.015351210; gap=0.000645328; min(c1,1/2)=0.00005 | Pass | Prose only; hypotheses retained |
| Quantitative Roth cutoff | δ=10⁻⁵ | 132log2/δ=9149542.783391; 10⁶ < value < 10⁷ | Pass | Prose only; hypotheses retained |
| Thin-prime intervals | k=1,2,16 | Tpr(1)=∅; Tpr(2)={2}; 16^(7/16)=3.363586 gives Tpr(16)={5,7,11,13}; Upr(1)=∅; 2∈Upr(2) | Pass | Prose only; hypotheses retained |
| Survivor set and reciprocal thinness | n=d=k=1,S=∅; S={2} | J={0}; reciprocal mass({2})=1/2>0.17; reciprocal mass(∅)=0<0.17 | Pass | Prose only; hypotheses retained |
| Valuation deletion, factorial divisibility and ties | A=(1,2,3,4,1),k=5; A=(1,2,1,2),k=4 | Delete indices 3 for 2 and 2 for 3: J1={0,1,4}, product=2 divides 24; tied 2-valuations at 1,3 delete 1, leaving product=2 dividing 6 | Pass | Prose only; hypotheses retained |
| Removed-index total convention | J=∅; J={3},A3=0; J={2,5},A=1 | Removed indices 0,3,2 respectively; total valuation at 0 is 0, so singleton remains its own maximizer | Pass | Prose only; hypotheses retained |
| Stirling bound and factorial density | m=1; coefficient cutoff A_i=k^139 | 1! =1 ≤ sqrt(2π)/e·exp(1/12)=1.002274; cutoff includes equality A_i=k^139 | Pass | Prose only; hypotheses retained |
| Original-route assembly and maximal distinct primes | largest primes 3,5; density coefficients | Reciprocal mass 1/3+1/5=8/15=0.533333 exceeds 0.166; duplicate 3 would violate distinctness; 0.0032−0.00001=0.00319 | Pass | Prose only; hypotheses retained |
| T(k,c); total values and monotonicity | k=0,1,16;c=0; k=16,c=1 | T(0,c)=T(1,c)=T(16,0)=1; T(16,1)=2.475071>1 | Pass | Definition retained in prose with its API |
| Regular-zero witness and witness-existence predicate | k=0; χ₅,ρ=0,k=16,c=0 | At k=0 real-part test is 1<0 (false); at k=16 lower bound=-0.103425<0, height 0≤1 and L(0,χ₅)=0 | Pass | Exact real-part and pole guards preserved |
| Exceptional modulus set Q(k,c) | k=0,16; q=0,5,k⁴+1 | Q(0,c)=∅; 5∈Q(16,0), since 5≤65536; 0 excluded; 65537>65536 excluded | Pass | Real-bodied finite-set definition becomes prose |
| Page zero predicate | T=2,c=4log2,χ=1 modulo1,ρ=−2 | Lower endpoint 1−4log2/log2=−3≤−2; ∣Imρ∣=0≤2; ζ(−2)=0; principal pair (1,1) fails regular-point disjunction | Pass | Definition remains fully specified in prose |
| Page-exception predicate | q=0; T=−1; q=1,T=2,c=4log2 | q=0 fails positivity; 0≤∣Imρ∣≤−1 impossible; wide strip at q=1 admits ρ=−2 | Pass | No free zero predicate retained in Lean |
| Bounded-height Landau–Page contract | T=2; c′=c/2; width c=4log2 | Narrow endpoint 1−c/(2log2)≥1−c/log2; wide example contains trivial real zero −2 and cannot be mistaken for a small uniform constant | Pass | Reality, simplicity and whole-pair uniqueness remain explicit |
| Real-zero upper bound and exceptional-modulus estimates | q=3; q=5; small-conductor endpoints | Upper bounds -18.134207, -5.905999 are negative, forcing no positive zero there; 1 is the modulus lower floor, not 0 | Pass | Prose only; hypotheses retained |
| Nonexceptional half-sum and explicit formula | ρ=0; principal versus nonprincipal | Integral ∫_(k/2)^k x^(−1) dx=log2=0.693147; at ρ=0 the new bound factor min(1,2/(1+0))=1, while totalized min(1,1/0)=0; principal weight has main term k/2, excluded from O(k/logk) | Pass | Prose only; hypotheses retained |
| Exceptional divisibility indices and sparsity rounding | q=8,n=d=1,k=4; q=1000,n=1000,d=1,k=3 | 8^(1/3)/2=1 permits divisor1: Bad={0,1,2,3}; r=1000 makes index0 bad; k/r+1=1.003 retains the necessary 1 | Pass | Prose only; hypotheses retained |
| Single Granville witness scale | x=16,64 | At16: 8·16^(7/2)=131072>65536=16⁴; at64: both sides=16777216; x≥64 is retained | Pass | Prose only; hypotheses retained |
| Exceptional-conductor detection | N=24, coefficients 3,1,1 | Nodd=3 divides product3; N≤8Nodd=24; gcd-product=3=N/8; one gcd=3≥24^(1/3)/2=1.442250 | Pass | Prose only; hypotheses retained |
| Granville-route contradiction | mass coefficient0.1239; logarithmic errors | Ck/logk<0.1239k once logk>C/0.1239; threshold depends on fixed C, not n or d | Pass | Prose only; hypotheses retained |
| effective_prime_bound | n=0,d=1,k=5,y=0; n=1,d=0,y=1; signed sample | Products 0=0^ell and 1=1^ell give y*d=0; signed product9=3² has log2=0.693147<10⁴ | Pass | Full signed domain and trivial-solution disjunction retained |
| fixed_exponent_finiteness: hyperbolicity and genus | (k,ell)=(3,4) | 2ell+k=11,kell=12,2g−2=4,g=3 | Pass | Strict inequality retained; k≥5 specialization is prose |
| fixed_exponent_finiteness: hyperbolicity and genus | (k,ell)=(4,3) | 2ell+k=10,kell=12,2g−2=18,g=10 | Pass | Strict inequality retained; k≥5 specialization is prose |
| fixed_exponent_finiteness: hyperbolicity and genus | (k,ell)=(5,2) | 2ell+k=9,kell=10,2g−2=8,g=5 | Pass | Strict inequality retained; k≥5 specialization is prose |
| fixed_exponent_finiteness: hyperbolicity and genus | (k,ell)=(4,2) | 2ell+k=8,kell=8,2g−2=0,g=1 | Pass | Strict inequality retained; k≥5 specialization is prose |
| fixed_exponent_finiteness: hyperbolicity and genus | (k,ell)=(3,3) | 2ell+k=9,kell=9,2g−2=0,g=1 | Pass | Strict inequality retained; k≥5 specialization is prose |
| fixed_exponent_finiteness: hyperbolicity and genus | (k,ell)=(3,2) | 2ell+k=7,kell=6,2g−2=-2,g=0 | Pass | Strict inequality retained; k≥5 specialization is prose |
| Positive Euler exclusions and positive fixed-exponent theorem | (k,ell)=(4,2),(3,3); n=d=1; signed control | 4+2=3+3=6; 24 is not a square,6 is not a cube; signed progression(−3,−1,1,3) has product9, rejected by n>0 | Pass | General positive finiteness retained; separate boundary theorems become prose |
| Signed diagonal adapter and elimination | n=1,d=2; one-based a=n−d=−1; j=3 | t1=1,t2=3,t3=5; (j−1)t2−(j−2)t1=2·3−1=5; printed shifted coefficients give 3·3−2·1=7 | Pass | Prose only; hypotheses retained |
| Composite exponent reduction | y=2,ell=6,p=2,3; ell=p=0 | 2⁶=64=(2³)²=(2²)³; at ell=p=0 total division gives y⁰=(y⁰)⁰=1 | Pass | Prose only; hypotheses retained |
| Absolute-value exclusion and finite root/exponent pairs | Y=64,−8,1; d=0 negative control | Roots for64: (64,1),(±8,2),(4,3),(±2,6); for−8: (−8,1),(−2,3); Y=1 gives infinitely many (1,r); d=0,n=y=1 gives product1 | Pass | Prose only; hypotheses retained |
| fixed_length_finiteness | fixed k=5 versus excluded k=1; signs of y | At k=5, 2ell+5<5ell for every ell≥2 (9<10 at ell2); k=1 admits (n,d,y)=(1,d,1) for all d, hence threshold≥5 retained; even exponents admit both signs of y | Pass | Both positive and signed tuple conclusions retained; k is outside finite set |
| consecutiveProduct_not_perfectPower | n=1,k=2,y=1,ell=2; k=1,n=4,y=2,ell=2; n=0 | 2≠1; at k1,n4,y2, product4=2² violates the length hypothesis; n0,k2 gives0=0² outside positivity | Pass | Deep theorem retained with positive n,y and k,ell≥2 |
| Erdős threshold predicate and smooth-multiplier predicate | K=0,3; b=0,1,2; tau=0,1 | 1·25·49=1225=35² rules out K0,K3; b0 excluded; b1 recovers same S; n=d=y=1,k2,b2 gives2=2·1² with support condition2≤2tau iff tau≥1 | Pass | Definitions and their API become prose; conjecture not asserted |

The Page-strip monotonicity API explicitly keeps T≥2; log T is then positive. The corrected zero-term factor is 1 at ρ=0 and has denominator at least 1; the source's half-interval explicit-formula route is BS20 line 1444, with the common bounded height and exceptional region at BS20 line 1408.

Commit: `e3c95fb` — `ErdosProgressionPowers: review repairs (headline acceptance tests and prose APIs)`. Only the two permitted content files changed, and the worktree is clean; no push was made.

### Build and gates

Dependency-check output:

```text
depcheck: 13 roadmaps, 100 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

Build command: `lake build TauCetiRoadmap.ErdosProgressionPowers.Suggested`.
Exact outcome: exit 0, `Build completed successfully (8976 jobs).` Six expected declaration-uses-`sorry` warnings, no errors.

gate ErdosProgressionPowers: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
