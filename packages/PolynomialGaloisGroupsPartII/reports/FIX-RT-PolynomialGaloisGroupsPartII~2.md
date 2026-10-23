# Repair report

Finding numbers are local to each review. The first four finding sections address
pass a; the final two address pass b. Overlaps are settled once, with a separate
verdict below for every finding. Changes are confined to
`packages/PolynomialGaloisGroupsPartII/README.md`,
`packages/PolynomialGaloisGroupsPartII/Suggested.lean`, and this report.

## F01 (P3) — applied

Pass a F01. The 45 subsidiary theorems and 15 routine examples → README prose specifications
and Checks. All thirteen headline theorems, thirteen supporting definitions,
abbreviations, structure and instance, and three nontrivial proved examples remain.
All deleted identifiers leave the README, including the occurrence-pullback consumer
in §5.3. No theorem hypothesis or mathematical target is weakened.

## F02 (P2) — not actionable in this package: a re-raised supplier-gap decision requires a human

Pass a F02. AnalyticNumberTheoryPartI §0.26 does state the bounded-error product and coefficient
identification: its README lines 596–598 match the registered gap. However, this
re-raises round-one a F02's not-actionable decision, which the brief reserves for
a human. The gap and `design/plan.json` remain unchanged; removing them requires
that decision. The mathematical evidence supports the review's proposed replacement.

## F03 (P3) — applied

Pass a F03. The nonexistent divisor declaration identifier → the eventual divisor-subpower
bound in ErdosProgressionPowers §0.9. Its supplied-head README lines 514–517
state the required all-integer eventual bound, including nonsquarefree inputs;
neither mathematical file declares the old name. Updated Scope, Exact supplier
contracts and §3.6; the Layer 3 dependency citation remains §0.9.

## F04 (P3) — applied

Pass a F04. Undeclared local API identifiers → prose specifications throughout §§0.1–5.3,
including fibre cardinality, tuple stabilizers, harmonic intervals, individual
failure bounds, orbital connectivity and block arithmetic. The acceptance-file
opening → an explicit thirteen-headline inventory with all carriers statable.
The README opening now describes that acceptance contract. All hypotheses,
source locators, API facts and Checks are retained.

## F01 (P3) — applied differently

Pass b F01. The eleven easy admitted targets are deleted as part of a F01; their statements
remain README API or Checks. The brief requires deletion rather than replacing
admissions with elementary proofs. The witnesses are valid: conjugacy and relabeling
reduce to pinned full-cycle invariance, the witness constructor is existential
introduction, and the maximum-bound equivalence is finite-supremum elimination.

## F02 (P3) — applied

Pass b F02. The same three stale divisor-name occurrences → ErdosProgressionPowers §0.9's
prose contract, as recorded under a F03. The finite-exception extension still
uses the maximum of 1 and the positive exceptional ratios τ(n)/n^η. For n=p^a,
the numerator is a+1, so prime powers remain covered without a squarefree
restriction.

## Checks and signature audit

- Acceptance-file elaboration, using the required absolute argument from the pinned
  content checkout: exit 0; exactly thirteen `declaration uses sorry` warnings;
  no errors or other diagnostics. Both used Tau Ceti module objects were present;
  no build was needed. The file has 29 explicit declarations: thirteen headlines,
  thirteen supporting definitions/abbreviations/structure/instance, and three proved
  examples. Every headline has `sorry`; no example does.
- A single completed scratch signature audit elaborated the final file followed by
  `#check @name` for all 26 named declarations, including the local measurable-space
  instance, and all ten `PartitionLaw` field projections: exit 0, thirteen expected
  warnings and all 36 requested types. Every type was compared with its README
  specification. No binder disappeared; no binder changes were needed. An initial
  scratch-file preparation used the wrong working directory and produced no file;
  its subsequent Lean invocation failed for that missing input. Correcting the
  preparation yielded the successful audit above.
- Dependency check, with the required order and `--movable`: exit 0. Its complete
  output was:

```text
depcheck: 15 roadmaps, 104 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line.

- Citation resolution: exit 0, no unresolved cross-roadmap citations and no
  unresolved Lean names. The resolver said it did not check external Lean names
  because it found no pinned Lake packages at its own search location. Those
  library names were therefore checked directly in the supplied pinned checkouts,
  as detailed below; that resolver limitation is not evidence of absent libraries.
- Final `git diff --check`: exit 0. Inventory, six verdicts, README/Lean name
  agreement and machine-path checks passed. Metadata, the source manifest and
  `design/plan.json` are unchanged.
- The three initial citation leads, the occurrence-pullback, one-fold equivalence
  and diagonal-pair local identifiers, are all prose now. There were no separate
  gate failures listed in the brief.

## Source, ownership and library evidence

The four existing certified source entries were used under their existing keys;
no new source, waiver or missing-reference request was needed. The mathematical
pass used these legal cached passages, with the manifest's version numbering:

| Targets | Source evidence |
|---|---|
| Higher irreducibility and the cyclotomic contrast | bskk line 200–216, p.5 |
| Bad-transitive union | bskk line 3323, equation (11.1), p.54 |
| Equal-part relation, allowed and forbidden merging | bskk line 3490–3497, Definition 11.2, p.56 |
| Any-prime specialization, collisions, return-cycle lengths | bskk line 3498–3543, Lemma 11.3 and Claim 11.4, pp.56–57 |
| Pointwise arithmetic inclusion | bskk line 3544–3551, §11.3, p.57 |
| Partition-law hypotheses, rates and uniform parameter range | bskk line 3611–3650, Proposition 12.1, p.59 |
| Pair and subsum failure estimates | bskk line 3653–3700, Lemmas 12.2–12.3, pp.59–60 |
| Harmonic interval and large-prime estimates | bskk line 3701–3750, Lemmas 12.4–12.5, pp.60–61 |
| Nondivisible parts and the modulus union | bskk line 3751–3818, Lemma 12.6, p.61; the four-witness strengthening is proved by the README's threshold-three argument |
| Primitive support and the two exclusions | bskk line 3826–3899, Lemmas 12.7–12.9, pp.62–63; the README's five/four witnesses ensure companions lie below n/4 |
| Final union of failures | bskk line 3900–3907, p.63 |
| Orbital connectivity and stabilizer interpretation | babai line 115–146 and line 160–180, §§3–4 and 6, pp.4–6 |
| Complement graph, valencies, incidence and support bounds | babai line 222–313 and line 335–338, §§8–9, pp.7–10 |
| Commutator support and Bochert incidence argument | schomburg line 32, equation (2.1); line 120–148, Theorem 3.1 and proof, pp.4–5 |
| Primitive square-root support estimate | bary-soroker-kozma line 438–451, Claim 1, pp.9–10 |

Cross-roadmap ownership was resolved anew against the supplied main checkout,
all fourteen supplied sibling heads, board packages, and the mandated indexed
`roadmaps grep` search. The indexed AnalyticNumberTheoryPartI supplier was read
using `roadmaps show`; it supplies the evidence for a F02. The other indexed open
roadmaps were searched by object, not read in full. The sibling ordered-root match
in AbelianSchemesAndArithmeticModuliPartII §F4.3 is a discriminant size estimate,
not an ordered-root field or quotient construction.

PolynomialGaloisGroups main, Layers 0 and 1, supplies the faithful root action,
factor/orbit dictionary and equal-block quotient; its Layer 1 imprimitivity target
explicitly identifies the carrier with the block system times a block. Its Layer 5
imports the polynomial-discriminant-good equality from NumberFieldArithmetic
§3.10, and Layer 9 supplies the symmetric-group context. NumberFieldArithmetic's
completed README §3.10 states the monic, possibly reducible, polynomial corollary
with p not dividing the polynomial discriminant. ErdosProgressionPowers §0.9 was
checked at the supplied head, including the absence of the old identifier in both
files. AnalyticNumberTheoryPartI §0.26 states the exact product estimate, including
the coefficient-identification obligation; its weaker §0.31 is not substituted.

This continuation owns the bounded occurrence-merging assembly, collision-allowing
specialization, arbitrary ordered-root quotient criterion, partition-law theorem
and its support/block proof route. Searches found no second owner for these
extensions. The existing single-root, single-cycle and generic block constructions
remain imported. No ownership moves, new targets or new supplier gaps were added.

The pins agree with `lake-manifest.json`: Mathlib
`6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Direct checks included:

| Pinned file and locator | Verified contract |
|---|---|
| `Mathlib/Combinatorics/Enumerative/Partition/Basic.lean:52` | `Nat.Partition` has `parts : Multiset ℕ`, positive parts, and `parts.sum = n`; it permits the empty partition of zero, not zero-valued parts. |
| `Mathlib/GroupTheory/GroupAction/Primitive.lean:91` | `IsPreprimitive` extends pretransitivity and makes every block trivial; it does not impose a positive degree. Headline degree guards are separate. |
| `TauCeti/GroupTheory/Perm/Partition.lean:96`, 333, 340, 361, 367, 392, 406 | The native definition is `σ.cycleType + Multiset.replicate (Fintype.card α - σ.support.card) 1`; the sum, identity, empty, conjugacy and relabeling contracts retain fixed points. |
| `TauCeti/GroupTheory/Perm/Semiconj.lean:46`, 54, 82, 104 | Bottom period divides top period; the return orbit is the fibre intersection; its cardinality times the bottom period is the top period; the orbit-count bound has finite-carrier hypotheses. |
| `TauCeti/RingTheory/Polynomial/FactorDegrees.lean:119`, 126 | The monic reduction keeps degree and its normalized factor degrees sum to that degree. Exponents give repeated occurrences. |
| `TauCeti/NumberTheory/NumberField/Frobenius.lean:97` | A prime of the ring of integers over (p), with the number field Galois over ℚ, admits an arithmetic Frobenius lift; no unramifiedness premise occurs. |
| `TauCeti/NumberTheory/NumberField/Frobenius/CycleType.lean:164` | The existing equality requires monicity and p not dividing the polynomial discriminant. |
| `TauCeti/FieldTheory/GaloisGroups/FrobeniusOrbits.lean:76` | Nonzero polynomial, splitting and algebraic finite-field extension hypotheses accompany the irreducible-factor orbit and degree statement. |
| `TauCeti/FieldTheory/GaloisGroups/Orbits.lean:212`; `Stabilizer.lean:74`; `MultipleTransitivity.lean:88` | Separability and positive degree accompany transitivity/irreducibility; the simple-root fixing subgroup needs no separability; the one-root quotient criterion needs irreducibility, separability and degree greater than one. |
| `Mathlib/FieldTheory/PolynomialGaloisGroup.lean:120`, 204, 212 | Restriction is surjective in a normal splitting extension; the root-action homomorphism and its injectivity have the splitting `Fact`. |
| `Mathlib/GroupTheory/GroupAction/MultipleTransitivity.lean:122`, 240, 302, 338, 601 | Distinct-tuple transport, primitivity, bounded monotonicity, stabilizer recursion and alternating recognition have the hypotheses used in Layer 2. |
| `Mathlib/GroupTheory/GroupAction/Jordan.lean:370`, 408 | Primitive swap and 3-cycle recognition apply at the stated small degrees. |
| `Mathlib/Algebra/Polynomial/RingDivision.lean:186`, 306; `Mathlib/RingTheory/Ideal/GoingUp.lean:369` | Simple linear-factor multiplicity; multiplicity additivity for nonzero products; lying over for an integral faithful algebra. |
| `TauCeti/RingTheory/Polynomial/Roots.lean:111` | Removing a selected simple root deletes that root from the root set; both root vanishing and nonvanishing derivative are required. |
| `Mathlib/NumberTheory/Harmonic/Bounds.lean:24`, 33; `EulerMascheroni.lean:172`; `Mathlib/Analysis/Complex/ExponentialBounds.lean:82` | The harmonic/log bounds and γ < 2/3 < log 2 give exp γ < 2. |
| `Mathlib/RingTheory/UniqueFactorizationDomain/NormalizedFactors.lean:306`; `Mathlib/Data/Finset/Lattice/Fold.lean:99` | Unit factor multisets vanish; the finite supremum bound is exactly the pointwise bound. These justify deletion, not proof-padding. |

## Computed adversarial mathematics pass

Each row names a statement, convention or definition, including the former Lean
API targets retained in prose. Values in rows concerning asymptotic results test
the stated proof estimates and hypotheses; finite instances are not represented
as proofs of an unspecified eventual threshold. Approximate real values only
illustrate strict margins; the README retains the exact symbolic inequalities.
“Prose” means its mathematical content remains in the indicated README section.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| Finite carriers and positive partition convention | n=0,1,2; proposed part 0 | Parts ∅, {1}, {1,1}/{2} sum to 0,1,2; {0,2} sums to 2 but has 0>0 false | Positivity excludes the wrong model | None |
| Full-cycle and factor-occurrence conventions | Identity on two points; X(X−1) over F₃ | Full cycle type {1,1} sums to 2, ordinary cycle type ∅ sums to 0; two distinct degree-one factors have counts 1,1 | Fixed points and repeated degree occurrences retained | None |
| General coefficient fields and monicity boundary | 2X(X−1) over ℚ; X²−t over F₂(t) | All-root quotient 2, not 1; inseparable polynomial has degree 2 and one distinct root | Only specialization requires monicity; higher results retain separability | None |
| Discrete partition measurable structure | n=0,2 | Partition carrier cardinalities 1,2; singleton sizes are 1; whole-space sizes are 1 and 2 | All event sets measurable; no arbitrary σ-algebra binder | Instance retained |
| Probability normalization | Zero measure; infinite counting measure | Zero measure has ν.real(univ)=0 versus probability mass 1; infinite total mass also has ENNReal.toReal=0 versus 1 | `PartitionLaw` alone is insufficient | Separate normalization retained |
| Total logarithm and division convention | n=0,1 | log 0=log 1=0; n/log n=0 in both cases; E₃ threshold and count at α=0 are 0 and 0 | Small-degree values do not enter n≥N≥3 proofs | None |
| Parameter range and quantifier order | δ=1/10, ε=1/50, θ=0 or 3/100 | α=1/40 or 1/100; ε/2=1/100; κα≤1/40 and θ≤1/20 | Positive uniform lower exponent survives both endpoints | None |
| Arithmetic Frobenius orientation | F₈=F₂[a]/(a³+a+1) | Arithmetic image a², inverse image a⁴=a²+a; these are unequal | Lift uses the p-power convention | None |
| Mertens supplier contract | x=2,4; x=n^(1/8) | Reciprocal products 2,3; leading values approximately 1.2345,2.4690; log(n^(1/8))=log n/8 exactly | Additive error remains bounded after substitution | Gap retained for human decision |
| Divisor supplier contract | η=1/4; n=16,2³² | τ(16)=5 versus 16^(1/4)=2; τ(2³²)=33≤256=(2³²)^(1/4) | Finite exceptions need D≥5/2; denominators positive | Supplier identifier → prose |
| EqualPartMerging definition and allowed Check | {1,1,2,2,2,3} at y=2 | Block sizes 1,1,1,2,1≤2; output sums {1,1,2,4,3}; both totals 11 | True | Routine example deleted; Check retained |
| Merging reflexivity | a={1,2}, y=1; y=1/2 | Singleton block sizes 1≤1; 1≤1/2 false; empty input still has zero blocks | Hypothesis 1≤y has the intended role | Prose §0.1 |
| Merging monotonicity | {1,1}→{2}, y=1,2,3 | Size 2≤1 false, 2≤2 and 2≤3 true | Enlargement preserves witnesses | Prose §0.1 |
| Merging sum conservation | {0,0}→{0}, y=2 | Both sums 0; block cardinality 2 | Valid even for raw zero entries | Prose §0.1 |
| Equality below two | {1,1}, y=1.9; empty input at −1 | Size-2 block violates 2≤1.9; singleton output {1,1} equals input; ∅=∅ at −1 | Both boundary behaviors agree | Prose §0.1 |
| EqualPartMerging.pullback_submultiset | {1,1,2}→{2,2}, v={2} or ∅ | Pullbacks {1,1} or {2} each sum to 2; ∅ has sum 0=0 | Occurrences, not distinct output values, selected | Deleted target; prose §0.1 and consumer §5.3 |
| equalPartMerging_forbidden | Same six-part input → {2,3,6} | Totals 11=11; producing 6 needs three 2s (3>2), two 3s (only one exists), or six 1s (only two exist) | Sum equality does not imply merging | Deleted target; Check retained |
| Nontransitivity example | {1,1,2}→{2,2}→{4} | Intermediate block sizes 2,1 and 2; all sums 4; direct block contains 1≠2 | True, including ∅→∅ at every y | Proved example retained |
| MergePerms definition and membership | ρ={1,2}, σ=(12) in S₃ | Input/output full multisets {1,2}={1,2}; y=1 permits singleton blocks | Defining equivalence exact | Definition retained; membership API prose |
| mergePerms_mono | ρ={1,1}, swap, bounds 1 and 2 | Membership false at 1, true at 2; size-2 witness remains at 3 | True | Deleted target; prose §0.2 |
| mergePerms_card | ρ={1,2} on carriers of size 3 and 4 | Multiset sums 3=3 versus 3≠4 | Membership forces degree equality | Deleted target; prose §0.2 |
| mergePerms_conj | g=(123), σ=(12) in S₃ | gσg⁻¹=(23); both full types {1,2} | Same relation on both sides | Deleted target; prose §0.2 |
| mergePerms_permCongr | Relabel a two-point swap | Full types {2} and {2}; partition sum 2 on both carriers | True | Deleted target; prose §0.2 |
| mergePerms_identity | Identity on Fin 0 and Fin 2 | Full types ∅ and {1,1}; {2} is not {1,1} at y=1 | Both directions of iff hold | Deleted target; Check retained |
| mergePerms_five_cycle | Full 5-cycle and ρ={5} | One block {5} has size 1 and sum 5 | True | Deleted target; Check retained |
| Empty MergePerms example | Fin 0, empty partition | Empty blocks flatten to ∅; output ∅; degree 0=0 | True | Routine example deleted; Check retained |
| BadTransitive definition and membership | C₅≤S₅; full S₃ | C₅ order 5 differs from 60 and 120; S₃ equals the forbidden full group of order 6 | Permitted witness versus nonwitness | Definition retained; unpacking prose |
| badTransitive_witness | Identity and a generator in C₅ | Both have membership true; witness order 5≠60,120 | Existential introduction is immediate | Deleted target; prose §0.3 |
| badTransitive_conj | Relabel C₅ by a transposition in S₅ | Conjugate group order remains 5; conjugated identity remains identity | Whole witness transports | Deleted target; prose §0.3 |
| badTransitive_permCongr | Relabel the regular C₅ carrier | Orbit size remains 5; group order remains 5 | Alternating/full comparisons preserved | Deleted target; prose §0.3 |
| badTransitive_small_degree | n=0,1,2,3 | Transitive group orders: 1;1;2;3 or 6; each is alternating or full in its degree | Union empty in all four degrees | Deleted target; Check retained |
| badTransitive_identity_five | Identity in regular C₅ | Cycle type {1,1,1,1,1}; witness is transitive of order 5 | Even identity is bad-transitive | Deleted target; Check retained |
| badTransitive_five_cycle | Any full 5-cycle | Generated subgroup has one orbit of size 5 and order 5 | True | Deleted target; Check retained |
| equivariant_cycle_fibres | (d,m)=(1,1),(1,2),(3,2) | Types {1}; {1,1}/{2}; {3,3}/{6}; return sizes respectively 1;1+1 or 2;1+1 or 2 | Products 1·1=1, 1·2=2, 3·1=3, 3·2=6 fix merging direction | Headline retained |
| maxFactorMultiplicity definition | Zero, unit, repeated and distinct factors | Empty maximum 0; counts {3} give 3; counts {1,1} give 1 | Maximum counts factors rather than degrees | Definition retained |
| maxFactorMultiplicity_zero | Zero over F₂ | normalized factor multiset ∅; supremum 0 | Total convention, not a monic reduction | Deleted target and example; Check retained |
| maxFactorMultiplicity_unit | 1 over F₂ | Empty normalized factors, maximum 0; Squarefree 1 true | Squarefree alone cannot force maximum one | Deleted target; Check retained |
| count bound | (X+1)³; proposed factor X | Occurring count 3≤3; absent count 0≤3 | Covers factors outside the support too | Prose §1.1 |
| maxFactorMultiplicity_le_iff | (X+1)³ at bounds 2 and 3 | 3≤2 and count≤2 both false; 3≤3 and count≤3 both true | Both directions agree | Deleted target; prose §1.1 |
| maxFactorMultiplicity_eq_one_iff | X(X−1), (X+1)³, unit | Values 1,3,0; squarefreeness true,false,true | Nonunit premise excludes the last mismatch | Deleted target; prose §1.1 |
| maxFactorMultiplicity_repeated_distinct | F₂ repeated linear factor; F₃ distinct linear factors | Multiplicities 3 and 1; degree multisets {1,1,1} and {1,1} | Values unchanged | Deleted target; Checks retained |
| Fibre-cardinality identity | S=∅; S={0,2}, reduction mod 2 | Product 1: multiplicity 0=fibre size 0; product X²: multiplicity 2=fibre size 2 | Collisions are allowed; product stays monic/nonzero | Prose §1.2 |
| ramified_merging | X−a; X²−2 at p=2 and p=3; A=1 excluded | Linear type {1}; at 2: factors {1,1}, M=2, outputs {1,1}/{2}; at 3: irreducible degree 2, M=1, output {2}; A=1 has degree 0 | Ramified and squarefree reductions both covered | Headline retained |
| TupleRootField definition | Empty tuple; one root of X²−2; rational root of X(X−1) | Fields ⊥; degree 2 over ℚ; ⊥ of degree 1 | Actual adjoin, not a formal extension | Definition retained |
| tupleRootField_quadratic | Either root of X²−2 | Minimal polynomial degree 2; field degree 2 | True | Deleted target; Check retained |
| tupleRootField_split | Root 0 or 1 of X(X−1) | Both lie in ℚ; generated field ⊥, degree 1 | True | Deleted target; Check retained |
| tupleRootQuotient definition | j=0; j=1 for X(X−1), x₀=0 | Empty divisor 1 gives f; divisor X gives X−1 | Coefficient field and division direction correct | Definition retained; routine examples deleted |
| tupleRootQuotient_factor | f=2X(X−1), selected root 0 | Quotient 2(X−1); product 2(X−1)X=f | Exact factorization, no monicity premise | Deleted target; prose §2.1 |
| tupleRootQuotient_natDegree | Same quadratic; j=0,1,2 | Degrees 2,1,0 equal 2−0,2−1,2−2 | Natural subtraction within admissible range | Deleted target; prose §2.1 |
| tupleRootQuotient_separable | X(X−1); selected root 0; f=1 | Quotients X−1 and 1 have no repeated root; root counts 1 and 0 | Endpoint unit is separable | Deleted target; prose §2.1 |
| Complementary root set | X(X−1), selected 0 | Roots {0,1} minus {0}={1}, quotient root set {1}; derivative at 0 is −1≠0 | Matches simple-root supplier | Prose §2.1 |
| tupleRootQuotient_all_roots_monic | f=X(X−1); f=1 | Removing both roots gives 1; removing zero roots of 1 gives 1 | True at degree zero too | Deleted target; Check retained |
| tupleRootQuotient_nonmonic | f=2X(X−1), j=2 | Quotient constant 2, not 1 | Leading coefficient survives | Deleted target; Check retained |
| IsKFoldIrreducible definition and degree guards | f=X; k=0,1,2; f=1 | For X: false,true,false; for 1: false for every k since degree 0 | Quantifier vacuity prevented | Definition retained; routine example deleted |
| IsKFoldIrreducible.one_iff | Separable linear X; split quadratic X(X−1) | At k=1 both irreducibility tests are true for X and false for split quadratic | Both directions agree | Deleted target; prose §2.2 |
| Higher irreducibility monotonicity | X²−2, k=2,l=1; split quadratic | Root action S₂ is 2- and 1-transitive; split action is neither | Restricting tuples preserves the property | Prose §2.2 |
| Higher irreducibility degree bound | Degree 1 at k=0,2; degree 0 at k=1 | Required inequalities 1≤0, 2≤1 and 1≤0 respectively fail | No above-degree or zero-fold value | Prose §2.2 |
| kfold_cyclotomic_eleven | Φ₁₁ over ℚ | Degree 10; regular C₁₀ has point stabilizer order 1; remaining quotient degree 9 splits into nine linears | 1-fold true, 2-fold false | Deleted target; Check retained |
| kfold_repeated_quadratic | (X²−2)² over ℚ | Degree 4, distinct roots 2, separability false, irreducibility false | Transitive distinct-root action does not suffice | Deleted target; Check retained |
| Tuple stabilizer equality | j=0; one root of X²−2 | Stabilizer whole group of order 2 at j=0; stabilizer order 1 after adjoining a root; fixing subgroups have orders 2 and 1 | Equality has no separability premise | Prose §2.3 |
| Restriction to quotient splitting field | X²−2, j=1 | Quotient linear, Galois group order 1; tuple stabilizer order 1 maps onto it | Minimal splitting field need not be L in general | Prose §2.3 |
| kfold_iff_multiplyPretransitive | X²−2 at k=1,2; split quadratic at k=1; inseparable quadratic | Truth values true/true, true/true, false/false; inseparable case has 1 distinct root versus degree 2 and is excluded | Both directions and guards agree | Headline retained |
| kfold_degree_sub_two | Irreducible cubic, split cubic, quartic; n=2 | Cubic image C₃/S₃ contains A₃ and k=1 holds; split image 1 does neither; n=4 tests k=2 and A₄/S₄; n=2 gives k=0 and fails n≥3 | Range prevents zero-fold substitute | Headline retained |
| harmonicMass definition | False indicator; singleton 2 through 4; true through 2 | Sums 0,1/2,3/2; at m=0 empty sum 0 | Positive inclusive endpoints and reciprocal weights | Definition retained; routine examples deleted |
| Harmonic zero and singleton APIs | a=2,m=4; a=5,m=4 | 1/2 in range; 0 outside range, not 1/5 | Singleton identity needs 1≤a≤m | Prose §3.1 |
| Harmonic monotonicity | Singleton 2 then true indicator through 4; cutoff 1 then 2 | 1/2≤25/12; 0≤1/2 | Summands nonnegative | Prose §3.1 |
| PartitionLaw parameter fields | C=1,t=1/2,κ=1,δ=1/10; endpoints t=0,1,κ=0 | All seven range tests pass at the first tuple; strict tests 0<t, t<1, 0<κ fail at the listed endpoints | Structure fields carry common ranges | Structure retained |
| PartitionLaw pair field | n=8,k=l=2; partitions {2,2,4},{2,6} | Counts 2 and 1; event indicators 1 and 0; right side C/(2·2)=C/4 | Two occurrences required | Field retained |
| PartitionLaw subset field | n=4,δ=1/10; possible subsum k=2 | Lower cutoff 4^(19/20)>2 and upper cutoff 2; field has no admissible k here | No spurious small-degree bound | Field retained |
| PartitionLaw lower field | Zero indicator; singleton 2 at m=4 in range | L=0 or 1/2; thresholds 0 or t/2; right sides C or C exp(−κ/2) | Occurrence count, not part-size sum | Field retained |
| partitionLaw_singleton | Singleton indicator 2 through 4 | Harmonic mass 1/2 and count countρ(2); both displayed bounds become C exp(−κ/2) | Exact specialization | Deleted target; Check retained |
| PartitionLaw.pair_diagonal | k=2,n≥8 | C/(k·k)=C/4=C/k²; two-occurrence predicate identical | Direct field specialization | Deleted target and example; prose retained |
| Constant enlargement | C=1,D=2,k=l=2,L=0 | Pair bounds 1/4≤1/2; lower bounds 1≤2 | Nonnegative factors preserve inequality | Prose §3.1 |
| κ weakening | κ=1,κ′=1/2,L=2 | exp(−2)≈0.1353≤exp(−1)≈0.3679 | Weaker decay enlarges the right side | Prose §3.1 |
| Zero-indicator mass Check | m=7 in range | Count=0=tL; event univ; C exp 0=C; probability mass 1 | Gives 1≤C only with normalization | Routine example deleted; Check retained |
| GoodEvent E₁ | {2,2,4} and {2,6} at n=8,κ=1,α=0 | First has gcd(2,2)=2 versus cutoff 1; second has only one qualifying occurrence and no pair | False/true, as stated | Proved occurrence-sensitive example retained |
| GoodEvent E₂ | {3,3},n=6,δ=2,r=2,j=1 | 2 divides 6; 2≤6; selected sum 3=6·1/2 | E₂ false outside asymptotic range | Definition retained |
| GoodEvent E₃ | n=1,α=0 | Interval [1,0] empty; count 0; threshold (0·t/2)log1=0 | E₃ true under total operations | Definition retained |
| GoodEvent E₄ | n=9, part 1 | Upper cutoff √9/3=1; no prime divides 1; qualifying count 0 versus positive t log9/4 | Part 1 is excluded, not treated as nonsmooth | Definition retained |
| GoodEvent E₅* | {1,2},n=3,α=1,r=2 or r≥3 | Interval [1/3,3/log3] contains 1,2; counts 1 or 2, both <4; one-witness condition true for every r | Four differs from one | Proved example retained |
| goodEvent_one_diagonal | n=8,k=2,κ=1,α=0 | Cutoffs 1≤2≤2; repeated count 2 forces forbidden gcd 2≥1 | E₁ permits count at most 1 | Deleted target; prose §3.2 |
| goodEvent_two_complement | {3,3},U={3}; U=∅ or all parts | Complement sums 3,6,0 equal 6−3,6−0,6−6 | No good-event premise needed | Deleted target; prose §3.2 |
| goodEvent_five_four | Definition at r=2 | Required occurrence count ≥4 is exactly the r=2 field; the test {1,2} instead gives 1<4 | Literal extraction, not a headline | Deleted target; prose §3.2 |
| goodEvent_log_one | Unique partition of one at α=0 | Count 0≥0 | True | Proved theorem deleted; Check retained |
| goodEvent_two_three | {3,3},r=2,j=1 | Forbidden equality 3=3 | True nonmembership | Proved theorem deleted; Check retained |
| Uniform harmonic interval estimates | n=16,α=1/40; nondivisibility r=2 | Both intervals have lower endpoint >16/log16, so masses 0; main terms about −0.9505 and −0.4406 | Bounded errors, no small-degree asymptotic equality claimed | Prose §3.3 |
| nonsmooth_harmonic_mass | Large-n leading coefficient; integer 1 | exp γ≈1.78107; 1/2−expγ/8≈0.277366>1/4, margin ≈0.027366; 1 has no qualifying prime | Positive margin absorbs bounded error | Headline retained |
| Large-gcd failure bound | δ=1/10,κ=1,α=1/40 | Pair scale r⁻²; tail at r≥n^(1/40) is O(n^(−1/40)); target exponent −1/40 | Diagonal and off-diagonal summed together | Prose §3.5 |
| Block-fraction subsum failure | δ=1/10,r=4,j=1,2; divisor exponent δ/4 | Fixed-r sum n^(−1/10)(4^(1/10)+2^(1/10))≈2.22047 n^(−1/10); total powers −1/20+1/40=−1/40 | Matches target −δ/4, including prime powers | Prose §3.6; supplier citation corrected |
| Long-part lower-tail failure | κ=1,α=1/100,log n=10000 | Harmonic main term 100−log10000≈90.7897 versus half-log threshold 50; exp(−L)=10000 exp(−100) for that main term | Lower-tail comparison and logarithm power have correct direction | Prose §3.7 |
| Large-prime part failure | κ=1; harmonic mass ≥log n/4 | exp(−κL)≤exp(−log n/4)=n^(−1/4) | Matches target −κ/4 | Prose §3.8 |
| four_nondivisible_parts_failure | κ=1,α=1/40; r=2,3 and r>log n; large r | Decay exponents 1/40,1/30; large-range per-modulus 1/20 minus union count exponent 1/40 gives 1/40; among five distinct long parts at least 5−1=4 survive a large modulus | Threshold 3 for failure preserves uniform rate | Headline retained |
| minSupport definition | Trivial group, S₂,A₃,C₅, regular Q₈ | Values none, some 2, some 3, some 5, some 8 | Identity excluded; nonabelian regular action also agrees | Definition retained |
| minSupport_eq_none | Trivial group versus C₅ | No nonidentity support versus four nonidentity elements each moving 5; none versus some 5 | Both directions agree | Deleted target; prose §4.1 |
| minSupport_eq_some | S₃,m=2 or 3 | Swaps attain 2, all nonidentity supports ≥2; m=3 attained but lower bound fails at swaps 2<3 | Attainment alone is insufficient | Deleted target; prose §4.1 |
| minSupport_le | S₃ minimum 2; a 3-cycle | 2≤3 | Extracts the minimum bound | Deleted target; prose §4.1 |
| minSupport_two_le | S₂ swap; trivial group | Returned value 2≥2; trivial group returns none, no some 0 | Correct domain | Deleted target; prose §4.1 |
| minSupport_alternating_three | A₃ | Nonidentity supports 3,3; minimum 3 | True | Deleted target; Check retained |
| minSupport_symmetric_two | S₂ | Only nonidentity support 2 | True | Deleted target; Check retained |
| orbitalDistinguishers definition and membership | x=y; trivial group with x≠y; regular C₅ | D sizes 0; n;5; stabilizer orbits singletons in regular case | Opposite-orbit interpretation matches definition | Definition retained; routine examples deleted |
| orbitalDistinguishers_symm | Trivial and regular C₅ actions, x≠y | D(x,y)=D(y,x)=univ; sizes n or 5 | Inverse transport gives equality generally | Deleted target; prose §4.2 |
| orbitalDistinguishers_subset_support | Swap (12) in S₃; 5-cycle in C₅ | D(1,2)={1,2}=support swap; regular-case D=all 5=support cycle | Fixed points of the transporting element never distinguish | Deleted target; prose §4.2 |
| orbitalDistinguishers_symmetric | S₂,S₃,S₂₅, x≠y | D={x,y}, size 2 in every case; at x=y size 0 | At n=25, 2<√25/2=2.5, so double transitivity must be excluded in Babai | Deleted target; Check retained |
| Primitive orbital connectivity | Regular C₅ on residues; x=0,y=1 | Edges i↔i+1 give a connected 5-cycle; 0→2 has length 2; diagonal orbital alone gives five singleton components | Distinct-pair hypothesis excludes wrong orbital | Prose §4.3 |
| babai_distinguishers | C₅; S₂₅ negative control | C₅: |D|=5≥√5/2≈1.118; S₂₅:2<2.5 and nondouble-transitivity premise false | Both action branches identified | Headline retained |
| Babai complement/average step | Directed C₅ orbital | v_i=1; symmetrized valency 2; complement diameter 2; v_max=1≤4−√4=2; average D=5≥5−1=4>√5 | Complement direction and constants sound | None |
| Babai weighted-tree/large-diameter step | Regular C₇, directed generator orbital | Seven singleton suborbits; tree weight 6=n−1; v_iD(i)=1·7≥6; product lower bound 2·6/3=4>7/4 | Positive valency permits division; directed orientation loses no edges | None |
| bochert_minSupport | Affine group on F₄₁ | Nontranslations fix one point, translations none; m=40≥41/4=10.25 | Doubly transitive proper nonalternating example | Headline retained |
| Bochert commutator support inclusion | u=(12),v=(23) in S₃ | Intersection Δ={2}; commutator support size 3; Δ∪uΔ∪vΔ has size 3=3|Δ| | Noncommuting support bound correct | None |
| Bochert incidence proportions | Affine group on F₄₁, minimal u, chosen moved a | |E|=40; |F|=1; fixing proportion 1/40=(41−40)/(41−1); other-point moving proportion 39/40=(40−1)/(41−1) | Distinct conjugates counted, no independence assumption | None |
| Bochert final inequality and denominator | m=4,5,6,7,8,9,10 | 4m+6/(m−3)=22,23,26,59/2,166/5,37,286/7; first six <38; at m≥10 extra term ≤6/7<1 | Integer n≤4m follows; m−3 positive first | None |
| primitive_minSupport | C₅; finite branch n=37 | m=5≥(√5−1)/2≈0.618; lower bound 4>(√37−1)/2≈2.541 | Small degrees avoid extending Bochert below 38 | Headline retained |
| Actual block-orbit arithmetic | Two blocks of size 3; within-block swap, block interchange, fixed point | (ℓ,r′,s′)=(2,1,2),(2,2,1),(1,1,1); products r′s′=ℓ; union sizes 3,6,3 | Same cycle length can have different block orbits | Prose §5.1 |
| Fixed-cycle support correction | Identity at a point | cycleOf support size 0 plus correction 1 gives length 1; raw support gives 0 | Singleton cycles included | None |
| Primitive exclusion cutoffs and exceptional count | δ=1/10,κ=1,θ=0; large-part budget | κα=1/40<1/8; four parts >n/4 would sum >n; three parts times eight primes gives 24 | More than 24 eligible unique parts leaves a prime avoiding exceptions | Headline retained |
| Primitive exclusion cycle-power step | Cycle lengths {6,5,4,1}, p=3, independently of the asymptotic cutoff | a=1,q=20; exponent 20 kills cycles 5,4,1; the 6-cycle becomes two 3-cycles and moves all 6 points | Support exactly k, not necessarily one p-cycle | None |
| Primitive exclusion support comparison | n=16 and n>9 generally | √16/3=4/3<3/2=(√16−1)/2; difference (√n−3)/6>0 exactly for n>9 | Uniform large-degree contradiction has correct strict direction | None |
| Imprimitive exclusion, small block count | r=2,s=3; block orbit r′=1 | Invariant union size r′s=3=6·1/2; occurrence pullback sum also 3, not the occurrence count | Contradicts the specified subsum event when its range applies | Headline retained |
| Imprimitive exclusion, middle range | δ=1/10,κ=1,θ=0 or 3/100 | δ/2−α=1/40 or 1/25; κα=1/40 or 1/100; δ/2−α−θ=α in both cases | Equality at θ=0 is harmless because the preceding r inequality is strict | None |
| Imprimitive exclusion, largest range | Same two parameter endpoints | 1−3α−θ=37/40 or 47/50; each ≥7/8≥κα | Correct lower power for short companion gcd | None |
| Short-companion occurrence selection | Middle five unions; largest four unions | 5−1−3=1 and 4−3=1; a single unrestricted union gives no such guarantee | Selected companion is ≤n/4, as E₁ requires | None |
| generalized_luczak_pyber | θ=0 and θ=δ/2−ε, with δ=1/10,κ=1,ε=1/50 | Merging bound 1 at zero; decay powers −1/40 and −1/100; endpoint −κε/2=−1/100 | Constants precede both ν and θ; decay survives endpoint | Headline retained |
| Final rate domination | Same parameters, θ=0 or 3/100 | κα=1/40 or 1/100≤δ/4=1/40 and κ/4=1/4; κ=1≤2 for logarithm power | The four other rates are bounded by the displayed common rate after increasing N | None |
| galois_merging_certificate | A=X⁵−2 at p=2 and p=3 | Root group order 20≠60,120; at 2 factor type {1,1,1,1,1}, M=5, identity qualifies at y=5; at 3 factor type {1,4}, M=1, affine 4-cycle with one fixed point qualifies | Both ramified and good primes supply a bad-transitive witness | Headline retained |
| Polynomial event inclusion | Same polynomial at y=1,p=2, then y=5; repeated reducible quadratic | At y=1: M=5>1 gives first event; at y=5: M≤y and the merging event holds; repeated quadratic degree 4 has irreducibility false | Union covers bad group pointwise; reducible input does not satisfy the premise | Prose §6.2 |

The source locations and pinned hypotheses above were compared with each changed
prose statement, not merely with its former name. All original Check values survive;
no new mathematical assertion or boundary theorem was added to the acceptance file.

## Maintainer consequences

The thirteen headline names and signatures are unchanged. The 45 removed names
are precisely the former API/Check theorem names listed individually in the
mathematics table. Their mathematical content stays in the README, without a
promise of those Lean names. The fifteen removed routine examples are the empty
permutation; allowed merging; zero/unit multiplicity; empty/singleton root fields;
empty/singleton root quotients; degree guards; two harmonic values; diagonal law;
zero-indicator mass; empty minimum; and two elementary distinguisher examples.
No supplier declaration was renamed. No downstream roadmap found by the ownership
search cites a removed fully qualified declaration.

A human must settle whether to remove `gap:mertens-prime-product` in light of
AnalyticNumberTheoryPartI §0.26. The exact general supplier obligation is already
registered in the README and the plan, so its retention creates no unowned input
or dependency cycle. This report does not resolve that re-raised decision by
claiming the supplier target is missing. No commits, pushes or external messages
were made, and no Lean process remains running.
