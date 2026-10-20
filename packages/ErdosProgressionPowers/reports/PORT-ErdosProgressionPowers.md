# ErdosProgressionPowers port

- Branch: `roadmap/erdos-progression-powers`.
- Head: `e101259371172a32b3dd13e926676ae33b6af5cd`.
- Commit subject: `ErdosProgressionPowers: roadmap (README, Suggested.lean, metadata)`.
- Base verified clean at `0e8b058`. The requested branch already existed from the earlier attempt; its committed port was restored and amended after this audit.
- Changed exactly `TauCetiRoadmap/ErdosProgressionPowers/README.md`, `TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean` and `TauCetiRoadmap/ErdosProgressionPowers/metadata.toml`.
- Final working tree: clean. No push or GitHub writes.

## Validation

The targeted command was `lake build TauCetiRoadmap.ErdosProgressionPowers.Suggested`.

Exact outcome:

```text
Build completed successfully (8976 jobs).
```

Warning count: **22**, all `declaration uses sorry`; **0** other warnings and **0** errors. The file has 35 real-bodied definitions/aliases, 22 theorem targets, and 26 proved examples. No data or example contains an admission. Every theorem carries its required hypotheses in its own signature; there are no section-variable hypotheses to disappear.

Exact push-gate summary:

```text
gate ErdosProgressionPowers: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 check-labels-missing=0 empty-sections=0 round-labels=0 long-fences=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Both gate commands used the requested `tauceti-roadmap` launcher. The content gate was first run before committing; its only failure was `dirty=2` for the two intended edits. After the commit its complete summary is the successful line above. No tooling, configuration, manifest or merge-order file was edited.

The initial targeted build began rebuilding missing dependencies and was interrupted. Build artifacts from an existing local checkout were copied into generated `.lake` directories only after checking each dependency revision against `lake-manifest.json`; the final targeted build then completed. No additional Lake command was used.

Exact standalone dependency-check output:

```text
depcheck: 2 roadmaps, 6 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The earlier failure was an omitted consumer entry in the supplied merge order; the supplied order now contains ErdosProgressionPowers. The order was read only.

`git diff --check` passed. The outside-folder diff is empty. The full README was reread after the structural port and checked against the retained Lean signatures. All 49 original target headings and all 115 original named API/Check contracts remain represented in the README.

## Draft pull request body

Build the arithmetic of perfect powers in primitive arithmetic progressions, from signed prime-support factorizations and two Frey families to a simultaneous quadratic-character family. Develop the general modular comparison and quantitative analytic interfaces needed by both the smooth-character/Roth proof and Granville’s exceptional-conductor proof of the effective prime-exponent bound. A signed diagonal-curve adapter then gives finiteness for each sufficiently large fixed length and arbitrary exponent.

AI assistance: Codex (GPT-6) ported the accepted specification, checked pinned declarations and ownership, revised the mathematical interfaces, and elaborated the representative signatures and proved examples.

## Dependencies still in pull requests

None. All retained cross-roadmap suppliers are on main: EllipticCurves, ModularForms, LocalFieldsRamification, ClassicalArithmeticCompletion, ImaginaryQuadraticClassNumber and AlgebraicCurves. The brief supplied no open roadmap heads. No roadmap module is imported; the only import is `Mathlib`.

## What moved from Lean to the README

The five admitted constructions `signed_factors`, `character_family`, `thin_conductor_witness`, `maximal_conductor_family` and `addendum_witness` are README construction targets with their full simultaneous properties. Their dependent coefficient, conductor, value, density and maximality statements are likewise README targets. Auxiliary predicates and carriers tied to those constructions are described intrinsically with the exact coefficient, support, primitivity, residue and ordering hypotheses.

Basic API lemmas that develop the theory, rather than state layer milestones, are README targets. Their named contracts and Checks were preserved. The 59 package Check labels remain in prose; Checks on retained definitions were combined into at most two proved examples per principal definition. Checks involving the omitted constructions remain attached to their construction targets. The representative file retains easy end theorems and milestones on native carriers, including the full signed finiteness statements, Gram inequality, quantitative Roth cutoff, bounded-height Landau–Page existence and consecutive-product non-perfect-power theorem. The last was added during this resumed audit because its README statement is already easy to express on existing carriers.

The accepted partition characterization still includes triple membership in both cases. The corrected native discriminant, absolute character sums, strengthened Roth threshold, strict harmonic endpoint dispatch, principal-pole guard, common-height explicit formula, simultaneous Granville witness and corrected Darmon–Granville elimination indices were all preserved.

## Supplier replacements and duplication sweep

The sweep covered every active and completed roadmap on main and the pinned Mathlib/Tau Ceti trees, by mathematical object and hypotheses. There were no open roadmap heads to inspect. Searches of upstream Mathlib/Zulip material did not identify another usable implementation of the missing smooth-character or modular comparison contracts.

- Replaced `ClassicalArithmeticCompletion:CA.1` by §1.51 for rational-squareclass characters, their primitive conductor and dyadic/odd support. The underlying pinned fundamental-discriminant character and its primitivity/value declarations are consumed directly.
- Replaced the quartic `CA.4` citation by ClassicalArithmeticCompletion §4.41. The positive consecutive-product theorem is a separate local target: that theorem was not found in the cited owner or at the pins.
- Replaced CM-integrality ownership by ImaginaryQuadraticClassNumber H3.1. The residual-image comparison and rational-isogeny surjectivity are local general targets.
- Corrected ModularForms consumption to Layers 2–4, 8 and 10: Layers 6–8 alone do not supply the newform definitions. LocalFieldsRamification Layers 3–4 supply ramification filtrations and finite-level inertia comparisons; the pinned lower-ramification declarations were located before citation.
- Replaced the generic Frey reference by EllipticCurves’ worked Frey–Hellegouarch example. Only the progression specialization remains here. Finite-field trace/Hasse and local minimality/reduction are consumed from its Layers 2–4.
- Corrected the Artin comparison contract: EllipticCurves Layer 4 does not supply the asserted ramification-theoretic conductor identification. Its algorithmic exponents are inputs; the actual Artin construction and comparison are explicit local targets.
- Corrected the genus bridge to AlgebraicCurves Layer 12E, together with Layer 7 Hurwitz. SchemeAndStackFoundations §2.20 supplies a dualizing comparison, not the full function-field/cohomological-genus contract the package had attributed to it.
- The package’s ArithmeticGaloisRepresentations, SerreWeightAndLevelOptimisation, EllipticModularityEffectiveComparisons, EllipticLegendreCharacterInterfaces, ComplexMultiplicationAndExplicitReciprocity, AnalyticNumberTheory, SieveMethodsAndPrimePatterns, ExponentialSumsAndCircleMethod, AdditiveCombinatorics and HeightsRationalPointsAndObstructions contracts could not be verified as supplied sections at this checkout. Their missing mathematics is explicitly owned here, with full general classes and source locators, except where replaced by the verified main-roadmap contracts above.
- The eventual divisor-subpower bound was not found at the pins; it is a local general target, not an invented library supplier.
- Chebotarev excludes effective zero-free regions and numerical error terms; its qualitative PNT does not duplicate these quantitative targets. EllipticCurves’ integral-model Kraus criteria differ from the exact-conductor residual-representation realization required here.

No additional original progression target was deleted by duplication. Generic character, point-count, Frey, invariant, genus and duality ownership is recorded only in the README’s Scope and ownership section, with exact consumption contracts following it.

## Upstream-review fixes

1. Replaced unavailable or imprecise suppliers with verified section contracts or explicit local general targets; fixed the Artin and genus overclaims described above.
2. Moved explicit prime/totient/divisor estimates into Layer 0 so modular levels and Legendre projections have no forward dependency on Layer 3.
3. Corrected the Case-II explanation from forbidden 8-divisibility to a subgroup of order 16, contradicting exact 2-part 8. The order-four witness doubles to the specified nonidentity two-torsion point.
4. Stated that witness over every field of characteristic different from 2 with nonzero t,v and the exact quadratic relation; the rational example is a Check.
5. Made the p≥5 hypothesis explicit in the half-interval local branch, where the source’s large-length hypotheses guarantee it. The native c₄ has a factor 16, so a dyadic unit claim cannot be stated without this restriction.
6. Separated invariant identities from the stronger local-reduction clauses: first-family identities require S and a strict triple without oddness of the exponent; second-family identities require only integer n,d and an equal-sum quadruple. This matches the Lean signatures.
7. Required positive conductors in the general smooth-character correlation theorem and nonnegative Gram row bound in its empty-family form.
8. Specified the real exceptional-zero interval, a common effective c*, and the actual PNT exceptional term. Excluded principal poles and retained positive modulus instances.
9. Replaced the nonexistent qualified `DirichletCharacter.IsQuadratic` supplier spelling by `MulChar.IsQuadratic` and its actual file.
10. Replaced admitted tests by proofs, removed all option overrides, converted the document to upstream layers/prose and Unicode or ASCII code-span mathematics, and retained the full source locators.

11. Distinguished the rational-Tate-module multiplicative conductor exponent 1 from the residual exponent, which is 0 when ell divides the minimal discriminant valuation and 1 otherwise. Added a split Tate-curve negative control to the README.
12. Made weight-two newform Galois representations, their Frobenius polynomial, cyclotomic determinant, invariant-lattice existence and residual semisimplification comparison explicit general targets. Made the weight-two coefficient bound and elliptic-curve modularity explicit inputs to level lowering; these were implicit in the restored specification and are not supplied by the cited analytic ModularForms layers.
13. Added `consecutiveProduct_not_perfectPower` as a headline Lean theorem with explicit positive-start, positive-root, length and exponent hypotheses, matching Layer 7.1.
14. Replaced process adjectives in mathematical locators with descriptions of the normalization, decay exponent, strict endpoint and simultaneous witness.

The valuation-deletion sample was checked and left mathematically unchanged: indices {0,1,4} have coefficients (1,2,1), whose product is 2.

## Adversarial mathematics pass

These are boundary/source checks, not claims to have proved the admitted theorems. Rows group an object with all of its named basic API.

| Statement or definition family | Instances tried | Result | Change |
|---|---|---|---|
| `term`, `primitive_solution`, their three API targets | k=0, (1,24,3,35,2), (−3,2,4,3,2), gcd(4,2)>1 | Product, sign, primitivity and positive length agree | Proved bundled examples |
| `H`, `Hplus` | Small lengths, equality at both length cutoffs, strict exponent endpoint | Explicit conjunctions; no conclusion assumed | Kept real bodies |
| `term_gcd` | Consecutive indices, spacing two, signed terms | Positive gcd divides spacing; primitive hypothesis needed | Preserved |
| `large_prime_valuations` | q=k prime, q not dividing a term, zero term excluded | Boundary prime belongs to large side | Preserved nonzero input |
| Signed factors and their four API targets | (−8), (8,27), all small-prime power 64, mixed negative terms | Full small exponents retained; signs restored for odd ell | Construction moved to README |
| `Triple`, `ap_triples`, membership/spacing/monotonicity | k=0,1,2,3,5; constant triple | Empty, singleton, four triples; constants excluded | Proved examples |
| `Quadruple`, `equal_sum_quadruples`, `kappa` | k=2,3; (0,1,1,2) | Repeated middle allowed; kappa=−1 | Proved example |
| `divisibility_indices`, residue class count | k=0; modulus 0,1,3,4; divisor larger than k | Correct empty/set boundaries; +1 retained | Proved finite examples |
| Explicit prime, totient, divisor targets | x=1,2,4; prime powers p^a | θ and ψ differ; divisor count a+1 | Local quantitative ownership |
| Actual Artin conductor and local API | Unramified representation; good, split and nonsplit multiplicative reduction; coefficient prime; Tate parameter valuation ell | Rational Tate exponents 0,1,1; residual multiplicative exponent can be 0 | Explicit residual-conductor criterion and negative control added |
| Weight-two newform representation and modularity | c_p=0; coefficient prime; two invariant lattices; good elliptic prime | Polynomial T²+p; coefficient prime excluded from unramified clause; residual semisimplification independent of lattice | Added named general construction, determinant, coefficient bound and modularity targets |
| Weight-two lowering and trace congruences | Good prime, removed multiplicative prime, coefficient prime | Distinct local hypotheses retained | General local targets |
| Removed-prime bound and newspace inequality | Good versus removed prime; trivial-nebentypus versus Γ₁ dimension | Norm divisibility only in removed-prime case | Exact native contracts |
| μ and Kraus F,G,H | N=1,4,11; new dimensions 0,1 | H(1)=4, H(11)=169 | Explicit functions and Checks |
| Irreducibility thresholds and Kraus realization | ell=2,3,7,11; full versus one rational two-torsion point | Separate cutoffs and hypotheses | General local targets |
| `tripleG`, `normalized`, `first_curve`, normalization API | n=d=1; n=2,d=1; n=−3,d=2 | gcd 1/2 and signs match exact coefficients | Proved examples |
| `first_local_invariants`, odd local properties | (1,−4,3); odd primes versus 2; g=0 outside S | Native discriminant 16(abc)²; no unqualified dyadic minimality | Split identity/local hypotheses |
| Generalized Fermat identities | Indices (0,1,2), signed terms, arbitrary spacing | Correct middle sign and spacing factors | README target preserved |
| `secondA`, `secondB`, `second_curve`, equation API | (0,1,1,2), positive and signed terms | A−B=kappa*d²; a₂ has opposite sign to first family | Proved examples |
| `second_local_invariants`, two local branches | kappa=−1; p dividing kappa; dyadic p; endpoint pair at distance p | Algebraic identities unconditional on S; local exceptions needed | Explicit p≥5 half-interval branch |
| First reduced level | ell=7; odd semistable primes; dyadic factor | Distinct deletion level and original conductor | Preserved exact bounds |
| Second reduced level | ell=11; primes 2,3; primes dividing kappa | Wild and kappa factors retained | Preserved exact bounds |
| `half_primes_divide_d` | Open lower/closed upper endpoint; one versus two divisible terms | Both Frey families required | Preserved H hypothesis |
| Coefficient-prime bridge | Good versus finite-flat multiplicative case at ell | Weight/conductor equality requires actual local comparison | Named local target |
| Progression Kraus threshold and comparison curve | lcm(M,4), residual isomorphism at same ell | Exact conductor and threshold retained | No private curve carrier |
| Good trace comparison | p=3 mod4; Hasse radius; p≥5 supersingularity | Congruence upgrades to integer equality under large ell | Preserved |
| Generic Legendre models/orderings | λ=0,1,2; odd characteristic; six labels with coincidences | Singular parameters excluded; labels retained | Local general interface |
| Native halving and order-four witness | t=v=1/2, λ=1/2; i²=−1; characteristic 2 excluded | Equation value −2i; double (1,0); extra halving forces order 16 subgroup | Corrected divisibility explanation |
| Residual-image comparison | CM versus non-CM; ell=37 boundary; rational isogeny | Strict ell>37 and isogeny hypotheses retained | Local general target |
| `inCaseSquareclasses`, `case_partition`, three API targets | Parameters {3},{−1}; k=0; outside triple | Correct exhaustive partition and triple guard | Proved examples; accepted correction retained |
| Case-I nonsquare projection | Prime classes 3 mod8 and other odd classes | Four-character projection uses absolute values | Preserved |
| Case-II normalization/square test | Positive t,v; units at good primes; nonsquare tv | Exact two-primary obstruction | Corrected 8/16 wording |
| Frey non-CM | Signed powers of two; d=0, d dividing 3 | Integral j argument needs nonzero denominator and primitive terms | Preserved H and half-prime input |
| Case-II odd-conductor exclusion | Odd part 1; square and twice-square tv | Quartic descent and actual image comparison required | Verified §4.41 supplier |
| Simultaneous character family and four API targets | Modulus 1; values at 0 and 1; separate versus common witnesses | Nontrivial odd part; one pair meets every property | README construction target |
| `weightedHalf` and its API | k=0,1,2, constant value | Values 0,0,log 2 | Proved example |
| Effective character PNT and repulsion | Principal character, exceptional real zero, N=1 | Principal term excluded; positive log N and β enforced | Exact common interval added |
| `finiteGramBound` | Empty family; orthogonal unit pair; repeated unit pair; x=0 | Nonnegative C needed for empty family; off-diagonal terms matter | General native headline |
| Smooth-character correlation | Equal characters; conductor 0,1; ambient product modulus | Equality/zero conductor excluded; principal factors retained | Positive conductors explicit |
| Harmonic criterion | c1→0, c1=1/20000, largest-prime endpoint | Decay exponent min(c1,1/2); strict smoothness retained | Preserved accepted repair |
| Many-character criterion | Diagonal pair; >17 log k versus equality | Mean-square coefficient 1/68 <0.1239² | Preserved squared absolute sums |
| `quantitativeThreeAP` | Singleton, constant triple, δ=10⁻⁵ | Strict AP; log-log cutoff between 10⁶ and 10⁷ | Added native general headline |
| `Tpr`, `Upr`, `thin_prime_survivors`, three API targets | k=0; lower-endpoint equality; reordered prime sets; prime 2 | Open lower endpoints; dyadic avoidance needs mass restriction | Proved examples |
| `removedIndex`, `valuation_deletion`, three API targets | Empty J; unit coefficients; (1,2,3,4,1); tied maxima | Retained {0,1,4}; least tie index 1 | Proved examples |
| `stirling_upper_adapter` | m=0 excluded, m=1; positive denominator | Correct upper direction and exp(1/(12m)) | Native sequence supplier |
| Survivor density and coefficient cutoff | S empty, mass endpoint, A_i=k^139 | Strict/closed endpoints match; rounding loss retained | Preserved |
| `certifiedThreshold`, `thinSet`, thin witness | 10⁶ versus 10⁷; S containing 2; same triple | Correct numerical threshold and simultaneous bounds | Data construction in README |
| Maximal conductor family | Empty family; duplicate largest primes; proper extension | Nonempty and inclusion maximal, not merely cardinal maximal | Data construction in README |
| `original_route_bound` | Both cardinal branches; closed largest-prime endpoint | c1=1/20000 handles strict criterion | Preserved |
| `zeroHeight`, `zeroWithin`, `hasZeroWithin`, `exceptional_moduli` | k=0,1 totalization; modulus 0; above k⁴; high zero; principal pole | Analytic uses large k; invalid witnesses excluded | Proved negative controls |
| `pageException`, `boundedPage`, existence | T=2; positive modulus; principal pole | Exact strip and height; pole is not a zero | Added native existence headline |
| `exceptional_moduli_bounds` | At-most-one small modulus; log k floor | Same effective c and height throughout | Explicit hc/hp binders |
| `nonexceptional_half_sum` | Principal character; ρ near 0; common truncation height | Principal excluded; integral avoids singular estimate | Preserved corrected formula |
| `exceptional_indices`, three API targets | Empty moduli; divisor 1000>k; q=8 threshold 1 | Empty set, large-divisor witness, all four indices | Proved examples |
| `exceptional_indices_sparse` | Noncoprime or zero difference excluded; divisors above k | +1 errors remain and are negligible only after summation | Explicit hypotheses retained |
| Addendum witness and conductor detection | Disjoint blocks; k=64 scale; three gcds | Same block satisfies size and avoidance; odd part divides product | README construction target |
| `granville_route_bound` | Nonprincipal small conductor outside exceptional set | O(k/log k) contradicts fixed absolute mass | Preserved |
| `effective_prime_bound` | yd=0, ell=2, fixed versus varying k | Degenerate branch explicit; effectivity separate from existential syntax | Full native headline retained |
| Faltings and fixed-exponent adapter | k=4,5; ell=2; all signs; primitive lifts ± | Genus 1 versus 5; finite sign patterns and lifts | Corrected genus supplier |
| `composite_exponent_reduction` | Prime divisor p; y=0,±1; fixed ∣Y∣>1 | Exact quotient exponent; unit bases excluded for long nontrivial progressions | Preserved |
| `fixed_length_finiteness` | Fixed k versus all lengths; signed and positive domains | Finite union over primes and root/exponent fibres | Full native headline retained |
| Consecutive-product theorem | k=1 square; k=2,n=1; signed progression | Positivity and length assumptions necessary | Explicit local ownership |
| `erdos_threshold` and three API targets | K=0,3; signed n=−3 | Known positive solution refutes small thresholds; no conjectural theorem asserted | Proved examples |
| `smooth_multiplier` and three API targets | b=0,1; tau<1/2 boundary with b=2,k=2 | Zero excluded; unit specialization correct; smooth support fails at boundary | Proved examples |

## Source locators and unresolved items

Source IDs used in this report: PKG-README is `packages/ErdosProgressionPowers/README.md`; PKG-REVIEW is `packages/ErdosProgressionPowers/review.json`; MAIN-EC is `TauCetiRoadmap/EllipticCurves/README.md`; MAIN-CA is `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md`; MAIN-AC is `TauCetiRoadmap/AlgebraicCurves/README.md`; MAIN-SF is `TauCetiRoadmap/SchemeAndStackFoundations/README.md`. BS20 and DG95 are the published/author-hosted sources linked in the roadmap References.

- PKG-REVIEW line 3 records acceptance. Its partition and native-signature decisions were preserved; no separate non-blocking action list was present.
- MAIN-CA line 1789 locates §1.51; MAIN-CA line 8840 locates §4.41.
- MAIN-EC line 879 distinguishes the Artin comparison from algorithmic conductor computation. MAIN-AC line 1155 begins Layer 12E; MAIN-AC line 1165 gives the genus equality. MAIN-SF line 4324 is the narrower dualizing comparison.
- BS20 line 138 starts the residual-representation setup; BS20 line 151 identifies the modularity and level-lowering inputs; BS20 line 169 starts the removed-prime bound; BS20 line 233 identifies exact-conductor Kraus realization. BS20 line 1833 gives the quantitative Roth cutoff. DG95 line 383 begins the diagonal-cover/genus argument. Page/section locators remain at every target in the README.
- MAIN-MF denotes `TauCetiRoadmap/ModularForms/README.md`: MAIN-MF line 383 starts Hecke operators, MAIN-MF line 532 starts eigenforms/newforms, and MAIN-MF line 764 starts coefficient fields. MAIN-LFR denotes `TauCetiRoadmap/LocalFieldsRamification/README.md`: MAIN-LFR line 785 starts the lower filtration; MAIN-LFR line 1200 identifies the absolute inertia supplier.
- TC-RAM denotes `.lake/packages/TauCeti/TauCeti/NumberTheory/LocalField/RamificationGroup.lean`: TC-RAM line 97 defines the lower ramification group, TC-RAM line 127 identifies inertia, and TC-RAM line 229 gives eventual triviality. TC-CHAR denotes `.lake/packages/TauCeti/TauCeti/NumberTheory/Multiquadratic/FundamentalDiscriminant/Character.lean`: TC-CHAR line 34 defines the native character and TC-CHAR line 87 proves primitivity. ML-STIRLING denotes `.lake/packages/mathlib/Mathlib/Analysis/SpecialFunctions/Stirling.lean`: ML-STIRLING line 126 states the telescoping input. These files were inspected at the manifest revisions.
- The source package did not contain the brief’s `sources.toml`, and its reports directory was empty. The README bibliography and accepted `review.json` were available and used. No suspicious instruction-bearing source passage was encountered.
- No unresolved port or validation failure remains. The original `sources.toml` and incoming report files were absent; bibliography locators and the accepted review supplied the available provenance. The build and gate both pass. The theorem statements remain roadmap targets, not proved mathematical results.


Pull request: #1336 (roadmap/erdos-progression-powers at e101259)
