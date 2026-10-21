<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/166#issuecomment-6317561544 -->
Red team round 1 pass a (codex) of f4a4a86

Verdict: needs_changes

1. **F01** (P3) Five examples are admitted

   Location: `packages/MultiquadraticPartII/Suggested.lean:245`, also 295, 301, 329 and 332; each ends with `sorry`.

   Claim: These declarations are executable Checks of the roadmap.

   Witness: Lines 247, 299, 305, 330 and 333 admit their conclusions. The cyclic-eight count and both sign-sensitive form-character examples therefore provide no proof check.

   Exact repair text: “Keep at most two proved examples testing `binaryFormGenusChar`. Move each unproved boundary example to a named theorem target, with its full hypotheses and a matching README target and locator; remove the admitted anonymous examples.”

2. **F02** (P2) The stated baseline bypasses the existing binary-form carrier

   Location: `packages/MultiquadraticPartII/README.md:682`: “A formalization at a later pin should define the character on that carrier rather than on bare triples.” Also README:153,172 and Suggested.lean:12,21.

   Claim: The pinned libraries require a temporary coefficient-triple interface.

   Witness: `lake-manifest.json` pins Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. At that Tau Ceti pin, `TauCeti/NumberTheory/BinaryQuadraticForm/Basic.lean:94,116,146` supplies `BinaryQuadraticForm`, `eval`, and `discrim`.

   Exact repair text: “Use Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Define `binaryFormGenusChar (t : Finset ℤ) (Q : TauCeti.BinaryQuadraticForm ℤ) : ℤ` using `Q.eval`; state its discriminant hypotheses using `Q.discrim`.” Import `TauCeti.NumberTheory.BinaryQuadraticForm.Basic`, adapt all Layer 3 signatures and Checks, and delete the later-pin migration paragraph. The existing action uses substitution by the inverse matrix (`eval_smul`), which must be respected in the invariance signature.

3. **F03** (P1) All-positive prime discriminants do give a totally real genus field

   Location: `packages/MultiquadraticPartII/README.md:545`: “All-positive factors do not imply that the complete prime-discriminant compositum is a totally real genus-field extension.”

   Claim: Positivity of every prime-discriminant factor does not suffice for total reality and the all-place genus-field property.

   Witness: Every embedding of each square root of a positive rational number is real. The compositum is therefore totally real; `Completed/Multiquadratic/README.md:119` identifies the all-place genus field as the maximal totally real subfield of the narrow compositum.

   Exact repair text: “When all prime-discriminant factors are positive, their compositum is totally real and equals the all-place genus field supplied by Multiquadratic, Layer 3. For mixed-sign factors, take its maximal totally real subfield.”

4. **F04** (P2) Easy form-character milestone signatures are missing

   Location: `packages/MultiquadraticPartII/README.md:665–679`; `packages/MultiquadraticPartII/Suggested.lean:189–220`.

   Claim: Layer 3 promises `binaryFormGenusChar_empty`, `binaryFormGenusChar_smul`, `binaryFormGenusChar_comp` and `binaryFormGenusChar_neg`, but Suggested.lean supplies none as named theorems.

   Witness: After the zero law the file jumps directly to `formCharacter_eq_idealCharacter`. The sign and proper-equivalence laws are easy on the existing coefficient carrier and matrix action; no missing carrier prevents stating them.

   Exact repair text: “Add named signatures for the empty, scaling, substitution-invariance, and negation laws of 3.1, with the prime-discriminant and fundamental-divisor hypotheses written explicitly where needed.” For the present triple API the negation conclusion is `binaryFormGenusChar t (-a) (-b) (-c) = (∏ P ∈ t, P).sign * binaryFormGenusChar t a b c`; after R02 use the existing form carrier. In particular include the proper-equivalence milestone using the supplied `SL(2, ℤ)` action. Give each target its source locator and own prerequisite line.

5. **F05** (P2) The comparison proof uses a zero ideal at the empty factor

   Location: `packages/MultiquadraticPartII/README.md:745–749`: “Take any m=Q(x,y) coprime to δ” followed by “N(α)=am≠0.”

   Claim: Coprimality of a represented value with the factor implies that value is nonzero.

   Witness: Set `D=12`, `Q=[1,0,-3]`, `t=∅`, `δ=1`, and `(x,y)=(0,0)`. Then `m=0` is coprime to `1`, but `α=0` and `α𝔞⁻¹` is the zero ideal.

   Exact repair text: “First handle `t=∅`: the form character and the empty-product ideal character are both one. Otherwise `|δ|>1`, so a represented integer coprime to δ is nonzero. Since `a≠0`, the norm `am` is nonzero and the ideal `α𝔞⁻¹` is nonzero.” Add the empty-factor case as a named boundary target if it cannot be proved within the permitted example budget.

6. **F06** (P3) Most proved examples do not test the new definition

   Location: `packages/MultiquadraticPartII/Suggested.lean:223–308,337–358`.

   Claim: The examples are suitable tests in a headline-only Suggested.lean file.

   Witness: There are 25 anonymous examples, 20 without `sorry`. Only the two proved examples at 311 and 318 mention `binaryFormGenusChar`; the other 18 proved examples test pre-existing objects or numerical equalities.

   Exact repair text: “Keep at most two proved, discriminating examples evaluating `binaryFormGenusChar`. Move any indispensable arithmetic, class-group, or orientation boundary statement to a named README theorem target with its locator and a matching theorem signature. Remove the remaining anonymous examples.” In particular, standalone `5=1²+2²`, `8=2²+2²`, and `136=6²+10²` are not tests of the new definition.

7. **F07** (P3) Statable Checks lack matching form or ideal assertions

   Location: `packages/MultiquadraticPartII/README.md:705–707,777–797`; also Checks at 279–285,319–321,378–382,429–434,553–588.

   Claim: The Checks discriminate the promised interfaces in Suggested.lean.

   Witness: Suggested.lean:350 only states `genusCharFun {5} 2 = -1`; it never states the values on `[2,1,2]` and `[1,1,4]`. No example tests an ideal equality, ideal class, or `formCharacter_eq_idealCharacter`.

   Exact repair text: “Add named boundary targets `binaryFormGenusChar_negFifteen_classes` asserting the values −1 and 1 on `[2,1,2]` and `[1,1,4]`; `formCharacter_discriminantTwelve_orientation` recording the coefficient ideals and values for `[1,0,-3]`, `[3,0,-1]`, and `[-1,0,3]`; and corresponding targets for the unmirrored kernel, genus-cardinality, and norm-unit Checks. State their hypotheses explicitly in both files. Use named theorem targets when proofs cannot fit the two-example budget; an arithmetic Kronecker value alone is not a form-character test.”

8. **F08** (P3) The cited works have no source manifest

   Location: `packages/MultiquadraticPartII/README.md:830–844`; missing `packages/MultiquadraticPartII/sources.toml`.

   Claim: The bibliography supplies the package's source contracts.

   Witness: Neither cited paper has a `sources.toml` record. Both were fetched legally in this review: `duke-imamoglu-toth` from the publisher and `gross-kohnen-zagier` from Zagier's author page.

   Exact repair text: “Add `sources.toml` with schema `tauceti-roadmap-sources/v1` and entries for Duke–Imamoḡlu–Tóth (2016) and Gross–Kohnen–Zagier (1987), including their authors, titles, exact locators, target associations, and the source-service URL, fetched-from, timestamp, hash, licence class and status fields.” Use printed page locators, not PDF page indices or machine paths. No missing-text request remains necessary.

9. **F09** (P3) Layer 3 omits the precise integral-basis and norm suppliers

   Location: `packages/MultiquadraticPartII/README.md:741–744,768–773`: “Also 𝒪_K=ℤ+βℤ” and “Mathlib's absolute ideal norm ... index of a sublattice”.

   Claim: The exact supplier contracts cover the integral-basis and norm calculations needed for the comparison.

   Witness: The contract omits the quadratic ring-of-integers API. The arithmetic identity `(D+ω)/2−β=(D+b)/2` alone does not establish that `(D+ω)/2` generates the maximal order.

   Exact repair text: “For the quadratic integral basis use `NumberField.adjoin_halfGen_eq_top_of_mod_four_eq_one` and `NumberField.adjoin_gen_eq_top_of_mod_four_ne_one`, in `TauCeti/NumberTheory/NumberField/Quadratic/RingOfIntegers.lean:327,424`, with `hmin`, `hgen`, `hsf` and the respective congruence hypotheses. For its ideal norm use `Ideal.natAbs_det_basis_change` and `Ideal.absNorm_span_singleton`, in `Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean:376,381`.” Add these to 3.2's Needs and the exact supplier contracts; explain transport from either root ω to the displayed basis. These are existing suppliers, not new roadmap targets.

## Verified sound

Read all 850 lines of README.md and all 360 lines of Suggested.lean: **37 Lean declarations** (one real-bodied definition, 11 named theorems, 25 examples), **16 named README targets**, **39 Check bullets**, and **nine distinct mathematical locator clusters** across two legally fetched works. There are no bold numbered targets; all named targets were audited. Of the 25 examples, 20 contain proof bodies and five are admitted. Only two proved examples test the new definition.

Checked five main-roadmap section contracts: Multiquadratic Layer 3, IntegralLattices B1–B3, and GlobalNumberFields Layer 11. Searched the five supplied sibling heads for overlapping objects; this package consumes no target from those five. The stated kernel, descent, fibre-count, arithmetic, evaluation, zero-law and oriented comparison theorem conclusions survived the cases below. The comparison proof needs R05. No hidden standing hypothesis was found to disappear from the written theorem types; that is a static signature audit, not an elaboration claim.

The source checks establish the following support without copying source passages:

| Locator cluster | Verified source evidence |
|---|---|
| Duke–Imamoḡlu–Tóth §2, pp.950–951 | `duke-imamoglu-toth` lines70–91: narrow quotient, different class, norm-unit criterion, prime obstruction |
| §2, p.952, correspondence | `duke-imamoglu-toth` lines123–132: positive-leading-coefficient normalization and norm form |
| §2, p.952, (2.3)–(2.5) | `duke-imamoglu-toth` lines133–137: inverse and J sign table |
| §4, p.959, (4.1)–(4.2) | `duke-imamoglu-toth` lines410–415: narrow genera and fibre count |
| §4, p.960, after (4.4) | `duke-imamoglu-toth` lines444–446: J in principal genus and two squares |
| §7, p.971, after (7.7) | `duke-imamoglu-toth` lines960–963: descent; uniqueness follows from the supplied surjection |
| §7, p.971, before (7.8) | `duke-imamoglu-toth` lines964–990: genus characters and signs; the roadmap correctly restricts the complementary-sign claim to D>0 |
| §9, p.978, before Proposition 5 | `duke-imamoglu-toth` lines1329–1345: content-zero branch and form/ideal agreement |
| Gross–Kohnen–Zagier Ch.I §2, pp.508–510 | `gross-kohnen-zagier` lines487–565: fundamental divisor, scaling, representation and dyadic independence argument |

The declaration and adversarial table uses these context abbreviations: **F** = `{K : Type u} [Field K] [NumberField K]`; **Q** = F, θ,d and explicit hmin,hgen; **S** = factor set s, hs, heven,hprod; **R** = Q,S,hsf,hd. Pure integer statements retain no F context. Line numbers in the next two tables are in `packages/MultiquadraticPartII/Suggested.lean`.

| Statement / section / line | Retained context | Instances tried | Result / change |
|---|---|---|---|
| ker_toClassGroup_eq_pair /0.1/37 | Q,A | d=2,3,−1,12; collapsed J | Sound; coincident pair allowed |
| existsUnique_wideCharacter_iff /0.2/49 | Q,χ : C→*ℤˣ | trivial/odd χ; nontrivial square J | Sound; quotient descent and surjectivity |
| card_genusFiber_mul_twoPow /1.1/65 | Q,S,hsf,g | D=5,8,12,28,60,−4; C8 | Sound; r=0 impossible for this presentation |
| genusCharacter_J_eq_sign_prod /2.1/83 | R,t⊆s | empty/full t; D=8,12,24,136; −4 excluded | Sound |
| primeDiscriminants_positive_iff /2.2/101 | D,s,hD,hs,heven,hprod | D=1,5,8,40,136;12,24; negative D excluded | Sound; multiple even factors excluded |
| fundamental_sumTwoSquares_iff /2.3/113 | D,hD,hfund | D=1,5,8,12,136; nonfundamental9 | Sound; no primitive-coordinate restriction |
| J_square_iff_sumTwoSquares /2.4/123 | R | d=2,3,34 | Sound theorem; R03 corrects surrounding prose |
| J_ne_one_of_prime_threeModFour /2.5/142 | R,p,hp,hpD,hp4 | d=3,p=3;d=7,p=7; failed converse d=34 | Sound |
| binaryFormGenusChar /3.1/165 | t,a,b,c | zero form, empty t, imprimitive, both signs | Real body; R02 carrier repair |
| binaryFormGenusChar_eq_of_represents /3.1/176 | t,ht,heven,a,b,c,δ′,hδ′,hdisc,x,y,hcop | Δ=0, square Δ,12,−15,48; −4/8/−8; invalid cofactor2 | Sound local proof; bounded checks agree |
| binaryFormGenusChar_eq_zero_iff /3.1/189 | t,ht,a,b,c | zero form; δ=1; [0,1,0]; multiple dyadic factors | Sound CRT argument; no disc hypothesis needed |
| formCharacter_eq_idealCharacter /3.2/199 | R,t⊆s,ω,hω,a,b,c,hdisc,𝔞,h𝔞 | D=12,5; both a and ω signs; empty t | Sound conclusion; R05 proof and R09 contract repairs |
| binaryFormGenusChar_empty /3.1/absent | t=∅, any form | zero/nonzero form | True; R04 |
| binaryFormGenusChar_smul /3.1/absent | fundamental divisor, μ∈ℤ | μ=0,negative,coprime/noncoprime to δ | True; R04 |
| binaryFormGenusChar_comp /3.1/absent | g∈GL₂(ℤ), any form | det±1, identity | Same represented set, including outside valid discriminants; R04 |
| binaryFormGenusChar_neg /3.1/absent | fundamental divisor | Q and −Q; δ<0,δ>0,δ=1 | Correct sign; R04 |

| Anonymous declaration line | Section / retained context | Instance and result | Change |
|---|---|---|---|
| 223 | examples/F | Unique trivial descent; proof uses surjectivity | R06 |
| 230 | examples/F,θ,d,hmin,χ,hodd | Odd character cannot descend; hgen unnecessary | R06 |
| 245 | examples/none | C8 square fibre {0,2,4,6}, cardinality4 | True but admitted, R01 |
| 249 | examples/none | C8 two-torsion {0,4}, cardinality2 | R06 |
| 254 | examples/none | D=1 with coordinates(1,0), no prime divisor | R06 |
| 260 | examples/none | 5=1²+2² | R06 |
| 262 | examples/none | 8=2²+2² | R06 |
| 264 | examples/none | 136=6²+10² | R06 |
| 266 | examples/none | 12 not sum of two squares | R06 |
| 275 | examples/none | 9=0²+3², divisor3 | Correct negative control; R06 |
| 280 | examples/none | Character of −4 at −1 is −1 | R06 |
| 284 | examples/none | Character of −8 at −1 is −1 | R06 |
| 288 | examples/none | Character of 8 at −1 is 1 | R06 |
| 292 | examples/none | Empty imported character is 1 | R06 |
| 295 | examples/Q,d=3 | J nonsquare | True but admitted, R01 |
| 301 | examples/Q,d=34 | J square | True but admitted, R01 |
| 308 | examples/none | Signs of 1 and −4 differ | R06 |
| 311 | examples/a,b,c | Empty form character, including zero form | Proved new-definition boundary check |
| 318 | examples/none | [2,0,−6] at δ=−4 has value0 | Proved new-definition negative control |
| 329 | examples/none | [1,0,−3] at δ=−4 has value1 | True but admitted, R01 |
| 332 | examples/none | [−1,0,3] at δ=−4 has value−1 | True but admitted, R01 |
| 337 | examples/none | χ−4(1)=χ−4(−3)=1, χ−4(3)=−1 | R06 |
| 344 | examples/none | x²+2y² represents1,3 with unequal χ−4 values | Correct cofactor negative control; R06 |
| 350 | examples/none | (5/2)=−1 | Correct arithmetic; missing form comparison R07 |
| 355 | examples/none | 48 is not fundamental | R06 |

All 39 README Check bullets were tested mathematically: 0.1 (3), 0.2 (3), 1.1 (4), 2.1 (4), 2.2 (3), 2.3 (4), 2.4 (4), 2.5 (3), 3.1 (6), 3.2 (5). The d=34 negative-Pell Check agrees with the even continued-fraction period `[1,4,1,10]`; 35+6√34 has norm1. The Δ=12 orientation ideals are respectively 𝒪_K, (√3), and 𝒪_K before applying the negative-a sign correction. The source's inverse/J table matches these values.

Independent finite arithmetic checks found no failure in 3,198 eligible form/factor instances with coefficients −4 through 4 and represented coordinates −3 through 3; the factors were subsets of {−4,8,−8,−3,5,−7,13}, with at most one even factor. Also checked 79,461 local content/representation conditions and all 303 positive fundamental discriminants up to 1,000 for the two-square criterion. These are counterexample searches, not Lean proofs.

Both local library checkouts were clean and their HEADs equal the manifest pins. Read the actual pinned quotient, finite-class-group, quadratic-principal-class, two-rank, ramification, Kronecker-character, coprime-ideal and integral-basis declarations. No duplicate new genus character on forms was found. No forced headline, sorry-bodied data, `set_option`, `lemma`, `True` placeholder, or conclusion-as-hypothesis was found in the package. The git diff contains only this package's README, Suggested.lean, metadata.toml and review.json.

Mechanical dependency output:

```text
depcheck: 6 roadmaps, 37 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Internal target order is acyclic: 0.1→0.2; 2.2 and 2.3→2.4; 0.1 and 2.4→2.5; 2.1 and 3.1→3.2; Layer1 uses existing suppliers independently.

## Not verifiable

- Lean elaboration and proof execution: no Lean build or other Lean command was run, as required. Static inspection does not certify that the proof scripts elaborate under the current pins.
- GeometryOfNumbersAndQuadraticArithmetic's asserted absence of a form-character target, and the downstream `AnalyticNumberTheory, Layer AN.4` and “proposed Fuchsian orbifolds Part II” references: those heads are not among the supplied sibling folders and are absent from the supplied main checkout. The merge order names AnalyticNumberTheoryPartI and AnalyticNumberTheoryPartII, so the downstream locator should be reconciled with the actual consumer before publication; its section cannot be certified here.
- Literal source coverage beyond the stated source domains: Gross–Kohnen–Zagier defines discriminants to be nonzero (`gross-kohnen-zagier` line299), whereas the evaluation signature includes Δ=0. Its elementary local proof covers that extension, but it is not a verbatim source theorem. Likewise the imaginary versions of Layers0–1 and the negative-leading-coefficient comparison are justified by the pinned algebra and sign calculation, rather than by an unqualified citation to the real, normalized source statements.
- No unavailable mathematical text remains: both papers were fetched and the scratch missing-reference list was cleared after successful retrieval. No package source manifest was written during this read-only pass.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "f4a4a8671f1c02033e687339670bd7382729a341", "job": "RT-MultiquadraticPartII~1a", "model": "gpt-6-astra", "worker": "chris-2"} -->
