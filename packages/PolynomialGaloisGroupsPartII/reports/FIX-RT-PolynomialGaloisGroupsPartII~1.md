# Repair report

Finding numbers are local to each review. The first eleven sections address pass a;
F01 also settles pass b F01. The final three finding sections address pass b F02–F04.
The reviews' overlapping supplier and Check findings are settled once.

## F01 (P3) — applied

Pass a F01 and pass b F01. Admitted examples → 18 proved examples, with at
most two per definition. Checks needing the planned factorization, subgroup or
root-field theory became named theorem targets in both files. The short supplied
proofs were verified by elaboration; related checks were combined. No admitted
example remains.

## F02 (P1) — not actionable in this package: the exact Mertens theorem requires its supplier

Pass a F02. The claimed AN.2 supply → `gap:mertens-prime-product`, requesting
AnalyticNumberTheoryPartI's full bounded-error estimate and coefficient-identification
proof. The same obligation is registered in `design/plan.json`'s top-level `gaps`.
BSKK line 3745–3749 requires the coefficient exp(γ). This package cannot add
the missing theorem to its supplier; the dependency remains an explicit supplier gap.

## F03 (P1) — applied

Pass a F03. The stale AN.5 owner → ErdosProgressionPowers §0.9,
`eventualDivisorSubpower`, including nonsquarefree integers. Its eventual estimate
implies the all-positive-integer version by taking the maximum of 1 and the
finitely many exceptional ratios τ(n)/n^η. Updated the supplier contract, §3.6
and Layer 3 dependencies. The supplier's §0.9, README line 494, states precisely
this eventual estimate.

## F04 (P3) — applied

Pass a F04. Stale hashes → Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`
and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, as recorded by
`lake-manifest.json`. Both supplier subsections now agree with the input pins.
The two imported Tau Ceti object files were present, and elaboration used these pins.

## F05 (P3) — applied

Pass a F05. Missing mirrors → proved empty-merging, unit-multiplicity, degree-guard,
empty/single-root adjoin and quotient, harmonic, E₂, and diagonal-distinguisher checks.
The forbidden merging, five-cycle memberships, small transitive groups, repeated-factor
values, quadratic fields, all-root/nonmonic quotients, cyclotomic/repeated-polynomial
and support checks receive explicit named targets where planned theory is required.
Every added name appears beside its README Check.

## F06 (P3) — applied

Pass a F06. The asserted zero-index negative control → a reciprocal-weight and
inclusive-endpoint check. In ℝ, 0⁻¹ = 0, so adjoining a zero term does not
change the sum. The value 3/2 remains and now has a proved Lean mirror;
exclusion of zero is described accurately as a domain convention.

## F07 (P2) — applied

Pass a F07. Omitted Layer 4 headlines → `babai_distinguishers` and
`bochert_minSupport`, on the actual finite permutation subgroups and existing
action predicates. Their explicit hypotheses retain nondouble transitivity and
n ≥ 5, respectively double transitivity, alternating noncontainment and n ≥ 38.
Evidence: babai line 178–180 and schomburg line 120–148. Both signatures elaborate.

## F08 (P3) — applied

Pass a F08. Missing manifest → four certified entries fetched through the sources
service, with authors, title, year, version-specific locators, cited sections,
hashes and legal provenance. Babai uses the author's HTTP copy. Each work has one
key covering its preprint and publication identifiers. All four extractions were
read; source validation reports zero problems and no missing text remains.

## F09 (P3) — applied

Pass a F09. Degree three at α = 0 → the partition {1,2} at α = 1.
The proved example establishes both the one-witness condition for every r ≥ 2
and failure of the four-occurrence event. The part 1 qualifies because
1/3 ≤ 1 ≤ 3/log 3 and r does not divide 1; total occurrence count is two.

## F10 (P3) — applied

Pass a F10. The undocumented instance → a mathematical docstring for
`partitionMeasurableSpace` and its explicit name in Conventions. Its body remains
the discrete measurable structure on the finite partition carrier.

## F11 (P2) — applied

Pass a F11. Parent Layer 5 ownership of an “unramified equality” →
NumberFieldArithmetic §3.10 ownership under polynomial-discriminant nondivisibility;
the parent owns the factor-degree and membership adapters. The scope cites the
pinned `TauCeti.NumberField.exists_gal_fullCycleType_eq_factorizationType`
in `TauCeti/NumberTheory/NumberField/Frobenius/CycleType.lean:164`.
The parent README, Layer 5, explicitly makes this ownership and hypothesis distinction.

## F02 (P3) — applied

Pass b F02. An independently requested separability premise in
`galois_merging_certificate` → derivation from irreducibility over ℚ.
Mathlib's `Irreducible.separable`, `Mathlib/FieldTheory/Separable.lean:509`,
provides that implication. Updated §6.2 and its coefficient-space discussion and
example accordingly. The optional removal of positive cycle and fibre sizes was
unnecessary; these explicit, consistent range hypotheses remain in §0.4.

## F03 (P3) — applied

Pass b F03. Ownership attributed to the nonexistent
ArithmeticStatisticsPartIIRandomPolynomials → a scope boundary for concrete
coefficient laws, repeated-factor tails and quantitative irreducibility. Downstream
use is described conditionally as a continuation of ArithmeticStatistics, with
no invented roadmap name or supplier obligation. None of those distribution
estimates is a premise of this package's arbitrary-law theorem.

## F04 (P3) — applied

Pass b F04. All six uses of “current” → timeless descriptions of the supplied
interfaces. The two research-blueprint links were deleted with the stale analytic
contracts; the exact Mertens gap and named divisor supplier replace them.
No other layer was reorganized.

## Gate failures cleared

| Initial failure | Change and result |
|---|---|
| Missing `sources.toml` | Added the four fetched works with all required fields; sources-service validation: 0 problems. |
| `sorry-examples=23` | Replaced admissions with proofs or named mathematical check targets. Eighteen examples remain, all proved, at most two per definition; `sorry-examples=0`. |
| `readme-ids-missing=26` | Gave all 26 missing API names actual signatures with their required binders and hypotheses. Added Check names in both files. `readme-ids-missing=0`; `check-labels-missing=0`. |

The package's 13 real-bodied definitions, abbreviations, structure and local instance
are unchanged mathematically. There is no admitted data, option override or new import.
`metadata.toml` is unchanged. The previously absent `design/plan.json` contains only
the authorized top-level `gaps` list.

## Adversarial mathematics pass

Each row covers the complete target group, including its named API consequences and
Checks. “Named check” denotes a mathematical theorem target, not a proved example.
All numerical comparisons below were checked mathematically; elaboration alone is
not used as evidence of truth.

| Statement or convention | Instances tried | Result | Change |
|---|---|---|---|
| Finite carriers, faithful root images, full cycle types, partition positivity | Empty carrier; degrees 1–3; identity with fixed points | Full cycle sum is card Ω; the image, rather than an abstract group, determines blocks | Pins and ownership corrected |
| Arbitrary fields in Layer 2; monicity in Layer 1 | Separable linear polynomial in characteristic 2; inseparable polynomial; nonmonic split quadratic | Separability is needed for distinct-root degree; monicity is needed for integral specialization | No narrowing |
| Discrete partition measures and separate probability normalization | n = 0,1; zero and infinite measures | A real-valued measure alone does not impose total mass one; the probability endpoints explicitly require it | Instance documented |
| Real cutoffs, reciprocal weights, common parameter ranges | n = 0,1; θ = 0 and δ/2−ε; α = ε/2 | Totalized small-degree definitions are valid; asymptotic proofs start at N ≥ 3; ε/2 ≤ α ≤ 1/40 | Zero-index explanation corrected |
| 0.1 `EqualPartMerging` and refl/mono/sum/`eq_of_lt_two`/pullback API | Empty multisets and negative bounds; singleton blocks; {1,1,2} → {2,2} → {4}; forbidden {2,3,6} | Empty witness works for every bound; nonempty blocks at y < 2 are singletons; output occurrence selection preserves sums; composition fails | Proved tests; pullback signature; forbidden named check |
| 0.2 `MergePerms` and membership/mono/card/conj/permCongr API | Identity; empty carrier; mismatched degrees; full five-cycle | Fixed points are retained; membership forces degree equality; transporting the full multiset proves invariance | API signatures and identity/five-cycle named checks |
| 0.3 `BadTransitive`, witness/conjugacy/relabeling API | n = 0,1,2,3; identity and five-cycle in regular C₅ | Small transitive subgroups are alternating or symmetric; in degree five even identity has a proper transitive witness | Named subgroup checks and transport signatures |
| 0.4 `equivariant_cycle_fibres` | d = 1,3 and m = 1,2; return identity versus swap | Types {1,1}/{2} and {3,3}/{6} are mergings in the stated direction; return-cycle sizes partition a fibre | Explicit positive ranges retained |
| 1.1 `maxFactorMultiplicity` and zero/unit/bound/squarefree API | 0,1; (X+1)³ over F₂; X(X−1) over F₃; m = 0 | Values 0,0,3,1; the squarefree iff requires nonzero nonunit; equal degrees of distinct factors do not increase multiplicity | Proved zero/unit example; API and repeated/distinct named check |
| 1.2 `fibre_card_eq_rootMultiplicity` | Empty finite set; injective map; ℤ → F₂ on {0,2} | Monic products are nonzero over the target field; collisions add multiplicities; the last fibre has size two | No change |
| 1.3 `ramified_merging` | Linear polynomial; X²−2 at p = 2; squarefree reduction; constant 1 | M = 2 at the ramified prime, with types {1,1} and {2}; M = 1 forces equality; the constant is outside positive degree | Every-prime theorem retained |
| 2.1 `TupleRootField` | Empty and singleton tuples; rational roots of X(X−1); root of X²−2 | Empty/rational adjoins give ⊥; singleton agrees with the simple adjoin; quadratic root field has degree two | Proved first two comparisons; two field named checks |
| 2.1 `tupleRootQuotient`, factorization/degree/separability | j = 0; monic constant 1; j = n; singleton; 2X(X−1) | Exact divisibility uses distinct selected roots; degree is n−j; all roots leave 1 in the monic case and 2 in the nonmonic check | API signatures, proved empty/singleton checks, all-root named checks |
| 2.2 `IsKFoldIrreducible` and one/mono/degree-bound API | k = 0, k > n, linear f; Φ₁₁; (X²−2)²; inseparable f | Guards reject vacuity and inseparability; Φ₁₁ is 1-fold but not 2-fold since one root generates its splitting field | Proved guard example; one-iff signature and two named checks |
| 2.3 `tuple_stabilizer_eq_fixingSubgroup` and restriction comparison | Empty tuple; singleton; tuple with j < n | Fixing all generators is exactly fixing their adjoin; normality over that field gives surjective restriction to the quotient Galois group | No change |
| 2.4 `kfold_iff_multiplyPretransitive` | k = 1,2,n; separable characteristic 2; k > n | Stabilizer recursion applies on complements of cardinality n−j; k > n is excluded explicitly | No change |
| 2.5 `kfold_degree_sub_two` | Separable irreducible and split cubics; degree two | At n = 3, k = 1 recognizes A₃/S₃; degree two would give inadmissible k = 0 | No change |
| 3.1 `harmonicMass` and positivity/monotonicity | Zero indicator at arbitrary m and m = 0; indicator of 2 through 4; constant true through 2 | Values 0,1/2,3/2; adding the zero term is invisible in ℝ | Proved mirrors and corrected negative-control claim |
| 3.1 `PartitionLaw`, diagonal/enlarge/weaken API | Zero indicator at m = 7; singleton at m = 4; repeated pair at n ≥ 8; κ′ ≤ κ | Bounds ν(univ) ≤ C, C exp(−κ/2), C/4; nonnegative harmonic mass gives the correct weakening direction | Two proved law examples, singleton target, diagonal signature |
| 3.2 `GoodEvent` and its diagonal/complement/four-occurrence API | {2,2,4} and {2,6} at n = 8, α = 0; n = 1; {3,3} at n = 6, δ = 2; {1,2} at n = 3, α = 1 | Occurrence-sensitive E₁ distinguishes the first pair; E₃ passes at log 1 = 0; E₂ fails on sum 3; one witness passes while E₅* fails | All cases have proved mirrors; API signatures added |
| 3.3 `anatomy_harmonic_masses` | α at both endpoints; r = 2 and r near n^α; inclusive cutoffs | Harmonic interval and multiples-of-r subtraction give bounded errors uniformly; ε > 0 fixes positive interval growth | No change |
| 3.4 `nonsmooth_harmonic_mass` | Smooth integer 1; prime exactly at cutoff; large n | Smooth mass is bounded by the inclusive finite Euler product; coefficient 1/2−exp(γ)/8 > 1/4 since exp(γ) < 2 | Exact Mertens supplier gap |
| 3.5 `pair_gcd_failure` | Diagonal pair; divisor just above cutoff; α = ε/2 | k,l ≥ 2 eventually; occurrence pair estimate and reciprocal-square tail give (log n)² n^(−κα) | No change |
| 3.6 `block_subsum_failure` | Complement j ↔ r−j; n = pᵃ; finite exceptional n | Complement puts the sum in premise (b)'s interval; all-integer τ(n) bound is necessary for prime powers | Correct supplier and finite-exception argument |
| 3.7 `long_parts_failure` | α = ε/2; floor(n/log n); strict failure event | L = α log n−log log n+O(1); failed count is contained in the non-strict law event uniformly | No change |
| 3.8 `large_prime_parts_failure` | floor(√n/3); large n; arbitrary θ in range | Cutoff lies in the lower-tail domain; L ≥ log n/4 gives n^(−κ/4), independently of θ | Uses exact Mertens gap through 3.4 |
| 3.9 `four_nondivisible_parts_failure` | r = 2; 3 ≤ r ≤ log n; log n < r ≤ n^(κα); larger r | Five unique long parts give four witnesses for large r; small-r lower tails use count ≤ 3; the three rates sum uniformly to the claimed bound | Four-occurrence target retained |
| 4.1 `minSupport` and none/some/attainment/lower-bound API | Trivial group; S₀; S₂ swap; A₃ cycles | Values none, none, some 2, some 3; a nonidentity permutation cannot move one point | Proved empty case; two named checks and API signatures |
| 4.2 `orbitalDistinguishers`, symmetry and support inclusion | x = y; trivial group; symmetric group on two and more points | D(x,x) = ∅; trivial stabilizer gives univ; symmetric gives {x,y}; a transporting element fixing z prevents distinction | Proved diagonal/trivial tests; symmetric target and API signatures |
| 4.3 `orbital_walk_connectivity` | Regular C₅; distinct versus diagonal starting pair | Components form blocks; a non-diagonal edge excludes singleton components; primitivity forces connectedness | No change |
| 4.4 `babai_distinguishers` | C₅; n = 5; diameter two and ≥ 3; full symmetric group | C₅ has five distinguishers; the symmetric exception is essential; positive valencies justify division and the two source estimates give √n/2 | Easy headline signature added |
| 4.5 `bochert_minSupport` | m = n; m = 4,…,9; m ≥ 10; n = 38 | Full-support case is immediate; 4m+6/(m−3) ≤ 37 for m = 4,…,9; integer rounding gives n ≤ 4m thereafter | Exact degree-restricted headline added |
| 4.6 `primitive_minSupport` | n = 5,…,37; n ≥ 38; primitive and doubly transitive branches | Jordan excludes supports 2 and 3 in small degree; Babai or degree-valid Bochert proves the square-root bound | No change |
| 5.1 `block_orbit_cycle_divisibility` | Two blocks of three; within-block swap; block interchange; fixed point | Equal top cycle lengths can have different actual block periods; fixed cycle length is one, not zero support | No change |
| 5.2 `primitive_exclusion` | θ = 0 and upper endpoint; chosen length divisible by p² | Unique chosen part survives merging; p^(a−1)q kills the other cycles and moves its entire cycle, without asserting it is a single prime cycle | No change |
| 5.3 `imprimitive_exclusion` | Small/middle/large block counts; one filled union; three long companion cycles | Pullback contradicts E₂ in the first range; five/four witnesses guarantee an eligible short companion in the other ranges | No change |
| 6.1 `generalized_luczak_pyber` | θ = 0 and δ/2−ε; varying laws ν; zero law excluded by normalization | All five failure rates are at least as strong as n^(−κα); constants precede ν and θ; endpoint exponent is −κε/2 | Analytic gap made explicit |
| 6.2 `galois_merging_certificate` and probability inclusion | Irreducible linear f; reducible repeated f; ramified p = 2; real y below 1 | Irreducibility supplies separability, positive degree and transitivity; M ≥ 1 excludes y < 1; the image witnesses BadTransitive when neither alternating nor symmetric | Redundant binder removed; consumer prose updated |

Object searches and source inspection used the pins rather than name matches alone.
The simple-root stabilizer, double-transitivity quotient, full cycle multiset,
factor-degree carrier, and single-cycle semiconjugacy formula remain suppliers;
none is redeveloped. The additional Lean API signatures concern the roadmap's own
definitions, not alternate library carriers. Three main-branch roadmaps were read
for format: PolynomialGaloisGroups, EffectiveBounds and ArithmeticDirichletSeries.

The legal source evidence is version-specific: bskk line 200–215, 3323–3328,
3490–3549, 3611–3649, 3653–3817 and 3819–3907; babai line 115–180,
222–313 and 335–338; schomburg line 31–39, 76–118 and 120–148;
bary-soroker-kozma line 438–451. No source passages are reproduced in the package.

## Validation

- Required elaboration of `packages/PolynomialGaloisGroupsPartII/Suggested.lean`
  from the pinned content checkout: **exit 0**, 54 `declaration uses sorry`
  warnings on named theorem targets, no errors or other diagnostics. No Tau Ceti
  build was needed because the two imported object files already existed.
- Binder audit: a scratch copy with `#check @name` for all 71 named declarations
  verifies the actual elaborated types. In particular both new support headlines
  retain their action and cardinality hypotheses, both probability endpoints retain
  probability normalization and `PartitionLaw`, and the certificate has no separate
  separability argument. The scratch audit exits **0**, with all 71 types printed,
  54 expected named-theorem admission warnings and no errors.
- The package lane's configured text scanners (`scan_folder`) report:

```text
gate PolynomialGaloisGroupsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 check-labels-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 OK
```

- Sources-service manifest validation: **exit 0, 0 problems**. All four required
  package files exist. Gap-reference validation returns an empty problem list.
- `git diff --check`: **exit 0**. No files outside this package were edited.
- The prescribed dependency check exits **0** and prints:

```text
moved: PolynomialGaloisGroupsPartII moved in the merge order from #84 to #187, right after its last supplier ErdosProgressionPowers; checked as moved (the worker moves it there when it submits)
depcheck: 10 roadmaps, 81 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. An exploratory invocation of the repository-layout
`gate` command was unsuitable for a board package: it expected
`TauCetiRoadmap/PolynomialGaloisGroupsPartII/` and reported two missing files there.
The package's own text scanners, source validation and the prescribed movable
dependency check above were then run directly against the package; all pass.

## Maintainer consequences

The exact Mertens estimate is an upstream obligation, registered as
`gap:mertens-prime-product`, rather than a theorem supplied by this repair. A human
must settle that supplier obligation; no text is missing from the legal source cache.
The worker's indicated move after ErdosProgressionPowers is required for the divisor
contract. No existing named target was renamed or deleted. The sole existing signature
change is removal of the redundant separability argument from
`galois_merging_certificate`; callers derive it from irreducibility internally.
No commit, push, pull-request edit or external message was made.
