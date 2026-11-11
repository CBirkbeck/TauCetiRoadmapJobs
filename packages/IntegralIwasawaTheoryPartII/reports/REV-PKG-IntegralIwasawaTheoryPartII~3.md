<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13146#issuecomment-6783355336 -->
Review (codex) of f3c0eae

Verdict: needs_changes

1. **F01** (P1) The strict density bound for distinct Eisenstein pairs is false

   **Location.** packages/IntegralIwasawaTheoryPartII/README.md:434, §2.2a: “different T_λ-eigenvalues for a set of primes λ of Dirichlet density greater than 1/2”.

   **Claim.** Any two different primitive character pairs disagree on more than half the primes.

   **Witness.** Over ℚ at weight 4 and level 25, compare (1,1) and (ξ,ξ), with ξ the quadratic character modulo 5. Their eigenvalues are 1+ℓ³ and ξ(ℓ)(1+ℓ³); disagreement has density exactly 1/2.

   Both pairs have trivial nebentypus and belong to the stated indexing: their conductor products are 1 and 25. The primes in the classes 2 and 3 modulo 5 give disagreement, and those in 1 and 4 give agreement. At ℓ=2 the values are 9 and −9; at ℓ=11 both are 1332. Chebotarev gives density 2/4, rather than a strict inequality.

   Lin12 line 259, Theorem 3.3, p. 6, says that agreement on a set of density strictly greater than 1/2 forces equality. Its contrapositive bounds the agreement density above by 1/2; it does not make the complementary bound strict. The source is correct.

   **Exact repair.** Replace the assertion by disagreement on a set of density at least 1/2, or state the source's agreement criterion precisely and use positive-density disagreement for the independence route. Explain existence of these densities through the finite joint character quotient. Add the quadratic-twist example as a Check. The repaired bound evaluates to 1/2 ≥ 1/2 on this example, and still supplies the separating primes needed in §§2.2a and 2.6.

2. **F02** (P1) Ordinary projection does not remove tame oldform multiplicity

   **Location.** packages/IntegralIwasawaTheoryPartII/README.md:435, §2.2a: “the ordinary projector keeps at most one vector of each pair”; the same assertion is used at line 497.

   **Claim.** At arbitrary level, a primitive Eisenstein pair contributes at most a one-dimensional ordinary space.

   **Witness.** At F=ℚ, level 6, weight 4, p=2, the pair (1,1) contributes independent ordinary forms g=E₄−8E₄(2z) and g(3z). Both satisfy U₂f=f; their coefficients at 1 and 3 are (1,28) and (0,1).

   Use the divisor-sum normalization c(1,E₄)=1, as in the README. Then c(n,g)=Σ_{d∣n, d odd}d³, so c(2n,g)=c(n,g). The translate by 3 commutes with U₂ and is ordinary too. The two coefficient columns have determinant 1. Thus the retained dimension is 2, not at most 1. This also follows from the README's own change-of-level and U-operator formulas.

   The supplier explicitly retains this distinction: pull request #1307, TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:2537, uses only primes above p in the ordinary projector. Pull request #1019, TauCetiRoadmap/PadicFamilies/README.md:2880, does the same. Neither removes tame translates.

   **Exact repair.** Keep the general-level basis theorem. State the one-dimensional assertion for each fixed prime-to-p translate and primitive pair, with zero ordinary contribution if the first character is ramified at a prime over p. Describe the ordinary space as the span of all admissible prime-to-p translates of the ordinary stabilization. In §2.6 separately justify why its minimal tame level leaves no such multiplicity: the tame conductor of ηφ equals 𝔫, while 𝔣_η𝔣_φ divides the level, forcing the tame translate to be 1. Add the level-6 Check. The repaired general formula gives the two translates g and g|B₃ here, while the minimal-tame-level application has one.

3. **F03** (P2) The lower-bound route omits cross-coordinate logarithmic shifts

   **Location.** packages/IntegralIwasawaTheoryPartII/README.md:285, §0.8: “every monomial omits some exceptional coordinate i, and on the corresponding box the function is (1 − π_i) applied to a function constant near 0”.

   **Claim.** Omitting the i-th logarithm makes the corresponding monomial a single (1−π_i)-difference in the specified module, without lower-degree corrections.

   **Witness.** Take F=ℚ(√5), p=11, π₁=(4+√5)⁴, π₂=(4−√5)⁴. At the second prime c=ℓ₂(π₁)≡88 mod 121. For h=1_Aℓ₂, (1−π₁)h=1_𝒪ℓ₂+c1_B, not 1_𝒪ℓ₂.

   Here prime 1 is the root √5≡7 mod 11, prime 2 the root √5≡4. Both generators are totally positive and congruent to 1 modulo 8: π₁=761+336√5. They generate fourth powers of the two primes. The CM extension F(√−2) splits at both primes over 11, since −2≡9 mod 11; its character has conductor dividing 8, so this is compatible with the exceptional-prime setting. Put

       Δ₂ = 𝒪₂ ∖ π₂𝒪₂,
       A = 𝒪₁ × Δ₂,   B = π₁𝒪₁ × Δ₂,   𝒪 = A ∖ B,
       h(x₁,x₂) = 1_A(x₁,x₂) ℓ₂(x₂).

   The action is f(x) ↦ f(x/π₁), including its action on coordinate 2. Thus the displayed error is c1_B. At x=(π₁,1), the purported target has value 0 and (1−π₁)h has value c≠0. For the numerical check, √5≡48 mod 121 at prime 2, 4+√5≡52, and log₁₁(52)≡22 mod 121, giving c≡4·22=88.

   There cannot instead be a compactly supported primitive constant near zero in coordinate 1 for this single difference: solving along the π₁-orbit from outside the compact support forces its values on successive inner shells to be ℓ₂(x₂)−nc. With c≠0 these are not eventually constant as x₁ approaches zero.

   CD14 lines 1498–1523, proof of Theorem 5.2, pp. 31–32, explicitly retains lower-degree logarithmic terms and uses induction. The previous review's k=0 computation does not test this step at k=1<r=2.

   **Exact repair.** Keep the all-prime theorem and its hypotheses. Replace the single-difference argument by the source's induction on total logarithmic degree, with the auxiliary boxes and the shifts ℓ_𝔮(π_i) stated. Make this an explicit subclaim of §0.8, citing CD14 (88), pp. 31–32. On the witness, the correction is itself an augmentation difference:

       c1_B = (1−π₂)(c1_{π₁𝒪₁ × 𝒪₂}),
       1_𝒪ℓ₂ = (1−π₁)h − (1−π₂)(c1_{π₁𝒪₁ × 𝒪₂}).

   Both terms belong to I·C_c^♭. At x=(π₁,1) the corrected right side is c−c=0, matching the left side. Add this two-coordinate negative control; the k=0 Check remains valid.

4. **F04** (P3) The negative-control substitution Check has the wrong extra term

   **Location.** packages/IntegralIwasawaTheoryPartII/README.md:681, §4.4: “the product of the substituted series has the extra term ((ε − 1)/π)² y′z′”.

   **Claim.** For arbitrary nilpotents with y′+z′=π, failure of the character product is given by that expression.

   **Witness.** In E[y,z]/(y²,z²), put π=y+z and ε(X)=(1+LX)², L≠0. Substitution gives ε(y)ε(z)−ε(π)=2L²yz, whereas ((ε(π)−1)/π)²yz=4L²yz.

   This is also a universal-character example: take L=log_p(u) and a Galois element with principal cyclotomic value u². Here yz≠0, π³=0. The linear expression ε_y=1+((ε−1)/π)y used in the theorem itself required πy=y². Once yz=0 is removed, that identity cannot also be retained to compute a substituted series.

   **Exact repair.** Replace this Check by the explicit quadratic-series calculation above, or state only that the product identity can fail and give its actual values. The main theorem, under yz=0, is unchanged. On the corrected negative control the discrepancy is 2L²yz≠0; imposing yz=0 makes it zero. This is a README correction, not a request to add Lean padding.

5. **F05** (P3) Two ownership bullets still record branch state

   **Location.** packages/IntegralIwasawaTheoryPartII/README.md:31 and :32: “(on main)”.

   **Claim.** The permanent supplier descriptions retain the current branch status of ClassFieldTheory and Chebotarev.

   **Witness.** The repair of previous R10 deleted the open-pull-request inventory at line 17, but these two literal occurrences remain in Scope and ownership. Both supplier citations resolve without them.

   **Exact repair.** Delete the two parenthetical phrases. Keep the roadmap names and section numbers. Retest by searching the README for branch and review-process wording; these two occurrences should disappear, while ClassFieldTheory Layers 7, 11–13 and Chebotarev Layer 10 remain resolvable.

Five findings: two P1, one P2 and two P3. The previous ten findings were checked first. The repeated-vector defect in the Eisenstein basis is repaired, but two assertions added to its API are false. A higher-degree test of the lower-bound argument also exposes a missing induction step. The remaining findings concern a negative-control calculation and residual process wording.

The README, Suggested.lean, metadata, sources manifest and design gaps were read without modification. Only this report and review.json are review deliverables. No source entry was added or changed.

## Verified sound

### Previous findings, checked first

No preceding finding was marked not actionable in this package. There is no re-raised settled exemption.

| Previous finding | Status | Repaired passage and witness checked |
| --- | --- | --- |
| R01: repeated imprimitive basis | Repaired as to the original defect; new API defects are R01–R02 above | README:429 now indexes “triples (η, φ, 𝔱)” with primitive characters. At level 8 the coefficient matrix in :441 is triangular with diagonal (1,1,1,1), determinant 1, rather than the old rank at most 3. |
| R02: p-ramified character families | Repaired | README:402 says “Write the conductor of χ as 𝔫𝔣_p”; :112 and :120 declare the two p-ramified gaps. All five slugs and their named suppliers match design/plan.json. In the former witness, N(−4−√5)=11 and the two residues are 3 and 0; the new contract admits it. |
| R03: partial-zeta weight space and global unit | Repaired | README:227 restricts separately to “characters x ↦ ⟨x⟩^s”; :235 calls the factor a “unit in the ring of analytic germs at s = 0”. Full weight −1 is −1/2, principal value is 0; the dyadic factor is 4 at 0 and 0 at 1. |
| R04: pinned Koszul ownership | Repaired | README:67 names “TauCeti.koszulComplex.exactAt_of_isWeaklyRegular”; :260 uses MonoidAlgebra for the multivariable group algebra. Native exactness and H₀ statements were opened. Rank-one H₁=0, H₀=ℂ_p; rank-two successive quotients are ℂ_p[π₂±1] and ℂ_p. |
| R05: empty test-form tuples | Repaired | README:219 says “nonempty finite tuples” and “m ≥ 1”. The empty product would give the divergent absolute harmonic sum; the one-form tuple X₁ has finite truncations, and X₁+√2X₂ is admissible in dimension 2. |
| R06: coefficient-order dimension | Repaired | README:639 now says “two-dimensional local domain” and localizes at “the height-one prime (T, y)”. The prime chain has length 2; localization dimension is 1; its completion has the two factors stated. |
| R07: impossible rational Case 1 | Repaired | README:503 replaces it by “F = ℚ(√5), p = 11” and explicitly excludes positive-rank Case 1 over ℚ. The displayed example has #R=#R′=1; over ℚ, r=1 forces #R′=0. |
| R08: duplicate source keys | Repaired | sources.toml has one DKV16 record, with both doi and arxiv and a version_note. There are 9 distinct work records. Published locators and the normalized preprint Theorem 3.2 use this same key. |
| R09: absent complex Hecke carrier | Repaired | Suggested.lean:14 says “The complex side exists at the pins”. TauCeti.LFunctions.heckeLFunctionC takes a ray-class character over any number field and has the stated zero fallback. |
| R10: process inventory | Partly repaired | The ownership bullet at README:17 now contains only the mathematical cocycle construction and comparison. The same process-state pattern remains twice at :31–32; R05 above completes the repair. |

The repaired patterns were searched beyond their original lines: conductor splitting and all-prime gaps through Layers 2–4; principal versus full weight and germ units in §§0.6–0.8; primitive-pair indexing, ordinary projection and constants in §2.6; nonempty tuple use in the integrality bound; native Koszul imports in Needs and Dependencies; manifest aliases; and branch-state wording throughout the README.

### Principles, structure and coverage

Read all 52 numbered targets, all six layer Examples/Dependencies sections, every Needs line, all conventions, supplier contracts, worked examples and source-correction bullets. The adversarial work used previous computed rows only for unchanged material; previously summarized material and the seeded targets were examined directly. The table below gives fresh and retained computed evidence, with the higher-degree and tame-level tests that were absent previously.

The scope extends IntegralIwasawaTheory and imports its Deligne–Ribet, cyclotomic and Baker–Brumer work; it does not re-plan that roadmap. It retains p=2, ramified characters, all totally real degrees, nonfree extension modules, and orders s>r. It separates the leading-term identity from the unproved arbitrary-rank order conjecture. No computational algorithm, copied source passage, sorry'd data, option override, forbidden supplier or route-specific restriction was found. The ordinary-projection defect is an erroneous auxiliary theorem, rather than a deliberate narrowing of the scope.

The six layers have mathematical names and dependency sections. The chain from arithmetic invariants through cohomology/families, Hecke quotients, actual representations and the determinant is explained by the stated inputs; no source-chapter heading or assertion of following a source occurs. Main's ClassFieldTheory, LFunctions and ModularForms were read for house style and supplier context. Definitions have prose API bullets and at least three associated Checks; the false Check is isolated in R04. Every numbered theorem has a source locator or explicit native/supplier attribution. The ownership/declaration-name audit found no backticked identifier asserted as a new Lean declaration of this package: the implementation-style names are supplier or library names; the remaining names are mathematical notation. Metadata contains the topic math.NT.

### Seeded source sample

Line locators below refer to the supplied numbered extractions. DKV16 means the published Annals text unless marked preprint; printed page = extraction page + 832. CD14 uses the author-copy pagination. All 15 seeded targets were checked, including their hypotheses and signs. The four settled uncertified works are listed separately below.

| Target | Text read at the locator | Outcome |
| --- | --- | --- |
| 0.3 valuation and rank | DKV16 lines 102–124, (5)–(6), pp. 835–836; lines 181–201, pp. 837–838 | Rationalized minus-module isomorphism and rank r; not an integral isomorphism. |
| 0.4 regulator | DKV16 lines 124–147, p. 836; lines 193–201, (8), p. 838 | Signed determinant on X_χ; row-scaling law and normalization agree. |
| 0.6 cocycle and measures | CD14 lines 96–101, 163–228, 306–351, 1048–1100, 1240–1270; Theorems 1.1, 3.1, 4.2, Proposition 4.3 | Nonempty variable-length tuples, full-weight moments, prime-norm smoothing, measure domain and principal restriction read. New interpolation repair agrees with (74). Sc93 remains uncertified. |
| 0.8 lower bound | CD14 lines 132–143, Theorem 3, p. 4; lines 1350–1523, (79)–(88), pp. 28–32; DKV16 lines 86–92 | All-prime inequality supported. The shortened positive-degree route loses the source's induction: R03. |
| 0.9 order boundary | DKV16 lines 84–92 and 129–174, pp. 835–837 | Equality of order is a conjecture; equivalence with nonzero regulator follows after Theorem 1. |
| 1.9 cohomological regulator | DKV16 lines 228–255, Proposition 1 and following comparison, p. 839 | det X/det Y with unsigned local logarithms agrees with the signed regulator. |
| 3.3 Case 3 algebra | DKV16 lines 898–927, Theorem 3.8, pp. 855–856 | s>t≥r, π^tW=y^t, and top-product sign agree. |
| 3.8 Case 1 image | DKV16 lines 664–729, Theorem 3.3, pp. 850–852 | Full Hecke operators and surjection/injectivity argument, including the top product, agree. |
| 4.1 representations | DKV16 lines 950–1009, Theorem 4.1 and (50)–(55), pp. 857–858 | Coefficient fields, Λ-adic continuity, determinant χε, ordinary shape and closed coefficient orders agree. Completion adapter checked algebraically. |
| 4.4 infinitesimal characters | DKV16 lines 1187–1223, (70)–(74), p. 862 | Constant term 1 and identities under yz=0 agree. The extra README negative control is wrong: R04. |
| 4.5 diagonal entries | DKV16 lines 1215–1236, Lemma 4.4, pp. 862–863 | Both trace equations and separated residual eigenvalues are used. |
| 4.9 second-order bound | DKV16 lines 1318–1334, Lemmas 4.8–4.9, pp. 864–865 | Inclusions in the total quotient ring; multiplication by the maximal ideal gives the square. |
| 5.2 oriented leading term | DKV16 lines 1398–1434, (85)–(87), pp. 866–867 | Nonzero z^r class, sign, s=r and s>r alternatives agree. |
| 5.5 rank zero | DKV16 lines 55–76, 124–160, pp. 834–837 | Interpolation gives D_χ and the determinant is 1, including the dyadic pole branch at zero. |
| 5.8 rank one/classical cases | DKV16 lines 133–160 and 228–255, pp. 836–839; IntegralIwasawaTheory §4.2 | r≤1 nonvanishing and the named classical specializations are supported; Baker–Brumer has algebraic, not arbitrary p-adic, coefficients. |

Also checked the changed Eisenstein basis against Lin12 lines 206–216, 226–263 and 297–306, pp. 5–7, and DDP11 lines 1138–1163, §2.3, p. 465. The latter is a restricted setting; the general weight-at-least-three basis is supported by Lin12, while the stated weight-two attribution to W86 remains uncertified. The normalized projection was checked in DKV16 preprint lines 559–560, Theorem 3.2, p. 16, against published lines 644–645, p. 849. Ventullo's family and dyadic exponent were checked at V15 lines 568–569, 728–748 and 773–792.

The nine cited works each have one manifest key. No author-recorded provenance was rewritten. The preprint/publication distinction is explicit. There is no new missing-source request.

### Adversarial table

Formal Artin examples test algebraic identities, not the existence of arithmetic characters violating rank-one nonvanishing. Zero rings and characteristic-p coefficient fields do not satisfy the standing finite-extension-of-ℚ_p hypotheses. Empty ranks are tested before the positive-rank Artin construction. Both reciprocity directions, the nonabelian cap action, and two different filtrations are tested explicitly.

| Statement | Instances tried | Computed sides / values | Result; change |
| --- | --- | --- | --- |
| Conventions; 0.1 | ℚ(i), p=2,3,5; reciprocity on μ₅ over ℚ₂ | χ(p)=0,−1,1; r=0,0,1. Arithmetic exponent 2, inverse-Artin exponent 3; 2·3≡1 mod 5 | Sound. |
| 0.2 odd components/projector | G=C₂, p=2; u=(2+i)/(2−i) at 5 | ((1−c)/2)²=(1−c)/2 over E; u has divisor (1,−1); roots of unity tensor to 0 | Sound rational projector; no integral division by 2. |
| 0.3 valuation isomorphism | Same unit; rank 0 | Valuation coefficient 1 and minus rank 1; rank-zero map 0→0, empty determinant 1 | Sound after rationalization. |
| 0.4 regulator | O=(2), L=(3); O=diag(2,3), L=diag(5,7); repeated rows | Ratios −3/2, 35/6; common basis change gives 140/24=35/6; repeated logarithm rows give 0 | Sound sign and allowed vanishing. |
| 0.5 analytic invariants | f=6Ds², r=2; f=Ds³; zero series | f''/(2D)=6, not 12; rank-two coefficient 0 versus first coefficient 1; zero series order ⊤, excluded by nonzero germ | Sound. |
| 0.6 tuple domain | n=1 empty/X₁; n=2 X₁+√2X₂/X₁ | Empty cutoff absolute sum diverges; X₁ cutoff finite; irrational form's rational kernel {0}; X₁(0,1)=0 | Repair sound. |
| 0.6 full/principal moments | ℚ, f=1, p=3, c=2, k=1 | Full moment (−3)(−2)(−1/12)=−1/2; principal component 0 on dense even integers, hence 0 at −1 | Repair sound. |
| 0.6 smoothing | χ₄, p=2, c=3 | h(0)=4; h(1)=1+3/(−3)=0; unsmoothed ζ(0) smoothing at 3 gives (1−3)(−1/2)=1 | Germ unit, not global unit. |
| 0.7 cap product | Generator acts by 2, m=6; S₃ permutation action, u=(123) | Contragredient evaluation 3=3, wrong action gives 12. On e₂ with e₁*, inverse action gives 1, direct action 0 | Sound, including nonabelian action. |
| 0.7 Koszul/edge | r=0,1,2; free and trivial modules | r=0 identity; regular rank-one H₁=0,H₀=ℂ_p; trivial H₁=ℂ_p; successive rank-two quotients ℂ_p[π₂±1],ℂ_p | Sound native substrate and freeness. |
| 0.7 repeated augmentation element | (1−π₁,1−π₁) | Second element becomes 0 in nonzero first quotient; multiplication has nonzero kernel | Correct negative Check. |
| 0.8 lower bound | k=0,r=1; k=1,r=2 with π₁,π₂ above | Degree 0: 1_Δ=(1−π)1_𝒪. Degree 1 at x=(π₁,1): target 0, single difference c≡88 mod 121; repaired difference c−c=0 | R03. |
| 0.9 order boundary | f=Ds^r and Ds^(r+1) | Orders r and r+1; normalized r-coefficients 1 and 0 | Both directions sound; not unconditional order equality. |
| 1.1 restricted H¹ | ℤ_p with trivial E-action; discrete replacement; local pair | Inclusion has value 1 at 1 and is continuous; discrete-coefficient homomorphisms have value 0; o(ϖ)=1, o(unit)=0, ℓ(1+p²)≠0 | Sound topology and independence. |
| 1.2 Kummer/duality | Local uniformizer, unit; finite p-primary class group C_p | Unramified evaluation on uniformizer 1, on unit 0; C_p⊗ℚ_p=0 but C_p/pC_p=C_p | Limits/rationalization and orthogonal local conditions retained. |
| 1.3 orthogonality | r=1, x=−3,y=2,o=2,ℓ=3; r=0 | −6+6=0; reversed pairing 6−6=0; empty sum 0 | Sound common sign. |
| 1.4 reciprocity | C₂, minus unit | Conjugate contribution (−1)κ(−u)=κ(u); total 2κ(u)=0 implies κ(u)=0 even over ℚ₂ | Sound. |
| 1.5 inertia injection | Finite class group C_m; r=0 | If f is additive into E then m f(g)=0 implies f(g)=0; H¹_∅=0 | Sound torsion-free coefficients. |
| 1.6 cyclotomic coordinates | 2o+3ℓ; all y_j=0 | Extracted pair (2,3), not (3,2); zero logarithm coordinates give zero inertia values and zero global class | Sound. |
| 1.7 dimension | r=0,1,2; O invertible | Kernel dimensions 0,2−1=1,4−2=2; for O=2,L=3, y determines x=−3y/2 | Sound. |
| 1.8 algebraic invariant | X=2,Y=3; diagonal X=(2,5),Y=(3,7); r=0 | 2/3; 10/21=40/84 after common row scaling; empty ratio 1 | Sound. |
| 1.9 comparison | O=diag(2,3),L=diag(5,7),Y=I | X=diag(−5/2,−7/3); XO+YL=0; both invariant ratios 35/6 | Sound. |
| 2.1 weight coordinate | π=T/log_p(u), p=2; f=as²+bs³ | dπ/dk at 1 is 1; dT/dk is log_p(u); leading coefficient a, linear cs gives −c; ⟨−1⟩=1 | Sound normalizations. |
| 2.2 stabilization | Weight-one coefficients at an exceptional prime | Unstabilized c(q^j)=j+1; stabilized c(q^j)=1; (U−1) sends the first sequence to 1 and the latter to 0 | Sound. |
| 2.2a primitive basis | ℚ, level 8, weight 4 | Coefficient columns at 1,2,4,8: (1,9,73,585),(0,1,9,73),(0,0,1,9),(0,0,0,1); determinant 1 | Original repeated-vector repair sound. |
| 2.2a old imprimitive pairs | Same level | Both pairs give (1,0,28,0,126,…) and E−9E|B₂+8E|B₄; their difference is 0 | Correct negative Check. |
| 2.2a density | Quadratic ξ mod 5, level 25 | At 2: 9,−9; at 11: 1332,1332; disagreement 2/4=1/2 | R01; replace strict bound. |
| 2.2a ordinary multiplicity | Level 6, k=4,p=2 | g and g|B₃ have coefficients (1,1,28,28) and (0,0,1,1) at 1,2,3,6; U₂ fixes both; rank 2 | R02; retain tame translates. |
| 2.2a boundary weights | Level 1 k=2; level 11 k=2; level p² even k≥4 | No t>1 at level 1, dimension 0; level 11 gives one corrected Eisenstein form and one cusp form, dimension 2; p² count 3+(p−2)=p+1 | Sound corrected indexing. |
| 2.2a U and pair order | k=4,q=2; k=3,χ₄,q=3 | U₂ roots 1,8 with vectors E−8E|B₂ and E−E|B₂; T₃ eigenvalues −8 and 8 | Local formulas sound; global multiplicity R02. |
| 2.3 auxiliary family | Weight shift; auxiliary norm q | (1+u^(k−1)−1)/u−1=u^(k−2)−1; ν₁(shift)=ν₀; (q+1)/q≠0 | Sound. |
| 2.4 case split | s=t, s>t, w=−1 | ord W=s−t; inverse has t−s; at s=t, w=a/b; −1≠0 and remains Case 2 | Sound. |
| 2.5 semi-cusp | Case 1 constants; w=−1 | 2^(−d)ℒ−2^(−d)Dℒ/D=0; weight-one value (1−1)E₁=0; correction signs −aπ and +aπ² | Sound. |
| 2.6 projection | Normalized operator; level-11 T₂ separator | ν₁(t)E₁=E₁ excludes t=0; T₂−3 gives 0 on Eisenstein and −5 on cusp. At minimal tame conductor t_tame=1 | Endpoint sound; ordinary premise clarified by R02. |
| 3.1 and 3.4 | r=s=1; r=1,s=2; r=2,s=3 | W₁=E[π]/π²; ε=−aπ² for s=2; dimension 2²+3−1=6 | Sound. |
| 3.2 and 3.5 | r=s=1,w=−1 or 1; r=2,s=3 | w=−1: π=0,ε=−ay,dim=2; w=1: y=π/2; general dimension 2²+6−2=8 | Sound top element z, including w=−1. |
| 3.3 and 3.6 | r=t=1,s=2,c=−a/b | y=cπ², ε=−aπ²=by; basis 1,π,π²; y mod 𝔪²=0 but yW/y²W=E·y≠0 | Sound signs and distinct filtrations. |
| 3.7 orbit/Y | χ(q)=1 or −1; norm q≥2 | Denominator residue 0 in first case, 2log_p⟨Nq⟩≠0 in second; Y²−πY=0 | Correct choice excludes division by zero. |
| 3.8 image headline | r=s=1 Case 1 | W₁ dimension 2; U_p=1+aπ; product relation ε=aπ | Source and algebra agree. |
| 3.9 image headline | r=s=1,w=−1 or 1 | π=0,z=−y at −1; y=π/2 at 1, so tame U-image 1+(log⟨Nℓ⟩)π/2 | Correct nontrivial tame image and no general division by 1+w. |
| 3.10 image headline | r=t=1,s=2; d=s−t≥1 | Dimension 3; last image Y=cπ²; elimination order 2s−t≥s+1 | Sound stronger truncation. |
| 4.1 actual representations | Complex conjugation; p=2 | det=−1,trace=0,eigenvalues ±1 in E; reduction modulo ϖ_E identifies signs but residue at height-one T is characteristic 0 | Correct topology/residue distinction. |
| 4.1 completion Check | 𝒪_E[[T]][y]/(y²−T²(T+p)), √p∈E | Prime-chain length 2; localized dimension 1; after completion y²−T²s²=(y−Ts)(y+Ts), two fraction fields | Dimension repair sound. |
| 4.2 good element | Residual diag(1,−1); line (1,1) | Difference −2≠0 in E even at p=2; both line coordinates 1≠0 | Sound line avoidance at every prime above p. |
| 4.3 upper cocycle | χ(g)=−1,χ(h)=1,b(g)=2,b(h)=3 | b(gh)=5; κ(gh)=−5=−2−3; unnormalized left-action expression −1 | Correct twist. |
| 4.4 main identity | A=(ε−1)/π=3; yz=0 | (1+3y)(1+3z)=1+3π=ε; constant at identity 1 | Theorem sound. |
| 4.4 negative control | y²=z²=0,yz≠0; ε(X)=(1+LX)² | Actual difference 2L²yz; alleged difference 4L²yz | R04. |
| 4.5 diagonals | Residual τ=diag(1,−1) | Two-trace system determinant −2; trace alone leaves (a+t,d−t) indistinguishable | Sound use of second trace. |
| 4.6 local comparison | ρ=((2,1),(0,3)), invariant line (1,1) | b=(3−2)=1 and c=(3−3)=0; both comparison coordinates 1 | Sound orientation and division in K. |
| 4.7 ramification | ℓ≠p; χ(g)=−1,v=2 | Finite torsion maps to 0; compact pro-ℓ/pro-p image 0; (1−χ⁻¹)v=4 is coboundary of −2 | Sound. |
| 4.8 generation | Quotient coboundary; χ(τ)=−1 | κ(τ)=−2v=0 forces v=0; finite quotient modulo 𝔪 is 0, hence quotient 0 | Sound Nakayama input. |
| 4.9 second order | Â=E[[t]],α=t⁻¹ | α𝔪=E[[t]], α𝔪²=tE[[t]]; multiplying B⊆E[[t]] gives 𝔪B⊆tE[[t]] | Sound without integral α. |
| 5.1 exact determinant | Weighted rows 2,3; columns (3t,−2t),(6t,−4t) | Weighted sums 0,0; determinant −12t²+12t²=0 before specialization | Sound. |
| 5.2 leading comparison | r=s=2,O=diag(2,3),L=diag(5,7) | 35z²+6(−(35/6)z²)=0; regulator 35/6. For s>r the top product has graded value 0 | Sound sign and graded cancellation. |
| 5.3 lower cocycle | χ(g)=−1,c(g)=2,c(h)=3; Case 3 | c(gh)=2−3=−1; ε−ε_z=ε_y−1; r=t=1,s=2 gives nonzero y-line E·cπ² | Sound χ-action and finer ideal. |
| 5.4 inverse comparison | r=t=1,s=2,O⁻=2,L⁻=3 | (3+2b)y=0 gives b=−3/2=R_p(χ⁻¹); y²=0 but y≠0 | Sound. |
| 5.5 rank zero | χ₄,p=2 and 3 | D=f(0)=1/2 and 1; normalized coefficient 1=empty regulator; order 0 | Sound. |
| 5.6 Gross–Stark | χ₄,p=5,u=(2+i)/(2−i) | D=1/2,o(u)=1; derivative =−log₅(u)/2 and normalized value =−log₅(u) | Headline normalization agrees. |
| 5.7 exact-order iff | Ds^r; Ds^(r+1) | Orders r,r+1 and coefficients 1,0 | Both directions sound. |
| 5.8 rank one | Same u; logarithm kernel test | u has conjugate valuations (1,−1); u^N=ζ5^k would force (N,−N)=(k,k), hence N=k=0, contrary to N≥1 | Correct concrete nonvanishing; general proof uses algebraic Baker–Brumer. |

### Pinned declarations and duplication audit

Pins inspected: Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e; Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5. The following are actual pinned files opened, not inferred names:

| Objects | Pinned file and lines | Qualification checked |
| --- | --- | --- |
| Matrix.det, det_mul | Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:63,141 | Finite square matrices over a commutative ring; empty determinant 1. |
| Matrix.det_nonsing_inv | Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean:422 | Ring inverse of determinant; intended field division uses det O≠0. |
| LinearMap.det, det_toMatrix | Mathlib/LinearAlgebra/Determinant.lean:164,203 | Fallback 1 without a finite basis; the roadmap proves the needed finite rank. |
| Class-group finiteness, unit rank | Mathlib/NumberTheory/NumberField/ClassNumber.lean:59; Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean:462 | Number-field class group and ordinary units, not already the χ-part p-unit comparison. |
| Totally real, CM | Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:48; Mathlib/NumberTheory/NumberField/CMField.lean:70 | Infinite-place condition; totally complex and quadratic over the maximal real subfield. |
| PowerSeries.coeff, X, order | Mathlib/RingTheory/PowerSeries/Basic.lean:77,155; Mathlib/RingTheory/PowerSeries/Order.lean:50 | Formal series; zero order is ⊤, not an analytic-order theorem. |
| Henselian completion | Mathlib/RingTheory/Henselian.lean:81,154 | Specified ideal and adic-completeness hypothesis. |
| Total quotient localization | Mathlib/RingTheory/Localization/FractionRing.lean:52,744 | Inverts nonzerodivisors; not automatically a field. |
| Weak regularity | Mathlib/RingTheory/Regular/RegularSequence.lean:136,147 | Weak regularity and the separate nonzero final quotient condition. |
| groupHomology, groupHomologyIso | Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:226,254 | Algebraic representation and projective resolution of the trivial representation. |
| groupHomology.indIso | Mathlib/RepresentationTheory/Homological/GroupHomology/Shapiro.lean:65 | Induced representation, with source subgroup retained. |
| Continuous H¹ and trivial-action equivalence | TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:829,1057 | Continuous cocycle quotient; not a discrete replacement. |
| Local Artin map, continuity, density, norm | TauCeti/NumberTheory/ClassFieldTheory/Local/ArtinMap.lean:114,188,248,345 | Dense map from Kˣ, not a surjection before completion. |
| Dyadic Frobenius normalization | TauCeti/NumberTheory/ClassFieldTheory/Local/Cyclotomic.lean:205 | Arithmetic exponent 2 on fifth roots; inversion gives exponent 3. |
| Koszul construction and H₀ | TauCeti/RingTheory/KoszulComplex/Basic.lean:219,399 | Functional on a module; finite sequence via Fintype.linearCombination. |
| Koszul positive exactness and tensor comparison | TauCeti/RingTheory/KoszulComplex/Regular.lean:140; TauCeti/RingTheory/KoszulComplex/Tensor.lean:319,340 | Weakly regular finite sequence; tensor differential has its degree sign. |
| Presented Hecke L-function | TauCeti/NumberTheory/LFunctions/Hecke/Basic.lean:74 | Every number field, ray-class character, zero fallback absent continuation. |
| Primitive elliptic Eisenstein indices | TauCeti/NumberTheory/ModularForms/EisensteinSeries/Subspace.lean:81 | Primitive pair, parity, raising parameter, level divisibility. |
| Independence/complement | TauCeti/NumberTheory/ModularForms/EisensteinSeries/Independence.lean:128; TauCeti/NumberTheory/ModularForms/EisensteinSeries/Dimension.lean:204 | k≥3 and fixed character; the roadmap imports these for F=ℚ. |

Object searches over both pinned libraries found no Deligne–Ribet branch, Sczech cocycle, Gross–Stark theorem, global normalized Iwasawa-log carrier or ordinary Hilbert coefficient-family carrier making the listed headlines statable. Existing deep-unit logarithm and complex Hecke definitions do not supply those objects. Generic matrices, tensor products, free abelian groups, group algebras and power series are imported, not redeclared. The new Koszul and elliptic Eisenstein supplier paragraphs repair the earlier duplication.

Ran roadmaps grep over main and the supplied open heads for the objects, including Sczech/Spiess, Gross–Stark, Eisenstein complements/newforms, cap products and Koszul constructions. Read the five closest roadmaps: #1306 IntegralIwasawaTheory, #1307 NoncommutativeAndEquivariantIwasawa, #1019 PadicFamilies, #1311 EulerSystemsCyclotomicMainConjecture and #1066 OrdinaryAutomorphicFormsAndModularityLifting. The first supplies the arithmetic infrastructure; the next two own the forms/families and localization; #1066 owns the two-character series but explicitly leaves their decomposition out; #1311 concerns cyclotomic Euler-system applications. The general primitive-pair Hilbert basis is the extension owned here; its elliptic case is imported. HilbertModularForms' even-weight cusp Eisenstein presentation and level-one divisor sums are distinct from the character/degeneracy-indexed general basis here. No second construction of these new Gross–Stark objects was identified. Topological cap products and completed Iwasawa Koszul sequences are different objects from the discrete-group adapter of §0.7.

The board package index was read. AnalyticNumberTheory at 310e834 and LogicAndDefinabilityInNumberTheory at 8d875d1 were fetched read-only and searched by object; no competing owner of these objects was identified. LawrenceVenkateshMethod at 9ee7ac3 returned 404, recorded below rather than treated as absent.

### Cross-roadmap citations, overlaps and supplier order

Every supplier section was resolved again. Line numbers below are README line numbers, excluding the wrapper emitted by roadmaps show.

| Supplier and version | Resolved sections and evidence |
| --- | --- |
| ClassFieldTheory, main | TauCetiRoadmap/ClassFieldTheory/README.md:1204,1781,1834,1924, Layers 7,11–13. Former §2.6 maps to C.6 at :267; the inverse-norm convention is at :543 and :1230. |
| Chebotarev, main/completed | TauCetiRoadmap/Completed/Chebotarev/README.md:410,416, Layer 10 and hasDirichletDensity_frobeniusPrimeSet. |
| LFunctions, main | TauCetiRoadmap/LFunctions/README.md:929,1440, Layers 5 and 7, finite-order Hecke functions, functional equation and nontrivial-character nonvanishing. |
| ModularForms, main | TauCetiRoadmap/ModularForms/README.md:353,355–377, §0.1: weight-two corrected series and character-space complement; weight-one relations kept separate. |
| IntegralIwasawaTheory, #1306 | TauCetiRoadmap/IntegralIwasawaTheory/README.md:63,97,704,857,912,1302,1322, §§0.1,0.4,4.2,6.0,6.3,9.3. Read the full cyclotomic character, algebraic-log kernel/Baker–Brumer, pseudomeasure/interpolation, cusp geometry and Hasse lift. |
| ArithmeticGaloisDuality, #858 | TauCetiRoadmap/ArithmeticGaloisDuality/README.md:700,1401,2294,3118,3436,6018,6222, the seven cited R02/D7 sections. Rational/lattice descent, S-unit Kummer/Picard term, dual-first pairing, Poitou–Tate and dyadic real-place corrections retained. |
| DirichletPadicLFunctions, #1039 | TauCetiRoadmap/DirichletPadicLFunctions/README.md:268–280, §0.6: decomposition, normalized global logarithm, finite-extension norm comparison and angular coordinate. |
| IntegralHeckeAndGaloisDeterminants, #1689 | TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md:2270,2444,3258, §§1.3,1.4,4.1: henselian GMA, extension modules and determinant uniqueness with Hausdorff coefficients. |
| NoncommutativeAndEquivariantIwasawa, #1307 | TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:2519–2541, §F.5: full form spaces, normalized coefficients and ordinary families. Odd-p and prime-to-p-conductor qualifications at :2533. |
| PadicFamilies, #1019 | TauCetiRoadmap/PadicFamilies/README.md:2848,2876,2914,2928,2942, §§5.9a–5.13: Hida presentation, Fourier injection, minimal-tame-level reducedness and eigenfamily fields. |
| OrdinaryAutomorphicFormsAndModularityLifting, #1066 | TauCetiRoadmap/OrdinaryAutomorphicFormsAndModularityLifting/README.md:365,367,369, §2.12(a,b): two-character series and the Hilbert-family representation interface; no Eisenstein complement is supplied. |

The citations lead for Determinant.eq_of_charpoly_frobenius is resolved at #1689, README:3258. It is a supplier target, not a claimed pinned declaration. A fresh roadmaps resolve reported no missing cross-roadmap citation or name; its automatic library phase said it lacked pinned Lake packages, so the local pinned-file audit above was performed separately.

The supplied overlaps report has no conflicting head, dropped cited id, or id available only in an open revision. Its closest-roadmap suggestions were inspected. No upward citation or cyclic handoff was found. There is no competing fully qualified Lean declaration in this package, since it declares none.

All five gap slugs are present in both design/plan.json and the matching README supplier subsection:

- dyadic-hilbert-coefficient-families;
- dyadic-hilbert-hida-localization;
- hida-family-representations-all-degrees;
- p-ramified-hilbert-coefficient-families;
- p-ramified-hilbert-hida-localization.

Each names the supplier and its section, the missing prime/character range and the relevant exact interface. These are coherent extensions of coefficient families, localization and representations, not requests to rebuild already supplied objects. The family E(χ,1) is used only for R′ empty, which forces 𝔣_p=1; the new p-ramified gap therefore need only supply E(1,χ). The representation gap now includes both missing family ranges. Their unimplemented status is not a finding.

The prescribed dependency check returned exit 0 and exactly:

    depcheck: 236 roadmaps, 2141 edges, 0 problem(s)

There was no UPWARD, CYCLE or moved line. The command used the specified configuration, name, order, content checkout and --movable. No order file was edited.

### Headline coverage, signatures, elaboration and padding

The README's headline list checked is: the all-prime order lower bound (§0.8), the cohomological regulator identity (§1.9), the three Hecke-image identifications (§§3.8–3.10), Gross–Stark including rank zero (§§5.5–5.6), and the exact-order/rank-one consequences (§§5.7–5.8). Each is named in Suggested.lean's module docstring with missing native infrastructure. The new complex-Hecke-carrier acknowledgment is accurate and does not supply a Deligne–Ribet branch. No statable headline was identified as omitted or replaced by arbitrary scalars, a free proposition, or an artificial encoding.

Ran lake env lean on the package's Suggested.lean from the pinned content checkout, using the absolute argument required by the brief. Exit code 0; no output, no errors and no warnings. The file has one import Mathlib, one module docstring, the correct namespace and zero declarations. No TauCeti module is imported, so no targeted module build was required.

The exhaustive declaration-signature audit and one-tactic padding probe each have domain of size zero: there are no defs, instances, theorems, sorried theorems or examples to check or probe. No binder could silently disappear, and no boundary/API theorem is padding. No stand-in was added to make the file longer.

## Not verifiable

- Sc93, Theorem 4: settled uncertified. The original text was not read or requested again; CD14 line 351 confirms the attribution and restriction u=0.
- W86, Proposition 1.5: settled uncertified. DDP11 lines 1157–1163 and Lin12 lines 246–247 confirm the attribution, but the primary weight-two statement was not independently read.
- Br82, Chapter V §3 and Chapter VII §6: settled uncertified. The cap pairing and product-group resolution were checked directly; the book itself was not read.
- AL13, Proposition 3.11 and Theorem 3.6: settled uncertified. Lin12 provides the readable weight-at-least-three basis and density statements; the original paper was not read.
- Board package packages/LawrenceVenkateshMethod/README.md at head 9ee7ac3, board pull request #345: read-only contents request returned HTTP 404. Ownership against this package could not be checked.

All available independent work was completed despite these settled access limits. The five supplier gaps are contracts for future library work. The successful empty Lean build establishes elaboration only; the README defects above remain actionable.

## Source issues

- **Misprint** in DKV16 at §1.3, definition after (14), p. 841: the source says the first nonzero derivative uses the branch χ; it should use χω, consistently with interpolation and the main theorem; affects nothing.
- **Misprint** in DKV16 at Remark 1.1, p. 837: the source says the regulator composite acts on the unit component; it should act on the divisor component, with the conjugate composite on units; affects nothing.
- **Gap** in DKV16 at Theorem 3.2, p. 849: the source says an operator makes the family cuspidal without fixing its Eisenstein eigenvalue; it should require eigenvalue one on the weight-one Eisenstein form, as in preprint Theorem 3.2; affects the proof.
- **Misprint** in DKV16 at proof of Theorem 3.6, p. 854: the source says the exponential term of the dimension count uses the analytic order; it should use the exceptional rank, giving 2^r+2s−2; affects nothing.
- **Misprint** in DKV16 at proof of Theorem 3.6, the definition of ε_J, p. 854: the source says the product has a fixed factor index; it should use the varying index j over J; affects nothing.
- **Error** in DKV16 at Remark 3.7, p. 855: the source says every tame level-dividing Hecke operator has image one in the rank-one quotient; it should retain the cyclotomic linear term from Theorem 3.6; affects a stated result.
- **Misprint** in DKV16 at §4.3 before (70), p. 862: the source says the cyclotomic character expansion begins in degree one; it should begin in degree zero with constant one; affects nothing.
- **Gap** in DKV16 at proof of Lemma 4.7, p. 864: the source says local inertia image is pro-ℓ and the coefficient vector space is pro-p; it should separate finite torsion and put compact images inside p-adic lattices; affects the proof.
- **Misprint** in DKV16 at §5.2, p. 867: the source says the lower-entry product uses the first argument in the diagonal factor; it should use the second argument there; affects nothing.
- **Misprint** in DKV16 at the conclusion after (89), p. 868: the source says the first and rank-r coefficients concern χ; it should concern χ⁻¹, whose order is t; affects nothing.
- **Misprint** in CD14 at proof of Theorem 5.1, p. 31: the source says a free group-ring module has homological dimension one; it should have projective dimension zero, giving vanishing in every positive degree; affects nothing.
- **Misprint** in V15 at the final sentence of §4.2, p. 20: the source says the construction finishes Theorem 1; it should refer to Theorem 2; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "f3c0eae6145488438e704f68785d0509cfe39fc1", "job": "REV-PKG-IntegralIwasawaTheoryPartII~3", "model": "gpt-6-astra", "worker": "chris-30"} -->
