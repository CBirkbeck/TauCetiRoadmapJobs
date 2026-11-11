<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13054#issuecomment-6787380112 -->
Review (codex) of 2b005a5

Verdict: needs_changes

1. **F01** (P1) The ramified-unitary Hecke comparison uses the wrong subgroup

   **Location.** packages/ModularityAndLanglandsExtensionsPartII/README.md:1630: “B an Iwahori subgroup”; :1783: “P is the maximal parahoric containing B”. The same B feeds §§4.10–4.12 and §§5.7–5.10.

   **Claim.** The ordinary Iwahori Hecke algebra of ramified U₂ₖ₊₁ is identified with the Iwahori Hecke algebra of Sp₂ₖ, and the named P has index q+1 over B.

   **Witness.** ct17 line 264 through line 274 defines B using upper-triangular O₂ₖ₊₁, and states that its connected Iwahori has index 2. ReductiveGroupsPartII/README.md:154 instead defines parahorics using connected models.

   **Exact repair.** Define I as the preimage of the upper-triangular subgroup of SO₂ₖ₊₁ and B as the full chamber fixer, the preimage in O₂ₖ₊₁. State the comparison for H(U₂ₖ₊₁,B). Define P by the block-upper-triangular reduction with central block of size 3, as in ct17 line 269, a rank-one enlargement/full wall fixer, not a maximal parahoric when k>1. Propagate these definitions to the fixed-vector spaces and global levels. Align the affine-Tits-system supplier contract with this full-fixer algebra, distinguishing it from the connected-Iwahori algebra; retain the general connected-Iwahori theory separately.

   **Repair test.** For odd residue characteristic and odd n, c=−Iₙ reduces to determinant −1. Thus c∈B, c∉I, and B/I=C₂. The character χ(g)=reduction(det g) has dim χᴵ=1 but dim χᴮ=0. Over ℂ the connected-Iwahori algebra has the two central idempotents (1±T_c)/2; the B algebra selects the positive one. At n=1 their dimensions are 2 versus 1, whereas H(Sp₀) has dimension 1. For n=7 the facet defining P has dimension 2 in a rank-3 apartment, so it is not a vertex/maximal parahoric. The corrected definitions give [B:I]=2 and [P:B]=q+1.

2. **F02** (P2) The global packet counts omit two source hypotheses

   **Location.** packages/ModularityAndLanglandsExtensionsPartII/README.md:2108: “all other ramification of the representations below split”; :2116: “for a RACSDC π with π_wᵢ ≅ St_m ⊞ St_3 ⊞ St_1”.

   **Claim.** These hypotheses suffice for the stated exact global counts, including the trivial archimedean component.

   **Witness.** ct17 line 1485 and line 1498 additionally require E/F unramified outside the listed vᵢ. Lines 1491–1493 prescribe the infinity type in the cuspidal case too; the corresponding l=5 conditions occur in Theorem 3.10.

   **Exact repair.** Require E/F unramified at every finite place outside {v₀,…,v_s}, separately from the representation-ramification condition. Add the same infinity type ((l+1)/2,…,(−l−1)/2) to case (2), at every infinite place, and say explicitly that the counted representations have σ∞ trivial. Keep the existing sign condition in case (1). Add negative controls for an extra ramified CM place and an incorrect infinity type.

   **Repair test.** For l=5, n=7, s=0 the prescribed local packet contributes 2 cuspidal choices and 1 endoscopic choice. The trivial U₇ archimedean representation has parameter exponents 3,2,1,0,−1,−2,−3. A proposed π with exponents 4,3,2,0,−2,−3,−4 has zero matches with that trivial archimedean component, not the claimed positive count. The repaired hypothesis excludes it. At an unlisted ramified CM place the source's singleton argument, ct17 line 1502, is unavailable; the added unramifiedness clause excludes exactly that missing case. No global existence of the deliberately mismatched local specifications is being asserted.

3. **F03** (P2) The non-CM holomorphy headline is statable at the pins

   **Location.** packages/ModularityAndLanglandsExtensionsPartII/Suggested.lean:39: “lacks a CM predicate on newforms”; README §14.3 and the summary promise the general non-CM endpoint.

   **Claim.** Absence of a pre-existing CM predicate prevents stating even the explicitly described good-prime Euler-product consequence.

   **Witness.** Mathlib/NumberTheory/DirichletCharacter/Basic.lean:39 provides DirichletCharacter; TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104 provides Newform and its q-expansion. A five-line quadratic-self-twist predicate and the general-level headline elaborated at these pins, with only sorry warning.

   **Exact repair.** Add a simple real-body predicate on the existing newform carrier: a quadratic self-twist exists when some positive modulus M admits χ≠1 with χ²=1 and a_pχ(p)=a_p for every prime coprime to NM. For weight k≥2 its negation is the usual non-CM condition, by the newform/automorphic correspondence and strong multiplicity one; nt21 line 89 explicitly describes non-CM by absence of quadratic self-twists. State the entire good-prime symmetric-power Euler product for arbitrary N, k≥2 and n≥1, and add the corresponding consequence/API/Checks to §14.3. Remove this particular obstruction from the docstring; the automorphic-representation formulation still needs its missing carriers. Do not add an arbitrary Prop field or an axiom asserting the self-twist comparison.

   The independently elaborated predicate was:

       def HasQuadraticSelfTwist {N : ℕ} [NeZero N] {k : ℤ}
           (f : HeckeRing.GL2.Newform N k) : Prop :=
         ∃ M : ℕ, 0 < M ∧ ∃ χ : DirichletCharacter ℂ M,
           χ ≠ 1 ∧ χ ^ 2 = 1 ∧ ∀ p : ℕ, p.Prime → Nat.Coprime p (N * M) →
             (UpperHalfPlane.qExpansion 1 f.toCuspForm).coeff p * χ p =
               (UpperHalfPlane.qExpansion 1 f.toCuspForm).coeff p

   **Repair test.** The theorem with this negated predicate, k≥2, n≥1, the existing Satake-pair hypothesis, and product indexed by {p : Nat.Primes // ¬(p:ℕ)∣N} elaborated successfully. Its conclusion is exactly existence of an entire L with HasProd in Re(s)>n(k−1)/2+1. For χ₋₄ at p=3, a CM coefficient 0 gives 0·(−1)=0; Δ gives 252·(−1)=−252≠252. This rejects that self-twist for Δ, without pretending one test proves absence of all self-twists. Omitting a bad factor multiplies the complete finite L-function by its Euler polynomial, an entire function; n=0 remains excluded.

4. **F04** (P1) The character-family theorem permits the empty cover

   **Location.** packages/ModularityAndLanglandsExtensionsPartII/README.md:914: “a finite étale morphism η : W̃ → W”.

   **Claim.** This conclusion supplies the base change needed to lift eigencurve points in §§2.3–2.4.

   **Witness.** For W=Sp(E), take W̃=∅. The map is finite étale; O(∅) is the zero ring, whose unit group is trivial. Every character identity holds, but the sole base point has zero lifts.

   **Exact repair.** Require η finite étale and surjective. Carry that property into the base-change construction and its API. The character-space restriction used in nt21 line 2561 through line 2577 has nonempty geometric fibres: characters extend across a finite-index abelian inclusion over an algebraic closure of a characteristic-zero coefficient field. Its pullback is surjective; a chosen nonempty connected component still covers connected W. Include a Check rejecting the empty cover.

   **Repair test.** For χ=1, η=id_W has degree 1 and fibre size 1; the empty map has degree 0 and fibre size 0 and is now excluded. For the inclusion dℤ_p⊂ℤ_p, restriction is a power map; after geometric coefficient extension a prescribed nonzero value has roots, so each fibre is nonempty. Surjectivity supplies precisely the point lifts the later targets use. This is a missing conclusion in the roadmap, not a request to weaken the theorem.

5. **F05** (P2) The character-family route omits its actual Chevalley supplier

   **Location.** packages/ModularityAndLanglandsExtensionsPartII/README.md:917: “The proof uses Chevalley's theorem”; :939 lists only ClassFieldTheory Layers 11–12 and PAI Part II Layer 0.

   **Claim.** The named prerequisites supply the congruence subgroup used to extend the family of characters.

   **Witness.** PR #931, TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:698–714 owns Chevalley congruence with avoidance of any finite set. ClassFieldTheory Layers 11–12 supply reciprocity/existence, not this result; nt21 line 2558 uses it explicitly.

   **Exact repair.** Import GL2AutomorphicRepresentationsAndTransfer §R16.1.7 in scope, the supplier contract, §2.2 Needs and Layer 2 dependencies. Use its finite-index consequence with excluded set T equal to the p-adic places; the modulus must be supported away from p, not merely nonzero. Do not re-plan the theorem or create a supplier gap for an existing target.

   **Repair test.** For E=⟨2⟩⊂ℚ× and H=⟨4⟩, modulus 3 gives 2^a≡1 exactly for even a and avoids T={2}. Modulus 1 has kernel all of E and does not lie in H. The cited supplier handles this example and arbitrary finite-index H, with the avoidance that constructs U^p. It is earlier in the supplied merge order.

6. **F06** (P3) Three sampled locators stop before the asserted statement or proof

   **Location.** packages/ModularityAndLanglandsExtensionsPartII/README.md:1480: “Corollary 1.13, p. 16”; :4307: “Theorem 4.1, p. 25”; :4499: “Lemma 5.8 and proof, pp. 42–43”.

   **Claim.** These page ranges contain the complete cited statements/proof.

   **Witness.** nt21 line 755 marks p.17 before Corollary 1.13's hypotheses/conclusion finish. nt26 line 1190 marks p.26 before hypotheses (4)–(9). nt26 line 2035 marks p.44 before the regular-semisimple calculation and conclusion.

   **Exact repair.** Cite nt21 Corollary 1.13, pp.16–17; nt26 Theorem 4.1, pp.25–26; and nt26 Lemma 5.8 and proof, pp.42–44. Preserve the separate proof ranges where already correct. The manifests already identify these versions; no duplicate source key is needed.

   **Repair test.** The corrected ranges contain the order-two character condition and induced subquotient conclusion, all nine tensor-lifting hypotheses including p=2, and the 2r-eigenvalue calculation respectively.

7. **F07** (P3) Two definitions lack the required API lists

   **Location.** packages/ModularityAndLanglandsExtensionsPartII/README.md:4062: “Define π_K …”; :4834: “Define the Euler factor symPowerEulerFactor”.

   **Claim.** These constructions have the complete definition/API/Checks shape required of the package.

   **Witness.** §§12.1 and 14.4 proceed from the definitions/proof sketches directly to Checks. Neither has an API bullet list. Both already have at least three Checks, so no additional Lean API declarations are needed.

   **Exact repair.** Add prose API bullets in §12.1 identifying the base changes, twisted representations, integral models and determinant laws, their domains/codomains, and coefficient/reduction compatibility. Add prose API bullets in §14.4 for the finite product, symmetry under exchanging the Satake pair, and the analytic conclusion. Keep auxiliary properties in the README; do not pad Suggested.lean.

   **Repair test.** At r=1, the §12.1 twist reduces to T=π_K⊗σ_K and determinant degree 2; at r=2 its tensor weights are 0,1,2,3 and determinant degree 4. In §14.4, n=2, α=2, β=3 gives 1−19x+114x²−216x³ in either order. The requested API explicitly records what these Checks exercise.

Seven findings: two P1, three P2, two P3. The authored package files were not changed. The acceptance file elaborates, but that does not establish the mathematical statements. The earlier repairs were checked first; none of the findings below re-raises the settled downstream ownership issue.

## Previous findings: repair-by-repair verification

Locations in this table refer to packages/ModularityAndLanglandsExtensionsPartII/README.md. The F identifiers are those of the preceding review and repair report.

| Earlier finding | Status and repaired passage | Independent verification |
|---|---|---|
| F01, PAI supplier drift | **Repaired.** Lines 241–243: “Two-dimensional potentially Barsotti–Tate representations are potentially diagonalizable” and “§1.4, stated for l > 2”; lines 260–278 identify the renamed generic and finiteness inputs. | Resolved the changed sections at the supplied head. The residue-field result is §9.7, whereas §9.8 is the ordinary tangent result. The parent supplies §§2.1, 2.16 and 4.1. PAI's former §8.17 has an explicit alias to parent §4.2 and remains valid. The two gap needs agree with the plan. |
| F02, residual attachment | **Repaired.** Lines 413–426: “Residual attachment for reduction eigensystems” and “Use the dual attachment when expressing this polynomial at geometric Frobenius”. | AlgebraicModularFormsAndSerreWeights §7.3, README line 1535, supplies the reduction-image statement, fixed-place lattice independence, and transported coefficient place. At 2, Δ modulo 5 has trace 1 and determinant 3. Raw inversion would give trace 2 and determinant 2; dualizing restores 1 and 3. |
| F03, duplicate KL owner | **Not repaired externally; settled as not actionable in this package.** Line 95: “This roadmap owns the Kazhdan–Lusztig classification”. | The repair's reason is correct: deleting the later roadmap's duplicate is outside this worker's files. PR #1815, TauCetiRoadmap/SmoothRepresentationsOfLocalGroupsPartII/README.md:1694 and :1722 still constructs the triples/classification. This earlier package is the correct owner; no upward dependency is appropriate. No new finding or package repair is demanded for that settled issue. |
| F04, finite auxiliary sets | **Repaired.** §6.2 requires finite admissible split places; line 4125 says “Q a finite set of places disjoint from S”. | Empty Q gives diamond order 1; k factors C₂ give order 2^k. Infinitely many proper Iwahori factors have empty interior. The source-specific exclusions and residual/type conditions remain in the datum and its API. |
| F05, torus freeness | **Repaired.** Line 336 requires “compatible free action chunks” detecting stabilizers; §9.6 imports the free action and torsor. | GL2ModularityLifting §§6.1, 6.6, 6.7 and GlobalGaloisDeformations §4.11 supply the free rank-two input. Squaring-action λ = −1 fixes y modulo 4; genuine translation sends 1+x to −1−x. The former is excluded. The simultaneous P/module extension remains a declared gap. |
| F06, temperedness | **Repaired.** Lines 1678–1682 define the commuting factor s₀ and test its compactness. | With q=4 and s=diag(2,1/2), u=1 gives s₀=s, with moduli 2 and 1/2; regular u and standard φ give s₀=1. These distinguish the trivial representation and Steinberg. The unrelated full-stabilizer error is R01 below. |
| F07, Vandermonde | **Repaired.** §1.3 now uses the derivative/falling-factorial matrix and pp. 44–46; line 784 computes the scaled matrix at aτ=1. | nt21 line 2191 through line 2197 uses exponent indices. For indices 0,2 the matrix is [[1,1],[0,2]], determinant 2, also nonzero over ℚ₂. A Vandermonde in the parameter values 1,1 would have determinant 0. |

The repaired patterns were searched outside these locations: PAI numbering and title-only references, the residual attachment convention, finiteness in both auxiliary data, freeness versus square-equivariance, the compactness factor, and filtration determinants. Earlier adversarial rows were used only where they contained actual values; the fifteen seeded targets were read again regardless.

## Verified sound

The review read 109 numbered targets in 15 layers, their API/Check blocks, the supplier contracts, the 88-line Lean file, metadata and all 18 manifest entries. All numbered targets have at least three Checks; the two missing API lists are R07. There are 110 Needs lines, including a route-specific extra line. Main-branch ClassFieldTheory and AdicSpacesPartII were read as shape comparisons.

No route-specific prime restriction was introduced by the preceding repairs: dyadic definite forms, tensor Taylor–Wiles primes and torus actions remain explicit contracts. The odd-seed argument is identified as conditional; the independent totally real induction supplies the all-rank endpoints. The layer order is mathematical: continuation, local types, level raising, seeds, lifting and tensor induction. Dependencies force the source-like sequences within those methods. No layer is named after a source chapter. No computational algorithm, copied source passage, prohibited supplier, sorry-defined data, set_option, admitted example or extra Lean API catalogue was found.

### Source sample

All fifteen seeded targets were checked in the supplied cached versions, including the hypotheses and the surrounding proof where the roadmap uses it. Source quotations have not been copied into this report.

| Target | Text read and locator outcome |
|---|---|
| §2.2 | nt21 line 2535 through line 2578, Lemma 2.34, pp.51–52. Split p-adic places and character identity match. R04 makes the constructed cover's necessary surjectivity explicit; R05 identifies the Chevalley input. |
| §4.4 | nt21 line 731 through line 772, Proposition 1.12 and Corollary 1.13, pp.16–17. Odd residue characteristic, order-six condition, trivial central extension and paired characters match. Corollary page corrected by R06. |
| §4.7 | nt21 line 953 through line 997, Lemma 1.21 and Proposition 1.22, statements p.21, proof pp.21–22. Odd coefficient prime, cross-block separation, full type including monodromy, and reduction-only Frobenius independence for n₁=1 are retained. |
| §4.12 | ct17 line 1100 through line 1123, Theorem 3.3/sign table p.21, with the §3.5 comparison. The corrected m=3 exponent and displayed shuffle identities agree. The full-socle input is explicitly in the tempered-unitary supplier gap. B must be corrected as in R01. |
| §5.6 | ct17 line 1478 through line 1504, Theorem 3.8, pp.28–29; Theorem 3.10, pp.31–32. The numerical formulas match, but the hypotheses do not: R02. |
| §5.10 | ct17 line 1809 through line 1888, Theorem 4.2 and proof, pp.35–37. The sign product −1, a>b=c, ranks a+3b and a+b, and isotropy contradiction match for l=7; the l=5 specialization is retained. R01 affects its level definitions. |
| §6.6 | ct17 line 2105 through line 2166, Lemmas 5.5–5.6, pp.41–43. Reduced/nilradical quotients, distinct characters killed by base change, five generic-prime conditions and n₁≠n₂ with n₁n₂ even are retained. |
| §6.8 | ct17 line 2204 through line 2228, Theorem 5.7, p.44. All eight hypotheses, especially the strict Jordan-block inequality, disjoint residual automorphy seed, primitivity and divisibility exclusions, match. Page 44 is correct. |
| §10.5 | nt21b line 1123 through line 1190, Proposition 3.9, pp.24–25. Weight 2, non-CM, exclusion of 2 and 3 from sc, conductor bound, new q and both transfer directions match. The actual chosen t satisfies the strong numerical bound throughout the route. |
| §10.8 | nt21b line 1234 through line 1277 and Theorem 3.1, p.20, proof pp.26–27. The seed-relative form, auxiliary good-dihedral form, small-prime order, and weight-two reduction agree. The original π/π′ slip is avoided. |
| §11.5 | nt26 line 820 through line 863 and Lemma 3.8, pp.18–20. The common ambient ring, cycle equality, pure special-fibre dimension, reduced fibres and finite restriction match. Equality of arbitrary congruent inertia alone is not asserted. |
| §12.4 | nt26 line 1460 through line 1546, unitary levels and Lemma 4.5/Proposition 4.6, pp.31–33. All ordered diagonal coordinates, the N+c_G level, freeness, augmentation and P_Q action are retained. The corrected cumulative product contains the missing γ-factor. |
| §12.7 | nt26 line 1183 through line 1228, Theorem 4.1, pp.25–26, and its patching interface. All nine hypotheses match, including potential crystallinity at p=2 and strong versus ordinary irreducibility. R06 extends the statement locator. |
| §13.4 | nt26 line 1975 through line 2050, Lemma 5.8 and conclusion of Theorem 5.5, pp.42–44. Inertia acts at the comparison place; the tensor factor stays fixed; the x,y slots and forbidden-value count are correct. R06 extends the proof locator. |
| §14.4 | nt21 line 55 through line 73, Theorem A, p.2, and the named Godement–Jacquet supplier. The finite L-function has the shift n(k−1)/2, and n≥1 excludes ζ. This is a consequence of Theorem A, not a literal separate theorem printed there. |

No additional author-flagged unverified locator was found. The three manifest entries marked uncertified are discussed below and were not requested again. All named reference keys occur once in the manifest; version notes identify the preprint/manuscript pagination used. No source entry was altered.

### Computed adversarial table

These rows record actual algebraic values, dimensions, fibre sizes or hypothesis tests. They test the interfaces and conventions; a finite example is not a proof of automorphy. The table covers the sampled targets, the headline families, all changed patterns and all findings. R labels give the required change.

| Statement | Instances tried | Computed values on the two sides / competing models | Result and change |
|---|---|---|---|
| §§0.1–0.2, components and reduced carriers | Disc node xy=0; square-zero point E[η]/η² | Node has 2 components; origin lies on 2, a nonzero point of either axis on 1. Reduced point has tangent dimension 0; thickening has 1. | Unique-component and reducedness hypotheses cannot be discarded; retained. |
| §§0.3–0.4, polarization and tangent convention | Rank-one infinitesimal character 1+ηψ; full scalar adjoint | Product with conjugate is 1+η(ψ+ψᶜ); polarization requires ψ+ψᶜ=0. Scalar adjoint conjugation eigenvalue is −1, not +1. | Repaired parent Selmer input uses the correct full adjoint. |
| §§1.1–1.4, continuation/non-criticality | n=2; n=3 with ratio −1; aτ=1, indices 0,2 | Sym¹ has dimension 2; Sym² eigencharacters include χ₁²=χ₂² when ratio −1. Derivative determinant 2 versus false parameter-Vandermonde determinant 0. | n-regularity and characteristic zero retained; F07 repaired. |
| §2.2, character family | W=Sp(E), χ=1, identity cover versus empty map | Fibre sizes 1 versus 0; both satisfy the character equation 1=1 as written. | Vacuity found; R04 requires surjectivity. |
| §2.2, congruence input | E=⟨2⟩, H=⟨4⟩, moduli 3 and 1, excluded prime 2 | Mod 3: 2^a=(−1)^a, kernel 2ℤ; mod 1: kernel ℤ. Support of modulus 3 avoids 2. | R05 imports the actual finite-index and avoidance theorem. |
| §§2.1, 2.3–2.4 and §3.8, twins/transport/Theorem D | Δ at 2, k=12; rank n=2 | Newton polygon slopes 3 and 8 sum to 11=k−1. Two twin operations restore the same ordered pair. Sym¹ is the original rank-two representation. | Point lifting uses R04; other convention tests pass. |
| §2.5 / §8.1, bad locus | eigenvalue ratio −1, symmetric degree 2; ratio 2 | Eigenvalues 1,−1,1 have discriminant 0; eigenvalues 1,2,4 have discriminant (1·3·2)²=36. | Repeated roots are detected on fixed-degree characteristic polynomials. |
| §§3.1–3.3, boundary weights | j=1,2,4 at p=2 | 5^j−1=4,24,624; valuations 2,3,4 equal 2+v₂(j). | Native multiplicity lemma and odd-exponent case agree. |
| §3.4, residual attachment | Δ at 2 modulo 5 | X²+24X+2048 reduces to X²−X+3=(X−2)(X−4). Trace/determinant 1,3; inverted eigenvalues give 2,2. | Correct dual adapter restores 1,3; F02 repaired. |
| §§4.1–4.3, base-change conventions | U₁ trivial character; two wrong-sign rank-one summands in rank 2 | U₁ character value at z/zᶜ is 1. Two distinct wrong-sign summands each have multiplicity 1, which is odd. | Singleton base change and even-multiplicity restriction distinguish the cases. |
| §4.4, depth-zero types | q=3,p=7; θ=1 negative control | ord₇(3)=6; q³+1=28; dim τ=3·2=6; dim λ=(3+1)(9−1)=32. θ=1 has order 1, not 7. | Correct type hypotheses; R06 only fixes the corollary page. |
| §4.7, induced Frobenius | n₁=2, Φ=[[0,a],[1,0]]; n₁=1 with inertia ζ_p | det Φ=−a; (−1)³det Φ=a; Φ²=aI, polynomial (X−a)². At rank one, changing lift multiplies by ζ_p, reducing to 1 modulo ϖ. | Sign and reduction-only independence pass. |
| §§4.8,4.10,5.7, B versus I | Ramified odd Uₙ; determinant sign χ; n=1 | [B:I]=2, dim χᴵ=1, dim χᴮ=0; H_I has dimension 2 in rank zero, H_B and H(Sp₀) dimension 1. | False identification: R01. |
| §4.9, KL temperedness | q=4,s=diag(2,1/2), u regular versus u=1 | Regular u: sus⁻¹ has upper entry 4=u⁴ and s₀=1. Trivial u: s₀ has moduli 2,1/2. | Correct iff gives tempered versus non-tempered; F06 repaired. |
| §§4.10–4.12, packet dimensions/signs | n=7 and n=9 | At n=7, Jacquet counts Y−X=7−1=6=2·3 shuffles. At n=9, Y−X+Z=11−1+2=12=2·6 shuffles. | Corrected exponent/sign tables agree; subgroup naming still R01. |
| §5.4, level raising to type | n=3 versus n=5, odd-rank type block | n₁=n−2 is 1 versus 3; total dimensions are 1+2=3 and 3+2=5. | Odd rank and exact type are retained; no substitution of unramified type. |
| §5.5, archimedean character | x=−1 versus x=1 | x/∣x∣=−1,1; principal square root of x/x̄ would be 1 in both cases. | The specified branch detects the quadratic restriction. |
| §5.6, global counts | s=0,1 with l=5 and l=7 | l=5 counts (endoscopic,cuspidal)=(1,2),(2,4); l=7 gives (2,4),(8,16). Wrong infinity type has 0 trivial-archimedean matches. | Formulas pass under full hypotheses; R02. |
| §5.10, pairing contradiction | a=2,b=c=1 at l=7 | Ambient rank a+3b=5; isotropic dimension a+b=3 would require 6≤5. | Correct contradiction from a>b; level definitions require R01. |
| §6.2, finite data | Two q-values 11,31; empty X; infinite proper factors | Finite rank-two index 12·32=384; empty product 1. Infinite product has no contained basic open neighbourhood. | F04 repaired. |
| §6.6, distinct type versus unipotent type | diag(ζ,ζ⁻¹) with ζ≠ζ⁻¹; nontrivial unipotent [[1,1],[0,1]] | Killing the finite-order diagonal character yields I and N=0. Nontrivial unipotent has N of rank 1 and is not killed in characteristic zero. | Distinct-type hypothesis supports the reduced-ring restriction map. |
| §§6.4,6.7–6.8, long block | (n₁,n₂)=(3,4); N block length 5 versus 4 | max=4; 5>4 but 4≯4. At l=5, 5∤3·4·7=84; at l=7, 7∣84. | Strict block length and divisibility exclusions retained. |
| §6.9, p-adic Steinberg lifting | Two size-2 blocks and one size-4 block | Ranks of N are 1+1=2 versus 3; N³=0 for the first and N³≠0 for the second. | A stronger Steinberg conclusion requires the stated genericity/cohomological inputs; declared gap retained. |
| §§7.3–7.6 and §14.1, seed route | Tensor weights in a doubling step; old odd-step polarized block | {0,1}+{0,2}={0,1,2,3}; equal spacings {0,1}+{0,1} repeat 1. Missing quadratic polarization factor takes value −1 rather than 1 on an element outside its kernel. | Conditional odd step is not silently used; independent induction supplies all ranks. |
| §7.7, Clozel–Thorne endpoints | l=5,7 | l+1=6,8; resulting GL ranks l+2=7,9. | Rank/exponent conventions agree. |
| §§8.2–8.3 and §14.2, seed-relative endpoint | Conductor prime sets ∅ and {q}; n=2 | Ramification count 0 and 1; deleting q gives 0. Sym¹ has the same rank and local factor as π. | Induction is seed-relative until Layer 14 discharges it. |
| §§9.2,12.2, symmetric/tensor weight maps | Rank-two weights 0,1, symmetric degree 2; tensor with 0,2 | Symmetric weights 0,1,2 (rank 3); tensor weights 0,1,2,3 (rank 4). | Type intervals and determinant ranks agree. |
| §§9.6,12.6, free torus | λ=−1 over ℤ/4; δ=(1+x)² | Squaring action fixes y; translation changes 1+x by −2−2x≠0. Fibre equation x²+2x=0 has rank 2 over ℤ₂. | Free-chunk hypothesis distinguishes the two actions; F05 repaired. |
| §§9.7–9.8, regularity/lifting | P=E versus E[η]/η²; n=3,p^a=4,8 | Cotangent dimensions 0 versus 1. Bound p^a>max(5,5) fails at 4, holds at 8. | Residue-field theorem and large-image bound have distinct roles, including p=2. |
| §10.5, seasoning | n=3,t=53,q=211 | 8n(n−1)=48<53; 53≡1 mod4; 211+1=4·53>2·53. | Numerical constraints pass; actual global prime choice additionally uses Frobenius conditions. |
| §10.8, relative non-CM endpoint | sc={3}, sc={2,3}; n=1,2 | Removing 3 from first gives ∅; removing 2 from second gives {3}, handled by the preceding case. Sym⁰ rank 1; Sym¹ rank 2. | Small-prime induction order and base cases agree. |
| §11.5, special-fibre comparison | n=4; reduced versus thickened special point | Local dimension 1+4²=17; special dimension 16. k[x]/x and k[x]/x² have the same reduction k, but lengths 1 and 2. | Statement compares reduced fibres, not unreduced rings; purity/cycle premises retained. |
| §§11.6–11.10, generic components and untwisted tensor | r=3; add then remove v₂ Steinberg condition | Residual ranks r+1=4 and r−1=2 sum to 6. Number of Steinberg conditions changes from ∣T∣+1 to ∣T∣. | Two finiteness applications are explicitly requested in the repaired gap. |
| §12.1, constructions/API | r=1,2 | Tensor ranks 2 and 4; Hodge multisets {0,1} and {0,1,2,3}. | Construction statements pass these checks; API list missing, R07. |
| §12.3, tensor diamonds | r=1,p=2,one C₂ factor; Q=∅ | Δ_Q order 2, Δ′_Q order 4; empty datum gives orders 1,1. | Full ordered quotient and finite Q retained; F04 repaired. |
| §12.4, Hecke normalization | r=1,α=2,β=3,γ=5 | η=(10,15), cumulative products 10,150. Correct U² eigenvalue is q⁻¹·150; printed omission gives q⁻¹·30. | Roadmap corrects the source factor. |
| §12.7, tensor theorem | r=2; σ weights 0,2 versus 0,1; p=2 | Correct tensor weights 0,1,2,3; wrong choice 0,1,1,2. A Steinberg p-adic parameter has rank N=1, a potentially crystalline one N=0. | All nine hypotheses retained; dyadic N=1 case excluded. R06 locator only. |
| §13.4, regular eigenvalues | r=4,q=17,x=2,y=3; interchanged slots with orders 7 and 3 | Forbidden set has 8 elements, not 14. Correct tensor eigenvalues are 7,6,10,11,14,12,3,5, all distinct; swapped slots give xy³=xy⁻³=x. | Correct slots and upper bound pass. |
| §13.4, inertia generation | Coefficient field ℚ versus ℚ(√5) | Group orders 1 versus 2; discriminants 1 versus 5; inertia at 5 generates C₂. | Nontrivial everywhere-unramified quotient is excluded by the named discriminant input. |
| §§13.5–13.6, Frobenius tensor witnesses | r=1 and r=2 | φ_p(r̄)⊗Sym⁰r̄ has rank 2; φ_p(r̄)⊗r̄ has rank 4. | Fixed-factor convention and base case agree. |
| §§13.7–13.10, all-rank induction | n=6,p=5; n=10,p=7 | r=n−p=1,3; smaller ranks r,p−r are (1,4),(3,4), all <n. Strict bounds 3<5<6 and 5<7<10 hold. | No n=0 subtraction/division artefact enters the induction; low ranks separately supplied. |
| §§14.3–14.4, native non-CM test | χ₋₄ at 3; coefficient 0 versus 252 | 0·(−1)=0; 252·(−1)=−252≠252. | A simple pinned predicate separates the models; missing headline R03. |
| §14.4, Euler factor | n=0,1,2; α=2,β=3 | Coefficients [1,−1], [1,−5,6], [1,−19,114,−216]; exchanging α,β preserves them. | Definition has a real body and no unconstrained data. R07 adds its prose API. |
| §14.4, total-function boundaries | n=2,α=β=0; j in range(n+1) | All monomials are 0, product 1; every used j satisfies j≤n. At x=0 product 1. | No used natural subtraction underflows; p in Nat.Primes is nonzero. |
| §14.4, analytic headline | Δ,k=12,n=2; n=1; n=0 | Shift 11, convergence threshold 12; n=1 threshold 13/2. n=0 gives ζ with pole at 1. | Correct normalization and necessary n≥1. |
| §14.4, actual Δ factor | a₂=−24,αβ=2048 | α²+αβ+β²=−1472; coefficients 1,1472,−3014656,−8589934592. | README and native product agree. |

### Pins, elaboration and padding

The pins were read from content's lake-manifest.json. The following declarations were opened at those pins, not inferred from current online documentation:

| Pinned file and line | Verified content and limit |
|---|---|
| Mathlib/NumberTheory/Multiplicity.lean:359, :401 | Nat.multiplicity_pow_two_sub_one and the retained padicValNat alias, with x>1, odd x, nonzero even exponent. The alias is deprecated but exists. |
| Mathlib/RingTheory/Polynomial/Resultant/Basic.lean:934 | Polynomial.discr is the signed determinant construction. Constant polynomials have discriminant 1, so a blanket zero-polynomial/repeated-root inference is not used. |
| Mathlib/NumberTheory/Zsqrtd/GaussianInt.lean:50 | GaussianInt is Zsqrtd (−1), with its native ring. |
| Mathlib/NumberTheory/Bertrand.lean:225 | Prime p with n<p≤2n, requiring n≠0. |
| Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:275 | NumberField.abs_discr_gt_two requires degree >1. |
| Mathlib/Topology/Algebra/InfiniteSum/Defs.lean:107 | HasProd is convergence of finite products along its summation filter; it supplies no convergence theorem by itself. |
| Mathlib/Analysis/Calculus/FDeriv/Defs.lean:172 | Differentiable means differentiable at every point; over ℂ it is the required entire-function carrier. |
| Mathlib/Analysis/SpecialFunctions/Pow/Complex.lean:27 | Complex.cpow includes zero-base conventions. The Euler product uses only positive prime bases. |
| Mathlib/NumberTheory/DirichletCharacter/Basic.lean:39 | DirichletCharacter is MulChar on ZMod; sufficient for the real-body predicate in R03. |
| TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:98, :104 | Nonzero cusp eigenform, newspace membership and a₁=1. No arbitrary zero form is admitted. |
| TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean:91, :117, :191 | Monic quadratic roots, existence of an unordered pair, and the degree-one Euler product for Re(s)>(k+1)/2. No theorem for all symmetric powers appears here. |
| TauCeti/NumberTheory/ModularForms/LFunction/Basic.lean:192 | Entire extension of the original positive-weight cusp-form L-series; only the n=1 case of the proposed headline. |
| Mathlib/LinearAlgebra/TensorPower/Symmetric.lean:53 | Quotient symmetric tensor power of a semimodule; neither an automorphic lift nor its L-function. |
| Mathlib/NumberTheory/EulerProduct/Basic.lean:175 | EulerProduct.eulerProduct_hasProd assumes absolute summability of the given multiplicative function. It does not prove continuation. |
| Mathlib/NumberTheory/EulerProduct/DirichletLSeries.lean:91 | Riemann-zeta Euler product for Re(s)>1, which supplies the n=0 negative control, not an entire symmetric-power theorem. |

Object searches covered symmetric powers, newform coefficients/self-twists, Euler products, entire extensions, eigenvarieties and pseudocharacter spaces. The near-match leads were compared to the actual declarations. The general automorphic, eigenvariety and deformation carriers needed for the other headlines are still absent. Absence of a pre-existing CM predicate alone is not an obstruction to a simple definition, as R03 demonstrates.

The required lake env lean elaboration of packages/ModularityAndLanglandsExtensionsPartII/Suggested.lean ran from the pinned content checkout and exited 0. Its only warning was the intentional sorry at line 80. The individual Satake module object already existed. No bare build, update, cache retrieval or pin edit was run.

A scratch copy appended #check @name for both named declarations. The elaborated definition is ℕ→ℂ→ℂ→ℂ→ℂ. The theorem retains f, n, 1≤n, both parameter functions and their primewise Satake-pair equality, and the correct convergence bound. No section binder disappeared. The proved symmetry example was also elaborated.

All admitted theorems means **one** theorem here. Five separate scratch variants tried simp, rfl, infer_instance, exact Newform.LSeries_eulerProduct_hasProd_satakeParameters, and exact CuspForm.hasEntireExtension_qExpansion_coeff. All failed. The two exact candidates have degree-one/form-specific conclusions; neither proves the arbitrary-n assertion. There is no padding finding. The R03 general-level scratch signature separately exited 0 with only its deliberate sorry warning.

The imports use Lean's module/public-import spelling for the single Mathlib root and the one used Tau Ceti Satake module. There are no other imports. Both owned backticked declaration names resolve to the actual Lean definition/theorem; mathematical notation is not treated as an invented Lean declaration.

### Headline inventory

| README headline family | Acceptance-file status |
|---|---|
| Eigenvariety continuation, eigencurve transport and Theorem D (§§1.4,2.4,3.8) | Named in the docstring; missing automorphic/eigenvariety carriers. |
| Level raising to types, the l=5,7 theorem, and the three Steinberg-lifting methods (§§5.4,5.10,6.4,6.7–6.9) | Named; missing unitary automorphic and Galois/type carriers. |
| Residually CM seeds, Theorem E and powers 6,8 (§§7.5–7.7,14.1) | Named; missing automorphy carriers. |
| Theorem B relative to a seed and its unconditional endpoint (§§8.3,14.2) | Named; automorphic formulation not statable. |
| Symmetric-power automorphy lifting (§9.8) | Named; missing deformation/pseudodeformation and automorphy carriers. |
| Non-CM functoriality relative to a seed and endpoint (§§10.8,14.3) | Endpoint named; automorphic formulation unavailable, but its native analytic consequence is statable: R03. |
| Untwisted tensor, fixed-factor tensor lifting, twisted residual witnesses (§§11.10,12.7,13.5–13.6) | Named; missing Galois/automorphic/deformation carriers. |
| SP_n over all totally real fields (§13.10) | Named; missing Hilbert and higher-rank automorphic carriers. |
| Level-one entire symmetric-power Euler product (§14.4) | Stated as symPowerEulerProduct_levelOne_entire; passes elaboration and padding probes. |

### Supplier order, gaps and ownership

The supplied board-package index was read before any absence claim. The roadmap service was used to resolve the README and to search objects across main and the open heads. Its resolver found no missing roadmap identifier or owned Lean name. Its library-name check was unavailable in that service environment, so the pinned files were checked directly as above.

The required dependency command completed successfully:

    depcheck: 236 roadmaps, 2162 edges, 0 problem(s)

There was no UPWARD or CYCLE line. The command's success does not establish that a supplier proves the right theorem; R01 and R05 are semantic interface issues which a name resolver cannot detect.

Resolved contracts include the following current sections. File paths in the last column identify concrete inspected witnesses; line numbers refer to the actual README, excluding the service's extra first-line wrapper.

| Supplier and consumed sections | Resolution evidence |
|---|---|
| ModularityAndLanglandsExtensions §§0.2,1.1,1.7,1.10–1.15,2.1,2.13,2.16,3.12,3.15–3.16,4.1–4.4,4.15,4.22 | Parent statement/ownership boundary read at PR #1180; endpoints stay there and this Part II develops their proof machinery. TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md, Scope and ownership and the named sections. |
| PotentialAutomorphyInfrastructure §2.5 | TauCetiRoadmap/PotentialAutomorphyInfrastructure/README.md:841, auxiliary soluble/cyclic extensions. |
| PotentialAutomorphyInfrastructurePartII Layers 0–5,7–9 | PR #2135; TauCetiRoadmap/PotentialAutomorphyInfrastructurePartII/README.md:618 (§1.4), :1554 (§7.13), :1642 (§7.19), :1777–1910 (§§8.7–8.16), :2045 (§9.7), :2059 (§9.8). Corrected F01 targets and the explicit old-8.17 alias were read. |
| AdicSpacesPartII R1.9; PartIII R2.9; PartV §§1.1,1.4,1.5 | TauCetiRoadmap/AdicSpacesPartII/README.md:10509; TauCetiRoadmap/AdicSpacesPartIII/README.md:7714; TauCetiRoadmap/AdicSpacesPartV/README.md:308, :383, :415. Components include nonemptiness and reduced structure; field extension remains a gap. |
| IntegralHeckeAndGaloisDeterminants §§0.2,0.5,1.1,1.3,1.5 | TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md:703, :985, :1933, :2270, :2606. Determinants/Cayley–Hamilton inputs are imported, not rebuilt. |
| LocalGaloisDeformationRings, framed/determinant inputs and §§2.18,2.24,2.26,2.27,6.10,8.12,8.14 | TauCetiRoadmap/LocalGaloisDeformationRings/README.md:1958, :2072, :2105, :2155, :3083, :3825, :3841. Full types retain N; closures can have boundary points, so their generic-point hypotheses matter. |
| GlobalGaloisDeformations §§4.6,4.11,5.7,8.1,8.3,8.5,8.6 | TauCetiRoadmap/GlobalGaloisDeformations/README.md:829, :996, :1316, :1877, :1963, :2028, :2079. Free action is a premise of the torsor theorem. |
| DeformationAndDerivedPatchingAlgebra §§5.4–5.6,6.1,6.6–6.7,9.2 | TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:1082, :1097, :1125, :1223, :1289, :1302, :1752. Simultaneous additional actions are a gap, not inferred from square-equivariance. |
| GL2ModularityLifting Layers 2,3,6 | PR #1071; TauCetiRoadmap/GL2ModularityLifting/README.md:724, :781, :891, :1577, :1693, :1719. Read free chunks, free limit and determinant torsor. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.40,R07.4.20,R07.5.10–11 | TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:2636, :6371, :7948, :8007. Artinian crystalline quotient extension remains explicit. |
| PadicFamilies §§2.8,2.10,2a.4–5,2a.13–14,5.8; PadicHodgeTheory §§4.4,5.3; PhiGammaModulesAndIwasawaCohomology §7.5 | TauCetiRoadmap/PadicFamilies/README.md:1415, :1597, :1925, :1963, :2810; TauCetiRoadmap/PadicHodgeTheory/README.md:894, :1016; TauCetiRoadmap/PhiGammaModulesAndIwasawaCohomology/README.md:3008. |
| PotentialModularityAndCompatibleSystems §§9.2,10.10; OrdinaryAutomorphicFormsAndModularityLifting §2.11 | PR #1075, TauCetiRoadmap/PotentialModularityAndCompatibleSystems/README.md:1595, :1746; TauCetiRoadmap/OrdinaryAutomorphicFormsAndModularityLifting/README.md:342. Package §11.2 explicitly records its determinant-correcting twist. |
| ArithmeticGaloisRepresentations §§1.8,3.3,3.6,4.4,7.1,7.6,7.8–7.10; ArithmeticGaloisDuality R02.3.5 | TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:1226, :2870, :3022, :3263, :4454, :4861, :5145, :5242, :5337; TauCetiRoadmap/ArithmeticGaloisDuality/README.md:2666. No second exponent-two field construction is introduced. |
| AlgebraicModularFormsAndSerreWeights §7.3; AutomorphicGaloisRepresentations §§1.5,6.2,7.4–7.5; PartII AG2.3,AG2.6 | TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/README.md:1535; TauCetiRoadmap/AutomorphicGaloisRepresentations/README.md:1801, :3066. Residual attachment and coefficient transport were checked as in F02. |
| SerreWeightAndLevelOptimisation §§2.4,3.2,6.9,6.11; ClassicalSerreModularity R27.1; GL2AutomorphicRepresentationsAndTransfer R16.3 | TauCetiRoadmap/SerreWeightAndLevelOptimisation/README.md:388, :631, :1600, :1638; PR #1020 scope and good-dihedral inputs; PR #931 local parameter sections. R16.1.7 is an additional already-owned input which §2.2 must cite. |
| EndoscopicTransferAndUnitaryTraceComparison transfer, base-change and packet sections | TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:863, :918, :948, :1912, :2148, :2587, :2624, :2644, :2678, :4457, :5044, :5087, :5104, :5121. Explicit socle/depth-zero inputs remain the declared gap. |
| SmoothRepresentationsOfLocalGroups SR.1–SR.4; ReductiveGroupsPartII RG2.1.3,RG2.3.3,RG2.4.1–2 | TauCetiRoadmap/ReductiveGroupsPartII/README.md:154, :2080, :4151, :5533, :5711. Connected parahoric convention differs from this package's imported ct17 B: R01. |
| AutomorphicLFunctionsAndLocalFactors AL.2; CompletedCohomologyAndLocalGlobalCompatibility §0.7 | The former's Global Godement–Jacquet target supplies the n≥2 entire standard L-function; TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/README.md:379 supplies completed definite forms, not the additional Drinfeld concentration theorem. |
| Chebotarev Layer 10; ClassFieldTheory Layers 11–14; RepresentationTheory/CharacterTheory Layers 3,9 | TauCetiRoadmap/Chebotarev/README.md:410; main TauCetiRoadmap/ClassFieldTheory/README.md; main TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md:397 and Layer 9. The finite-unitary extension is a gap; Chevalley is R05, not ClassFieldTheory. |

All 13 gap slugs and needs strings agree verbatim between the README contracts and design/plan.json. Every gap names a supplier. The already supplied rank-two free torus action and nonscalar auxiliary comparison are no longer requested again. The remaining named contracts distinguish the missing hypotheses, characteristics or simultaneous constructions. R01 requires clarifying which subgroup's Hecke presentation the quasi-split contract must supply. No missing implementation of an otherwise correctly declared gap is counted as a finding.

The overlap file reports no conflicting head changing this package, no dropped cited identifier and no identifier available only in an unnamed open revision. The closest scopes (#2135, #1180, #1075, #1071 and #1020) were compared by object. Searches also found the existing Chevalley owner (#931) and reconfirmed the settled KL overlap (#1815). No duplicate fully qualified name of either acceptance declaration was found in the inspected roadmaps. No unprovided open-head checkout was independently sought.

## Not verifiable

- kl87, Theorem 7.12 and §8: the manifest marks the source uncertified. Its text was not available for direct certification. The explicit ct17 restatement and elementary compactness counterexample were checked, but they do not certify every clause of KL's theorem.
- bbm82, Théorème 3.1.1: settled uncertified. The named Raynaud supplier and the declared Artinian-quotient extension were checked; the original source was not read.
- kw09, Proposition 9.3 and associated torsor argument: settled uncertified. The current supplier statements and explicit free-action countermodels were checked; the original text was not requested again.
- The declared supplier gaps are mathematical contracts, not implemented results verified by this review. In particular the full socle calculation and strengthened auxiliary finiteness are not claimed proved by the numerical Checks above.

No new missing-reference request was needed.

## Source issues

- **Misprint** in nt21 at Lemma 2.34, pp.51–52: the source says the character family exists after a finite étale morphism; it should be a finite étale surjective morphism, as constructed by extending characters across the finite-index inclusion; affects a stated result.
- **Error** in ct17 at §2.1, pp.6–7: the source says characteristic double-coset generators satisfy roots 1 and −q; it should be roots q and −1 for those generators; affects a stated result.
- **Error** in ct17 at §2.1, p.7: the source says invertible braid generators present this Hecke algebra over ℤ; it should use positive braid generators over ℤ, or invert q for braid-group generators; affects a stated result.
- **Error** in ct17 at Theorem 2.4(2a), p.10: the source says the semisimple parameter s itself is compact for tempered representations; it should test the commuting factor after removing the adapted Jacobson–Morozov q-weight; affects a stated result.
- **Misprint** in ct17 at Theorem 3.3(i), p.21: the source says X has exponent [1,0,1]; it should have [1,0,−1], agreeing with the module computation and endoscopic identity; affects a stated result.
- **Misprint** in ct17 at Lemma 5.6(3), p.42: the source says characteristic-l eigenvalues have no nontrivial integer-linear relation; it should require multiplicative independence in the generic-character condition, since additive l-multiples always vanish; affects a stated result.
- **Misprint** in nt21b at proof of Theorem 3.1, p.27: the source says the original π has the asserted large 3-adic residual image; it should use the newly constructed good-dihedral π′; affects the proof.
- **Misprint** in nt26 at §4, generators of the Taylor–Wiles Hecke maximal ideal, p.32: the source says the i>r generator uses only the final partial γ-product; it should also include the product of all first r γ-values; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "2b005a518761dff1d0e716dd55ddd826e5891f6f", "job": "REV-PKG-ModularityAndLanglandsExtensionsPartII~4", "model": "gpt-6-astra", "worker": "chris-8"} -->
