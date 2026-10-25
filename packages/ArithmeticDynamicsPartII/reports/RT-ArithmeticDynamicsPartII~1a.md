<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1041#issuecomment-6398830654 -->
Red team round 1 pass a (codex) of 15c525e

Verdict: needs_changes

1. **F01** (P2) State the non-dihedral hypothesis on the SL₂ degree refinement

   **Location:** packages/ArithmeticDynamicsPartII/README.md:700, “m∣24 in odd characteristic and m∣12 in even characteristic”.

   **Claim:** Section 6.3 uses §6.0 for actual images H≤SL₂(K), including proper images. The finite-SL₂ refinement does not state the subgroup, irreducibility, non-dihedral or semisimple restrictions under which that input is available.

   **Witness:** Take H=D₁₀≤SL₂(𝔽₄), the nonsplit-torus normalizer. C24 lines 3493–3509 give commutator order 5 and 5∣m; hence m∤12. The non-dihedral restriction appears at C24 lines 4429–4433.

   **Exact repair text:** “For q≥3 and an absolutely irreducible subgroup H≤SL₂(𝔽_q) that is not of dihedral type, take a nonempty component with noncentral ramification element c and tr(c)≠2. On its ramification component, m∣24 for odd q and m∣12 for even q. If c is semisimple, its centralizer quotient divides (q−1)/ord(c) in the split case and (q+1)/ord(c) in the nonsplit case. Treat the noncentral trace −2 prime-field case separately as below.” Add the dihedral D₁₀ example as a negative-control Check. This excludes the witness while preserving every use in §6.3.

2. **F02** (P3) Replace five Checks that repeat their defining API

   **Location:** packages/ArithmeticDynamicsPartII/README.md:326, :460, :667, :743 and :865; for example, “the trace order agrees with Layer 2’s eigenvalue order, independent of the inverse root”.

   **Claim:** These bullets count toward the three discriminating Checks for the cage, the all-prime proposition, threshold criterion, trace order and MP condition.

   **Witness:** Compare lines 316/320, 453, 659, 734 and 858: the Checks repeat the same maximum-order, equivalence, hypothesis-list or inverse-order assertions. None evaluates a distinguishing instance.

   **Exact repair text:** Replace those five bullets (in line order) by:

   - “At p=13, (0,1,8) lies on X*: its coordinate eigenvalue orders are 4,6,7, so it is outside the cage. In contrast (9,0,6) has order-12 coordinate 9, and (2,0,3) is parabolic; both belong.”
   - “At p=5, the nonzero coefficient-three graph has one component of size 40; adjoining the origin gives components of sizes 40 and 1, so the full affine graph is disconnected.”
   - “At p=5,d=1, M₁(5)=2 and K₅⁻=48√5. Thus 5/48≤1≤48√5, so this second order interval is nonempty; its exclusion must be verified.”
   - “Over F₇, trace 1 has inverse eigenvalues 3 and 5, each of order 6; trace 6 has inverse eigenvalues 2 and 4, each of order 3.”
   - “Over F₁₁, T²−3T+1 has inverse roots 5 and 9, both of order 5. Thus 25<1024·12=12288 and MP(11) is false.”

   Direct finite-field evaluation gives the displayed values. These retain the mathematical API while adding positive and negative controls.

3. **F03** (P3) Remove forward edges from the stated build order

   **Location:** packages/ArithmeticDynamicsPartII/README.md:346, :382 and :416; “§4.3 for the Markoff comparison”.

   **Claim:** Targets are arranged in build order, with their proof inputs already available.

   **Witness:** §3.3 uses n/φ(n)≤τ(n), first owned in §5.4. §3.7’s Vieta formulation uses §4.1’s root bridge. §4.0 explicitly needs §4.3. At p=3, X*=∅ but #M*=8.

   **Exact repair text:** Move the complete elementary target “For every integer n≥1, prove n/φ(n)≤τ(n)” and its three Checks from §5.4 to the end of §3.0, and cite it in §3.3. Move §4.1’s symmetric-root bridge before §3.7 and update its references. Remove the Markoff-connectedness API bullet and its §4.3 Needs edge from §4.0; keep that comparison exclusively in §4.3. Update the supplier-contract sentence locating the totient comparison.

   The moved totient statement still gives 1=1 at n=1, 2=2 at n=2 and 3≤6 at n=12. The moved root bridge still gives the eight-point Vieta orbit at p=3; the twist is used only away from 3. No theorem is weakened.

4. **F04** (P3) Specify the parameters in the genus-one Check

   **Location:** packages/ArithmeticDynamicsPartII/README.md:310, “For the Markoff curve αx+β/x=y+y⁻¹, the smooth model has g=1 and four boundary points”.

   **Claim:** The displayed equation determines a genus-one smooth model with four punctures, without specifying α or β in this Check.

   **Witness:** Over F₅, α=β=1 gives (x−y)(xy−1)=0 after clearing units. Its normalization is two rational components, not a genus-one curve. Section 5.1’s argument explicitly excludes αβ=1.

   **Exact repair text:** “For odd characteristic, a≠0,±2 and αβ=a²/(a²−4), the curve αx+β/x=y+y⁻¹ has a genus-one smooth model and four boundary points, hence χ=4. For example a=1, α=1, β=3 over F₅ satisfies these conditions. In contrast α=β=1 gives (x−y)(xy−1)=0 and is excluded.” The positive example has αβ=3≠0,1; the counterexample is now explicitly excluded.

## Verified sound

Read all 984 README lines and all 248 Lean lines: **31 declarations (13 definitions, 18 theorems), 54 numbered target subsections and their API bullets, 87 Checks in 27 blocks**. The numbered subsections carry the targets; there are no separate boldface mathematical targets to omit. Checked **58 distinct explicit source-line anchors**, their surrounding named statements and cited proof passages in six readable works. Locator-only M25 and DM96 remain uncertified below. Checked **7 supplier-roadmap contracts covering 37 distinct sections/subtargets**, the ArithmeticDynamics Layers 1–6 scope boundary, and **38 named pinned-library interfaces**. Ownership searches covered main, Completed, board packages and all **51 supplied sibling heads** (102 README/Lean files), supplemented by the roadmap search service.

The following finite calculations are independent scratch computations, not Lean builds or proofs of the asymptotic statements. A successful sample does not establish a universally quantified theorem. Source and proof-route checks are recorded separately from numerical samples.

All 31 supplied mechanically elaborated signatures were compared with the README and source declarations. There are no ambient section variables; the ring/field/Fintype/prime instances and mathematical hypotheses are explicit. No binder disappeared. I did not run another elaboration or change Suggested.lean. There is one `import Mathlib`, no sorry'd data, no option overrides, no admitted examples and no duplicated fully qualified declaration found. All 18 admitted theorems concern the actual Markoff/divisor objects; none passes the one-library-lemma/definition/Check padding probe. The 13 definitions support those theorems.

The 18 theorem rows below are the acceptance headlines: divisibility; rotation count; characteristic-zero nonexistence; logarithmic orbit growth; giant orbit; sparse exceptions; eventual connectivity and positive lifting; conditional prime affine lifting; reduced domination and central-rank bounds; semisimple and valuation congruences; oriented divisibility and transitivity; squarefree transitivity, positive lifting and exact integral image. The module docstring names the two unavailable geometric endpoints (general coarse-degree congruence and geometric connectedness) and the missing level-stack/compactification/degree carriers. No all-prime theorem is asserted.

### Declaration and context ledger

Here `R` means an arbitrary universe-polymor phic commutative ring, `K` an arbitrary universe-polymor phic field, and `P(p)` means `[Fact p.Prime]`. A dash in “change” means no defect found by these instances and the accompanying source/type audit.

| Declaration; README section; Lean line | Retained context | Instances and computed values | Result/change |
|---|---|---|---|
| markoffEquation; conventions; 25 | R, c, ordered triple x | ℤ: c=3,111 gives 3=3; c=1,111 gives 3≠1; c=1,333 gives 27=27. Zero ring gives 0=0, but has no nonzero triple. | Sound predicate; — |
| vietaMove; 0.1; 29 | R,c,i,x; cyclic Fin 3 | ℤ: R₂(111)=112 and R₂(112)=111. At index 2, 2+1=0 and 2+2=1 in Fin 3. F₃: R₂(111)=112. | Correct cyclic indices; — |
| moveStep; 0.2; 34 | R,c,x,y | F₂: 111→011 true; 011→011 true; 111→000 false. | Labelled fixed steps retained; — |
| gammaStep; 0.1; 38 | R,c,x,y | ℤ: 112→121 by swap, while its three Vieta images are 512,152,111. Root swap 111→111 is true. | Strictly includes transpositions; — |
| stable_card_dvd; 1.4; 44 | p,P(p),p≠3,S,hS,hstable | S=∅: p divides 0. Whole M*: 2 divides 4; 5 divides 40. Excluded p=3 gives 3∤8. Singleton root at 5 has size 1 but fails stability. | Necessary restriction retained; — |
| divisorPhi; 2.4; 53 | n:ℕ | Φ(0)=0, Φ(1)=1, Φ(2)=3/2, Φ(4)=2, Φ(6)=5/2. | Empty-zero divisor convention correct; — |
| markoffRotation; 2.1; 56 | R,x | ℤ: 333→336→3,6,15. F₅: zero-trace slice has two 4-cycles; at trace 2 matrix order 5, eigenvalue order 1. | Correct direction and matrix; — |
| rotation_orbit_count; 2.4; 60 | p,P(p),2<p | p=3: 0=0; p=5: 8=2·2+3·(5/2)−14/4; p=7: 5=3·(5/2)+4·(5/2)−50/4. Further primes through 31 match. | Quotient is on the actual nonzero surface; — |
| no_finite_orbit; 3.5; 72 | S⊂(Qbar)³, hS,hstable | Empty S gives ∅=∅. S={333} fails closure because 336∉S. On the root-of-unity trace cube, equation forces s≤2s/3, hence s=0, excluded by hS. | Nonzero and closure hypotheses substantive; — |
| orbit_log_lower_bound; 3.5; 78 | ∃c>0∃P before ∀p,P(p),x,hx,hzero | Sample c=1: (log 5)^(1/3)≈1.17≤40; (log31)^(1/3)≈1.51≤868. At 3 there is no x. These samples do not determine the uniform c,P. | Quantifier order correct; — |
| giant_orbit; 3.6; 86 | ε>0 before ∃P∀p,P(p) | ε=1/2: complements at 5,7,13 are 0≤√5,√7,√13. At p=3 no witness x exists, so the threshold cannot be discarded. | Threshold protects empty locus; — |
| sparse_exceptional_primes; 3.7; 94 | ε>0 before ∃T∀t≥T | Among primes ≤31, bad coefficient-three primes count 0; for ε=1/2, 0≤√31. At 3 the eight vertices are reachable. | Signature true in tested range; build edge R03 |
| eventual_connectivity; 4.2; 104 | ∃P before ∀p,P(p),x,hx,hzero | V-root orbit cardinalities for 2,3,5,7,13 are 4,8,40,28,208, equal to M* cardinalities. | Full finite-field carrier; — |
| eventual_positive_lifting; 4.2; 111 | same threshold order; positive integer a | Mod 5: 111 lifts to 111; 112 lifts to 112, with 1+1+4=3·1·1·2=6. Origin is excluded. | Positivity and coefficient correct; — |
| prime_affine_lifting; 4.3; 118 | p,P(p),hconn; c=1∨3,x,hx | c=3,p=3: eight nonzero residues lift by root words; origin lifts to 000. c=1,p=3: only 000, lifted by 000. c=1,p=5: 331 lifts to 336. | Both coefficients and origin handled; — |
| maximalDivisors; 5.2; 128 | n:ℕ,x:ℝ | M₆(12)={4,6}; M₃(12)={2,3}; M₀(12)=∅; M₁(1)={1}; Mₓ(0)=∅. | Body real, zero excluded by headlines; — |
| divisorRank; 5.9; 134 | n,k:ℕ | n=12 ranks 1,2,2,1; n=1 ranks 1,0,…; n=0 all ranks 0; C₁(8)=1≠3. | Multiplicity, not distinct-prime count; — |
| IsMaxDivReduced; 5.7; 137 | n:ℕ; positivity and all odd primes explicit | 0 false; 1 true; 3 true; 27 false since 9<5 fails; 384 true; 768 false since 256<200 fails. | Positive predicate and all-prime quantifiers retained; — |
| reduced_domination; 5.8; 144 | n≥2; ∃m before ∀x:ℝ | n=2→m=2, endpoints 2≤2≤2; n=27→m=30, 27≤30≤102. All cutoff jumps checked for n=2,…,64. At n=1 the interval would be 1≤m≤0. | Nat subtraction guarded; uniform cutoff witness; — |
| central_rank_bound; 5.10; 150 | n>0,x:ℝ | n=12,x=6: 2≤2 and 2·8=16≤6·3=18. n=1,x=0: 0≤1 and 1=1. n=4: 1·4=4≤3·2=6. All n≤200 and cutoff jumps match. | Central restriction essential; — |
| orientedStep; 6.1; 159 | R,x,y; existential intermediate z | F₂: 111→011 uses a move followed by its fixed leaf move; even orbit size 4. ℤ: swapping twice gives 112→112. | Correct two-reversing-generator relation; — |
| traceOrder; 6.2; 163 | K,t; raw matrix monoid | F₅: trace 3 companion order 10, −I order 2; F₄: trace 0 gives 2, trace a gives 5; ℚ trace 3 has orderOf=0 (infinite order). | Noncentral companion, finite-order use guarded; R02 for Check |
| semisimple_orbit_congruence; 6.3; 168 | K,Field,Fintype,q≥3,t≠±2,hx,≥2 nonzero coordinates | F₄,t=a: q=4,m=5,n=5, modulus 5/gcd(5,1)=5 divides orbit 10. F₈,n=9,m=9: 9 divides 54. F₉,n=8,m=8: 2 divides 64. | Includes nonsplit characteristic two; — |
| valuation_orbit_congruence; 6.4; 180 | preceding context; ℓ prime,ℓ≠2 | F₄,t=a,ℓ=5: q³−q=60,r=1,s=0,5 divides 10. F₉,n=10,ℓ=5: 720,r=1,s=0,5 divides 40 and 60. If r=0, modulus=1. | Truncated subtraction is the intended maximum; — |
| oriented_card_dvd; 6.5; 192 | p,P(p),hx,hzero | p=2: 2 divides 4; p=3: no x; p=5: 5 divides 40; p=13: 13 divides 208. | No lost prime/nonzero hypothesis; — |
| oriented_transitivity; 6.6; 198 | p,P(p),full Γ-transitivity | p=2 even orbit=full set of 4; p=3 both universal relations have zero instances; p=5 even orbit=40, not two orbits of 20. | Empty-set convention matches prose; — |
| mpCondition; 7.3; 208 | p,P(p); roots in algebraic-closure units | 5,13 true by first branch; at 7 roots have order 8, 64<8192; at 11 roots 5,9 have order 5,25<12288. | Units prevent a zero-root stand-in; R02 for Check |
| primitivePoint; 7.1; 214 | n,x; every prime divisor and its canonical cast | n=65:333 true;555555 false since reduction mod 5=000; n=1 condition vacuous but hn excludes it. Mod25 condition only tests mod 5, and squarefreeness excludes that modulus later. | Local, not global nonvanishing; — |
| squarefree_transitivity; 7.7; 218 | n>1,Squarefree n,hlocal,x,hx,hprim | n=65: V111 orbit=8320=40·208 primitive points; n=5 gives 40. Mixed404040 is outside hypothesis. | Diagonal same-word conclusion; — |
| squarefree_positive_lifting; 7.7; 227 | preceding local context; c=1∨3 | n=65,c=3:112 lifts to positive112, equation 6=6; c=1:336 lifts to336,equation 54=54. Every root-word representative stays positive over ℤ. | Coefficient agreement; — |
| squarefree_integral_image; 7.8; 238 | n>1,squarefree,hlocal,c=1∨3,hx | n=65: image size 1+8320=8321<8569 full points. Origin: both sides true; primitive root: both true; mixed404040 (or 555555): both false. | Both directions checked; — |

### README target ledger

Each numbered subsection is represented below; rows split distinct mathematical targets inside a subsection. API identities are evaluated alongside their construction. “Source” means the readable locator supports the stated mathematical route, not that a finite calculation proves an asymptotic theorem. M25-only source certification is reserved below.

| Target; README section/line | Adversarial instance and computed sides | Result/change |
|---|---|---|
| Coefficients, rings, twist; conventions 19–23 | At 111, M equation 3=3; twist333 gives 27=27. At 112, 6=6; twist336 gives 54=54. F₃ twist has image{000}, against M* size 8 and X* size 0. Zero ring has one triple and no nonzero locus. | Polynomial conventions agree with supplier; — |
| Commutator and action direction; conventions 25 | A=[[1,1],[0,1]],B=[[1,0],[1,1]] give [A,B]=[[3,−1],[1,0]], trace3=4+4+9−12−2. Identity pair gives 2=4+4+4−8−2. Precomposition of two maps reverses their order; inversion reverses it back. | −2 and left/right convention correct; — |
| Split/repeated-root convention; conventions 27 | F₄ trace a has n=5 although discriminant a² is square; q+1=5, q−1=3. F₅ trace±2 orders5,10, whereas scalar orders1,2. | Splitting criterion and noncentral condition essential; — |
| Total-function/domain conventions; 29 | D(0)=∅, Ω(0)=Ω(1)=0; n=2 gives 4n−6=2; n=1 gives 0. Field q=1 impossible; n=1 squarefree endpoint excluded. | Junk values guarded; — |
| Generated V,Γ,Δ; 0.1:84 | Over ℤ, swap01 fixes111; conjugating R₀ by swap01 sends111 to121=R₁(111). R₂²(111)=111. A double sign sends111 to1,−1,−1 and is not an added Γ generator. | Normalization and generator distinction; — |
| Loopless graph; 0.2:105 | F₂ root degree 3; a leaf has two labelled fixed moves but no self-edge. Adding origin gives component sizes4,1. | Carrier/adjacency correct; — |
| Reachability versus V orbit; 0.3:125 | F₂ leaf011 reaches itself in length0 and root in length1; both belong to its four-element V orbit. Origin belongs to neither carrier. | Both implication directions preserved; — |
| Small-prime graphs; 0.4:133 | For p=2,3,5,7,13, solution counts and root-orbit counts both equal4,8,40,28,208. | Direct finite checks; — |
| Extended weights; 1.1:159 | Q root weights(1/3,1/3,1/3), sum 1. F₅(0,1,2) weights(0,3,3), sum 1. Naive all-coordinate division gives(0,0,0) there, sum 0. | Singular extension distinguishes wrong model; — |
| Weight total, edge complement and fixed-point value; 1.2:180 | F₅ at 012: zero-coordinate move gives 112, first weight0→1; second-coordinate move gives 042, second weight3→3, 3+3=1. Checked all 3264 points at primes5 through 31, zero violations. | 2 and 3 invertible exactly where used; — |
| Involution balance; 1.3:188 | Empty C:0=0/2. One fixed point with f=1/2:1/2=1/2. Swapped pair f=(0,1):sum 1=2/2. Characteristic2 cannot satisfy a fixed-point equation 2f=1. | Empty/fixed cases true; — |
| Stable-set divisibility; 1.4:196 | Empty set givesp divides0; full sets at 2,5 give2 divides4 and 5 divides40; at excluded3,3∤8. | Domain necessary; — |
| Rotation carrier, matrix and eigenvalue order; 2.1:218 | 333→336; at a=0 matrix square=−I and fourth power=I. At a=2 overF₅, matrix fifth power=I but eigenvalue order 1. | General and degenerate cases separated; — |
| Generic conic parametrization; 2.2:239 | F₅,a=1: κ=3, nonsplit norm fibre has 6 elements and slice 6 points. F₁₃,a=9 has split eigenvalue order 12 and slice 12 points; all periods12. | κ and λ direction correct; — |
| Degenerate conics; 2.2:239 | F₅: a=0 gives 8 points/two4-cycles; a=2 gives 10 points/two5-cycles; a=−2 gives 10 points/one10-cycle. F₇: all three slices empty. | Generic formula is not specialized illegally; — |
| Point count and empty slices; 2.3:247 | p=3:3(3−3)=0;5:5(5+3)=40;7:7(7−3)=28;13:13(13+3)=208. At7, exactly a=0,±2 have empty slices. | Imported total count plus local slice adapter; — |
| Divisor Φ and orbit count; 2.4:255 | Φ(0)=0,Φ(1)=1,Φ(2)=3/2. Observed/predicted orbit counts at 3,5,7,11,13,17,19,23,29,31 are0,8,5,14,26,37,34,41,86,69. | Source C24 line 4418 and direct computation agree; — |
| Kummer double-cover fibre/deck/connectedness; 3.0:291–297 | OverF₅, f=X on Gm: fibres at 1,2,3,4 have2,0,0,2 points=1+χ. Deck swaps ±1 over1. Constant f=1 has two components and sum 4, excluded by geometric nonsquareness. | Rank-two cover is genuine, no free predicate; — |
| Quadratic-character estimate; 3.0:291 | g=0,S={0,∞},f=X:sum 0,bound0. Add removed point1:sum−1,bound√5. f=X(X−1)² gives−1 with even-order zero retained. | Boundary normalization correct; — |
| Curve gcd and subgroup intersections; 3.0:299 | x+y=1 overF₅: three pairs in μ₄²; χ=1,degrees1,1; RHS=max(3·32^(1/3),192/5)=38.4≥3. Diagonal x=y gives 4 but is excluded by dependence. | CZ13 lines 123,154 support nonzero-differential/independence conditions; — |
| Low-order points and integral obstruction; 3.0:301,312 | d=1 gives cap11+1=12, whereas x+y=1 overF₅ has 3 torus points; a translated torus has 4 and is excluded regardless of threshold. Choosing T=z^(δ/(2A)) gives C·T^A=C·z^(δ/2)≤z^δ once z≥C^(2/δ). | Arithmetic absor ption, not density-one inference; CKSZ14 lines 440–489; — |
| Genus-one boundary Check; 3.0:310 | α=1,β=3 overF₅: smooth cubic, four boundary points, χ=2−2+4=4. α=β=1: two rational components. | R04 |
| Cage predicate and sign stability; 3.1:314 | At13, orders of coordinates of(0,1,8) are4,6,7: outside; (9,0,6) has 12,4,14: inside. At5 the full 40-point orbit has all four sign translates; complement0. | Definition meaningful; R02 for non-discriminating Check |
| Conic incidence; 3.2:334 | F₁₃,a=b=1: discriminant1−8=6 nonsquare, intersection=0=1−1. a=b=3:81−72=9, intersection2=1+1. | χ(0)=0 gives one double-root point; asymptotic diameter from BGS16 line 320; — |
| Primitive-coordinate count/endgame; 3.3:342 | F₅ primitive eigenvalues 2,3 are inverses, both trace0: two eigenvalues correspond to one trace. Thus an eigenpair main term Lφ(4)/4=L/2 becomes trace main termL/4. | Factor1/2 correct; source BGS16 line 338; R03 |
| Middle-game growth; 3.4:350 | For L=p^ε, cubic contribution divided byL is at most p^(−ε/3+o(1)); for L≤p^(1/2+δ), linear contribution divided byL≤p^(−1/2+δ+o(1)). Chooseδ<1/2; both decay. | Uniform exponent mechanism and separating powers correct; — |
| Characteristic-zero opening; 3.5:358 | In cube[−2,2]³, at 222 product8 versus square-sum 12; inequality8≤(2/3)12 is sharp. Markoff equality would force s≤2s/3, hence s=0. | No finite nonzero orbit; — |
| Logarithmic opening; 3.5:358 | Three orders≤N₀ give lcm≤N₀³, cyclotomic degree≤N₀³ and norm≤20^(N₀³); p divides a nonzero norm implies N₀≥(logp/log20)^(1/3). | Norm nonvanishing and divisibility have named pinned suppliers; — |
| Giant orbit; 3.6:368 | At13 full orbit208 has complement0≤13^ε. Bound ≤p^(1/2) is less than half p(p−3) for all sufficiently largep; two disjoint majority orbits impossible. | Sources BGS16 line 35; correct ε-before-P order; — |
| Sparse exceptions; 3.7:378 | All tested primes≤31 contribute0. In the uniform obstruction estimate, fixed constants are absorbed before setting the prime cutoff, as in the 3.0 row. | Source BGS16 line 802; coefficient/V bridge needs R03 |
| Affine surjectivity predicate; 4.0:400 | A¹(Z)→A¹(F₅) is onto; x²+1=0 has 0 integral points versus2 residues; full Markoff reduction at 65 has 8321 versus8569 points. | Distinguishes affine and primitive approximation; R03 |
| Symmetric root bridge; 4.1:418 | Root stabilizer S₃ fixes111; e.g. permutation after R₂ gives 121=R₁(111). At3 both Γ- and V-root orbits have8 points despite failed twist. | General normal-word argument valid; move earlier perR03 |
| Eventual connectivity; 4.2:426 | Possible complement cardinalities at p=5 below5 are0,…,4; divisibility by5 leaves only0. With ε=1/2, √p<p for everyp>1. | Nonempty root/transport hypotheses present; — |
| Prime lifting; 4.3:436 | Coefficient-three111 at 3 is nonzero; coefficient-one333 at 3 is000. Over5 twist preserves nonzero root; zero is lifted by000. | Exceptional3 handled explicitly; — |
| All-prime conjecture; 4.4:446 | Specializations p=2 andp3 true with 4 and 8 vertices. Universal truth is not deduced from finitely many samples or eventual truth. | Remains a proposition, not admitted theorem; R02 |
| Explicit conic bound; 5.1:484 | F₁₃,a=9,t=12,d=7:2 selected cycle points≤(3/2)max(2688^(1/3),1344/13)=2016/13≈155.08. Coordinate divisor degrees2,2 and χ4 give32td, not6td. | Conservative corrected constants; — |
| Maximal divisors; 5.2:492 | M₆(12)={4,6}; 2 divides maximal6, while4 and 6 are incomparable and gcd=2. M₁(5−1) andM₁(5+1) each={1}, giving M₁(5)=2, not union-cardinality 1. | All-real cutoffs and multiplicity correct; — |
| Signed complement; 5.3:516 | At5 a nonzero sign block has 4 elements; p=5 is coprime to4, so4 and 5 divisibility combine to 20. Full-cage orbit complement0 has 20 divides0. At2 sign block size 1, excluded. | Explicit sign-invariance hypothesis retained; — |
| Effective obstruction; 5.4:524 | From d≤(3/2)M(32d²)^(1/3), cubing givesd≤108M³. From d≤24Md²/p, d>0 givesd≥p/(24M). M≥2 at cutoffd≥1. | Constants and nonzero denominators correct; — |
| Totient comparison; 5.4:530 | n=1:1=1;n=2:2=2;n=12:3≤6. n=0:total quotient0 butφ(0)=0, so the positive-denominator assertion fails. | Mathematical target sound; move perR03 |
| Reducing maps and composition; 5.5:540 | D(25)→D(9), (1,5,25)↦(1,3,9): f≤d; remaining-quotient ratios9/25,3/5,1 are≤3/5,3/5,1. Composing D(49)→D(25)→D(9) gives 9/49≤3/7. | Positive rational quotients; identity/terminal case1=1; — |
| Reducing coprime product and terminal quotient; 5.5:540 | (A₁,B₁)=(1,1),(A₂,B₂)=(3,5): product ratio3/5; λ-product ratio3/5; separate minima ratio 1. The corrected proof discards(1,1). | Wrong minimum identity not imported; — |
| Padding antichains; 5.6:563 | n=5→m3, leasta=1 gives padded6. Atcutoff4, M₄(5)={1} maps to 2∈M₄(6)={2,3}; at cutoff5, {5} maps to3. Cutoff0 gives 0≤0. | Padding is a theorem, not injection assumption; — |
| Reducedness and odd support; 5.7:571 | 3 reduced;27 rejected by9<5;384 passes128<200;768 fails256<200. Reduced3 hasa₂=1>a₁=0, excluding an unwarranted2-exponent order. Adjoining5 gives 15 reduced. | All odd primes and absent-prime guard; — |
| Reduced domination; 5.8:592 | n=2 forcesm2; n=27 admitsm30; intervals[2,2] and[27,102]. Exhausted every cutoff jump for n=2,…,64. | ∃m∀x, not∀x∃m; — |
| Divisor rank polynomial; 5.9:602 | n=12 coefficients1,2,2,1 sum 6=τ(12); symmetry1=1,2=2. n=1 polynomial1. Squarefree6 ranks 1,2,1 equal binomial2; n=8 rank1=1≠3. | Rank and squarefree hypotheses correct; — |
| Central and interval antichain bounds; 5.10:625 | n=12,x6 ranks{2,2}, k2 gives 2≤C₂=2. Atx3 ranks{1,1}, k1 gives 2≤C₁=2. n=4 normalized central1/3≤1/2, while rankzero1/3>1/4. | Off-central normalization correctly excluded; — |
| Uniform intervals; 5.13:637 | p=5 representative ranges[4,10],[6,18], commonupper18. M≤2C gives 108·8=864 and 1458·256=373248; multiplying by4 gives 1492992. | Strict obstruction versus non-strict exclusion consistent; — |
| Uniform threshold; 5.14:657 | A=1492992: atn=A², A√n=A²=n. Sufficient inequality384(p+1)^(3/16)<√p follows by16thpowers fromp⁵>8·384¹⁶. At p=5,d1 second interval contains 1. | General eventual estimates valid; R02 for last Check |
| Elliptic level carrier and connected-cover marking; 6.0:683 | H=1: one exterior epimor phism, center1, unramified identity cover; reduced ramification degree 0 versus marked-fibre degree 1. H=C₂³ needs3 generators: epimor phism setF₂↠H empty. | Nonempty-component/ramification conditions matter; — |
| Coarse degree/character congruence; 6.0:693 | SL₂(F₅),e10,d1,degree 40:12e=120 divides24·40=960. e1 forH1 does not provide a ramification component. | General degree formula supported byC24 line 2295; — |
| General prime-power degree congruence; 6.0:700 | SL₂(F₅),ℓ=5:r=1,v₅(120)=1,s0,j0; predicted5^ceil(1/2)=5 divides degree 40. ForH1,e1,r0,s0,j0 predicted1, but ramification construction has no component. | Hypotheses and exponent retained; — |
| Finite-SL₂ character refinement; 6.0:700 | D₁₀≤SL₂(F₄),e5:5 dividesm, hence m∤12. ForfullSL₂(F₄), nonsplit centralizer quotient5/5=1. | Missing subgroup restriction: R01 |
| Trace dictionary and non-dihedral locus; 6.1:704 | F₇ diag(2,4), offdiagonal(0,6;1,0) gives traces(6,0,0), tracecomm6, onlyone nonzero coordinate. Identity pair trace2 reducible. Unipotent pair traces223 hastrace3. | Conjugacy and non-dihedral restrictions explicit; — |
| Trace order; 6.2:726 | F₅ noncentral trace−2 order 10 versus−I order 2; F₄trace0 order 2; F₄tracea nonsplit order 5. | Arbitrary-field companion versus finite-field theorems consistent; R02 |
| Semisimple oriented congruences; 6.3:749 | F₄modulus5 divides10; F₈moduli1,7,9 divide54,70,54 respectively. F₉modulus5 divides40,60; modulus2 divides64. All semisimple traces at these fields and odd primes≤31 tested. | Both splitting types, subfield images and empty trace loci retained; — |
| Valuation congruence; 6.4:757 | F₄n5,ℓ=5 givesr1,s0,5 divides10. F₉n8,ℓ=3 givesr0,s2,3^0=1. Takingℓ=2 would invalidate the “2 has valuation zero” step and is excluded. | Natural subtraction matchesmax; — |
| Oriented Markoff divisibility; 6.5:767 | p=2:4≡0 mod 2;p=3:no points;p=5:40≡0 mod 5;p=7:28≡0 mod 7. | Includes2 directly, no false3-component inference; — |
| Oriented transitivity; 6.6:777 | p=5 swap fixes333 in40-point orbit; two 20-point even orbits would require no reversing fixed point. p=2 even orbit4; p=3 universal condition vacuous. | Index-at-most-two argument has fixed-point witness; — |
| Geometric connectedness; 6.6:777 | p=5 degree 40 corresponds to one oriented component; p=2,p=3epimor phic trace−2 loci empty. | Empty stacks explicitly excluded; carrier not statable at pins |
| Primitive squarefree locus; 7.1:805 | n=65:primitive cardinal40·208=8320, fullcard41·209=8569; mixed555555 maps to000 mod 5 and 333 mod 13. | CRT restricts to product of nonzero loci; — |
| Sign blocks and native primitivity; 7.2:828 | p=5blocksize4 and 10blocks;p=7size4 and 7blocks;p=2all four sign expressions equal111. | Faithfulness/nontriviality imposed for group arguments; — |
| MP condition; 7.3:849 | p=5,p=13first branch true;p=7n8 gives 64<8192;p=11n5 gives 25<12288. | Exact squared threshold; R02 |
| Local block primitivity; 7.4:871 | At5block rotation cycles2,3,5; sole5-cycle intersects parabolic coordinates and forcesone invariant block. At11all 21 congruences identifying a fixedblock with another close to one class. | Parabolic hypothesis weaker than full X-transitivity as stated; — |
| Parabolic alternating containment; 7.4a:879 | p=5 sixth rotation power isone5-cycle,8≤10; p=13 forty-second power: one13-cycle,16≤52. AGL₁(F₅):20<60 whiledegree5<8. | PinnedJordan hypotheses retained; — |
| Exceptional alternating containment; 7.4a:883 | At11eight-generator word has cycles3,8,11; 88thpower has one3-cycle;6≤22. Swap hasnine2-cycles and four fixed points, henceodd. | Direct primitive check givesS₂₂; — |
| Primitive socles; 7.5a:895 | AGL₁(F₅) socleC₅ oforder5 regular; S₃ socleC₃ oforder3 transitive; A₅×A₅ onA₅ hasdegree60 and two regular factors60. | Affine and two-factor alternatives not discarded; — |
| No small-index subgroup of nonabelian simple products; 7.5a:905 | A₅order60 cannot map nontrivially into S₃order6; C₂has index2trivial subgroup andis excluded. | Nonabelian adjective necessary; — |
| Primitive order/section bounds; 7.5a:913 | Degree3regularC₃:order 3<exp(4√3(log3)²)≈4280. Forn=2¹⁶,6logn≈66.54; AGL₁(F_(2¹⁶))hascyclicC₃ section(k3<66.54), no alternating containment assumed. | DM96locators uncertified; order route has named Babai supplier |
| Independence and equal rotation orders; 7.5:919 | Y₅×Y₁₃has10·52=520blocks reached. At7rotation cycles3,4; fourth power fixes4of7>1affine fixed-point maximum. Equationp²−1=q(q²−1) belowq203897 hasonly(11,5),both rotation orders30. | Finite exclusion recomputed; socle induction does not assume the product action; — |
| Simultaneous sign lifting; 7.6:927 | At770, V333orbit394240=4·40·28·88. At65, full primitive8320=16·520. Explicit elliptic pairs for every11<p≤121,p≡3 mod4 have orders divisible by4; at 19 orders20,20. | Finite base and two rotations verified; — |
| Squarefree transitivity/positive lifting; 7.7:935 | n=65root orbit8320=primitive cardinality; c3root 111andc1root333are positive integral points; n=1and25excludedbyhn/squarefree. | Same global word and integral positivity; — |
| Integral image; 7.8:945 | n=65image8321; full8569;248mixed points unliftable. At404040,c3equation4800≡192000≡55 mod 65. Twist555555reduces000 mod 5. | CorrectsC24line4688; no affine overclaim |

### Complete Check ledger

Locations below are in packages/ArithmeticDynamicsPartII/README.md. Each row corresponds to one of its 87 bullet Checks; values also test the surrounding definitions. R02 and R04 identify the six deficient Checks. The others survive the indicated instance/proof check.

| Check | Line | Values computed; result |
|---|---:|---|
| C01 | 97 | 3·1·1−1=2, so R₂(111)=112. |
| C02 | 98 | swap01(111)=111; swap01²=id. |
| C03 | 99 | At3, #X*=0 and #M*=8; twist image size 1 including origin. |
| C04 | 117 | At2, vertices111,011,101,110; root's three distinct neighbours are the three leaves. |
| C05 | 118 | R₁(011)=011; inequality x≠x is false, so adjacency false. |
| C06 | 119 | At2, adjoining000 changes one component of4 into components 4,1. |
| C07 | 139 | At2,3,5,7,13, both cardinality lists are4,8,40,28,208. |
| C08 | 140 | At3, coefficient-one nonzero cardinal0; connected nonempty carrier unavailable. |
| C09 | 141 | At2, leaf fixed step011→011; shortest walk length0. |
| C10 | 172 | Q weights(1/3,1/3,1/3), total1. |
| C11 | 173 | F₅ weights(0,3,3);6≡1. |
| C12 | 174 | Origin has three zero coordinates, so neither all-nonzero nor unique-zero branch applies; naive totalized quotients sum 0≠1. |
| C13 | 231 | 3·3−3=6, rotation 333→336. |
| C14 | 232 | At p=5, trace2 companion has order 5 but root 1 has order 1. |
| C15 | 233 | At p=5, trace0 eigenvalues 2,3 both have order 4; slice cardinal8, not generic4. |
| C16 | 269 | Φ1=1, Φ2=1+1/2=3/2. |
| C17 | 270 | p=3 expression3/2+4−22/4=0; observed0. |
| C18 | 271 | p=5 expression4+15/2−14/4=8; observed8. |
| C19 | 305 | χ₅(2)+χ₅(3)+χ₅(4)=−1−1+1=−1; bound√5. Incorrect s2 gives bound0. |
| C20 | 306 | f=X on Gm:1−1−1+1=0. f=X(X−1):values2,1,2 at 2,3,4 give−1+1−1=−1. |
| C21 | 307 | f=X(X−1)²:values2,2,1 give−1; retained zero1 is excluded fromU; derivative2w at(w,x)=(0,1) vanishes. |
| C22 | 308 | Torus pairs(2,4),(3,3),(4,2):count 3; RHS38.4≥3. |
| C23 | 309 | Diagonalμ₄ has 4points; f=X² contributes four1s and one0, sum 4. Both excluded hypotheses fail. |
| C24 | 310 | α=β=1 factorsinto(x−y)(xy−1); normalization: two P¹, not genus1. Withα=1, β=3 inF₅, g1,s4,χ4. R04. |
| C25 | 326 | No evaluated instance in the original; replacementp13 orders4,6,7 excludes(0,1,8), while12,4,14 includes(9,0,6). R02. |
| C26 | 327 | At p=7, thea=2 and−2 slices each have0points; their added union isempty. |
| C27 | 328 | At p=5,a0 order 4=p−1, yet slice 8≠p−1=4; nongeneric restriction prevents misuse. |
| C28 | 412 | Mod5 residue4 lifts to integer4; each residue0,…,4 hasitself as lift. |
| C29 | 413 | 2²+1≡3²+1≡0 mod 5; overℤ, x²+1≥1, so0roots versus2residues. |
| C30 | 414 | Mixed404040 satisfies4800≡192000≡55 mod 65, but reduces000 mod 5 and 111 mod 13; no integral lift by pairwise gcd1. |
| C31 | 458 | p=2 root orbit4=all4vertices. |
| C32 | 459 | p=3 root orbit8=all8vertices; coefficient-one locus0. |
| C33 | 460 | Original repeats universal equivalence; replacementp5 full graph has components 40 and 1. R02. |
| C34 | 472 | c3 root 111 reduces111 at 3; gcd(1,1)=1 excludes simultaneous prime divisibility. |
| C35 | 473 | c1 root 333 has 27=27 and reduces000 at 3; zero triple is another lift. |
| C36 | 474 | c1 root 333 reduces333 at 5;3 is a unit with inverse 2. |
| C37 | 508 | D12 below 6={1,2,3,4,6}; divisibility-maximal subset{4,6}. |
| C38 | 509 | D12 below 3={1,2,3}; maximal{2,3}. Atcutoff6, gcd(4,6)=2 supplies the noncoprime alternative. |
| C39 | 510 | D12 below 0 empty; D1 below 1={1}, maximal cardinality 1. |
| C40 | 534 | φ1=1,τ1=1, ratio 1. |
| C41 | 535 | φ12=4,τ12=6, ratio3≤6;φ2=1,τ2=2, ratio2=2. |
| C42 | 536 | φ0=0,D0=∅, total real0/0=0; positiveφ premise false. |
| C43 | 554 | q5,a2 map1,5,25→1,3,9: quotient ratios9/25≤3/5,3/5=3/5,1=1. |
| C44 | 555 | D1 identity:both rational ratios1, least-prime-factor ratio 1. |
| C45 | 556 | D3→D5 sends 3 to 5; required5≤3 is false. |
| C46 | 557 | λ(1·3)/λ(1·5)=3/5; min(1,3)/min(1,5)=1. |
| C47 | 584 | n=3 at p=3,q5 gives 3^floor(2/2)=3<5; absent-prime 2-bound1<200. Other odd primes havezero exponents. |
| C48 | 585 | n=27 at p=3,q5 givesfloor(4/2)=2 and 9<5 false. |
| C49 | 586 | n=384 has 2-power128<200; n=768 has 256≥200. Odd exponent vector is identical. |
| C50 | 617 | (1+T+T²)(1+T)=1+2T+2T²+T³; sum coefficients6. |
| C51 | 618 | n=1: Ω0,C₀1,C₁0; emptyfactor product 1. |
| C52 | 619 | n=8 divisors1,2,4,8 have ranks 0,1,2,3;C₁1 versuschoose(3,1)=3. |
| C53 | 649 | n=4 bound4n−6=10;n=6 bound18. Reducedm18 dominatesn6 and lies outside[4,10], so the larger endpoint can matter. |
| C54 | 650 | 108(2C)³=864C³;864>162 forC>0. |
| C55 | 651 | Squaring2√(2p)<108M⁴ yields8p<11664M⁸;11664/8=1458;1458·256·4=1492992. |
| C56 | 665 | Set A=1492992,n=A²: A√n=A²=n≤n+2. |
| C57 | 666 | Raising to 16 gives 384¹⁶(p+1)³<p⁸; p+1≤2p reduces it to p⁵>8·384¹⁶. |
| C58 | 667 | Original repeats three hypotheses; replacementp5,d1 hasM2 and 5/48≤1≤48√5. R02. |
| C59 | 696 | H1:one epimor phism,ord c1; reduced ramification degree 0, full marked fibre degree 1. No chosen ramification component exists. |
| C60 | 697 | e10,d1,degree 40:12e120 divides24·40=960; scalar order 2 differs from10. |
| C61 | 698 | SL₂(F₄):center1,nonsplit centralizer5, quotient5/5=1;5∤3. |
| C62 | 722 | AB=[[2,1],[1,1]],trAB3; commutator trace3=4+4+9−12−2. |
| C63 | 723 | Identitypair:2=4+4+4−8−2; common invariant line exists. |
| C64 | 724 | F₇traces6,0,0;commutator trace6²−2=34≡6≠2. Exactly one nonzero coordinate. |
| C65 | 741 | F₅companion trace3 order 10; −Iorder2. |
| C66 | 742 | F₄trace0 companion=[[0,1],[1,0]], squareI, matrix≠I. |
| C67 | 743 | Original repeats API; replacementF₇ roots3,5 bothorder6 androots2,4 bothorder3. R02. |
| C68 | 787 | Even-word orbitof111 at 2 contains 111 and all three leaves, cardinal4. |
| C69 | 788 | At3, equation 1nonzero solution count 0; universal reachability has 0pairs and does not give a nonempty stack. |
| C70 | 789 | At5, swap333=333 and even orbit cardinality 40; proposed20+20 splitting contradicts fixed point. |
| C71 | 820 | n=5 primitive condition excludes only origin;40points. |
| C72 | 821 | c1point555555 mod 65:3·55²≡55³≡40; reductions000 mod 5 and 333 mod 13. |
| C73 | 822 | 333mod 65 reduces333 at both 5 and 13, both nonzero. |
| C74 | 841 | p=5:40/4=10;p=7:28/4=7. |
| C75 | 842 | At5 signblockof333={(3,3,3),(3,2,2),(2,3,2),(2,2,3)};card 4 versusΓorbit40. |
| C76 | 843 | At2,−1=1;four sign expressions give one point. |
| C77 | 863 | 5%4=13%4=1;first branch true. |
| C78 | 864 | At7 trace3 companion order 8;8²=64<1024·8=8192. |
| C79 | 865 | Original repeats inverse-order API; replacementF₁₁roots5,9 haveproduct 1 andorders5,5;25<12288. R02. |
| C80 | 887 | Y5 rotation cycles2,3,5; sixth power kills2,3 and retains 5-cycle;8≤10;10!/2=1814400. |
| C81 | 888 | Y13 cycles2,2,2,3,3,6,7,7,7,13;42nd power kills all but13;16≤52. |
| C82 | 889 | AGL₁(F₅)card 5·4=20<60;5-cyclesexist but5<5+3=8. |
| C83 | 890 | Y11 word cycles3,8,11;88thpower kills8,11. All21 rooted pair-congruences have one class. Swap cycle list: four1s,nine2s gives odd sign. |
| C84 | 891 | lcm(2,3,5)=lcm(3,3,5,5,6)=30;11²−1=120=5(5²−1);22!/2=562000363888803840000. |
| C85 | 909 | AGL₁(F₅) socleC₅:order 5,orbit5,stabilizer1,abelian. |
| C86 | 910 | S₃ socleA₃=C₃:order 3,index2,orbit3;simple factor is abelian. |
| C87 | 911 | Y7 rotation cycles3,4;fourth power fixes4and leaves 3-cycle. Nonidentity AGL₁(F₇)map fixes≤1. A₅has no index2or3subgroup;C₂has one of index2. |

### Ownership, suppliers and pinned meanings

The package owns the new finite-field action adapters, orbit arithmetic, maximal-divisor theory, level-stack specialization and primitive-group structure; the searched siblings do not duplicate these endpoints. In particular, ArithmeticDirichletSeriesPartII's Markoff mention is about integral counting, outside this package's scope. AlgebraicCurves Layer10 owns general function-field Kummer theory; the present §3.0 target is the punctured scheme-cover/character-sum comparison, not another general Kummer-extension library. Module socles found elsewhere are not primitive permutation-group socles.

| Contract checked | Current source location and substantive boundary |
|---|---|
| ClassicalArithmeticCompletion,16 sections | TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:7670,8293,8723,8870,8889,8908,9217,9268,9393,9772,10204,10434,10481,10551,10617,10708. These respectively cover the two surfaces/moves, involutions, permutations, larger sign action, nonzero restriction, point count, positive root generation, coprimality, integral orbits, reduction, twist and positive-prime predicate. The larger Hurwitz group includes sign generators; the package explicitly selects its smaller Vieta/permutation subgroup. |
| InverseGaloisAndArithmeticFundamentalGroups,2 sections | TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:2742 and 5586: exterior epimor phisms are actual surjections modulo inner conjugacy; general-genus connected balanced covers include(g,n)=(1,1), since2g−2+n=1>0. Their vertical center is retained before rigidification. |
| ArithmeticGaloisRepresentations,1 section | TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:2923, §4.4: Dickson classification includes characteristic-two subfield groups. The package, rather than this classification alone, owns the additional normalizer/character-exponent refinement. R01 specifies its omitted hypotheses. |
| SchemeAndStackFoundations,13 sections | TauCetiRoadmap/SchemeAndStackFoundations/README.md:487,529,2745,2817,2951,3021,4647,4671,4713,5725,7129,7175,7273. Relative spectra, stacks, quotients, coarse spaces, stable pointed curves, curve genus/degree and surface Weil bounds are present. The package restricts coarse base change to the cases proved byC24, including regular Noetherian bases. |
| WeilConjectures,3 named subtargets | TauCetiRoadmap/WeilConjectures/README.md:868,1013,1291. The curve comparison, independent surface route and curve/Jacobian comparison provide the stated sharp genus constant and cohomological interpretation. Covers still need their own smoothness, irreducibility, genus and boundary computations here. |
| ErdosProgressionPowers,1 section | TauCetiRoadmap/ErdosProgressionPowers/README.md:744, §0.9: effective τ(n)≤Cεn^(ε/2) gives τ(n)≤n^ε for n≥Cε^(2/ε), including nonsquarefree n. Its numerical-prime-input gap concerns other estimates, not this divisor bound. |
| PolynomialGaloisGroupsPartII,1 section | TauCetiRoadmap/PolynomialGaloisGroupsPartII/README.md:1055 and Suggested.lean:227: babai_distinguishers has primitive, non-two-transitive, n≥5 and distinct-point hypotheses; the package uses those hypotheses to derive a base bound. |
| ArithmeticDynamics scope | TauCetiRoadmap/ArithmeticDynamics/README.md:1951,2328,4108,5858,7265,8464: heights, local dynamics, periodic equations, adelic pairings, preimage Galois actions and families. This package continues into the affine Markoff problem without replanning those layers. |

The audit used Mathlib revision `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti revision `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, exactly as selected by lake-manifest.json. Every library citation was checked against those local files, not a web version.

In particular, Mathlib/Combinatorics/SimpleGraph/Basic.lean:93 defines symmetric **loopless** adjacency; Mathlib/GroupTheory/GroupAction/Defs.lean:49 defines an orbit as the action-map range, without transitivity; Mathlib/GroupTheory/GroupAction/Primitive.lean:91 supplies preprimitivity without a nonempty-carrier guarantee; Mathlib/NumberTheory/Divisors.lean:52 gives the empty divisor finset at 0. The package adds the needed nonzero/nontrivial hypotheses. Function.minimalPeriod is at Mathlib/Dynamics/PeriodicPts/Defs.lean:245; the reflexive-transitive and equivalence closures are at Mathlib/Logic/Relation.lean:387 and 844. Their carriers introduce no arbitrary topology or free mathematical predicate.

The supplied trace formula at TauCeti/LinearAlgebra/Matrix/Trace/FinTwo.lean:127 is over every commutative ring and has the same commutator direction and final−2. The Jordan export at TauCeti/GroupTheory/Perm/Jordan.lean:154 requires a single prime cycle and q+3≤degree, as used here. TauCeti/GroupTheory/SpecificGroups/Affine/Primitive.lean:84 and 89 provide the affine primitive action and order q(q−1), not alternating containment. All cyclotomic norm uses retain the finite Galois/separable/free hypotheses of Mathlib/NumberTheory/NumberField/Norm.lean:76, Mathlib/RingTheory/Norm/Transitivity.lean:261, Mathlib/RingTheory/Norm/Basic.lean:110 and Mathlib/NumberTheory/Cyclotomic/PrimitiveRoots.lean:177.

The requested dependency command completed with exit 0 and exactly:

```text
depcheck: 52 roadmaps, 589 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. R03 concerns internal subsection order, which this roadmap-level check does not diagnose. The declared gap list is empty. Earlier repair reports contain no rejected “not actionable in this package” finding that this report re-raises.

The pull-request diff against origin/main changes eight files, all under packages/ArithmeticDynamicsPartII. This pass changed only its report and scratch notes; no Lean/build command, git-writing command or external post was run.

## Not verifiable

- **M25:** Its text is settled as uncertified. The cited Theorems 1.2–1.4, Conjecture 1.1 and §2 page/equation locators cannot be certified from that text in this pass. The weight/divisibility argument was checked algebraically and the finite examples were recomputed; no fresh request was made.
- **DM96:** The settled locator-only Theorems 1.6A,4.3B,4.7A,5.3A,5.5B were not read from the book. MP18 lines 1345–1375 explicitly state the primitive-group results used here; this supports the mathematical contract but does not certify the book's pagination or complete proofs. No fresh request was made.
- **Fresh Lean elaboration:** None was run, as required. The existing 31-declaration elaborated-signature record was inspected and compared with the unchanged source. Numerical scratch calculations do not certify Lean proof terms.
- **Asymptotic thresholds and proposed heavy constructions:** No numerical global prime threshold is asserted or inferred from the finite tests. The stack, cohomology and primitive-group proof obligations remain roadmap work; their inputs, restrictions and readable source statements were audited.
- **Other open pull requests:** Ownership was checked against the 51 sibling checkouts explicitly supplied and the named supplier heads available through the roadmap service. No claim is made about unprovided/unread open-work files. BGS24 is manifest-only source collation, not a proof citation in this package, and was not used to certify BGS16 locators.

## Source issues

The EFLMT24 statements below were checked against the cached PDF pages 4,9,19,21 as well as the line-numbered OCR; they are not inferred solely from OCR artifacts. No published correction was established in this pass.

- **Error** in BGS16 at equations(8)–(9), printed page 5, BGS16 lines 262–266: the source says the order is (p±1)/j for an arbitrary exponent j; it should be (p±1)/gcd(p±1,j); affects a stated result.
- **Misprint** in BGS16 at equation(9), printed page 5, BGS16 line 265: the source says raising an extension-field generator to p+1 generates the norm-one group; it should be exponent p−1; affects the proof.
- **Error** in BGS16 at Lemmas 4–5, printed pages 5–6, BGS16 lines 267–300: the source says every split or nonsplit trace slice has p−1 or p+1 points; it should be restricted to nonzero nonparabolic traces, with trace zero handled separately; affects a stated result.
- **Misprint** in BGS16 at equations(38),(40), printed page 9, BGS16 lines 418–439: the source says the odd binomial part uses ξ^(n−2i+1), and η^(2i−1) in two variables; it should be ξ^(n−2i−1) and η^(2i+1); affects the proof.
- **Misprint** in BGS16 at Lemma 8 proof's polynomial P, printed page 9, BGS16 line 457: the source says clearing denominators contributes −x^(2d) without a y-factor; it should be −x^(2d)y^e, as later expressions already require; affects the proof.
- **Misprint** in BGS16 at equation(63), printed page 16, BGS16 line 746: the source says the first trace pairs ζ_(l₁) with ζ_(l₂)⁻¹; it should be paired with ζ_(l₁)⁻¹ in both occurrences; affects the proof.
- **Misprint** in BGS16 at the discussion after equation(63), printed page 17, BGS16 lines 749,759: the source says the roots ±i have order 2; it should be order 4, so the exceptional order triple is (4,4,4); affects the proof.
- **Error** in EFLMT24 at Lemma 2.1 proof, printed pages 4–5, EFLMT24 lines 179–187: the source says the cubic has three boundary points and uses the resulting smaller gcd constant; it should be four points, χ=4 and coordinate degrees2, giving the package's conservative bound; affects the proof.
- **Gap** in EFLMT24 at Lemma 3.7 proof, printed page 9, EFLMT24 lines 394–403: the source says the least-prime-factor product formula applies unchanged when a quotient equals 1; it should be split into terminal-quotient cases before applying the minimum formula; affects the proof.
- **Misprint** in EFLMT24 at Theorem 3.21 proof, printed page 19, EFLMT24 lines 882,886: the source says the maximizing rank is floor Ω(n); it should be floor(Ω(n)/2), as in the theorem statement; affects the proof.
- **Misprint** in EFLMT24 at Theorem 4.2 proof, printed page 21, EFLMT24 line 983: the source says M counts the union of maximal-divisor sets; it should be the sum of their cardinalities, retaining common divisors twice; affects the proof.
- **Misprint** in C24 at §4.11, printed page 388, C24 line 3502: the source says the odd-dihedral centralizer quotient has order 2; it should be1 because the commutator generates the rotation subgroup and that subgroup is its centralizer; affects the proof.
- **Error** in C24 at Lemma 5.3.1 parenthesis, printed page 405, C24 lines 4193–4195: the source says nonzero (b-trace,ab-trace) implies non-dihedral type; it should require at least two nonzero entries in the full trace triple; affects nothing.
- **Error** in C24 at Proposition 5.4.2 and its use in Theorems 5.4.3–5.4.4, printed pages 411–413, C24 lines 4462–4467,4521,4553: the source says square-discriminant classification excludes nonsplit semisimple elements in characteristic two; it should use polynomial splitting, allowing order q+1 there; affects a stated result.
- **Misprint** in C24 at Proposition 5.4.2 proof, printed page 411, C24 lines 4477–4481: the source says ACA⁻¹=Cⁿ makes A carry λ-eigenvectors to λⁿ-eigenvectors; it should be A⁻¹ in that eigenvector statement; affects the proof.
- **Error** in C24 at Proposition 5.4.2 proof, printed page 412, C24 lines 4491–4493: the source says Frobenius proportionality forces the eigenvector itself to lie over the base field; it should descend its projective ratio after normalizing a nonzero coordinate; affects the proof.
- **Error** in C24 at Theorem 5.5.7(b), printed page 416, C24 lines 4650–4654: the source says connectedness holds for every prime outside the exceptional action set; it should exclude 2 and 3, where the indicated epimor phism moduli locus is empty; affects a stated result.
- **Error** in C24 at Theorem 5.5.8(b), printed page 417, C24 lines 4688–4693: the source says squarefree primitive transitivity implies full affine integral surjectivity; it should give image origin plus primitive locus, excluding mixed-origin points such as404040 modulo 65; affects a stated result.
- **Error** in C24 at Theorem 5.5.8 proof, printed page 417, C24 line 4693: the source says the coefficient-three surface at 3 has two singleton orbits; it should have the origin singleton and an eight-point nonzero orbit; affects the proof.
- **Error** in MP18 at Corollary5.11 proof, printed page 25, MP18 line 1365: the source says every Markoff block degree is not a prime power; it should isolate p=7, whose degree 7 is handled by the supplied fixed-point argument; affects the proof.
- **Misprint** in MP18 at Lemma 5.5 proof, printed page 22, MP18 lines 1221–1224: the source says the second sign-changing commutator again uses rotation 1; it should use rotation 2 in both positions and a distinct label for the second commutator; affects the proof.
- **Misprint** in MP18 at Lemma 5.13 proof, printed pages 25–26, MP18 lines 1385,1402,1404: the source says the later-factor centralizer, normal-subgroup step and final projection use p-indices; it should use q consistently in those three places; affects the proof.
- **Misprint** in MP18 at Lemma 5.13 proof, printed page 26, MP18 line 1401: the source says both coordinates of the product commutator use h₁; it should use h₁ and h₂ respectively; affects the proof.
- **Misprint** in MP18 at Lemma 4.14 proof, printed page 18, MP18 lines 1048–1050: the source says the constructed subset orbit has length dividing qs; it should be a length divisible by qs; affects the proof.
- **Misprint** in MP18 at Lemma 5.13 footnote 14, printed page 26, MP18 line 1449: the source says the exceptional equal-order case has p=5; it should be (p,q)=(11,5), consistently with the proof's p>q convention; affects nothing.
- **Error** in C24 at Theorem 5.5.3, printed page 415, C24 lines 4624–4626: the source says an orbit exists for every prime before imposing its asymptotic estimate; it should quantify over sufficiently large primes because X*(3) is empty; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "15c525e4c47316f826025b3d46cdce627aaddeed", "job": "RT-ArithmeticDynamicsPartII~1a", "model": "gpt-6-astra", "worker": "chris-6"} -->
