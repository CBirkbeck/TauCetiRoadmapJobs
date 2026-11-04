## H01 (CBirkbeck) — applied

In `TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md:3527`, the ambiguous leading coefficient t becomes the Frobenius-fixed component count t_p, with β(p)≤t/p+O(p^(−3/2)), the precise upper dimension product and V(z) lower bound; the equality with coefficient t explicitly requires rational absolutely irreducible components. The saturation and explicit-bound contracts at lines 3568 and 3578 retain arbitrary geometric components, count distinct components for t and the original degree for heights, and include the SL₂ split/inert, repeated-factor and exceptional-prime Checks.

## H02 (CBirkbeck) — applied

`TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md:1313` and line 1354 separate the entire quotient part supported on primes dividing k₀ before smooth/rough decomposition, and line 1356 states the uniform short-modulus rough-point estimate with its rescaled geometry. The Checks record the x₀² obstruction (mass φ(k)/k² entirely at a=k for a≤k), and line 1520 retains separate construction objectives for compulsory parts exceeding (A/k₀²)^η and the ordinary-density R₂ replacement; KHAYUTIN-19 line 3968 states the unshifted estimate, while line 3718 supplies the residue-class argument for the short-modulus extension.

## H03 (CBirkbeck) — applied

The Goldbach proof in `TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md:1464` now consumes §1.4's degree-uniform Euler denominator with degree bound 2 instead of §1.1's fixed-density asymptotic, applying the inclusive estimate at z/2 inside the strict diagonal. It explicitly extracts the varying collision factors and Mertens product, with Checks giving corrections 2 at p=3 and 4/3 at p=5; the uniform denominator is KHAYUTIN-19 line 3522, Lemma 9.8, (35).

## H04 (CBirkbeck) — applied

The Linnik proof in `TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md:2368` replaces population length N and Dickman parameter 1/ε by H=N², Q=N and parameter 2/ε, obtaining E≤6/c_ε, and handles ε≥1 by an empty exceptional set. Its Checks and the analytic requirement at line 2384 use the same scaling, matching the square-root reformulation at KED-ANT-16 line 565 without the ordered-factor overcount.

---

**Sources, ownership and interfaces.**

The inspected legal extractions are KHAYUTIN-19 lines 3522–3541 (Lemma 9.8), 3718–3774 (Lemma 9.13 and its scaled-domain proof), 3968–4034 (Lemma 9.21 and its unshifted weight), and 4333–4402 (Proposition 9.25); KED-ANT-16 lines 485–502 (forbidden-residue inequality) and 556–594 (Linnik); HB-SIEVES lines 1011–1023 and 1038–1058 (Goldbach, twins and Brun). BGS-10 remains settled as uncertified: its §3.2, (3.6), pp.574–575, and (3.34)–(3.40), pp.580–581, are cited by locator alone, and the general component bound is justified by the stated component/intersection argument rather than a claim to have inspected that text.

Cross-roadmap resolution used main `794d0fc` and the indexed 363 open heads; it reported no unresolved cross-roadmap citations or Lean names. The relevant contracts were also read: AnalyticNumberTheoryPartI §§0.21, 0.26 and 3.34 give the uniform Mertens estimates and fixed-parameter smooth count; InverseGaloisAndArithmeticFundamentalGroups §IG.2.5 gives fixed-model Lang–Weil with geometric irreducibility; GeometryOfNumbersAndQuadraticArithmetic §4.1 gives lattice counting; AdelicAlgebraicGroups §4.2 concerns rational-point strong approximation, leaving subgroup reduction to this roadmap. These repairs introduce no supplier or ownership move.

Object searches covered the main/open roadmap index, board packages and all 50 supplied sibling roadmap folders. The short-modulus lemma is a rescaling of this roadmap's planar value sieve, not the coefficient-space discriminant sieves in ArithmeticStatisticsPartsIII/V; the affine component estimate specializes its existing uniform point-count target, and the uniform denominator and Linnik theorem were already owned here. No new generic carrier or competing fully qualified declaration name was introduced.

The library check used the actual Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` checkouts. In `Mathlib/NumberTheory/SelbergSieve.lean:53`, BoundingSieve explicitly requires nonnegative weights, squarefree prime product, multiplicative ν and 0<ν(p)<1 at its sieving primes, without positivity of totalMass or equality to the support mass; line 276 defines selbergTerms using ν and the inverse local product. Thus zero affine local densities are handled by deleting their empty bad sets before forming the native carrier, while a full bad set remains an obstruction. `Mathlib/NumberTheory/SmoothNumbers.lean:240` requires positive integers and strict prime-factor cutoff, and lines 390–395 give the inclusive population cutoff; the 4-smooth Check therefore uses cutoff 5 and counts 28 distinct positive integers.

**Adversarial pass on the repaired statements and consuming interfaces.** Finite computations test hypotheses, conventions and identities; they do not certify the remaining analytic construction objectives.

| Statement | Instances tried | Computed values | Result | Change |
| --- | --- | --- | --- | --- |
| Corrected density of x₀² at odd exponents | p=2,3,5; exponents 1,3 | Counts 0,0 for each p | Exact vanishing, including the dyadic case | Added obstruction Check |
| Corrected density of x₀² at even exponents | Exponents 2,4; p=2,3,5 | Counts (4,32), (18,486), (100,12500), equal to (p−1)p^(3m−1) | Includes singular zeros without lifts | Added formula and Check |
| Original corrected-density power bound | r=1/2,C=1; exponent 2m | Count divided by p^(3m) is 1−1/p; values 1/2,2/3,4/5 | Original constants survive this example | Kept original hypotheses |
| Shifted-weight support | Squarefree k=2,6,30; 1≤a≤k | Sole positive weights at a=k: 1/4,1/18,2/225 | Support begins at the compulsory part, not at 1 | Added warning against shifted decoupling |
| Shifted smooth-tail saving | Primorials through P=3001 and 6007 | Tail/full=1; s≈367.238,678.338; exp(−s)≈3.240·10⁻¹⁶⁰,2.522·10⁻²⁹⁵ | No constant uniform in k can give that saving | Added negative control |
| Smooth-saving admissibility | Same primorials, r=1/2,ε=1/4,κ=1 | log P/8≈1.00084,1.08759, both ≥1 | Failure persists within the original parameter range | Kept unshifted theorem only |
| Entire forced-prime part | Q-value 900,k₀=6; quotient 150 | c=6,b=25, gcd(b,6)=1; n=k₀c=36 and Q/n=25 | Correct factorization includes all 2- and 3-powers | Changed decomposition |
| Forced part beyond short cutoff | Same c=6; B=4096,η=1/6 | B^η=4<6 | The rough-point lemma cannot cover this range | Separate analytic objective |
| Exact-valuation proportions | Q=x₀²,p=2, n=1,2 | d_Q(2,1)=0; d_Q(2,2)=1/4≤ρ̃_Q(4)/16=1/4 | Local bound alone supplies no smooth-tail saving | Preserved local interface |
| Mixed quotient recombination | Q=x₀²,k₀=2,a=1; k₀=4,a=1 | Ordinary totals 2 and 8, whereas corrected totals are 0 and 4 | Zero-exponent factors remain ordinary | No regression |
| Short-modulus corrected factor | Q=x₀²,n=2 and 4,z=1 | n=2: no exact-valuation points, ρ̃=0; n=4: x₀≡2 mod 4, ρ̃=4 | Smooth-only density would erase the second population | Added Check |
| Short-modulus area and radius | B=4096,η=1/6,θ=1,a=4 | B/a²=256=B^(1−2η); radius bound 64/4=16≤256^(5/6)≈101.594 | Rescaled area ≥1 and required curvature bound holds | Added explicit lemma |
| Short-modulus value cutoff | Same data, ς=1 | 4096=256^(3/2) | Necessary cutoff exponent is ς/(1−2η) | Added explicit rescaling |
| Short-modulus boundary | B=1,a=1; k₀=1 | Area B/a²=1; n=k₀a=a | Recovers the existing divisibility sieve | Kept positive cutoffs; η=1/2 excluded |
| Off-modulus density transport | Q=x₀²,n=4,r₀=2,p=3 | Q(4u+2)/4=(2u+1)²; both ordinary counts modulo 3 are 3 | Unit coordinate change preserves the required factor | Specified its domain p∤n |
| Goldbach forbidden residues | N=6 and 10 at p=3 | ρ_N(3)=1 and 2; local factors 2/3 and 1/3 | Uniform prime-value bound is 2 | Changed denominator supplier |
| Goldbach local product identities | p=3,5 | Collision ratios 2,4/3; at p=5, (4/5)²·15/16=3/5 | Both product identities have the stated direction | Added Checks |
| Strict Selberg diagonal | P=15,ν(3)=2/3,ν(5)=2/5,z=5 | Strict diagonal 3; inclusive diagonal at 5 is 11/3; comparison at 5/2 is 1 | Inclusive sum at z would change the cutoff | Use z/2 |
| Small Goldbach populations | N=4,6,10,18 | Ordered counts 1,1,3,4; corrections 1,2,4/3,2 | Bounded inputs can be absorbed into one absolute constant | Kept headline and finite exceptions |
| Linnik population length | N=16,ε=1/2 | H=256,Q=16, smooth cutoff 4; sharp numerator 511 | Numerator now has the same N² scale as the population | N→N² |
| Linnik distinct smooth count | Positive 4-smooth integers ≤256 | 28 integers, proportion 7/64, parameter 4=2/ε | No factorization multiplicity enters | Added Check |
| Linnik prime diagonal | Forbidden primes 3 and 7 | (p−1)/(p+1)=1/2 and 3/4, both ≥1/3 | J(N)≥E/3 supplies E≤6/c_ε | Added quantitative conclusion |
| Linnik degenerate range | ε=1,N=7; any ε>0,N=2 | q(3)=2,q(5)=2,q(7)=3, so E=0; N=2 has no odd primes | Direct empty-set argument | Added branch and Check |
| General affine local coefficient | SL₂, f=a²+b², p=3,5,7,13 | Zero/group counts 0/24,40/120,0/336,312/2184; β=0,1/3,0,1/7 | t_p is 0,2,0,2, not constantly t=2 | Changed local theorem |
| Component error term | Same f at p=5,13 | β−2/p=−1/15,−1/91; inert error β−0/p=0 | Fixed-component leading term fits both splitting types | Added one-sided consequence |
| Rational-component special case | SL₂,f=a,p=3 | Six zeros among 24; β=1/4, t_p=1, β−1/3=−1/12 | Recovers the rational-component equality with an error term | Explicit rational hypothesis |
| Repeated factors | SL₂,f=a and a²,p=3 | Both zero counts 6 and t=1; degrees 1 and 2 | Density ignores multiplicity; height cannot | Propagated to both endpoints |
| Distinct-component intersections | Two lines over 𝔽₃, distinct versus coincident | Intersection counts 1 versus 3; union xy=0 has 5 points | Only distinct components have the lower-dimensional intersection | Explicit proof input |
| Upper dimension product and V | f=a²+b², primes 3,5 | V=2/3, inverse product=3/2; for w=5,v=6,t=2,K=1, RHS≈2.00948≥1.5 | Zero density contributes factor one; only an upper product condition is needed | Added precise contracts |
| Finite exceptional prime | f=a²+b²,p=2; f=2,p=2 | β=2/6=1/3 in the first case; β=1 in the second | Finite-prime adapter preserves primitivity; full obstruction cannot be omitted | Added Check |
| Unit and zero-polynomial boundaries | f=1 and f=0 | Empty zero locus has t=0,β=0; zero function has β=1 | Neither satisfies the nonzero nonunit endpoint | Kept explicit hypotheses |
| Polynomial height with multiplicity | f=a²+b²,C=3,L=0, identity | K_f=2,d=2; actual value 1≤2·3²=18 | Degree multiplies the length exponent | Made height formula explicit |
| Explicit saturation threshold | t=2,dim G=3,d=2,τ=1/2,C=r=3 | Threshold 216; δ=333/2000,s=1801/100 give 72040/333≈216.336<217 | R=217 permits strict parameter margins | Added Check |
| Degree change in threshold | f=a versus a², same other parameters | Thresholds 54 and 108 | Replacing total degree by distinct-factor count is invalid | Added negative control |
| Rank-one word growth boundary | k=1 | r=1 and log r=0 | Denominator requires r>1 | Kept exclusion |

**Acceptance signatures.** A single scratch elaboration containing `#check @name` for every declaration completed with exit 0: 50 declarations, comprising 31 theorems and 19 definitions. Each elaborated type was compared with its README contract; no required binder disappeared, including the Gram scalar and inner-product instances, the polynomial coefficient's prime instance, ε>0 before Linnik's uniform constant, and the absolute constant preceding all Goldbach N. No Lean declaration changed: the repairs concern proof inputs and README-only interfaces whose missing carriers are already identified in the module docstring.

**Commit and direction.** Commit `cfb19251` changes only `TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md`; the worktree is clean and nothing was pushed. The dependency command returned exit 0 and no UPWARD or CYCLE line:

```text
depcheck: 51 roadmaps, 582 edges, 0 problem(s)
```

**Build.** `lake build TauCetiRoadmap.SieveMethodsAndPrimePatterns.Suggested` returned exit 0, with the 31 expected `sorry` warnings and no errors:

```text
Build completed successfully (8976 jobs).
```

**Gate.** The final gate returned exit 0:

```text
gate SieveMethodsAndPrimePatterns: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
