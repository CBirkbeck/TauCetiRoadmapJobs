<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/171#issuecomment-6314386154 -->
Red team round 1 pass a (codex) of 54a5052

Verdict: needs_changes

1. **F01** (P3) Every Lean Check is admitted

   Location: `packages/PolynomialGaloisGroupsPartII/Suggested.lean:27`, and every subsequent `example` through line 224: “by sorry”.

   Claim: the examples test the definitions introduced by this roadmap.

   Witness: all 23 `example` declarations terminate in `sorry`; none supplies a proved test. `GoodEvent` additionally has three examples, exceeding the two-example limit.

   Exact repair text: “Replace admitted examples with proved discriminating examples, at most two per definition. Combine related checks within those examples. Promote any boundary assertion requiring future theory to a named theorem target in both files.”

2. **F02** (P1) The exact Mertens prerequisite has no admissible supplier contract

   Location: `packages/PolynomialGaloisGroupsPartII/README.md:230`: “`AN.2/mertens-prime-product` supplies an absolute `D`”.

   Claim: a roadmap named `AnalyticNumberTheory`, section AN.2, supplies the exact reciprocal prime-product estimate used by 3.4, 3.8 and 6.1.

   Witness: `merge-order/ORDER.txt:75` names `AnalyticNumberTheoryPartI`, and line 76 names Part II. Neither main roadmap tree contains `AnalyticNumberTheory`; the cited URL is an external blueprint. No matching supplier gap is declared.

   Exact repair text: “What AnalyticNumberTheoryPartI must provide (gap:mertens-prime-product): there exist real D ≥ 0 and x₀ ≥ 2 such that, for every real x ≥ x₀, |∏_{p prime, p ≤ x}(1−1/p)⁻¹ − exp(Real.eulerMascheroniConstant) log x| ≤ D.” Register the same slug, supplier, section and sentence in the design's top-level gaps; replace AN.2 citations by this contract, including the supplier's ownership of the constant-identification proof. If an actual current target is located, cite that exact target instead of registering a gap.

3. **F03** (P1) The divisor estimate cites a stale owner

   Location: `packages/PolynomialGaloisGroupsPartII/README.md:226`: “`AN.5/uniform-divisor-subpower-bound` supplies”.

   Claim: the all-positive-integer divisor estimate is supplied by `AnalyticNumberTheory`, AN.5.

   Witness: the current `TauCetiRoadmap/ErdosProgressionPowers/README.md:494` owns `eventualDivisorSubpower` in §0.9, for every positive real exponent and all sufficiently large natural integers, including nonsquarefree integers. ErdosProgressionPowers precedes this consumer.

   Exact repair text: “From ErdosProgressionPowers, §0.9, eventualDivisorSubpower: for each η > 0, τ(n) ≤ n^η eventually. Enlarging the constant over the finitely many positive exceptions gives D_η ≥ 1 with τ(n) ≤ D_η n^η for all n ≥ 1.” Replace AN.5 references in §3.6 and the layer dependency summary by this owner and finite-exception argument.

4. **F04** (P3) The declared library pins are not the input pins

   Location: `packages/PolynomialGaloisGroupsPartII/README.md:111` and line 156: “The library pin is Mathlib”; “The signatures use Tau Ceti”.

   Claim: the supplier contracts are against Mathlib `082e2d37…` and Tau Ceti `f7904748…`.

   Witness: `lake-manifest.json` pins Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; the latter already appears separately at README line 193.

   Exact repair text: “The library pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.” Use these consistently in both supplier subsections. The declarations inspected in this pass exist at these pins; this finding does not allege their absence.

5. **F05** (P3) Statable README Checks have no Lean mirror

   Location: `packages/PolynomialGaloisGroupsPartII/README.md:281`, and the Check blocks in §§0.2–4.2.

   Claim: the README Checks are represented by the suggested tests.

   Witness: no example states the forbidden `{2,3,6}` merging, empty merging at arbitrary bound, unit factor multiplicity, k=0 guard, k>degree guard, nonmonic quotient, harmonic zero/constant indicators, E₂ example, swap minimum, or diagonal distinguisher.

   Exact repair text: “Add proved mirrors for all statable Checks, combining assertions into at most two examples per kept definition. Include the omitted positive and negative cases listed in this finding, the full 5-cycle membership tests, and the one-root/adjoin field comparisons.” For a Check whose proof requires future work, replace it by a named README/Lean theorem target rather than an admitted example. This is separate from R01: proving the current examples alone leaves these Checks absent.

6. **F06** (P3) The harmonic Check does not detect a zero starting index

   Location: `packages/PolynomialGaloisGroupsPartII/README.md:664`: “starting the reciprocal sum at zero would violate this normalization.”

   Claim: the value 3/2 for the constant-true indicator through two rejects an implementation summing from zero.

   Witness: in ℝ, 0⁻¹ = 0; hence ∑_{k=0}² (k:ℝ)⁻¹ = 0+1+1/2 = 3/2 as well. The proposed wrong implementation passes this Check.

   Exact repair text: “The constant-true indicator through two gives 3/2, testing reciprocal weights and the inclusive upper endpoint. The exclusion of zero is a domain convention; total real inversion makes adding the zero term numerically invisible.” Keep the value test but remove its claimed negative control.

7. **F07** (P2) Two easy Layer 4 headline signatures are omitted

   Location: `packages/PolynomialGaloisGroupsPartII/README.md:956` and line 1007; `packages/PolynomialGaloisGroupsPartII/Suggested.lean:226`.

   Claim: Layer 4 develops `babai_distinguishers` and `bochert_minSupport`, but Suggested.lean contains only their weaker combined consequence.

   Witness: both headlines use existing `Subgroup`, `IsPreprimitive`, `IsMultiplyPretransitive`, finite cardinalities, and the file's real-bodied `orbitalDistinguishers`/`minSupport`; no new carrier or forced encoding is needed.

   Exact repair text: insert these signatures, with mathematical docstrings, before `primitive_minSupport`:

   ```lean
   theorem babai_distinguishers (G : Subgroup (Equiv.Perm α))
       (hp : IsPreprimitive G α)
       (h2 : ¬ IsMultiplyPretransitive G α 2)
       (hn : 5 ≤ Fintype.card α) (x y : α) (hxy : x ≠ y) :
       Real.sqrt (Fintype.card α) / 2 ≤
         (orbitalDistinguishers G x y).card := by sorry

   theorem bochert_minSupport (G : Subgroup (Equiv.Perm α))
       (h2 : IsMultiplyPretransitive G α 2)
       (ha : ¬ alternatingGroup α ≤ G)
       (hn : 38 ≤ Fintype.card α) {m : ℕ}
       (hm : minSupport G = some m) :
       (Fintype.card α : ℝ) / 4 ≤ m := by sorry
   ```

8. **F08** (P3) The source manifest is missing

   Location: `packages/PolynomialGaloisGroupsPartII/README.md:1335` (References); missing `packages/PolynomialGaloisGroupsPartII/sources.toml`.

   Claim: four legally accessible works provide the package's source contracts.

   Witness: the package has no sources.toml. All four listed versions were fetched successfully through the sources service during this pass, including Babai's author-hosted PDF via HTTP after its HTTPS certificate failed.

   Exact repair text: “Create sources.toml with schema tauceti-roadmap-sources/v1 and entries for BSKK (2007.14567v3), Babai (2018 author exposition), Schomburg (2209.12049v1), and Bary-Soroker–Kozma (1710.05165v2), recording authors, title, year, locators, cited_for and the service's provenance/hash/licence/status fields.” Do not embed cached text or local paths.

9. **F09** (P3) The fifth-event Check cannot distinguish four witnesses from one

   Location: `packages/PolynomialGaloisGroupsPartII/README.md:717`; `packages/PolynomialGaloisGroupsPartII/Suggested.lean:186`.

   Claim: failure in degree three at α=0 tests the requirement of four rather than one qualifying occurrence.

   Witness: the interval is [3, 3/log 3], which is empty because log 3 > 1. Every partition fails the one-witness variant too; the Check does not detect that mutation.

   Exact repair text: “For the partition {1,2} of three at α=1, the one-witness variant holds for every r ≥ 2, since the part 1 qualifies and r does not divide 1; E₅* fails because there are only two occurrences.” Replace the corresponding Lean conjunct by a proved test of both assertions. Definitions allow these parameters even though the asymptotic theorem does not.

10. **F10** (P3) The discrete-measurability instance lacks its declaration contract

   Location: `packages/PolynomialGaloisGroupsPartII/Suggested.lean:127`: “local instance partitionMeasurableSpace”.

   Claim: the file records documented declarations whose Lean names also appear in the README.

   Witness: `partitionMeasurableSpace` has no docstring and its name does not occur in README.md, although the discrete-measure convention itself is described there.

   Exact repair text: add `/-- The finite partition carrier has the discrete measurable structure. -/` immediately before the instance, and change the README convention to “Partition measures use the discrete measurable structure `partitionMeasurableSpace`.”

11. **F11** (P2) The parent roadmap's Dedekind ownership boundary is misstated

   Location: `packages/PolynomialGaloisGroupsPartII/README.md:26`: “Its Layer 5 owns the unramified equality of factor degrees and Frobenius cycle lengths”.

   Claim: PolynomialGaloisGroups Layer 5 owns that arithmetic equality.

   Witness: `TauCetiRoadmap/PolynomialGaloisGroups/README.md:1056` explicitly assigns the theorem to NumberFieldArithmetic §3.10. Its hypothesis is p not dividing the polynomial discriminant; field unramifiedness alone is insufficient (same file, line 1136).

   Exact repair text: “NumberFieldArithmetic, §3.10, owns the factorization/cycle-type equality for monic integral polynomials at primes not dividing their polynomial discriminant. PolynomialGaloisGroups, Layer 5, imports it and owns the factor-degree carrier and polynomial membership adapter.” The implemented supplier is `TauCeti.NumberField.exists_gal_fullCycleType_eq_factorizationType` in `TauCeti/NumberTheory/NumberField/Frobenius/CycleType.lean:164`; cite that pinned declaration if the equality is consumed.

## Verified sound

Read all 1,361 README lines and all 291 Suggested.lean lines, plus the repository rules. Counts: **47 explicit Lean declarations** (12 definitions/abbreviations/structures, one local instance, 11 named theorems, 23 examples); **32 numbered README target groups**, including their named API consequences; **41 Check bullets tested mathematically**; **20 source-locator groups verified across four works**. There are no bold mathematical target headings; the numbered groups are inventoried below instead. The 10 PartitionLaw fields were checked individually: seven parameter bounds and the pair, subsum and lower-tail premises.

Supplier checks: **six roadmap contract claims** checked (PolynomialGaloisGroups Layers 0, 1, 5, 9 and the two asserted analytic contracts); all four specified sibling heads were searched, and **ErdosProgressionPowers §0.9** was inspected as the replacement divisor supplier. NumberFieldArithmetic §3.10 and its pinned implementation confirm R11. No upward supplier or cycle was identified. No forced headline or false named theorem signature was found. This does not certify Lean elaboration or discharge the missing analytic supply.

The git diff contains only the package's README.md, Suggested.lean, metadata.toml and review.json (four files, 1,661 insertions). The only review-created repository file is this report. No builds, git writes, posts, package edits, `set_option`, admitted data definitions, `lemma` declarations, or computational-algorithm specifications were used or found in the reviewed package, as applicable.

The requested dependency command returned exit code 0 and exactly:

```text
depcheck: 5 roadmaps, 27 edges, 0 problem(s)
```

That syntactic result does not validate the nonexistent analytic supplier names; R02–R03 remain actionable. No move from a later supplier was required.

The local library checkouts were clean and their HEADs equal the manifest pins. Read supplier declarations include `Polynomial.Gal.restrict_surjective`, `galActionHom_injective`, `Ideal.exists_maximal_ideal_liesOver_of_isIntegral`, the polynomial root-multiplicity formulas, multiple-transitivity recursion/alternating recognition, primitive swap/3-cycle recognition, harmonic bounds and the Euler-constant bound; Tau Ceti full cycle types, factor degrees, Frobenius lifts/orbits, root-orbit irreducibility, simple-root stabilizers, monic quotients, cycle powers and semiconjugate fibre arithmetic. Object searches found no duplicate of the new merging, law, higher-irreducibility, minimum-support or distinguisher definitions. Additional existing analytic inputs are `sum_Ioo_inv_sq_le` in `Mathlib/Analysis/PSeries.lean:406` and `EulerProduct.summable_and_hasSum_factoredNumbers_prod_filter_prime_geometric` in `Mathlib/NumberTheory/EulerProduct/Basic.lean:297`; neither supplies the missing Mertens asymptotic.

**Declaration inventory and binder audit.**

Context key: `A` means `{α : Type*} [Fintype α] [DecidableEq α]` from line 32; `F` means `{F : Type*} [Field F] (f : F[X])` inside `Higher`. The generic type variables are universe-polymorphic; unused global variables are absent from declarations. The partition measure instance is fixed to `⊤`, not an arbitrary σ-algebra. Named hypotheses in admitted theorem signatures are explicit. No elaborated-type output is claimed.

| Lean line | Layer | Declaration | Variable/instance context | Instances tried | Result/change |
|---|---|---|---|---|---|
| 22 | 0 | def EqualPartMerging | y:ℝ; a,b:Multiset ℕ | empty/zero entries; bounds below1 and below2 | Real body; occurrence-sensitive |
| 27 | 0 | example: permitted merging | closed | two of three 2-occurrences combined | True; R01 |
| 29 | 0 | example: nontransitivity | closed | {1,1,2}→{2,2}→{4} | True; R01 |
| 34 | 0 | def MergePerms | A; n:ℕ; y:ℝ; ρ:Partition n | identity, empty carrier, mismatched degree | Real body; no degree assumption hidden |
| 37 | 0 | example: identity merging | A; ρ:Partition(card α) | all 1-parts, including card0 | True; R01 |
| 41 | 0 | example: empty merging | σ:Perm(Fin0) | unique empty partition | True; R01 |
| 45 | 0 | def BadTransitive | own α:Type*; Fintype; DecidableEq | degrees0–3; regular C5 | Real body; existential union, not subgroup |
| 49 | 0 | example: BadTransitive empty | n:ℕ; n≤3 | n=0,1,2,3 | True; R01 |
| 51 | 0 | example: identity bad | closed | C5 subgroup | True; R01 |
| 53 | 0 | theorem equivariant_cycle_fibres | A; β finite/decidable; σ,ψ,r; surjective/equivariant; d,m>0; fullCycleType ψ={d}; fibres size m | d=1,3; m=1,2 | Mathematically sound; all hypotheses explicit |
| 62 | 1 | def maxFactorMultiplicity | F:Type*; Field F; f:F[X] | zero, unit, repeated factor, equal degrees | Real body; empty supremum0 |
| 65 | 1 | example: zero multiplicity | closed F2 polynomial | f=0 | True; R01 |
| 67 | 1 | example: repeated/distinct factors | closed F2/F3 polynomials | exponents3 and1 | True; R01 |
| 70 | 1 | theorem ramified_merging | A:Z[X]; monic; Q-separable; positive degree; p:ℕ; Fact p.Prime | X²−2,p=2; linear; constants excluded | Mathematically sound; ramification allowed |
| 84 | 2 | abbrev TupleRootField | F; j:ℕ; x:Fin j↪rootSet | j=0,1,n; rational and irrational roots | Actual intermediate-field adjoin |
| 87 | 2 | example: empty tuple field | F; x:Fin0↪rootSet | arbitrary f including0 | True; R01 |
| 90 | 2 | def tupleRootQuotient | F; j:ℕ; root embedding x | j=0; all roots; nonmonic f | Real monic-division body; no separability assumed by definition |
| 96 | 2 | example: empty quotient | F; empty embedding | all f including0 and constants | True; R01 |
| 100 | 2 | example: all-root quotient | F; monic/separable f; embedding of Fin(natDegree f) | monic constant1; linear; split quadratic | True; R01 |
| 103 | 2 | def IsKFoldIrreducible | F; k:ℕ | k=0, k>n, inseparable f, linear f | Real guarded predicate |
| 108 | 2 | example: Phi11 | closed polynomial over Q | k=1,2 | True; R01 |
| 111 | 2 | example: repeated quadratic | closed polynomial over Q | separability fails | True; R01 |
| 114 | 2 | theorem kfold_iff_multiplyPretransitive | F; k; f.Separable; 0<degree; 1≤k≤degree | n=1,2,3; characteristic2 separable | Mathematically sound; no disappearing section hypothesis |
| 120 | 2 | theorem kfold_degree_sub_two | F; f.Separable; degree≥3 | cubic irreducible/split; degree2 excluded | Mathematically sound on faithful image |
| 127 | 3 | local instance partitionMeasurableSpace | n:ℕ | n=0,1; finite discrete carrier | Real body; R10 |
| 130 | 3 | abbrev harmonicMass | f:ℕ→Bool; m:ℕ | m=0; zero/constant/singleton indicator | Real sum; zero-start mutation invisible (R06) |
| 133 | 3 | example: harmonic singleton | closed | indicator2 through4 | True; R01 |
| 136 | 3 | structure PartitionLaw | n; ν:Measure(Partition n) with fixed discrete instance; C,t,κ,δ:ℝ | zero and infinite measures; two occurrences; empty indicator | 10 explicit fields audited; normalization intentionally separate |
| 154 | 3 | example: lower-tail singleton | n,ν,C,t,κ,δ; law; 4≤n/log n | count2 and reciprocal1/2 | True; R01 |
| 158 | 3 | example: diagonal pair | n,ν,C,t,κ,δ; law; n≥8 | {2,2,4} vs {2,6} | True; R01 |
| 163 | 3 | def GoodEvent | i:Fin5; n; t,κ,δ,α:ℝ | all five indices; arbitrary parameters; n=1,3,6,8 | Real sets; last branch corresponds only to index4 |
| 180 | 3 | example: repeated small part | ρ:Partition8; parts={2,2,4} | gcd2≥8^0 | True; R01 |
| 183 | 3 | example: single small occurrence | ρ:Partition8; parts={2,6} | no two small occurrences | True; R01 |
| 186 | 3 | example: small-degree events | closed universal partitions1,3 | log1=0; degree3 interval empty | True values; weak negative control R09; R01 |
| 189 | 3 | theorem nonsmooth_harmonic_mass | no section parameters; ∃N≥3 before n | smooth integer1; large prime cutoff | Mathematically sound; supplier gap R02 |
| 197 | 3 | theorem four_nondivisible_parts_failure | C,t,κ,δ,ε; 0<ε<δ/2; ∃B,N before n,ν,θ; probability and law explicit | θ endpoints; r=2 and large r | Uniform proof sound; ranges supplied by law |
| 207 | 4 | def minSupport | A; G≤Perm α | G=bottom; card0,1; S2; A3 | Real Option body; nonempty infimum attained |
| 212 | 4 | example: empty minimum | closed | top on Fin0 | True; R01 |
| 214 | 4 | example: alternating minimum | closed | A3 nonidentity 3-cycles | True; R01 |
| 217 | 4 | def orbitalDistinguishers | A; G≤Perm α; x,y:α | x=y; bottom; top; C5 | Real finset via classical decidability |
| 220 | 4 | example: trivial group | A; x≠y | all points distinguish | True; R01 |
| 223 | 4 | example: symmetric group | A; x≠y | two-point carrier and larger | True; R01 |
| 227 | 4 | theorem primitive_minSupport | A; G primitive; G≠Aα,top; card≥5; minSupport=some m | degree5–37; n≥38; trivial group excluded | Mathematically sound; hypotheses explicit |
| 234 | 5 | theorem primitive_exclusion | t,κ,δ,ε; t>0; 0<κ≤1; 0<δ≤1/10; 0<ε<δ/2; ∃N then n,θ,ρ,G | θ=0 and upper endpoint; p-power cycles | Mathematically sound; no t<1 needed |
| 245 | 5 | theorem imprimitive_exclusion | same real ranges; ∃N then n,θ,ρ,G; all five events; pretransitive/not preprimitive | three block-count ranges; cutoff equalities | Mathematically sound; four/five witnesses fix short-companion issue |
| 256 | 6 | theorem generalized_luczak_pyber | same law quantifier order as line197; probability and law explicit | vary ν with n; θ endpoint; invalid law parameters vacuous | Mathematically sound conditional on analytic supply R02/R03 |
| 267 | 6 | theorem galois_merging_certificate | A monic; Q-separable/irreducible; p prime; y≥multiplicity; image≠alternating,top | ramified p=2; reducible polynomial rejected | Mathematically sound; root image itself is witness |

**Adversarial mathematics pass.**

| Section | Statements/API | Instances tried | Result | Change |
|---|---|---|---|---|
| 0.1 | EqualPartMerging; refl, mono, sum_eq, eq_of_lt_two, pullback_submultiset | y<0, y=0,1,2; empty; zero entries; {1,1,2}; output repeated sums | Singleton blocks force equality below 2; mixed entries cannot form one block; pullback must select occurrences. Checks true. | R01/R05 |
| 0.2 | MergePerms; mem_mergePerms, mergePerms_mono/card/conj/permCongr | empty carrier; identity; 5-cycle; partition degree different from carrier | Full-cycle sum forces degrees equal, including zero; conjugation preserves every 1-part. | R01/R05 |
| 0.3 | BadTransitive; mem_badTransitive, badTransitive_witness/conj/permCongr | degrees 0,1,2,3; C5 identity and generator | Only A/S in degrees ≤3; C5 witnesses degree-five membership even for an even permutation. | R01/R05 |
| 0.4 | equivariant_cycle_fibres | d=1,m=1,2; d=3,m=2; empty quotient excluded | Return-orbit sizes partition a fibre: {1,1}/{2}, {3,3}/{6}; sum of sizes is m. README conclusion stronger than compact merging statement but proof supplies it. | None |
| 1.1 | maxFactorMultiplicity; zero, unit, count_le, le_iff, eq_one_iff | 0,1; (X+1)^3 over F2; X(X−1) over F3 | Counts 0,0,3,1; zero and unit guards in squarefree iff are necessary. | R01/R05 |
| 1.2 | fibre_card_eq_rootMultiplicity | empty S; identity map; Z→F2 on {0,2}; zero source ring | Multiplicities 0, single-root indicator, and 2; hom from zero ring to a field has no instance. | None |
| 1.3 | ramified_merging | X−a; X²−2 at p=2; squarefree reduction; A=1; inseparable Q image | Ramified fibre collision gives {1,1}→{2}; constant excluded, repeated Q polynomial excluded; Frobenius lift requires no unramifiedness. | None |
| 2.1 | TupleRootField, tupleRootQuotient; factor, natDegree, separable; splits/complement conclusions | j=0,1,n; X²−2; X(X−1); 2X(X−1); positive characteristic separable f | Fields are actual adjoins; all-root quotient is leading coefficient, not always 1; selected distinct linear factors divide f. | R01/R05 |
| 2.2 | IsKFoldIrreducible; one_iff, mono, degree_bound | k=0,k>n,n=0,1; Phi11; repeated quadratic; inseparable X^p−t | Guards reject vacuity/inseparability; linear k=1 works; Phi11 fails k=2. | R01/R05 |
| 2.3 | tuple_stabilizer_eq_fixingSubgroup; quotient restriction/action identification | empty tuple; one root; inseparable original polynomial for stabilizer equality | Fixing generators equals fixing adjoin without separability; normality over intermediate field gives restriction surjectivity in separable quotient use. | None |
| 2.4 | kfold_iff_multiplyPretransitive | n=1,k=1; n=2,k=1,2; finite-characteristic separable f; k>n excluded | Stabilizer on complement has n−j roots and is transitive iff quotient irreducible; no monicity needed. | None |
| 2.5 | kfold_degree_sub_two | irreducible/split cubics; degree-two exclusion; characteristic 2 separable cubic | n=3 gives irreducibility iff A3 containment; n=2 explicitly excluded; index-two argument concerns permutations, independent of field characteristic. | None |
| 3.1 | harmonicMass, zero/singleton/monotonicity API; PartitionLaw, pair_diagonal, enlarge_constant, weaken_kappa | m=0; zero/constant/singleton indicators; n=8 diagonal; zero measure; infinite measure | Reciprocal values correct; diagonal counts two occurrences; normalization is explicitly separate, so probability theorem cannot silently use infinite mass. | R01/R05/R06/R10 |
| 3.2 | GoodEvent; one_diagonal, two_complement, five_four | {2,2,4}/{2,6}; n=1; n=3,alpha=0; {3,3},delta=2; empty submultiset | Gcd tests distinguish repeated occurrence; complement sum correct; n=3 interval empty, so four-vs-one test fails to discriminate. | R01/R05/R09 |
| 3.3 | anatomy_harmonic_masses | alpha=epsilon/2,1/40; r=2 and r≤n^alpha; inclusive integer endpoints | Uniform lower endpoints grow at least n^(1−3alpha); harmonic errors bounded; epsilon>1/20 leaves alpha range empty but statement remains true. | None |
| 3.4 | nonsmooth_harmonic_mass | integer 1; empty prime product; prime 2 endpoint; large n | Subtract smooth mass ≤ Euler product; coefficient 1/2−exp(gamma)/8 exceeds 1/4. Source inequality corrected, not copied as false equality. | R02 |
| 3.5 | pair_gcd_failure | k=l; gcd threshold ≥2; alpha=epsilon/2 | Diagonal pair field applies; reciprocal-square tail gives n^(−kappa alpha); uniform positive lower exponent handles threshold. | None |
| 3.6 | block_subsum_failure | r=2,j=1; j>r/2; r divides n; n prime | Complement fixes range; all sums integral; divisor exponent delta/4 provides target decay. | R03 |
| 3.7 | long_parts_failure | theta=0; theta=delta/2−epsilon; strict event complement | alpha stays ≥epsilon/2, so tL eventually dominates alpha t log(n)/2 uniformly. | None |
| 3.8 | large_prime_parts_failure | p=2 finite small degrees; floor(sqrt(n)/3); uniform theta | Finite small degrees excluded by N; lower-tail premise uses L≥log(n)/4. | R02 |
| 3.9 | four_nondivisible_parts_failure | r=2,3; r≈log n; r≥n^(kappa alpha); theta endpoint | Five E3 witnesses leave four for large r; small-r lower tails allow cutoff 3; three-range union preserves the stated log² rate. | None |
| 4.1 | minSupport; eq_none, eq_some, le, two_le | trivial group; degree0,1,2; A3; C5 | None, none, some2, some3, some5 respectively; nonidentity supports never have size1. | R01/R05 |
| 4.2 | orbitalDistinguishers; mem, symm, subset_support | x=y; trivial group; S2; Sn; regular C5 | Empty, all points, endpoints, endpoints, all points; inverse transport proves symmetry; fixed points of g cannot distinguish x,gx. | R01/R05 |
| 4.3 | orbital_walk_connectivity; transport incidence infrastructure | regular C5; S5; singleton carrier; diagonal pair excluded | Non-diagonal orbital components are blocks; singleton carrier cannot supply x≠y. | None |
| 4.4 | babai_distinguishers | C5; primitive rank>2; full Sn excluded; paired/self-paired orbitals | Complement and diameter-two branches distinct; spanning tree weights count ordered pairs at least once; support bound follows from moved point. | R07 |
| 4.5 | bochert_minSupport | m=n; m=2,3 excluded; m=4,…,9; n=38; m=10 | Incidence fractions are over distinct conjugates; m−3>0; 4m+6/(m−3)≤37 for m≤9; integer rounding then yields n≤4m. | R07 |
| 4.6 | primitive_minSupport | C5; n=5,…,37; n≥38; A/S excluded | Small degrees use m≥4, not unsupported Bochert; n/4 dominates (sqrt(n)−1)/2; no artificial trivial-group minimum. | None |
| 5.1 | block_orbit_cycle_divisibility; invariant union and equal/disjoint orbit assertions | two blocks of3; internal swap; block swap; fixed point | Same length2 can project to period1 or2; fixed point has length1 despite empty cycleOf support. | None |
| 5.2 | primitive_exclusion | theta endpoints; k having p-adic exponent>1; at most3 long parts | Prime p exceeds both merging bound and gcd cutoff; power kills all other cycles and retains exactly k moved points, without claiming one p-cycle. | None |
| 5.3 | imprimitive_exclusion | small/middle/large r; theta=0,kappa=1 equality; companion >n/4 | Five middle unions survive one filled plus3 long exceptions; four largest unions survive3 long exceptions; every invoked gcd pair has two actual small occurrences. | None |
| 6.1 | generalized_luczak_pyber | theta=0 and delta/2−epsilon; law varying with n; zero mass rejected as probability | Constants chosen before n,nu,theta; finite union; kappa alpha≤delta/4 and ≤kappa/4. True modulo owned analytic prerequisite. | R02/R03 |
| 6.2 | galois_merging_certificate; coefficient-event inclusion | irreducible cubic makes bad premise impossible; Phi11 permits bad group; repeated/reducible polynomial excluded; p=2 ramification | Irreducibility ensures positive degree/transitivity; root image witnesses BadTransitive; exceptional failure events are stated for unrestricted samples. | None |

**Source locator audit.**

| Source | Locator group | Verified extraction locator | Result |
|---|---|---|---|
| BSKK | Introduction p.5, higher irreducibility | line 200; line 213 | Arbitrary-field extension and degree guards are roadmap additions, explicitly identified. |
| BSKK | Equation (11.1), p.54 | line 3323 | Existential union of proper transitive witness groups. |
| BSKK | Definition 11.2/example, p.56 | line 3490 | Disjoint occurrence blocks and bounded equal-value merging. |
| BSKK | Lemma 11.3, pp.56–57 | line 3498; line 3508 | Monic squarefree characteristic-zero polynomial; every prime. |
| BSKK | Claim 11.4, p.57 | line 3535 | Top orbit length is bottom period times fibre return size. |
| BSKK | §11.3, pp.57–58 | line 3544 | Bad-group certificate and repeated-factor exceptional event. |
| BSKK | Proposition 12.1, p.59; proof p.63 | line 3611; line 3900 | All three premises, parameter ranges and uniform exponent match. |
| BSKK | Lemmas 12.2–12.6, pp.59–61 | line 3653; line 3673; line 3701; line 3717; line 3751 | Four witnesses are a stated strengthening; the source only asks for one. |
| BSKK | §12.2 notation, p.61 | line 3819 | Merge sets and minimum degree; Option convention is local. |
| BSKK | Lemmas 12.7–12.9, pp.62–63 | line 3826; line 3829; line 3855 | Cutoff direction at source line3836 is corrected; short companions are justified by added witnesses. |
| babai | §§3–4, pp.4–5 | line 115; line 121; line 133; line 144 | Orbitals give coherent incidence counts and primitive connectivity. |
| babai | Definition 6.1 / Exercise 6.2, pp.5–6 | line 160; line 167 | Distinguisher and stabilizer-orbit convention agree. |
| babai | Theorem 6.6, p.6 | line 178 | Square-root lower bound for uniprimitive distinguishers. |
| babai | §8, Lemma8.5 through Lemma8.9, pp.7–8 | line 222; line 230; line 241 | Complement diameter and average distinguisher estimates. |
| babai | §8, Lemma8.10 through Corollary8.19, pp.8–9 | line 251; line 260; line 274; line 302 | Path bound and weighted suborbit argument. |
| babai | Exercise9.5 / Corollary9.6, p.10 | line 335; line 337 | Distinguisher lower bound controls support. |
| schomburg | Equation(2.1), pp.1–2 | line 31; line 39 | Commutator support inclusion, with multiplication convention. |
| schomburg | Lemmas2.3–2.5, pp.3–4 | line 76; line 88; line 95 | Distinct-conjugate incidence counting and stabilizer fractions. |
| schomburg | Theorem3.1/proof, pp.4–5 | line 120; line 122; line 147 | Noncontainment of alternating, n≥38, m≥n/4. |
| bary-soroker-kozma | §3.1 Claim1/proof, pp.9–10 | line 438; line 444 | Two primitive branches; roadmap supplies degree-restricted Bochert proof separately. |

## Not verifiable

- Lean elaboration, generated declarations and elaborated `#check @name` types were not run: the brief prohibits Lean builds and supplies no permitted elaboration command. Binder conclusions above are inspection of source signatures, not compiler output. All current examples are admitted.
- No admissible current `AnalyticNumberTheory/AN.2` or `AN.5` contract is available in the provided main/sibling trees. The external blueprint cannot establish ownership under the allowed-supplier rule. R02 specifies an exact gap contract; R03 points to the supplied current sibling head.
- No cited mathematical text remains unreadable. All four reference versions were retrieved legally through the sources service. The Babai HTTPS failure was resolved through the same author's HTTP URL; no missing-reference request is needed.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "54a5052b83ceca9b2b6e8ebfc7732f939d949614", "job": "RT-PolynomialGaloisGroupsPartII~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
