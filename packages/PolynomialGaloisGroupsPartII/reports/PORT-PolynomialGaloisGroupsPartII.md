# Port report: PolynomialGaloisGroupsPartII

- Branch: `roadmap/polynomial-galois-groups-part-ii`.
- Head commit: `ca865109061aa797f2b3f5e8067466df0c25dd39`.
- Commit message: `PolynomialGaloisGroupsPartII: roadmap (README, Suggested.lean, metadata)`.
- Base verified clean at `a07e202`; final worktree clean.
- Exactly three committed files: `TauCetiRoadmap/PolynomialGaloisGroupsPartII/README.md`, `TauCetiRoadmap/PolynomialGaloisGroupsPartII/Suggested.lean`, and `TauCetiRoadmap/PolynomialGaloisGroupsPartII/metadata.toml`.
- No push, pull request, issue, comment, or other GitHub write was made.

## Draft pull request body

This roadmap extends PolynomialGaloisGroups from factorization/cycle-type comparisons at discriminant-good primes to bounded equal-part merging at every prime, including ramified primes. It develops ordered-root higher irreducibility, the anatomy of arbitrary partition laws, and primitive and imprimitive permutation-group exclusions, culminating in a uniform generalized Łuczak–Pyber criterion and a deterministic polynomial Galois certificate. The interfaces let coefficient-distribution estimates feed a common alternating-or-symmetric recognition theorem without restricting the arithmetic comparison to squarefree reductions.

AI assistance: Codex performed the port, source and supplier checks, signature audit, and mathematical self-review recorded below.

## Validation

The required targeted command was `lake build TauCetiRoadmap.PolynomialGaloisGroupsPartII.Suggested`. Final exit status: 0. Exact outcome line:

```text
Build completed successfully (8980 jobs).
```

Warning count: **13**, all exactly `declaration uses sorry` diagnostics; no other warnings or errors. The final Lean file has thirteen admitted headline theorems, thirteen supporting definitions/abbreviations/structure/instance, and three nontrivial proved examples. It is byte-for-byte identical to `packages/PolynomialGaloisGroupsPartII/Suggested.lean`. Metadata is copied unchanged, with `topic = "math.NT"`.

The exact required push-gate command, run with base `origin/main` after committing, exited 0. Its summary line was:

```text
gate PolynomialGaloisGroupsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Before the commit the gate's sole failing category was the dirty worktree, first for the untracked folder and then for the three staged additions. All content categories already passed. The tool requires a clean worktree and has no dirty-worktree bypass; committing was necessary for the exact requested command to pass. No tooling or order file was changed.

The explicit dependency command with `--movable` exited 0. Its complete output was:

```text
depcheck: 16 roadmaps, 120 edges, 0 problem(s)
```

There was no UPWARD, CYCLE, or moved line. `merge-order/ORDER.txt` places AnalyticNumberTheoryPartI at line 78, ErdosProgressionPowers at line 184, and this roadmap at line 188.

Citation resolution against main `a07e202` and the indexed 316 open heads reported no unresolved cross-roadmap citations and no unresolved Lean names. The resolver said that it did not inspect external library names because its own search location had no pinned Lake packages. Those names were checked directly in this worktree's actual pinned dependencies instead; this limitation was not treated as evidence that a declaration was missing.

`git diff --cached --check` passed before committing. The final comparison with `origin/main` contains only the three target-folder files. The top-level roadmap list, toolchain, manifest, package source, review, and source manifest were untouched. No Lean process remains running.

## Elaborated signature audit

The supplied `signatures.md` contained 25 named declarations, excluding the local measurable-space instance. I prepared one scratch module containing the complete accepted file followed by `#check @name` for **all 26 named declarations**, including that instance, plus all **10 PartitionLaw projections**. To obey the restricted Lean-command list, I temporarily used that scratch module as the target of the same permitted targeted build, then restored the final file and rebuilt it. Both builds exited 0 with thirteen expected sorry warnings; the signature build printed all 36 requested types.

Every elaborated type was compared with its README specification. No binder disappeared and no signature change was needed. In particular: ramified merging retains monicity, rational separability, positive degree and primality; the tuple results retain arbitrary fields and their degree/separability guards; the probability results retain probability normalization and put B,N before n,ν,θ; Babai retains nondouble transitivity and degree at least five; Bochert retains alternating noncontainment and degree at least 38; the certificate's witness lies in the actual root-action image, and rational irreducibility supplies separability.

## Port changes and final upstream reading

All 32 numbered targets, exact hypotheses, source locators, worked examples, definition APIs and original Checks are retained. The main-branch PolynomialGaloisGroups, completed Multiquadratic, and Chebotarev roadmaps supplied the repository shape; the supplied ArithmeticKTheory and ArithmeticDirichletSeriesPartII heads supplied additional presentation comparisons.

1. Converted the definition API paragraphs into explicit prose bullet lists, as required by the port format. No API theorem or Check was added to Lean. The tuple-field API now explicitly uses the pinned adjoin universal property, inclusions and monotonicity; its supplier declarations are named with their exact pinned spelling.
2. Replaced the Mertens supplier-gap label with the resolved citation **AnalyticNumberTheoryPartI §0.26**. That section states the exact bounded additive error and exp(γ) coefficient and explicitly owns coefficient identification. The mathematical contract is unchanged. Its weaker §0.31 is not substituted. The package's read-only design files remain untouched.
3. Made the parent boundary explicit in the opening summary: PolynomialGaloisGroups Layer 5 uses discriminant-good equality, whereas this continuation owns the collision-allowing, all-prime comparison.
4. Pinned left permutation composition with `(01)(12)(0)=1`, versus reversed product value 2. Pinned arithmetic Frobenius in F₈ with u↦u², versus the inverse u↦u²+u; the orbit has length three. Added the full-type witness `{2,1}` for a swap on three points. These distinguish convention errors that quadratic examples cannot detect.
5. Added the strict-cutoff Check at merging bound 3/2 and the zero-entry example `{0,0}→{0}` at bound 2, making the raw multiset generality explicit.
6. Added three Checks and the API for the discrete measurable structure: partition counts 1 and 2 in degrees 0 and 2, measurable-subset counts 2 and 4, and the degree-two singleton indicator with values 1,0.
7. Clarified the strict inequality in the largest block-count range. The existing strict bound is valid: non-filling gives s'<s, hence r'=ell/s'>ell/s. The endpoint estimate alone gives only a non-strict comparison. The added filled-union Check at n=2^400 computes equality r'=2^370=n^(1−3α), and explains why such a cycle fails the nondivisibility selection. No headline theorem was weakened. An initial suspicion that the original strict inequality was false was resolved by checking this non-filling input against bskk line 3892 and bskk line 3895.

The final full README reading found no false or vacuous headline and no further missing source or dependency. The examples, coefficient choices, all-prime arithmetic scope, arbitrary-field tuple scope, occurrence counts, and uniform quantifier order agree with the unchanged Lean signatures.

## What moved from Lean to README

Nothing moved during this port. The accepted package already applies the acceptance-test rule: its 45 former subsidiary API/Check theorems and 15 routine examples were represented by prose targets and Checks, while retaining all thirteen headlines and three nontrivial proved examples. This port preserves that separation and all of that mathematics; the new convention and boundary Checks are README-only.

## Suppliers, duplication, and ownership

The roadmaps consumed here that are still new-roadmap pull requests are **AnalyticNumberTheoryPartI** and **ErdosProgressionPowers**. PolynomialGaloisGroups is consumed as it stands on main, and NumberFieldArithmetic is consumed from Completed. Revisions to those existing roadmaps in open work are not dependencies.

- PolynomialGaloisGroups main, Layers 0 and 1: faithful root action, orbit/factor dictionary and equal-block quotient. The main Layer 1 heading is “permutation groups, blocks, and wreath products”; its “Imprimitivity gives a wreath embedding” target provides the compatible grid. Layers 5 and 9 supply the stated parent context. Parent Layer 2's one-root stabilizer and two-transitivity comparison remain supplied by the pinned Tau Ceti implementations; the new target is the arbitrary ordered-tuple extension.
- NumberFieldArithmetic §3.10: polynomial-discriminant-good equality, for arbitrary monic integral polynomials, including reducible ones. Its pinned implementation requires nondivisibility of the polynomial discriminant, which is stronger than field unramifiedness.
- AnalyticNumberTheoryPartI §0.26: inclusive reciprocal prime product exp(γ) log x+O(1), including coefficient identification. Its indexed head was read with `roadmaps show`; the exact contract is present.
- ErdosProgressionPowers §0.9: eventual divisor-subpower bound for all positive integers, including prime powers. The supplied head states it in prose; no nonexistent declaration name is used. Extending over finite positive exceptions yields the constant-bound form used here.
- The pinned single-cycle semiconjugacy, simple-root field, ordinary double-transitivity, partition and full-cycle APIs remain suppliers. No global merging or minimum-support theorem is substituted for them or duplicated.

Duplication searches used `roadmaps list`, repeated object-based `roadmaps grep` searches across all indexed open heads and main, direct searches of all board packages and main/Completed, and both README and Lean at all fifteen supplied sibling heads: ArithmeticKTheory; ArithmeticDirichletSeriesPartII; ComputationalNumberTheory; ConformalMappingPartII; EffectiveClassNumbers; AbelianSchemesAndArithmeticModuliPartII; GanGrossPrasadUnitaryGroups; SelmerIwasawaCohomologyPartII; QSeriesPartitionsAndMockModularForms; K3SurfacesAndSymplecticBoundedness; CohomologyComparisonsPartII; ColemanIntegrationPartII; QWittVectors; ErdosProgressionPowers; ArithmeticDynamics.

The ordered-root match in AbelianSchemesAndArithmeticModuliPartII §F4.3 is a bound on discriminants and products of root differences, not a tuple-generated field or higher-irreducibility construction. The divisor match is the named ErdosProgressionPowers supplier. Other lexical matches concern unrelated root systems, local primitives, or multiplicities. No second owner was found for occurrence-sensitive equal-part-merging assembly, collision-allowing specialization, arbitrary tuple-root irreducibility, the three-premise partition law or its anatomy, or the minimum-support/group-exclusion route. This continuation owns them as extensions beyond the parent's exact boundaries. No declaration duplicates a fully qualified declaration in another readable roadmap. No construction moved from a later roadmap, and no new duplication removal was necessary; existing ownership exclusions remain only in Scope and ownership.

Searches of the pinned libraries were by object as well as name: normalized factor counts, root multiplicities, tuple stabilizers, semiconjugate cycle fibres, support intersections/commutators, primitive orbital incidence, and Mertens products. The native definitions used are recorded below. Public Mathlib and Zulip design searches did not identify an additional relevant design to adopt; they are not evidence that no such work exists.

## Pinned library evidence

The manifest and dependency HEADs both identify Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Pinned file and locator | Contract inspected |
| --- | --- |
| `Mathlib/Combinatorics/Enumerative/Partition/Basic.lean:52` | Native fields are `parts : Multiset Nat`, positive parts, and `parts.sum = n`; zero-valued parts are excluded, but the partition of zero is present. |
| `Mathlib/GroupTheory/GroupAction/Primitive.lean:91` | IsPreprimitive extends IsPretransitive and requires every block to be trivial; it does not impose positive degree. |
| `TauCeti/GroupTheory/Perm/Partition.lean:96` | Native fullCycleType is `cycleType + replicate (card - support.card) 1`; it includes fixed points. Sum, conjugacy and relabeling are at lines 340,333,406. |
| `TauCeti/RingTheory/Polynomial/FactorDegrees.lean:55` | Native factorDegrees maps natDegree over normalized factors of the reduction, retaining multiplicity. Monic degree-sum theorem is at line 126. |
| `Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean:34` | Native adjoin is subfield closure of the base-field image union the generators. Universal property at line 55, generator inclusion at line 331, adjoin.mono at line 342, empty adjoin at line 355. |
| `TauCeti/GroupTheory/Perm/Semiconj.lean:46` | Bottom minimal period divides top minimal period. Return-orbit identity at line 54, finite fibre-intersection formula at line 82, orbit-count bound at line 104. No global occurrence-merging witness is asserted there. |
| `TauCeti/NumberTheory/NumberField/Frobenius.lean:97` | A prime above (p) in a Galois number field admits an arithmetic Frobenius relative to Z, with exponent p and no unramifiedness premise. |
| `TauCeti/NumberTheory/NumberField/Frobenius/CycleType.lean:164` | Existing full-cycle/factor equality requires monicity and polynomial-discriminant nondivisibility. |
| `TauCeti/FieldTheory/GaloisGroups/FrobeniusOrbits.lean:76` | Nonzero polynomial over a finite field, algebraic extension and splitting Fact yield an irreducible-factor orbit of cardinality its degree. |
| `TauCeti/FieldTheory/GaloisGroups/Orbits.lean:212` | Irreducibility/transitivity equivalence requires separability and positive degree. |
| `TauCeti/FieldTheory/GaloisGroups/Stabilizer.lean:74` | One-root stabilizer equals the simple-adjoin fixing subgroup. |
| `TauCeti/FieldTheory/GaloisGroups/MultipleTransitivity.lean:88` | One-root quotient criterion has irreducibility, separability, chosen root and degree greater than one. |
| `TauCeti/RingTheory/Polynomial/Roots.lean:111` | Quotient root-set equality requires root evaluation zero and derivative evaluation nonzero in the extension. |
| `Mathlib/FieldTheory/PolynomialGaloisGroup.lean:120` | Restriction surjective in a normal splitting extension; faithful root homomorphism at lines 204 and 212 requires the splitting Fact. |
| `Mathlib/RingTheory/Ideal/GoingUp.lean:369` | Maximal ideal lying over requires integrality and faithful scalar action. |
| `Mathlib/Algebra/Polynomial/RingDivision.lean:186` | Linear-factor multiplicity is 1 at that root and 0 otherwise. Additivity over a nonzero product in an integral domain is at line 306. |
| `Mathlib/GroupTheory/GroupAction/MultipleTransitivity.lean:122` | Embedding transport; monotonicity with degree upper bound at line 302; point-stabilizer recursion at line 338; alternating recognition at line 601. |
| `Mathlib/GroupTheory/GroupAction/Jordan.lean:370` | Primitive swap recognition; primitive three-cycle recognition at line 408. Neither needs an extra degree restriction for this application. |
| `Mathlib/NumberTheory/Harmonic/Bounds.lean:24` | Lower harmonic/log bound; upper bound at line 33. |
| `Mathlib/NumberTheory/Harmonic/EulerMascheroni.lean:172` | Euler constant <2/3. `Mathlib/Analysis/Complex/ExponentialBounds.lean:82` gives log 2>0.6931471803>2/3. |
| `TauCeti/GroupTheory/Perm/CyclePower.lean:60` | At a point moved by a cycle, its power fixes that point exactly when the cycle order divides the exponent. |

## Source locator audit

The four certified cached PDFs have SHA-256 hashes identical to `packages/PolynomialGaloisGroupsPartII/sources.toml`. I read the cited passages of their numbered text extractions, using their specified preprint/exposition versions. The live Babai URL failed to fetch and a local PDF renderer was unavailable; the supplied certified cached PDF and text remained available, so this did not leave a missing source. No source passages are copied into the roadmap or this report.

| Roadmap material | Source locators read |
| --- | --- |
| Higher irreducibility and cyclotomic comparison | bskk line 200, bskk line 210, bskk line 213 |
| Bad-transitive union | bskk line 3323 |
| Equal-part merging and occurrence partition | bskk line 3490, bskk line 3496, bskk line 3505 |
| All-prime collision comparison and fibre arithmetic | bskk line 3498, bskk line 3508, bskk line 3530, bskk line 3535, bskk line 3539 |
| Arithmetic bad-group event inclusion | bskk line 3544, bskk line 3549 |
| Partition law and uniformity | bskk line 3611, bskk line 3625, bskk line 3633, bskk line 3647 |
| Large-gcd and subsum rates | bskk line 3653, bskk line 3673, bskk line 3687 |
| Harmonic intervals and long-part rate | bskk line 3701, bskk line 3707, bskk line 3715 |
| Large-prime mass and precise Mertens coefficient | bskk line 3717, bskk line 3727, bskk line 3741, bskk line 3745, bskk line 3748 |
| Nondivisible parts and modulus union | bskk line 3751, bskk line 3760, bskk line 3787, bskk line 3798, bskk line 3808 |
| Primitive support and isolation argument | bskk line 3826, bskk line 3829, bskk line 3832, bskk line 3850 |
| Block arithmetic and exclusions | bskk line 3855, bskk line 3861, bskk line 3869, bskk line 3877, bskk line 3889, bskk line 3892, bskk line 3895 |
| Final union | bskk line 3900 |
| Orbital connectivity, stabilizers and distinguishers | babai line 115, babai line 127, babai line 142, babai line 160, babai line 167, babai line 178 |
| Babai proof: complement, average, walks, incidence tree | babai line 222, babai line 229, babai line 230, babai line 241, babai line 251, babai line 260, babai line 272, babai line 274, babai line 292, babai line 302, babai line 310, babai line 335 |
| Commutator and Bochert proof | schomburg line 31, schomburg line 39, schomburg line 120, schomburg line 123, schomburg line 134, schomburg line 147 |
| Primitive support comparison | bary-soroker-kozma line 438, bary-soroker-kozma line 444 |

The four-witness anatomy event and five/four short-companion argument are explicitly identified as strengthened arguments, rather than attributed verbatim to the one-witness source. The arbitrary-field tuple extension names its normal-splitting and stabilizer inputs. All proof-route inputs are earlier local targets, exact supplier sections, or pinned declarations.

## Adversarial mathematics pass

Each row records a statement or convention and actual values. Finite examples test definitions and both directions of equivalences. For eventual estimates, the computed quantities are the proof's coefficients, exponents and counting budgets; they do not assert an explicit value of the existential threshold. All thirteen headline signatures were also compared with their full elaborated types.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Finite root carriers and faithful images | Separable quadratic; repeated quadratic | X²−2: degree 2, distinct roots 2; (X²−2)²: degree 4, distinct roots 2 | Separability is required for degree identification | Retained |
| Permutation composition | σ=(01), τ=(12) in S₃ | (στ)(0)=1; (τσ)(0)=2 | Left composition distinguishes the conventions | Added convention Check |
| Arithmetic Frobenius | F₈=F₂[u]/(u³+u+1) | F(u)=u²; F⁻¹(u)=u⁴=u²+u; F³(u)=u | Arithmetic and geometric maps differ | Added convention Check |
| Full cycle type | Identity and swap in S₃ | Identity {1,1,1}, sum 3; swap {2,1}, sum 3, versus ordinary type {2}, sum 2 | Fixed points must be included | Added two-part witness |
| Positive partition parts | n=0,1,2 | Partitions ∅; {1}; {2},{1,1}; each sum equals n, no zero part | Empty partition is an object, not an empty carrier | Retained |
| Real cutoff and total-function convention | n=0,1; reciprocal index 0 | log 0=log 1=0; 1/(log 1)=0; 0⁻¹=0 | Small-degree definitions are total, asymptotics start at N≥3 | Retained |
| Common parameter range | δ=1/10, ε=1/50, θ=0 or 3/100, κ=1 | α=1/40 or 1/100; ε/2=1/100; upper bound 1/40 | Both endpoints have positive α | Retained |
| Uniform quantifiers | Same two θ values, any law | Decay exponents −1/40, −1/100; one B,N must cover both | B,N precede n,ν,θ | Retained |
| Arbitrary-field higher irreducibility | X²+X+1 over F₂; X²−t over F₂(t) | First has 2 distinct roots, derivative 1; second has 1 distinct root, derivative 0 | Inseparable input excluded, characteristic two admitted | Retained |
| 0.1 equal-entry occurrence blocks | {1,1,2,2,2,3} at y=2 | Blocks {1},{1},{2},{2,2},{3}; sums {1,1,2,4,3}; total 11=11 | Equal entries and occurrences both matter | API bullet form |
| 0.1 forbidden merging | Same input, output {2,3,6}, y=2 | Total 11=11, but producing 6 requires 3 twos (3>2) or 2 threes (only 1 available) | Sum conservation is insufficient | Retained Check |
| 0.1 empty input | y=−2,0,1 | Empty block family has flattening ∅ and sum multiset ∅ at every bound | Empty relation remains true | Retained |
| 0.1 reflexivity | a={0,2}, y=1; y=1/2 negative control | Singleton block sizes 1≤1; 1≤1/2 is false | Hypothesis 1≤y is necessary for nonempty input | API bullet form |
| 0.1 monotonicity | {1,1}→{2}, y=2,z=3 | Block size 2≤2 and 2≤3 | Same witness survives enlargement | API bullet form |
| 0.1 sum conservation | {0,0,2,2}→{0,4} | Sums 4=4, cardinalities 4≠2 | Sum, not cardinality, is conserved | API bullet form |
| 0.1 equality below two | y=3/2, a={0,2}; y=2, a={0,0} | Positive block size ≤1.5 is 1; at y=2, {0,0}→{0}, sums 0=0 | Strict cutoff and zero entries covered | Added Check |
| 0.1 occurrence pullback | {1,1,2}→{2,2}, select one output 2 | Pullbacks {1,1} or {2}, each sum 2=2 | Must select an occurrence, not all equal outputs | API bullet form |
| 0.1 failure of composition | {1,1,2}→{2,2}→{4} | First block sizes 2,1; second size 2; direct block {1,1,2} has unequal entries 1≠2 | Direct merging fails even at bound 4 | Retained proved example |
| 0.2 merged permutations | Identity on two points, partitions {1,1} and {2} | Full type {1,1}; at bound 1 membership true for first, false for second | Both directions of membership agree | API bullet form |
| 0.2 five-cycle and empty carrier | Full 5-cycle; S₀ | Full types {5} and ∅; degrees 5=5, 0=0 | Fixed-point-free and empty cases covered | Retained Checks |
| 0.2 degree constraint | Partition of 2 versus permutation on 3 points | Sum of input 2; sum of full type 3 | Membership impossible | API bullet form |
| 0.2 monotonicity | Swap type {2} from {1,1}, y=2,z=3 | Block size 2≤2≤3 | Membership increases with bound | API bullet form |
| 0.2 conjugation | Swap (01) in S₃ conjugated by (012) | Conjugate (12), full types both {2,1} | Full multiset unchanged | API bullet form |
| 0.2 relabeling | Relabel three-point swap by any bijection | One orbit of size 2 and one of size 1 before and after | Same {2,1} relation | API bullet form |
| 0.3 bad-transitive union, low degree | n=0,1,2,3 | S₀,S₁ orders 1; transitive degree 2 group S₂; degree 3 groups orders 3=A₃,6=S₃ | Permitted witness collection empty | Retained Check |
| 0.3 witness and inclusion | Identity and generator in regular C₅ | order(C₅)=5≠60=order(A₅)≠120=order(S₅); both elements lie in C₅ | Even identity belongs to bad union | API bullet form |
| 0.3 nonabelian witness | Regular Q₈ on eight points | Orbit size 8; group order 8 versus 20160,40320 | Nonabelian transitive witness is permitted | Retained definition |
| 0.3 conjugacy and relabeling | Relabel regular C₅ | Order 5 and orbit size 5 preserved; alternating order remains 60 | Whole subgroup must be transported | API bullet form |
| 0.4 equivariant cycle fibres | d=1,m=2; d=3,m=2, identity/swap returns | Top types {1,1}/{2} and {3,3}/{6}; return sizes 1+1=2 or 2=2 | Global blocks use every occurrence | Headline unchanged |
| 0.4 nonempty range | d=1,m=1; empty quotient | Top type {1}, period product 1·1=1; empty quotient has full type ∅≠{d} | Empty fake cycle excluded | Headline unchanged |
| 1.1 maximum factor count | 0,1,(X+1)³/F₂,X(X−1)/F₃ | Normalized factor counts ∅,∅,{3},{1,1}; maxima 0,0,3,1 | Counts factors, not degrees | API bullet form |
| 1.1 bound on any factor count | f=X(X−1) over Q, q=X or X+1 | Counts 1 and 0, each ≤ maximum 1 | Absent factors included | API bullet form |
| 1.1 maximum-bound iff | f=(X+1)³, m=2 or 3 | 3≤2 and all-counts≤2 both false; 3≤3 and all-counts≤3 both true | Both directions agree | API bullet form |
| 1.1 squarefree iff | X(X−1), (X+1)³, unit 1 | max=1,3,0; Squarefree=true,false,true | Nonzero nonunit guard excludes unit mismatch | API bullet form |
| 1.2 root multiplicity/fibre identity | Empty set; Z→F₂, S={0,2}, z=0,1 | Empty product 1: 0=0; product X²: multiplicity at 0 is 2=fibre size 2, at 1 is 0=0 | Reduction need not be injective | Retained |
| 1.3 ramified merging | X−1; X²−2 at p=2,3 | Linear {1}; at 2 factors {1,1}, M=2 and types {1,1}/{2}; at 3 factors {2}, M=1 and type {2} | Ramified and squarefree inputs covered | Headline unchanged |
| 1.3 monic degree guard | A=1; A=X²−2 | Degrees 0 and 2; M=0 and (at p=2)2 | Constant outside positive-degree theorem | Retained |
| 1.3 arithmetic orbit direction | Irreducible cubic X³+X+1/F₂ | Orbit u,u²,u²+u has length 3; exponent is 2, not inverse exponent 4 | Same convention as Frobenius suppliers | Added convention witness |
| 2.1 tuple field | Empty tuple; sqrt2; rational root 0 or 1 | Fields bottom; Q(sqrt2) of degree 2; bottom of degree 1 | Actual intermediate-field adjoin | Field API explicit |
| 2.1 generator inclusion | Selected root sqrt2 | sqrt2 belongs to Q(sqrt2), does not belong to Q | Larger wrong base field excluded | Supplied adjoin API |
| 2.1 universal property | E=Q versus Q(sqrt2) | Containment Q(sqrt2)≤E false/true, generator membership false/true | Both directions agree | Supplied adjoin API |
| 2.1 enlarging/reordering | Roots of X(X−1); roots ±sqrt2 | Rational adjoins remain Q; either quadratic order gives Q(sqrt2) | Same range gives same field | Supplied adjoin API |
| 2.1 quotient definition | f=2X(X−1), selected 0, empty tuple | Quotients 2(X−1) and f; divisors X and 1 | Division direction correct | Retained |
| 2.1 quotient factor identity | Same f, select 0 | [2(X−1)]·X=2X(X−1) | Nonmonicity allowed | API bullet form |
| 2.1 quotient degrees | Same f at j=0,1,2 | Degrees 2,1,0 equal 2−0,2−1,2−2 | No excessive tuple exists in separable case | API bullet form |
| 2.1 separability and complementary roots | f=X(X−1), select 0 or both | Quotient roots {1} or ∅, equal {0,1}\{0} or {0,1}\{0,1}; quotients X−1,1 separable | Unit endpoint included | API bullet form |
| 2.1 all-root quotient | Monic X(X−1), nonmonic 2X(X−1), constant 1 | Quotients 1,2,1 | Leading coefficient survives | Retained Check |
| 2.2 guarded higher irreducibility | f=X, k=0,1,2; f=1 | Values false,true,false; degree-zero polynomial false for every k | No empty-quantifier shortcut | Headline support unchanged |
| 2.2 one-fold iff | X and X(X−1) over Q | One-fold/irreducible true/true and false/false | Empty tuple recovers original polynomial | API bullet form |
| 2.2 monotonicity | X²−2, k=2,l=1; l=0 negative control | Two-fold and one-fold true; zero-fold false | Lower range 1≤l is necessary | API bullet form |
| 2.2 degree bound | Linear f, k=1 or 2 | 1≤1≤1 true; 2≤1 false | Guard explicitly excludes above-degree values | API bullet form |
| 2.2 cyclotomic Check | Phi11 over Q | Degree 10, root group C₁₀ order 10, point stabilizer order 1; remaining quotient 9 linears | One-fold true, two-fold false | Retained |
| 2.2 repeated polynomial Check | (X²−2)² | Degree 4, distinct-root count 2, separability false | Not one-fold despite transitive distinct roots | Retained |
| 2.3 tuple stabilizer equality | X²−2, j=0,1 | Stabilizer orders 2,1 equal fixing-subgroup orders 2,1 | Fixes actual generators | Retained |
| 2.3 normal restriction | X²−2, j=1 | Quotient linear, Galois group order 1; stabilizer order 1 maps onto it | Correct source and target | Retained |
| 2.4 multiple-transitivity iff | X²+X+1/F₂ at k=1,2; split quadratic k=1 | True/true, true/true; false/false | All characteristic/degree guards retained | Headline unchanged |
| 2.5 alternating recognition iff | Irreducible cubic X³−2; split cubic; degree 2 | k=1: true/A₃≤S₃ true; false/A₃≤1 false; n=2 would give k=0 but n≥3 fails | Both directions and subtraction endpoint agree | Headline unchanged |
| 3.1 discrete measurable instance | Partitions of 0 and 2 | Carrier sizes 1,2; measurable subset counts 2,4 | Every subset measurable | Added three Checks |
| 3.1 measurable maps and finite unions | Degree 2 singleton indicator | Indicator values 1,0; singleton preimage has size 1 and is measurable; union with complement has size 2 | Coarse two-set sigma algebra would fail | API explicit |
| 3.1 harmonic mass | False indicator; singleton 2 through 4; true through 2 | 0,1/2,3/2; cutoff 0 gives 0 | Positive inclusive endpoints | Retained |
| 3.1 zero/singleton API | a=2,m=4; a=5,m=4 | Mass 1/2=1/a in range; 0≠1/5 out of range | Both endpoint guards matter | API bullet form |
| 3.1 indicator monotonicity | Indicator 2 versus true through 4 | 1/2≤1+1/2+1/3+1/4=25/12 | Nonnegative summands | API bullet form |
| 3.1 cutoff monotonicity | Indicator 2, m=1 then 2 | 0≤1/2 | Nonnegative added term | API bullet form |
| 3.1 law parameter fields | C=1,t=1/2,κ=1,δ=1/10; t=0,1,κ=0 | Seven range fields true at first tuple; 0<t, t<1, 0<κ each false at respective excluded endpoint | Full parameter range encoded | Retained |
| 3.1 law pair field | n=8,k=l=2; partitions {2,2,4},{2,6} | Pair indicators 1,0; bound C/(2·2)=C/4 | Requires two occurrences | Retained |
| 3.1 law subsum field | n=4,δ=1/10 | Lower 4^(19/20)>2=upper; no admissible integer k | No spurious small-degree estimate | Retained |
| 3.1 law lower-tail field | Zero indicator; singleton 2, m=4 in range | Masses 0,1/2; event thresholds 0,t/2; RHS C,C exp(−κ/2) | Occurrence count, not weighted size count | Retained |
| 3.1 separate probability normalization | Zero measure; probability measure with zero indicator | ν(univ)=0 or 1, both compared to C≥1; zero measure total 0≠1 | Law does not assert normalization | Retained |
| 3.1 diagonal API | k=2,n≥8 | C/(k·k)=C/k²=C/4; count≥2 event unchanged | Direct specialization | API bullet form |
| 3.1 enlarging constant | C=1,D=2,k=l=2,L=0 | Pair RHS 1/4≤1/2; lower RHS 1≤2 | Correct weakening | API bullet form |
| 3.1 weakening κ | κ=1,κ'=1/2,L=2 | exp(−2)≈0.135335≤exp(−1)≈0.367879 | Correct direction | API bullet form |
| 3.2 E₁ occurrence condition | {2,2,4} versus {2,6}, n=8,κα=0 | First gcd 2<1 false; second has one eligible occurrence, no pair | False/true as specified | Retained proved example |
| 3.2 E₂ definition | {3,3},n=6,δ=2,r=2,j=1 | Subsum 3=6·1/2, so required inequality 3≠3 false | Definition tested beyond asymptotic range | Retained |
| 3.2 E₃ definition | n=1,α=0 | Interval [1,0] empty; threshold 0·log1=0; count 0≥0 | Totalized degree-one value correct | Retained |
| 3.2 E₄ definition | n=9, part 1 | Upper cutoff sqrt9/3=1; no prime divides 1, contribution 0 | Smooth unit excluded | Retained |
| 3.2 E₅ four occurrences | {1,2},n=3,α=1 | Interval [1/3,2.730718]; counts 1 for r=2, 2 for r≥3, both <4; each ≥1 | One witness differs from four | Retained proved example |
| 3.2 diagonal uniqueness | n=8,k=2,κα=0 | 1≤2≤2; duplicated occurrence would give gcd 2≥1 | E₁ forces count≤1 | API bullet form |
| 3.2 complement identity | {3,3}, U empty, singleton, whole | Complement sums 6,3,0 equal 6−0,6−3,6−6 | No good-event premise needed | API bullet form |
| 3.2 four-occurrence extraction | E₅ at r=2, versus {1,2} | Required count ≥4; countermodel has count 1 | Exactly four actual occurrences required | API bullet form |
| 3.3 first harmonic interval | n=16,α=1/40 | Interval empty, mass 0; main term −0.950467; error 0.950467 | Bounded-error statement, not exact finite identity | Retained |
| 3.3 nondivisible harmonic interval | Same n,α,r=2 | Mass 0; main term −0.440576; error 0.440576 | Uniform bounded-error form | Retained |
| 3.3 scaled endpoint | α=1/40,r≤n^α | Lower endpoint/r ≥n^(1−3/40)=n^(37/40) | Uniform growth survives largest r | Retained |
| 3.4 nonsmooth harmonic mass | Euler constant γ≈0.577215665 | 1/2−expγ/8≈0.277365948 >1/4; margin 0.027365948 | Positive logarithmic margin absorbs constant error | Supplier repaired |
| 3.4 smooth contribution and prime endpoint | Smooth integer 1; prime exactly at cutoff | 1 contributes reciprocal 1 to smooth sum, 0 to nonsmooth sum; endpoint prime is in inclusive Euler product | No omitted unit or endpoint | Retained |
| 3.5 large-gcd failure | δ=1/10,κ=1,θ=0 | κα=1/40; sum r⁻² above n^(1/40) has scale n^(−1/40), two harmonic factors give log² | Stated rate matches proof | Retained |
| 3.6 block-subsum failure | δ=1/10,r=4,j=1,2 | Coefficient 4^(1/10)+2^(1/10)≈2.220472; exponents −δ/2+δ/4=−1/40 | Correct all-divisor estimate | Supplier §0.9 retained |
| 3.6 divisor supplier | n=p^a, e.g. n=8 | τ(p^a)=a+1; τ(8)=4, squarefree formula would give 2 | Nonsquarefree integers covered | Retained |
| 3.7 long-part failure | κ=1,α=1/100,log n=10000 | L main term 100−log10000≈90.78966≥50; exp(−L)=10000 exp(−100) | Lower-tail event containment has correct direction | Retained |
| 3.8 large-prime failure | κ=1,L≥log n/4 | exp(−L)≤exp(−log n/4)=n^(−1/4) | Correct exponent independent of θ | Retained |
| 3.9 four-nondivisible failure | κ=1,α=1/40,r=2,3,large r | Decay exponents 1/40,1/30; large-r per-modulus 1/20 minus union count 1/40 gives 1/40 | Strengthened event preserves rate | Headline unchanged |
| 3.9 deterministic large-modulus case | Five distinct E₃ long parts, r≥n^(κα) | At most one divisible; 5−1=4 nondivisible | Four witnesses guaranteed | Retained |
| 3.9 failure threshold | Qualifying count 0,1,2,3 versus 4 | First four are ≤3, the last is not; eventually 3≤tL_r | Count threshold compatible with law | Retained |
| 4.1 minimum support | Trivial group; S₂,A₃,C₅,regular Q₈ | none; some 2, some 3, some 5, some 8 | Identity excluded, nonabelian case covered | API bullet form |
| 4.1 none iff bottom | Trivial versus S₂ | none/bottom true/true; some2=none false/G=bottom false | Both directions agree | API bullet form |
| 4.1 some iff attained lower bound | S₃,m=2 or 3 | 2 attained and ≤all supports; 3 attained but 3≤2 false at a swap | Attainment alone insufficient | API bullet form |
| 4.1 elementwise minimum bound | S₃ minimum 2, a 3-cycle | 2≤3; at a swap 2≤2 | Correct extraction | API bullet form |
| 4.1 no support-one value | S₂ and A₃ | Returned values 2≥2 and 3≥2; trivial group has none | No artificial zero minimum | API bullet form |
| 4.2 distinguisher definition | x=y; trivial group x≠y; full S₃ | Cardinalities 0,n,2; in S₃ set {x,y} | Trivial transport model excluded | API bullet form |
| 4.2 point-stabilizer equivalence | S₃,x=0,y=1,z=2 or 0 | At z=2 swap transports, membership false/same orbit true; at z=0 no transport, membership true/same orbit false | Negation direction correct | API bullet form |
| 4.2 symmetry | S₃,x=0,y=1 | D(0,1)=D(1,0)={0,1}, size 2 | Inverse transport | API bullet form |
| 4.2 support inclusion | S₃,g=(01),x=0 or 2 | D(0,1)={0,1}=support g; D(2,2)=∅⊆{0,1} | Fixed-point complement correct | API bullet form |
| 4.3 primitive orbital connectivity | Regular C₅, orbital (0,1) | Edges i↔i+1; 0→1→2 length 2; diagonal orbital instead has 5 singleton components | Non-diagonal pair essential | Retained |
| 4.4 Babai headline | C₅ versus S₂₅ | D=5≥sqrt5/2≈1.118034; symmetric D=2<sqrt25/2=2.5 but fails nondouble-transitivity premise | Necessary exception visible | Headline unchanged |
| 4.4 complement and average step | Directed generator orbital of C₅ | v=1; complement of symmetrized 5-cycle has diameter 2; vmax=1≤4−sqrt4=2; average D=5≥4>sqrt5 | Complement direction correct | Retained |
| 4.4 weighted-tree bound | Regular C₇ | Seven singleton suborbits; tree weight 6=n−1; vD=7≥6; 2(n−1)/3=4>7/4 | Incidence lower bounds agree | Retained |
| 4.5 Bochert headline | AGL₁(F₄₁); S₄₀ negative control | Minimum support 40≥41/4=10.25; S₄₀ minimum 2<10 but contains A₄₀ | Alternating exclusion matters | Headline unchanged |
| 4.5 commutator support inclusion | u=(01),v=(12) in S₃ | Δ={1}; Δ union uΔ union vΔ={0,1,2}; commutator support size 3=3card(Δ) | Left composition compatible | Retained |
| 4.5 conjugate incidence | AGL₁(F₄₁), minimal affine u, moved a | card(E)=40, fixing class size 1; proportions 1/40=(41−40)/40 and 39/40=(40−1)/40 | Counts distinct conjugates | Retained |
| 4.5 denominator and finite range | m=4,5,6,7,8,9,10 | 4m+6/(m−3)=22,23,26,59/2,166/5,37,286/7; first six <38; 6/7<1 | n≤4m by integrality after m≥10 | Retained |
| 4.6 primitive minimum headline | C₅; small-degree endpoint n=37 | m=5≥(sqrt5−1)/2≈0.618034; (sqrt37−1)/2≈2.541381<4 | Small branch avoids Bochert below 38 | Headline unchanged |
| 5.1 actual block orbit | Two blocks of size 3; within-block swap, block interchange, fixed point | (ell,r',s')=(2,1,2),(2,2,1),(1,1,1); union sizes 3,6,3 | Equal point-cycle lengths need not have same block orbit | Retained |
| 5.1 equal/disjoint block orbits | Quotient permutation (01)(23) | Orbits {0,1} and {2,3}; intersections size 2 if same, 0 if distinct | Actual orbit, not arbitrary divisor | Retained |
| 5.1 fixed-point cycle length | Identity at x | cycleOf support 0 plus fixed correction 1 gives period 1 | Omitting correction gives wrong 0 | Retained |
| 5.2 primitive exclusion | δ=1/10,κ=1,θ=0 | κα=1/40<1/8; at most 3 large parts times 8 primes gives 24; 25 eligible parts leave ≥1 | Unique part survives merging | Headline unchanged |
| 5.2 cycle-power isolation | Cycle lengths {6,5,4,1}, p=3 | a=1,q=20, exponent 20; 5,4,1-cycles die; 6-cycle becomes two 3-cycles, support 6 | Isolated power need not be one prime cycle | Retained |
| 5.2 support comparison | n=16; n>9 | sqrt16/3=4/3<3/2=(sqrt16−1)/2; difference generally (sqrt n−3)/6 | Strict inequality has correct threshold | Retained |
| 5.3 small block count | r=2,s=3,r'=1 | Invariant union size 3=6·1/2; occurrence-pullback sum 3 | Contradicts E₂ when parameter range applies | Headline unchanged |
| 5.3 middle block range | θ=0 or 3/100,δ=1/10,κ=1 | α=1/40 or 1/100; δ/2−α=1/40 or 1/25; δ/2−α−θ=α | Strictness comes from r>n^(δ/2), not final exponent comparison | Retained accepted correction |
| 5.3 large block range exponent | Same θ values | 1−3α−θ=37/40 or 47/50, each >κα=1/40 or 1/100 | Sufficient gcd lower power | Retained |
| 5.3 source of strict block-orbit bound | n=2^400,α=1/40,r=2^390,s=2^10,ell=2^380, filled union | r'=ell/s=2^370=n^(1−3α); ell divisible by s; selected nondivisible witness instead has s'<s and r'>ell/s | Endpoint alone permits equality; non-filling gives strictness | Clarified proof and added Check |
| 5.3 short-companion budgets | Five middle unions; four large unions | 5−1−3=1; 4−3=1; at most three cycles can exceed n/4 since 4·(>n/4)>n | Companion length ≤n/4 is justified | Retained |
| 6.1 generalized criterion | δ=1/10,ε=1/50,κ=1, θ=0 or 3/100 | Merge bound 1 at zero; decay exponents −1/40,−1/100=−κε/2 at endpoint | Uniform decay survives endpoint | Headline unchanged |
| 6.1 rate domination | Same parameters | κα=1/40 or 1/100≤δ/4=1/40 and κ/4=1/4; log exponent κ=1≤2 | Five failure rates fit final bound | Retained |
| 6.2 Galois certificate | A=X⁵−2, primes 2,3 | Root group order 20 versus 60,120; p2 factors five 1s,M=5, identity qualifies at y=5; p3 factors {1,4},M=1, affine 4-cycle qualifies | Witness lies in actual root-action image | Headline unchanged |
| 6.2 irreducibility guard | (X²−2)² | Distinct-root action transitive on 2 roots, but polynomial reducible of degree 4 | Certificate cannot use mere root transitivity | Retained |
| 6.2 event inclusion | X⁵−2,p=2,y=1 or 5 | At y=1, M>y is 5>1 true; at y=5 it is false, but bad merging witness exists | Union covers bad root group pointwise | Retained |

## Unresolved items

None. The precise Mertens and divisor targets are supplied by the named earlier roadmaps. The unchanged Lean file states every headline against the pins. All requested repository checks pass, the commit is present, the worktree is clean, and no build or helper process remains running.


Pull request: #1419 (roadmap/polynomial-galois-groups-part-ii at ca86510)
