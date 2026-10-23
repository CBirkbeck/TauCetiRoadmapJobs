# Repair report: MultiquadraticPartII

Review labels r2a and r2b identify the two supplied reviews. Overlapping
claims share one repair; each finding receives its own verdict below.

## F01 (P3) — applied

**Review r2a.**

Named boundary declarations → prose README Checks. Deleted all seventeen
listed declarations and the duplicate empty-factor example. Applied the same
acceptance rule to the scalar, invertible-substitution and proper-action API
declarations. Their mathematics remains in §3.1. Replaced the representative,
nonexhaustive module description with the headline inventory and the precise
unavailable restriction-comparison carrier.

## F02 (P1) — applied

**Review r2a.**

Independent composite-sign and nonsquare-character targets → exact contracts
from AutomorphicSpectralTheory §4.17a and MetaplecticAutomorphicForms §7.20a.
Deleted the composite-sign acceptance declaration. Recast §3.1 as the total
extension and its restriction agreement. Updated ownership, build description,
§2.1, Layer 3 dependencies and the applications paragraph. Overlap values are
−1 at D=12 and 1,−1 at D=−20.

## F03 (P3) — applied

**Review r2a.**

Admitted negation API theorem → prose consequence and computed Checks.
Specializing scalar multiplication at μ=−1 and using
`genusCharFun_neg_one_eq_sign_prod` gives the stated formula; the pinned
input is in `TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/Basic.lean:277`.
The scalar API itself also stays in the README. Negative-factor, positive-factor
and zero-branch Checks give −1, −1 and 0 respectively.

## F01 (P2) — applied differently

**Review r2b.**

Duplicate library-form ownership and implied reverse consumption → imported
composite-sign contract and explicit supply direction. The suggested wording
would retain the same target despite its earlier owner, so §2.1 instead uses
the supplied identity. AnalyticNumberTheoryPartI §2.25 explicitly consumes
AutomorphicSpectralTheory §4.17a. Both precede this package; no merge-order
change or edit to either supplier is needed.

## F02 (P3) — applied

**Review r2b.**

Admitted numeral sign computation → deletion from Suggested.lean, retaining
its values in §2.1 Checks. At −1 the factors −4,−8,8,∅ give −1,−1,1,1;
(−4)(−3)=12, (−8)(−3)=24 and 8·17=136. This is the same boundary-padding
repair as r2a/F01; no computation theorem was proved in place.

## F03 (P3) — applied

**Review r2b.**

Admitted invalid-cofactor computation → deletion from Suggested.lean and
preservation as the §3.1 negative-control Check. For [1,0,2], the discriminant
is −8 and the values at (1,0),(1,1) are 1,3. Their −4 characters are 1,−1.
The cofactor 2 fails the required residue condition. No computation theorem
was proved in place.

## F04 (P3) — applied differently

**Review r2b.**

Admitted empty-factor law plus its identical proved example → deletion of
both acceptance declarations, retaining the law and Check in the README.
The proposed proof replacement conflicts with the acceptance rule for boundary
API laws. One nontrivial proved example remains: the content obstruction for
[2,0,−6] at δ=−4. All references to two proved examples were updated.

## Verification outcomes

- Required elaboration of `packages/MultiquadraticPartII/Suggested.lean`,
  invoked with its absolute file argument from the pinned content checkout:
  **exit 0**, ten `declaration uses sorry` warnings, no other diagnostics.
  Both imported Tau Ceti object files existed, so no targeted build was needed.
- Mechanical signature audit: copied the final module into one scratch Lean
  file and appended `#check @` for **all eleven named declarations**. Its
  elaboration from the content checkout returned **exit 0**, the same ten
  expected warnings, and eleven complete signatures. Compared every type
  with its README statement. **No missing binder and no binder change.**
  An initial invocation from the board checkout failed before elaboration
  because no default toolchain was configured there; the content-checkout
  invocation above is the completed check. No toolchain setting was changed.
- The module contains ten headline theorems, one real-bodied definition and
  one proved example. It has one `import Mathlib`, the two used individual
  Tau Ceti imports, no admitted example, no admitted data and no `set_option`.
  All eleven names occur in the README; none of the twenty-two deleted names
  remains there. No retained declaration was renamed.
- The required dependency command with the supplied order and `--movable`
  returned **exit 0** and exactly:

```text
depcheck: 16 roadmaps, 120 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line.

- Citation resolution returned no unresolved cross-roadmap citation and no
  unresolved local Lean name. Its warning that it could not inspect pinned
  Lake packages was addressed by direct inspection of the supplied pins;
  it is not used as evidence about those libraries. The two initial leads
  concerning SumTwoSquares name an existing module,
  `Mathlib/NumberTheory/SumTwoSquares.lean`, not a missing declaration.
- The arithmetic falsification pass evaluated 1,658 admissible combinations
  of coefficients a,b,c in −4,…,4 and factors ∅,{−4},{8},{−8},{−3},{5},
  {−4,−3},{8,17}. For represented pairs in −8,…,8 it found no disagreement
  between coprime represented-value characters and no failure of the content
  criterion. Scaling by −2,−1,0,1,2 also gave no disagreement in the tested
  cases. This finite search supplements the mathematical arguments; it is
  not a proof of any roadmap theorem.
- Recomputed all **49 README Check bullets**, the worked examples and the
  changed extension/restriction statements. Their numerical values are
  recorded below.
- Report-format failure: review-prefixed finding headings → exact finding
  IDs, with review labels in the section text. A mechanical format and
  coverage check passed for **all seven findings**. This correction changes
  only the report; the mathematical files and their validation are unchanged.
- `git diff --check` returned **exit 0** with no output.
- `metadata.toml` and `sources.toml` are unchanged. No new supplier gap is
  needed: the two earlier sections already state the consumed inputs. No
  design file, other roadmap, tooling or merge-order file was edited.

## Sources, ownership and pinned evidence

The two manifest works were read from their certified legal extractions.
All cited works are already in `sources.toml`; neither needs another fetch
or an entry in a missing-reference request.

| Evidence | Exact locator and use |
|---|---|
| Narrow quotient, J and norm-unit criterion | duke-imamoglu-toth line 76 and line 86; §2, pp.950–951. |
| Form convention, fundamental primitivity and orientation | duke-imamoglu-toth line 113 and line 123; §2, pp.951–952, (2.3)–(2.5). |
| Narrow genus quotient and size | duke-imamoglu-toth line 410; §4, p.959, (4.1)–(4.2). |
| Principal genus and arithmetic criteria | duke-imamoglu-toth line 444; §4, p.960, after (4.4). |
| Character descent | duke-imamoglu-toth line 960; §7, p.971, after (7.7). |
| Composite real sign | duke-imamoglu-toth line 964 and line 989; §7, p.971, before (7.8). The real qualifier is retained. |
| Supplied form-character domain, zero branch and comparison | duke-imamoglu-toth line 1328 and line 1334; §9, pp.977–978, before Proposition 5. |
| Nonzero-discriminant convention | gross-kohnen-zagier line 299; Notations, p.503. Zero discriminant is an extension, not attributed to that convention. |
| Form-character definition and imprimitive scaling | gross-kohnen-zagier line 487; Ch. I §2, p.508. |
| Odd and dyadic represented-value argument | gross-kohnen-zagier line 521; Ch. I §2, proof of Proposition 1, p.509. The argument uses the cofactor congruence, not nonsquareness or a nonzero discriminant. |

Ownership was searched by object using `roadmaps grep` and verified with
`roadmaps show`, including the full §4.17a and §7.20a paragraphs. The former
states the composite sign including complementary factors; the latter states
represented-value existence, independence, proper invariance and the
imprimitive zero branch on its nonsquare domain. AnalyticNumberTheoryPartI
§2.25 imports the former. Thus merely renaming these objects or changing
carriers would not create new ownership here.

Read the main-branch Multiquadratic, IntegralLattices and GlobalNumberFields
roadmaps for structure and boundaries. Verified IntegralLattices Layer B,
B1–B3, in particular B2's coefficient ideal and negative-leading-coefficient
clause; GlobalNumberFields Layer 11's orders and narrow/ordinary Picard map;
and Multiquadratic Layer 3's all-place genus-field description.
GeometryOfNumbersAndQuadraticArithmetic's scope and §4.3 import its binary
form/ideal dictionary from IntegralLattices B2/B4/B5.

The board packages and all fourteen explicitly supplied sibling heads were
searched for the same form-character object. EffectiveClassNumbers uses the
pinned binary-form carrier and reduction theory; it does not own this
extension. No other supplied sibling claims the extension. The broader
open-roadmap object search located the two actual earlier owners above.
No local declaration uses another roadmap's fully qualified declaration
name. MultiquadraticPartII owns the remaining extension because its square,
zero and negative-definite branches and restriction/comparison targets are
outside the supplied nonsquare positive-definite/indefinite construction.

The manifest pins were verified: Mathlib
`6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Pinned source | Verified input and limitation |
|---|---|
| `TauCeti/NumberTheory/BinaryQuadraticForm/Basic.lean:94` | Native coefficient triple; no primitivity or discriminant restriction is part of the carrier. Evaluation is at line 116; the inverse-matrix action is fixed by `eval_smul` at line 188. |
| `TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/Basic.lean:212` | `genusCharFun` is the finite product of prime-discriminant arithmetic functions. Its zero and unit-value laws are at lines 253 and 266; the minus-one sign theorem is at line 277. It is not a character on binary forms. |
| `TauCeti/NumberTheory/NumberField/Quadratic/Conjugation/NarrowClassGroup.lean:87` | Principal-class dichotomy needs the quadratic presentation, not squarefreeness or positivity. The norm-minus-one equivalence at line 215 does need positivity. |
| `TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.lean:150` | Forgetful homomorphism, surjectivity at line 159, principal map at line 164, kernel at line 206, square-one at line 224 and sign invariance at line 237. |
| `TauCeti/NumberTheory/NumberField/NarrowClassGroup/Finite.lean:59` | Narrow/wide cardinality via the kernel. |
| `TauCeti/NumberTheory/NumberField/NarrowClassGroup/ElementaryTwoQuotient.lean:67` | Additive elementary-two quotient; cardinality at line 100. |
| `TauCeti/NumberTheory/Multiquadratic/Quadratic/TwoRank.lean:239` | Narrow two-rank formula for squarefree quadratic presentations of either signature. |
| `TauCeti/NumberTheory/Multiquadratic/Quadratic/Ramification.lean:186` | Ramified-prime count equals the factor-set cardinality; at most one even factor is required. |
| `TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/NarrowClassGroup.lean:134` | Existing ideal class character; coprime-ideal evaluation at line 157 and product-of-singletons at line 222. |
| `TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/CoprimeIdeal.lean:52` | Nonzero integral ideals are in the carrier before the absolute-norm coprimality predicate. Membership at line 71 and evaluation at line 103 cannot be applied to (0). |
| `TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/PrincipalGenus.lean:150` | Supplied principal-genus test. |
| `TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/OrdinaryTwoRank.lean:111` | Singleton J-value, with 0<d. The positivity/square criterion at line 164 is also supplied. |
| `TauCeti/NumberTheory/NumberField/Quadratic/RingOfIntegers.lean:327` | Half-integral maximal-order generator; hmin, hgen, squarefreeness and d mod 4=1. The generator theorem at line 424 retains those inputs and d mod 4≠1. |
| `Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean:376` | Absolute determinant of the ideal basis change; principal norm at line 381. |
| `Mathlib/NumberTheory/SumTwoSquares.lean:211` | Full even-valuation criterion, including zero. It is not the no-prime-divisor criterion for arbitrary integers. |

The pinned object search found ideal genus characters and the native form
carrier, but no nonsquare form-character function supplied by
`quadraticTraceData`. Its restriction comparison is therefore listed
individually as not statable in the module docstring. It is not replaced by
an arbitrary function parameter, a placeholder predicate or a tautological
second definition. The README gives its exact domain and equality target.

## Adversarial mathematics record

Rows naming deleted declarations record their surviving README mathematics,
not a promise to reintroduce acceptance declarations. Group models illustrate
the group-theoretic statements; number-field rows retain the stated quadratic
hypotheses. Equality and iff rows test both sides. Values of characters on
forms are justified by the local represented-value argument, or by the
content obstruction, rather than by assuming the new admitted theorem.

| Statement | Instances tried | Computed values on both sides | Result | Change |
|---|---|---|---|---|
| Quadratic presentation and D normalization | d=0,1,2,3,5,34; θ=2√3 | X² and X²−1 are reducible, so cannot be hmin; D=8,12,5,136; θ=2√3 has d=12 and the same field as √3. | Degenerate presentations excluded; Layer 0 permits the non-squarefree presentation. | None. |
| Narrow positivity and J normalization | √3, −√3, 2√3, −1 | N(√3)=−3; the first three principal ideals have class J; N(−1)=1 and its ideal is the unit ideal. Positive-norm sign pairs are ++ or −−, interchanged by multiplication by −1. | Generator sign and positive rational rescaling do not change J. | None. |
| Prime-discriminant and subset conventions | D=12,24,136,1 | (−4)(−3)=12; (−8)(−3)=24; 8·17=136; empty product=1. Singleton/complement signs at 12 are −1,−1; at 136 they are 1,1. | Signed factors and empty factor fixed. | Imported sign ownership. |
| Real-character versus complex-character convention | C4, J=2 additively | Real χ(2)=(±1)²=1; complex χ(k)=i^k gives χ(2)=−1. | Real-character descent is weaker than J=1. | None. |
| Elementary-two quotient versus two-torsion | C8 | Squares {0,2,4,6}; quotient order 2; zero fibre size 4; two-torsion {0,4}, size 2. | Carriers cannot be interchanged. | README only. |
| Narrow/wide class-number convention | Q(√3), Q(√2) | First field has kernel size 2 and h⁺=2h; second has kernel size 1 and h⁺=h. The source's h is the narrow count. | Cardinality normalization consistent. | None. |
| Form evaluation and discriminant conventions | [1,0,−3], [2,1,2], zero form | Q(1,0)=1, Δ=12; Q(1,1)=5, Δ=−15; zero has value 0 and Δ=0. | Coefficient carrier imposes no nonzero-discriminant restriction. | Extension made explicit. |
| Proper left-action convention | T on [1,0,−3]; S on [−1,0,3] | T action gives [1,−2,−2]; direct T substitution gives [1,2,−2]. S action gives [3,0,−1]. Discriminants remain 12. | Inverse matrix, not direct matrix, defines the supplied left action. | Checks retained and rotation made explicit. |
| `ker_toClassGroup_eq_pair` | d=2,3,−1 | d=2: J=1, kernel pair collapses to {1}; d=3: π(1)=π(J)=1, J≠1; d=−1: J=1, narrow=wide. | Both directions match the principal-class dichotomy in either signature. | Headline retained. |
| Kernel quotient and fibre consequence (`narrowDefect_fiber_boundary`) | d=2,3; arbitrary lift A | At d=2, {A,JA}={A}; at d=3, JA≠A and J(JA)=J²A=A. π(A)=π(JA). | Singleton/pair distinction correct; positivity needed only for norm-unit equivalence. | Acceptance declaration deleted. |
| `existsUnique_wideCharacter_iff` | C2 with J generator; trivial group | χ(J)=−1 gives zero descents and false RHS; χ=1 gives exactly one descent and true RHS; trivial group gives one descent. | Both iff directions and uniqueness verified. | Headline retained. |
| Real-character boundary (`wideCharacter_boundary`) | C4, J=2; C2, J generator | Both real C4 characters give χ(J)=1 and one descent; the odd C2 character gives −1 and no descent. | Squares are killed even when J≠1. | README only. |
| `card_genusFiber_mul_twoPow` | d=2,3,−5; C8 model | 1·1=1 at D=8; 2·1=2 at D=12 and −20; C8 gives 2·4=8. | Cardinality identity includes the imaginary signature. | Headline retained. |
| Small factorizations (`genusFiber_smallFactorizations`) | r=1,2,3, including D=60 | 2⁰=1, 2¹=2, 2²=4; the identities are n=h⁺, 2n=h⁺, 4n=h⁺. For D=60, (−4)(−3)5=60 and r−1=2. | All fibres have the displayed fraction of h⁺. | README only. |
| Cyclic-eight boundary (`genusFiber_cyclicEight_boundary`) | Two cosets in C8 | Even and odd cosets each have 4 elements; quotient 2; two-torsion 2. | Correct 4,2,2 witness. | README only. |
| Composite sign (`genusCharacter_J_eq_sign_prod`) | D=12,136,−4 | At 12: singleton χ(J)=−1=sign δ=sign δ′, empty/full 1; at 136 all values 1; at −4 complementary signs are 1 and −1. | Positive-discriminant hypothesis essential. | Duplicate deleted; supplier contract used. |
| Minus-one signs (`genusCharacter_factorSigns_boundary`) | Factors −4,−8,8,∅ and full factors at 12,136 | Arithmetic values −1,−1,1,1; full-factor values 1,1. Signs of 1 and −4 are 1,−1. | Pinned minus-one theorem computes every value. | README only. |
| `primeDiscriminants_positive_iff` | D=1,5,8,40,136,12,24 | At first five, both sides true; at 12 and 24, negative factors and divisor 3 make both false. Prime supports are ∅,{5},{2},{2,5},{2,17},{2,3},{2,3}. | Both directions include empty and dyadic cases. | Headline retained. |
| Prime-discriminant controls (`primeDiscriminants_boundary`) | D=−4; factors {−4,−8} | At −4, all-positive=false and no-3-mod-4-divisor=true; at product 32 those same truth values occur with D>0 but two even factors. | Positivity and the even-factor restriction are separate. | README Checks. |
| `fundamental_sumTwoSquares_iff` | D=1,5,8,136,12 | 1=1²+0²; 5=1²+2²; 8=2²+2²; 136=6²+10²; none of 12−0,12−1,12−4,12−9 is a square. Prime-divisor condition true,true,true,true,false. | Both iff directions agree; primitive coordinates would be false. | Headline retained. |
| Fundamental-discriminant boundary (`fundamental_sumTwoSquares_boundary`) | D=9 and D=12 | 9=0²+3², but 3 divides 9 and 9 is not squarefree; 12 has v₃=1 and no representation. | Fundamentality cannot be discarded. | README only. |
| `J_square_iff_sumTwoSquares` | d=2,3,34 | At 2: J=1 is square and 8=4+4; at 3: J nonsquare and 12 has no representation; at 34: J square and 136=36+100, with no 3-mod-4 divisor. | Both arithmetic equivalences agree. | Headline retained. |
| `J_ne_one_of_prime_threeModFour` | d=3,p=3; d=7,p=7; d=34 | 3 divides 12 and 7 divides 28, both residues 3; J≠1, no norm −1 unit and h⁺=2h. At 136 the qualifying-prime set is empty although J≠1. | Obstruction true, converse false. | Headline retained. |
| Norm −1 unit at two (`quadratic_two_boundary`) | θ²=2, either θ sign | (1+θ)(θ−1)=2−1=1; N(1+θ)=1−2=−1; J=1. | Integral unit exists and collapses the kernel. | README only. |
| Three/seven boundary (`quadratic_three_seven_boundary`) | Square residues modulo 3 and 7 | Residue sets {0,1} and {0,1,2,4}; −1 has residues 2 and 6, absent in each. Thus norm −1 impossible, J nonsquare and h⁺=2h. | Field-specific controls agree with the general obstruction. | README only. |
| Thirty-four boundary (`quadratic_thirtyFour_boundary`) | Positive norm-one candidates y=1,…,6 | 1+34y² gives 35,137,307,545,851,1225; first square 35². N(35+6√34)=1. A square root unit would require xy=3 and x²+34y²=35; candidate sums are 43 or 307. | Least positive norm-one unit is not a square; no norm −1 unit. J square≠1. | README only. |
| All-place genus-field convention | D=136 and D=12 | At 136, √8 and √17 have real conjugates ±√8,±√17; at 12 the compositum contains √−4 and √−3, while its real subfield is Q(√3). | All-positive compositum is totally real; mixed-sign compositum need not be. | None. |
| `binaryFormGenusChar` definition | Zero form at ∅ and {−4}; [2,0,−6] at {−4}; [−1,0,3] | Values 1,0,0,−1. Zero form at t={0} has no coprime represented value and gives 0; that t fails the prime-discriminant hypothesis. | Both branches and total-function junk inputs accounted for. | Explicitly described as the extension. |
| Restriction agreement target | Δ=12,−20,48 | At 12, [3,0,−1] represents 3, giving −1=−1; at −20, [1,0,5],[2,2,3] give 1=1 and −1=−1; at 48, δ=−3 gives (−3/2)=−1 on [2,0,−6] for both characters. | Same object on the entire stated supplier overlap. | README target; supplier function absent at pins. |
| `binaryFormGenusChar_eq_of_represents` | δ=−4, Q=[1,0,−3] and its negative | Represented values 1,−3 give 1,1; −1,3 on −Q give −1,−1. At δ=5,[2,1,2], coprime values 2,8 give −1,−1; represented 5 is excluded by gcd=5. | Signs and coprimality both matter. | Full extension theorem retained. |
| Evaluation at zero and square discriminants | δ=−4, Q=[1,0,0] and [1,0,−4] | Δ=0: represented 1,9 give 1,1; cofactor 0. Δ=16: represented 1,−3 give 1,1; cofactor −4. Both cofactors are 0 modulo 4. | Extension does not use nonsquareness or Δ≠0. | New README extension Checks. |
| Odd local identity in evaluation proof | Q=[2,1,2], p=5, x=1,y=0 | 4aQ=4·2·2=16; (2ax+by)²−Δy²=4²=16. aQ=4 is a nonzero square modulo 5. | Character factor at represented 2 equals that at a=2. | Route retained. |
| Dyadic local identity in evaluation proof | P=−4,8,−8; Q=[1,0,−3],[1,0,−2],[1,0,−6] at (1,1) | am=−2,−1,−5 respectively; first is not coprime to −4 and is excluded; valid witnesses (0,1) for first give am=−3≡1 mod4, while −1≡7 mod8 and −5≡3 mod8 give value 1. | Dyadic residue classes match the three characters; noncoprime inputs are excluded. | Route retained. |
| `binaryFormGenusChar_eq_zero_iff` | Content 0,1,2 at δ=−4; δ=1 | At δ=−4: gcds 4,1,2 give zero=true,false,true; at δ=1 every gcd with 1 is 1 and zero=false. | Both content-law directions hold, including the zero form. | Full extension theorem retained. |
| Content law with two even factors | t={−4,8}, Q=[1,0,0],[2,0,0] | δ=−32; gcds 1 and 2; character values 1 and 0. At odd squares each factor is 1. | The content theorem correctly has no even-factor uniqueness hypothesis. | New README Check. |
| Empty factor (`binaryFormGenusChar_empty`) | Arbitrary Q, including Q=0 | A represented value always exists (Q(1,0)=a); gcd(a,1)=1; empty character product=1. For Q=0, gcd(0,1)=1 and value=1. | Correct elementary API law. | Declaration and duplicate example deleted. |
| Scalar law (`binaryFormGenusChar_smul`) | μ=−1,0,2; δ=−4 and δ=1 | For Q=[1,0,−3], δ=−4: −1=(−1)·1; 0=0·1 at μ=0 or 2. For δ=1: 1=1·1 even at μ=0. | Zero, nonunit and negative scalars handled. | API kept in README. |
| Direct substitution (`binaryFormGenusChar_comp`) | Identity, T and diag(1,−1) | Identity fixes Q; direct T gives [1,2,−2] from [1,0,−3], both value 1; reflection sends [2,1,2] to [2,−1,2], both value −1 at δ=5. | Represented sets agree for GL₂(ℤ). | API kept in README. |
| Proper action (`binaryFormGenusChar_proper`) | T, S and identity | χ−4(T•[1,0,−3])=1=χ−4([1,0,−3]); χ−4(S•[−1,0,3])=−1=χ−4([−1,0,3]); identity gives the same form. | Inverse-action convention preserved. | API kept in README. |
| Negation (`binaryFormGenusChar_neg`) | Negative factor, positive factor, content-zero branch | χ−4(−[1,0,−3])=−1=(−1)·1; χ5(−[2,1,2])=−1=1·(−1); χ−4(−[2,0,−6])=0=(−1)·0. | Scalar μ=−1 consequence, not another headline. | README API and Checks. |
| Negative-definite extension | δ=−4, [−1,0,−5] | Represented −1,−5 both have character −1; [1,0,5] has character 1; sign(−4)·1=−1. | Supplied positive-definite restriction is respected and extended. | New README Check. |
| `formCharacter_eq_idealCharacter` | D=12, Q=[1,0,−3],[3,0,−1],[−1,0,3] | Coefficient ideals O,(θ),O; oriented classes 1,J,J; characters 1,−1,−1 on both sides. | Negative-leading-coefficient clause essential. | Headline retained on the extension. |
| Empty ideal/form comparison (`formCharacter_empty`) | t=∅, any class, zero represented value | Form character=1, empty ideal character=1; at m=0 still 1=1, with no zero ideal. | Separate empty branch avoids misuse of mk0. | README only. |
| Empty-factor proved example | Q=0 and any Q | 0 is represented by Q=0 and gcd(0,1)=1; for arbitrary Q use a. In either case arithmetic product=1. | Same statement as the deleted empty-factor API. | Duplicate example deleted. |
| Remaining proved content example | δ=−4, Q=[2,0,−6] | Every value is 2(x²−3y²), divisible by 2; gcd with −4 is at least 2. No coprime value exists, so definition gives 0. | Proof elaborates without admitted theorems. | Retained. |
| Discriminant −15 classes (`binaryFormGenusChar_negFifteen_classes`) | δ=5, [2,1,2],[1,1,4] | First represents 2 with (5/2)=−1; second represents 1 with (5/1)=1; both discriminants are −15. | Character separates the displayed proper classes. | README only. |
| Discriminant twelve signs (`binaryFormGenusChar_discriminantTwelve`) | Q, −Q and T•Q | At m=1,−3: 1,1; at m=−1,3: −1,−1; T•Q=[1,−2,−2] still gives 1. | Absolute values would incorrectly turn the −3 value into −1. | README only. |
| Invalid cofactor (`binaryFormGenusChar_invalidCofactor`) | δ=−4, Q=[1,0,2] | Δ=−8; cofactor=2; Q(1,0)=1,Q(1,1)=3; characters 1≠−1. | Rejects evaluation without the cofactor residue hypothesis. | README only. |
| Twelve orientation (`formCharacter_discriminantTwelve_orientation`) | Ideals with generators (1,θ),(3,θ),(−1,θ) | O,(θ),O since θ²=3; oriented classes 1,J,J; any real χ with χ(J)=−1 gives 1,−1,−1. x²−3y² mod3 is 0 or1, so cannot equal −1. | Actual ideals and classes, not arithmetic stand-ins. | README only. |
| Five coefficient ideal (`formCharacter_discriminantFive`) | d=5, Q=[1,1,−1] | Z+(−1+√5)Z/2=O because this generator differs from (1+√5)/2 by −1; class=1; both t=∅,{5} give 1 at m=1. | Integral-basis and character conventions agree. | README only. |
| Coefficient-ideal generator transport | d=3 and d=5 | At 3, D=12 and (D+ω)/2=6±θ, differing from ±θ by 6; at 5, (5+θ)/2 differs from (1+θ)/2 by 2. β differs from (D+ω)/2 by integer −(b+D)/2. | Basis has the correct maximal-order carrier. | Route retained. |
| Coefficient-ideal index and norm | a=1,3,−1 in D=12 examples | Determinants 1,3,−1; absolute norms 1,3,1. Ideals are O,(θ),O respectively. | Absolute value is needed for negative a. | Route retained. |
| Norm-form identity N(ua+vβ)=aQ(u,−v) | D=12, a=3,β=θ,u=v=1 | N(3+θ)=9−3=6; 3Q(1,−1)=3(3−1)=6. At a=−1, N(−1+θ)=−2=(−1)Q(1,−1). | Middle-coefficient sign and factor a correct. | Route retained. |
| Comparison auxiliary ideal | D=12, Q=[3,0,−1], m=−1 at (0,1) | α=−θ, I=(θ), αI⁻¹=O; N(α)=−3=am; N(O)=1=|m|. I has class J and the formula gives J·J=1 for the auxiliary class. | Nonzero hypothesis and absolute norm used correctly. | Route retained. |
| Comparison sign parity | (sign a,sign m)=(++),(+−),(−+),(−−) | [m<0]+[am<0] is 0,2,1,1; [a<0] is 0,0,1,1. Values agree modulo 2 in all four cases. | Orientation exponent is sign a. | Route retained. |
| Conjugating the square root | D=12 and D=5 coefficient ideals | θ↦−θ preserves O and (θ); at 5 both half-generators span O. In general χ(A⁻¹)=χ(A) because 1⁻¹=1 and (−1)⁻¹=−1. | Either ω is valid for the character comparison. | None. |
| Class transformations (2.3)–(2.5) | D=12, A=1,χ(J)=−1 | Reflection gives χ(A⁻¹)=1; [−a,b,−c] gives χ(JA)=−1; −Q gives χ(JA⁻¹)=−1. | Class distinctions survive in prose even when real values agree. | Checks retained. |
| Empty/zero/noncommutative and characteristic controls | C=1; S3; Q8; F2; zero ring | Trivial C has one genus and one fibre element; (12)(23)≠(23)(12); ij=k≠−k=ji; in F2,1+1=0; zero ring has 0=1. | Noncommutative models violate the narrow-class CommGroup carrier; F2 and zero ring violate NumberField/Field hypotheses. No additional assertions are made there. | No narrowing or extra hypotheses. |
| Analytic normalizations and supplier direction | Genus counts r=1,2,3; supplied nonsquare weights | Weights use h⁺,h⁺/2,h⁺/4; supplied and extended weights at −20 are 1,−1, and at 48 with δ=−3 are −1. | Same values used by the earlier analytic sections; no reverse dependency asserted. | Applications paragraph corrected. |

## Maintainer consequences

The new exact supplier contracts name AutomorphicSpectralTheory §4.17a and
MetaplecticAutomorphicForms §7.20a. These are existing earlier owners, so no
other roadmap must add a target and no order change is requested. The
restriction-agreement target awaits the supplier's actual function in the
pinned libraries, as explicitly documented; this is not a supplier scope gap.

Twenty-two former acceptance names were deleted: the seventeen named
boundaries listed in r2a/F01, the composite-sign duplicate, and the four
scalar/substitution/proper/negation API declarations. Their individual names
and mathematical replacements are recorded in the table. All retained
headline signatures and the total definition's body are unchanged. No other
roadmap files or citations were edited, and no commit or external write was
made. A fresh independent review remains necessary.
