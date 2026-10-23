# Port: MultiquadraticPartII

Branch: `roadmap/multiquadratic-part-ii`.
Head commit: `c0bd5771c837052d0378a3d16b8819988eca16eb`.
Base: `a07e202`; the checkout was clean before branch creation.

The committed content is confined to `TauCetiRoadmap/MultiquadraticPartII/README.md`, `TauCetiRoadmap/MultiquadraticPartII/Suggested.lean` and `TauCetiRoadmap/MultiquadraticPartII/metadata.toml`. The source package was read without modification; this requested report is the only write under `packages/MultiquadraticPartII/reports/`. Nothing was pushed and no pull request, issue or comment was written.

## Draft pull request body

Build the sign-sensitive arithmetic connecting narrow ideal classes, genera and integral binary quadratic forms in real quadratic fields. Extending the completed Multiquadratic roadmap, this develops the exact narrow-to-wide kernel and character descent, equal genus-fibre counts, prime-divisor and two-square criteria for the distinguished class, and a total extension of the supplied form character with its comparison to the narrow ideal genus character. The resulting interfaces distinguish a square distinguished class from a trivial one and preserve the orientation needed by quadratic period and trace formulas.

AI assistance: Codex (GPT-6) performed this port and its mathematical and signature audit.

## Validation

- Command: `lake build TauCetiRoadmap.MultiquadraticPartII.Suggested`.
- Exit status: 0.
- Exact outcome: `Build completed successfully (9094 jobs).`
- Warning count: **10**, all “declaration uses `sorry`”; no other warning or error. The nontrivial proved content-obstruction example succeeds.
- Final push gate: `gate MultiquadraticPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`.
- The initial invocation before committing reported only `dirty=1` for the untracked target folder; every mathematical, content, import and outside-folder counter was zero. A staged invocation likewise reported only the three staged files as dirty. The final invocation checks the clean committed tree and passes.
- Citation resolution: no unresolved cross-roadmap citation and no unresolved local Lean name. Its note that its host cannot inspect Lake packages is not used as evidence about the libraries: both actual dependency checkouts were inspected directly at their manifest revisions.
- `git diff --check`: no whitespace errors.

The complete final dependency-direction output is:

```text
depcheck: 17 roadmaps, 122 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurs. Neither the merge-order file nor the tooling was edited.

## Acceptance signatures and package preservation

`Suggested.lean` is byte-for-byte identical to the accepted package file: ten admitted headline theorems, one real-bodied definition and one proved example, with the single Mathlib import and two individually used Tau Ceti imports. No theorem was weakened, renamed or omitted, and no additional API catalogue was introduced. There is no admitted data, admitted example or option override.

All eleven declarations were mechanically checked in one scratch Lean file with `#check @` and compared individually against the final README. Elaboration returned exit 0. The field, number-field, minimal-polynomial, generation, squarefreeness, positivity, factorization, cofactor, root and coefficient-ideal hypotheses are present wherever needed. Integer-only and form-only declarations do not acquire field parameters. **No binder was lost and no signature changed.**

Nothing moved from Lean to README during this port. The accepted package already places the seventeen boundary targets and the empty, scalar, substitution, proper-action and negation laws in prose, and already omits the duplicated composite-sign theorem. Their mathematical statements and all 49 Check bullets are retained. Restriction agreement with the nonsquare supplier remains the explicit README headline whose supplier function is absent at the pins; the module docstring identifies that missing carrier, with no substitute declaration.

`metadata.toml` retains `topic = "math.NT"`, matching the format of Completed/Multiquadratic and the number-theoretic main-branch models. The completed Multiquadratic and EffectiveBounds roadmaps were read in full as shape models; ClassicalArithmeticCompletion and NumberFieldArithmetic were also read at the relevant interfaces.

## Supplier replacements and duplication sweep

The accepted ownership decisions are preserved:

- Multiquadratic Layers 2–3 and the pinned Tau Ceti modules supply the narrow class group, elementary-two quotient, principal genus test, singleton sign, positivity square criterion and two-rank formula. No second quotient, genus field or singleton criterion is planned.
- AutomorphicSpectralTheory §4.17a, `quadratic_weyl_domains`, supplies the composite real sign law. The full paragraph was read at its supplied open head; its normalization gives −1 for both negative factors at D=12 and +1 for the factors 8 and 17 at D=136.
- MetaplecticAutomorphicForms §7.20a, `quadraticTraceData`, supplies the nonsquare, imprimitive form character, represented-value existence and independence, and proper invariance. Its full paragraph was read at the open head. This roadmap owns the extension to zero and square discriminants and negative definite forms, restriction agreement, and the comparison on the pinned narrow carrier. The variant is explicit in Scope and ownership.
- IntegralLattices Layer B, B1–B3, supplies the binary-form/order dictionary and the sign clause for negative leading coefficient; GlobalNumberFields Layer 11 owns orders and Picard/narrow Picard carriers. Neither construction is repeated here. The comparison uses the explicit coefficient ideal and needs no identification of NarrowPic with the pinned narrow class group.
- ClassicalArithmeticCompletion §§5.21, 5.23–5.24 owns the general negative-Pell comparisons. Its main-branch sections were read, and an explicit ownership clause was added. This roadmap's full-group kernel and character descent are different interfaces; the d=34 calculation remains a Check.
- GeometryOfNumbersAndQuadraticArithmetic §4.3 and its exact supplier paragraph consume the negative-discriminant proper-form dictionary from IntegralLattices B2/B4/B5. AnalyticNumberTheoryPartI §2.25 consumes the real sign law from AutomorphicSpectralTheory. Neither is made a reverse consumer of this roadmap.

Object searches used `roadmaps grep` against the indexed open heads and every roadmap on main, followed by `roadmaps show` for the actual analytic suppliers. Separate searches covered the board packages and all fifteen specifically supplied sibling folders. EffectiveClassNumbers uses the supplied positive-definite form carrier, reduction and imaginary genus divisibility, not this extension. The other fourteen sibling folders have no competing construction of this roadmap's objects. Main-branch ClassicalArithmeticCompletion was used for its existing roadmap scope; its progress/revision pull request is not a dependency. Other broad-search hits concerning genera of higher-dimensional lattices, genus-one fibres, relative norms and imaginary character classification concern different objects. No declaration here has another roadmap's fully qualified name.

No additional mathematical duplicate was found that required deleting an accepted headline. The only new ownership clarification concerns ClassicalArithmeticCompletion; all removals from the earlier package history remain recorded only as scope boundaries in the roadmap.

Direct roadmap dependencies that remain new-roadmap pull requests are **AutomorphicSpectralTheory** and **MetaplecticAutomorphicForms**, by the sections above. IntegralLattices, GlobalNumberFields, ClassicalArithmeticCompletion and the completed Multiquadratic roadmap are cited as they stand on main. GeometryOfNumbersAndQuadraticArithmetic and AnalyticNumberTheoryPartI are ownership/application citations, not extra imported results.

## Pinned library and source evidence

The manifest and actual checkouts agree: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Both imported Tau Ceti modules exist at that revision.

| Native interface | Pin evidence and restrictions |
| --- | --- |
| Narrow quotient and principal classes | `TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.lean:67,83,96,150,164,206,224,229,237`. The native quotient is `(FractionalIdeal (𝓞 K)⁰ K)ˣ ⧸ narrowPrincipalSubgroup K`, and the subgroup is the image of totally positive field units. Positive norm is not its definition for arbitrary number fields. |
| Binary forms | `TauCeti/NumberTheory/BinaryQuadraticForm/Basic.lean:94,116,146,188,205`. The native structure has only coefficients a,b,c; it does not impose primitivity, nonzero discriminant or definiteness. Evaluation is `a*x^2+b*x*y+c*y^2`; the supplied action substitutes the inverse matrix. |
| Quadratic principal-class dichotomy and norm-unit criterion | `TauCeti/NumberTheory/NumberField/Quadratic/Conjugation/NarrowClassGroup.lean:87,144,215`. The dichotomy requires the minimal polynomial and generation; the norm-unit iff additionally requires d>0. Finiteness and the class-number product are in `TauCeti/NumberTheory/NumberField/NarrowClassGroup/Finite.lean:38,59`. |
| Elementary-two quotient | `TauCeti/Algebra/Group/ElementaryTwoQuotient/Basic.lean:105,135,195,341`; `TauCeti/NumberTheory/NumberField/NarrowClassGroup/ElementaryTwoQuotient.lean:67,100`. The target is additive; q(1)=0, and q(A)=0 iff A is a square. |
| Two-rank and ramification | `TauCeti/NumberTheory/Multiquadratic/Quadratic/TwoRank.lean:239`; `TauCeti/NumberTheory/Multiquadratic/Quadratic/Ramification.lean:186`. The rank theorem includes either signature and requires squarefree d. |
| Discriminant carriers | `TauCeti/NumberTheory/Multiquadratic/Prime/Discriminant/Basic.lean:50,54`; `TauCeti/NumberTheory/Multiquadratic/Prime/Discriminants.lean:450`; `TauCeti/NumberTheory/Multiquadratic/FundamentalDiscriminant/Basic.lean:68,234`; `TauCeti/NumberTheory/Multiquadratic/FundamentalDiscriminant/OfSquarefree.lean:51`; `TauCeti/NumberTheory/Multiquadratic/FundamentalDiscriminant/Subfactorization.lean:70`. The fundamental predicate includes 1. |
| Arithmetic character | `TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/Basic.lean:212,231,253,266,277`; `TauCeti/NumberTheory/Multiquadratic/Legendre/PrimeDiscriminant/Character.lean:71`. The arithmetic function is total; prime-discriminant hypotheses belong to its API. Its value at negative integers is not replaced by the value at their absolute value. |
| Ideal character | `TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/CoprimeIdeal.lean:52,71,103`; `TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/NarrowClassGroup.lean:134,157,222`; `TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/PrincipalGenus.lean:150`; `TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/OrdinaryTwoRank.lean:111,164`. Coprime-ideal membership uses the subset modulus δ, with nonzero ideals already in the carrier. The J-value at line 111 is singleton, not composite. |
| Maximal-order generators | `TauCeti/NumberTheory/NumberField/Quadratic/RingOfIntegers.lean:327,418,424`. Both declarations retain hmin,hgen,hsf and their respective congruence hypothesis; the second uses an explicit include block. |
| Ideal norms | `Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean:352,376,381`. The same finite-rank integral bases compute the absolute determinant; principal ideal norm is the absolute value of the integral algebra norm. |
| Quotient and fibre arguments | `Mathlib/GroupTheory/QuotientGroup/Defs.lean:249`; `Mathlib/GroupTheory/QuotientGroup/Basic.lean:159`; `Mathlib/GroupTheory/Coset/Basic.lean:493`; `Mathlib/GroupTheory/Coset/Card.lean:53`. Surjectivity is explicit for the first-isomorphism and fibre equivalences. |
| Two squares | `Mathlib/NumberTheory/SumTwoSquares.lean:211`. `Nat.eq_sq_add_sq_iff` is the valuation-parity theorem; at zero its total valuation is 0. It does not assert the no-prime-divisor criterion for arbitrary integers. The two initial unresolved-name leads were module paths, now spelled as paths in README. |

These file locators are relative to the named pinned library. Object searches found no pinned total form genus character or restriction-comparison supplier function. That absence is supported by searches over the form, genus-character and number-theory sources, rather than inferred from a failed spelling lookup. The implemented ambiguous class-number formulas count two-torsion, not genus fibres.

The two certified, legally hosted source extractions were read at all used passages. Bibliographic links and printed locators remain in README; no passages were copied.

| Claim | Exact extraction locator |
| --- | --- |
| Narrow quotient, J and norm-unit criterion | duke-imamoglu-toth line 76; duke-imamoglu-toth line 86. Printed §2, pp.950–951. |
| Form convention, fundamental primitivity and class transformations | duke-imamoglu-toth line 113; duke-imamoglu-toth line 123. Printed §2, pp.951–952, (2.3)–(2.5). |
| Genus quotient and fibre size | duke-imamoglu-toth line 410. Printed §4, p.959, (4.1)–(4.2). |
| Principal genus and arithmetic criteria | duke-imamoglu-toth line 444. Printed §4, p.960, after (4.4). |
| Descent | duke-imamoglu-toth line 960. Printed §7, p.971, after (7.7). |
| Composite sign with the real qualifier | duke-imamoglu-toth line 964; duke-imamoglu-toth line 989. Printed §7, p.971, before (7.8). |
| Nonsquare form-character domain, imprimitive zero branch and comparison | duke-imamoglu-toth line 1328; duke-imamoglu-toth line 1334. Printed §9, pp.977–978, before Proposition 5. |
| Nonzero-discriminant source convention | gross-kohnen-zagier line 299. Printed Notations, p.503. The zero-discriminant extension is justified separately. |
| Fundamental-divisor character and scaling | gross-kohnen-zagier line 487. Printed Ch. I §2, p.508. |
| Local odd-prime and dyadic proof | gross-kohnen-zagier line 521. Printed proof of Proposition 1, p.509. Its N=1 local step needs the cofactor congruence, not nonzero or nonsquare discriminant; all dyadic cases were recomputed. |

The public Mathlib-pull-request and Lean-Zulip searches for narrow class groups and form genus characters produced no actionable design proposal. No assertion of upstream absence or dependency timing is based on those search results; the port uses the inspected native pinned carriers.

## Upstream mathematical reread and fixes

The entire final README was reread after editing. The following changes make the port more precise without changing accepted scope:

1. In §3.2's empty-factor Check, the zero form had been used inside a comparison requiring discriminant D>1. It now uses [1,0,−3] at D=12 and the represented value Q(0,0)=0. Both characters are 1, and no zero ideal is formed. The zero-form law itself remains in §3.1.
2. The d=34 negative-unit explanation now displays the integer candidate values and supplies an elementary interval argument, rather than implicitly invoking cyclic generation of the unit group. For v=x+y√34 of norm −1 in [1,35+6√34), y can equal 6; the six values 33,135,305,543,849,1223 are all nonsquares. This also avoids an unnamed unit-group prerequisite. The norm-one candidates and 35²−34·6²=1 are retained.
3. The §0.1 opening now states its actual two-signature quadratic hypotheses, agreeing immediately with the Lean type. The conventions explicitly allow any universe and state the number-field assumptions.
4. The Mathlib two-square module is spelled `Mathlib/NumberTheory/SumTwoSquares.lean`, distinguishing it from a declaration. Exact supplier paths were added for all groups of imported declarations, including their required finiteness and surjectivity assumptions.
5. Scope and ownership explicitly assigns the general negative-Pell comparisons to ClassicalArithmeticCompletion §§5.21, 5.23–5.24. No negative-Pell theorem is added here.
6. The convention D>1 is explicitly confined to real squarefree field applications, since the retained kernel, descent and fibre theorems also allow imaginary fields (for d=−1 the discriminant is −4).
7. The D=136 example now says every **real class character** kills J, and the D=12 coefficient-ideal Check says every χ_t has value 1 **on that identity class**. Neither sentence is a claim about arbitrary complex characters or about all character values. The undefined phrase “all-even” was replaced by the explicit condition χ(J)=1.

## Adversarial mathematics pass

The following is my computed pass, not an adoption of the supplied reviews' verdicts. In the table C means the narrow group, W the wide group, q the supplied elementary-two map, and J the principal square-root class. Field examples use the genuine quadratic minimal polynomial and generation; arithmetic examples explicitly allow D=1. Character values are integer values. Each row gives actual values or both truth values, including negative controls.

The separate finite falsification search used coefficients a,b,c in −4,…,4, represented pairs in −8,…,8 and factors ∅,{−4},{8},{−8},{−3},{5},{−4,−3},{8,17}. There were **1,658 admissible form/factor cases**, **8,290 scalar comparisons** for μ=−2,−1,0,1,2, **8,748 unrestricted content cases** including multiple dyadic factors, and **303 positive fundamental discriminants through 1,000** for the two-square iff. All tested identities agreed. This search is supplemental evidence, not a proof of the general theorems.

| Statement | Instances tried | Computed values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Quadratic presentation | d=0,1,2; θ²=12 in Q(√3) | X² and X²−1 are reducible, so cannot be a quadratic minimal polynomial; X²−2 is irreducible; (2√3)²=12. | Degenerate presentations excluded; non-squarefree presentations allowed where stated. | Universe and opening hypotheses made explicit. |
| Discriminant normalization | d=2,3,5,7,34 | D=8,12,5,28,136; odd 5≡1 mod4, other four give 4d. | d and D stay distinct. | None. |
| Narrow positivity relation | α=±1 and ±√3 | N(±1)=1, signs (++),(−−); multiplication by −1 sends (−−) to (++). N(±√3)=−3, signs (+−),(−+). | Positive norm agrees with a totally positive associate only in this quadratic signature. | None. |
| J and the different | d=3 and d=5 | √12=2√3, multiplier 2>0; √5=θ. Changing θ to −θ leaves (θ) equal to (−θ). | Same narrow principal class in both normalizations. | None. |
| Prime-discriminant convention | p=2,3,5,7; dyadic cases | Odd-prime factors −3,5,−7; separate dyadic factors −4,8,−8. Raw oddPrimeDiscriminant(2)=−2 is excluded from that prime API. | No accidental odd-prime treatment of 2. | None. |
| Signed factorization and count | D=12,24,60,136 | Products (−4)(−3)=12, (−8)(−3)=24, (−4)(−3)5=60, 8·17=136; r=2,2,3,2. | Counts rational ramified primes, independent of factor signs. | None. |
| Fundamental subproducts | s={−4,−3} and empty subset | δ=1,−4,−3,12, with complements 12,−3,−4,1; products all 12. | Includes 1 and complementary equal signs for positive D. | None. |
| q additive normalization | C8 and identity | q(0)=0, q(1)=1, q(2)=0; multiplicative identity maps to additive 0. | Principal genus is the zero fibre. | None. |
| Narrow/wide class-number notation | Model with #W=h and J≠1 | #ker=2 and #C=2h; for h=1 this is 2=2·1, not h=2h. | DIT h(D) must be read as h⁺. | Existing explicit warning retained. |
| Form polynomial and discriminant | [1,0,−3], [2,1,2], zero form | Q(1,1)=−2,5,0; b²−4ac=12,−15,0. | Full middle coefficient and discriminant conventions agree. | None. |
| Fundamental divisor | Δ=12,0,16,−8; δ=−4 | Cofactors −3,0,−4,2 have residues 1,0,0,2 mod4. | Last case excluded; square/zero cases allowed. | None. |
| `ker_toClassGroup_eq_pair` | d=2,3,−1 and nonsquarefree d=12 | d=2 has N(1+θ)=−1 and J=1, kernel size 1; d=3 has J≠1, kernel {1,J} size 2; d=−1 has no real places, J=1; θ=2√3 gives the same J as √3. | Both directions and both signatures hold. | Prose opening matches signature. |
| Quotient by J | Singleton and two-element kernel models | C/{1} has #C elements; C/{1,J} has #C/2; for C2→1, 2/2=1. | Correct source and target C/⟨J⟩→W. | None. |
| Wide-fibre action | J=1 and J≠1; any A | {A,JA} has 1 or 2 entries; J(JA)=A because J²=1, and JA=A iff J=1. | No false assertion of two distinct entries in collapsed case. | None. |
| `existsUnique_wideCharacter_iff` | C=1; C2→1 with χ(J)=−1; C4 with J=2 | Trivial group has 1 descent and χ(J)=1; odd C2 character has 0 descents and χ(J)=−1; both real C4 characters have χ(2)=1 and descend to C2. | Existence and uniqueness both tested. | None. |
| Real versus complex descent | C4, J=2 | Real χ(1)=−1 gives χ(J)=(−1)²=1; complex χ(1)=i gives χ(J)=i²=−1. | Square J need not be killed by complex characters. | None. |
| `card_genusFiber_mul_twoPow` | C1,C3,C8; r=1,1,2; imaginary D=−4 | 1·1=1; 1·3=3; 2·4=8; Gaussian case 1·1=1. | Finite equal fibres, not two-torsion. | None. |
| Empty field factorization | s=∅ | Product 1 would force d=1; X²−1 reducible. Raw natural 0−1=0 and 2⁰=1 never create a field instance. | Junk natural subtraction does not admit a false field case. | None. |
| Nonempty/divisibility consequences | r=1,2,3 | Quotient sizes 1,2,4; h⁺=1·f,2·f,4·f respectively, with f≥1 from surjectivity. | Nonemptiness and divisibility are genuine finite-group consequences. | None. |
| Composite J-value, supplied | D=12; t=∅,{−4},{−3},s | χ_t(J)=1,−1,−1,1; signs of products 1,−4,−3,12 are 1,−1,−1,1. | Supplied normalization matches all subsets. | No restatement in Lean. |
| Negative D control | D=−4=1·(−4) | Complementary signs 1 and −1; imaginary J=1 has χ(J)=1. | Real qualifier cannot be removed. | None. |
| `primeDiscriminants_positive_iff` | D=1,5,8,40,136;12,24 | Both sides true for first five; both false for 12 and24 because 3 divides them. | Empty and dyadic cases included. | None. |
| At-most-one-even control | s={−4,−8} | D=32>0, left false, right true since only prime divisor is2. | Needed hypothesis independently of positivity. | None. |
| Positivity control | D=−4,s={−4} | Left false; right true, only prime divisor2. | D>0 needed. | None. |
| `fundamental_sumTwoSquares_iff` | D=1,5,8,12,136 and nonfundamental9 | 1=1²+0²,5=1²+2²,8=2²+2²,136=6²+10²; for12 both sides false. For9 left true (0²+3²), right false. | Fundamental and positive hypotheses do real work. | None. |
| Valuation route and junk zero | D=12,9,0 | v₃(12)=1 odd; v₃(9)=2 even; total v₃(0)=0 and 0=0²+0². | Generic valuation theorem differs from no-divisor specialization; D=0 excluded. | None. |
| `J_square_iff_sumTwoSquares` | d=2,3,34 | D=8,12,136: square-J truth values true,false,true, matching sum-of-two-squares and divisor criteria. | No replacement of square by trivial. | None. |
| d=34 square/nontrivial distinction | D=136 and ε=35+6√34 | 6²+10²=136; N(ε)=1225−1224=1; norm-minus-one candidate squares are 33,135,305,543,849,1223, all nonsquares. | J is square and J≠1; no norm-minus-one unit. | Added finite values and interval argument. |
| Square-root-of-ε Check | xy=3 from 2xy=6 | (abs x,abs y)=(3,1),(1,3) give x²+34y²=43,307, neither35. | No integral unit squares to ε. | Original coefficient test retained. |
| Minimal norm-one witness | y=1,…,6 at d=34 | 1+34y²=35,137,307,545,851,1225; only last is square 35². | ε is least positive norm-one unit >1. | Values exposed. |
| `J_ne_one_of_prime_threeModFour` | d=3,p=3; d=7,p=7; failed converse d=34 | −1 mod3=2 outside squares {0,1}; −1 mod7=6 outside {0,1,2,4}; kernels have2 and h⁺/h=2. At136 no such prime but J≠1. | Obstruction is sufficient, not necessary. | None. |
| Binary character real-bodied definition | Q=[1,0,−3], t={−4}; Q=[2,0,−6]; t=∅,Q=0 | First gives1 at m=1 and−3; second has no coprime value, hence0; empty product gives1 at m=0. | Both choice and zero branches are determined. | None. |
| Total invalid-factor input | t={0},Q=0 | δ=0 and every value m=0, gcd(0,0)=0≠1, so definition returns0. | Totality creates no prime-discriminant assertion. | No extra headline. |
| `binaryFormGenusChar_eq_of_represents` | δ=−4, Q=[1,0,−3],[1,0,0],[1,0,−4] | At m=1,−3 values are1,1; odd squares give1 at Δ=0; Δ=16 likewise gives1,1. | Handles negative m, square and zero discriminants. | None. |
| Cofactor necessity | Q=[1,0,2],δ=−4 | Δ=−8, cofactor2; represented1,3 give characters1,−1. | Evaluation iff hypotheses cannot be omitted. | None. |
| Odd-prime local identity | Q=[2,1,2],p=5,(x,y)=(1,0) | 4aQ=4·2·2=16=(4)²−(−15)·0²; χ₅(2)=−1 at both choices of represented value2. | Local square argument excludes sign reversal. | None. |
| Three dyadic local identities | [1,0,−3] at δ=−4; [1,0,−2] atδ=8; [1,0,2] atδ=−8 | a·m=−3≡1 mod4; −1≡7 mod8; 3≡3 mod8; all respective characters1. | All dyadic factors treated with their own residues. | None. |
| `binaryFormGenusChar_eq_zero_iff` | [2,0,−6],δ=−4; [0,1,0],δ=−4; Q=0,δ=1 | gcd(2,−4)=2: character0, noncoprimality true; xy represents1: character1 and noncoprimality false; empty factor character1 and gcd(0,1)=1. | Both directions and coefficient-b-only case hold. | None. |
| CRT representation existence | Q=xy,δ=−4; Q=2x²,δ=−4 | Q(1,1)=1 coprime to4 despite a=c=0; every value of2x² is even. | Content, not either individual coefficient, is the right obstruction. | None. |
| Empty-factor API | Every Q including zero | δ=1; gcd(Q(0,0),1)=1; empty product character1. | Value1, including total zero argument. | None. |
| Scalar API | Q=[1,0,−3],δ=−4; μ=−1,0,2; δ=1 | Left values −1,0,0 equal χ(μ)·1=−1,0,0; at empty factor μ=0 gives1=1·1. | Zero and noncoprime scalars included. | None. |
| GL substitution API | Q=[1,0,−3]; identity,T,S,diag(1,−1) | Direct T gives[1,2,−2], S gives[−3,0,1], reflection gives Q; all character1. Inverse maps recover the original represented integer. | Same represented-value predicate, also for invalid factors. | None. |
| Proper left action API | T and S | T⁻¹ substitution gives[1,−2,−2] with value1; S sends[−1,0,3] to[3,0,−1] with value−1. | Inverse-action convention retained. | None. |
| Negation API | δ=−4,Q=[1,0,5];δ=5,Q=[2,1,2]; zero branch | Values change1→−1 with signδ=−1; −1→−1 with signδ=1; 0→0. | Correct integer sign at negative represented values. | None. |
| Restriction agreement headline | Δ=−20,12,48 with permitted supplier inputs | Supplied/extended pairs (1,1),(−1,−1) at−20; (−1,−1) at12; (−1,−1) for δ=−3 and[2,0,−6] at48. | No sign or imprimitive-value mismatch. | README target retained; missing pinned supplier carrier stated. |
| `formCharacter_eq_idealCharacter` | D=12: [1,0,−3],[3,0,−1],[−1,0,3];D=5:[1,1,−1] | Coefficient ideals O,(√3),O,O; oriented classes1,J,J,1; atδ=−4 first three values1,−1,−1, atδ=5 last value1. | Construction hypothesis ties the actual ideal to Q; orientation essential. | None. |
| Coefficient-ideal integrality | D=12,β=√3;D=5,β=(−1+√5)/2 | β²+0β−3=0; β²+β−1=0. | Integral generators, no arbitrary fractional-ideal norm assumption. | None. |
| Maximal-order basis transport | d=3 and5; both roots | At3, β=±θ and generator2d±θ=6±θ; at5, (D+ω)/2 differs from (1+ω)/2 by2, and from β by3. | Integral shifts and signs preserve the maximal order. | None. |
| Coefficient-ideal absolute norm | D=12,a=1,3,−1 | Basis determinants1,3,−1 give norms1,3,1. | Absolute value is required. | None. |
| Norm-form identity | D=12,[a,b,c]=[3,0,−1],u=v=1 | N(3+√3)=6=3Q(1,−1)=3·2; at a=−1, N(−1+√3)=−2=(−1)·2. | Factor a and middle-coefficient sign correct. | None. |
| Auxiliary ideal and nonzero denominator | Q=[3,0,−1],m=−1,δ=−4 | α=−√3, Nα=−3=am≠0; b=α(√3)⁻¹=O, Nb=1=abs(m). | All inverses and principal ideals are nonzero. | None. |
| Four sign cases | (signa,signm)=(++),(+−),(−+),(−−) | [m<0]+[am<0]=0,2,1,1; [a<0]=0,0,1,1; parity equal in all four cases. | Oriented character formula follows with signδ. | None. |
| Conjugate root | D=12 and5 | √3↦−√3 preserves O and(√3); at5 both half-generators span O; χ(1⁻¹)=1,χ((−1)⁻¹)=−1. | Either root gives the same real character. | None. |
| Empty-factor comparison | D=12,Q=[1,0,−3],(0,0) | m=0, gcd(0,1)=1, form and ideal values1=1; zero form has discriminant0≠12. | Valid point with zero represented integer; no zero ideal. | Invalid zero-form comparison Check repaired. |
| Class transformations | D=12,A=1,χ(J)=−1 | Reflection A⁻¹ gives1; [−a,b,−c] at JA gives−1; −Q at JA⁻¹ gives−1. | Real values agree where inverse classes differ; no class identity inferred from that. | None. |
| All-place versus narrow genus field | D=12 and136 | At12 the compositum contains √−4=2i, so is not totally real; real fixed part contains √3. At136 both √8 and√17 have two real signs and compositum degree4, all real. | Positive-factor and mixed-sign branches agree with base roadmap. | None. |
| Noncommutative/type controls | S3,Q8,F2,zero ring | (12)(23)=(123)≠(132)=(23)(12); ij=k≠−k=ji; in F2,1+1=0; zero ring0=1. | First two violate CommGroup; last two violate number-field characteristic-zero/field assumptions. | No unnecessary hypotheses added. |
| Metadata and carrier bounds | Finite C,δ=1 and genuine D>1 | Nat.card(C)>0; #empty product=1; field degree2≠1. | No infinite-cardinality zero or rational-field stand-in. | None. |

The following rows record each of the 49 README Check bullets individually, in section order. They also recompute the worked examples against the formulas above.

| Statement | Instances tried | Computed values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 Check 1 | J=1 | {1,J}={1}, kernel and fibres cardinality1. | Singleton branch holds. | None. |
| 0.1 Check 2 | d=2,u=1+√2 | Nu=1−2=−1; ker size1 and J=1. | Injective branch holds. | None. |
| 0.1 Check 3 | d=3,no norm−1 unit | Squares mod3={0,1}, −1=2; ker size2; J swaps A,JA and squares to identity. | Distinct branch holds. | None. |
| 0.2 Check 1 | Trivial χ | χ(J)=1 and unique wide character1. | Exactly1 descent. | None. |
| 0.2 Check 2 | χ(J)=−1 | A descent would give χ(J)=ψ(1)=1≠−1. | Exactly0 descents. | None. |
| 0.2 Check 3 | C4,J=2 | J=1 gives χ(J)=1; square J=2 gives (±1)²=1, whereas i²=−1. | Real/complex distinction holds. | None. |
| 1.1 Check 1 | s={5},{8} | r=1 and 2^(r−1)=1; 1·#G=#C. | No class-number-one assertion. | None. |
| 1.1 Check 2 | D=12,28 | Products(−4)(−3)=12,(−4)(−7)=28; quotient2 and fibre h⁺/2. | Two genera. | None. |
| 1.1 Check 3 | D=60 | (−4)(−3)5=60, r=3, quotient4, 4·#G=h⁺. | Four genera. | None. |
| 1.1 Check 4 | C8 | Square fibre{0,2,4,6} size4, other fibre{1,3,5,7} size4; 2-torsion{0,4} size2. | Distinct carriers. | None. |
| 2.1 Check 1 | D=12 subsets | Singleton values−1,−1; empty/full values1,1. | Product normalization agrees. | None. |
| 2.1 Check 2 | δ=−4,−8,8,1 at−1 | Values−1,−1,1,1 equal signsδ. | Opposite convention excluded. | None. |
| 2.1 Check 3 | D=24 | (−8)(−3)=24; 8(−3)=−24. | Negative dyadic factor required. | None. |
| 2.1 Check 4 | D=8,136 | χ_8(J)=1; subset products of8,17 all positive, every value1. | Does not force J=1 at136. | None. |
| 2.1 Check 5 | Empty factor;D=−4 | Empty product1; complementary signs1,−1 at−4. | Real qualifier enforced. | None. |
| 2.2 Check 1 | D=12,24 | 3 divides12 and24; all-positive false and no-3mod4-prime false. | Both iff sides false. | None. |
| 2.2 Check 2 | D=1,5,8,40,136 | Prime sets∅,{5},{2},{2,5},{2,17}; no residue3; all signed factors positive. | Both iff sides true. | None. |
| 2.2 Check 3 | Two even factors | (−4)(−8)=32, signs negative; only prime2. | False/true if even-factor hypothesis dropped. | None. |
| 2.2 Check 4 | D=−4 | Left false,right true. | Positivity necessary. | None. |
| 2.3 Check 1 | Three representations | 1²+2²=5,2²+2²=8,6²+10²=136; coordinate gcd1,2,2. | Nonprimitive representations allowed. | None. |
| 2.3 Check 2 | D=12 | Squares≤12 are0,1,4,9; pair sums never12; prime3 divides12. | Both sides false. | None. |
| 2.3 Check 3 | D=9 | 0²+3²=9 but3 divides9 and3mod4=3;9 not squarefree. | Fundamentality necessary. | None. |
| 2.3 Check 4 | D=1 | 1²+0²=1, no prime divisor; X²−1 reducible. | Arithmetic accepted, field excluded. | None. |
| 2.4 Check 1 | D=12 | 3 divides12 and signs−1,−1, so IsSquare J false. | Outside principal genus. | None. |
| 2.4 Check 2 | D=136 | 36+100=136, factors8,17 positive, IsSquare J true. | Inside principal genus. | None. |
| 2.4 Check 3 | d=34 | N(35+6√34)=1; norm−1 candidates33,135,305,543,849,1223 nonsquare. | J≠1 despite being square. | Interval justification expanded. |
| 2.4 Check 4 | d=3 and34 | At3 χ_singleton(J)=−1, no descent; at34 all real characters give1 and descend, while kernel still2. | Descent does not identify narrow and wide relations. | None. |
| 2.5 Check 1 | d=3,p=3 | N unit mod3 would require square2; squares0,1. Kernel2, h⁺=2h. | Obstruction holds. | None. |
| 2.5 Check 2 | d=7,p=7 | −1=6 outside squares0,1,2,4. Kernel2, h⁺=2h. | Obstruction holds. | None. |
| 2.5 Check 3 | d=2 | (1+θ)(θ−1)=θ²−1=1; N(1+θ)=−1; J=1. | Collapsed defect. | None. |
| 2.5 Check 4 | D=136 | Prime divisors2,17 have residues2,1; J≠1. | Converse fails. | None. |
| 3.1 Check 1 | Q=[1,0,−3],δ=−4 | Q(1,0)=1,Q(0,1)=−3; χ(1)=χ(−3)=1, but χ(abs(−3))=χ(3)=−1. | Absolute-value definition excluded. | None. |
| 3.1 Check 2 | −Q=[−1,0,3] | Represents3; χ(3)=−1=sign(−4)·1. | Negation sign correct. | None. |
| 3.1 Check 3 | [2,0,−6],δ=−4 | Δ=48, content2,gcd(2,4)=2; every represented value even, so0. | Zero branch and proved example agree. | None. |
| 3.1 Check 4 | [1,0,2],δ=−4 | Δ=−8,cofactor2; at(1,0),(1,1) values1,3 give characters1,−1. | Evaluation law cannot apply. | None. |
| 3.1 Check 5 | Δ=−15,δ=5 | [2,1,2] givesχ(2)=−1;[1,1,4] givesχ(1)=1. | Two proper classes separated. | None. |
| 3.1 Check 6 | δ=1,Q=0 | Q(0,0)=0,gcd(0,1)=1,empty product1. | Character1; zero ideal still forbidden. | None. |
| 3.1 Check 7 | T action | Inverse substitution gives[1,−2,−2]; direct substitution[1,2,−2]; both character1. | Action fixed by coefficient values. | None. |
| 3.1 Check 8 | Supplier overlap −20,12,48 | At−20 form values1,−1; at12,[3,0,−1] gives−1; at48 withδ=−3,[2,0,−6] gives−1 and gcd(2,3)=1. | Both characters agree; imprimitive need not vanish. | None. |
| 3.1 Check 9 | Δ=0 and16 | [1,0,0] givesχ(odd square)=1;[1,0,−4] represents1,−3 withχ=1,1. | Beyond nonsquare supplier, within cofactor law. | None. |
| 3.1 Check 10 | Negative definite and zero branches | [−1,0,−5] gives−1 versus1 for[1,0,5]; δ=5 gives−1 for ±[2,1,2]; content-zero pair gives0,0. | All negation branches agree. | None. |
| 3.1 Check 11 | μ=0;empty/nonempty factors | Zero form hasgcd(0,δ)=absδ>1 for nonempty t, character0=0·χ(Q); empty factor gives1=1·1. | Total scalar law correct. | None. |
| 3.1 Check 12 | t={−4,8} | δ=−32;[1,0,0] gives1,gcd(1,32)=1;[2,0,0] gives0,gcd(2,32)=2. | Zero law needs no single-even restriction. | None. |
| 3.2 Check 1 | D=12,Q=[1,0,−3],t=∅ | Q(0,0)=0 and both characters1; zero form'sΔ=0≠12. | Nonvacuous empty-factor comparison. | Zero form replaced by valid form. |
| 3.2 Check 2 | D=12,Q=[1,0,−3] | I=O,χ_t(1)=1; represented1 gives1. | Actual ideal agrees. | None. |
| 3.2 Check 3 | D=12,Q=[3,0,−1] | I=(√3),N√3=−3,classJ;χ_−4(J)=−1=χ_−4(3). | Negative norm principal class required. | None. |
| 3.2 Check 4 | D=12,[−1,0,3];S rotation | I=O,orientedclassJ gives−1; unorientedclass1 gives1. Mod3,x² cannot equal−1;S action gives[3,0,−1] of value−1. | Orientation independently detected. | None. |
| 3.2 Check 5 | D=5,Q=[1,1,−1] | I=Z+((−1+√5)/2)Z=O;empty andfull characters1=χ(1). | Half-integral maximal order used. | None. |
| 3.2 Check 6 | DIT transformations on A=1 | A⁻¹ gives1,JA gives−1,JA⁻¹ gives−1 underχ_−4. | Class labels and real values distinguished. | None. |

## Unresolved

No unresolved port defect or supplier gap was found. The restriction-agreement headline is intentionally prose-only until MetaplecticAutomorphicForms' nonsquare character carrier exists at the pins; this is explicitly documented in the acceptance module. No unprovided open-head files were independently sought, and no suspicious fetched instruction was followed.


Pull request: #1420 (roadmap/multiquadratic-part-ii at c0bd577)
