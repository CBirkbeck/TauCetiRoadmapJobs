# ArithmeticDynamicsPartII repair report

## F01 (P2) — applied

Numerical connectivity endpoint → the conditional uniform-threshold theorem of §5.14, with explicit universal rank, second-interval and cage hypotheses. Deleted `effective_connectivity`; retained `eventual_connectivity`. Removed every use of the stronger (6,4) constants. EFLMT24 line 974 supplies the interval argument; EFLMT24 line 1027 does not establish the endpoint with this package’s conservative constants.

## F02 (P2) — applied

Enumeration, truncated multiplication, refinement/termination and the large certificate → mathematical rank inequalities in §5.13. Deleted §§5.11–5.12 and their references, and the candidate integer and coefficient from §5.14 and Examples. Sections 7.5–7.6 now identify the finite coincidence and product-770 transitivity facts, citing MP18 line 1435 and MP18 line 1240, rather than planning their computation.

## F03 (P2) — applied

Construction of Adm(H) → specialization of InverseGaloisAndArithmeticFundamentalGroups §IG.5.4 at (1,1). Updated Scope, both supplier contracts, §6.0 and Layer 6 Dependencies. Kept rigidified Level(H), its compactification and degree/congruence targets. The supplier explicitly covers connected balanced admissible covers because 2·1−2+1=1>0, and excludes this rigidified specialization.

## F04 (P2) — applied

Unowned order-bound input → PolynomialGaloisGroupsPartII §4.4 `babai_distinguishers`, in Scope, Exact supplier contracts, §7.5a Needs and Layer 7 Dependencies. Added the distinguisher-to-base-to-order route, retaining its n≥5 domain and separate smaller degrees. The two-transitive section bound remains the independent local target of MP18 line 1369; its stated route does not consume Bochert’s support estimate.

## F05 (P2) — applied

Compound explicit-divisor gap → no gap: the numerical endpoint was deleted under F01. Only the top-level `gaps` value changed in `design/plan.json`. Section 5.4 now proves n/φ(n)≤τ(n) by prime-power factors, with three Checks and native `Nat.totient_eq_prod_factorization` and `Nat.card_divisors` inputs. The effective eventual bound already supplied by ErdosProgressionPowers §0.9 suffices for §5.14.

## F06 (P3) — applied

CA.4, MD.0, MD.6 and FF.2 labels → actual sections or deletion. Corrected every occurrence in §§0.1–0.2, 2.3–2.4, 4.1–4.2, 7.1 and 7.4–7.8. Deleted the imprecise cusp API bullet. Every §3.0 dependency now specifies quadratic characters, function-field gcd, arithmetic low-order estimates, or all three in Layer 3’s summary.

## F07 (P3) — applied differently

Corrected all cited pages, theorem kinds and pinned lines, including extraction locators in §6.0 and the C24 manifest entry. ErdosProgressionPowers §0.9’s supplied heading is “Prime estimates in the progression factorial argument”, not the review’s proposed “Explicit prime arithmetic”; all citations use the actual heading. Evidence: C24 line 1364, line 3340, line 3599 and line 4391.

## F08 (P3) — applied

Parabolic inclusion attributed to the BGS cage definition → explicit citation to EFLMT24 p. 4, EFLMT24 line 141. BGS16 line 510 through line 527 defines the maximal-point cage and its containing orbit. The package’s enlarged predicate retains its parabolic clause with the correct separate attribution; §3.3 still proves the required adapters.

## F09 (P3) — applied

`bigOmega` → pinned `ArithmeticFunction.cardFactors`, throughout the central-rank statement and rank definition. `rotation` → `markoffRotation`; `IsReduced` → `IsMaxDivReduced`, with all README and internal consumers updated. The Mathlib contract records the definition and factorization formula. The old factorization sum agrees exactly by `ArithmeticFunction.cardFactors_eq_sum_factorization`.

## F10 (P3) — applied

Generic permutation-group bounds in the acceptance file → supporting README targets only. Deleted `primitive_order_bound` and `primitive_section_bound`, their backticked README names, and the module-docstring claim that they are acceptance statements. Their exact statements and source locators remain in §7.5a; squarefree headline statements remain unchanged.

## F11 (P3) — applied

Finite oriented transitivity at p≥5 → all primes, in both `oriented_transitivity` and §6.6. Kept p≥5 for geometric connectedness. Added three README Checks, including the four-point p=2 orbit and empty p=3 locus. C24 line 4654 supports the general finite-action implication; the fixed-point argument works at p=2 because (3,3,3)=111.

## F12 (P3) — applied

Re-proved positive reduction/orbit equivalence → direct use of ClassicalArithmeticCompletion §4.111 `markoffStrongApproximation_iff_orbit`, also named in its supplier contract. Deleted the redundant integer-generation route sentence in §4.1. This package still proves the distinct comparison between Γ-transitivity and Vieta connectivity using normality and the symmetric root.

## F13 (P3) — applied

Incomplete layer summaries → Layer 3 includes SchemeAndStackFoundations §§3.1–3.3 and 5.9–5.11; Layer 4 includes §§0.1–0.2; Layer 6 includes ArithmeticGaloisRepresentations §4.4, SchemeAndStackFoundations §§1.18–1.19, 1.21, 1.23, 4.15, InverseGaloisAndArithmeticFundamentalGroups §§IG.3.2, IG.5.4 and the Tau Ceti commutator-trace theorem. Layer 7 also records the new Babai supplier.

## Checks and elaborated signatures

- Required elaboration: `lake env lean` on `packages/ArithmeticDynamicsPartII/Suggested.lean`, from the content checkout, exited 0. Exactly 18 warnings, all “declaration uses `sorry`”; no errors. No Tau Ceti import occurs, so no targeted object build was necessary.
- Mechanical binder check: a scratch copy appended `#check @name` for each of the 31 remaining declarations and elaborated once, exit 0, with the same 18 warnings. Read all 31 elaborated types and compared them with the README. No section binder was lost. The intentional signature changes are native Ω, the two renamed definitions and the removal of the p≥5 binder from finite oriented transitivity; four declarations were deleted. All other hypotheses remain, including prime instances, positive integer domains, finite-field instances, trace exclusions, two nonzero coordinates, odd valuation prime, and squarefree/local-action assumptions.
- Acceptance structure: 13 definitions with real bodies and 18 headline theorems; single `import Mathlib`; no `set_option`, sorry’d data, admitted examples or newly added API declarations. Every remaining own Lean name appears in the README. Searches found no old names, design labels, deleted subsection references, stronger local constants or numerical-certificate residue in the editable README/Lean files.
- The design comparison after parsing JSON found equality of every field except top-level `gaps`, now empty. Metadata did not need changes. `git diff --check` exited 0.
- Dependency command from the brief exited 0 on both runs. The initial run reported `depcheck: 47 roadmaps, 514 edges, 0 problem(s)`. The final run produced this exact output:

```text
depcheck: 48 roadmaps, 534 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No separate gate failures were supplied.

## Sources, ownership and citation verification

The content main revision inspected was b41e47bc34e30def0db01d84cc92062ed72c6e68. Its manifest pins Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Read the DenseGraphLimits roadmap and Completed/AlgebraicCodingTheory before editing.

Used the supplied legal source extractions; no new work or duplicate source key was needed. M25 and DM96 remain settled uncertified references. No missing-reference request was created. The source evidence for the changed claims is EFLMT24 line 141, line 163, line 974 and line 1306; MP18 line 1240, line 1322, line 1369 and line 1435; C24 line 1364, line 2361, line 3340, line 3429, line 3599, line 4391 and line 4645; BGS16 line 510; and CZ13 line 154. The conservative intersection estimate follows from the degrees and four boundary points, not from EFLMT24’s smaller constants.

Checked ownership by object with `roadmaps grep` across main and the indexed open heads, and by reading matching board packages and pinned source files. The inverse-Galois admissible-cover construction and Babai’s estimate have the owners now cited. No alternative owner of the retained primitive-group socle/section targets or maximal-divisor theory was found; those existing package targets remain here. Module socles in Tau Ceti’s `TauCeti/RingTheory/SimpleModule/Socle.lean` are submodules, not the socle of a finite primitive permutation group. ArithmeticDynamics contains projective dynamics, not this Markoff action. NonabelianLevelStructures is a later consumer of the rigidified elliptic specialization; it cannot supply it here. No construction was moved to a later supplier, and no declaration was given another roadmap’s fully qualified name.

Resolved every cross-roadmap citation against main or the supplied open head. Read ClassicalArithmeticCompletion §§4.3, 4.23, 4.38, 4.42–4.44, 4.57–4.58, 4.62, 4.76, 4.92, 4.101, 4.103, 4.106, 4.108 and 4.111; SchemeAndStackFoundations §§0.1–0.2, 1.18–1.19, 1.21, 1.23, 3.1–3.3, 4.15 and 5.9–5.11; InverseGaloisAndArithmeticFundamentalGroups §§IG.3.2 and IG.5.4; ArithmeticGaloisRepresentations §4.4; WeilConjectures WC.5’s two named comparisons and WC.7’s curve/Jacobian comparison; ErdosProgressionPowers §0.9; and PolynomialGaloisGroupsPartII §4.4. `roadmaps resolve` reported no missing roadmap citation and no missing roadmap Lean name. Its library-name omission was independently covered by opening the pinned files.

Pinned declarations were inspected in the files and at the locators in Exact supplier contracts. In particular, `Nat.card_divisors` is in `Mathlib/NumberTheory/ArithmeticFunction/Misc.lean:222`, the Ω factorization formula at line 318, the native Ω definition at line 258, and the totient product in `Mathlib/Data/Nat/Totient.lean:286`. `Equiv.Perm` is at `Mathlib/Logic/Equiv/Defs.lean:94`; the two affine declarations are at `TauCeti/GroupTheory/SpecificGroups/Affine/Primitive.lean:84` and line 89. `SimpleGraph` requires symmetric loopless adjacency; preprimitive actions do not require nonemptiness; the divisor finset at zero is empty. These native definitions do not silently provide the missing geometric level stack or an orbit-connectivity theorem.

## Adversarial mathematics record

Small finite enumerations below are scratch checks, not new library deliverables. They test the stated formulas and hypotheses; eventual results are also checked by their source/proof routes, since small-prime values cannot prove a uniform threshold. Rows distinguish definitions, headline theorems and the remaining mathematical assertions. The finite facts at 770 and q<203897 are imported source statements, with arithmetic boundary witnesses below; no large verification is planned.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| Coefficient and nonzero conventions | ℤ root; zero ring | 1²+1²+1²=3·1·1·1=3; zero ring has one triple, zero nonzero triples | Consistent | None |
| Factor-three convention | (1,1,1), (1,1,2); 𝔽₃ | Images (3,3,3), (3,3,6); 27=27, 54=54; modulo 3 image 000, #M*=8, #X*=0 | Exception essential | Exact §4.108 citations |
| Cyclic indices and permutations | i=2; transposition (01) | R₂(111)=112; transposition sends R₀(111)=211 to 121=R₁(111) | Direction consistent | None |
| Commutator convention | Two unipotents; identity pair | 4+4+9−12−2=3; 12−8−2=2 | Correct −2 shift | None |
| Positive divisors, rank conventions | n=0,1,12 | D(0)=∅, D(1)={1}; Ω(0)=Ω(1)=0, Ω(12)=3 | Correct junk values | Native Ω |
| `markoffEquation` | c=3 and c=1 at 111; 000 | 3=3 true; 3≠1 false over ℤ; 0=0 true | Coefficient matters | None |
| `vietaMove` | c=3, i=2, 111; zero tuple | 111→112→111; 000→000 | Involution and zero preserved | None |
| `moveStep` | 111→112; fixed step at 011 mod 2 | Witness i=2; R₁(011)=011 | Fixed steps retained | None |
| `gammaStep` | 123→213 over ℤ | Swap gives 213; Vieta outputs (5,2,3), (1,1,3), (1,2,−1), so the swap is an additional generator | Permutation branch distinguished | None |
| §0.1 generated actions | Symmetric root; double sign change over ℤ | All 6 permutations fix 111; sign change gives (1,−1,−1) | V, Γ, Δ distinguished | Exact supplier citations |
| §0.2 loopless graph | p=2 | Root has 3 neighbours; leaf has fixed labelled move but 0 self-edges | Correct | None |
| §0.3 orbit/component equivalence | p=2,3 | V-orbit and component sizes 4=4, 8=8 | Both directions agree | None |
| §0.4 finite prime facts | p=2,3,5,7,11,13 | Coefficient-three sizes 4,8,40,28,88,208, each one V-component | Correct | Reused in §6.6 |
| §1.1 piecewise weights | Rational root; (0,1,2) mod 5 | (1/3,1/3,1/3), (0,3,3); sums 1,1 | Zero-coordinate extension needed | None |
| §1.2 complementarity | Move zero coordinate of (0,1,2) mod 5 | R₀ gives (1,1,2); weights 0+1=1; fixed-coordinate pair 3+3=1 | Correct at fixed points too | None |
| §1.3 involution balance | Two-point swap; fixed singleton; empty set | Weights (a,1−a) sum 1=2/2; fixed weight 1/2; empty sum 0=0/2 | No freeness assumption needed | None |
| `stable_card_dvd` | Empty S; full components p=2,3,5 | 2∣0, 2∣4, 5∣40; 3∤8 | p≠3 essential | None |
| §2.1 rotation matrix | Coefficient-one root; a=0,2 | 333→336; at p=5 matrix orders 4 and 5, versus eigenvalue orders 4 and 1 | Repeated roots separate | Renamed signature |
| `markoffRotation` | 333; zero tuple | (3,3,6); 000 | Real body determines direction | Rename |
| §2.2 conic classification | p=5, a=0,±2,1; p=7, a=0,±2 | Sizes 8,10,10,6; sizes 0,0,0; a=1 has κ=3 | Exceptional cases agree | None |
| §2.3 point-count adapter | p=3,5,7 | 3(3−3)=0, 5(5+3)=40, 7(7−3)=28 | Correct | Locator p. 409 |
| `divisorPhi` | n=0,1,2,4,6 | 0,1,3/2,2,5/2 from divisor sums | No zero denominator in D(n) | None |
| `rotation_orbit_count` | p=3,5,7,11,13 | Formula and enumerated orbit counts 0=0, 8=8, 5=5, 14=14, 26=26 | Exact rational count agrees | Native rotation name |
| §3.0 quadratic characters | f=X, X(X−1), X²,1 over 𝔽₅ | Sums 0,−1,4,5; last two are geometric squares | Nonsquare hypothesis necessary | Precise dependency names |
| §3.0 gcd/torus estimate | x+y=1, μ₄×μ₄ in 𝔽₅ | 3 solutions; bound max(3·32^(1/3),192/5)=38.4 | Correct degree/boundary inputs | None |
| §3.0 translated-subtorus exclusion | x=y in μ₄×μ₄ | 4 points on a subtorus; hypothesis fails | Exclusion retained | None |
| §3.0 arithmetic low-order quantifiers | d=1, T=z^(δ/(2A)) | C·T^A=C·z^(δ/2)≤z^δ for z≥C^(2/δ); bound 11·1³+1=12 | Constants absorbed only after threshold | Precise dependency names |
| §3.1 enlarged cage predicate | p=5 parabolic (2,0,1); p=7 parabolics | 4+0+1=0 mod5 and 40-point orbit; no parabolic points at 7 | Clause consistent | EFLMT24 attribution |
| §3.2 slice incidence | p=5, a=b=1 | Discriminant 1−4(1+1)=3; χ(3)=−1, hence 1+χ=0 solutions | Zero/square/nonsquare distinction retained | Quadratic-character input named |
| §3.3 primitive trace factor | p=5, split torus order4 | Primitive eigenvalues 2,3 have common trace 0; 2 eigenvalues give 1 trace | Factor 1/2 essential | None |
| §3.4 middle-game exponents | L=p^(1/10), d≤L | L^(2/3)/L=p^(−1/30); (L²/p)/L=p^(−9/10) | Subpower divisor factor can be absorbed | Gcd input named |
| `no_finite_orbit` | S=∅; singleton 333 over ℚ̄ | ∅ stable; 333→336 leaves singleton; at cube corner 222, sum12≠product8 | No spurious finite nonzero model | None |
| `orbit_log_lower_bound` | p=5,7; illustrative c=1 | (log5)^(1/3)≈1.172<40; (log7)^(1/3)≈1.249<28 | Consistent local witnesses; source gives uniform constants | None |
| §3.5 norm estimate | Orders 3,4,6 | lcm=12≤72=3·4·6; φ(12)=4 and 20⁴=160000 | Positive nonzero norm route retained | None |
| `giant_orbit` | p=5,7,13; ε=1/2 | Complement 0≤√5,√7,√13 | Finite witnesses consistent | None |
| `sparse_exceptional_primes` | t=13, coefficient-three | Disconnected-prime count 0≤13^ε for ε>0 | Characteristic-three convention respected | None |
| §4.0 affine approximation | A¹ mod5; x²+1=0 | 5 residues lift; roots 2,3 mod5 versus 0 integer roots | Predicates distinguished | Dependency summary fixed |
| §4.1 symmetric root bridge | p=2,3,5 | Γ-root and V-root orbits both size4,8,40 | Comparison agrees with imported equivalence | Duplicate target removed |
| `eventual_connectivity` | Small prime specializations | V-root orbit sizes 4,8,40,28,88,208 equal full sizes | Consistent; eventual quantifier retained | None |
| `eventual_positive_lifting` | Residue 112 mod5 | Integral 112 has 1+1+4=6=3·1·1·2 and all coordinates positive | Actual integral witness | None |
| `prime_affine_lifting` | Origin; c=1 mod3 | Origin lifts by 000; #X*(𝔽₃)=0 | Full affine endpoint includes origin | None |
| §4.4 conjectural universal proposition | p=2,3 | Connected coefficient-three graphs of sizes4,8; coefficient-one size0 at3 | No theorem asserts all primes | None |
| §5.1 conic geometry | α=1, β=3 over 𝔽₅ | αβ=3≠1; four boundary points; degrees2,2 and χ=4 | Conservative constants justified | Dropped unsupported stronger bound |
| §5.1 local intersection bound | p=5, t=6, d=4 on a=1 slice | Two second-coordinate zeros; bound (3/2)max(768^(1/3),384/5)=115.2≥2 | Bound is safe, though coarse | Same constants everywhere |
| `maximalDivisors` | n=12 at x=0,3,6,12; n=1,x=1 | ∅,{2,3},{4,6},{12}; {1} | Divisibility maximality distinguished | None |
| §5.3 signed complement | p=5; origin negative control | Complement0 divisible by20; nonzero sign blocks size4, origin block size1 | Nonzero hypothesis essential | None |
| §5.4 first-order obstruction | General positive M | (108M³)²M²/8=1458M⁸; M≤2C gives 373248C⁸ | Strict lower endpoint propagated correctly | Stronger constants deleted |
| §5.4 denominators | p=5,d=1 | φ(4)=2, φ(6)=2; M₁=1+1=2 | Both denominators positive | None |
| §5.4 elementary totient comparison | n=1,2,12,0 | Ratios1,2,3≤τ values1,2,6; n=0 gives totalized0/0=0 | Euler proof restricted to positive n | New local target and Checks |
| §5.5 reducing identity/composition | D(1), identity; 5^i→3^i | All terminal ratios1; for remaining exponents r, (3/5)^r≤3/5 | Correct including terminal quotient | None |
| §5.5 rejected reducing map | D(3)→D(5), 3↦5 | 5>3 violates f(d)≤d | Wrong model excluded | None |
| §5.5 product ratio | (A₁,B₁)=(1,1), (A₂,B₂)=(3,5) | λ(3)/λ(5)=3/5, separate minima ratio1 | Terminal case split essential | None |
| §5.6 padding injection | n=5,m=3,a=1,x=1,3,5 | Source maximal sizes1,1,1; padded n=6 sizes1,2,2 | Inequality agrees; terminal divisors handled | None |
| `IsMaxDivReduced` | n=1,3,27,384,768 | true,true,false,true,false; at27, 3²=9≥5; at768, 2⁸=256≥200 | Same predicate, distinct name | Rename |
| `reduced_domination` | n=2,5,27; all n=2…40 in scratch | m=2,6,30; ranges [2,2],[5,14],[27,102]; maximal-divisor counts dominated at all cutoffs | Simultaneous cutoff witness found for every tested n | Rename consumer updated |
| `divisorRank` | n=1,8,12; out-of-range k | Rank lists [1], [1,1,1,1], [1,2,2,1]; C₄(12)=0 | Multiplicity, not distinct factors | Native Ω |
| §5.9 rank polynomial and symmetry | n=12, squarefree6 | 1+2T+2T²+T³; 1+2T+T²; ranks symmetric, totals6,4 | Product and squarefree formulas agree | Native Ω contract |
| `central_rank_bound` | n=1,4,8,12 | Denominator-free comparisons1≤1, 4≤6, 8≤12, 16≤18; #M₆(12)=2=C₁(12) | Central normalized bound agrees | Native Ω |
| §5.10 off-central warning | n=4 versus squarefree6 at rank0 | Proportions1/3>1/4 | No off-central normalized theorem inferred | None |
| §5.13 interval coverage | p=5 | Representative ranges [4,10],[6,18]; 4p−2=18 | Both torus orders covered | Universal criterion replaces computation |
| §5.13 rank guard | M≤2C | 108(2C)³=864C³; 4·373248C⁸=1492992C⁸ | Constants recomputed exactly | Non-strict guard excludes strict obstruction |
| §5.14 rank threshold | n=1492992² | n=2229025112064; 1492992√n=n | Equality allowed; n+2 larger | No unsupported numeral for connectivity |
| §5.14 second-interval threshold | p≥2, p+1≤2p | 384¹⁶(p+1)³≤8·384¹⁶p³<p⁸ if p⁵>8·384¹⁶ | Strictness preserved | Effective symbolic bound |
| §5.14 hypotheses are independent | Empty complement versus an unproved cage range | Complement0 has no obstruction; rank inequality alone supplies 0 information about cage membership | No circular target hypothesis | Cage range remains explicit |
| §6.0 imported stable type | (g,n)=(1,1); trivial H | Stability expression1>0; #Epi(F₂,1)=1; center order1 | Supplier includes this type | Adm(H) imported |
| §6.0 rigidification and base change | H=C₂; H=1 | Vertical groups have orders2 and1; regular Noetherian base satisfies cited coarse-base-change hypothesis | Does not silently discard center | Supplier contract exact |
| §6.0 cotangent/coarse degree congruence | H=1; SL₂(𝔽₅) | 12∣12; ord(c)=10, 120∣24·40=960 | Normalization agrees | Locators corrected |
| §6.0 general ℓ-adic degree congruence | r=3,s=j=0; r=3s+j | Exponents ceil(3/2)=2 and0; divisors ℓ² and1 | Boundary exponent nonnegative | Locator corrected |
| §6.0 centralizer factors | SL₂(𝔽₅), trace−2; SL₂(𝔽₄), order5 | Orders10 and5; quotients1 and1; 5∤(4−1)=3 | Nonsplit characteristic2 retained | None |
| §6.1 trace dictionary | Unipotent pair; dihedral pair over 𝔽₇ | Trace triples223 and600; commutator traces3 and6; latter has only1 nonzero coordinate | Irreducible does not imply non-dihedral | None |
| `orientedStep` | p=2, swap then Vieta | 111→111→011,101,110 | Two reversing steps reach every leaf | Added small-prime Check |
| `traceOrder` | p=5, traces2,−2,1; p=7,trace3 | Companion orders5,10,6,8; scalar−I at5 has order2 | Noncentral carrier essential | None |
| §6.2 inverse-root and repeated-root laws | t=1 over5; trace0 over4 | Roots have inverse orders6; nonidentity unipotent in characteristic2 has order2 | No conflation of eigenvalue/unipotent orders | None |
| `semisimple_orbit_congruence` | (q,t)=(5,1),(7,3),(3,0) | Moduli3,2,1 divide oriented sizes36,64,16 | Splitting and denominators agree | None |
| `valuation_orbit_congruence` | q=5,t=1,ℓ=3; ℓ=7 | r=1,s=0 gives3∣36; r=s=0 gives1∣36 | Truncated subtraction behaves correctly | None |
| `oriented_card_dvd` | p=2,3,5,7,11,13 | 2∣4, no point at3, 5∣40,7∣28,11∣88,13∣208 | Uniform finite-action convention | None |
| `oriented_transitivity` | p=2,3,5 | Oriented sizes4,0,40 equal full sizes4,0,40 | p≥5 unnecessary | Binder removed |
| §6.6 geometric conclusion | p=2,3 versus5 | SL₂-epimorphic trace−2 loci empty at2,3; at5 the trace orbit has40 points | Nonempty geometric hypothesis retained | Split finite and stack clauses |
| `primitivePoint` | n=5,65; mixed and root triples | Local sizes40 and40·208; mixed local reductions000/111; root111/111 | Local nonvanishing is stronger than global | None |
| §7.1 CRT/twist | n=65 | 40·208=8320; 3 invertible mod65 with inverse22 | Equivariant point comparison valid | Exact §4.108 citation |
| §7.2 sign blocks | p=5,7,2 | Sizes4 at odd primes; #Y=10,7; at2 block size1 | Odd characteristic essential | None |
| `mpCondition` | p=5,13,7 | First branch true at5,13; at7 orders≤8 give square≤64<8192 | Second branch fails at7 | None |
| §7.3 inverse-root independence | u and u⁻¹ | Product1, orders equal; squared threshold1024(p+1) | Choice of square root immaterial | None |
| §7.4 primitivity inputs | p=5; p=7 | #Y=10 with MP true; #Y=7 with MP false | Sufficient hypothesis not misread as necessary | Character input named |
| §7.5a socle alternatives | C₅ regular; S₃ natural action | Socle orders5 and3, both transitive; C₃ index2 in S₃ | Abelian/nonabelian alternatives distinguished | Babai supplied separately |
| §7.5a small-index claim | A₅; C₂ negative control | |A₅|=60, no maps onto nontrivial subgroup of S₃; C₂ has subgroup index2 | Nonabelian simple factors necessary | None |
| §7.5a p=7 affine exclusion | Rotation on7 blocks | Cycle lengths3,2,2; its square fixes4 of7, affine nonidentity fixes≤1 | Prime-power exception handled | None |
| §7.5a order bound/base route | C₅ acting regularly | Base size1<4√5 log5≈14.40; |G|=5<exp(4√5(log5)²)≈1.153·10¹⁰ | Distinguisher route has correct scale | Supplier and route added |
| §7.5a section bound | n=2¹⁶ | 6 log n≈66.542; integer section degree must be≤66 | Strict bound and domain retained | Supporting target only |
| §7.5 finite coincidence fact | q=5,13 | 11²−1=120=5(5²−1); for13, p²=2185 lies between46²=2116 and47²=2209 | Exceptional pair agrees | Named cited finite fact |
| §7.5 induction normal images | Single simple factor; two commuting factors | [g,h₁h₂]=([g,h₁],[g,h₂]); second factor uses h₂, not h₁ | Distinct-factor correction retained | None |
| §7.6 solvable sign quotient | S₄; simple A₅ factor | |S₄|=24=2³·3; |A₅|=60 includes5 | Simple factor cannot be lost to this solvable quotient | None |
| §7.6 character positivity | p=121,127 | (121−11·11)/4=0; (127−11√127)/4≈0.759>0 | Strict p>121 needed | Finite source facts retained |
| §7.6 product-770 fact | Factors2,5,7,11 | 4·40·28·88=394240 | Correct carrier cardinality | Named cited fact, no large computation |
| `squarefree_transitivity` | n=5,65 | Root V-orbit at5 size40; n65 primitive carrier size8320 | Word-action and CRT inputs remain separate | None |
| `squarefree_positive_lifting` | n=65 root; both coefficients | Integral111 and333 satisfy3=3 and27=27; residues primitive at5 and13 | Actual positive witnesses | None |
| `squarefree_integral_image` | n=65 origin, root, mixed point | Image size8321=1+8320; full size8569; mixed patterns40+208=248 | Both inclusions and failure of full affine lifting agree | None |
| §7.8 mixed-point arithmetic | M:404040; X:555555 mod65 | Equations vanish mod65; reductions000/111 and000/333 at5/13 | Mixed points cannot lift integrally | Exact supplier sections |

## Maintainer consequences

No commit, push, pull-request edit, tooling edit or merge-order edit was made. The only edited package files besides this report are README.md, Suggested.lean, sources.toml and the permitted `gaps` list in design/plan.json.

Consumers must use `markoffRotation` and `IsMaxDivReduced` instead of the old local names, and Mathlib’s `ArithmeticFunction.cardFactors` instead of `bigOmega`. The deleted acceptance declarations are `effective_connectivity`, `primitive_order_bound` and `primitive_section_bound`; the latter two remain prose targets. Finite `oriented_transitivity` now accepts every prime. No consumer may infer the deleted numerical connectivity threshold. NonabelianLevelStructures continues to consume the rigidified specialization, while the unrigidified admissible stack is supplied by InverseGaloisAndArithmeticFundamentalGroups §IG.5.4.
