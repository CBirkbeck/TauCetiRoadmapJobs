# ArithmeticDynamicsPartII repair report

The reviews use overlapping identifiers. The first four finding sections below belong to r1a; the following six belong to r1b. All ten numbered findings are addressed separately. Their mathematical subjects do not overlap enough to combine verdicts. No independent acceptance is claimed.

## F01 (P2) — applied

r1a: unrestricted finite-SL₂ exponent bounds → q≥3, absolutely irreducible non-dihedral actual image, noncentral c and trace≠2; semisimple centralizer bounds are separated from the prime-field unipotent case. Added D₁₀ as a negative Check. Also corrected the related degree Check from an unsupported exact 40 to 40 or 80. Evidence: C24 lines 3493–3509, 4429–4447, 4458–4470, 4568–4580.

## F02 (P3) — applied

r1a: five API repetitions → computed witnesses in §§3.1, 4.4, 5.14, 6.2 and 7.3. These give eigenvalue orders 4,6,7 at 13, component sizes 40 and 1 at 5, the nonempty second interval at d=1,p=5, orders 6 versus 3 at traces ±1 over 𝔽₇, and MP(11) false. No Lean padding was added.

## F03 (P3) — applied

r1a: the totient comparison and its three Checks moved from §5.4 to §3.0; the complete root bridge moved from §4.1 to §3.0a. Updated §3.3, §3.7, Layers 3–5, and the supplier contract. Deleted §4.0’s forward Markoff-comparison bullet and dependency; §4.3 retains that comparison. Values remain 1=1, 2=2, 3≤6, and eight root-reachable vertices at 3.

## F04 (P3) — applied

r1a: unqualified genus-one Check → odd characteristic, a≠0,±2 and αβ=a²/(a²−4). At a=1 over 𝔽₅ this is 3≠0,1. At α=β=1 the cleared equation factors as (x−y)(xy−1), giving two rational components. The general smooth-cubic argument and the four-point boundary calculation in §5.1 already have the necessary restrictions.

## F01 (P1) — applied differently

r1b: the general-genus bound remains; its proof now explicitly consumes projective-curve purity, rational compact-support localization/duality and the trace formula. Riemann–Hurwitz and deck projectors give dimensions 2g−2+r and s−r. Added matching contracts and a genus-one boundary Check. The proposed genus-zero restriction violates the general-library requirement; generalized lisse-sheaf majoration is unnecessary for this double-cover proof.

## F02 (P2) — applied

r1b: added the headline `block_action_primitive` and the real-body relation `signStep`; §§7.2 and 7.4 identify both. The theorem states the invariant-equivalence characterization on actual Markoff triples, with prime, size, MP, transitivity, equivalence, sign and generator-invariance hypotheses explicit. Evidence: MP18 lines 460–474 and 488–500; both sign and universal relations give valid, distinct conclusions at 5.

## F03 (P3) — applied

r1b: the module docstring now identifies the unstated explicit criteria §§5.13–5.14 and alternating containment §7.4a, with the missing cage/endgame and quotient-action comparisons. It distinguishes these from the newly statable primitivity headline. No weakened connectivity theorem or free condition predicate was substituted.

## F04 (P3) — applied

r1b: Conventions now translates ClassicalArithmeticCompletion’s coefficient-three X,X* into this package’s M,M*, identifies §4.111’s target, and distinguishes §4.58’s coefficient-one trace surface. Verified directly against the main copies of §§4.3, 4.58 and 4.111. The witnesses remain 111↦333, 112↦336, with eight versus zero nonzero points at 3.

## F05 (P3) — applied differently

r1b: §§7.1–7.2 now include auxiliary prime 2, retaining 3∤n for the twist. Section 7.5 includes its singleton blocks and isolates S₄’s prime-power degree4 case. Section 7.6 starts full-triple kernel induction after the 770 base case, at j≥4. The review’s broad kernel formulation needs this qualification: MP18 lines 1196–1198 cover only the fifth prime onward.

## F06 (P3) — applied

r1b: Scope now explicitly excludes general p≡3 modulo 4 alternating containment via the classification of finite simple groups, while retaining primitivity, the general primitive-group theory and the finite containment at 11. Evidence: MP18 lines 96–103 and 479–488. The Layer 7 endpoint and its hypotheses are unchanged.

## Required checks and signature comparison

- Required `lake env lean` elaboration of `packages/ArithmeticDynamicsPartII/Suggested.lean`, executed from the pinned content checkout: **exit 0**, no errors, 19 expected warnings that headline declarations use `sorry`. No Tau Ceti object build was required: the file imports only `Mathlib`.
- Created one scratch copy containing `#check @name` for **all 33 declarations**, then elaborated it once with `lake env lean`: **exit 0**, the same 19 expected warnings. Compared every elaborated type with its README statement: 14 definitions and 19 theorems; **zero lost binders**. In particular, the new relation retains its arbitrary commutative ring, and the headline retains the prime instance and all seven mathematical hypotheses. No existing signature needed a binder repair.
- The required dependency command, with the supplied configuration, README, name, order and `--movable`, returned **exit 0** and exactly:

```text
depcheck: 52 roadmaps, 591 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The two additional suppliers are earlier in the supplied order.

- Citation resolution returned no missing cross-roadmap citation or Lean name. Its external-library scan is unavailable on that service host, so library evidence was checked directly in the pinned worker checkouts instead. The manifest pins and checkout HEADs agree: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
- `git diff --check`: **exit 0**. The README has 54 numbered subsections. Every one of the 33 Lean names appears there; no stale reference to this package’s old §4.1 remains.
- No gate failures were supplied in the brief. No merge-order, tooling, metadata or non-gap design changes were made. No supplier gap is needed: the resolved contracts supply the general cohomological inputs, and the particular double-cover calculation remains here.

## Mathematical verification

These are direct calculations and short arguments performed for this repair, not adopted reviewer verdicts. Finite samples do not prove asymptotic theorems or construct the planned geometric objects. Their universal statements were also compared with the source locators and supplier hypotheses. Tables distinguish those samples from proof arguments.

### Every Lean declaration

| Statement | Instances tried | Computed values on the two sides | Result; change |
| --- | --- | --- | --- |
| `markoffEquation` | ℤ, coefficients 3 and 1; zero ring | 111: 3=3 for coefficient 3, 3≠1 for coefficient 1; 333: 27=27 for coefficient 1; zero ring: 0=0 and no nonzero tuple | Correct convention; unchanged |
| `vietaMove` | ℤ and 𝔽₃, cyclic index 2 | Over ℤ, 111→112→111; over 𝔽₃ the move sends 1 to 2 and then 1; indices 2+1=0 and 2+2=1 | Correct cyclic indexing; unchanged |
| `moveStep` | 𝔽₂ root, leaf, origin | 111→011 true; 011→011 true by a different index; 111→000 false | Fixed labelled steps retained; unchanged |
| `gammaStep` | ℤ tuple 112 | Swap gives 121; Vieta images are 512,152,111 | Permutation generators are additional; unchanged |
| `stable_card_dvd` | Empty set; full nonzero sets at 2,3,5 | 2∣0, 2∣4, 5∣40; 3∤8 | Prime-3 exception necessary; unchanged |
| `divisorPhi` | n=0,1,2,4,6,12 | Values 0,1,3/2,2,5/2,10/3 from divisor sums | Empty-zero convention correct; unchanged |
| `markoffRotation` | Integer root; trace-zero slice at 5 | 333→336→(3,6,15); matrix at trace 0 has square −I and fourth power I | Direction correct; unchanged |
| `rotation_orbit_count` | All odd primes through 31 | Actual/formula counts: 0/0, 8/8, 5/5, 14/14, 26/26, 37/37, 34/34, 41/41, 86/86, 69/69 | Exact agreement; unchanged |
| `no_finite_orbit` | Empty S; S={333}; real trace cube | Empty conclusion ∅=∅; singleton fails stability at 336. On [−2,2]³, s=xyz and abs(xyz)≤2s/3 imply s≤2s/3, hence s=0 | Nonzero and closure hypotheses meaningful; unchanged |
| `orbit_log_lower_bound` | Sample c=1, primes 5 and 31 | (log 5)^(1/3)≈1.17≤40; (log 31)^(1/3)≈1.51≤868 | Samples only; uniform quantifiers agree with BGS16 Proposition 12 |
| `giant_orbit` | ε=1/2, primes 5,7,13; prime 3 | Complements 0≤√5,√7,√13; at 3 there is no nonzero coefficient-one witness | Threshold essential; unchanged |
| `sparse_exceptional_primes` | Every prime ≤31 | Root-reachability exhausts each M*: bad-prime count 0≤√31; at 3 root orbit 8=8 | Added earlier bridge supporting the coefficient comparison |
| `eventual_connectivity` | Primes 2,3,5,7,13 | Root-orbit/vertex counts 4/4,8/8,40/40,28/28,208/208 | Samples consistent; unchanged signature |
| `eventual_positive_lifting` | 111 and 112 modulo 5 | Positive lifts 111 and 112 give 3=3 and 6=6 | Positivity and coefficient 3 retained |
| `prime_affine_lifting` | Coefficients 1,3 at 3 and 5; origin | At 3: X has only 000, M* has eight root-word lifts. At 5: 336 gives 54=54, reducing to 331. Origin: 0=0 | Both affine coefficients and origin included |
| `maximalDivisors` | n=12,1,0; cutoffs 6,3,0,1 | M₆(12)={4,6}; M₃(12)={2,3}; M₀(12)=∅; M₁(1)={1}; M₄(0)=∅ | Divisibility maximality, not numerical maximum |
| `divisorRank` | n=12,1,8 | Ranks at 12: 1,2,2,1; at 1: 1,0,…; C₁(8)=1≠3=binom(3,1) | Multiplicity and squarefree restriction correct |
| `IsMaxDivReduced` | 0,1,3,27,384,768 | False,true,true,false,true,false; 27 requires 9<5; 768 requires 256<200 | Positivity and strict inequalities retained |
| `reduced_domination` | Every n=2,…,64, every divisor-cutoff interval | No failure; example witnesses 2→2,27→30,64→64; bounds 2≤2≤2,27≤30≤102,64≤64≤250 | One m works for all real cutoffs; n=1 would require 1≤m≤0 |
| `central_rank_bound` | Every n=1,…,200 and all cutoff intervals | No failure; n=12,x=6: 2≤2 and 2·8=16≤6·3=18; n=1,x=0: 0≤1 and 1=1 | All-real-cutoff headline agrees with README |
| `orientedStep` | 𝔽₂ leaf fixed step; two swaps over ℤ | 111→011→011 is an oriented step; swapping 112 twice gives 112 | Definition includes pairs of reversing generators |
| `traceOrder` | Traces ±1 over 𝔽₇; trace −2 over 𝔽₅; trace 0 over 𝔽₄ | Roots 3,5 have order 6; roots 2,4 have order 3; noncentral repeated-root orders 10 and 2, versus scalar −I order 2 at 5 | Added distinguishing semisimple Check |
| `semisimple_orbit_congruence` | All admissible traces at q=4,5,7,8,9,13 | No failure. q=4,t=a: n=5, modulus 5, orbit 10; q=8,n=9: modulus 9, orbit 54; q=9,n=8: modulus 2, orbit 64 | Includes nonsplit characteristic two; repaired geometric input restrictions |
| `valuation_orbit_congruence` | Same fields/traces; ℓ=3,5,7,11,13 | No failure. q=4,n=5,ℓ=5: r=1,s=0,5∣10; q=9,n=10: 5∣40 and 5∣60; r=0 gives divisor 1 | Odd-prime and subtraction domains retained |
| `oriented_card_dvd` | Every prime through 31 | Oriented sizes 4,0,40,28,88,208,340,304,460,928,868; each nonempty size divisible by its prime | Empty X* at 3 gives no point instance |
| `oriented_transitivity` | Primes 2,3,5 | Oriented/full sizes 4/4,0/0,40/40; at 5 a fixed swap at 333 rules out two orbits of 20 | Vacuous transitivity separated from nonempty geometry |
| `mpCondition` | Primes 5,7,11,13 | True,false,false,true; at 7 order 8 gives 64<8192; at 11 order 5 gives 25<12288 | Added explicit failure at 11 |
| `primitivePoint` | n=1,5,65,770; root and mixed tuples | n=1 condition vacuous; 333 mod65 nonzero locally at both primes; 555555 mod65 is zero at 5; primitive sizes 40,8320,394240 at 5,65,770 | Definition already general; broadened README construction |
| `signStep` | 333 over 𝔽₅; arbitrary triples over 𝔽₂ | At 5: 322,232,223; with identity these are four tuples; 233 is excluded. At 2 all steps are equality | New simple definition; products of the three involutions give K₄ |
| `block_action_primitive` | Sign and universal relations at 5,13; order condition at 7,11 | Sign classes have size 4; universal classes size 40 and 208. On quotient degrees 10 and 52 every identification of the first block with another generates one class. MP(7)=MP(11)=false | New genuine headline; hypotheses nonvacuous, neither conclusion assumed |
| `squarefree_transitivity` | n=5,65 | Vieta root orbit sizes 40 and 8320 equal primitive-locus sizes 40 and 40·208 | Same word in all factors; endpoint unchanged |
| `squarefree_positive_lifting` | n=65, coefficients 3,1 | Positive 112 and 336 lift their reductions, with 6=6 and 54=54 | Both coefficient conventions remain covered |
| `squarefree_integral_image` | n=65: origin, root, mixed tuples | Image 1+8320=8321 versus 8569 affine points; origin satisfies both sides; primitive root satisfies both; mixed 404040 on M and 555555 on X satisfy neither liftability nor the RHS | Both implications use coprimality plus simultaneous transitivity |

### README targets, identities and proof inputs

The preceding table checks every Lean declaration. The following table additionally records the README-only definitions, API identities, conventions and the geometric/analytic targets used by the repairs, including all numbered subsections. Repeated statement names refer to the same calculation rather than additional Lean declarations.

| Statement or convention | Instances tried | Computed values | Result; change |
| --- | --- | --- | --- |
| Rings, coefficient twist, stars | ℤ, 𝔽₃, zero ring | 111 gives 3=3; 333 gives 27=27; at 3 twist image {000}, #M*=8, #X*=0; zero ring has zero nonzero triples | Supplier notation translated; twist exception retained |
| Commutator sign and action direction | Upper/lower unipotents; identity pair | [A,B]=[[3,−1],[1,0]], trace 3=4+4+9−12−2; identity trace 2=4+4+4−8−2. Precomposing φ then ψ yields ψ∘φ | Fricke −2 and conversion by inversion fixed |
| Splitting and total order conventions | 𝔽₄ trace a; 𝔽₅ repeated roots; ℚ trace 3 | q−1=3 cannot contain order 5; q+1=5 can. At trace 2: eigenvalue order 1, matrix order 5. Over ℚ, eigenvalue (3+√5)/2>1 gives no positive period and orderOf=0 | Splitting, noncentrality and finite-order guards agree |
| Divisor/logarithm/universe domains | n=0,1,2; q=1 | D(0)=∅, Ω(0)=Ω(1)=0; 4·1−6=0 in ℕ, 4·2−6=2; no field has q=1 | No denominator or cardinality assertion at a junk input |
| §0.1 subgroup generators and normalization | Integer root and coordinate swap | R₀(111)=211; swap₀₁ sends 211 to121=R₁(111); sign image (1,−1,−1) is not an adjoined generator | V normal in Γ; Δ separate |
| §0.2 adjacency | 𝔽₂ star and origin | Root degree 3, leaves degree 1; two labelled fixed leaf moves produce zero graph loops; affine component sizes 4,1 | Loopless graph differs from word steps |
| §0.3 reachability/orbit/component equivalence | 𝔽₂ leaf | Leaf-to-self walk length 0, leaf-to-root length 1, component/orbit sizes 4=4 | Both directions of equivalence hold |
| §0.4 finite base graphs | p=2,3,5,7,13 | Counts/root-orbit sizes 4/4,8/8,40/40,28/28,208/208 | Covers p=3 without twisting |
| §1.1 weights and permutation symmetry | Rational root, 012 over 𝔽₅, origin | Root weights 1/3 each; 012 weights 0,3,3 and sum1. Permuting coordinates permutes that vector; naive totalized quotients give sum0 at 012 | Singular branch excludes wrong division model |
| §1.2 sum, complementarity and fixed-point weights | Every M* point at primes 5,…,31 | 3264 points; zero failures for total=1 or paired sum=1. At 012 the zero-coordinate pair is 0+1=1; fixed-coordinate pair 3+3=1 | Fixed points are included |
| §1.3 finite involution balance | Empty set, fixed point, swapped pair | 0=0/2; 1/2=1/2; values 0,1 give 1=2/2 | No fixed-point-free assumption needed |
| §1.4 stable-set divisibility | Full set and empty set | 5∣40,2∣4,p∣0; at 3,3∤8 | Necessary exception and empty case both covered |
| §2.1 rotation matrix, eigenvalues and parameter direction | 333, trace0 and trace2 at 5 | 333→336; trace0 matrix square −I, fourth power I; trace2 matrix fifth power I although eigenvalue1 | Repeated-root separation correct |
| §2.2 generic conic parametrization | a=1 at 5; a=9 at 13 | κ=3 at 5, norm fibre has6 points, slice has6; at 13 split trace9 has12 points and period12 | Source and target of parameter map agree |
| §2.2 degenerate slices | p=5,7,13, a=0,±2 | Slice sizes (8,10,10), (0,0,0), (24,26,26); at 5 periods 4,5,10 | Generic p±1 formula not applied to zero/parabolic slices |
| §2.3 total count and empty-slice characterization | p=3,5,7,13 | Totals 0,40,28,208 equal p(p±3); at 7 only traces0,2,5 have empty slices | Imported total count only specialized here |
| §2.4 Φ and rotation quotient | n=0,1,2; p=3,5,7 | Φ=0,1,3/2; rotation counts0,8,5 equal displayed formula | No division by zero divisor |
| §3.0 cover projection/deck/quotient | f=X on 𝔾_m over 𝔽₅ | Fibres at1,2,3,4 have sizes2,0,0,2=1+χ; deck interchanges ±1; total4−4=0 | Finite étale degree2 is geometric, not rational fibre size2 |
| §3.0 geometric connectedness | f=X versus f=1 | X has odd divisor orders and one connected double cover; f=1 has two components and character sum4 on 𝔾_m | Geometric nonsquareness excludes disconnected model |
| §3.0 character bound, boundary and sign | f=X on ℙ¹ and ℙ¹∖{1} | S={0,∞}: sum0,bound0; S={0,1,∞}: sum−1,bound√5; trace on the anti-invariant H¹_c is +1 | Sum is minus Frobenius trace; full boundary essential |
| §3.0 even-order zeros and polynomial specialization | X(X−1), X(X−1)², X² over 𝔽₅ | First two sums−1,−1; bounds√5,√5; square gives4 and is excluded | Even-order zeros stay in S |
| §3.0 general-genus anti-invariant calculation | E:y²=x³−x, f=x, q=5 | #E=8, #U=6, sum=−2; g_f=1,r=0,s=2; dimensions 2g_f−2g=0 and s−r=2, total2 | Added genus-one Check validates boundary contribution |
| §3.0 gcd and torus-intersection estimates | x+y=1 and x=y over 𝔽₅, m=n=4 | First curve has3 torus points, bound max(3·32^(1/3),192/5)≈38.4; diagonal has4 points but is a translated subtorus | Exclusions and constants retained |
| §3.0 arithmetic elimination/subpower deduction | d=1 non-subtorus line; δ=1,A_d=2 | Degree-one line x+y=1 has3 torus points over 𝔽₅, ≤11+1=12; T=z^(1/4) gives C_dT²=C_dz^(1/2)≤z once z≥C_d² | Quantifier order includes one obstruction integer for all coefficients; no threshold inferred from samples |
| §3.0 Markoff curve smoothness/boundary | a=1,α=1,β=3 over 𝔽₅; α=β=1 | κ=3, four boundary points, g=1,χ=4; positive cubic has0 singular points over 𝔽₂₅. Bad parameters factor into two rational components | Symbolic gradient condition αβ=1 is excluded; added restrictions |
| §3.0 totient comparison | n=0,1,2,12 | At positive inputs1=1,2=2,12/4=3≤6; totalized zero quotient0/0=0 has no positive denominator | Moved from §5.4, with all three Checks |
| §3.0a symmetric-root bridge | p=2,3,5; arbitrary permutations of root | V/Γ root sizes4/4,8/8,40/40; every root permutation111→111 | Normality moves permutations to the root; moved before use |
| §3.1 cage predicate | p=13 tuples018,906,203 | All have sum of squares=product=0 mod13. Orders at018 are4,6,7, below maximal12,14; 906 has order12; 203 has parabolic coordinate2 | Replaced tautological Check; membership is separate from eventual orbit theorem |
| §3.2 slice incidences and discriminant convention | p=5,a=b=1 | Quadratic z²−z+2 has discriminant3; 1+χ₅(3)=0, agreeing with0 intersections. At a=b=0, discriminant0 gives one affine root, the excluded origin | Exceptional/nonzero filters essential |
| §3.3 primitive eigenvalues and factor2 | p=13, split torus order12 | φ(12)=4 primitive roots pair into2 inverse trace pairs; 4/2=2 selected traces | Division by2 justified, totient input moved earlier |
| §3.4 increasing-order middle game | p=13 tuple018 | Coordinate orders4,6,7; moving coordinate0 gives818 with another order7>4; noncage starting tuple remains distinct from maximal-order predicate | Illustrates strict growth only, not a universal small-prime bound |
| §3.5 real cube and logarithmic growth | Real root333; p=5 | 333 lies outside [−2,2]³; inside the cube s≤2s/3 forces s=0. Sample lower bound1.17≤40 | Characteristic-zero obstruction and finite-field norm route retained |
| §3.6 giant orbit and uniqueness | p=5,7,13 | Orbit sizes40,28,208; complements0; each exceeds half total | Uniform asymptotic claim checked against BGS16 Theorem1 |
| §3.7 sparse exceptional set and coefficient bridge | All primes≤31 including3 | Exceptional count0; X*(3)=∅ while M*(3) has8 root-reachable points | Added explicit earlier bridge and separate small-prime input |
| §4.0 affine approximation and isomorphism invariance | 𝔸¹; x²+1=0 at5; Markoff at65 | 4 lifts to4; roots2,3 have no integer roots; mixed404040 gives55=55 mod65 but no lift | Removed forward comparison bullet; general definition unchanged |
| §4.2 complement divisibility argument | p=5,ε=1/2 | Stable complement multiple of5 and <√5<5 must be0; observed complement0 | Root bridge now §3.0a |
| §4.3 origin and prime lifting | Coefficient-one333 at3 and5 | Integer equation27=27; residues000 at3,333≠000 at5; coefficient-three111 never reduces to origin | Twist used only with3 invertible, origin lifted separately |
| §4.4 all-prime proposition | p=2,3,5 | Nonzero graphs have4,8,40 vertices and one component each; full graph at5 has40+1 components | Replaced equivalence repetition with negative graph Check; universal conjecture remains unproved |
| §5.1 subgroup-intersection geometry | a=1,α=1,β=3 over5; a=0 | Degrees of x,y are2,2; four punctures giveχ=4; for the a=1 slice take t=6,d=1: the nonparabolic order-dividing-1 count is0≤(3/2)max(192^(1/3),96/5)=28.8. At a=0,κ=0 makes the generic cubic degenerate | Smoothness proof excludes κ=0,1; no change to the theorem |
| §5.2 maximal divisors and multiplicity | n=12 and p=5,d=1 | M₆={4,6}, M₃={2,3}; M₁(4)={1}=M₁(6), so M₁(5)=1+1=2 rather than union size1 | Positive divisors and antichain meaning retained |
| §5.3 signed complement | Odd-prime nonzero tuple; zero tuple | At5 sign orbit of333 has4 points; a fixed nonidentity double sign would force two coordinates0 and equation forces third0 | Freeness fails only at excluded origin; 4 and p coprime |
| §5.4 obstruction alternatives and positive denominators | p=5,d=1; n=12 | M=2,φ(4)=2,φ(6)=2; first upper108M³=864, second lower5/48 and upper48√5. Totient comparison12/4=3≤6 | Preserved both intervals and endpoints; totient target moved |
| §5.5 reducing maps | D(1); D(5)→D(3); D(3)→D(5) | Identity ratios1; 1↦1,5↦3 gives quotient ratio3/5≤1 at d=1 and1 at d=5; reverse map violates5≤3 | Positive rational ratios and terminal λ(1)=1 retained |
| §5.5 composition/coprime products/2-power condition | Reductions5→3,7→5; terminal pair | Product35→15 sends1,5,7,35 to1,3,5,15. Ratios3/7,5/7,3/5,1 meet the corresponding minima; terminal example gives true ratio3/5 versus false separate-minimum value1 | Source terminal-quotient error remains repaired |
| §5.6 padding and injectivity | Reduction5→3, least a=1 | Target6≥5; at cutoffs1,3,5,6 maximal-set sizes for5/6 are1/1,1/2,1/2,1/1 | Domination persists although the original reducing map need not be injective |
| §5.7 reducedness/log form/support | 3,27,384,768; first absent odd prime5 | 3 has exponent1; 27 demands9<5 false; 384 has2⁷=128<200; 768 has256≥200 | No artificial ordering between 2- and 3-exponents |
| §5.8 uniform domination | n=2,27,64 | Witnesses2,30,64; ranges[2,2],[27,102],[64,250]; all cutoff comparisons nonnegative | Excludes n=1 with impossible[1,0] |
| §5.9 rank polynomial/symmetry/totals | n=12,1,8 | 12:1+2T+2T²+T³, coefficients sum6 and symmetric1,2,2,1; 1: polynomial1; 8:C₁=1≠3 | Rank counts use Ω with multiplicity |
| §5.10 rank interval and central normalization | n=12,x=6; n=4,k=0 | Maximal ranks both2, size2=C₂; central normalized16≤18. Off-central proportion1/3>1/4 at n=4 | Central restriction necessary |
| §5.13 interval constants and closed endpoints | p=5; hypothetical M≤2C | Representative upper bounds10 and18, covered by4p−2=18; 108·8=864,1458·256=373248,4·373248=1492992 | Equality in final rank inequality contradicts the strict obstruction |
| §5.14 uniform threshold/second interval | τ(n)≤n^(1/16); p=5,d=1 | 1492992²=2229025112064, where1492992√n=n; second interval at5 contains1. Sufficient integer bound is p⁵>1788090833748201549667551323803692960841728 | Replaced repeated hypothesis Check by nonempty-interval witness |
| §6.0 level marking, ramification, base change | H=1 and H=SL₂(𝔽₅) | Trivial cover: one exterior epimorphism, ramification degree0 versus marked fibre degree1. Noncentral trace−2 at5: ord(c)=10,d=1,possible degrees40,80 | Unramified object retained without fabricated cotangent datum |
| §6.0 cotangent/coarse-degree identity | SL₂(𝔽₅) component | 12·10=120 divides24·40=960 and24·80=1920 | Removed unsupported choice of exact degree40 |
| §6.0 general finite-group valuation bound | H=1; D₁₀,ℓ=5 | Trivial case exponent0 gives1∣1. D₁₀ has r=1,s=0,j=1 because its proper normal C₅ has no25-part; exponentceil((1−1)/2)=0 gives1∣3 | General theorem does not assert5∣3 |
| §6.0 finite-SL₂ refinement | Explicit matrices over𝔽₄ with a²+a+1=0 | C=[[0,1],[1,a]] has order5, S=[[1,a],[0,1]] has order2, SCS=C⁻¹; generated group has10 elements and commutator order5 | Added non-dihedral restriction; cusp5∣m contradicts m∣12 without it |
| §6.1 trace dictionary and actual images | Unipotent pair; identities; dihedral pair at7 | Trace triples223 and222 give commutator traces3 and2. diag(2,4),[[0,6],[1,0]] gives600 and trace6, with only one nonzero coordinate | Irreducible t≠2 does not imply non-dihedral or full SL₂ image |
| §6.2 trace-order API | Traces1,6 over7; repeated traces over5 | Eigenpairs(3,5) order6, (2,4) order3; trace2 noncentral order5, trace−2 order10, scalar−I order2 | Added inverse-pair and trace-sign distinction |
| §6.3 generalized congruences | q=4,8,9,13 | Modulus/orbit examples5/10,9/54,2/64,7/196; for odd q, n=8,m=8 gives coarse divisor4∣2·64 and adjusted divisor2∣64 | All admissible trace orbits checked in these fields; restrictions propagated through actual-image route |
| §6.4 valuation form | q=4,n=5,ℓ=5; q=9,n=10,ℓ=5 | v₅(60)=1 gives r=1,s=0 and5∣10; v₅(720)=1 gives5∣40,60 | Truncated exponent equals max(r−s,0); odd ℓ removes factors2,4 |
| §6.5 prime divisibility | p=2,3,5,7,13 | Oriented orbit sizes4,0,40,28,208; divisibilities2∣4,5∣40,7∣28,13∣208 | Coefficient-one empty case at3 retained |
| §6.6 oriented transitivity/moduli connectedness | p=2,3,5 | Reachable sizes4,0,40; fixed swap at333 for5. At2,3 the indicated epimorphism locus has0 points | No connected nonempty moduli claim at2,3 |
| §7.1 primitive squarefree CRT | n=1,3,65,770 | Empty prime set would give singleton; n>1 excludes it at endpoints. X_prim(3)=∅; at65 size8320; at770 size394240 | Construction broadened; twist needs3∤n |
| §7.2 sign quotient and equivariance | p=2,5,7; all ambient triples over5 | Block degrees4,10,7; sizes1 at2 and4 at5,7. Exhaustive Vieta/sign commutation on125 ambient triples has0 failures | Added singleton-block convention and `signStep` witnesses |
| §7.3 MP condition and root choice | p=5,7,11,13 | First branch true at5,13; inverse-root orders8 at7 and5 at11; 64<8192 and25<12288 | Added explicit negative control at11 |
| §7.4 invariant equivalence/primitivity | p=5,13; sign and universal relations | Sign quotient degrees10,52; all9 and51 identifications with the first block generate the universal quotient relation. Sign equivalence gives classes4, universal gives40 or208 | New native headline expresses both alternatives |
| §7.4a alternating containment | p=5,13,11; affine degree5 control | Rotation cycles at5:2,3,5, power6 isolates5-cycle; at13 power42 isolates13-cycle; degree52≥16. At11 word cycles3,8,11, power88 isolates3-cycle; AGL₁(5) order20<60, degree5<8 | Single-cycle and degree hypotheses retained; finite11 independent of MP |
| §7.5a socle alternatives and small indices | AGL₁(5),S₃,A₅,C₂,Q₇ | Socles C₅ and C₃ have orders5 and3; S₃/C₃ index2. A₅ order60 has no nontrivial map into S₂ or S₃; C₂ has index2 subgroup. Rotation⁴ fixes4 of7 blocks | Nonabelian-simple restriction and exceptional prime7 retained |
| §7.5a order/section bounds | Primitive degree3; non-two-transitive dihedral degree5 | S₃ is two-transitive and outside section range3<2¹⁶. D₁₀ has base size2, order10≤5²=25<exp(4√5(log5)²) | Quantitative bounds use their stated domains and supplier, not just primitivity |
| §7.5 prime independence and tie-break | Auxiliary primes2,7,11,5 | Rotation orders3,12,30,30; 11²−1=120=5(5²−1). A₂₂ order562000363888803840000 differs from A₁₀ order1814400 | Includes2 only as first factor; degree4 is a prime power and has no nonabelian simple subgroup in S₄ |
| §7.6 full-triple lifting and base case | n=770 and next prime13 | Direct diagonal orbit394240=4·40·28·88; quotient degrees4,7,22,10. Q₂ order24, Q₇ order5040; 13 is fifth prime and j=4 | Full-triple induction begins after the verified four-prime base |
| §7.6 elliptic-coordinate character lower bound | p=127; endpoint121 | (127−11√127)/4≈0.76>0; at121 lower bound0 | Positivity used only above121; small-prime obligations remain separate |
| §7.7 simultaneous transitivity/positive lifting | n=65, coefficient3 root and its first move | Orbit8320=40·208; positive lifts111 and112 have equations3=3,6=6; twist336 has54=54 | No full-affine conclusion; same-word requirement retained |
| §7.8 exact image and mixed patterns | n=65,404040 and555555 | On M:55=55; on X:40=40. Both vanish mod5 and are nonzero mod13; 8321 integral-image points versus8569 affine, difference248 | Necessary primitivity follows from supplied integer coprimality; both inclusions accounted for |

The normalization witnesses are reused consistently: the root/twist pair 111→112 and 333→336, the commutator trace 3 for trace triple223, the order5 nonsplit torus over𝔽₄, and the four-versus-eight-versus-zero small-prime counts. No changed Check contradicts another section. The smooth-cubic Check does not claim a rational torus point over𝔽₅: for its positive parameters the torus count is0, while the four rational boundary points remain.

## Ownership, sources and maintainer notes

Read the main roadmaps ClassicalArithmeticCompletion, SchemeAndStackFoundations and EtaleCohomologyFoundations for shape and contracts. Checked the supplied 51 sibling heads, 102 README/Lean files, by object; the Markoff ownership hit in ArithmeticDirichletSeriesPartII concerns integer-point counting, outside this package. ArithmeticDynamics has no competing affine Markoff construction. Board and main searches likewise preserve the existing surface/move owner and the downstream level-structure direction. The new sign relation is signature notation for the supplied even signs, not a replacement general action theory. No fully qualified Lean name duplicates a supplied roadmap declaration.

The service resolved the named earlier suppliers, and direct reading confirmed their exact sections: DeligneWeightsAndPurity §1.7 supplies projective purity; its §5.9 is a statement about lisse constituents, so the new argument does not claim that section alone proves a compact-support bound. EtaleCohomologyFoundations supplies rational localization and group compatibility; InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3 supplies descended geometric-Frobenius traces. SchemeAndStackFoundations §3.2 supplies tame Riemann–Hurwitz. Thus neither a generic new cohomology construction nor an invented supplier target is needed. Ownership against open pull requests without supplied files was not checked; named supplier statements were resolved through the provided service.

Library contracts were checked at the stated pins, by objects as well as names. In particular, `SimpleGraph` has symmetry and looplessness, not connectedness or nonemptiness; `SimpleGraph.Reachable` is nonemptiness of walks including length0; `MulAction.IsPreprimitive` adds pretransitivity and trivial blocks without asserting a nonempty carrier. `Nat.divisors 0` is empty, `orderOf` is zero at infinite order, and `ZMod.castHom` requires the actual modulus divisibility. The trace and Jordan contracts retain their commutative-ring, cycle, prime-support and degree hypotheses. There is no one-tactic imported theorem added as an admitted headline.

All source work used the supplied legal cache. C24’s manifest locator now explicitly includes Propositions5.4.1–5.4.2 and Theorems5.4.3–5.4.4; no source key was duplicated. M25 and DM96 remain settled uncertified locator-only references; no request was reopened. The known source corrections listed by the reviews remain respected: characteristic-two splitting; characteristic-three cube; primitive rather than full affine squarefree image; four punctures and conservative constants; terminal least-prime-factor cases; central rank; common-divisor multiplicity; prime7’s fixed-point alternative; distinct rotation labels and projections. The finite770 obligation is an explicit mathematical target, with its value independently recomputed here. No new numerical threshold or external source certification is claimed.

Maintainers should note the README-only relocation **§4.1→§3.0a** and **§5.4 totient comparison→§3.0**; all in-package consumers are updated. No existing Lean name was removed or renamed. The additions are `signStep` and `block_action_primitive`. The squarefree headline signatures and all local hypotheses are unchanged. Changes are limited to `packages/ArithmeticDynamicsPartII/README.md`, `Suggested.lean`, `sources.toml` and this report. No commit, push, issue, comment or pull-request write was made.
