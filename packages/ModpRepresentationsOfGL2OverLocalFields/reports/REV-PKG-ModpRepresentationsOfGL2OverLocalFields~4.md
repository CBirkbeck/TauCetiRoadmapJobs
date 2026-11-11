<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13474#issuecomment-6792510962 -->
Review (codex) of 541882b

Verdict: needs_changes

1. **F01** (P2) The general-field filtration loses nonsplit coefficient representations

   **Location.** `packages/ModpRepresentationsOfGL2OverLocalFields/README.md:705`: “for every finite `F/ℚ_p`”; lines 706–707: “graded pieces are quotients of Serre-weight inductions”. The coefficient convention at lines 128–131 imposes a splitting field only in Layers 3–9. Line 630 identifies a Serre weight as absolutely irreducible.

   **Claim.** Over the arbitrary finite coefficient field k of Layer 1, every finitely generated smooth representation for every F has a filtration by quotients of inductions of the imported absolute Serre weights.

   **Witness.** Take F unramified quadratic over ℚ₅, k=𝔽₅ and V=𝔽₂₅, with g acting by multiplication by the angular component of det(g). V and V restricted to K are irreducible over k, but not absolutely irreducible.

   Here the angular component sends 5 to 1 and a unit to its residue. Consequently the action factors through G′, is smooth and makes V cyclic. Write 𝔽₂₅=𝔽₅[t]/(t²−2). The element diag(t̃,1) of K acts, in the basis (1,t), by the matrix ((0,2),(1,0)). Its minimal polynomial X²−2 has no root in 𝔽₅, whose squares are 0,1,4. Thus V restricted to K is irreducible, with endomorphism field 𝔽₂₅, of dimension 2 over k. After extending scalars to 𝔽₂₅ it is the sum of the two distinct characters ac(det) and ac(det)⁵; t⁵=−t.

   A nonzero K-map from an absolutely irreducible k-weight σ to V would be an isomorphism, contradicting these endomorphism fields. Frobenius reciprocity therefore gives Hom_G′(c-Ind_K^G′ σ,V)=0 for every such σ. Since V is irreducible, a filtration as asserted would have one nonzero graded piece, giving just such a forbidden quotient. The third Check at lines 716–717 has the same defect. Treating σ as a weight over k̄ instead does not produce a k-linear quotient without a restriction-of-scalars/descent construction.

   The proof in CDN23 line 726 uses **irreducible composition factors of W**. Its general-F observation at line 729 does not turn a nonsplit irreducible k-representation into an absolutely irreducible one. The supplier really does use algebraically closed coefficients: PR #879, `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:8202`, R07.5.15. The package records that same convention at lines 297–301.

   **Exact repair.** Keep every F and every finite k. State the general-field filtration with compact inductions of all irreducible finite-dimensional smooth k[K]-modules, extending them to KZ by trivial scalar-uniformiser action. Explain that these may be nonsplit k-forms and become sums of absolute Serre weights after a finite splitting extension. Distinguish this coefficient-descent form from the absolute weights imported from R07.5.15. Amend the irreducible Check accordingly and add the example above as a negative control. The ℚ_p application in §1.3 can continue to use the split Serre-weight description.

   **Test of repair.** In the example take W=V restricted to K. The map c-Ind_K^G′ W→V supplied by the identity on W is surjective; the corrected filtration has one step. After extending to 𝔽₂₅ the two absolute characters give the split description. Dimensions are respectively 2 over 𝔽₅ and 1+1 over 𝔽₂₅, so no coefficient generality is discarded.

2. **F02** (P3) The Diamond invariant Check includes characters that do not lift

   **Location.** `packages/ModpRepresentationsOfGL2OverLocalFields/README.md:1258`: “the characters of `H` on it are those of the `I₁`-invariant lines of the constituents”.

   **Claim.** The characters of D₀(ρ̄)^{I₁} are the invariant-line characters of all Jordan–Hölder constituents of D₀(ρ̄).

   **Witness.** BP12 line 3671, §16 case (iii), p. 92, has four constituents when p=17 and r₀=5; BP12 line 3675 and Proposition 14.7, line 3302, give dim D₀(ρ̄)^{I₁}=2.

   Take a tame irreducible parameter with inertia ω₂⁶⊕ω₂¹⁰², over a coefficient field containing 𝔽₂₈₉. It is generic and satisfies the stated 1-deep condition. The four constituents and their upper-Iwahori invariant characters are:

   | Constituent | Dimension | H-character exponents (a,d), modulo 16 | Value on diag(3,1) |
   | --- | ---: | --- | ---: |
   | Sym⁵ | 6 | (5,0) | 5 |
   | Sym⁹ ⊗ det⁶ | 10 | (15,6) | 6 |
   | Sym¹¹ ⊗ det⁵ | 12 | (0,5) | 1 |
   | Sym³ ⊗ det | 4 | (4,1) | 13 |

   The two socle weights are Sym⁵ and Sym¹¹⊗det⁵. Their two invariant lines already account for the actual invariant dimension 3¹−1=2. Thus the actual character set is {(5,0),(0,5)}, not the four-element set displayed above. The other two constituent invariant lines do not lift through the nonsplit extensions. This is failure of exactness of pro-p invariants, not a coefficient-field ambiguity.

   **Exact repair.** Replace the third Check by this explicit example, retaining the valid statement that I₁ acts trivially and H need not act trivially. Say that the two socle characters occur and that the two upper constituent characters do not lift. Do not identify invariants with invariants of the semisimplification. No change to the definition of D₁, to §7.3's use of the actual character set, or to Suggested.lean is needed.

   **Test of repair.** On diag(3,1) the repaired D₁ has eigenvalues 5 and 1; it is two-dimensional and is not the trivial I-module. The incorrect Check would instead include the additional eigenvalues 6 and 13.

Two findings: one P2 and one P3. All four findings from round 3 are repaired. The author files were not changed. The Lean acceptance test passes, but it does not test the two erroneous README assertions below.

## Verified sound

### Previous findings, checked individually

| Previous finding | Repaired passage | Verification and status |
| --- | --- | --- |
| F01, missing Banach headline | README:1051, “`exists_coind_approximation_of_lattice`: there are a finite `𝒪`-module `M` with its canonical (`ϖ_L`-adic) topology”; Suggested.lean:202 states the theorem. | **Repaired.** Native continuous coinduction suffices for the existential conclusion. The lattice is open and bounded, E complete, the action jointly continuous, the Borel fixed by entry (0,1)=0, and S fixed as ϖΘ. All these binders survive elaboration. The module docstring now lists this theorem as stated. |
| F02, zero-dimensional growth denominator | README:1287, “For `U` uniform of dimension `d = dim U > 0` and `V ≠ 0`”; line 1291 separately treats dimension zero. | **Repaired.** For U={1}, V=k, grade=0, dimension=0, index=1 and invariant dimension=1; the separate clause involves no division. Positive-dimensional examples appear in the computed table below. |
| F03, duplicate generic reciprocity | README:1553, “Here `Γ = GL₂(k_F)`”; line 1565, “This is the instance for `Γ` of Brauer reciprocity”. | **Repaired.** The generic arbitrary-finite-group ownership claim is gone. The retained GL₂ application composes the imported pairing, projective lifts and Hom base change. Scope excludes generic Brauer reciprocity. PR #1775 still owns the generic character identity, and is not introduced as an upward supplier. |
| F04, Vignéras locator | README:979, “Proposition 8, p. 21, and Théorème 6, pp. 19–21”; the reference and sources.toml:254 use the same corrected locator. | **Repaired.** VIGNERAS11 line 723 is Théorème 6 and supplies finite length and finitely presented subquotients. Théorème 7, line 1025, concerns a different invariant-finiteness statement. The source key is unchanged. |

The changed Banach statement, new hypotheses and Checks, dimension-zero clause, GL₂ projective-lift application and corrected source references were reviewed afresh. The rest of the package was searched for the same patterns: absent statable headlines, uncontrolled topology, zero denominators, arbitrary-group reciprocity ownership, and the obsolete Vignéras citation. None recurs. No finding marked not actionable is re-raised.

### Coverage, principles and shape

All four author files and all 60 numbered README targets were read. The previous round's computed adversarial rows were used only for unchanged material with explicit values; the seeded targets and repair passages were checked again. The compact table below records the sampled targets, headlines, changed assertions and both findings, rather than reproducing a ledger of every API bullet.

The ten layers have mathematical titles, Examples and Dependencies. Definitions have API bullets and at least three Checks; the third Check in §3.5 requires R02. Each target has a locator and a Needs line. The layer order is explained by the supplied objects: smooth finiteness precedes ordinary-parts arguments, weight coordinates precede Iwahori and finite-weight modules, these precede the local bound, and lattice construction precedes endomorphisms. It is not a source chapter plan. The main-branch roadmaps read for shape and ownership were ClassFieldTheory, SchemeAndStackFoundations and RepresentationTheory/QuiverRepresentations.

No re-planning of an existing roadmap, good-prime replacement for the all-prime finiteness theory, copied source passages, computational algorithm target, sorry'd data, set_option, nonstandard import, admitted example, or process narrative requiring repair was found. Stronger prime and depth hypotheses in Layers 3–9 belong to those local structural theorems; the declared small-prime Ext contract retains p=2,3. The proposed R01 repair preserves the general coefficient-field statement.

The README's own twelve Lean identifiers resolve to the five definitions and seven theorems in Suggested.lean. Supplier identifiers are attributed to their suppliers. The metadata parses and sources.toml has 18 distinct work keys; all works cited in the references are represented. No manifest entry was changed or added.

### Seeded source verification

Numbers below are the cached texts' line numbers, with the printed/preprint pagination used by the package. No unverified-source flag remained apart from the two explicitly settled unavailable works listed under Not verifiable.

| Sample | Text and locator opened | Hypotheses and conclusion checked |
| --- | --- | --- |
| §0.4 exact sequences and finite index | CDN23 line 459, Proposition 1.2, p. 11; SHOTTON20 lines 134–147, Lemmas 2.6–2.7, pp. 3–4; line 198, Lemma 2.8, p. 5 | Finite type/presentation exact-sequence implications and finite-index comparison have the stated finiteness hypotheses. No assertion that all subobjects of all finitely generated smooth modules are finitely generated is inserted. |
| §0.5 amalgam coherence | CDN23 line 463, Proposition 1.3 and Remark 1.4, p. 11; SHOTTON20 line 423, Proposition 4.2, p. 10, line 449, Proposition 4.3, Corollary 4.4 and Theorem 4.5, p. 11; line 502, Theorem 5.1 and Corollary 5.2, p. 12; SERRE-TREES line 3281, Chapter II, Theorem 3 and Corollary 1, p. 110 | Coherent amalgam, finite-index passage and the even determinant-valuation subgroup of GL₂(F)/ϖ^ℤ agree. The OCR Serre text was readable. The compact groups are not replaced by a noncompact coefficient-completion theorem. |
| §0.6 Hom base change and residue fields | CDN23 lines 500–523, Lemmas 1.6–1.7, p. 12 | Finite generation gives a finite set of coefficient coordinates for equivariant maps; admissibility gives a finite-dimensional endomorphism division algebra of an irreducible, hence a finite field over the finite k. Absolute irreducibility is distinguished from irreducibility. |
| §0.8 obstruction space | HU12 line 1167, Corollary 3.9, p. 19; VIGNERAS11 line 808, Lemma 11, p. 21, and lines 827–836, Propositions 9–10, p. 22 | The two disjoint support cells and their IZ stability hold. The invariant containment is used only for the admissible quotient in Hu's corollary. The package correctly refuses the unrestricted Vignéras assertions. |
| §1.2 filtration | CDN23 lines 717–730, Proposition 1.19 and its general-F observation, p. 17 | Exact compact induction of a composition series of W gives the filtration. Its irreducible factors need not be absolutely irreducible over an arbitrary k. **R01.** |
| §1.5 finite cosocle | CDN23 line 737, Theorem 1.21, p. 17, and the following proof | Finite generation and F=ℚ_p are retained. The finite-cosocle condition is correctly expressed in Lean by a uniform bound on lengths of semisimple quotients. The proof's all-prime Ext prerequisite is a declared supplier gap, not silently imported from the p≥5 theorem. |
| §2.1 ordinary parts | EMERTON1 line 686, Definition 3.1.3, p. 15; lines 753, 762 and 780, Lemma 3.1.7, equation (3.1.8), Definition 3.1.9, pp. 16–17; line 1759, Theorem 4.4.6, p. 36; CDN23 §1.5.2, p. 20 | Locally central-finite vectors in the Hom localisation, transfer Hecke action and opposite-Borel right adjunction agree. The extension to unbounded torsion is distinguished from the already owned bounded ℚ_p category. No modulus or square root of q is inserted. |
| §3.5 finite Diamond modules | BP12 lines 3025–3064, Proposition 13.1 and Corollary 13.2, pp. 75–76; lines 3302–3304, Proposition 14.7, p. 83; lines 3670–3676, §16, p. 92 | The maximal module with the prescribed multiplicity-one socle and its summands is supported. The construction is not a full normaliser diagram. The invariant-character Check fails: **R02**. The proof's unnecessary uniqueness assertion about idempotents is recorded under Source issues. |
| §4.1 GK dimension | BHHMS23 lines 2345–2384, §5.1, equation (36), pp. 46–47; CompletedCohomologyPartII §5.8 | The dual, grade and coefficient dimension shift are correct; zero has dimension −∞. Independence uses the imported finite-index comparison. The growth formula now has d>0 and V≠0, matching its supplier. |
| §5.5 adjoint tensor and projectives | LMS22 lines 318–328, Proposition 3.3, pp. 7–8; LMS22-CORR lines 13–18, item (2), p. 1; BP12 lines 805–811, Lemmas 3.4–3.5, p. 21, and lines 887–898, Lemma 3.8, p. 23; BHHMS23 lines 1262–1284, end of proof 4.1.2, p. 27, and Lemma 6.3.7, p. 63 | The corrected translated modules are used. The 2-deep and 3-deep clauses keep shifts inside the required range and exclude character exceptions. The Cartan multiplicity is 2^f, while the characteristic-zero lift has 2^f distinct constituents. |
| §6.1 rectangular modules | BHHMS23 lines 3037–3085, Proposition 6.2.2, pp. 59–60; HU10 lines 902–910, Lemma 2.13(i), pp. 14–15 | The parity uses the predecessor ε_(i−1), the two sign-dependent bounds agree, and the lower-interval description is correct. Existence is asserted without an unjustified uniqueness of modules. The journal/preprint Hu numbering distinction is recorded. |
| §6.3 induced cosocles and Ext | BHHMS23 lines 3138–3208, Lemmas 6.3.1 and 6.3.3–6.3.5, pp. 61–63 | Negative-root extension preserves the cosocle; positive-root extension is multiplicity-free under the interior bounds. The image of the projective map and the quotient's Ext-vanishing use the specified σ and constituent exclusion. |
| §7.3 connected Diamond invariants | BHHMS23 lines 3668–3710, Definition 6.4.2 and Lemma 6.4.3, pp. 72–73 | Tameness, 6-depth, the actual D₁ character set and the intermediate-character condition are retained. Same-coordinate two-step motion exceeds the signed interval. The proof is not extended to wild nonsplit parameters. |
| §8.2 preimage-lattice exactness | BHHMS23 lines 3922–3927, Lemma 7.1.4, p. 78, preceding §7.2 on p. 79 | The middle quotient is V₁°/p²V°, not V₁°/p²V₁°. The first map is the restricted Bockstein, followed by multiplication by p and reduction to W. The two exact rows have the advertised domains. |
| §9.1 endomorphism ring | BHHMS23 lines 4232–4255, Proposition 7.4.1 and proof, pp. 84–85 | Bounds 2<r_i<p−4, commutativity and dimension 2^f(f+1) agree. The dimension computation supplies surjectivity of reduction; mere generic-fibre commutativity would not suffice. |

### Computed adversarial table

In this table lengths are composition lengths unless a coefficient dimension or rank is specified. A successful example is evidence about a statement, not a replacement for its source or hypotheses. The explicit failures are the findings above.

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| §0.1 smoothness and torsion admissibility; Lean predicates | Trivial k²; ⊕_{n≥0} k with trivial action; j=0 and j=1 in characteristic p | Stabiliser is G in both cases. At j=0 the annihilator is 0, length 0; at j=1 the invariant lengths are 2 and ∞ respectively. | Smoothness does not imply admissibility. The native predicates retain this distinction. |
| §0.2 augmented action | H=1; H=C₂ in characteristic 2; two noncommuting permutations in S₃ | H=1 gives A〈H〉=A; on k[C₂], (s−1)²=0 but s−1≠0; on k[S₃], (12)(23)=(123) whereas (23)(12)=(132). | Level action preserves the group algebra and multiplication order; the general construction is not forced to be commutative. |
| §0.3 finite presentation and GL2ModScalar | Zero module; compact induction of k; scalar ϖ versus diag(ϖ,1) | Zero is presented by W₂=0. Induction has one generating coefficient module and zero relation module. Scalar ϖ has determinant valuation 2, hence becomes 1 in G′; diag(ϖ,1) has valuation 1 and remains nontrivial. | No sorry'd carrier; quotient is the scalar subgroup, not all determinant-valuation translations. |
| §0.4 exact-sequence and finite-index calculus | 0→k→k²→k→0; nonsplit k[C₂] in characteristic 2; restriction C₂→1 | Lengths (1,2,1) in both sequences. The nonsplit middle is a Jordan block with (s−1)²=0 and rank(s−1)=1. Restriction of k[C₂] has coefficient dimension 2=[C₂:1]·1. | Both split and nonsplit extensions satisfy the stated closure; finite-index factor is 2. |
| §0.5 coherence; Lean kernel headline | Identity and zero maps on I(σ); compact group H=1 | Kernel(id)=0 with zero coefficient generators; kernel(0)=I(σ), presented by σ. For H=1 the coefficient kernel of 𝒪→𝒪/ϖ is ϖ𝒪≅𝒪, rank 1. The even determinant subgroup has index 2. | Supports the kernel and finite-index mechanisms without assuming the representations have finite length. |
| §0.6 base change and irreducible endomorphisms | H=1, V=k², W=k; irreducible 𝔽₂[C₃]-module 𝔽₄ | Hom dimensions are 2 before and after scalar extension. End_C₃(𝔽₄)=𝔽₄ has 𝔽₂-dimension 2; over 𝔽₄ the module splits into two distinct characters, each with endomorphism dimension 1. | Irreducible is not synonymous with absolutely irreducible. This is the pattern tested again in R01. |
| §0.6 finite-generation control | V=⊕_{n≥0}k, W=k, k′=k(t) | The functional with values (1,t,t²,…) spans an infinite-dimensional k-subspace of k′. Every element of k′⊗Hom_k(V,k) has values in a finite-dimensional coefficient subspace. | Base-change surjectivity fails without finite generation; hypothesis retained. |
| §0.8 obstruction Δ | Identity presentation of nonzero compact induction; augmentation onto k | Disjoint support cells give Δ=0 for the identity, despite a nonzero I₁-fixed vector. For the trivial quotient both cell images are k, so intersection=k, dimension 1. | Admissibility is essential to the containment assertion; package handles the source error correctly. |
| §1.2 filtration | V=0; I(σ); R01's V=𝔽₂₅ over 𝔽₅ | Required step counts are 0 and 1 in the first two cases. In the third, V has length 1, End dimension 2, but Hom(I(σ),V)=0 for every absolute k-weight. Corrected W=V restricted to K gives a surjection and one step. | **Fails as written; R01.** |
| §1.3 finite type ⇒ finite presentation; Lean headline | Trivial line at p=2 and p=3; I(σ); general-F supersingular negative control | Trivial line: one group-algebra generator, length 1. I(σ): finite coefficient presentation but infinite length. Supersingular for F≠ℚ_p: one generator but not finitely presented by the named supplier. | ℚ_p and finite-field hypotheses are present. No small-prime cutoff was added. |
| §1.5 finite cosocle; Lean bounded-quotient headline | π⊕π for an irreducible π; I(1)/(T−1); bound N=0 | Semisimple example has maximal quotient length 2 and length 2. Exceptional principal series has cosocle length 1 and length 2. A nonzero finitely generated module has a simple quotient of length 1>0, so N=0 forces V=0. | Uniform bound does not assert equality of cosocle length and total length. No vacuous conclusion hypothesis. |
| §1.6 smooth dual; Lean equivalence headline | k; Steinberg; infinite sum of Steinberg copies | For k: length 1 and smooth-dual dimension 1. For Steinberg: length 1 and smooth-dual dimension 0. For the infinite sum: length ∞ and smooth dual 0, but finite generation fails. | Finite generation prevents the false converse. The dual span does not assert that every algebraic functional is smooth. |
| §2.1 ordinary-parts definition and adjunction | Determinant character; induction from lower versus upper Borel | On the character, transfer is qχ(t)=0 in k, so localisation and Ord are 0. Ord(Ind_B̄ U)=U. For U=χ₁⊗χ₂, Ord(Ind_B U)=χ₂⊗χ₁, rather than χ₁⊗χ₂. | Transfer, unnormalised induction and opposite Borel agree with suppliers. |
| §2.2 ramified transfer convention | F=ℚ₅(√5), c=2√5; coefficient functional taking √5 to 1 | q/c=√5/2. The resulting residue coefficient is 1/2=3 in 𝔽₅, whereas replacing c by √5 would give 1. Its relevant iterated transfer is 0 modulo 5; over ℚ_p the corresponding unit transfer is 1. | Unit factors cannot be suppressed; the Hecke nilpotence distinguishes ef≥2 from ef=1. |
| §§2.4–2.5 finite length, subobjects and finite-error counit; two Lean headlines | k² trivial; character; Steinberg; an induced representation | k² has length 2 and subobject lengths 0,1,2. The counit errors (kernel,cokernel) have dimensions (0,1) on a character, (1,0) on Steinberg, and (0,0) on an induced object. | These are finite coefficient errors, not an assertion that the counit is always an isomorphism. Théorème 6 is the correct locator. |
| §2.6 new Banach headline | Θ=0; Θ=𝒪 trivial; lattice induced from a unitary character | Take M=0 in the first two cases: error ranks (0,0), (0,1). For an induced lattice take its inducing rank-one module and identity: error ranks (0,0). | Native signature expresses the actual existential approximation. |
| §2.6 exclusion of ℚ_p and boundedness | ℚ_p; unramified quadratic; ramified quadratic; Θ=L | The predicate hF is false for (e,f)=(1,1), true for (1,2) and (2,1), including p=2,3. For Θ=L, ϖΘ=Θ and residual dimension=0 although Θ is not finite over 𝒪; Θ is unbounded and is excluded. | The parameter condition has the correct scope; reduction alone would not control a non-lattice. |
| §2.6 topology and Borel | M=𝒪; lower unipotent; nested characteristic functions | For f=Σϖⁿ1_{U_n}, at valuation m the difference from f(0) is −ϖ^(m+1)/(1−ϖ), nonzero. The denominator is a unit. Lower unipotents have entry (0,1)=0 and σ=1. | Canonical topology admits continuous non-locally-constant functions. The signature does not substitute discrete smooth induction. |
| §3.3 small primes | GL₂(𝔽₂)=S₃; GL₂(𝔽₃) | At p=2, H¹(S₃,k) has dimension 1, while the large-prime weight-adjacency rule would give 0 for that self-extension. At p=3 the determinant-extension exception has dimension 1. | Explicit exclusions retain these exceptions; no large-prime rule is applied to p=2,3. |
| §3.4 fundamental-character normalisation | F=ℚ₅, niveau two | ω₂ has image order 24; 𝔽₅× has order 4, so cannot contain it. Over 𝔽₂₅, ω₂^(1+5)=ω₁ has order 24/gcd(24,6)=4. | The coefficient extension and Artin norm exponent are essential and present. |
| §3.5 D₀ and D₁ | Empty set; all weights; tame irreducible p=17,r=5 | Empty set gives dimensions (0,0). For all weights, multiplicity one forces a semisimple direct sum. In the irreducible example the four constituent dimensions total 32, their four invariant characters are distinct, but dim D₁=2 with only the two socle characters. | Definition passes; **third Check fails, R02**. |
| §4.1 canonical dimension and repaired growth | Zero; k; locally constant functions on ℤ_p^d; group {1} | Grades are respectively +∞, d, 0; dimensions −∞,0,d. For d>0 invariant dimensions are 1 and p^(rd), matching (p^(rd))^(0/d) and (p^(rd))^(d/d). For {1}: grade 0, dimension 0, index 1 and invariants 1. | All boundary values now agree; no 0/0 in the repaired clause. |
| §§4.5–4.6 crossing algebra and Iwahori criterion | Empty index set; f=1; f=2; regular function representation | Empty crossing ring=k has dimension 0. k[X,Y]/(XY) has dimension 1, with X,Y nonzero but XY=0. For f=2, X₀Y₁ remains nonzero and dimension is 2. For f=1 the first truncation dimensions are 1,3,7; regular functions give Hom dimensions 1 versus 7, failing the criterion, and GK dimension 3>1. | The multiplicity hypothesis excludes the large regular representation. The quotient kills paired products, not all mixed products. |
| §5.1 prime-bound control | f=1,p=5 | α has order 4, so α²=α⁻². At p>5 these two degree-two character labels are distinct. | The stronger p>5 multiplicity hypothesis is retained rather than inferred from p>3. |
| §5.4 repaired GL₂ projective-lift application | Γ=GL₂(𝔽₅), Steinberg; equal-characteristic negative control | dim St=5=the 5-part of 480. (u−1)⁴Y⁴=24X⁴=4X⁴≠0. Rational Steinberg multiplicity and reduction multiplicity are both 1; trivial multiplicities both 0. In equal characteristic the trivial projective has socle and cosocle k, giving multiplicity at least 2 versus [k:k]=1. | Lifts work in either characteristic, but the ordinary-character identity is used only in characteristic zero with splitting. |
| §5.5 adjoint tensor | p=17,f=1,r=5 | dim(sl₂⊗Sym⁵)=3·6=18; shifted dimensions are 4+6+8=18. The three generic projective covers each have dimension 34, so 3·34=34+34+34=102. Cartan diagonal is 2; rational lift has two distinct constituents. | Depth hypotheses separate finite projective multiplicity from rational multiplicity-freeness. |
| §6.1 rectangles | p=17,f=1,ε=−1,B=1,r=5; f=2,ε=(+1,−1),B=(1,2),r=(5,6) | First length=2 and dimension 6+12=18=[K:I]. Second predecessor vector d=(0,1), so required parities are odd/even, satisfied by (1,2). Bounds are 1≤10≤15 and 2≤6≤14. Lower interval at (1,2) has (1+1)(2+1)=6 constituents. | Reversing the cyclic predecessor would fail this parity test. |
| §6.3 induced extensions | p=17,f=1,r=5 | Ind χ has dimension 18 and length 2; Ind E has dimension 36 and length 4. In the negative-root case the simple cosocle remains Sym⁵, dimension 6. The positive-root projective map has Hom dimension 1; the specified σ-free quotient has Ext dimension 0. | Root direction, cosocle and Ext orientation match the cited lemmas. |
| §7.3 connectedness | f=1,p=23,r=8 tame irreducible; two different coordinates | D₁ has characters (8,0),(0,8) modulo 22. Their root-exponent difference is ±8, not ±2, so no same-coordinate two-step pair is required. A double step in one coordinate changes its box label by 4, exceeding width 3; from (−1,−1) to (1,1) the two distinct steps pass through (1,−1). | The actual invariant support, 6-depth and tame box argument are used; R02's four-character substitute is not used. |
| §7.6 local GK headline | Nonzero finite-dimensional representation; f=1,p=23 with 8-deep labels; f=2 crossing support | Finite-dimensional GK dimension is 0≤f. The theorem's f=1 bound is 1 versus ambient K/Z₁ dimension 3. For f=2 the annihilating crossing algebra has dimension 2 versus ambient dimension 6. | Numerical bound is f, not 3f. The statement retains its socle, second-layer multiplicity and D₁-character hypotheses; finite-dimensional examples are not substituted for the headline. |
| §8.1 Bockstein sign | sl₂ basis e,f,h | β(e⊗f)=[e,f]=h; β(f⊗e)=−h; β(h⊗e)=2e. At p>2, h and −h differ. | Determines commutator order; a zero or opposite-sign map fails. |
| §8.2 preimage lattice | V°=𝒪 trivial, W=0 or k; V°=𝒪², W a line | W=0 gives V₁°=p𝒪 and V₁°/p²V° of length 1, not the length 2 of V₁°/p²V₁°. W=k gives lengths 1→2→1. Rank two and a line give middle length 3, not 4; multiplication-by-p kernel is the one-dimensional W. | Correct quotient and restricted Bockstein are essential; package has them. |
| §§8.3,8.6 lattice/projective-truncation headline | p=11,r=3; f=1,p=11,r=5 | The scalar eigenvalues are 5,4,10 modulo 11, all nonzero; boundary r=0 or p−2 makes an eigenvalue zero. Generic Pσ has dimension 22; the first K₁ truncation has dimension (1+3)·22=88, with submodule dimension 66 and quotient dimension 22. | Interior bounds and the finite Γ-cover factor are retained; a rank-four K₁-only substitute would be wrong. |
| §9.1 endomorphism headline | f=1 and f=2 | At f=1, [Tσ:σ]=2+(2+0+0)=4=2¹(1+1); at f=2, dimension=4·3=12. For the preceding 88-dimensional example this is 4, not 88². | Equivariant endomorphisms and reduction-surjectivity count agree. |
| §§9.2–9.3 cyclicity and relative-projectivity headline | Q=0, Q=σ, Q=Tσ; composable endomorphisms | Hom dimensions for the first two are 0 and 1; End(Tσ) has dimension 4 at f=1. Right action satisfies (f·a)·b=f∘a∘b=f·(ab), whereas postcomposition has the other source/target. | Quotient category and precomposition direction are retained. |

### Headline acceptance test and padding

The summary's end theorems were checked against the actual declarations, not merely against the module docstring.

| Headline | Suggested.lean disposition |
| --- | --- |
| Coherence for smooth finite presentation over GL₂(F)/ϖ^ℤ | `isFinitelyPresented_ker`, line 104. |
| Finite type implies finite presentation over ℚ_p | `isFinitelyPresented_of_finite`, line 121. |
| Finite cosocle implies finite length over ℚ_p | `isFiniteLength_of_bounded_semisimple_quotients`, line 133. |
| Smooth-dual finite dimension detects finite length | `isFiniteLength_iff_finite_smoothDualSpan`, line 151. |
| Admissible finite presentation implies finite length | `isFiniteLength_of_admissible_of_finitelyPresented`, line 166. |
| Subobjects remain finitely presented | `isFinitelyPresented_subrepresentation_of_admissible`, line 180. |
| Finite-error induced approximation of a Banach lattice | `exists_coind_approximation_of_lattice`, line 202. |
| Ordinary counit with finite errors and absence of supersingular constituents for F≠ℚ_p | Named as unavailable in the docstring: Ord_B, the principal-series constituent API and supersingularity are absent. The existential Banach theorem no longer uses this reason for omission. |
| Iwahori multiplicity criterion and local GK bound | Named as unavailable: the admissible-representation GK carrier, labelled Serre weights, W(ρ̄), D₁ and pseudocompact projective truncations are missing. |
| Explicit lattice for the first projective truncation, commutative endomorphisms, relative projectivity | Named as unavailable: the pseudocompact K/Z₁ projective covers and gluing lattice are missing. No arbitrary Prop or bare matrix substitute is stated. |

Elaboration was run from the pinned content checkout with `lake env lean` on the package's Suggested.lean: exit 0, exactly seven warnings, all “declaration uses 'sorry'”, at the seven theorem lines above. There are no TauCeti imports needing an object-file build. The sole import is `import Mathlib`.

A scratch copy with `#check @name` for **all twelve declarations** elaborated successfully. The four representation predicates retain their coefficient, group and module parameters; GL2ModScalar retains F and its topology; every theorem retains its local-field, residue-characteristic and finiteness assumptions. The new theorem explicitly retains hF, hϖ, hB, CompleteSpace E, openness, boundedness, joint continuity, hS, admissibility and finite presentation. No lost binder or README/signature mismatch was found.

A second scratch copy replaced each of the **seven** sorry bodies by the one-tactic alternatives `rfl`, `infer_instance`, and `simp` with successful goal closure required. None closed: the first six reported no simplification progress and the Banach existential retained unsolved goals. Candidate exact-library proofs were also inspected: finite length versus Noetherian/Artinian, the semisimple finite-module equivalences and Hopkins–Levitzki require hypotheses absent here or conclude different statements. No theorem is a definition restatement, boundary case, README Check or one-lemma restatement. No padding finding is warranted.

### Pinned library and ownership audit

The following pinned declarations were opened, rather than inferred from names. Paths in this table are relative to their respective library repositories.

| Pinned file and line | What was checked; what it does not supply |
| --- | --- |
| Mathlib/RepresentationTheory/Basic.lean:48, :142, :670; Stabilizer.lean:27 | Representation is a monoid homomorphism to linear endomorphisms; asModule is its group-algebra module; the dual uses inverse action; stabilisers are the equality sets. None imposes smoothness. |
| Mathlib/RepresentationTheory/Induced.lean:59, :77 | Algebraic induction and action convention. The comparison with compact induction for open subgroups is an imported smooth-representation target, not a falsely claimed native topological theorem. |
| Mathlib/RepresentationTheory/Intertwining.lean:36, :138; Subrepresentation.lean:54, :114; Rep/Basic.lean:30 | Intertwining maps, kernels, restricted actions, quotients and bundled coefficient representations support the concrete presentation predicate. |
| Mathlib/RepresentationTheory/Continuous/Basic.lean:55, :81, :541, :558 | ContRepresentation contains continuous linear operators but no group-variable continuity. coindV has f(φ(b)g)=σ(b)f(g), and coind acts by right translation. The new theorem adds joint continuity and fixes the subgroup. |
| Mathlib/NumberTheory/LocalField/Basic.lean:46; Topology/Algebra/Module/ModuleTopology.lean:133 | Local-field valuation/topology compatibility and nontriviality are part of the native class; characteristic zero is separately supplied. IsModuleTopology fixes the canonical module topology, not an arbitrary existential topology. |
| Mathlib/RingTheory/FiniteLength.lean:76, :92; RingTheory/HopkinsLevitzki.lean:105 | Existing Noetherian/Artinian and semisimple criteria are not any of the seven smooth-GL₂ headlines; Hopkins–Levitzki has a semiprimary-ring assumption. |
| Mathlib/RingTheory/KrullDimension/Polynomial.lean:120; RingTheory/Regular/RegularSequence.lean:147 | Polynomial dimension and regular-sequence predicates are imported; the latter includes nontriviality of the final quotient. The crossing-algebra application does not redefine these. |
| TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145, :161, :252 | Completed algebra, level projections and group elements already exist and are imported. |
| TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Module.lean:99, :112, :133, :143, :322 | Level action, its agreement with group action, independence and quotient compatibility; compact-module action requires compactness. An infinite discrete sum is not in that compact module construction, so §0.2's smooth assembly has distinct content. |
| TauCeti/Algebra/Module/ProjectiveCover/Existence.lean:195 | Projective covers over a finite algebra over an Artinian base, including the scalar tower. This is an algebraic module theorem, not a pseudocompact cover theorem. |
| TauCeti/Algebra/Module/Projective/Lift.lean:89; Projective/Reduction.lean:73 | Complete-principal-ideal lifting and uniqueness with Jacobson-radical/coatomic hypotheses. These are cited rather than re-owned in §5.4. |
| TauCeti/RepresentationTheory/Homological/ContCohomology/Coinduced/Acyclic.lean:328 | Positive-degree acyclicity of the coinduced discrete module in the compact-group setting used for N₀. |

Object searches in both pinned libraries and in the main/open roadmap index were performed for smoothness/admissibility, finite presentation and cosocles, compact and continuous induction, augmented Iwasawa actions, ordinary parts, GK dimension, projective covers/lifts, Brauer reciprocity, Diamond modules and Bockstein constructions. The supplied near-match file was treated as search leads only. No native declaration proves a retained headline, and no retained declaration takes another readable roadmap's fully qualified name.

The current board package index was read; its listed sibling packages do not own these objects. The open-roadmap checks used `roadmaps grep` and `roadmaps show`, including the five closest roadmaps in the overlap report. In particular:

- PR #1688, `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:624` onward, owns the general smooth category and induction. This package imports that category and adds the specified unbounded torsion finiteness and GL₂ structure.
- PR #1312, `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:822`, :854 and :905, owns the principal-series classification, its exceptional extensions and the general-F supersingular obstruction. Those are imported, not reconstructed.
- PR #1775, `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/README.md:719`, owns generic Brauer reciprocity. The repaired §5.4 is the GL₂ application of the earlier pairing and pinned lifts; it no longer claims the generic identity or cites this unordered open roadmap as a supplier.
- PR #1745, `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurvesPartII/README.md:12` and :64, consumes the local weights, Diamond modules, GK bound and lattices from this package. Its work is the global multiplicity/cohomology application.
- PR #1757, `TauCetiRoadmap/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md:11` and :93, imports this package's torsion-admissibility and finite-presentation calculus. Its Scholze functor and tower cohomology are distinct objects.

The overlap data has no conflicting head, dropped cited identifier, revision-only identifier or unmapped dropped identifier to repair. The package's former-identifier mapping still resolves the MP references used by these consumers. No reciprocal ownership or supply cycle was found.

### Supplier citations and direction

Every Needs line and supplier contract was read. The following current sections were opened; ranges denote the actual cited groups of targets, not inferred nearby topics.

| Supplier | Resolved sections and evidence |
| --- | --- |
| SmoothRepresentationsOfLocalGroups, PR #1688 | SR.0.1–SR.0.4: README:624, :670, :705, :768, :872, :907, :959, :987, :1008; SR.0d.1 at :1676; SR.2.1 induction, reciprocity, exactness and Mackey at :1919 onward. |
| PadicLocalLanglandsForGL2Qp, PR #1312 | §§0.1 and 0.3 at :206 and :270; §§2.1–2.3 at :649–725; §2.6 at :822, §2.7 at :854, §2.9 at :905; §§5.1 and 5.3 at :1691 and :1752. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory, PR #879 | R07.5.15 at :8196–8240: absolute Serre weights, compact induction and the Hecke operator. Its coefficient convention is precisely why R01 is needed. |
| PotentialAutomorphyInfrastructure, PR #1081 | §3.7 at :1272: transfer and localisation; §3.12 at :1324: derived ordinary comparison. The locally finite Hom construction in the generality claimed here is distinguished from these inputs. |
| CompletedCohomologyAndLocalGlobalCompatibility, PR #1270 | §0.1 at :235–244: the bounded ℚ_p category and opposite-Borel ordinary adjunction. The package explicitly identifies the overlap. |
| NoncommutativeAndEquivariantIwasawa, PR #1307 | §§0.3, 0.5, 0.7–0.8, F.1, 0.10–0.11 and 0.13 at :212, :274, :334, :379, :436, :459, :484 and :571. These supply finite-index freeness, filtrations, grade, Auslander regularity, the zero convention and uniform-group cohomology. |
| CompletedCohomologyPartII, PR #1035 | F.1 at :186–200 for Banach lattices; §5.8 at :1402 for the nonzero module and positive-dimensional uniform growth theorem. |
| DeformationAndDerivedPatchingAlgebra, PR #1034 | §3.4 at :629–639: regular sequences and complete intersections, with the final nonzero quotient and appropriate local hypotheses. |
| GL2AutomorphicRepresentationsAndTransfer | R17.5.11 at :2928–2942: projective-cover pairing and reduction/lattice multiplicities. |
| Main: ClassFieldTheory | Layer 7, README:1204–1238: reciprocity, geometric inversion and norm compatibility. The niveau-two character uses the unramified extension's Artin map. |
| Main: SchemeAndStackFoundations | Layer 6, README:1310–1343: depth and Cohen–Macaulay inputs. |
| Main: RepresentationTheory/QuiverRepresentations | Layer 3, README:507–565: finite-dimensional covers, injectives and decompositions; its named duality input remains imported. |

The mechanical dependency check produced, in full:

```text
depcheck: 237 roadmaps, 2151 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. `roadmaps resolve` found no unresolved cross-roadmap citation or package-owned identifier. Its warning that it did not check external library names was covered by the pinned-file checks above; it was not treated as proof of library existence.

Both declared gaps have identical slugs in design/plan.json and the README contracts, a named earlier supplier, precise hypotheses and a single conclusion:

- `ext1-finite-length-into-compact-induction`: PadicLocalLanglandsForGL2Qp §2.7, finite-dimensional Ext¹ into I(σ) for finite-length G′ representations at **every** prime, including 2 and 3. The p≥5 source does not already meet this contract.
- `barthel-livne-finite-codimension`: FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15, finite codimension of the I₁ invariants of a nonzero subrepresentation of I(σ). The Hecke polynomial/freeness contract does not itself state this missing input.

These are declared supplier contracts, not unowned prerequisites and not findings. No extra gap is required by the repairs proposed here.

## Not verifiable

- **SERRE-LRFG**, Part III, Chapters 14–15: the manifest records this work as uncertified. Its text was not available for direct inspection. The GL₂ application was independently compared with BHHMS23's proof and the resolved projective-pairing supplier; the settled source was not requested again.
- **BARTHEL-LIVNE94**, Proposition 18 and the cited classification locators: the manifest records the work as waived. Direct source verification was not claimed. The finite-codimension prerequisite remains the explicit supplier gap above; the settled work was not requested again.

All fifteen sampled targets had readable primary cached text for the locators reported above. No new missing source, inaccessible open-roadmap head or failed Lean command remained. No claim here treats a sorry elaboration as a proof of the mathematical headlines.

## Source issues

- **Error** in BP12 at Proposition 13.1 proof, printed p. 76 (line 3058): the source says the idempotent selecting an injective envelope is unique; it should be a choice of compatible projections from a direct-sum decomposition; affects the proof.
- **Error** in VIGNERAS11 at Propositions 9–10, printed p. 22 (lines 827–836): the source says the obstruction always contains the generating invariants and is nonzero; it should restrict the containment to an appropriate admissible quotient, since compact induction has zero obstruction; affects a stated result.
- **Error** in LMS22 at Proposition 3.3(2), printed pp. 7–8 (lines 318–328): the source says every translated tensor summand is the indicated projective cover; it should use the translated R-module, identifying the cover only outside the character exception; affects a stated result; corrected in print at LMS22-CORR, item (2), p. 1.
- **Error** in BHHMS23 at Lemma 6.1.1(i), printed p. 56 (lines 2882–2901): the source says noncentral characters in the third truncation have multiplicity at most one for p>3; it should exclude p=5,f=1, where α²=α⁻² contributes twice; affects a stated result.

For the first issue, nonuniqueness has a short algebraic witness. Take two distinct linked simples S,T of Γ=GL₂(𝔽₁₇), for example the pair in a nonsplit summand of BP12 §16 case (iii). There is a nonzero map f:I_T→I_S between their injective envelopes, killing the socle of I_T. On I_S⊕I_T the two matrices e=((1,0),(0,0)) and e_f=((1,f),(0,0)) satisfy e²=e and e_f²=e_f; both have image I_S and agree on the socle, but e≠e_f. Choosing projections suffices for the decomposition argument. The package does not assert their uniqueness, so this source error is not a third package finding.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "541882b06bc805742d99f188fe851946bd90d0b1", "job": "REV-PKG-ModpRepresentationsOfGL2OverLocalFields~4", "model": "gpt-6-astra", "worker": "chris-6"} -->
