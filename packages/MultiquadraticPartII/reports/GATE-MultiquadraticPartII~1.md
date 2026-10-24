## H01 (CBirkbeck) — applied

Nonsquare-only restriction agreement → agreement with both MetaplecticAutomorphicForms §§7.20a and 7.32-trace: ownership and supplier contracts now include `biroArithmeticTraceData` (`TauCetiRoadmap/MultiquadraticPartII/README.md:52`, line 301), and §3.1 requires equality with ω_δ on raw level-one forms with δ>0 fundamental, Δ=δδ′>0 and δ′>0 congruent to 0 or 1 modulo 4, including squares, then at every positive level by restriction (line 765). The new Checks give 1, −1 and 0 for the three discriminant-25 forms and 1 for [0,1,0] at discriminant one (line 886); `TauCetiRoadmap/MultiquadraticPartII/Suggested.lean:14` identifies both absent supplier characters, so neither comparison is forced through a replacement carrier.

## H02 (CBirkbeck) — answered

The whole-pull-request order does include LFunctions (#248, roed-math), VonNeumannAlgebras (#889, kim-em) and UnboundedOperators (#1027, kim-em) before AutomorphicSpectralTheory (#925), whose description at c5cfb92f8322cfdd96e1e20a651c7d7f47155941 explicitly lists all three; their open status and authors were verified, and #1420 explicitly places #925 before itself. The corrected scheduling description should identify the displayed chain as the author's own subset and list these additional transitive prerequisites before #925; PR-description edits are outside this job's permitted files, so no such external edit or new arithmetic hypothesis was made.

---

**Evidence and ownership.** MetaplecticAutomorphicForms §§7.20a and 7.32-trace were read at 22bee85d162924fa6c9611b819e1f6e92caf0c8a: the latter explicitly includes square positive discriminants and its discriminant-one cusp case. Biró's author-hosted published copy, §2, printed p.106 (`biro-cycle-integrals line 172`, line 206), gives the same content-zero / coprime represented-integer definition and the restriction N∣a, with no nonsquare, primitive-form or level-coprimality condition; `gross-kohnen-zagier line 487`, line 521 supplies the already-cited classical-character and local argument. The README retains its two existing cited papers; no additional source-manifest edit is needed for the supplier citation. The DIT normalization and comparison were checked at `duke-imamoglu-toth line 76`, line 123, line 412, line 444, line 960, line 989 and line 1334.

Ownership by object was searched across main at 66576b61d0440aec1f04a10b179f7e7163140b96, the open-roadmap index and all supplied sibling checkouts, and all 37 board-package heads (including their design READMEs). The existing character remains owned by MetaplecticAutomorphicForms; this roadmap owns only its existing total extension and the new agreement theorem. IntegralLattices Layer B B1–B3, GlobalNumberFields Layer 11, GeometryOfNumbersAndQuadraticArithmetic §4.3, ClassicalArithmeticCompletion §§5.21, 5.23–5.24, AutomorphicSpectralTheory §4.17a and AnalyticNumberTheoryPartI §2.25 were resolved and their claimed interfaces read; no ownership moved and no upward dependency was added.

**Pinned carriers and signatures.** Mathlib and Tau Ceti were verified at the manifest pins 6b7abb3c7686292736be2955bd3eb9ebf63b456a and a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. `TauCeti/NumberTheory/BinaryQuadraticForm/Basic.lean:94` records only the three coefficients, imposing no nonzero-leading-coefficient, nonzero-discriminant or primitivity restriction; its evaluation at line 116 and discriminant at line 146 therefore cover every new Check. `TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/Basic.lean:212` defines the finite product, its empty value at line 220 is one even at zero, and its coprimality/zero law is at line 253; the signed local characters are in `TauCeti/NumberTheory/Multiquadratic/Legendre/PrimeDiscriminant/Character.lean:72`. The pinned libraries supply the arithmetic characters and raw forms, but neither supplier’s form-character function.

A scratch file containing `#check @name` for all eleven named declarations was elaborated once through the required targeted build and every resulting type was compared with its README statement. No binder or signature changed or disappeared: the repair changes only Lean documentation, and the explicit quadratic-presentation, factorization, positivity, congruence and ideal-membership hypotheses all survive elaboration. The final module contains no scratch checks, and its ten admitted headline theorems, real-bodied definition and proved content example remain unchanged.

**Commit.** `0bf098bd` — `MultiquadraticPartII: review repairs (Biró square-discriminant compatibility)`. Only the two authorized roadmap files changed; nothing was pushed.

**Adversarial mathematics pass.** Finite values below diagnose the stated laws; they do not replace their general proofs. The new comparison uses the supplier's content-zero rule and, otherwise, evaluation at the same coprime represented integer. All eleven elaborated signatures were compared with the README; the field, generation, factorization, squarefreeness, positivity, cofactor-congruence and coefficient-ideal hypotheses remain explicit where required.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Genuine quadratic presentation | d=0,1; d=2 | X² and X²−1 are reducible, so neither can be the asserted degree-two minimal polynomial; N(1+√2)=−1 | Degenerate field presentations excluded | None |
| Field discriminant convention | d=2,3,5,34 | D=8,12,5,136, respectively | Matches the two mod-four branches | None |
| Narrow positive-norm convention | α=−1 and α=√3 | N(−1)=1 and (−1)(−1)=1 totally positive; N(√3)=−3 | Positive norm and total positivity agree up to a unit only in the stated quadratic case | None |
| Distinguished class and generator signs | θ=√3, −√3, 2√3 | Ideals (−√3)=(√3); multiplication by positive 2 gives the same narrow class J | J is independent of these choices | None |
| Signed prime discriminants | D=12,24,136 | (−4)(−3)=12; (−8)(−3)=24; 8·17=136 | Dyadic signs agree with the stated D | None |
| Fundamental divisor convention | Δ=25,0,−8; δ=5,−4,−4 | Cofactors 5,0,2 have residues 1,0,2 mod4 | First two allowed, last excluded | None |
| Subset and complement signs | D=12; D=−4 | (δ,δ′)=(−4,−3) has signs (−1,−1); (1,−4) has (1,−1) | Complementary signs require D>0 | None |
| Kernel theorem `ker_toClassGroup_eq_pair` | ℚ(√2), ℚ(√3), ℚ(i) | Kernel sizes 1,2,1 match distinct entries of {1,J}: 1,2,1; π(1)=π(J)=1 | Coincident entries handled | None |
| J² and quotient by its subgroup | J=1; J of order 2 | J²=1 in both cases; subgroup sizes 1 and 2 give quotient orders #C and #C/2 | Correct quotient carrier | None |
| Full wide fibres | C₂ with π to the trivial group; trivial group | Fibre {1,J} has 2 entries; collapsed fibre has 1; J swaps the two entries and J²A=A | Exact fibres, not an upper bound | None |
| Norm-unit criterion | d=2,3,7 | N(1+√2)=−1; −1 has residues 2 mod3 and 6 mod7, outside square sets {0,1} and {0,1,2,4} | Both directions distinguished | None |
| Unique descent theorem `existsUnique_wideCharacter_iff` | C₂→1, χ trivial or sign | χ(J)=1 gives 1 descent; χ(J)=−1 gives 0 descents | Homomorphism and uniqueness conditions matter | None |
| Real versus complex descent on square J | C₄, J=g² | Real χ(g)=±1 gives χ(J)=1; complex χ(g)=i gives χ(J)=−1 | Square J need not be trivial | None |
| Quotient and two-torsion conventions | C₈ | #C²=4, #(C/C²)=2, #C[2]=2, each quotient fibre has 4 entries | Fibre cannot be replaced by two-torsion | None |
| Fibre theorem `card_genusFiber_mul_twoPow` | r=1,2,3 using C=1,C₂,C₂² | 1·1=1, 2·1=2, 4·1=4; for C₈, 2·4=8 | Natural cardinality formula agrees | None |
| Natural subtraction boundary | r=0,1,2 | Nat exponents r−1=0,0,1; powers 1,1,2; r=0 cannot factor the discriminant of a genuine quadratic field | No hidden negative natural exponent | None |
| Surjective finite-fibre route | C₈→C₂ | Two fibres have 4 entries each; total 4+4=8 | Nonemptiness and equal size follow from surjectivity | None |
| Composite sign normalization | D=12 and 136 | At J, singleton signs (−1,−1) multiply to 1 for D=12; (1,1) multiply to 1 for D=136 | Matches sign δ and supplied normalization | None |
| Arithmetic value at −1 | t={−4},{−8},{8},∅,{−4,−3},{8,17} | Values −1,−1,1,1,1,1 equal signs of products | Sign convention fixed | None |
| `primeDiscriminants_positive_iff` | D=1,5,8,12,24,40,136 | Both sides true for 1,5,8,40,136 and false for 12,24 (prime 3) | Both implications pass | None |
| Positivity hypothesis | D=−4 | Factor positivity false; no prime of residue 3 divides −4, true | Excluded negative control retained | None |
| At most one even factor | t={−4,−8} | Product 32 has only prime divisor 2, but both factors are negative | Excluded double-even control retained | None |
| `fundamental_sumTwoSquares_iff` | D=1,5,8,12,136 | 1=0²+1², 5=1²+2², 8=2²+2², 136=6²+10²; 12 has no representation and 3∣12 | Both sides agree, zero coordinates and nonprimitive representations allowed | None |
| Fundamentality hypothesis | D=9 | 9=0²+3² yet 3∣9, so representation true and no-divisor condition false | Nonfundamental negative control retained | None |
| `J_square_iff_sumTwoSquares` | D=8,12,136 | All-factor positivity and two-square tests give true,false,true; J=1 for D=8, J≠1 for D=12,136 | Square and trivial remain distinct | None |
| d=34 norm +1 boundary | y=1,…,6 | 1+34y²=35,137,307,545,851,1225; only last is square, 35²−34·6²=1 | ε=35+6√34 supplies the interval reduction | None |
| d=34 norm −1 exclusion | y=1,…,6 | 34y²−1=33,135,305,543,849,1223; none a square | J≠1 despite J square | None |
| Integral square root of ε | xy=3 | x²+34y²=43 or 307, never 35; 2xy=6 | ε has no integral square root | None |
| `J_ne_one_of_prime_threeModFour` | d=3,7 versus d=2 | 3∣12 and 7∣28 give ratio 2; N(1+√2)=−1 gives ratio 1 | Obstruction has stated real-field hypotheses | None |
| Totally real genus compositum | D=136 and 12 | √8,√17 have real conjugates ±√8,±√17; √−4,√−3 are nonreal and their product has square 12 | Full compositum is totally real only in the all-positive case | None |
| Total definition `binaryFormGenusChar` | t={−4}, Q=[1,0,−3],[2,0,−6]; t=∅, Q=0 | Values 1,0,1; gcd(content,δ)=1,2,1 | Both choice branches and the empty product distinguished | Documentation now names both suppliers |
| Nonsquare restriction agreement | Δ=−20,12,48 | Both interfaces give (1,−1) on [1,0,5],[2,2,3] at δ=−4; −1 on [3,0,−1] at δ=−4; −1 on [2,0,−6] at δ=−3 | Existing agreement retained | None |
| Biró square restriction agreement | δ=5, δ′=5; [1,1,−6],[2,1,−3],[5,5,0] | Discriminants 1+24=25, 1+24=25, 25−0=25; extension/supplier pairs (1,1),(−1,−1),(0,0) | Both signs and the zero branch agree | Added agreement and Checks |
| Biró level restriction | N=2 on [2,1,−3]; N=5 on [5,5,0] | Leading coefficients divisible by 2 and 5; level-one/level-N pairs (−1,−1),(0,0); gcd(N,δ)=5 in the second case | No primitive-form or level-coprimality hypothesis introduced | Added level Checks |
| Biró empty factor and a=0 | δ=δ′=Δ=1; Q=[0,1,0] | discr=1; Q(1,1)=1; gcd(1,1)=1; extension/supplier 1=1; N∣0 for all N>0 | No nonzero-leading-coefficient condition or field carrier | Added Check |
| `binaryFormGenusChar_eq_of_represents` | δ=−4, Q=[1,0,−3], m=1,−3 | Character values 1=1 and 1=1; at |−3|=3 the value would be −1 | Signed represented values required | None |
| Cofactor hypothesis of evaluation | δ=−4, Q=[1,0,2] | Δ=−8=(−4)·2, cofactor residue 2; represented m=1,3 give characters 1,−1 | Excluded counterexample retained | None |
| Dyadic evaluation kernels | Odd units modulo 4 or 8 | δ=−4 has kernel 1 mod4; δ=8 gives residues {1,7}; δ=−8 gives {1,3} | Computed kernels match all three local branches | None |
| Square and zero evaluation | δ=−4, Q=[1,0,0],[1,0,−4] | Δ=0,16; cofactors 0,−4; all coprime represented values tested have character 1 | Extension laws include both discriminants | None |
| `binaryFormGenusChar_eq_zero_iff` | t={−4}; Q=[2,0,−6], [1,0,−3],0 | gcds 2,1,4; zero predicates true,false,true match failure of coprimality | No discriminant restriction needed | None |
| Content law with two even factors | t={−4,8}; Q=[1,0,0],[2,0,0] | δ=−32; gcds 1,2; characters 1,0 | No at-most-one-even hypothesis needed here | None |
| CRT content route | p=2, Q=[0,1,0]; p=3, Q=[3,0,1] | At p=2, values at (1,0),(0,1),(1,1) are 0,0,1; at p=3 they are 0,1,1 | Includes residue field 𝔽₂ and the middle-coefficient branch | None |
| Empty-factor API | t=∅; Q=0 or [0,1,0] | m=0 is coprime to 1; empty product gives 1 in both cases | Zero represented value is permitted here | None |
| Scalar law | δ=−4, Q=[1,0,−3], μ=−1,0,2 | Left values −1,0,0 equal (δ/μ)·1=−1,0,0 | Sign, content and zero scalar agree | None |
| Scalar law at empty factor | t=∅, μ=0 | χ(0Q)=1 and genusCharFun ∅ 0·χ(Q)=1·1=1 | No incorrect 0·1 convention | None |
| Invertible substitution | Q=[1,0,−3], T and diag(1,−1) | Direct T gives [1,2,−2] and reflection gives Q; both have value 1 as Q does | Same represented-integer predicate | None |
| Proper action convention | T • [1,0,−3]; S • [−1,0,3] | Inverse substitution gives [1,−2,−2], value 1; rotation gives [3,0,−1], value −1 | Matches both supplier and extension conventions | None |
| Negation API | δ=−4 and Q=[1,0,5]; δ=5 and Q=[2,1,2] | χ(−Q)=−1=(−1)·1; χ(−Q)=−1=1·(−1); content-zero forms give 0=−1·0 | Both sign factors tested | None |
| Negative definite extension | δ=−4, [−1,0,−5]; δ=5, [−2,−1,−2] | Coprime represented values give −1,−1, respectively | Remains outside the positive-definite-only negative-discriminant supplier domain | None |
| `formCharacter_eq_idealCharacter` | D=12, Q=[1,0,−3],[3,0,−1],[−1,0,3] | Form values 1,−1,−1 equal ideal-character values at 1,J,J | Negative-leading-coefficient orientation is essential | None |
| Empty-factor ideal comparison | t=∅, Q=[1,0,−3], (x,y)=(0,0) | Q(0,0)=0; both character values 1; norm of a zero principal ideal would be 0 | Empty case is separated before division | None |
| Coefficient norm and ideal index | D=12, a=1 or 3, β=√3 | Indices 1,3=absolute values of a; at (x,y)=(1,0),(0,1), N(xa−yβ)=1,−3 or 9,−3 equals aQ(x,y) | Norm sign and absolute ideal norm agree | None |
| Nonzero denominator in ideal proof | δ=−4, m=−3; empty factor m=0 | gcd(−3,−4)=1 and a·m≠0; gcd(0,1)=1 but the empty factor was separated | Zero ideal cannot enter the coprime-ideal character | None |
| Maximal-order generators | d=3,5,34 | Orders have bases (1,√3), (1,(1+√5)/2), (1,√34); β=√3 or (−1+√5)/2 differs from a basis generator by integer 0 or −1 | Correct full maximal order, not a smaller quadratic order | None |
| Orientation parity in all four cases | (sign a,sign m)=(+,+),(+,−),(−,+),(−,−) | ([m<0]+[am<0]) mod2=0,0,1,1 equals [a<0] | No reversed J twist | None |
| Either square root ω | D=12, Q=[3,0,−1], ω=±2√3 | β=±√3 gives the same ideal (3,√3); both characters −1 | Conjugation does not change a real character | None |
| DIT three class labels | A, A⁻¹, JA, JA⁻¹ with χ(A)=1 and χ(J)=−1 | Reflected, signed and negated values are 1,−1,−1, matching the table | Correct labels retained even when characters cannot distinguish inverses | None |
| Proved content example | δ=−4, Q=[2,0,−6] | Every value 2(x²−3y²) is divisible by 2; gcd(content,δ)=2; character 0 | Nontrivial example still proves the zero branch | None |
| Carrier boundary and vacuity | Square Δ=25; nonabelian S₃; characteristic 2 | Q=[5,5,0] has Δ=25 without a quadratic field; (12)(23)≠(23)(12); 2=0 in characteristic 2 but 2≠0 in any number field | Raw forms admit the square boundary; number-field/class-group hypotheses exclude inappropriate carriers | None |

**Validation.**

`lake build TauCetiRoadmap.MultiquadraticPartII.Suggested` exited 0, with exactly ten expected “declaration uses `sorry`” warnings and no errors. Exact final outcome:

```text
Build completed successfully (9094 jobs).
```

Dependency-direction check (`--movable`), exact output; no UPWARD or CYCLE line:

```text
depcheck: 28 roadmaps, 252 edges, 0 problem(s)
```

Final gate against `origin/main` exited 0 on the clean commit; exact summary:

```text
gate MultiquadraticPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
