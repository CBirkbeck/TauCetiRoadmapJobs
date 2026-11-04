<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1041#issuecomment-6397755088 -->
Review (codex) of 15c525e

Verdict: accepted

No new findings. All four findings from round 2 are repaired. There are no P1, P2 or P3 package findings and no declared supplier gaps. The settled locator-only sources and inaccessible competing board head are identified below; acceptance does not certify their unread contents.

## Previous findings

Locations in this table refer to `packages/ArithmeticDynamicsPartII/README.md`. Each repair was checked independently, including its changed dependencies and its occurrences elsewhere in the package.

| Previous finding | Repaired passage | Verification and status |
|---|---|---|
| F01, missing alternating containment | §7.4a, line 881: “if Q_q is transitive on Y*(q), then A(Y*(q))≤Q_q”; line 883 adds the separate containment at 11. | **Repaired.** The generic prime-cycle theorem is imported from pinned Tau Ceti. At 5 the rotation has cycles 2,3,5; its sixth power is one 5-cycle, with 5+3≤10. At 13 its 42nd power is one 13-cycle, with 13+3≤52. At 11 the displayed word has cycles 3,8,11 and its 88th power is one 3-cycle; all 231 pair-generated invariant equivalence relations have one class of size 22. The equal-order route at line 923 now consumes these results. |
| F02, positive coefficient-one origin at 3 | §4.3, line 438: “Every positive integral coefficient-one solution reduces to that origin”; Examples, line 473: “Its coefficient-one twist (3,3,3) satisfies 27=27 and reduces to the origin at 3.” | **Repaired.** The divided coefficient-three triple is pairwise coprime. Multiplication by 3 preserves nonzero reduction exactly away from 3. The unchanged squarefree endpoints require prime factors ≥5. Conventions, §§0.4, 4.0–4.4, 7.1, 7.8 and Worked examples contain no remaining contradictory origin exclusion. |
| F03, omitted boundary in the character sum | §3.0, line 291: “containing the entire boundary C̄∖C and every zero and pole of f”; the sum is over U=C̄∖S. | **Repaired.** For C=ℙ¹∖{1}, f=X over 𝔽₅, the sum is −1, s=3 and the bound is √5. The old s=2 bound would be zero. The cover API, even-order zero Check, compact-support dimension and Needs line all use the same U. Uses in §§3.2–3.4, 5.1 and 7.6 retain the full geometric boundary. |
| F04, nonexistent trivial-cover ramification component | §6.0, line 692: “assume ord(c)>1 and choose a nonempty connected component of the reduced ramification divisor”; line 696: “Its reduced ramification divisor is empty, of degree 0”. | **Repaired.** For H=1 the full marked fibre has degree 1 but the reduced ramification divisor has degree 0, so it supplies neither d nor a marked cotangent exponent. Unramified level objects remain included. The separate general valuation congruence still permits r=s=j=0 and has divisor 1. |

The repair report marks each finding applied, not “not actionable in this package”; no settled finding is re-raised. All additions to §7.4a, the revised curve-cover API, the new characteristic-three examples and the ramification hypotheses received a fresh adversarial pass. The same four patterns were searched in the rest of the README and in all 31 Lean signatures.

## Verified sound

### Coverage, principles and shape

Read the complete 984-line README, 248-line Suggested.lean, metadata, nine-entry source manifest, previous review and repair report. The previous review supplies 156 rows containing computed values. Its unchanged rows were inspected and reused only for unchanged assertions; its four failing rows were replaced by the computations above. Fresh computation additionally covers all sampled targets that admit finite examples, every acceptance headline and the changed proof inputs. The table below records the requested sample and headlines rather than duplicating the whole earlier ledger.

There are eight layers, 54 `*Needs:*` lines, 21 API blocks and 27 Checks blocks. Every API block has at least three Checks. Definitions, their positive and negative examples, theorem hypotheses, source locators, layer Examples and Dependencies were read. Shape was compared with `TauCetiRoadmap/DenseGraphLimits/README.md` and `Completed/AlgebraicCodingTheory/README.md` on main. The title, summary, scope, conventions, contracts, build guide, layers, consumers and references follow the required structure.

This extends ArithmeticDynamics beyond its iterated projective-map programme. It imports the existing Markoff surfaces, moves, integral descent and point count; it does not re-plan those objects. The hypotheses at 2 and 3, both coefficient conventions, arbitrary finite fields in the semisimple theorem and the actual primitive squarefree locus are explicit. The all-prime connectivity assertion remains a conjectural proposition. No algorithmic deliverable, copied source passage, sorry'd data, empty condition field, `set_option`, `lemma`, or roadmap import was found. Finite computations in this review test mathematics and are not added as package deliverables.

### Seeded source sample

All nine works already have unique manifest keys. The seven readable works use the legal cached versions identified by the manifest; no source was fetched and no manifest entry was changed. BGS16 uses arXiv v1, MP18 uses v2, C24 the published author copy and EFLMT24 the dated author revision. The corresponding theorem numbering was checked against those versions. BGS24 is collation material, not silently substituted for BGS16. M25 and DM96 remain settled uncertified.

| Sampled target | Locator actually read | Hypotheses and support |
|---|---|---|
| §0.2 Markoff graph | M25 §1, pp. 623–624; §2, p. 625, locator-only | Text unavailable. Direct checks distinguish ordered triples, labelled fixed steps and loopless adjacency. BGS16 §1, pp. 1–2 supplies the move action, not certification of M25's wording. |
| §1.4 Chen divisibility | M25 Theorem 1.4, p. 624, proof §2, pp. 624–625, locator-only | Text unavailable. The stated weight and finite-involution proof was checked directly; p=3 is excluded and p=2 is handled separately. |
| §2.2 Split/nonsplit conics | BGS16 §2, pp. 4–6, BGS16 line 138 and line 267; C24 proof of Proposition 5.3.1, pp. 406–409, C24 line 4331 and line 4391 | Generic formulas require a≠0,±2 and κ≠0. The package separately treats zero trace and repeated roots; it does not copy the sources' unqualified slice count at zero. |
| §2.4 Rotation orbit count | C24 Definition 5.3.4 and Proposition 5.3.5, p. 410, C24 line 4412 and line 4420 | Rational divisor sum and both residue-class correction terms agree. Domain is odd primes and nonzero coefficient-one triples. |
| §3.2 Conic incidence | BGS16 Proposition 6, pp. 6–7, BGS16 line 301 | The sufficiently-large-prime assertion and the quadratic-discriminant count agree after the coefficient change. Origin removal and exceptional sections are not suppressed. |
| §3.6 Giant orbit | BGS16 Theorem 1, p. 2, BGS16 line 44 | One Γ-orbit has complement at most p^ε after a threshold depending on ε. The package does not replace Γ with V before the symmetric-root comparison. |
| §4.0 Affine approximation | C24 Definition 5.5.6, p. 415, C24 line 4642 | Surjectivity is on the full affine integral reduction map. It is distinct from a nonzero or primitive-locus assertion. |
| §4.2 Eventual connectivity | M25 Theorems 1.2–1.4, p. 624, locator-only; independently C24 Theorems 5.5.4–5.5.5, p. 415, C24 line 4631 | M25 unread. C24 supports the consequence; the package's proof combines a V-stable complement of size less than p with p-divisibility, then uses the root bridge. |
| §4.3 Prime strong approximation | C24 Theorem 5.5.7(c), pp. 415–416, C24 line 4645 | Full affine lifting agrees. The package corrects the characteristic-three transport issue explicitly rather than inverting 3 there. |
| §5.5 Reducing functions | EFLMT24 Definition 3.4, Lemmas 3.7–3.8, pp. 8–10, EFLMT24 line 334 and line 387 | Direction, positive rational ratios, powers-of-two condition and coprimality agree. The package supplies the terminal-quotient cases missing from the printed product argument. |
| §6.1 Trace coordinates/actions | C24 Theorem 5.2.10, pp. 398–400, C24 line 3904; Propositions 5.2.16–5.2.20, pp. 401–404, C24 line 4012 and line 4097 | Actual image groups, inner-conjugacy quotient, t≠2, non-dihedral coordinate criterion, right precomposition and the inversion to a left action agree. C24 line 4145 explicitly records the antihomomorphism. |
| §6.4 Valuation congruence | C24 Theorem 5.5.9, p. 417, C24 line 4697 | Odd ℓ, t≠±2, at least two nonzero coordinates, q³−q and max(r−s,0) all agree. |
| §6.6 Oriented transitivity/connectedness | C24 Theorem 5.5.7, pp. 415–416, C24 line 4645; empty small-prime locus at C24 line 4711 | The index-two fixed-point argument supports oriented transitivity. The geometric assertion has p≥5, avoiding empty absolute trace-minus-two moduli at 2 and 3. |
| §7.1 Primitive squarefree locus | MP18 §1, pp. 3–4, MP18 line 118; C24 Theorem 5.5.8(a), pp. 416–417, C24 line 4680 | Nonzero reduction is required at every prime factor. A globally nonzero residue point is insufficient. |
| §7.6 Simultaneous sign lifting | MP18 Lemmas 5.4–5.5 and Proposition 5.6, pp. 21–24, MP18 line 1180, line 1200 and line 1322 | Solvable sign quotient, separate coordinate rotations, the 770 auxiliary action and remaining small elliptic cases are present. The package corrects the second-rotation misprint. |

Thus 12 of the 15 sampled locators were read in legal text. Three name unread M25 passages; §4.2 also has the independent readable C24 support recorded above. All author-designated locator-only material was accounted for, including the DM96 primitive-group inputs restated in MP18 Theorems 5.9–5.12, pp. 24–25, MP18 line 1360 and line 1369.

For the revised §3.0 estimate, the source is used as an input to a local deduction, not claimed to state the punctured Kummer theorem. If r counts odd valuations of f, Riemann–Hurwitz gives 2g′−2=2(2g−2)+r. The projective anti-invariant H¹ dimension is 2g′−2g=2g−2+r. Each of the s−r unramified punctures adds one anti-invariant boundary dimension. Total dimension is therefore 2g−2+s. The projective part has Frobenius absolute value √q and the boundary part absolute value 1; geometric nonsquareness removes the unwanted H⁰/H² terms. The actual smooth-model and curve/Frobenius inputs are resolved below. CZ13 Theorem 2 and Corollary 2, pp. 1929–1930, CZ13 line 123 and line 154, were also read for the separate function-field gcd estimate and its map-degree hypotheses.

### Computed adversarial evidence

“Pass” below means the instance agrees with the statement and its hypotheses. Finite enumeration does not prove a universal or asymptotic theorem. Those claims also received the source and proof-input audit. Rows marked “inherited” retain numerical evidence from the unchanged round-2 ledger; all other finite enumeration rows were rerun, and displayed small arithmetic was recomputed. No package change was made by this review.

| Statement | Instances tried | Computed values on both sides | Result | Change |
|---|---|---|---|---|
| Equation, twist and moves; §§0.1, 4.3 | Integer roots and second move | M: 1+1+1=3; X: 9+9+9=27; 112 and 336 give 6=6 and 54=54; 111 fails X since 3≠1 | Pass; coefficients distinguished | None |
| Polynomial carrier and zero ring | (2,0,0) over ℤ/4; unique zero-ring triple | Nonzero square-zero example satisfies 0=0; zero-ring nonzero locus has size 0 | Polynomial definitions allow nilpotents; field arguments do not | None |
| Fin 3 convention and conjugation | i=2; swap(01), i=0 at M-root | 2+1=0, 2+2=1; R₂²(111)=111; σR₀σ⁻¹(111)=121=R₁(111) | Pass | None |
| §0.2 graph and step definitions | p=2 | 111 has neighbours 011,101,110; R₁(011)=011; labelled self-step true, simple adjacency false; origin adds a second component | Pass; wrong loop/carrier detected | None |
| §§0.3–0.4 reachability and small graphs | p=2,3,5,7,11,13 | M* sizes/root-orbit sizes: 4=4, 8=8, 40=40, 28=28, 88=88, 208=208; length-zero reachability true | Pass | None |
| §§1.1–1.2 weights | ℚ-root; 012 over 𝔽₅; 622 over 𝔽₇ | Root weights 1/3+1/3+1/3=1; singular weights 0,3,3 sum to 1; R₀(012)=112 gives changed weights 0+1=1; fixed 622 has weight 4 and 4+4=1 | Pass; zero denominators avoided by extension | None |
| §1.3 involution sum | Empty, singleton fixed point, two-cycle | 0=0/2; 1/2=1/2; a+(1−a)=1=2/2 | Pass | None |
| §1.4 `stable_card_dvd` | Empty S and prime components | p divides 0; 2 divides 4; 5 divides 40; 7 divides 28; 3 does not divide 8 | Pass; p≠3 essential | None |
| §2.1 rotation and repeated roots | Integer 333; p=5 traces 0,2,−2 | Rotation 333→336, equation 54=54; matrix orders 4,5,10, versus repeated eigenvalue orders 1 and 2 | Pass | None |
| §2.2 generic and exceptional fibres | p=5, traces 1,0,2,−2 | Sizes 6,8,10,10 equal p+1,2(p−1),2p,2p; periods 6,4,5,10 | Pass; generic formula not used at zero | None |
| §2.2 empty/split fibres | p=7 traces 0,±2,1; p=13 trace 0 | Sizes 0,0,0,6; p=13 zero slice size 24, six cycles of length 4 | Pass | None |
| §2.2 split parameter witness | p=11, a=3, λ=9, parameter 1 | λ+λ⁻¹=9+5=3; κ=4; point (3,5,7): 9+25+49=6=3·5·7 modulo 11 | Pass | None |
| `divisorPhi` and §2.4 | n=0,1,2,4,6 | Φ=0,1,3/2,2,5/2; zero case is empty sum and every summed divisor is positive | Pass | None |
| §2.4 `rotation_orbit_count` | p=3,5,7,11,13 | Enumerated/formula counts: 0=0, 8=8, 5=5, 14=14, 26=26 | Pass | None |
| Same, both residue classes | p=17,19,23,29,31,37 | Counts/formula: 37=37, 34=34, 41=41, 86=86, 69=69, 96=96 | Pass | None |
| Repaired §3.0 open curve | C=ℙ¹∖{1}, f=X, p=5 | S={0,1,∞}; sum −1; #U_f=2, #U=3, difference −1; absolute sum 1≤√5; old bound 0 fails | Pass | F03 repaired |
| §3.0 polynomial and even-order-zero controls | f=X; X(X−1); X(X−1)² over 𝔽₅ | S sizes 2,3,3; sums 0,−1,−1; bounds 0,√5,√5; cover-minus-base counts 4−4,2−3,2−3 | Pass | F03 repaired |
| §3.0 geometric nonsquareness | f=X² over 𝔽₅ | Sum 4; using s=2 would give 0; function is geometrically square and excluded | Negative control passes | None |
| §3.0 gcd and low-order bounds | x+y=1; x=y over 𝔽₅, m=n=4 | First has 3 torus points ≤max(3·32^(1/3),192/5)=38.4; diagonal has 4 but x/y=1, excluded; order-sum<2 gives 0≤12 | Pass | None |
| §3.0 exceptional-prime quantifiers | T=z^(δ/(2A)), A,C,δ>0 | CT^A=Cz^(δ/2)≤z^δ for z≥C^(2/δ) | Constants can be absorbed uniformly in coefficients | None |
| §3.2 conic intersection | p=5, (a,b)=(1,1),(1,2),(2,1),(0,0) | Discriminants 3,4,4,0; nonzero-surface counts 0,2,2,0; first three equal 1+χ; last loses the origin | Pass; exceptional pair excluded from generic count | None |
| §3.2 incidence graph | p=5,13,17, nonempty slices | All three incidence-graph diameters are 2 | Consistent with large-prime theorem | None |
| §§3.3–3.4 growth bookkeeping | Split primitive roots at 7; middle exponents | λ=3,5 both have trace 1, so 2 eigenvalues yield 1 trace; normalized errors scale as p^(−ε/3+o(1)) and p^(−1/2+δ+o(1)), decreasing for 0<δ<1/2 | Pass, including factor 1/2 | None |
| §3.5 `no_finite_orbit` | Empty S; singleton 333; real cube point 222 | Empty conclusion true; singleton fails stability since 333→336; 222 gives sum 12, product 8 and (2/3)sum=8, so it fails Markoff equality | Pass; carrier and stability meaningful | None |
| §3.5 `orbit_log_lower_bound` | p=5; trace norm estimate | Orbit size 40≥(log5/log20)^(1/3)≈0.813; trace sum bound 12 plus product bound 8 gives 20; norm degree ≤L³ gives p≤20^(L³) | Consistent; no finite threshold inferred | None |
| §3.6 `giant_orbit` | All primes 5 through 37, ε=1/2 | Enumerated Γ-complements all 0≤√p; at 5 the orbit has 40>40/2 points | Pass on tested primes | None |
| §3.7 `sparse_exceptional_primes` | t=37, ε=1/2 | Disconnected coefficient-three prime count 0≤√37≈6.083 | Pass; characteristic 3 is counted correctly | None |
| §4.0 affine approximation definition | A¹ and x²+1=0, modulus 5 | A¹ has five residues with five chosen integer lifts; second scheme has residues 2,3 but zero integer points | Both surjective and nonsurjective examples | None |
| §4.2 `eventual_connectivity` | Prime complement; all primes through 37 | Among integers 0≤k<5 only k=0 is divisible by 5; root-orbit and M* counts agree at every enumerated prime | Pass; universal threshold uses sources | None |
| §4.2 `eventual_positive_lifting` | Positive root word | 111→211→251→(2,5,29); sums/products 3=3,6=6,30=30,870=870, all coordinates positive | Correct lifting mechanism | None |
| §4.3 `prime_affine_lifting` | c=1 at p=2 and 3 | 633 lifts 011 at 2 and satisfies 54=54; X(𝔽₃)={000}, lifted by both 000 and 333 | Full affine assertion passes | None |
| Repaired §4.3 origin exclusion | M-root and X-root at 3, X-root at 5 | 111 mod3≠000; 333 mod3=000 with 27=27; 333 mod5≠000 | Correct coefficient-dependent statement | F02 repaired |
| §5.1 curve boundary/degree | αx+β/x=y+y⁻¹, αβ≠0,1 | Smooth model genus 1; four geometric boundary points; each coordinate degree 2; χ=4, power degrees 2t,2d | Conservative constants follow from actual normalization | None |
| §5.4 order obstruction | d≤(3/2)M max((32d²)^(1/3),16d²/p) | Cubic branch gives d≤108M³; linear branch gives d≥p/(24M); n/φ(n) at 1,2,12 is 1,2,3≤τ=1,2,6 | Pass; denominators positive | None |
| `maximalDivisors`, §5.2 | n=12; cutoffs 0,1,3,6,12 | Sets ∅,{1},{2,3},{4,6},{12}; at 6 cardinality 2, not 1; at n=0 divisor set empty | Wrong numerical-maximum definition excluded | None |
| §5.5 reducing functions | D(25)→D(9), 5^i↦3^i | Values 1≤1,3≤5,9≤25; quotient ratios 9/25,3/5,1≤3/5,3/5,1; powers-of-two ratio condition forces equal exponents | Pass | None |
| §5.5 terminal/product and wrong direction | D(1); D(3)→D(5); quotient pairs (1,1),(3,5) | Unit ratios 1; wrong map requires 5≤3, false; product λ-ratio 3/5 but separate-minima ratio 1 | Pass; corrected product proof essential | None |
| §5.7 reduced predicate | n=0,1,3,27; n=2^a·3 | False,true,true,false; at 27 requires 9<5; a=7 gives 128<200, a=8 gives 256<200 false | Strict inequalities and unit case correct | None |
| §5.8 `reduced_domination` | n=2,5,27,40; inherited exhaustive n=2…40 | Witness m=2,6,30,45 in intervals [2,2],[5,14],[27,102],[40,154]; previous 39 witnesses have zero divisor-cutoff failures | One m works for all real cutoffs | None |
| §5.9 `divisorRank` | n=12,1,8 | Rank rows (1,2,2,1),(1),(1,1,1,1); τ(12)=6; rank 4 of 8 is 0; squarefree 6 has row (1,2,1) | Multiplicities/out-of-range indices correct | None |
| §5.10 `central_rank_bound` | All n=1…128, every divisor-transition cutoff | 128 normalized central comparisons and all cutoff comparisons: 0 failures; n=12,x=6 gives 2≤2 and 2·8=16≤6·3=18 | Pass, including unit and negative cutoffs | None |
| §§5.13–5.14 uniform bounds | Symbolic rank constants and threshold | 108·2³=864;1458·2⁸=373248;4·373248=1492992; at n=1492992², 1492992√n=n≤n+2 | Inherited unchanged inequalities remain consistent | None |
| §6.0 level carrier | H=1; trivial representation to C₂; (g,n)=(1,1) | One exterior epimorphism to 1; image order 1<2 excludes trivial map to C₂; stability 2g−2+n=1>0 | Actual epimorphisms and stable supplier range | None |
| Repaired §6.0 ramification congruence | H=1; SL₂(𝔽₅), noncentral trace −2 | Trivial reduced degree 0 versus marked degree 1, no component; ramified e=10,d=1,degree=40,m divides24 gives 120 dividing 960 | Pass | F04 repaired |
| §6.0 general degree congruence | H=1; SL₂(𝔽₅), ℓ=5,j=0 | Trivial r=s=0 gives divisor1; order120, inertia10 give r=1,s=0, exponent1 and 5 divides40 | General unramified theorem retained | None |
| §6.1 trace convention | Upper/lower unipotents; identity pair | Traces 2,2,3: 4+4+9−12−2=3=commutator trace; identity pair gives 12−8−2=2 | Matches pinned ABA⁻¹B⁻¹ identity | None |
| §6.1 non-dihedral criterion | Over 𝔽₇, diag(2,4) and [[0,6],[1,0]] | Trace triple (6,0,0); commutator trace 36−2=6≠2; only one nonzero coordinate | Irreducible alone would be insufficient | None |
| §6.2 `traceOrder` and characteristic two | 𝔽₄, a²+a+1=0, t=a | Polynomial values at 0,1,a,a+1 are 1,a,1,a; no root, matrix order5 divides q+1=5; discriminant a² is square | Nonsplit even-characteristic case preserved | None |
| §6.3 `semisimple_orbit_congruence` | All eligible traces over q=4,5,7,8,9 | 27 non-dihedral oriented orbits, 0 modulus failures; q4 moduli/sizes 3/18,5/10,5/10; q7,t3 modulus2 divides64; q9,t5 modulus5 divides40 and60 | Fresh extension-field test; no transitivity assumed | None |
| §6.4 `valuation_orbit_congruence` | Same batch, ℓ=3,5,7,11 | 0 failures; q5,n6,ℓ3: v₃(120)=1,r1,s0,3 divides36; q9,n10,ℓ5: v₅(720)=1,r1,s0,5 divides40,60 | Correct q³−q and nonnegative valuation difference | None |
| §6.4 total natural subtraction | r=0,s=1 | r−s=0 and ℓ⁰=1, so resulting modulus is 1 | Correct weak case, not division by zero | None |
| §6.5 `oriented_card_dvd` | p=2,3,5,7,11,13 | Oriented orbit sizes [4],[],[40],[28],[88],[208]; each existing size divisible by p | Fresh enumeration; no point at 3 | None |
| §6.6 `oriented_transitivity` | Same six primes | One orbit whenever X* nonempty; p3 has no point; at p2 swap fixes111 and a second reversing move reaches011 | Finite all-prime statement handles empty carrier correctly | None |
| §6.6 geometric endpoint | Absolute trace-minus-two locus, p=2,3,5 | Locus empty at 2,3; at5 one orbit of size40 gives one component | p≥5 geometric hypothesis essential | None |
| §7.1 `primitivePoint` | n=5,65,1,0 | Primitive sizes40 and40·208=8320; at1 prime-factor quantifier empty; at0 origin fails reduction at2 | Endpoint n>1 excludes junk modulus | None |
| §7.1 mixed-zero negative control | X triple (55,55,55) mod65 | Equation residual0; zero mod5, (3,3,3) mod13; globally nonzero but not primitive | Correct local condition | None |
| §7.2 sign blocks | p=5,7,2 | 40/4=10 and28/4=7 blocks; root sign block at5 is {333,322,232,223}; at2 all signs coincide | Odd-characteristic freeness required | None |
| §7.3 `mpCondition` | p=5,13,7,11 | First branch true at5,13; at7 order²≤64<8192; at11 inverse roots5,9 each have order5, and25<12288 | No use of MP(11) in exceptional containment | None |
| Repaired §7.4a parabolic containment | q=5,13 | Rotation cycle lengths (2,3,5) and (2,2,2,3,3,6,7,7,7,13); powers6,42 give single prime cycles; 8≤10 and16≤52 | All Jordan hypotheses supplied | F01 repaired |
| Repaired §7.4a exceptional containment | q=11, all 22 sign blocks | All 231 unordered-pair equivalence closures have one 22-point class; word cycles3,8,11; power88 has support3; 3+3≤22 | Primitive action plus pinned Jordan gives A₂₂ | F01 repaired |
| §7.4a alternating versus symmetric | q=5,11 | q5 rotation sign (−1)^(1+2+4)=−1; q11 swap has nine 2-cycles, sign−1; orders A₁₀=1814400, A₂₂=562000363888803840000 | Q₅=S₁₀ and Q₁₁=S₂₂; distinct simple factors | F01 repaired |
| §7.5a primitive-group models | Natural S₃; AGL₁(𝔽₅); regular S₃ | Socle C₃ of order3 transitive; affine socle C₅ order5 regular, group order20; regular S₃ centralizer order6 and left/right intersection1 | Nonabelian group does not force nonabelian socle | None |
| §7.5a exceptional affine exclusion | q=7 block rotation | Cycles3,4; fourth power fixes4 and moves3; a nonidentity affine permutation of prime degree fixes at most1 | Prime-power-degree exception handled | None |
| §7.5 equal rotation orders | Prime q<203897, q≡1 mod4 | Exact integer test of p²=q(q²−1)+1 yields only (p,q)=(11,5); 121−1=5·24=120; rotation orders both30 | Finite coincidence assertion independently reproduced | None |
| §7.5 large-q order comparison | Real substitution q=203897 | With k=q(q+3)/4 and N=p(p−3)/4, lower log-factorial bound 229330274020.129 exceeds 4√N(logN)²=229321639835.326 | Threshold witness only; universal comparison remains a target | None |
| §7.6 solvable sign quotient | Four-point factor versus A₅ | #S₄=24=2³·3, composition primes2,3; #A₅=60 includes5 and is simple nonabelian | Cannot kill the required simple factor | None |
| §7.6 auxiliary diagonal action | Modulus770, coefficient-one root333 | V-orbit has394240 distinct primitive points =4·40·28·88 | Full finite transitivity independently reproduced | None |
| §7.6 two elliptic coordinates | All twelve primes 11<p≤121, p≡3 mod4 | Witnesses and both equation values are listed immediately below; every pair of orders is divisible by4 | Finite source existence assertion independently reproduced | None |
| §7.7 `squarefree_transitivity` | n=65=5·13 | Root V-orbit8320 equals primitive count40·208=8320 | Actual diagonal word action, not merely CRT cardinality | None |
| §7.7 `squarefree_positive_lifting` | n65; roots and second moves, c=1,3 | 111,112,333,336 satisfy3=3,6=6,27=27,54=54 with positive coordinates and primitive reductions | Both coefficients and word lifting agree | None |
| §7.8 `squarefree_integral_image`, both directions | n65; mixed M triple404040 and X triple555555 | Mixed residuals0, zero mod5 and nonzero mod13; coprimality forbids integral lifts. Primitive word image8320 plus origin gives8321=1+8320 | Necessary and sufficient inclusions distinguished | None |
| §7.8 full-affine negative control | n65 | Full surface41·209=8569; actual image8321; omitted mixed patterns248=40+208 | Full-affine overclaim excluded | None |

For §7.6 the independently found triples, the two coordinate orders, and the common values of x²+y²+z² and xyz modulo p are:

| p | Triple | First two orders | Both sides modulo p |
|---|---|---|---|
| 19 | (6,6,8) | 20,20 | 3 |
| 23 | (3,3,3) | 24,24 | 4 |
| 31 | (4,4,7) | 32,32 | 19 |
| 43 | (3,3,3) | 44,44 | 27 |
| 47 | (3,3,3) | 16,16 | 27 |
| 59 | (6,6,14) | 20,20 | 32 |
| 67 | (3,3,3) | 68,68 | 27 |
| 71 | (5,11,21) | 72,72 | 19 |
| 79 | (4,4,44) | 80,80 | 72 |
| 83 | (3,3,3) | 84,84 | 27 |
| 103 | (3,3,3) | 104,104 | 27 |
| 107 | (3,3,3) | 36,36 | 27 |

Each first-coordinate and second-coordinate discriminant was tested to be nonsquare. None of these witnesses is the origin. The large-prime lower bound is positive exactly when p>121: for p=127, (127−11√127)/4≈0.759>0, whereas its value at121 is0.

### Pinned declarations and duplication by object

The local content snapshot is `2916f4d2e03ea18d2501288fb1a055372684d120`. Its manifest and library checkout commits agree: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following bodies or signatures were opened at those pins. Paths in this table are relative to the named library repository.

| Declaration/object opened | File and line at pin | Actual contract checked |
|---|---|---|
| `Equiv.Perm`; `Subgroup.closure`; `MulAction.orbit` | `Mathlib/Logic/Equiv/Defs.lean:94`; `Mathlib/Algebra/Group/Subgroup/Lattice.lean:329`; `Mathlib/GroupTheory/GroupAction/Defs.lean:49` | Self-equivalences, subgroup intersection and orbit-map range; no extra finiteness or transitivity. |
| `SimpleGraph`; `Reachable`; `ConnectedComponent` | `Mathlib/Combinatorics/SimpleGraph/Basic.lean:93`; `Mathlib/Combinatorics/SimpleGraph/Connectivity/Connected.lean:51`, 389 | Symmetric loopless adjacency; nonempty walk type allows zero-length walk; quotient by reachability. |
| `Relation.ReflTransGen`; `Relation.EqvGen.setoid` | `Mathlib/Logic/Relation.lean:387`, 844 | Native generated relations; preservation of the Markoff surface is a separate polynomial fact. |
| `ZMod`; `castHom`; `natCast_eq_zero_iff`; `chineseRemainder` | `Mathlib/Data/ZMod/Defs.lean:138`; `Mathlib/Data/ZMod/Basic.lean:331`, 519, 889 | Modulus0 is ℤ; divisibility for reduction, prime modulus for field, coprimality for CRT. |
| `orderOf`; `Function.minimalPeriod` | `Mathlib/GroupTheory/OrderOfElement.lean:181`; `Mathlib/Dynamics/PeriodicPts/Defs.lean:245` | Zero denotes no positive period; finite-field companion determinant1 ensures a positive finite order. |
| `Nat.divisors`; `Nat.factorization`; `Nat.totient`; `totient_eq_prod_factorization` | `Mathlib/NumberTheory/Divisors.lean:52`; `Mathlib/Data/Nat/Factorization/Defs.lean:50`; `Mathlib/Data/Nat/Totient.lean:37`, 286 | Empty divisors at0, multiplicities and nonzero hypotheses of product formulas. |
| `Nat.minFac`; `Nat.card_divisors`; `ArithmeticFunction.cardFactors`; `cardFactors_eq_sum_factorization` | `Mathlib/Data/Nat/Prime/Defs.lean:218`, 226; `Mathlib/NumberTheory/ArithmeticFunction/Misc.lean:222`, 258, 318 | minFac(1)=1; native Ω counts multiplicity, with Ω(0)=Ω(1)=0; divisor formula requires n≠0. |
| `MulAction.IsBlock`; `IsPreprimitive`; `isQuasiPreprimitive` | `Mathlib/GroupTheory/GroupAction/Blocks.lean:171`; `Mathlib/GroupTheory/GroupAction/Primitive.lean:91`, 287 | Preprimitivity includes pretransitivity, not nonemptiness. Faithfulness/nontriviality is retained when applying normal-subgroup transitivity. |
| `Fintype.sum_equiv` | `Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean:741` | Additive transport generated by the attribute block at739; does not supply complementarity or the half-cardinality sum. |
| `RingOfIntegers.dvd_norm` | `Mathlib/NumberTheory/NumberField/Norm.lean:76` | Finite Galois number-field setting. |
| `Algebra.norm_eq_prod_embeddings`; `norm_ne_zero_iff` | `Mathlib/RingTheory/Norm/Transitivity.lean:261`; `Mathlib/RingTheory/Norm/Basic.lean:110` | Finite separable extension/algebraically closed target for product; domains and finite free extension for nonvanishing. |
| `IsCyclotomicExtension.finrank` | `Mathlib/NumberTheory/Cyclotomic/PrimitiveRoots.lean:177` | Irreducible cyclotomic polynomial hypothesis, satisfied in the stated rational cyclotomic application. |
| `quadraticChar` | `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean:119` | Integer-valued finite-field character, zero at0; no curve estimate built into the definition. |
| `Matrix.SpecialLinearGroup.trace_commutatorElement_fin_two` | `TauCeti/LinearAlgebra/Matrix/Trace/FinTwo.lean:127` | Every commutative ring; commutator ABA⁻¹B⁻¹ and final −2. |
| `MulAction.IsBlock.of_le`; `IsPreprimitive.of_le`; `TauCeti.MulAction.fixedPoints_stabilizer_eq_singleton` | `TauCeti/GroupTheory/GroupAction/Primitive.lean:54`, 59, 71 | Inclusion transport; fixed-point result needs faithful preprimitive nontrivial action and nontrivial point stabilizer. |
| `TauCeti.AffineGroup.isPreprimitive`; `natCard_range_toPermHom` | `TauCeti/GroupTheory/SpecificGroups/Affine/Primitive.lean:84`, 89 | Affine primitive action and finite image order q(q−1). |
| `TauCeti.alternatingGroup_le_of_isPreprimitive_of_isCycle_mem` | `TauCeti/GroupTheory/Perm/Jordan.lean:154` | Finite permutation subgroup, preprimitive action, a single prime-length cycle in it and support size+3≤degree. The new §7.4a supplies every premise. |

Searches used objects and hypotheses: Markoff equations and moves, trace actions, involution sums, quadratic-character covers, maximal divisor antichains, multiplicity counts, primitive socles, regular centralizers, alternating sections and Jordan cycles. No pinned declaration duplicates a kept headline. The module socle in Tau Ceti concerns modules, not the missing finite primitive-group socle theory. Existing trace, action, divisor and Jordan infrastructure is imported, not rebuilt.

The prescribed `roadmaps grep`, `roadmaps show` and `roadmaps resolve` tools were used against main and indexed open heads, supplemented by board-package and pinned-library searches. The broad initial search was refined to avoid relying on truncated results. Searching the full `TauCetiRoadmap.ArithmeticDynamicsPartII` namespace among open/main Lean files returned no match. No existing fully qualified declaration name is reused. `roadmaps resolve` reported no unresolved roadmap citation or backticked declaration; its unavailable server-side library scan was replaced by the local audit above.

### Resolved suppliers and direction of supply

The service index is dated 2026-10-25T11:51:01Z and includes 362 open roadmap pull requests; its main snapshot was reported as `86e155c`. Existing-roadmap contracts were checked on the supplied local main snapshot, not their proposed revisions. New-roadmap contracts were read at the indexed heads. The twenty-entry board-package index was read before ownership conclusions. The following references were resolved anew; line numbers omit the display header prepended by `roadmaps show`.

| Supplier and version | Resolved README locations | What is consumed |
|---|---|---|
| ClassicalArithmeticCompletion, main | `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:7670`, 8293, 8723, 8870, 8889, 8908, 9217, 9268, 9393 | §§4.3,4.23,4.38,4.42–4.44,4.57–4.58,4.62: surfaces, polynomial moves, permutation conjugation, larger sign action, nonzero restriction. Γ selects its smaller generator set. |
| Same | `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:9772`, 10204, 10434, 10481, 10551, 10617, 10708; equivalence at10718 | §§4.76,4.92,4.101,4.103,4.106,4.108,4.111: point count, integer roots, coprimality, two integral orbits, reduction, twist, positive approximation equivalence. |
| SchemeAndStackFoundations, main | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:487`, 529, 2745, 2817, 2951, 3021 | §§0.1–0.2,1.18–1.19,1.21,1.23: relative spectra, stack and quotient carriers, coarse spaces with stated base-change restrictions. |
| Same | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4647`, 4671, 4713, 5725, 7129, 7175, 7273 | §§3.1–3.3,4.15,5.9–5.11: genus, tame Riemann–Hurwitz, degrees, stable marked curves, intersections, smooth projective curve bounds. |
| InverseGaloisAndArithmeticFundamentalGroups, indexed new-roadmap head | `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:2641`, 2742, 5586, 5588, 5655 | §IG.3.2 exterior epimorphisms and precomposition; §IG.5.4 general-genus Hurwitz comparison and connected balanced admissible covers, including (1,1) and unramified markings. |
| ArithmeticGaloisRepresentations, indexed new-roadmap head | `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:2923` | §4.4 Dickson classification, exceptional groups, field embeddings and characteristic-two subfield case. Local center and normalizer refinements remain explicit targets. |
| WeilConjectures, indexed new-roadmap head | `TauCetiRoadmap/WeilConjectures/README.md:868`, 1013, 1291 | WC.5 curve comparison and independent surface route; WC.7 curves/Jacobians: every extension degree r, sharp bound2gq^(r/2), dimension2g and Frobenius interpretation. |
| ErdosProgressionPowers, indexed new-roadmap head | `TauCetiRoadmap/ErdosProgressionPowers/README.md:724`, divisor estimate at744 | §0.9 effective eventual divisor-subpower bound; absorb the fixed constant using ε/2. No unrelated numerical prime-estimate gap is consumed. |
| PolynomialGaloisGroupsPartII, indexed new-roadmap head | `TauCetiRoadmap/PolynomialGaloisGroupsPartII/README.md:1055`, statement at1057 | §4.4 `babai_distinguishers`: primitive degree≥5, not two-transitive, at least √n/2 distinguishers. The local small-base deduction is different work. |
| ArithmeticDynamics, indexed new-roadmap head | `TauCetiRoadmap/ArithmeticDynamics/README.md`, Scope and Layers1–6 | Iterated projective maps, heights, measures and preimages; does not already plan the finite-field Markoff orbit extension. |

ArithmeticDirichletSeriesPartII's integer Markoff–Hurwitz counting direction is distinct. The local `packages/NonabelianLevelStructures/design/README.md:21` and line23 still describe overlapping elliptic and trace foundations. That roadmap lies later in the order, at278 versus this package at276. Ownership of the necessary specialization, degree and trace foundations moves down to §§6.0–6.1 here; the later roadmap must import them. This records the ownership move rather than treating the later design as an upward supplier. The present README names it only as a consumer. Generic stack and admissible-cover constructions remain with the earlier suppliers.

Every Needs line and supplier citation was read. Supplier positions are SchemeAndStackFoundations2, ArithmeticGaloisRepresentations51, InverseGaloisAndArithmeticFundamentalGroups53, ClassicalArithmeticCompletion109, WeilConjectures145, ErdosProgressionPowers262 and PolynomialGaloisGroupsPartII269. ArithmeticDynamics is267 and this package276. The local §4.0 forward comparison with §4.3 creates no cycle: the definition is independent, and §4.3 uses §4.1. Section7.5a is placed before its consumer7.5. There are no declared gaps in the README or `packages/ArithmeticDynamicsPartII/design/plan.json`.

The required dependency command, using `--depcheck packages/ArithmeticDynamicsPartII/README.md --name ArithmeticDynamicsPartII --order merge-order/ORDER.txt --movable` with the supplied configuration, exited0 and printed:

    depcheck: 51 roadmaps, 587 edges, 0 problem(s)

No UPWARD, CYCLE or moved line appeared.

### Headline completeness, elaboration and padding

All 18 statable headlines are present, each with `sorry`:

| README target | Acceptance declaration |
|---|---|
| §1.4 stable-set divisibility | `stable_card_dvd` |
| §2.4 exact rotation count | `rotation_orbit_count` |
| §3.5 absence of finite characteristic-zero orbits | `no_finite_orbit` |
| §3.5 uniform logarithmic orbit lower bound | `orbit_log_lower_bound` |
| §3.6 giant orbit | `giant_orbit` |
| §3.7 sparse exceptional primes | `sparse_exceptional_primes` |
| §4.2 eventual connectivity | `eventual_connectivity` |
| §4.2 eventual positive lifting | `eventual_positive_lifting` |
| §4.3 conditional full prime affine lifting | `prime_affine_lifting` |
| §5.8 reduced-integer domination | `reduced_domination` |
| §5.10 central-rank antichain bounds | `central_rank_bound` |
| §6.3 all-finite-field semisimple congruence | `semisimple_orbit_congruence` |
| §6.4 valuation congruence | `valuation_orbit_congruence` |
| §6.5 oriented prime divisibility | `oriented_card_dvd` |
| §6.6 full-to-oriented transitivity | `oriented_transitivity` |
| §7.7 squarefree transitivity | `squarefree_transitivity` |
| §7.7 positive squarefree lifting | `squarefree_positive_lifting` |
| §7.8 exact squarefree integral image | `squarefree_integral_image` |

The module docstring explicitly names the two geometric endpoints not statable at the pins: connectedness of the absolute trace-minus-two level stack and the general coarse-degree congruence. It identifies their missing elliptic level-stack, rigidified compactification and coarse-degree carriers. There is no substitute on arbitrary data. Primitive-group structure and quantitative bounds are supporting targets, not padded acceptance declarations; all-prime connectivity remains conjectural.

The prescribed `lake env lean` elaboration of `packages/ArithmeticDynamicsPartII/Suggested.lean`, run from the content checkout with its absolute tool argument, exited0. Its only warnings were the 18 expected declarations using `sorry`. No Tau Ceti object build was necessary because the file imports only `Mathlib`.

A separate scratch copy appended `#check @name` for every one of the 31 declarations and was elaborated once. All 13 definition signatures and 18 theorem signatures were compared with the README and the worker's signature extract. No section binder was lost and no statement changed. In particular, finite-field typeclasses, q≥3, t≠±2, the two-nonzero-coordinate witness, prime ℓ≠2, prime p≠3, squarefreeness, local transitivity and MP hypotheses all survive. The asymptotic thresholds follow ε, while the reduced integer m precedes every real cutoff. The primitive composite condition quantifies over every prime divisor and uses the actual divisibility reduction map.

For the padding probe, each theorem was independently offered `rfl`, `infer_instance` and `simp`, with failed alternatives rolled back, in a scratch copy. Elaboration exited0 and still reported all 18 `sorry` warnings: none closed. The object audit found no exact single-library-lemma proof for any headline. No theorem merely computes a small value, restates a definition, mirrors a Check or isolates a boundary case. The 13 real-body definitions are the simple native-carrier notation needed to state these headlines. No acceptance declaration should be deleted as padding.

## Not verifiable

- **M25:** settled uncertified. Its exact prose and locators in Layers0–1 and4 could not be read. The finite graph, extended weights, involution argument and connectivity deduction were checked directly; the eventual consequence also has the readable C24 support above. This settled reference was not requested again.
- **DM96:** settled uncertified. The book's Theorems1.6A,4.3B,4.7A,5.3A and5.5B were not read. MP18's explicit restatements of the primitive-group alternatives and quantitative bounds were read. This does not certify the book's proof text, and no new request was made.
- **EFLMT24 extraction:** the OCR has degraded fractions and interval notation in parts of Theorem3.2 and the explicit-bound discussion. The usable constants were checked from the readable proof, algebra and corrected normalization; individual unreadable glyphs are not certified.
- **Other board branch:** the indexed `packages/SchemeAndStackFoundationsPartII/README.md` at head `accb0a0` returned HTTP404. Its possible competing ownership could not be inspected. The supplied index was read, all actual suppliers resolved, and available main/open/board files were searched. No assertion of absence is made for unread files on other board branches.

Unlike the previous review, this round independently reproduced the product770 orbit, the equal-order coincidence exclusion below203897 and all remaining small two-elliptic-coordinate witnesses. They are no longer source-only finite checks.

## Source issues

These are source defects encountered or rechecked during this pass, not new package findings. The package avoids the affected statements or supplies the indicated corrected argument. Source wording below is paraphrased.

- **Error** in EFLMT24 at Lemma2.1 proof, pp.4–5: the source says the cubic boundary has three points and uses map degrees t,d; it should be four geometric boundary points and degrees2t,2d, giving χ=4; affects a stated result.
- **Gap** in EFLMT24 at Lemma3.7 proof, p.9: the source says the least-prime-factor minimum identity applies to every quotient pair; it should separate quotient1, since λ(1)=1 invalidates that identity; affects the proof.
- **Error** in C24 at Remark2.2.4, p.324: the source says the reduced ramification divisor is reduced exactly when the base is reduced; it should require surjectivity for the converse, since the empty divisor is reduced over a nonreduced base; affects a stated result.
- **Error** in C24 at Proposition3.2.2(a), p.352: the source says reduced ramification has degree #G/e without excluding e=1; it should require e≥2 for that degree formula, since e=1 gives the empty reduced ramification divisor; affects a stated result.
- **Error** in C24 at Proposition3.2.2 proof, p.353: the source says forgetting distinct smooth marked points gives proper morphisms of smooth-curve moduli; it should use smooth surjective morphisms with connected fibres, since later forgetful fibres omit earlier marked points; affects the proof.
- **Misprint** in C24 at Proposition5.2.16 proof, p.402: the source says absolute irreducibility is equivalent to commutator trace2; it should say commutator trace different from2; affects nothing.
- **Error** in C24 at Theorems5.4.3–5.4.4, pp.412–413: the source says even characteristic allows the split q−1 case solely because the discriminant is square; it should use polynomial splitting and retain the nonsplit q+1 case, witnessed by order5 over 𝔽₄; affects a stated result.
- **Error** in C24 at Theorem5.5.7 precise prime range, p.416: the source says geometric connectedness holds at every prime outside the exceptional set; it should restrict that geometric assertion to p≥5 because the stated epimorphism locus is empty at2 and3; affects a stated result.
- **Error** in C24 at Theorem5.5.8(b), p.417: the source says full affine strong approximation holds at the specified squarefree moduli; it should identify the image as origin plus primitive locus, excluding mixed-zero points such as404040 modulo65; affects a stated result.
- **Error** in C24 at Theorem5.5.8 proof, p.417: the source says the coefficient-three surface modulo3 has two singleton orbits; it should have the origin and an eight-point nonzero orbit; affects the proof.
- **Misprint** in MP18 at Lemma5.5 proof, p.22: the source says the second sign-changing commutator uses the first coordinate rotation and repeats its first label; it should use the second coordinate rotation in both positions and a separate second label; affects the proof.
- **Error** in MP18 at Corollary5.11 proof, p.25: the source says the Markoff block degree cannot be a prime power; it should separate p=7, whose degree7 requires the rotation fixed-point argument; affects the proof.
- **Misprint** in MP18 at Lemma5.13 proof, p.26: the source says both components of the commutator use h₁; it should use h₂ in the second component; affects nothing.
- **Misprint** in MP18 at Lemma5.13 proof, p.26: the source says the relevant normal subgroups belong to Q_p; it should say Q_q; affects nothing.
- **Misprint** in MP18 at Lemma5.13 proof, p.26: the source says the final socle inclusion uses π_p; it should use π_q; affects nothing.
- **Error** in BGS16 at Lemmas4–5, pp.5–6: the source says every split or nonsplit trace has respectively p−1 or p+1 nonzero slice points; it should exclude trace0, whose counts are2(p−1) or0; affects a stated result.
- **Misprint** in BGS16 at equation(9), p.5: the source says a quadratic-field generator raised to p+1 generates the norm-one torus; it should use exponent p−1, giving order p+1 rather than p−1; affects the proof.
- **Misprint** in BGS16 at §1, p.1: the source says R₂ and R₃ remain after defining R₃; it should say R₁ and R₂; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "15c525e4c47316f826025b3d46cdce627aaddeed", "job": "REV-PKG-ArithmeticDynamicsPartII~3", "model": "gpt-6-astra", "worker": "chris-10"} -->
