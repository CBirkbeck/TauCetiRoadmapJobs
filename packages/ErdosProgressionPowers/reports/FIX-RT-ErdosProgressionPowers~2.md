# ErdosProgressionPowers repair findings

The prefixes `a-` and `b-` identify the two review files. Overlapping findings are settled together; a merged heading uses the higher severity. Report headings use unique numeric IDs, mapped to the original findings as follows: S01 = a-S01; S02 = a-S02; S03 = a-S03, b-S07; S04 = a-S04; S05 = a-S05, b-S09; S06 = b-S01; S07 = b-S02; S08 = b-S03; S09 = b-S04; S10 = b-S05; S11 = b-S06; S12 = b-S08.

## S01 (P2) — applied

Ordinary Legendre construction here → imports from ModularCurves §4C and ArithmeticDynamics §6.35. Added their supplier contracts and §2.1 dependencies; retained the scaled twist and arithmetic adapters. Verified both supplier sections, including the native coefficients and discriminant. No unmerged Lean module is imported.

## S02 (P2) — applied

Deletion definition without its milestone → explicit `valuation_deletion_factorial` signature. It retains coprimality, finite index range, nonzero terms, positive dividing coefficients and small-prime support. For a deleted maximum j, each retained coefficient valuation is bounded by the valuation of i−j; multiplying gives divisibility by j!(k−1−j)!, hence (k−1)!. Evidence: BS20pub line 1297.

## S03 (P2) — applied

Signed hyperbolic finiteness alone → retained signed theorem plus positive `four_term_product_not_square`, `three_term_product_not_cube` and `positive_fixed_exponent_finiteness`. Added elementary descent inputs and the positive range k+ell≥6. The signed square progression (−3,−1,1,3) and both genus-one boundary cases are Checks. Evidence: DG95 line 325, line 333 and line 338.

## S04 (P3) — applied

Rejection below 1/2 → proved equivalence `smooth_multiplier tau 1 1 2 1 2 2 ↔ 1 ≤ tau`. It admits b=2 at tau=1 and rejects every smaller tau, testing the exact closed support boundary. The zero/unit example is retained. The README Check is renamed `smooth_multiplier_support_boundary`.

## S05 (P3) — applied

Only rejection tests for the exceptional construction → named positive boundary target `exceptional_moduli_five`, linking the even quadratic character modulo 5, `zeroWithin`, `hasZeroWithin` and membership. Added three existential Checks, grouped into two proved examples. The named positive target follows the review’s explicit allowance for the logarithmic boundary. The pinned even-function value formula gives L(0,χ₅)=0.

## S06 (P2) — applied differently

No Lean character milestone → `character_family` with the same character satisfying primitivity, quadraticity, nontrivial squarefree odd support, coefficient divisibility, dyadic bound and strict weighted mass. Its sum is written explicitly because `weightedHalf` belongs to the next layer. The deletion-level support clause remains in the README. Evidence: BS20pub line 499 and line 503.

## S07 (P2) — applied differently

Compound `gap:character-pnt` → separate PNT, exceptional-zero repulsion and bounded-height Landau–Page gaps; consumers now name the input they use. Retained the nonprincipal condition N>1: extending the displayed error to conductor one would give ψ(X)=X, which fails at X=2. Evidence: BS20pub line 799, line 820 and line 1401.

## S08 (P3) — applied

Integer-to-natural unfolding route → direct `padicValInt.mul` citation at both uses, with prime and two nonzero-factor hypotheses. At the Mathlib pin, `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean:722` declares precisely this theorem. The earlier a-R11 claim of nonexistence was false; the natural-number transport was valid but unnecessary.

## S09 (P3) — applied

Exact 2-part 8 for an unspecified comparison twist → both signs: 8 exactly divides p+1−a, while 4 exactly divides p+1+a. Neither count admits a subgroup of order 16. Added the native-count boundary target `case_two_counts_five`: counts 8 and 4. Evidence: BS20pub line 700 through line 712; direct enumeration over 𝔽₅ agrees.

## S10 (P3) — applied

Unrestricted T_pr summation → sum only to k/2 using §1.9; added that dependency. The log(1−log 2/log k) saving absorbs the prime-count rounding term and reciprocal-prime errors in the certified range. Evidence: BS20pub line 1214 through line 1246.

## S11 (P3) — applied differently

Unspecified weighted-prime input → `weightedPrimeReciprocalBounds` with lower range x>1, upper range x≥319 and explicit E, followed by the factorial lower-bound calculation. Corrected the proposed centering: with E=−1.33258…, it is sum−log x−E. Citation: RosserSchoenfeld1962, Theorem 6, (3.21)–(3.22), p. 70 (waived primary text); BS20pub line 1316 through line 1323 confirms the application.

## S12 (P3) — applied

“RahmanRoth, bound (36)” → “RahmanRoth, as quoted in BS20, §9, equation (36), p. 381” in both the target and References. The number is now explicitly Bennett–Siksek’s equation label. Evidence: BS20pub line 1139 through line 1140.

## Mathematical adversarial pass

All kept definitions, signatures, named README APIs and conventions were read. The rows below group the statements and their APIs by their defining subsection. “Retained” records a boundary audit, not a proof of an admitted theorem. Hypotheses in Lean are individual declaration binders; there are no ambient `variable` blocks whose assumptions can disappear.

| Statement | Instances tried | Result | Change |
|---|---|---|---|
| §0.1 `term`, `primitive_solution`, `H`, `Hplus`, tuple carriers and projections | k=0,1,2; gcd=2; (1,24,3,35,2); (−3,2,4,3,2) | Empty length and nonprimitive data rejected; signs and bounds retained | None |
| §0.2 `term_gcd` | d=0,n=±1; adjacent indices; negative terms | Cancel d after gcd with a term; no division by an index difference | None |
| §0.3 `large_prime_valuations` | p=k; prime absent from all terms; potential zero term | At most one divisible term; product nonzero; integer valuation uses two nonzero factors | Direct pinned citation |
| §0.4 `SignedFactorization`, existence, uniqueness and sign/support APIs | k=0; ell=1,3; −8; p=k=2; small coefficient 64 | Odd exponent restores sign uniquely; small powers are retained in A | None |
| §0.5 `ap_triples` and APIs | k=0,1,2,3,5; equal indices | Counts 0,0,0,1,4; positive spacing | None |
| §0.6 `equal_sum_quadruples`, `kappa` and APIs | (0,1,1,2), (0,1,2,3), (1,2,2,3), (0,1,1,3) | κ=−1,−2,−1; unequal-sum tuple rejected | None |
| §0.7 `divisibility_indices` and APIs | k=0; r=0,1; r>k; index=k | Total divisibility and strict range are compatible | None |
| §0.8 `residue_class_count` | r=1; p dividing d; r>k; (n,d,k,r)=(1,2,6,3) | Empty or one residue class; sample {1,4}; +1 retained | None |
| §0.9 explicit prime, tail, totient, factorial and divisor bounds | x=1,2,4; n=p^a; endpoint 319; k at certified range | Powers occur in ψ; divisor count a+1; E cancels in endpoint subtraction | Explicit weighted-prime bounds and factorial derivation |
| §1.1 representations, residual lattice independence and trace adapters | p=ell; c_p=0; split/nonsplit multiplicative reduction; discr valuation divisible by ell | Coefficient prime excluded from unramified traces; rational and residual conductors differ | None |
| §1.1 conductor, removed-prime norm and Kraus realization/irreducibility APIs | N=1,4,11,44; full versus one rational 2-torsion point; ell=5,7,11 | μ=1,6,12,72; H_K(1)=4, H_K(11)=169; torsion cutoffs retained | None |
| §1.2 `tripleG`, `normalized`, `first_curve` and APIs | (n,d)=(1,1),(2,1),(−3,2), triple (0,1,2) | g=1,2,1 and normalized coefficients (1,−4,3),(1,−3,2),(−3,2,1) | None |
| §1.3 first invariants and odd local properties | Same triples; odd discriminant prime; p=2 | Δ=16(abc)² and c₄=16(a²−bc); dyadic minimality is separate | None |
| §1.4 `linear_fermat_identities` | Adjacent and nonadjacent indices; negative n,d | n and d coefficients both cancel | None |
| §1.5 `secondA`, `secondB`, `second_curve` and APIs | Repeated middle; positive and signed triples | A−B=κd²; sample a₂=−2,−4, a₄=−3,3 | None |
| §1.6 second invariants/local targets | p=2,3; d=0 algebraic identity; paired half-interval terms | Δ=−64κ³A²B; c₄=16κ(4κd²−3A); separate half-interval unit test | None |
| §1.7 `first_reduced_level` | ell=7; p=k; odd versus dyadic support | Odd level squarefree; bound retains 2-part and no automatic conductor equality | None |
| §1.8 `second_reduced_level` | ell=11; p=3; p dividing κ | Exceptional κ² and small wild factors retained | None |
| §1.9 `half_primes_divide_d` | p=k; one or two divisible terms | Paired branch κ=1−p is a p-unit; exponential contradiction uses H | Added use in §4.5 |
| §1.10 `coefficient_prime_bridge` | Good and finite-flat multiplicative coefficient prime | Serre weight and residual deletion match supplier hypotheses | None |
| §1.11 `kraus_progression_threshold` | N=1; lcm(N,4); newspace dimension 0 or 1 | Both index factors and the maximum are needed | None |
| §1.12 `comparison_curve` | One versus all triples | Actual elliptic curve and residual isomorphism selected together | None |
| §1.13 good reduction and trace targets | p=3 and p≥5; p≡3 mod4; p dividing d | Good odd reduction and symmetric-cubic twist yield trace zero in stated ranges | None |
| §2.1 ordinary Legendre ownership and `twistedLegendre` APIs | λ=0,1,1/2,2; characteristic 2 | Singular parameters excluded; scaled twist has Δ=1024λ²(1−λ)² | Earlier owners imported |
| §2.1 order-four, halving, symmetric trace and image targets | t=v=1/2; i²=−1; p=3,5; ell>37 | Point (1+i,−1+i) lies on curve and doubles to (1,0); image assumptions retained | Added count target |
| §2.2 `inCaseSquareclasses`, `case_partition` and APIs | λ=−1,0,2,3; k=0 | First three in squareclass union; 3 outside; cases partition strict triples | None |
| §2.3 `case_one_projection` | Residues 1,3,5,7 mod8; k/2≥10¹⁰ | Four-character projection gives k(1−3ε)/8; tail margin 0.000045875k | None |
| §2.4 `case_two_normalization` and square test | Both trace signs; curves over 𝔽₅ | Two possible counts have exact 2-parts 8 and 4 | Corrected comparison and boundary Check |
| §2.5 `frey_non_cm` | a=±b, b=±c, a=±c; d=0 and d dividing 3 | CM-integral j forces the excluded powers-of-two configurations | None |
| §2.6 `case_two_projection` | tv square/twice-square; λ=1/2; primitive quartic solution (1,1,1) | Parity and supplied quartic descent force CM contradiction | None |
| §2.7 `character_family` and all projection APIs | N=1; χ(0),χ(1); different proposed witnesses for support and mass | One primitive nonprincipal witness must satisfy the entire conjunction | Added easy Lean milestone |
| §3.1 `weightedHalf` and weight APIs | k=0,1,2,4; prime power 4 | Values 0,0,log2,log3+log2 | None |
| §3.1 PNT, exceptional-zero and small-conductor contracts | Principal modulus 1; one or two exceptional conductors; j=1 | Principal case cannot use the stated error; first chain inequality weak, subsequent strict | Split gaps, retained N>1 |
| §3.1 smooth-modulus sum, correlation and Gram targets | r=1; N₁=1; equal/distinct pullbacks; empty/equal/orthogonal vector families | Required maximum and divisor loss retained; equal characters excluded off diagonal | None |
| §3.1 `quadraticConductor_maxPrime_lower` | N=4,8,24,16,1; P=19,23 | 24 is tight small case; 16 not primitive quadratic; large P uses θ bound | None |
| §3.2 `harmonic_criterion` | c₁ below/above 1/2; one exceptional character | Error exponent min(c₁,1/2); reciprocal chain <2.13/log N₁ | Correct gap dependencies |
| §3.3 `many_character_criterion` | Repeated character; family of order k²; diagonal/off-diagonal | Normalized main coefficient 1/68<0.1239² | None |
| §4.1 quantitative Roth and cutoff substitution | δ=10⁻⁵; k below specified cutoff | 10⁶<132 log2·10⁵<10⁷ | Corrected quotation locator |
| §4.2 `Tpr`, `Upr`, `thin_prime_survivors` and APIs | k=0,1,2,16; empty forbidden sets; singleton survivor | Tpr(2)={2}, Tpr(16)={5,7,11,13}; nonempty Upr(2) | None |
| §4.3 `removedIndex`, `valuation_deletion` and APIs | Empty J; all units; coefficients (1,2,3,4,1); equal maxima | Least tie index 1; retained {0,1,4}, product 2 dividing 24 | Added factorial signature |
| §4.4 `stirling_upper_adapter` | m=1; telescoping lower endpoint; positive limit | Positive logarithm/denominator hypotheses retained | None |
| §4.5 `survivor_density` | p in (k/2,k]; additive rounding; log k≥1 | Such I_p empty; half-interval saving absorbs rounding; factorial error <5k | Restored §1.9 dependency and proof |
| §4.6 `thinSet`, witness APIs | Empty S; {7} at k=9; {2}; {9}; {7} at k=6 | Acceptance/rejection tests discriminate reciprocal mass, primality and bound | None |
| §4.7 maximal family APIs | Empty family; repeated largest prime; complementary mass | Nonempty witness and maximality give stated dichotomy | None |
| §4.8 `original_route_bound` | Closed endpoint at exponent 1−10⁻⁴ | c₁=1/20000 restores strict smoothness; 0.1683>0.166 | None |
| §5.1 bounded Page, real-zero upper bound and truncated formula | Principal pole; above-height zero; ρ=0; q=3 | Regularity excludes pole; integral at zero is log2; effective upper bound has nonzero denominator | Split supplier use |
| §5.2 `zeroHeight` and APIs | k=0,1; c=0; k≥3; c≤c′ | Values 1 at degeneracies; monotonic c for positive log log k | Added existential monotonicity proof |
| §5.2 `zeroWithin`, `hasZeroWithin`, `exceptional_moduli` and APIs | q=0; k=0; q>k⁴; χ₅,ρ=0,k=16,c=0 | Negative guards and a positive linked witness; strip boundary ≈−0.1034 | Added named positive target and proved existential controls |
| §5.2 `pageZero`, `pageException`, `boundedPage` and APIs | Negative T; q=0; principal pole; trivial zero −2 at T=2,c=4log2 | Wide strip admits witness; full contract imposes real/simple unique pair | None |
| §5.3 `exceptional_moduli_bounds` | q=1,2; fixed c satisfying full Page contract | Reality precedes effective real-zero estimate; same c retained | Correct gap dependency |
| §5.4 `nonexceptional_half_sum` | Principal character; ρ close to zero; same truncation height | Nonprincipal and regularized zero contribution essential | Removed unrelated repulsion dependency |
| §5.5 `exceptional_indices` and APIs | Empty modulus set; {1000} at k=3; {8} at k=4 | Large divisor 1000 valid; endpoint divisor 1 allowed at modulus 8 | None |
| §5.6 `exceptional_indices_sparse` | q<T versus q≥T; r>k | +1 summed before negligibility; O(k^(1/3)log^61 k) error retained | Correct Page dependency |
| §5.7 witness APIs and `granville_scale` | k=64; disjoint blocks; same triple for avoidance/size | 8·64^(7/2)=64⁴; >2k/7 blocks yields one small product | None |
| §5.8 `conductor_detection` | Odd conductor support split among three factors; N/8 | Product of gcds≥N/8 yields an allowed cube-root divisor | None |
| §5.9 `granville_route_bound` | N=1; nonexceptional character with mass lower bound | Odd part≠1 excludes principal; O(k/log k) contradicts 0.1239k | None |
| §6.1 Faltings supplier use | Genus 0,1 versus ≥2; number-field base | Only genus≥2 consumed; no effective enumeration | None |
| §6.2 `effective_prime_bound` | yd=0; prime ell=2; large k | Trivial branch explicit; maximum of effective input cutoffs needed | None |
| §6.3 signed/positive fixed-exponent targets and Euler boundaries | (k,ell)=(3,4),(4,3),(5,2),(4,2),(3,3); d=0; shared prime in (2,3,4); signed square example | Genera 3,10,5,1,1; positive elliptic cases require arithmetic | Added positive headline and boundaries |
| §6.4 `pow_eq_pow_div_prime`, `primitive_solution_natAbs_y_gt_one`, `finite_root_exponent_pairs` | p=0; ell=0; y=±1; Y=−8 | If p=0 divides ell then ell=0; three nonzero distinct terms exclude absolute value one; valuation bounds exponents | None |
| §6.5 `fixed_length_finiteness` | Fixed versus varying k; composite ell | Finite union over bounded primes then finite root/exponent pairs | None |
| §7.1 `consecutiveProduct_not_perfectPower` | k=1,n=4; k=2,n=1; signed square tuple | Length and positivity needed | None |
| §7.2 `erdos_threshold` and APIs | K=0,3; positive square progression; signed tuple | Both small thresholds false; signed example outside domain | None |
| §7.3 `smooth_multiplier` and APIs | b=0,1,2; tau<1,tau=1,tau>1 at k=2 | Nonunit accepted at exact closed endpoint | Replaced weak rejection example |

## Source and interface evidence

Pins checked: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. GitHub code search was followed by a pinned file read for integer valuations; local dependency sources at these pins supplied the continued-L-function, even-value, finite-cardinality and coefficient-change APIs. Object searches found no pinned progression-deletion, positive Euler-boundary or character-family theorem replacing the new targets.

The two ordinary Legendre suppliers were read directly: ModularCurves §4C and ArithmeticDynamics §6.35. Existing torsion/conductor, stable lattice, squareclass/quartic descent, curve-genus and modular-form ownership remains with the named main-branch suppliers. No later roadmap is consumed.

Legal source-service fetches cover BS20pub, DG95, Kraus1997, Lemos2017v2, Martin2003v1, BMOR2018v3, Schoenfeld1976, RamareRumely1996, Bombieri1971, Bombieri1987 and Platt2013v1. The two operator-cached sources were read at their stated locators: Faltings1983 line 682 and ErdosSelfridge1975 line 29. The principal mathematical witnesses for this round are listed under each finding. Additional bounds were checked at Kraus1997 line 284, BMOR2018v3 line 377, Schoenfeld1976 line 729 and line 1288, RamareRumely1996 line 1346 and line 1385, Lemos2017v2 line 44, Martin2003v1 line 113 and Platt2013v1 line 8.

IwaniecKowalski2004, Tenenbaum1995 and RahmanRoth remain covered by their authoritative waivers; Mazur1978 remains uncertified. RosserSchoenfeld1962 is also waived: attempted publisher downloads returned access-denied HTML, which was not treated as the paper. Its exact primary text was not certified in this round. No unwaived missing source remains requested. No source passage was copied into the package or this report.

## Validation outcomes

The final targeted build `lake build TauCetiRoadmap.ErdosProgressionPowers.Suggested` exited 0:

```text
Build completed successfully (8979 jobs).
```

The first build exited 1 after building Mathlib because its import graph predated the new Tau Ceti import (`unknown module prefix 'TauCeti'`). The next build exited 1 on the explicit finite-field instance, filtered-product typing and unsimplified natural casts in the new multiplier example. These were repaired; the final build has no errors and only the expected admitted-target warnings. All 48 examples are proved, and no `set_option` was added.

The required gate before commit exited 1 solely with `dirty=2`, identifying the two authorized edited files; every other counter was zero. The same gate after commit exited 0 with the exact output:

```text
gate ErdosProgressionPowers: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 check-labels-missing=0 empty-sections=0 round-labels=0 long-fences=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The required dependency-direction check exited 0:

```text
depcheck: 2 roadmaps, 15 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. `git diff --check` exited 0 with no output. All 77 named Lean declarations occur in the README; there are 38 light definitions/abbreviations, 39 theorems and 48 examples, with no ambient section variables. The only imports are `Mathlib` and the consumed native point-count module. The file has 942 lines, below the limit.

Commit `72b6157` on `roadmap/erdos-progression-powers` contains exactly `TauCetiRoadmap/ErdosProgressionPowers/README.md` and `TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean`. Its message is `ErdosProgressionPowers: red-team repairs (ownership, signatures, analytic inputs, and boundary checks)`. `git status --short` returned no output after commit. Nothing was pushed.

## Maintainer consequences

The two new supplier-gap slugs `exceptional-zero-repulsion` and `bounded-height-landau-page` require registration alongside the retained `character-pnt` gap in the external design records. No supplier theorem is invented or certified by splitting these needs. The existing supplier-gap section locators and missing package source manifest remain external obligations already settled outside this package’s edit authority; they are not reopened here.

Added Lean names: `case_two_counts_five`, `character_family`, `valuation_deletion_factorial`, `exceptional_moduli_five`, `four_term_product_not_square`, `three_term_product_not_cube`, `positive_fixed_exponent_finiteness`. Existing theorem types are retained. The README-only Check name `smooth_multiplier_half_boundary` becomes `smooth_multiplier_support_boundary`; no Lean declaration is deleted. No other roadmap, merge-order file, manifest, tooling or pull-request text was edited. No push or remote write was performed.
