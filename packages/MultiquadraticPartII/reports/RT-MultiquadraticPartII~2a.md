<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/166#issuecomment-6353875908 -->
Red team round 2 pass a (codex) of 9a5eed8

Verdict: needs_changes

1. **F01** (P3) Renamed boundary Checks still pad the acceptance file

   **Location:** `packages/MultiquadraticPartII/README.md:256`: “and named boundary targets”; `packages/MultiquadraticPartII/Suggested.lean:57`, 72, 107, 127, 216, 229, 240, 250, 261, 273, 323, 403, 419, 440, 448, 459, 469, 498.

   **Claim:** Giving Checks theorem names makes them suitable acceptance targets.

   **Witness:** `genusFiber_cyclicEight_boundary` computes fibre sizes 4, quotient size 2 and two-torsion size 2. `binaryFormGenusChar_empty` is repeated verbatim by the proved example at line 419. These are expressly excluded boundary/Check declarations, independent of proof difficulty.

   **Exact repair text:** “Delete from Suggested.lean `narrowDefect_fiber_boundary`, `wideCharacter_boundary`, `genusFiber_smallFactorizations`, `genusFiber_cyclicEight_boundary`, `genusCharacter_factorSigns_boundary`, `primeDiscriminants_boundary`, `fundamental_sumTwoSquares_boundary`, `quadratic_two_boundary`, `quadratic_three_seven_boundary`, `quadratic_thirtyFour_boundary`, `binaryFormGenusChar_empty`, `formCharacter_empty`, `binaryFormGenusChar_negFifteen_classes`, `binaryFormGenusChar_discriminantTwelve`, `binaryFormGenusChar_invalidCofactor`, `formCharacter_discriminantTwelve_orientation`, `formCharacter_discriminantFive`, and the empty-factor example. Keep their mathematics as prose README Checks, remove the corresponding backticked local declaration names, and remove the promise of named boundary targets.” The cyclic-eight values remain 4,2,2 and the empty-factor value remains 1. Do not prove these declarations in place. Replace the module opening at `Suggested.lean:6` with “MultiquadraticPartII: target signatures. The roadmap is README.md; this file is not the roadmap. It states the roadmap’s headline theorems against the pinned Mathlib and Tau Ceti APIs.” Record any remaining unavailable headline carrier individually after the ownership repair, rather than calling the file “representative” and “not exhaustive”.

   The earlier repair followed round-one suggestions to promote examples to named targets. Those suggestions conflict with this round’s explicit acceptance-test rule; none was marked not actionable in the repair report.

2. **F02** (P1) Earlier roadmaps already own the composite sign and nonsquare form character

   **Location:** `packages/MultiquadraticPartII/README.md:25`: “owns the form-character definition, its API”; line 437: “for every `t⊆ s`, prove”.

   **Claim:** The composite sign theorem and the generalized nonsquare form-character construction are new targets here.

   **Witness:** `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:2670`, §4.17a, already proves the composite sign. `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:2077`, §7.20a, already defines the imprimitive nonsquare form character and proves represented-value existence, independence and proper invariance. Both owners precede this roadmap.

   **Exact repair text:** “AutomorphicSpectralTheory §4.17a, quadratic_weyl_domains, supplies the real composite identity χ(J)=sign δ=sign δ′. MetaplecticAutomorphicForms §7.20a, quadraticTraceData, supplies the form character for nonsquare D=δδ′, δ fundamental and δ′ a discriminant, on all indefinite forms and on positive definite forms when D<0, including the content-zero branch, represented-value independence and proper invariance. Layer 3 extends that same character to the remaining integral forms, including square and zero discriminants, and proves agreement on the supplied domain. It owns the extension and its comparison with the pinned narrow ideal character, not a second nonsquare construction.”

   Move §2.1's existing composite theorem into the supplier contract and delete its duplicate acceptance declaration. Rewrite the §3.1 construction/proof targets around the extension and restriction agreement; retain the generality of the present endpoint. The extension's real-bodied native-carrier definition may serve its acceptance signatures, but must be explicitly the extension of the supplied character. Reconcile the ownership summary and analytic-application paragraph with these contracts. On D=12, t={−4}, both supplied and present signs are −1; on D=−20 the supplied forms [1,0,5],[2,2,3] have values 1,−1. These are identical constructions on the overlap. The elementary extension also retains D=0 and D=16, outside §7.20a's nonsquare domain.

   This is a fresh ownership defect, not a re-raising of a repair marked not actionable. The round-one b/F02 repair correctly identified the earlier analytic sections but did not remove their duplicated algebraic targets.

3. **F03** (P3) The negation declaration is a one-tactic specialization

   **Location:** `packages/MultiquadraticPartII/Suggested.lean:364`: “theorem binaryFormGenusChar_neg”; `packages/MultiquadraticPartII/README.md:741`.

   **Claim:** The negation API law is an additional headline acceptance theorem.

   **Witness:** Specialize the scalar law at μ=−1 and simplify with `genusCharFun_neg_one_eq_sign_prod`, present at `TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/Basic.lean:277`. This is exactly the declared conclusion, with the same hypotheses.

   The static one-tactic probe, read against those two signatures, is:

   ```lean
   by
     simpa only [neg_one_mul, genusCharFun_neg_one_eq_sign_prod ht] using
       (binaryFormGenusChar_smul ht heven Q hδ' hdisc (-1))
   ```

   **Exact repair text:** “Delete `binaryFormGenusChar_neg` from Suggested.lean. Keep χδ(−Q)=sign(δ)χδ(Q) as a prose API consequence and Check in the README, citing scalar multiplication and Tau Ceti genusCharFun_neg_one_eq_sign_prod; remove the backticked local declaration name.” For δ=−4,Q=[1,0,−3], both sides are−1; for δ=5,Q=[2,1,2], both sides are−1; for the zero branch both sides are0. Do not prove the declaration in place. The displayed probe was inspected, not executed, under the no-Lean restriction.

## Repair verification

All twelve findings in the two earlier reviews were checked against this head. No repair was marked “not actionable in this package”, so no settled-finding exception applies. Paths in this table are relative to `packages/MultiquadraticPartII/` unless a library or roadmap prefix is shown.

| Earlier finding | Status | Repaired passage and independently checked witness |
|---|---|---|
| a/F01: five admitted examples | Repaired; S01 regression | `Suggested.lean:419`, “example (Q : TauCeti.BinaryQuadraticForm ℤ)”; line 427 has the other example. Both have proof bodies. The former admitted computations now appear as named theorems at 127, 261, 273 and 448. There are zero admitted anonymous examples, but the named boundaries violate the current rule. |
| a/F02: obsolete pins and triple carrier | Repaired | `README.md:132`, “Use `TauCeti.BinaryQuadraticForm ℤ`, with `Q.eval` and `Q.discrim`”; `Suggested.lean:291` uses that carrier. The manifest and both library HEADs equal the two hashes at README 147 and 170. `TauCeti/NumberTheory/BinaryQuadraticForm/Basic.lean:94,116,146,188` supplies the structure, evaluation, discriminant and inverse-matrix action. |
| a/F03: false total-reality warning | Repaired | `README.md:582`, “When all prime-discriminant factors are positive, every embedding of each square root is real”. For 136=8·17 the compositum is totally real; for 12=(−4)(−3) it contains i and its real subfield is Q(√3). This matches `Completed/Multiquadratic/README.md:119`. |
| a/F04: absent form-character laws | Repaired; S01 boundary regression | `README.md:751`, “sign laws, and substitution invariance on the pinned form carrier”; `Suggested.lean:323,330,345,357,364` now state all five laws. Direct T-substitution yields [1,2,−2]; the supplied left action yields [1,−2,−2], with character 1 in both cases. The empty law belongs only in the README; the negation law is also a one-tactic specialization (S03). |
| a/F05: zero ideal for empty factor | Repaired | `README.md:817`, “First take t = ∅: the form character and the empty-product ideal character are both one”. At D=12, Q=[1,0,−3], (x,y)=(0,0), m=0, the comparison is 1=1 without forming (0). For t≠∅, every factor has absolute value at least 3, so coprimality excludes m=0. |
| a/F06: examples unrelated to new definition | Partly repaired | `README.md:256`, “and named boundary targets”; `Suggested.lean:240` merely renames the old equations for 1,5,8,136,12,9. Only two anonymous examples remain and both mention the definition, but the excluded computations and boundaries survive as seventeen named targets. S01 gives the required deletion. |
| a/F07: arithmetic surrogates for form/ideal Checks | Repaired; S01 regression | `README.md:873`, “their oriented classes 1,J,J; and the form values 1,−1,−1”; `Suggested.lean:469` asserts actual coefficient-ideal membership, equality and class data. For D=12 the ideals are O,(θ),O and the oriented classes are 1,J,J. Lines 440 and 498 also give the requested −15 and 5 form values. These remain README Checks under the current rule. |
| a/F08: missing source manifest | Repaired | `sources.toml:1`, “schema = "tauceti-roadmap-sources/v1"”; lines 5 and 23 use the existing keys `duke-imamoglu-toth` and `gross-kohnen-zagier`. Both entries contain bibliographic, locator and legal-access fields; both cached texts were read at the cited locations. |
| a/F09: unspecified basis/norm suppliers | Repaired | `README.md:230`, “NumberField.adjoin_halfGen_eq_top_of_mod_four_eq_one”; lines 162 and 858 name all four requested inputs. The generator theorems are at `TauCeti/NumberTheory/NumberField/Quadratic/RingOfIntegers.lean:327,424`; the latter explicitly includes hmin,hgen,hsf,hd4. The norm identities are at `Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean:376,381`. At d=3, β=±θ, the determinant is a and its absolute value is the ideal norm. |
| b/F01: unused finite-module import | Repaired | `Suggested.lean:1`: “import Mathlib”; lines 2–3 import only OrdinaryTwoRank and BinaryQuadraticForm.Basic. The removed Finite import remains available through OrdinaryTwoRank line 9 and quadratic conjugation's NarrowClassGroup line 8. |
| b/F02: nonexistent analytic labels/process word | Repaired; S02 ownership consequence | `README.md:929`, “interfaces belong to AnalyticNumberTheoryPartI, Layer 2”; line 931 names “AutomorphicSpectralTheory §4.17a”. Current section text confirms these applications. AN.4 and the proposed Fuchsian roadmap are absent. Both named analytic roadmaps precede this package; describing their algebraic targets as new here remains S02. |
| b/F03: wrong imaginary form-class owner | Repaired | `README.md:44`, “GeometryOfNumbersAndQuadraticArithmetic consumes the proper classes”; lines 46–47 identify IntegralLattices B2/B4/B5. The supplier's current scope and contract assign these objects to IntegralLattices, whose main B2 at line 1032 has precisely that form/ideal dictionary. |

## Verified sound

Read every line of `packages/MultiquadraticPartII/README.md` (959 lines) and `packages/MultiquadraticPartII/Suggested.lean` (509 lines), plus both repository rules files. The Lean file has **35 declarations: one real-bodied definition, 32 admitted named theorems, and two proved examples**. The supplied elaboration record covers all **33 named declarations**; each was compared with its README statement and written binders. No needed section instance or hypothesis was lost. No Lean command was run or claimed: this review uses the supplied elaborated types and direct pinned-source inspection.

There are **33 named README targets**, including the one definition and seventeen named boundary/API Checks; there are **zero bold mathematical target labels** (the bold spans are Summary, ownership names, Checks, singleton and field). The table below therefore inventories all named targets rather than inventing bold targets. All **40 Check bullets** were tested. **14 source-locator clusters across two legal cached works** and **9 numbered cross-roadmap section contracts plus one scope attribution, across six named roadmaps**, were resolved; the additional MetaplecticAutomorphicForms ownership contract is S02. All fourteen explicitly supplied sibling heads were searched by object, together with the board packages, main and the current open-roadmap index. No fully qualified local-name collision was found.

The headline endpoints are the exact quadratic kernel (§0.1), unique character descent (§0.2), genus-fibre cardinality (§1.1), composite sign (§2.1, already owned: S02), positive-factor/prime-divisor equivalence (§2.2), fundamental two-square criterion (§2.3), the principal-genus arithmetic equivalences (§2.4), the norm-unit/class-number obstruction (§2.5), represented-value independence and the content-zero criterion (§3.1), and oriented form/ideal character comparison (§3.2). **All eleven theorem signatures are present and statable at the pins**, using the one simple new definition. No missing headline, opaque stand-in, sorry-bodied data, conclusion-as-hypothesis, `set_option`, `lemma`, computational algorithm or truncated type was found. S01 and S03 address acceptance padding.

### Declaration and target audit

Every row below records a mathematical evaluation, not an elaboration claim. Locations before the slash are Lean lines; README section locators identify the same target. Context abbreviations are: **F** = arbitrary universe K, `[Field K] [NumberField K]`; **Q** = F, θ in the ring of integers, d in ℤ, explicit hmin and hgen; **S** = finite prime-discriminant set s, hs, at most one even factor, product fundamentalDiscriminant d; **A** = Q+S+squarefree d; **R** = A+d>0; **V** = finite t of prime discriminants with at most one even factor, Q an integral form, Δ=δδ′ and δ′ mod 4 in {0,1}. All these are explicitly retained where indicated. “Delete” refers only to the Lean acceptance declaration; its mathematics stays in README Checks.

| Statement; Lean line / README section | Retained variables and instances | Instances and computed left/right values | Result / change |
|---|---|---|---|
| ker_toClassGroup_eq_pair; 33 / 0.1 | Q,A∈Cl⁺ | Q(√2): J=1, kernel={1}, both membership tests true only at 1. Q(√3): C={1,J}, J²=1, π sends both to 1. Q(i): J=1 and kernel={1}. θ=2√3,d=12 gives the same J as √3. | Both directions hold; no squarefree or positivity binder needed. |
| existsUnique_wideCharacter_iff; 45 / 0.2 | Q,χ:C→*ℤˣ | Q(√3): χ(J)=−1 gives 0 descents and RHS false; χ=1 gives 1 descent and RHS true. C=C4,J=2 additive: both real characters have χ(J)=1 and each has 1 C2 descent. | Holds; the complex character k↦i^k has χ(2)=−1 and is outside the real codomain. |
| narrowDefect_fiber_boundary; 57 / 0.1 | Q,d>0 | d=2: N(1+θ)=1−2=−1, J=1, each fibre size 1. d=3: J≠1, fibre {A,JA} has size 2, J(JA)=J²A=A. | True; delete, S01. |
| wideCharacter_boundary; 72 / 0.2 | Q | Trivial χ: one descent. Odd χ on C2 with J generator: zero descents. On C4,J=2, χ(2)=(±1)²=1: one descent for each of the two real χ. | True; delete, S01. |
| card_genusFiber_mul_twoPow; 91 / 1.1 | A,g:C/C² | Q(√2): r=1,C=1, 1·1=1. Q(√3): r=2,C=C2, each fibre 1, 2·1=2. Q(√−5): r=2,C=C2, 2·1=2. C=C8 quotient model: 2·4=8; C[2] has only 2 elements. | Holds; r=0 cannot satisfy quadratic presentation plus factorization. |
| genusFiber_smallFactorizations; 107 / 1.1 | A,g | r=1,2,3: quotient factors 2⁰=1,2¹=2,2²=4; group models 1,C2,C2×C2 have fibre sizes 1,1,1 and totals 1,2,4. | True specialization; delete, S01. |
| genusFiber_cyclicEight_boundary; 127 / 1.1 | No section binders; Multiplicative(ZMod 8) | Zero fibre {0,2,4,6}, other fibre {1,3,5,7}: 4 and 4; quotient 2; solutions 2x=0 are {0,4}: 2. | True; delete, S01. |
| genusCharacter_J_eq_sign_prod; 139 / 2.1 | R,t⊆s | D=12: t=∅,full gives 1=1=1; each singleton gives −1=−1=−1. D=136: every subset gives 1=1=1. D=−4 would give complementary signs 1 and −1, excluded by d>0. | True; existing owner, S02. |
| primeDiscriminants_positive_iff; 157 / 2.2 | D>0,s,hs,heven,hprod; no F | D=1: true↔true. D=8,40,136: all factors positive and offending-prime count 0. D=12,24: negative factors and offending prime 3, false↔false. Without heven, {−4,−8} has product 32, false↔true. | Holds with stated hypotheses. |
| fundamental_sumTwoSquares_iff; 169 / 2.3 | D>0,IsFundamentalDiscriminant D; no F | D=1,5,8,136: 1+0=1,1+4=5,4+4=8,36+100=136; no prime ≡3 mod4 divides them. D=12: no representation, v₃=1. D=9 would give 0+9=9 but divisor 3; hfund is false. | Holds; nonprimitive coordinates essential. |
| J_square_iff_sumTwoSquares; 179 / 2.4 | R | d=2: J=1 square, 8=4+4. d=3: J not square, 12 not a sum. d=34: J square≠1, 136=36+100, primes 2,17 have residues 2,1. | Both equivalences hold; square does not mean identity. |
| J_ne_one_of_prime_threeModFour; 198 / 2.5 | R,p prime,p∣D,p mod4=3 | d=3,p=3 and d=7,p=7: J≠1, no unit of norm −1, h⁺=2·h (2=2·1 in both fields). d=34 fails hp4 for every divisor, despite J≠1. | Holds; converse deliberately absent. |
| genusCharacter_factorSigns_boundary; 216 / 2.1 | None | χ−4(−1)=−1,χ−8(−1)=−1,χ8(−1)=1,χ∅(−1)=1; products 12,24,136; χ{−4,−3}(−1)=χ{8,17}(−1)=1; signs 1≠−1. | True; delete, S01. |
| primeDiscriminants_boundary; 229 / 2.2 | None | Prime supports of 1,5,8,40,136 are ∅,{5},{2},{2,5},{2,17}; residue-three count 0. 12/3=4,24/3=8; −4 and 32 have only prime 2; (−4)(−8)=32. | True; delete, S01. |
| fundamental_sumTwoSquares_boundary; 240 / 2.3 | None | Displayed sums evaluate to 1,5,8,136,9; 12 has odd 3-valuation, while 9 is not squarefree and is 1 mod4. | True; delete, S01. |
| quadratic_two_boundary; 250 / 2.5 | Q specialized d=2 | (1+θ)(θ−1)=1; N(1+θ)=−1 for θ=±√2; J=1. | True; delete, S01. |
| quadratic_three_seven_boundary; 261 / 2.5 | Q,d=3∨d=7 | Modulo 3 or 7, −1 is not square: square residues {0,1} or {0,1,2,4}; norm −1 impossible. Their negative prime factors make J nonsquare; h⁺/h=2. | True; delete, S01. |
| quadratic_thirtyFour_boundary; 273 / 2.4 | Q specialized d=34 | 1+34y² for y=1,…,6 is 35,137,307,545,851,1225; first square 35². N(35+6θ)=1225−1224=1. For xy=3, x²+34y² is 307 or 43, never 35; no square root unit. J square≠1. | True; delete, S01. |
| binaryFormGenusChar; 291 / 3.1 | t:Finset ℤ,Q:BinaryQuadraticForm ℤ only | Q=0,t=∅: represented set {0}, gcd(0,1)=1, value 1. Q=0,t={−4}: no coprime value, value 0. [2,0,−6],t={−4}: value 0. [−1,0,3],t={−4}: value −1. | Real body; zero-map and absolute-value models fail these values. Ownership extension needed, S02. |
| binaryFormGenusChar_eq_of_represents; 302 / 3.1 | V,x,y,hcop; no F | [1,0,−3],δ=−4: m=1 and −3 both give 1. Its negative: m=−1 and 3 both give −1. [1,0,0],Δ=0,δ=−4: odd-square values give 1. [1,0,−4],Δ=16,δ=−4: m=1,−3 give 1. Invalid [1,0,2] gives m=1,3 and characters 1,−1; cofactor 2 fails hδ′. | Holds; zero/square extension supported by local argument, S02 ownership on overlap. |
| binaryFormGenusChar_eq_zero_iff; 315 / 3.1 | t,ht,Q; no heven/discriminant/field | Q=0,δ=1: false↔false; Q=0,δ=−4: true↔true. [2,0,−6],δ=−4: true↔true (gcd content,δ=2). [0,1,0],δ=−4: 1 is represented, false↔false. t={−4,−8}: Q=x² gives 1, 2x² gives 0, matching content parity. | Both directions hold; CRT handles all distinct underlying primes. |
| binaryFormGenusChar_empty; 323 / 3.1 | Q only | Zero form: 1=1; x²−3y²: 1=1. | Restated Check, also proved again at 419; delete, S01. |
| binaryFormGenusChar_smul; 330 / 3.1 | V,μ∈ℤ | Q=x²−3y²,δ=−4, μ=−1,0,2,3: left values −1,0,0,−1; right χδ(μ)·1 gives −1,0,0,−1. δ=1,μ=0: both sides 1. | Holds, including zero/negative scalar. |
| binaryFormGenusChar_comp; 345 / 3.1 | Arbitrary t,Q,g:GL(Fin 2) ℤ | Identity leaves [1,0,−3]; T direct gives [1,2,−2]; inverse T gives [1,−2,−2]; determinant −1 reflection sends [2,1,2] to [2,−1,2]. Characters are respectively 1,1,1 and −1=−1. | Coefficient formula correct; equal represented-value predicates justify choice equality even outside V. |
| binaryFormGenusChar_proper; 357 / 3.1 | Arbitrary t,Q,γ:SL(2,ℤ) | T • [1,0,−3]=[1,−2,−2], character 1=1. S • [−1,0,3]=[3,0,−1], character −1=−1. | Correct inverse-substitution convention. |
| binaryFormGenusChar_neg; 364 / 3.1 | V | δ=−4,Q=x²−3y²: −1=(−1)·1. δ=5,Q=[2,1,2]: −1=1·(−1). δ=1,Q=0: 1=1·1. Content-zero Q: 0=(−1)·0. | Correct sign; delete the one-tactic corollary, S03. |
| formCharacter_eq_idealCharacter; 379 / 3.2 | R,t⊆s,ω,hω,Q,hdisc,𝔞 unit,h𝔞 | D=12: [1,0,−3] has 𝔞=O, both values 1; [3,0,−1] has 𝔞=(θ), both −1; [−1,0,3] has 𝔞=O but J correction gives −1=−1. D=5,[1,1,−1] has 𝔞=O, values 1=1. Both roots conjugate ideals, χ(A⁻¹)=χ(A). | Correct; h𝔞 fixes all elements, not arbitrary ideal data. |
| formCharacter_empty; 403 / 3.2 | A,Q; no positivity | Any class A: empty product 1; any form including zero: 1; all three conjuncts 1=1. | True; delete, S01. |
| Proved example; 419 / 3.1 Check 6 | Q only | Same predicate and value 1 as line 323, including Q=0. | Boundary duplicate; delete, S01. |
| Proved example; 427 / 3.1 Check 3 | None | Every represented m=2(x²−3y²) is even; gcd(m,−4)≥2, so selection predicate false and output 0=0. | Direct nontrivial definition test; may remain. |
| binaryFormGenusChar_negFifteen_classes; 440 / 3.1 | None | Discriminants 1−16=−15 for both forms; at represented m=2 and 1, χ5 values are −1 and 1. | True; delete, S01. |
| binaryFormGenusChar_discriminantTwelve; 448 / 3.1 | None | Character values 1,−1; χ−4(−3)=1,χ−4(3)=−1; inverse T yields [1,−2,−2], value 1. | True; delete, S01. |
| binaryFormGenusChar_invalidCofactor; 459 / 3.1 | None | Disc [1,0,2]=−8; Q(1,0)=1,Q(1,1)=3; χ−4(1)=1≠−1=χ−4(3). | True; delete, S01. |
| formCharacter_discriminantTwelve_orientation; 469 / 3.2 | Q,d=3; three invertible ideals and exact membership iff | (1,θ)=O; (3,θ)=θO because θ²=3; (−1,θ)=O. Oriented classes 1,J,J; form values 1,−1,−1. S rotates negative Q to [3,0,−1]. x²≡−1 mod3 has no solution. | All conjuncts hold; delete, S01. |
| formCharacter_discriminantFive; 498 / 3.2 | Q,d=5; invertible ideal and exact membership iff | β=(−1+θ)/2 differs from the integral generator (1+θ)/2 by −1; 𝔞=O and class 1. Empty and {5} character values both 1 at Q(1,0)=1. | True; delete, S01. |


### Every README Check

The identifier is section/bullet, so the table covers each of the forty bullets exactly once. Each comparison uses the hypotheses of its section; the three Checks for the single new definition are exceeded by §3.1's seven discriminating bullets.

| Check; README line | Instance and computed values | Result / change |
|---|---|---|
| 0.1/1; 298 | J=1 gives {1,J}={1}; {A,JA}={A}; both cardinalities 1. | Correct. |
| 0.1/2; 300 | d=2,u=1+√2 gives N(u)=−1; π injective and J=1. | Correct. |
| 0.1/3; 302 | d=3: no x²−3y²=−1 modulo3; J≠1, J·A≠A and J·JA=A. | Correct. |
| 0.2/1; 339 | χ=1: ψ=1 works; surjectivity forces ψ(w)=1 for every w; number of descents 1. | Correct. |
| 0.2/2; 340 | χ(J)=−1 but π(J)=1: a putative descent gives −1=ψ(1)=1. | Correct rejection. |
| 0.2/3; 341 | J=1 gives χ(J)=1. C4,J=2 gives every real χ(J)=(±1)²=1; complex χ(k)=i^k gives χ(J)=−1. | Correct distinction. |
| 1.1/1; 409 | s={5} or {8}: r=1, quotient size 2⁰=1; fibre size h⁺/1=h⁺. | Correct; does not infer h⁺=1. |
| 1.1/2; 411 | 12=(−4)(−3),28=(−4)(−7): r=2, quotient size2 and each fibre h⁺/2; the fields here have h⁺=2 and fibres1. | Correct. |
| 1.1/3; 413 | 60=(−4)(−3)5: r=3, factor 2²=4; each fibre h⁺/4, four fibres sum to h⁺. | Correct. |
| 1.1/4; 414 | C8: squares {0,2,4,6}, quotient C2, fibre sizes4; two-torsion {0,4}, size2. | Correct negative control. |
| 2.1/1; 466 | δ=1,−4,−3,12: signs and character values on J are 1,−1,−1,1. | Correct. |
| 2.1/2; 468 | (−8)(−3)=24; 8(−3)=−24. | Correct dyadic sign control. |
| 2.1/3; 470 | D=8: singleton sign1. D=136: subproducts1,8,17,136 all positive, all χ(J)=1 even with J≠1. | Correct. |
| 2.1/4; 472 | Empty product1. D=−4: signs1 and−1 differ. | Correct exclusion of imaginary extension. |
| 2.2/1; 513 | D=12,24: 3 divides each and has residue3; negative factor sets {−4,−3},{−8,−3}. Both sides false. | Correct. |
| 2.2/2; 515 | D=5,8,40,136: prime supports {5},{2},{2,5},{2,17}, residues1 or2; all signed factors positive. D=1 gives two true vacuous conditions. | Correct boundary, with nonvacuous neighboring cases. |
| 2.2/3; 517 | D=−4: prime2 has residue2, so right side true; −4>0 false. | Correct missing-positivity control. |
| 2.3/1; 553 | 1²+2²=5;2²+2²=8;6²+10²=136. Last two pairs have gcd2. | Correct rejection of primitive-coordinate restriction. |
| 2.3/2; 555 | v₃(12)=1; no sum of two integer squares. | Correct. |
| 2.3/3; 556 | 0²+3²=9,3∣9; 9≡1 mod4 but 3²∣9, so fundamentality false. | Correct. |
| 2.3/4; 558 | D=1=1²+0². X²−1=(X−1)(X+1) cannot be a degree-two minimal polynomial over ℤ of a number-field element. | Correct arithmetic/field distinction. |
| 2.4/1; 604 | D=12,3∣D: J nonsquare, q(J)≠0. | Correct. |
| 2.4/2; 605 | D=136=6²+10²: J square, q(J)=0. | Correct. |
| 2.4/3; 607 | d=34: smallest norm-one unit35+6√34 has no integral square root (candidate x²+34y² is43 or307, not35); no norm-minus-one unit and J≠1. | Correct. |
| 2.4/4; 609 | d=34,J≠1 but each genus χ(J)=1: descent kills J, while the narrow classes A and JA remain distinct. | Correct; the wide quotient still identifies two classes. |
| 2.5/1; 642 | d=3,D=12,p=3: J≠1; kernel size2; h⁺=2h=2. | Correct. |
| 2.5/2; 644 | d=7,D=28,p=7: J≠1; kernel size2; h⁺=2h=2. | Correct. |
| 2.5/3; 645 | D=136: prime divisors2,17 have residues2,1; no residue3 divisor, yet J≠1. | Correct failure of converse. |
| 3.1/1; 770 | Q(1,0)=1,Q(0,1)=−3; χ−4(1)=χ−4(−3)=1, whereas χ−4(3)=−1. | Correct rejection of absolute-value definition. |
| 3.1/2; 775 | −Q(0,1)=3; χ−4(3)=−1=(−1)·χ−4(Q). | Correct sign. |
| 3.1/3; 776 | [2,0,−6]: Δ=48=(−4)(−12), gcd(content,δ)=2, character0. | Correct zero branch. |
| 3.1/4; 780 | [1,0,2]: Δ=−8=(−4)·2; cofactor2 mod4=2, values1 and3 have characters1 and−1. | Correct cofactor control. |
| 3.1/5; 784 | [2,1,2] and [1,1,4] both Δ=−15; represented2 and1 give χ5=−1 and1. | Correct class separation. |
| 3.1/6; 787 | δ=1,Q=0 gives represented0, gcd(0,1)=1 and empty product1. Norm of principal ideal(0) is0, so it cannot enter the nonzero-ideal carrier. | Correct; S01 deletes the Lean mirror only. |
| 3.1/7; 790 | T inverse substitution gives (x−y)²−3y²=x²−2xy−2y²; direct substitution gives x²+2xy−2y². Values are both1 at(1,0). | Correct action witness. |
| 3.2/1; 886 | a=1,β=±√3: ideal O, N=1,class1; all genus values1. | Correct for either root. |
| 3.2/2; 889 | a=3,β=±√3: ideal θO,N=3,N(θ)=−3,classJ; χ−4(3)=−1=χ(J). | Correct. |
| 3.2/3; 891 | a=−1,ideal O,class1 before correction; oriented classJ and value−1. Mod3, x² cannot be2, so Q cannot represent−1. | Correct; wrong uncorrected comparison gives1≠−1. |
| 3.2/4; 896 | D=5: β=(−1±√5)/2 integral generator up to integer/sign; ideal O; empty and full factor values1. | Correct. |
| 3.2/5; 898 | For χ(A)=ε,χ(J)=s, source class labels A⁻¹,JA,JA⁻¹ evaluate to ε,sε,sε. For D=12,A=1,s=−1 the values are1,−1,−1. | Correct character comparison; it does not claim to distinguish JA from JA⁻¹. |

### Conventions, degeneracies and proof routes

| Object or convention | Explicit computation / excluded model | Result |
|---|---|---|
| Quadratic presentation and discriminant | d=2,3,5,34 give D=8,12,5,136. d=0,1,4 make X²−d reducible; no hmin. θ=2√3 gives d=12,D-function48, but its field discriminant is12: squarefree is therefore retained in all D-dependent field targets. | No illicit degree-one, square or nonsquarefree field instance. |
| Characteristic/universe/zero ring | `[NumberField K]` gives characteristic0 and finite degree over ℚ; 2≠0. A zero ring cannot satisfy Field; characteristic2 or3 and inseparable extensions cannot satisfy NumberField. Universe u is arbitrary throughout F. | No missing hypotheses hidden by the intended domain. |
| Narrow positivity relation | For x=−2 in a real quadratic field, N(x)=4>0, but both embeddings are negative; −x=2 is totally positive and (−2)=(2). For x=√3,N=−3 and the signs differ. | The positive-norm formulation is used only in quadratic signature, consistent with the native totally-positive quotient. |
| Prime-discriminant conventions | 3*=−3,5*=5,7*=−7; dyadic set−4,8,−8. D=24 uses−8, not8. Empty product1, not0. | Signs agree with pinned oddPrimeDiscriminant and dyadic characters. |
| Natural subtraction / cardinalities | r=1,2,3 gives r−1=0,1,2. r=0 has natural subtraction0 but would force D=1, contradicting hmin. For the trivial group q has one fibre of size1; no 0/0 arises. | Genuine quadratic hypotheses remove the only dangerous subtraction case. |
| Nonabelian tests | S3 has three squares (A3) but four elements killed by2; Q8 has two squares {±1} and quotient size4. Neither is a CommGroup, whereas the native elementary-two carrier and NarrowClassGroup require/produce one. | No nonabelian group slips into the types; two-torsion/fibres remain distinct. |
| Zero form and invalid factors | Q=0 has represented set{0}; its selected branch is inhabited exactly when δ is a unit. For t={−4}, value0; for t=∅,value1. For arbitrary invalid t the definition remains total, but evaluation/sign/scalar laws retain their prime-discriminant hypotheses. | No undefined choice and no universal Kronecker assertion on invalid t. |
| Choice / substitution | Equal represented-integer predicates give equal choice values by predicate extensionality and proof irrelevance. T and T⁻¹ have the same value set despite coefficients b=2 and b=−2. The singular matrix diag(1,0) sends [0,0,1] to0 and changes its δ=−4 character1→0, so GL invertibility matters. | Comp/proper invariance holds on the wider total definition; singular substitutions are correctly excluded. |
| Local independence, including p=2,3 | At p=3,4aQ=(2ax+by)²−Δy² makes aQ a nonzero square mod3. Dyadic allowed residues for aQ are {1} mod4 for−4,{1,7} mod8 for8,{1,3} mod8 for−8; each corresponding character is1. Δ=0 gives an odd square, residue1. | The local proof covers both dyadic cases and the zero-discriminant extension. |
| Content and CRT | Q=xy gives Q(1,0)=Q(0,1)=0 but Q(1,1)=1; this is why the third local pair is needed. Q=2x²−6y² gives even values everywhere. Distinct underlying primes are pairwise coprime even if t contains multiple dyadic discriminants. | The zero law requires no discriminant or heven assumption. Pinned Nat.chineseRemainderOfList supplies the finite CRT. |
| Integral basis / denominator2 | D=5 gives β=(−b±θ)/2 and shift (D+b)/2∈ℤ since b odd. D=12 gives β=−b/2±θ and b even. Relative to (1,β), coefficient-ideal basis (a,β) has determinant a, norm abs(a). | Division by2 is in characteristic0; a≠0 since otherwise D=b², impossible for this field. |
| Norm/character sign parity | For signs(a,m)=(+,+),(+,−),(−,+),(−,−), the integer exponents [m<0]+[am<0] are0,2,1,1; [a<0] is0,0,1,1. Their parities agree in all four cases. N(α)=am and N(α𝔞⁻¹)=abs(m). | Oriented comparison has the correct sign. Empty t is separated before requiring m≠0. |
| Root choice and class inverse | For D=12,ω=±2√3 give the same tested ideals. Generally 𝔞·conj(𝔞)=(abs(a)), with positive generator, so classes multiply to1 and χ(A⁻¹)=χ(A) since χ²=1. | Either root is allowed; no marked-embedding claim is made. |
| Genus field convention | D=136 gives Q(√2,√17), whose four embeddings are real. D=12 gives Q(i,√−3), whose maximal real subfield is Q(√3). | Repaired total-reality statement agrees with the completed owner. |
| Negative-Pell Check | For d=34, 35+6√34 has norm1; any smaller positive norm-one unit has 1≤y≤5, whose x² candidates35,137,307,545,851 are nonsquares. A norm-minus-one fundamental unit would square to it; xy=3 gives x²+34y²∈{43,307}, not35. | Boundary proof is sound. The rank-one unit structure is available from Mathlib NumberField.Units.finrank_modTorsion and basisModTorsion. |

The finite arithmetic audit used coefficients −6 through6, coordinate samples −3 through3, and all64 subsets of {−3,5,−7,13} with zero or one of {−4,8,−8}. It tested **8,438 eligible form/factor pairs**, including **2,880 zero-discriminant** and **3,874 square-discriminant** pairs; **6,695** had a sampled nonzero character and **1,743** had the content-zero obstruction. It found no inconsistent represented values, no failure among **42,190 scalar identities**, **33,752 substitutions**, or **10,985 local content tests**. All **608 positive fundamental discriminants≤2,000** satisfied the two-square criterion. These finite searches are supplementary counterexample tests, not proofs or evaluations of Lean's noncomputable choice.

### Source certification

These are locator checks against the supplied legal cached texts, using their printed page numbers. No source text was copied into the report or package. The negative-leading-coefficient and zero-discriminant extensions are supported by the displayed local arguments; the sources' narrower domains are not silently attributed to them.

| Locator cluster | Source lines and scope verified |
|---|---|
| DIT §2, pp.950–951: narrow/wide quotient | duke-imamoglu-toth line 76 and line 87: real quadratic narrow equivalence and quotient by J; matches §0.1. |
| DIT §2, p.951: norm-minus-one criterion | duke-imamoglu-toth line 88: nontriviality of J versus absence of an integral unit of norm−1; real hypothesis retained. |
| DIT §2, p.951: prime obstruction | duke-imamoglu-toth line 90: sufficient prime-divisor obstruction; package does not assert its converse. |
| DIT §2, p.951: fundamental forms primitive | duke-imamoglu-toth line 117: content-one assertion at fundamental field discriminants. Package's field presentation excludes D=1 and square D. |
| DIT §2, p.952: norm-form dictionary | duke-imamoglu-toth line 123 and line 132: positive-leading-coefficient normalization; negative-a correction is derived explicitly here from the supplied B2 convention. |
| DIT §2, p.952: inverse/sign table | duke-imamoglu-toth line 135, line 136 and line 137: inverse, JA and JA⁻¹ in the asserted order. |
| DIT §4, p.959, (4.1)–(4.2) | duke-imamoglu-toth line 410 through line 415: narrow quotient and genus-fibre count; h(D) means narrow, unlike the README's h(D). |
| DIT §4, p.960, after (4.4) | duke-imamoglu-toth line 444 through line 446: principal-genus, prime-divisor and two-square criteria; D is a positive field discriminant. D=1 arithmetic extension is checked separately. |
| DIT §7, p.971, after (7.7) | duke-imamoglu-toth line 960 through line 963: descent when χ(J)=1. The converse and uniqueness follow from the pinned surjection and exact kernel. |
| DIT §7, p.971, before (7.8) | duke-imamoglu-toth line 964 through line 990: genus characters and composite sign. The source's unqualified sign sentence cannot hold at D<0; the package correctly inserts D>0. |
| DIT §9, pp.977–978: form definition | duke-imamoglu-toth line 1329 through line 1343: positive definite forms when D<0, and the content-zero rule. The package also covers negative definite and zero-discriminant forms by its local argument. |
| DIT §9, p.978, before Proposition5 | duke-imamoglu-toth line 1344 through line 1345: form/ideal character agreement at positive fundamental D. |
| GKZ Notations, p.503 | gross-kohnen-zagier line 299 through line 308: discriminants nonzero, fundamental divisor1 allowed, Kronecker sign at−1. Package explicitly flags its Δ=0 extension. |
| GKZ Ch.I §2, pp.508–510 | gross-kohnen-zagier line 488 through line 499: fundamental-divisor congruence and scalar/content extension; line 521 through line 540: represented integers and odd/dyadic independence. No level-N generalization is claimed as a local target. |

Both source manifest entries have distinct lifetime keys, the correct DOI and legal publisher/author URLs, the supplied cache hashes, certified status and target associations. No cited mathematical work is missing or paywall-dependent, and no missing-reference request is needed. The resolver's two leads are false positives: `Mathlib.NumberTheory.SumTwoSquares` is a module, and `Mathlib/NumberTheory/SumTwoSquares.lean:211` contains the asserted `Nat.eq_sq_add_sq_iff`.

### Pinned carriers, proof inputs and ownership

The content checkout is main at `a07e2024f391f3022520c3f8ad194912b3eab614`. Both library checkouts are clean and their HEADs match `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Declaration names were located at these pins and their actual argument lists read, including standing-variable inclusions.

| Pinned input / repository-relative location | Actual contract and implication |
|---|---|
| `TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.lean:83` | Native definition is `(FractionalIdeal (𝓞 K)⁰ K)ˣ ⧸ narrowPrincipalSubgroup K`; line67 defines the subgroup using totally positive generators. This is not an arbitrary group or a norm-positive quotient for all number fields. |
| Same file:96,150,159,164,206,224,229,237,256,259 | mk, forgetful homomorphism/surjectivity, principal map/range kernel, principal-square, totally-positive and negation laws, integral ideal map and compatibility. All support the stated uses. |
| `TauCeti/NumberTheory/NumberField/NarrowClassGroup/Finite.lean:38,59` | Finite narrow group and cardinality multiplication; no missing finite instance in genus counts. |
| `TauCeti/NumberTheory/NumberField/Quadratic/Conjugation/NarrowClassGroup.lean:87,144,215` | Principal-class dichotomy and negative-norm class need hmin,hgen; norm-minus-one iff also needs d>0. Those hypotheses are retained. |
| `TauCeti/Algebra/Group/ElementaryTwoQuotient/Basic.lean:92,105,135,195,341` | Additive ModN quotient of a CommGroup, quotient map, square criterion, surjectivity, additive comparison with quotient by square subgroup. It is not the two-torsion subgroup; transport to multiplicative cardinality APIs is explicit. |
| `TauCeti/NumberTheory/NumberField/NarrowClassGroup/ElementaryTwoQuotient.lean:67,100`; `TauCeti/NumberTheory/Multiquadratic/Quadratic/TwoRank.lean:239`; `TauCeti/NumberTheory/Multiquadratic/Quadratic/Ramification.lean:186` | Native narrow quotient, its cardinality, narrow two-rank and ramified-prime count. The latter two require the quadratic presentation and squarefree d; count additionally requires the displayed factorization. |
| `TauCeti/NumberTheory/Multiquadratic/Prime/Discriminants.lean:60,450`; `TauCeti/NumberTheory/Multiquadratic/Prime/Discriminant/Basic.lean:54` | Exact prime-discriminant predicate, underlying rational prime, and signed odd factor; no extra exceptional factor occurs at2. |
| `TauCeti/NumberTheory/Multiquadratic/FundamentalDiscriminant/Basic.lean:68,234`; `TauCeti/NumberTheory/Multiquadratic/FundamentalDiscriminant/OfSquarefree.lean:51`; `TauCeti/NumberTheory/Multiquadratic/FundamentalDiscriminant/Subfactorization.lean:70` | Fundamental predicate includes1, excludes0; squarefree radicand discriminant; distinct prime factors with at most one even give fundamental products; all-odd subproduct is1 mod4. Injectivity required by the indexed product theorem is automatic for a Finset of integers. |
| `TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/Basic.lean:212,220,231,253,266,277`; `TauCeti/NumberTheory/Multiquadratic/Legendre/PrimeDiscriminant/Character.lean:72,247` | Real-bodied product of dyadic/Jacobi characters, empty value, multiplication, zero iff noncoprime, ±1 on coprime inputs, correct sign at−1. Prime hypotheses remain on the nonvanishing and sign statements. |
| `TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/NarrowClassGroup.lean:134,157,222` | Actual class character, evaluation through nonzero coprime integral ideals, product of singletons. The full hmin,hgen,hsf and factor data occur in the function type. |
| `TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/CoprimeIdeal.lean:52,71,103` | Carrier is a submonoid of **nonzero** integral ideals; coprimality concerns the indexing subset product, not all D. This makes the repaired empty-factor split necessary and sufficient. |
| `TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/OrdinaryTwoRank.lean:111,164`; `TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/PrincipalGenus.lean:150` | Singleton sign at J, all-positive-factor square criterion, singleton-character principal-genus test. No claim was made that the composite sign is already the singleton pinned statement; the duplicate composite owner is the roadmap in S02. |
| `TauCeti/NumberTheory/BinaryQuadraticForm/Basic.lean:94,116,146,155,188,203` | Three coefficients over R; eval is ax²+bxy+cy²; discrim is b²−4ac; SL action is inverse substitution. The native carrier itself imposes no nondegeneracy, primitiveness or sign condition, so the wider zero/square/imprimitive tests are necessary. |
| `TauCeti/NumberTheory/NumberField/Quadratic/RingOfIntegers.lean:327,424`; `Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean:376,381` | Maximal-order generators under squarefree/congruence hypotheses; determinant-index and principal-ideal norms. Read the include block at Tau Ceti line417: hmin,hgen,hsf,hd4 are all retained. Ring-of-integers finite/free/Dedekind instances discharge the norm context. |
| `Mathlib/GroupTheory/QuotientGroup/Defs.lean:249`; `Mathlib/GroupTheory/QuotientGroup/Basic.lean:159`; `Mathlib/GroupTheory/Coset/Basic.lean:493`; `Mathlib/GroupTheory/Coset/Card.lean:53` | Quotient lift, surjective first isomorphism, fibre/kernel equivalence, cardinality multiplication; no counting assumption is hidden in a chosen fibre. |
| `Mathlib/NumberTheory/SumTwoSquares.lean:211`; `Mathlib/Data/Nat/ChineseRemainder.lean:65`; `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean:456,465` | Full prime-valuation sum-of-squares iff, finite pairwise-coprime CRT and rank/basis of units modulo torsion. These ground the local proof steps and the negative-Pell Check. |

Cross-roadmap references were resolved to **main** for Completed/Multiquadratic Layer3, IntegralLattices B1–B5 and GlobalNumberFields Layer11, ignoring open revisions of those existing roadmaps. The current new-roadmap heads were used for GeometryOfNumbersAndQuadraticArithmetic (`465728d`, scope and supplier contract), AnalyticNumberTheoryPartI (`4ba2e21`, Layer2), AutomorphicSpectralTheory (`c5cfb92`, §4.17a) and the newly detected owner MetaplecticAutomorphicForms (`22bee85`, §7.20a). The open index marks each of those four as a new roadmap.

The explicit fourteen sibling folders were all searched. EffectiveClassNumbers consumes the same binary-form carrier and IntegralLattices dictionary (`TauCetiRoadmap/EffectiveClassNumbers/README.md:35,85,91`), with no competing genus-character target. AbelianSchemesAndArithmeticModuliPartII's narrow-class references concern quaternionic class sets, not these targets. Remaining hits concern unrelated genus-one surfaces or the narrowing of analytic hypotheses. No additional supplier is needed from those fourteen heads. Object searches of all board packages found only this package's form-character/narrow-genus targets. Exact local-name searches of main and indexed open heads found no collision; object-level duplication is still S02.

The supplied merge order places AutomorphicSpectralTheory at 79, AnalyticNumberTheoryPartI at 80, MetaplecticAutomorphicForms at 128 and MultiquadraticPartII at 191. S02 therefore repoints to earlier owners and requires no upward dependency or merge-order change. No supplier gap is declared, and no absent source or unknown supplier contract was treated as supplied.

The requested dependency command completed with exit 0 and exactly:

```text
depcheck: 15 roadmaps, 102 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The current internal proof order is acyclic: §0.1→§0.2; §2.2+§2.3→§2.4; §0.1+§2.4→§2.5; §2.1+§3.1→§3.2. Layer1 uses pinned suppliers independently. The grouped boundary statements add no circular proof route, although they are excluded from acceptance by S01.

`git diff --stat origin/main...HEAD` lists only the six package files: README.md, Suggested.lean, metadata.toml, sources.toml, review.json and the earlier repair report. No outside-package change, import violation, process wording in README/docstrings, or copied source passage was found. This review wrote only its requested report and scratch notes; the final working-tree status has only this report as an untracked addition. No package source, pin, merge-order file or external service was changed.

## Not verifiable

- Independent Lean elaboration and execution of the two proved examples: prohibited by the read-only brief. All 33 supplied elaborated types were compared with README and source signatures, but this is not a fresh Lean run and does not certify proof scripts.
- Literal source coverage of the Δ=0 extension, arbitrary negative leading coefficient and imaginary versions of the quadratic kernel/count: the papers do not state these full extensions. The report checks the local arguments and pinned algebra that support them rather than claiming a source theorem verbatim.
- Future compiled APIs of the still-open suppliers in S02: their current README contracts can be checked, but those are not present pinned Lean modules. Repointing the roadmap must preserve that distinction. No unread legal text or unresolved locator remains.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "9a5eed89879404e69fec34e23548762ffd622a5f", "job": "RT-MultiquadraticPartII~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
