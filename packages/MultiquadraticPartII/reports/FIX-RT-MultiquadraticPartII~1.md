# MultiquadraticPartII repair report

Finding IDs below retain each review's numbering; the paragraph identifies review a or b. Overlapping example, signature and manifest repairs are implemented once.

## F01 (P3) — applied

Review a. Five admitted anonymous examples → named boundary targets for the cyclic-eight fibre, radicands 3 and 34, and discriminant-twelve form values. The two retained examples prove values of the new definition directly. Evidence: duke-imamoglu-toth line 414 for fibre sizes, line 989 for the sign, and gross-kohnen-zagier line 491 for represented-value evaluation.

## F02 (P2) — applied

Review a. Coefficient arguments and obsolete pins → `TauCeti.BinaryQuadraticForm ℤ`, `Q.eval`, `Q.discrim` and the actual manifest pins. All Layer 3 signatures and examples use the carrier. Evidence: `TauCeti/NumberTheory/BinaryQuadraticForm/Basic.lean:94,116,146,205`. The proper-invariance signature respects substitution by the inverse matrix; the general GL substitution signature explicitly uses direct substitution.

## F03 (P1) — applied

Review a. The false all-positive warning → total reality and equality with the all-place genus field when every factor is positive; mixed signs require the maximal totally real subfield. Every embedding sends each positive rational square root to a real number. This agrees with `Completed/Multiquadratic/README.md`, Layer 3. No genus-field construction is replanned.

## F04 (P2) — applied

Review a. Four prose-only laws → named empty-factor, scalar, GL substitution and negation signatures, plus the supplied SL-action milestone. README hypotheses, locators and prerequisite lines match. Substitution preserves the selecting predicate for every t and Q, so requires no discriminant hypothesis. Scaling and negation retain the fundamental-divisor hypotheses. Evidence: gross-kohnen-zagier lines 488–499, 529–540.

## F05 (P2) — applied

Review a. Applying the norm argument to any coprime represented value → first handle t=∅ using two trivial characters. Otherwise |δ|>1 makes m nonzero, and a≠0 gives N(α)≠0. Added `formCharacter_empty` and the zero-value Check. The original witness is valid. Evidence: duke-imamoglu-toth lines 1342–1345, with the empty-product identity.

## F06 (P3) — applied

Review a. Twenty-five anonymous examples, mostly about supplied objects → two proved examples testing `binaryFormGenusChar`: the empty factor and content obstruction. Indispensable arithmetic, quotient and unit boundaries are named targets with matching README statements and locators. Their full hypotheses are explicit. This shares the example cleanup with a/F01 without retaining admitted examples.

## F07 (P3) — applied

Review a. Arithmetic surrogates → actual form values, coefficient-ideal equalities and oriented class assertions. Added the requested discriminant −15 and 12 targets, discriminant-five and empty-factor comparisons, and named kernel, descent, genus-cardinality and norm-unit boundaries. Evidence: duke-imamoglu-toth lines 123–137 and 1344–1345; gross-kohnen-zagier lines 488–499. The d=34 negative-unit distinction has an elementary justification in §2.4.

## F08 (P3) — applied

Review a. Missing manifest → `sources.toml` with one lifetime key for each paper, complete bibliographic metadata, printed locators, target associations, legal access URLs, hashes, timestamps and certified status. Both works were fetched through the source service. The initial publisher-host classification failure was settled by the successful legal publisher fetch; no text request remains.

## F09 (P3) — applied

Review a. Unspecified maximal-order and norm inputs → the two quadratic integral-generator theorems and `Ideal.natAbs_det_basis_change`, `Ideal.absNorm_span_singleton` in the exact contracts and §3.2 Needs. The proof transports either root ω from the supplied generator, then shifts by (D+b)/2. Evidence: `TauCeti/NumberTheory/NumberField/Quadratic/RingOfIntegers.lean:327,424`; `Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean:376,381`.

## F01 (P3) — applied

Review b. Redundant direct import of `NarrowClassGroup.Finite` → deleted. The required module remains a public transitive import through `OrdinaryTwoRank` and quadratic conjugation. Evidence: `TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/OrdinaryTwoRank.lean:9` and `TauCeti/NumberTheory/NumberField/Quadratic/Conjugation/NarrowClassGroup.lean:8`. The form-carrier import is genuinely used.

## F02 (P3) — applied differently

Review b. Nonexistent analytic labels → AnalyticNumberTheoryPartI Layer 2 and AutomorphicSpectralTheory §4.17a, verified against their section text. These are described as analytic applications and owners. Both precede this package in the supplied order, so the suggested assertion that they consume its layers would impose a backward dependency. No such dependency or external contract change is asserted.

## F03 (P3) — applied

Review b. GeometryOfNumbersAndQuadraticArithmetic as the owner of imaginary form classes → explicitly its consumption from IntegralLattices Layer B, B2/B4/B5. Evidence: GeometryOfNumbersAndQuadraticArithmetic's scope and supplier paragraph; `TauCetiRoadmap/IntegralLattices/README.md`, B2. Layer 3 retains only the genus character and its comparison on the supplied carrier.

## Required checks and gate failures

- Targeted prerequisite build: `lake build TauCeti.NumberTheory.Multiquadratic.Quadratic.GenusCharacter.OrdinaryTwoRank`, from the content checkout, exit 0: `Build completed successfully (4138 jobs).` The binary-form module's object already existed. No bare build or pin change was run.
- Elaboration: the required `lake env lean` invocation on `packages/MultiquadraticPartII/Suggested.lean`, from the content checkout, exit 0, no errors, 32 expected `declaration uses sorry` warnings. Both anonymous examples execute their proof bodies successfully.
- Binder inspection: a scratch copy followed by `#check @name` for all 33 named declarations elaborated with exit 0. The field, number-field, minimal-polynomial, generation, squarefreeness, positivity, factorization, cofactor, root and coefficient-ideal hypotheses occur in the types that need them. Pure integer and form statements acquire no field parameters.
- Dependency check: the exact required `gate --depcheck` command, with the supplied order and `--movable`, exit 0. Its complete output was:

```text
depcheck: 13 roadmaps, 96 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred.

- Source manifest check: `sources check packages/MultiquadraticPartII/sources.toml`, exit 0: `packages/MultiquadraticPartII/sources.toml: 0 problem(s)`.
- Listed package-rule audit and `git diff --check`: exit 0. The worker's subsequent package gate and independent mathematical review remain separate checks.

Changes for each submission gate failure:

| Gate failure | Repair and checked result |
| --- | --- |
| missing sources.toml | Two certified entries, required schema and bibliographic/access fields, unique keys, exact printed locators and target associations. Source-service check: zero problems. |
| latex=1024 | Converted every mathematical delimiter to Unicode prose or code spans. Zero delimiters outside code. |
| tex=114 | Converted mathematical macros and braced TeX scripts. Zero forbidden syntax outside code; headings and internal heading links did not change. |
| sorry-examples=5 | Removed all five admitted examples; kept exactly two directly proved definition tests. Remaining boundaries are named statements. |
| readme-ids-missing=4 | Declared all four missing laws; also stated the proper SL-action milestone. All 33 named Lean declarations occur in the README. |

## Adversarial mathematics pass

The table audits every retained named statement and both examples. “Presentation” means a number field K with θ integral, `minpoly ℤ θ = X²−d` and `ℚ[θ]=K`; “factorization” includes prime-discriminant membership, at most one even factor, product `fundamentalDiscriminant d` and squarefree d. Real statements add d>0. These hypotheses are explicit in the signatures, rather than proof-only section assumptions.

| Statement | Instances tried | Result and change |
| --- | --- | --- |
| `ker_toClassGroup_eq_pair` | J=1; d=2,3,−1; nonsquarefree presentation d=12 | Pair may coincide; supplied principal-class dichotomy proves both signatures. Endpoint unchanged. |
| `existsUnique_wideCharacter_iff` | Trivial χ; χ(J)=−1; nontrivial square J | Surjectivity gives uniqueness; real characters kill squares. Endpoint unchanged. |
| `narrowDefect_fiber_boundary` | Singleton fibre; two-element fibre; multiplication twice by J | Added actual class/fibre assertions and norm-unit equivalence; requires d>0 for that equivalence. |
| `wideCharacter_boundary` | Trivial, odd and square-defect cases | Added explicit descent statements; both maps are homomorphisms. |
| `card_genusFiber_mul_twoPow` | r=1,2,3; D=5,8,12,28,60,−4; attempted r=0 | Endpoint unchanged. Presentation excludes the empty factorization; natural subtraction is harmless. |
| `genusFiber_smallFactorizations` | One, two, three factors; arbitrary genus g | Added quotient cardinalities 1,2,4 and fibre identities. None asserts class number one. |
| `genusFiber_cyclicEight_boundary` | Square fibre {0,2,4,6}; two-torsion {0,4}; both quotient fibres | Added named target distinguishing fibre size 4 from two-torsion size 2. |
| `genusCharacter_J_eq_sign_prod` | Empty/full subsets; D=8,12,24,136; negative D=−4 | Complementary signs agree only for positive D, retained explicitly. |
| `primeDiscriminants_positive_iff` | D=1,5,8,40,136; 12,24; −4; double-even product 32 | Positivity and at-most-one-even hypotheses exclude both negative controls. Endpoint unchanged. |
| `fundamental_sumTwoSquares_iff` | D=1,5,8,12,136; nonfundamental 9 | Odd prime valuation one is essential; zero and nonprimitive coordinates remain allowed. |
| `J_square_iff_sumTwoSquares` | d=2,3,34 | Square and trivial remain distinct. Corrected the surrounding all-positive genus-field statement. |
| `J_ne_one_of_prime_threeModFour` | d=3,p=3; d=7,p=7; d=34 as failed converse | Nonsquare implies nontrivial; norm-unit criterion and kernel give ratio two. No converse asserted. |
| `genusCharacter_factorSigns_boundary` | −4,8,−8 at −1; empty/full products; signs 1 and −4 | Added named arithmetic normalization, including negative discriminant control. |
| `primeDiscriminants_boundary` | 1,5,8,40,136; 12,24; −4; 32=(−4)(−8) | Added explicit positive cases and both missing-hypothesis controls. |
| `fundamental_sumTwoSquares_boundary` | (1,0),(1,2),(2,2),(6,10); 12; (0,3) for 9 | Added positive, nonprimitive and nonfundamental boundaries. |
| `quadratic_two_boundary` | Both choices of θ=±√2 | 1+θ is an integral norm-minus-one unit; added J=1 conclusion. |
| `quadratic_three_seven_boundary` | Both radicands and either root | Added nonsquareness, norm-unit obstruction and ratio-two targets. |
| `quadratic_thirtyFour_boundary` | 136=6²+10²; least norm-one unit 35+6√34 | Added square-but-nontrivial assertion. Integral-basis and least-unit argument exclude norm −1. |
| `binaryFormGenusChar` | Zero form; t=∅; imprimitive [2,0,−6]; both signs | Real body on the supplied form carrier. Choice-independence is asserted only with the needed factor hypotheses. |
| `binaryFormGenusChar_eq_of_represents` | Δ=0, square Δ,12,−15,48; −4,8,−8; invalid cofactor 2 | Odd-prime square identity and all three dyadic cases give independence. Cofactor congruence retained; Δ=0 is explicitly an elementary extension of the source convention. |
| `binaryFormGenusChar_eq_zero_iff` | Zero form; δ=1; [0,1,0]; multiple even prime discriminants | Content obstruction and CRT give both directions; no cofactor or even-factor restriction needed. |
| `binaryFormGenusChar_empty` | Zero and nonzero forms; represented integer zero | Added named law. The selecting predicate is always inhabited and the empty character is one. |
| `binaryFormGenusChar_smul` | μ=0,−1,2; δ=1; scalar coprime or not coprime to δ | Added law with original fundamental-divisor hypotheses. Noncoprime scalars force the zero branch. |
| `binaryFormGenusChar_comp` | Identity, determinant ±1 matrices, reflection diag(1,−1) | Added general GL substitution. Invertibility makes represented-value predicates equal, including outside valid character discriminants. |
| `binaryFormGenusChar_proper` | Identity; S; T | Added supplied left action with inverse substitution; T sends [1,0,−3] to [1,−2,−2]. |
| `binaryFormGenusChar_neg` | δ<0,δ>0,δ=1; form and its negative; zero branch | Added correct sign multiplier, including negative represented integers. |
| `formCharacter_eq_idealCharacter` | D=5,12; a>0 and a<0; both roots ω; empty factor | Carrier changed, endpoint preserved. Empty factor handled first; nonempty factor gives nonzero m,α. Four norm-sign cases give exponent parity [m<0]+[am<0]=[a<0] modulo two. |
| `formCharacter_empty` | Any class/form; zero form; D=12 with m=0 | Added independent trivial-character boundary. No principal ideal of zero is formed. |
| Empty-factor proved example | Arbitrary form including [0,0,0] | Direct proof unfolds the actual definition and supplies a represented value. |
| Content-obstruction proved example | [2,0,−6], δ=−4, Δ=48 | Direct proof shows any represented value shares a nonunit divisor with δ. No admitted theorem is used. |
| `binaryFormGenusChar_negFifteen_classes` | [2,1,2] represents 2; [1,1,4] represents 1 | Added actual form values −1 and 1, rather than only a Kronecker value. |
| `binaryFormGenusChar_discriminantTwelve` | Q,−Q; represented values −3 and 3; T action | Added values 1,−1 and the negative-middle-coefficient action witness. |
| `binaryFormGenusChar_invalidCofactor` | [1,0,2] represents 1,3 with different arithmetic characters | Added failure witness for dropping the cofactor congruence, without claiming its form character equals both values. |
| `formCharacter_discriminantTwelve_orientation` | Ideals (1,θ),(3,θ),(−1,θ); S rotation; −1 modulo 3 | Added unit/principal ideal equalities, classes 1,J,J, form values 1,−1,−1 and every odd-character evaluation. Membership hypotheses tie all ideals to their construction. |
| `formCharacter_discriminantFive` | (1,(−1+θ)/2), either root; empty/full factors | Added unit ideal/class and actual form values. Integral generator hypotheses are retained. |
| Genus-field convention | All factors positive; mixed-sign factorization 12=(−4)(−3) | Positive compositum is totally real; mixed case uses the maximal totally real subfield, imported from Multiquadratic Layer 3. |
| Integral-basis/norm proof | d≡1 and d≢1 modulo 4; ω and −ω | Transport supplied maximal-order generators before shifting to β. Index determinant is a in basis (1,β), giving norm |a|; no division by zero occurs. |

Pinned object searches found the binary-form carrier, action, quadratic integral-basis theorems, ideal norms and existing singleton/principal-genus results; none is reconstructed. No supplied genus character on binary forms was found. The named sibling roadmaps were searched for the same objects; EffectiveClassNumbers consumes the same supplied form carrier and reduction API, with no competing form-character target. The other hits concern different quadratic-form or narrow-class objects. No new sibling dependency or supplier gap is needed.

## Maintainer consequences

- No named endpoint was deleted. `binaryFormGenusChar` now takes a form Q instead of three coefficient arguments; its evaluation, zero and comparison targets were adapted, and the missing API and boundary targets were added. Any external use of the old triple interface must pass `⟨a,b,c⟩`.
- The two analytic roadmaps precede this package in the supplied merge order. The repaired text identifies their actual application sections without changing their dependency declarations or promising adoption of this package. Such external revisions and any order decision remain outside these edits.
- The package adds no genus-field, form–ideal-bijection, narrow quotient, reduction or negative-Pell theory. The d=34 calculation is a boundary of the existing square/trivial distinction.
- `metadata.toml` is unchanged. No design plan exists in this package, and no supplier gap was introduced. Only the allowed package files and this requested report were written; no commit, push or pull-request edit was made.
