<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13001#issuecomment-6858734699 -->
Red team round 1 pass a (codex) of 3e807ed

Verdict: needs_changes

1. **F01** (P3) Equal residue characteristic does not force disconnected level torsors

   **Location:** packages/PotentialAutomorphyDworkMotivesPartII/README.md:1056: “For two primes of the same characteristic the monodromy is not the product”. Also qualify the symplectic clause at lines 1041 and 1511.

   **Claim:** Any two coefficient primes of the same characteristic give a proper product image; forgetting symplectic compatibility always disconnects the determinant torsor.

   **Witness:** For N=5, n=2, the two real coefficient primes above 11 give traces 3 and 7. Their projective trace invariants are 9 and 5, so no projective diagonal identifies them. Also Sp₂(F₁₁)=SL₂(F₁₁).

   **Exact repair text:** Replace the line-1056 Check by “Repeating the same coefficient prime and the same representation gives the diagonal image, hence a disconnected product torsor. Distinct primes above the same rational prime require a separate independence argument.” Replace the symplectic clause in the other two Checks by “For symplectic rank n≥4, forgetting pairing preservation while retaining only the determinant produces multiple geometric components; in rank two Sp₂=SL₂ and the determinant condition already preserves the alternating form.”

   **Verification of repair:** Take A=C((X−1)²) and B_t=C(X²−tX+1), t=3,7 over F₁₁. Each pair (B_t⁻¹,A) generates SL₂(F₁₁) by §5.6. A proper subdirect product would identify the PSL₂ quotients by an automorphism. Over the prime field every such automorphism is induced by PGL₂ and preserves tr²/det; 3²=9 and 7²=5 modulo 11 contradict this. Goursat therefore gives the full product, whereas repeating t=3 gives the diagonal of order 1320 rather than 1742400. The revised Check distinguishes both cases.

2. **F02** (P2) Gauss-sum normalization needs a coefficient-ring hypothesis

   **Location:** packages/PotentialAutomorphyDworkMotivesPartII/Suggested.lean:175–177: “g(0) = 1 when ψ is nontrivial.”

   **Claim:** The normalization holds for the arbitrary commutative coefficient ring admitted by the definition.

   **Witness:** Take F=F₂, R=F₂[ε]/(ε²), ψ(1)=1+ε, N=1, and the trivial multiplicative character. Then ψ is nontrivial, but g(0)=−ψ(1)=1+ε≠1.

   **Exact repair text:** Replace the final docstring clause by “When R is a domain and ψ is nontrivial, g(0)=1.” Add to the README §6.2 Checks: “Over R=F₂[ε]/(ε²), the additive character ψ(x)=(1+ε)^x is nontrivial but g(0)=1+ε. The domain hypothesis cannot be dropped from the normalization.” Keep the definition's general signature and the existing theorem's domain hypothesis.

   **Verification of repair:** (1+ε)²=1, so ψ is an additive character. The trivial multiplicative character is zero at 0 and one at 1, leaving exactly the summand above. R is excluded by the revised assertion because ε≠0 and ε²=0. Over the domain C, the nontrivial character of F₂ sends 1 to −1 and gives g(0)=1.

3. **F03** (P1) Classical-group simplicity has an existing owner, and the symplectic input is not imported

   **Location:** packages/PotentialAutomorphyDworkMotivesPartII/README.md:303, 321, 943–945: “§0.9(3) and its symplectic analogue”.

   **Claim:** §0.9 owns unitary perfectness and projective simplicity; §§0.10, 5.6 and 5.10 consume a symplectic analogue without naming its owner. The cited §0.9 only states the linear and unitary cases.

   **Witness:** TauCetiRoadmap/CFSGBasicProperties/README.md:221–272 owns ordinary and graph-twisted fixed-point perfectness and central simplicity; lines 177–187 require the finite-matrix comparison. Type C's comparison is already pinned as TauCeti.TypeCLieIndex.symplecticEquivFixedPoints.

   **Exact repair text:** Add to the supplier contracts: “CFSGBasicProperties F1, T0 and T1–T2 supply the finite-matrix/fixed-point comparisons and perfectness and simplicity of the derived central quotients in types C_m and ²A_(n−1). Apply them to Sp_{2m}(k), except (m,#k)=(1,3), and SU_n(k₂/k), n≥3, for finite fields of odd characteristic. The matrix-form comparison is part of that supplier's contract. This roadmap derives only the normal-subgroup and composition-factor corollaries.” In §0.9 import the unitary result instead of proving its root-group simplicity theory again, and explicitly state the symplectic normal-subgroup/composition-factor corollary. Add these imports to §§0.10, 5.6 and 5.10. Cite pinned symplectic perfectness as well: TauCeti.GLSymplecticFin.commutator_eq_top_of_two_ne_zero in TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/Perfect.lean:234 (m≥2, characteristic not two); use the cited SL₂ result for m=1, #k≥5.

   **Verification of repair:** For Sp₄(F₃), m=2 and 2≠0, so the pinned perfectness theorem applies; its central quotient is the valid type C₂(3) of the supplier. For Sp₂(F₃), the excluded group has order 24 and abelianization C₃, exactly the exceptional case already retained in §5.10. SU₃(F₉) is type ²A₂(3), inside the supplier's validity range. A supplier on main precedes this package, so this repair introduces no upward edge.

4. **F04** (P3) The irreducibility Check does not isolate the missing hypothesis

   **Location:** packages/PotentialAutomorphyDworkMotivesPartII/README.md:224: “the pseudo-reflection hypothesis is needed”.

   **Claim:** Setting h₀=h∞⁻¹ tests omission of the pseudo-reflection assumption in §0.4.

   **Witness:** That substitution also makes the spectra of h∞ and h₀⁻¹ identical. In positive rank it violates the retained disjoint-spectrum assumption, so it cannot test the claimed necessity.

   **Exact repair text:** Replace that Check by “Over Q in rank two, take h∞=diag(4,5), h₀=diag(1/2,1/3), and h₁=diag(1/2,3/5). Then h₀h₁h∞=1 and the spectra {4,5} and {2,3} are disjoint, but h₁−1 has rank two and both coordinate lines are invariant. The rank-one hypothesis cannot be omitted.”

   **Verification of repair:** The diagonal products are (1/2)(1/2)4=1 and (1/3)(3/5)5=1; the displacement entries −1/2 and −2/5 are nonzero. All retained hypotheses now hold, and the conclusion fails.

5. **F05** (P2) The general transvection classification is missing from the acceptance test

   **Location:** packages/PotentialAutomorphyDworkMotivesPartII/README.md:330–342; packages/PotentialAutomorphyDworkMotivesPartII/Suggested.lean:10–48.

   **Claim:** The package owns the general Zalesskii–Serezhkin classification and the rank-two Dickson exception, but Suggested.lean tests only the specially chosen hypergeometric pairs. The general classification is neither stated nor identified as unavailable.

   **Witness:** §0.11 quantifies over arbitrary absolutely irreducible transvection-generated subgroups. Suggested.lean instead requires Qian/self-dual characteristic polynomials. Native Subgroup, GL, Subfield, AlgebraicClosure, Submodule, Matrix.rank and the classical matrix groups already provide the statement's carriers.

   **Exact repair text:** Add a Layer 0 target signature for: “For a finite field K of odd characteristic p and n>2, every absolutely irreducible subgroup G≤GL_n(K) generated by its nonidentity transvections is conjugate to SL_n(k), Sp_n(k) (n even), or SU_n(k/k₀) (k/k₀ quadratic), for a subfield k≤K.” Add the rank-two alternative from §0.11(2), including p=3 and a subgroup isomorphic to SL₂(F₅). Use real definitions of the invariant-subspace condition over AlgebraicClosure K and the subgroup generated by rank-one unipotents, and native matrix subgroups over subfields; do not replace these by free predicates. Name both signatures in the README and the module's headline list. Retain the existing hypergeometric signatures, which test the additional identification of the field and classical type.

   **Verification of repair:** SL₃(F₃) is a general input with no chosen hypergeometric pair and belongs to the SL branch. The 120-element subgroup SL₂(F₅) of SL₂(F₉) is outside every subfield-SL₂ branch (possible orders are 24 and 720), so the rank-two exception must remain. Neither input is expressed by the present five theorem signatures. This is a missing deep theorem, not a request for API lemmas or boundary-case padding.

6. **F06** (P2) The infinity-ordinarity headline drops the available 2-adic case

   **Location:** packages/PotentialAutomorphyDworkMotivesPartII/README.md:1414: “of residue characteristic l ∤ 2N”.

   **Claim:** The infinity theorem is stated only for the integral coefficient primes of O, although the package now constructs rational fibres at every coefficient place and the named comparison supplier covers p=2.

   **Witness:** TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md:964 explicitly includes p=2 for odd N; §2.11 uses that same K,N and the consecutive-weight/maximal-monodromy hypotheses. README §§2.3, 2.5, 4.6, 7.4–7.5 supply these for rational fibres.

   **Exact repair text:** Begin §8.1: “Let λ be any finite place of M (of M⁺ for the self-dual real form), with residue characteristic l∤N, and let F_v/Q_l be finite containing ζ_N. For the rational fibre V^Q_{t,λ}, at every t with v(t)<0, conclusions (1) and (2) hold, including l=2. For λ∤2N this recovers the statement for the rationalization of V_{λ,t}.” Make the same replacement in the subquotient and semisimplification clauses. Add the Check: “For N=5, n=2, F_v=Q₂(ζ₅), t=1/2, the rational real fibre V^Q_{t,λ}(1) has weights {0,1}, and its monodromy logarithm is nonzero with square zero; the comparison and ordinary-flag criterion apply although λ is not a prime of O⁺.”

   **Verification of repair:** v₂(1/2)=−1 and 2∤5. After the Tate twist, the two Hodge grades 1,2 become 0,1. A nonzero ramification multiple of a size-two nilpotent block remains nonzero over Q₂, with square zero. Every input of the cited supplier criterion is present; only the integral-lattice indexing had excluded this instance.

7. **F07** (P2) The local-constancy specialization uses an integral sheaf outside its domain

   **Location:** packages/PotentialAutomorphyDworkMotivesPartII/README.md:1516: “λ | l a place of M” and “W_{t,λ}/l^c”.

   **Claim:** The first statement of §9.5 uses the integral W_λ at every finite coefficient place λ.

   **Witness:** Set N=401, n=3, F=Q(ζ₄₀₁), λ above 2, t=0 and c=1. These meet §9.5's stated assumptions, but §3.6 defines W_λ only for λ∤2N. The rational W^Q_λ cannot supply that quotient.

   **Exact repair text:** In §9.5's first sentence replace “λ | l a place of M” by “λ | l a place of M with λ∤2N, so the integral sheaf W_λ of §3.6 is defined”. Retain the following general finite-lisse-sheaf theorem for every prime ℓ. Add: “At λ above 2 or N, a finite quotient requires a chosen stable integral lattice in W^Q_λ; it is not the canonical W_λ notation used here.”

   **Verification of repair:** The counterexample is excluded from the integral specialization and remains covered by the general finite-sheaf theorem whenever such a lattice has been chosen. Taking W^Q_λ/2W^Q_λ instead would give the zero module, since 2 is invertible in M_λ, and would not recover a rank-three residual representation.

8. **F08** (P1) The Hodge-grade computation assumes an unowned residue theorem

   **Location:** packages/PotentialAutomorphyDworkMotivesPartII/README.md:507: “The Hodge type is read from Griffiths' residue description”.

   **Claim:** The proof of the Fermat Hodge grades consumes the identification of the pole-order and Hodge filtrations on primitive hypersurface cohomology, but its Needs list only imports general Hodge structures, comparisons and étale complete-intersection cohomology.

   **Witness:** DMOS82 line 2177 explicitly invokes Griffiths' theorem before computing the eigenline's Hodge degree. ComplexComparisonPartII §C5.3 supplies Hodge structures and bundles, not the residue/Jacobian-ring computation; EtaleDualityAndPerverseSheaves §4.3 is an étale statement.

   **Exact repair text:** Declare gap:griffiths-residue-hodge-filtration, supplier ComplexComparisonPartII, section C5.3, in both plan.json's gaps list and the README contract: “For a smooth degree-d hypersurface X={F=0} in P^{m+1}_C, m≥1, and 0≤q≤m, Poincaré residue identifies the degree (q+1)d−m−2 piece of C[X₀,…,X_{m+1}]/(∂F/∂X₀,…,∂F/∂X_{m+1}) with gr_F^{m−q} H^m_dR(X)_prim. For a linear automorphism g preserving F, the residue map intertwines pullback with P(X)↦det(g)·P(gX) on the polynomial representatives (the determinant factor comes from the ambient volume form).” Cite DMOS82 Proposition 7.6, proof, pp.47–48, for the invoked residue description; add this prerequisite to §2.1. Reverse the character action as already specified in the roadmap's conventions when extracting its eigenlabels.

   **Verification of repair:** For the Fermat cubic, m=1,d=3, the Jacobian degrees are 0 and 3, both one-dimensional; they give H^{1,0} and H^{0,1}. Inverse pullback exchanges the exponent vectors (1,1,1) and (2,2,2), yielding the roadmap's grades 0 and 1. General purity alone supplies neither this splitting nor its labels. Object searches for Griffiths residues, Jacobian rings and pole-order/Hodge filtration comparisons found no existing general target in the readable main/open roadmaps; the named supplier is earlier in the merge order.

9. **F09** (P2) The global coprimality restriction contradicts the monodromy generality

   **Location:** packages/PotentialAutomorphyDworkMotivesPartII/README.md:44: “gcd(N, n) = 1 whenever the exponent datum is used to pass between the parameter line T₀ and the quotient line T′₀”.

   **Claim:** All passage between the two parameter lines requires coprime N and n.

   **Witness:** The package's own §5.5 Check at README:936 uses N=603,n=3,l=7237, with gcd(N,n)=3, precisely for that passage. Its perfectness argument proves full monodromy despite the common factor.

   **Exact repair text:** Delete the coprimality clause from the global conventions. Add to §5.5: “The passage from T′₀ to T₀ requires no coprimality between N and n: its quotient image is cyclic, and perfectness rules out every nontrivial cyclic quotient. Coprimality conditions imposed when choosing switching data in §9.1 are local to that construction.”

   **Verification of repair:** For N=603,n=3, N>100n+100, and l=7237≡1 modulo 603. The residue field is F₇₂₃₇ and its SL₃ is perfect, although its centre has order gcd(3,7236)=3. A cyclic quotient of a perfect group is trivial, so the two geometric images agree. The displayed instance becomes admissible under the corrected convention, matching both §5.5 and the Lean finite-group signature.

10. **F10** (P2) The Frobenius determinant is identified with its reduction without reducing

   **Location:** packages/PotentialAutomorphyDworkMotivesPartII/README.md:1086: “this is the value of the character det V[λ]”.

   **Claim:** The characteristic-zero Gauss-sum expression for det(Frob_v | V_{λ,0}) is the value of the residual character det V[λ].

   **Witness:** For the self-dual N=5,n=2 datum, q=11 and λ above 3, the displayed formula gives 11³=1331 in the coefficient field. The residual determinant is 2 in characteristic 3, obtained by reduction.

   **Exact repair text:** Replace the final clause by “By §5.9, reducing this unit of O_λ modulo λ gives det V[λ](Frob_v) in k(λ)^×.” Keep the preceding equality in the characteristic-zero coefficient field, and add the N=5,n=2,q=11,λ|3 computation as a Check.

   **Verification of repair:** B={2,3} is an opposite pair, so its Gauss product is q and the displayed determinant is q·q²=q³. Since v∤λ, 1331 is a 3-adic unit; its reduction is 2. The revised sentence specifies both the carrier and the map used in the later residual-root argument.

11. **F11** (P2) Qian's switching route discards residual characteristic two

   **Location:** packages/PotentialAutomorphyDworkMotivesPartII/README.md:1441, §9.1: “Hypotheses: l odd”; inherited by §9.3. The residual sheaves in §2.3 are defined only away from 2N.

   **Claim:** The package develops Qian's switching construction only for odd residual characteristic, while describing it as the general Qian switch.

   **Witness:** QIAN23 line 20 allows any prime; its Dwork setup at lines 442–445 excludes divisors of N, not 2. For l=2,n=3,N=3689, ord_N(2)=120 and 2⁶⁰=1954≠−1 modulo N.

   **Exact repair text:** Add to the owned targets: “For odd N, the asymmetric integral Dwork eigensheaf is also constructed at coefficient places above 2, using the odd-order H₀ projector over the completed cyclotomic integer ring. Develop its characteristic-two residual monodromy and the joint monodromy with an odd auxiliary prime, and the corresponding determinant-preserving torsor. The Qian switch of §9.3 applies to every residual prime l.” Keep the present odd-characteristic classification as that branch of the proof; add a characteristic-two classification/image argument rather than removing its hypothesis without proof. State the resulting finite matrix-group headline against the pinned carriers as well. Extend the rank-two branch through its actual integral alternating realization as well. Add the characteristic-two input to §9.1 and the missing nonstatable geometric headline to the module docstring.

   **Verification of repair:** N=3689=7·17·31 is odd, prime to 2·3 and greater than 400. The three orders of 2 are 3,8,5, hence their least common multiple is 120; its half-power is not −1. Take a trivial rank-three residual representation over F₂ of G_Q(i). The auxiliary-modulus and residual input are legitimate; the present route rejects them solely at “l odd”. At a place above 2, |H₀|=N^(N−2) is a unit, so the asymmetric projector has no factor-2 obstruction. Rational 2-adic members alone do not provide the missing residual torsor. This repair adds the omitted proof branch and does not assert that the current odd-characteristic classification proves it.

## Verified sound

Read all 1702 README lines and all 197 Lean lines: 84 numbered target sections, 10 explicit Lean declarations (five definitions/data declarations and five theorems), and 308 Check bullets. The tables below record 102 sets of computed tests: ten Lean rows, 84 target rows and eight convention/example rows. These are concrete tests, not proofs of the general targets or a claim of 308 independently proved Checks. No definition section was found with fewer than three Checks; the defective negative controls are R01 and R04.

The five retained Lean theorems do not close by the one-tactic probe: each needs the classification/image argument or the zero-shaped Gauss-product argument, beyond the native matrix-group and Gauss-sum laws. There is no padding finding. All ten supplied elaborated signatures were compared with the declaration source: there is no ambient variable block and no lost binder. The Gauss theorem retains `IsDomain R`; R02 is its definition's docstring, not a false theorem signature. No Lean process was run.

The headline audit covers the transvection classification (§0.11), the finite residual images (§§5.1–5.4), the Gauss determinant (§6.2), the Dwork–hypergeometric comparison and monodromy (§3.4, §§4.4–4.6), geometric images and torsors (§§5.5–5.12), the Hecke comparison character (§7.5), the local and compatible-system theorems (§§7.4–7.13, 8.1), and the switches (§§9.3–9.4, 9.10–9.12). R11 records the omitted characteristic-two switching branch. Five headline signatures are present. The unavailable geometric, period and compatible-system carriers are identified in the module docstring; the statable classification omission is R05. Native absolute pro-étale cohomology and topological fibre homology do not by themselves provide the missing relative eigensheaves.

Resolved the contract citations against 27 named roadmap owners, using main for existing roadmaps and the supplied open heads for new roadmaps. In particular, the five unresolved-name leads do resolve: the two VanishingCycles finite/lisse declarations are in EtaleCohomologyFoundations §F.0.2; the finite trace formula is in InverseGaloisAndArithmeticFundamentalGroups §IG.0.T2; the two ZeroShapedDatum names are local data/field names. R03 and R08 concern ownership or missing mathematical supply, not spelling. The five declared gaps have matching slugs and named suppliers in the README and design/plan.json; their present absence from suppliers is not counted as a defect.

Object searches covered main, Completed, board packages and the indexed readable open heads. HypergeometricMotives owns Levelt's theorem; ModularityAndLanglandsExtensions owns the semistable model and ordinary criterion; PotentialModularityAndCompatibleSystems owns the compatible-system operations and specialization interfaces. PotentialAutomorphyInfrastructurePartII imports this package's Dwork geometry and owns the subsequent automorphy arguments. These are distinct ownership boundaries. No second occurrence of a retained fully qualified Lean name was found. The overlap lead identifies the source roadmap pull request, not a second independently changing copy. No settled “not actionable in this package” finding was re-raised.

The package diff has ten changed files, all within its own folder. Suggested.lean uses one `import Mathlib`, its own namespace, `theorem` and genuine definition bodies; no `set_option`, sorry'd data, forbidden evaluation command, free proposition stand-in, or computational algorithm was found. The elementary finite-field calculations in this review are scratch checks, not proposed roadmap algorithms.

The requested dependency check, repeated after resolving the additional open owner, returned exactly:

```text
depcheck: 239 roadmaps, 2170 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The earlier run returned 238 roadmaps and 2161 edges, also with zero problems; the output above records the final resolved snapshot. The target README was not edited.

### Statement and instance audit

This is a record of concrete tests, not a claim that examples prove the general theorems. Section numbers refer to packages/PotentialAutomorphyDworkMotivesPartII/README.md. All 84 numbered targets and all 10 explicit Lean declarations were read. There are no ambient Lean variable/include blocks; all instances below are explicit binders. Supplied elaborated signatures were compared with the source; no elaboration was run in this read-only pass.

### Lean declarations

| Declaration; layer | Variable and instance context retained | Instances and computed values | Result/change |
|---\|---\|---\|---|
| qianIndexSet; 1 | N,n : Nat; no instances | (401,3): {1,2,398}, cardinal 3, sum 401=0 mod 401; (501,4): {1,2,3,495}, cardinal 4, sum 501=0; (0,0): {1,2,3,−6} in Z, cardinal 4 despite n=0 | Definition is total; junk values are excluded by every kept headline using it. |
| selfDualIndexSet; 1 | N,n : Nat; no instances | (7,2): {3,4}, sum 0, negative set equal; (5,4): {1,2,3,4}, every unit stabilizes it; (1,4): {0}, cardinal 1, not 4; n=0: empty set | Valid-domain bounds distinguish the construction; N=n+1 is excluded from the stabilizer theorem. |
| ZeroShapedDatum; 1 | N,n : Nat; a:Fin N→ZMod N; sum, zero-count, nonzero-injectivity fields | N=5,n=2,a=(1,0,0,0,4): sum 5=0, zero-count 3=n+1, distinct nonzero entries; (1,1,2,2,4): sum 10=0 but zero-count 0≠3 and repeated nonzero entries; N=0: zero-count 0≠n+1 | Actual data with laws, no sorry'd data. N=0 has no inhabitants. |
| ZeroShapedDatum.indexSet; 1 | N,n implicit; NeZero N; D | Above N=5 datum: forbidden negatives {0,1,4}, complement {2,3}; N=3,n=0,a=(0,1,2): forbidden all residues, complement empty; N=1,n=0,a=(0): complement empty | No lost binder; result actually tied to D.a. |
| qian_hypergeometric_group_eq_SL; 5 | Finite field k, CharP k l, Fact l.Prime; l≠2; odd N; n>2; N>100n+100; primitive ζ generating k; no l-power equals −1; two invertible matrices with stated charpolys and rank≤1 | N=401,n=3,l=5: ord=25 odd, B sum 401, det h₀=det h∞=1; identity has membership true and det=1; scalar 2I has det=8≠1 in characteristic 5 and is excluded. Rank-zero displacement forces h₀⁻¹=h∞, hence all h₀ eigenvalues 1, contradicting 0∉B. N=603,n=3,l=7237: coprimality 3 does not prevent the signature | Not one-tactic padding. Generality of global README convention needs R09. |
| selfDual_hypergeometric_group_conj_Sp; 5 | Finite fields k,K, Algebra k K; CharP K l, Fact l.Prime; l≠2; odd N; m>1; 2m+1<N; primitive ζ; fieldRange=closure{ζ+ζ⁻¹}; matrices on Fin m⊕Fin m | m=2,N=7: n=4, B={2,3,4,5}, sum 14=0, B=−B; m=1 is explicitly excluded, m=0 excluded; N=5,m=2 fails strict 5<5. With standard J, I J Iᵀ=J; scalar 2I gives 4J≠J in F₅, so excluded | Algebra map is injective; characteristic on k follows, no missing CharP binder. Conjugation direction is existentially equivalent under replacing P by P⁻¹. |
| qian_hypergeometric_group_conj_SU; 5 | Same finite-field and Qian bounds; replaces hminus by σ:k≃+*k and σζ=ζ⁻¹; all matrices/hypotheses explicit | N=401,l=3: ord=400 and 3²⁰⁰≡400=−1; σ²ζ=ζ and generation forces σ²=id; σ≠id since ζ²≠1. I gives σ(I)ᵀI=I,det=1. A scalar aI requires aσ(a)=1 and a^n=1, not just norm one | Not a free predicate; avoids the U/SU error. |
| qian_two_prime_hypergeometric_group; 5 | Two finite fields, two prime/CharP instances; distinct odd l₁,l₂; max>10; same N,n; full hypotheses on both pairs | Equal-field diagonal in SL₃(F₁₃)² surjects but is proper, excluded by l₁≠l₂; identity pair has both determinants 1; a pair with one scalar determinant ≠1 is excluded. For N=401, n=3, choose characteristics 5 and 3209: orders 25 and 1, max 3209>10, no −1 power | Goursat headline, not a single application without the classification and image computations. |
| qianGauss; 6 | Fields F, Finite F; CommRing R only; N any; MulChar and AddChar | F₂→C nontrivial ψ: g(0)=−(−1)=1. Same F₂→F₂[ε]/ε² with ψ(1)=1+ε: g(0)=1+ε≠1. Trivial ψ over F₃→C gives g(0)=−2≠1. Zero ring: both sides 0=1 | Definition sound; docstring R02. |
| zeroShaped_gauss_product; 6 | Fields F, Finite F; CommRing R, IsDomain R; NeZero N; odd N; D; orderOf χ=N; primitive ψ | N=1,n=0: 1=1·q⁰. N=3,n=0,a=(0,1,2): 1=1. N=3,n=2,a=0 and F₄: g(1)g(2)=4, LHS=4³=64, RHS=4²·4=64. N=5,n=2: pair-product q, determinant exponent n(N−n)/2=3, both sides q⁵. N=0 excluded; n>N−1 impossible by card_zero; n(N−n) even since N odd | Nontrivial identity, no division in Lean, hence no denominator junk. Primitive ψ and domain exclude equal-characteristic nontrivial unipotent characters. |

### README targets

| Target | Instances and values on the asserted sides / negative controls | Result/change |
|---\|---\|---|
| 0.1 | diag(1,2): rank(g−1)=1, det=2; I: rank=0; J₃: rank=2; E₁₂(1) over F₃: (g−1)²=0, charpoly=(X−1)²; w(2)w(−1)=diag(2,1/2) | Nonidentity and invertibility restrictions discriminate the objects. |
| 0.2 | p=(X−1)²,q=(X−2)(X−4): C(q)C(p)⁻¹−I=[[7,0],[−4,0]], rank 1; p=q gives zero; C(p)−I≠0 but square zero | Orientation and rank confirmed. |
| 0.3 | n=1, α=2,β=3: h₁=3/2 and product 1; n=0: empty identity, charpoly 1; n=2, I versus J₂: same charpoly but ranks 0 and 1, not conjugate | Coprimality distinguishes the negative example; positive-rank supplier plus trivial n=0 case suffices. |
| 0.4 | Over F₇, C((X−1)²) eigenline is span(6,1); C((X−2)(X−4)) sends (6,1) to (6,5), outside it. Original h₀=h∞⁻¹ Check gives equal spectra. Repair diagonal example: disjoint {4,5},{2,3}, displacement rank 2 | R04. |
| 0.5 | U₁(F₉) order 4 versus SU₁ order 1; SU₂(F₉) order 3(9−1)=24; diag(ζ,1) norm one but determinant ζ≠1; empty matrix gives same equality for multipliers 1,2 | n≥1 required for multiplier uniqueness, correctly stated here. |
| 0.6 | F₉=F₃[i], i²=−1: B(i,1)=i, c(B(1,i))=c(−i)=i; bilinear xy gives i versus −i. Zero form radical=V. η=0 kills any symmetry defect | Linear-first convention, nondegeneracy and nonzero scaling distinguish wrong models. |
| 0.7 | N(i)=1, N(1+i)=2; scaling second coordinate changes diag(1,1) to diag(1,2). Over C/R positive form has no isotropic nonzero vector; diag(1,−1) has (1,1) isotropic | Finite-field norm surjectivity is the essential input. |
| 0.8 | Trivial one-dimensional representation and χ=1: B(x,y)=x c(y), multiplier 1. Rank-one θ: multiplier θc(θ). Trivial rank-two group: diag(1,1),diag(1,2) invariant but not scalar multiples | Absolute irreducibility is not cosmetic. Hilbert-90 rescaling η⁻¹ gives c(η⁻¹)λ=η⁻¹. |
| 0.9 | PSL₃(F₃) order (27−1)(27−3)(27−9)/2=5616; SL₂(F₃) order24, abelianization3; centre SL₃(F₇) order gcd(3,6)=3 | R03 ownership; exception correct. |
| 0.10 | PSL₂(F₁₁) order660; PSL₂(F₉) order360; PSp₂(F₅),PSp₂(F₇) orders60,168; fixed-rank PSp order strictly increases with q | R03 missing symplectic supplier. Distinct-characteristic exception controls retained. |
| 0.11 | SL₂(F₅) in SL₂(F₉): orders120 versus subfield SL₂ orders24,720; upper unitriangular GL₃(F₃) fixes first coordinate line, hence reducible; n=0,1 excluded | R05 missing acceptance headline; classification not replaced by hypergeometric examples. |
| 0.12 | Diagonal H in H² has size \|H\| versus \|H\|²; SL₂(F₁₃) has PSL₂ quotient order1092, whereas SL₂(F₃) has composition-factor orders2,2,2,3 | Nonperfect second factor allowed; common quotient test is discriminating. |
| 1.1 | ord₃₅(3)=12, 3⁶=29≠34; ord₇(2)=3, so even-order condition absent; for prime5 and l=3, order4 and 3²=−1 | Composite modulus is necessary in even-order test. |
| 1.2 | N=3: 3 nodes at t=1; N=5:125 nodes; t=0 smooth Fermat, t^N=1 singular. In char2,N odd, Hessian on sum-zero tangent hyperplane is multiplication by N, invertible | Smoothness requires N invertible; excluded characteristic dividing N gives vanishing derivative. |
| 1.3 | N=3: \|H\|=9, \|H₀\|=3; constant vector character restricts to 1 on H₀; a=(1,0,0) evaluates diagonal ζ as ζ≠1 and fails descent; reversal sends (ζ,ζ⁻¹,1) to (1,ζ⁻¹,ζ) | Quotients, action on t and character descent agree. |
| 1.4 | Qian (401,3): {1,2,398}; (501,4): {1,2,3,495}; self-dual (7,2): {3,4}; nonzero-shaped (1,1,2,2,4) has B={0,2}, sum2; (0,0,0,1,3,5,5) has B={1,3,5}, sum2 | Zero-shaped condition cannot be replaced by rank alone. Total-function junk recorded in Lean table. |
| 1.5 | 2{1,2,398}={2,4,395}; 2{3,4} mod7={6,1}; N=n+1=5 gives B=all nonzero residues and stabilizer size4; N11,L3,d5 overlap0=max(0,−2)+max(0,−3), d1 overlap2 | Both truncations and strict N bound matter. |
| 1.6 | N3,t2: t′=8, fibre {2,2ζ,2ζ²}; t′⁻¹(tX_N)^N=X_N^N; RHS becomes Nt∏X_i. At t0, t′0 is outside target | Exclusion of the Fermat point and coordinate direction are correct. |
| 2.1 | Cubic labels111,222: dimensions1+1=2, grades0,1; label120:0; quintic rank(4⁵−4)/5=204; supersingular cubic over F₂₅: trace−10, #points36, H¹_et with 5-adic coefficients dimension0 instead of2 | Prime invertibility correct; R08 owns missing Hodge-residue prerequisite. |
| 2.2 | Cubic H¹=Z²,H²=Z; quadric H²=Z²; quintic H³/ℓ^a=(Z/ℓ^a)^204; Enriques H² has 2-torsion and is outside complete intersections; dimension0 gives H⁰=Z^d | Universal-coefficient term in next degree is needed and supplied. |
| 2.3 | Hesse H₀ action trivial, ranks2,0,0; N5 full middle rank204 versus rank2 eigenpart; at λ above401, 401^399 invertible in M_λ, not O_λ; coefficient at2 exists rationally, no prime of localized O | No omitted rational coefficient places in this construction. |
| 2.4 | N3 cup pairing values Q_l(−1), weight2=1+1; wrong twist−2 has weight4; χ²≠1 forces self-pairing0 because χ²B=B | Twist 2−N and inverse-character pairing agree. |
| 2.5 | N5,n2: twist1 changes pairing Q_l(−3) to Q_l(−1), weights3→1; idempotent denominator2·125=250 not integral at2; N3,n2 violates 3>3 | Coefficient localization and boundary exclusion discriminate forms. |
| 2.6 | N5,a=(1,0,0,0,4): a+2=(3,2,2,2,1), a+3=(4,3,3,3,2), all nonzero; shifts0,1,4 each have zero entries; exactly2 surviving lines | Splitting agrees with indexSet. |
| 2.7 | Previous data: 2 surviving shifts=rank2; Qian401:3; nonzero-shaped N7 example:3 lines despite grades2,2,3; n=N impossible for length-N nonempty vector with zero distinct values | Rank and regular Hodge type are distinct. |
| 3.1 | n1 trace at F₇,N3,x5: ρ((1−5)²)=ρ(2)=ω; inverse convention gives ω². n2 shift[1] contributes −1 to trace; trivial character at1: j_! stalk0 versus j_* rank1 | Characters must be nontrivial; trace sign and pushout direction pinned. |
| 3.2 | n1 nontrivialρ: determinant the nonconstant rank-one sheaf, outside product-one assumption; n2 (ρ,ρ⁻¹): determinant q, weight2; n3 determinant q³, weight6 | Product-one restriction fixes determinant overclaim. |
| 3.3 | n1 at0: identity block; at1: nontrivial scalar; n2 at0 J₂ gives (J−I)²=0≠J−I; distinct characters at∞ give n distinct eigenvalues | Local unipotent versus semisimple types separated. |
| 3.4 | N5,n2 zero-shaped: both ranks2; vector(1,2,2,0,0): B={1,2}, two infinity blocks of size1 instead of2; map t↦t⁻⁵ excludes t0 | Zero-shaped input and the punctured base are necessary. |
| 3.5 | N5,n2: Ψ weight2, ΨcΨ weight4, ε^(−2) weight4; wrong ε^(−3) weight6; determinant V weight6=2·3 | Corrected N−n−1, not N−n. |
| 3.6 | n3 weights0,1,2 sum3 and determinant ε^(−3); geometric twist acts by1. S₃ two-dimensional irreducible restricts to C₃ as ζ⊕ζ⁻¹: constituent dimensions2→1+1 | Pullback alone does not prove irreducibility; single-block argument supplied. |
| 4.1 | γ₀=p₀,γ₁=p₀⁻¹p₁p₀ gives product p₁p₀p∞=1; rank-one α2,β3 triple gives (1/3)(3/2)2=1 | Noncommutative conjugation is essential. |
| 4.2 | N5,n2 eigenvalues ζ²,ζ³, productζ⁵=1; N401,n3 eigenvaluesζ,ζ²,ζ^398 product1; neither set contains1 | Order and determinant separate unipotent infinity spectrum. |
| 4.3 | N3,t1 has3 nodes; combined transvection displacement rank1, not3; J₂ has det1; N−2 odd gives alternating cup form | Number of nodes is not rank of a character summand's variation. |
| 4.4 | At quotient infinity, unipotent eigenvalue1; on pullback, J₂^N=I+N(J₂−I); in characteristic0 N≠0 | Power preserves eigenvalue and nontrivial block. |
| 4.5 | C((X−1)³) columns e₂,e₃,(1,−3,3); C((X−1)²)=[[0,−1],[1,2]]; triple (B⁻¹,BA⁻¹,A) multiplies to I | Companion orientation and loop order agree. |
| 4.6 | J₃−I has square≠0,cube0; J₂^5−I=5(J₂−I)≠0 over Q but zero mod5; nilpotency index3 versus2 | Characteristic-zero hypothesis protects the power argument. |
| 4.7 | Reduction when l∤N retains primitive order N and disjoint eigenvalues1 versusζ^b; l dividing N can collapse primitive N-th roots to1, destroying coprimality | Residual restriction is structural, not a rational-coefficient restriction. |
| 5.1 | N401,n3,l5: degree25, −1 not in odd cyclic subgroup; dets1; l3 gives degree400 and half-power−1, outside SL branch | Correct distinction between SL and SU. |
| 5.2 | N7,n4: B={2,3,4,5}, inversion stable; trace field generated by ζ+ζ⁻¹; rank2 excluded from this theorem and treated in5.6 | Signature retains m>1, not an illicit rank-two classification. |
| 5.3 | N401,l3: σ=Frob^200, σ²=id; unitary equation σ(g)ᵀg=I plus det1; norm-one diag(ζ,1,1) with ζ≠1 fails determinant | SU rather than U. |
| 5.4 | l1=5,l2=3209: orders25,1 modulo401; max>10; equal-prime diagonal has order\|SL\| instead of\|SL\|² | Unequal primes distinguish product from diagonal. |
| 5.5 | N603,n3,l7237: centre order3 but abelianization1; cyclic deck quotient order divides603 and must1 | R09 global convention wrongly excludes its own example. |
| 5.6 | SL₂(F₅) order120 has20 elements of order3; their products have orders {1,3,4,6,10}, not5. N5,l3 companion image SL₂(F₉) order720. N7,l3 real degree3 versus cyclotomic degree6 | Rank-two exception is successfully eliminated. R03 adds symplectic supply. |
| 5.7 | Linear-first B, conjugate reversal yields −B in odd middle degree; scaling by η with cη=−η changes skew to Hermitian; η0 gives degenerate zero form | Nonzero scaling required; multiplier ε^(1−n). |
| 5.8 | SU₃(F₉) perfect and nonabelian; U₃/SU₃ has order4, so determinant restriction cannot be omitted; cyclic deck quotient of perfect image is1 | Supplier ownership R03. |
| 5.9 | detγ₀=∏ζ^b=ζ^0=1, detγ₁=1, detγ∞=1; nonzero-shaped N5 datum B={0,2} gives detγ₀=ζ²≠1 if hypotheses broadened | Determinant descent uses the chosen zero-shaped families. |
| 5.10 | SL₂(F₁₁)×SL₂(F₁₃) orders1320×2184, no common simple quotient; SL₂(F₃) factors2,2,2,3 versus PSL₂(F₁₃) order1092 | Solvable small factor needs no false simplicity claim; R03 supply. |
| 5.11 | Rank2 alternating isometry condition equals det1; rank4 det1 alone admits diag(2,1,1,1/2) which need not preserve the standard pairing; Hermitian determinant must have the prescribed norm | R01 rank qualification for forgetting pairing. |
| 5.12 | N5,n2,t-traces3,7 overF11: each image1320, tr²/det9 versus5; combined image1320²=1742400. Repeated trace3: diagonal1320 | R01 false universal same-characteristic Check. |
| 6.1 | N3 Fermat eigenline: product of3 Gauss sums divided byq has absolute value q^(3/2−1)=q^1/2, weight1; a zero exponent instead gives missing eigenline0 | Factor q⁻¹, not q or1. |
| 6.2 | N3,n2,F4: LHS64=RHS64; n0:1=1; N5,n2 exponent3: q²·q³=q⁵; after determinant factor q⁻²: q³, matching rank2 weight3 | R02 distinguishes domain from square-zero coefficients; R10 requires reduction of the characteristic-zero determinant. |
| 6.3 | Scaling ψ by u multiplies total Gauss product by χ(u)^(−∑B)=χ(u)^0=1; B={0,2} would give χ(u)^−2 | Zero sum supplies descent; wrong datum fails. |
| 6.4 | n odd: N−n−2 even, exponent n(N−n−2)/2 multiple ofn; n even: q^(n/2)=(√q)^n after adjoining F_l²; n2,N5 exponent1 | Quadratic coefficient enlargement is enough for the parity obstruction. |
| 6.5 | m1: rootχ itself; η1: ψ1 and M=Q; over F₅ with m2, image square1 or4 has preimage±1 or±2; nonsquare2 has no F₅-valued root | Pointwise m-th-power condition and root-of-unity containment are not vacuous. |
| 6.6 | n=l^a m: on F_l^r units, l^a-power is bijective since gcd(l,l^r−1)=1; n3,l3 gives gcd(3,3^r−1)=1 | Remove l-power before root extraction, not demand n divides field-unit order. |
| 6.7 | n3,l′≡2 mod3: gcd(3,l′−1)=1 and cube map bijective; for l′≡1 mod3, kernel has3 elements and root construction is needed | Sufficient congruence distinguished from necessity. |
| 6.8 | Full Fermat cubic Frobenius has polynomial X²−aX+q; symmetry projector isolates two degree-one factors over cyclotomic coefficients; λ=p excluded from étale/crystalline comparison, addressed in7.7 | Twist integrality at the residue prime not inferred from arbitrary character twist. |
| 7.1 | D_dR for rank2 E-representation has rank2 over K⊗E, not a K-scalar action on V; if [K:Q_l]=2 and embeddings split, K⊗E=E×E gives two rank2 labelled factors | Correct scalar carrier; σ inverse conjugates character. |
| 7.2 | N5,a=(1,0,0,0,4),d=1,2,3 gives sums10,10,15 and grades1,1,2; nonzero-shaped N7 shifts1,3,5 give sums21,21,28 and grades2,2,3 | Wrap step changes grade by1−w; zero-shaped condition necessary. |
| 7.3 | N5,n2 range1≤j≤2: two rank-one grades, total2; Qian401,n3 has grades M,M+1,M+2, total3 | Filtration is regular only under zero-shaped hypothesis. |
| 7.4 | Self-dual N5,n2: untwisted weights1,2; Tate twist1 gives0,1. Q_l(1) has jump−1 here, versus supplier HT+1 | Sign conversion is explicit, not a reversed weight convention. |
| 7.5 | N401,n3: weightΨ=397; ΨcΨ weight794=−2(−397); N5,n2: Ψ weight2, slope contribution1 at self-dual labels | Relation has n+1−N exponent, not n−N. |
| 7.6 | n3: twisted weights0,1,2 sum3; detε^−3 has cohomological weight3; wrong twist Ψ gives weights2M,2M+1,2M+2 | Inverse comparison character needed. |
| 7.7 | n3 ordinary slopes0,1,2 sum3; nonordinary1,1,1 still sum3 and nonnegative; negative smallest slope−1 contradicts t_H≥0≤t_N for the lowest-slope subobject | Crystallinity and determinant alone do not imply ordinarity. |
| 7.8 | N5,l11,t0 or t11: same special Fermat fibre, normalized twisted slopes0,1; l≡−1 mod5 instead gives supersingular possibility1/2,1/2 | Splitting congruence matters for Fermat ordinarity. |
| 7.9 | n3: inertia exponents θ_c²,θθ_c,θ²; product(θθ_c)³=ε̄^−3. n2 elliptic: θ,θ^p productε̄^−1. e2 overQ5: ω2 but ε̄4 | Negative exponents and ramification factor checked. |
| 7.10 | v(t)=−d: WD N=d logT; T=J₂,d2 gives N=2E₁₂, N²=0≠N over Q_l; d0 would give0, excluded; coefficient characteristic equals local residue characteristic excluded here | Correct tame specialization scale, subject to declared supplier gap. |
| 7.11 | N401,n3,t0: S={v above401}, includes members λ2 and λ401; degree3 and constant term−q³; J₂ and I have same charpoly(X−1)² but only I semisimple | All coefficient places retained; fibres are semisimplified explicitly. |
| 7.12 | Indecomposable Kummer extension eigenvalues1,p^d: normalized slopes0,1; valuation v(p)=2 gives0,2; groundF_p² point degree2: divide2, not1. Direct sum Q_l⊕Q_l(−2): slopes0,2 | Normalization and indecomposability restrictions discriminate. |
| 7.13 | n3, s_min0 and gaps≤1 imply s₂≤1,s₁≤2; total3 forces(2,1,0). Polygon(3/2,3/2,0) sum3 but gap3/2>1; u(0)=1 ensures nonzero polynomial | Generic open cannot be dropped. |
| 8.1 | φ=diag(p,p²),Ne₂=e₁: Nφ=pφN, t_N=3=t_H for jumps0,3; stable line has0<1, so maximal N alone not ordinary. N5,n2 at2,t1/2: weights0,1 and N²0≠N | R06 missing rational 2-adic generality; nonconsecutive counterexample valid. |
| 9.1 | l=2,n=3,N=3689: order120, half-power1954≠3688; excluded only by oddness (R11). Trivial determinant ratios:χ₁=χ₂=1,L=Q. Q(√2),Q(√3) each disjoint fromQ(√6), compositum contains√6; sequential avoidance fixes this. Cubes onF_l′ units bijective for l′≡2 mod3 | Determinant equation χ^n det r=det V; field tower needs B⊆A. |
| 9.2 | t=1/l has valuation−1 in every embedding; t=l′ has valuation+1; CM extension degree2d gives d complex factors of real Weil restriction; unit1+l has valuation0 | Opens genuinely nonempty and disjoint from prohibited loci. |
| 9.3 | FK=F′, K∩Favoid=Q but F′∩Favoid=F; l=l′ would require v(t)<0 and>0 simultaneously; bound l′>2ln+5 excludes that | Intersections and quantifier order preserve avoidance. |
| 9.4 | One n2 factor has multiplierε̄^−1, weights0,1 and two distinct coefficient primes; empty I gives product SpecK; repeated l_i across different factors gives independent parameter coordinates, not a diagonal cover | Own-parameter-line product is crucial. |
| 9.5 | F=Q(ζ401),λ2,t0,c1: W_λ undefined; quotient W^Q_λ/2=0 since2 invertible. Finite lisse sheaf locally constant torsor has same finite Galois action on a small ball | R07. |
| 9.6 | p3,m1: exponent pair−1,−3, determinantω^−1; m=p+1=4 yields ω₂^4 extending to Q₃ and reducible induction; ordinary case residual triangular | Correct dual sign; printed-source endpoint m=p left uncertified because OCR obscures inequality. |
| 9.7 | Trivial residuals have determinant1 and identify local level fibres; ordinary lifts weights0,…,k−1 total k(k−1)/2; supersingular rank2 connects to weights0,1 model, not trivial weight0⊕0 | Matching weight/component hypotheses consumed from supplier, not derived merely from equal residuals. |
| 9.8 | Induced CM character rankm: sum weights0+…+(m−1)=m(m−1)/2; for m2 determinantε^−1 after sign correction, notε; complex-conjugate infinity-type sums constant | Declared Hecke-character gap is a precise needed input. |
| 9.9 | Normalizer split torus GL₂(F₇):72 versus \|SL₂(F₇)\|336, irreducible does not imply large image; p≡−1 gives order2 modN, r≡1 order1; q split inM implies q≡1 modN | Density-one large-image supplier matches this stronger need. |
| 9.10 | m3 multiplier x↦x^−2 has kernel{±1}; determinant exponent−3 and multiplier together trivial on G_F(ζp), giving SU₃; GU allows additional norm-one determinants | Full arithmetic image is G, not automatically all GU. |
| 9.11 | Rank2 H¹ determinantε^−1, torsionA[r] determinantε; dual seed givesε and the correct modular curve. Over G_F(ζp), GL₂ image reduces toSL₂. Two projective field factors require explicit joint surjection | Rank-two substitution uses genuine elliptic carriers, conditional on the declared modular-curve contract. |
| 9.12 | (n,m)=(2,3):{0,3}+{0,1,2}={0,…,5}, sum15; (3,2):det( Sym²R⊗Raux)=ε^(−12−3)=ε^−15; (1,2):rank2,weights0,1,detε^−1. Alternating⊗skew sign is+ when n even and needs trace-zero rescaling | Rank-two branch and sign correction agree. |

### Conventions and worked examples

| Item | Computed witness | Result |
|---\|---\|---|
| Frobenius/Tate convention | q=7 on Q_l(1):1/7; H¹ determinant7 | Consistent with cohomological weights −1 and {0,1}. |
| Period coefficient convention | K/Q_l quadratic split byE: K⊗E=E×E, two labelled components | No illicit K-module structure on the original representation. |
| Hermitian coordinates | A_ij=B(e_j,e_i), so y†Ax equals B(x,y); replacing A by transpose exchanges the indexing | Agrees with linear-first convention. |
| Noncommutative peripheral loops | For p₀=(12),p₁=(23) in S₃ and p∞=(p₁p₀)⁻¹, γ₀γ₁γ∞=p₁p₀p∞=1 | Cyclic-group checks alone would miss the conjugation. |
| Hesse example | N3: fibre degree3, genus1, two H¹ eigenlines, 3 nodes at1, middle-cohomology rank2 | Consistent with the boundary exclusion for self-dual N>n+1. |
| Qian401 example | ord401(5)=25, ord401(3)=400, 3²⁰⁰=−1; B sum401; weightΨ397; determinant q^594 times a Gauss-product cube | Consistent with SL/SU branches and purity weight399. |
| Self-dual5 example | B={2,3}, twist1, weights1,2→0,1, pairing twist−3→−1 | Consistent with rank-two symplectic monodromy. |
| Layer9 auxiliary-modulus example | 3209−1=8·401; no odd divisor>401; ord401(5)=25 not divisible by2 | Changing N requires choosing l′ again. |

### Source locator and wording audit

The following 31 locator groups were opened in the legal cached texts and compared with the corresponding target statements and prose. A group can contain several numbered results. This is a certified subset of the document's repeated citations; it does not certify the six inaccessible works below. Mathematical notation and standard names are not treated as copied prose.

| Source and locator group | Text witness | Target / result of comparison |
|---\|---\|---|
| QIAN23 Lemma 2.3 | QIAN23 line 336 | §1.1, prescribed orders and exclusion set; composite-modulus condition retained. |
| QIAN23 Lemma 3.1 | QIAN23 line 491 | §1.5, asymmetric stabilizer; n=3,4 endpoints kept. |
| QIAN23 Lemmas 3.3–3.6 and Proposition 3.7 | QIAN23 line 600, line 628, line 669, line 682, line 738 | Layers 4–5, spectra, companion order, residual image and product argument; global coprimality is unnecessary for perfect images, R09. |
| QIAN23 Lemma 3.8, formulas (3.1)–(3.3) | QIAN23 line 764, line 788, line 846, line 897 | §§6.1–6.4, parity and character descent; source's rank-two automorphism step is replaced. R10 separates reduction. |
| QIAN23 Lemmas 3.9–3.10 | QIAN23 line 978, line 980, line 1010 | §§7.2–7.4, Hodge grades and inverse coefficient embedding; wrong root-of-unity denominator corrected. |
| QIAN23 §4, switching construction | QIAN23 line 1043, line 1125, line 1156 | §§9.1–9.3, two root extractions and field intersections; R11 records missing residual characteristic two. |
| QIAN21 Theorem 1.1 | QIAN21 line 52 | §8.1, coefficient-conjugate maximal unipotence; consecutive weights supplied separately. |
| QIAN21 Remark 1.2 | QIAN21 line 57 | §8.1 negative control correctly refutes the source's zero-exponent criterion. |
| QIAN21 Lemma 4.2 | QIAN21 line 919 | §8.1 retains the consecutive-weight hypothesis absent from this lemma. |
| BCGNT25 Lemma 4.2.3 | BCGNT25 line 2030 | §§3.1–3.4, product-one determinant and comparison twist. |
| BCGNT25 Lemma 4.2.4 | BCGNT25 line 2055 | §§3.5, 7.5, weight and Tate exponent corrected. |
| BCGNT25 Proposition 4.2.5 | BCGNT25 line 2074 | §§6.8, 7.7, 7.11, all-place compatible family and crystalline Frobenius; roadmap supplies the residue-prime integrality argument. |
| BCGNT25 Proposition 4.2.6 | BCGNT25 line 2126 | §7.13, generic slope locus and nonvanishing trace polynomial; u(0)=1 and norm expansion checked. |
| BCGNT25 Definitions 4.3.1–4.3.2, Remark 4.3.3, Lemma 4.3.4 | BCGNT25 line 2310, line 2317, line 2321, line 2328 | §§0.5–0.8, U/SU distinction and argument swap corrected; linear-first Hilbert-90 rescaling checked. |
| BCGNT25 Definition 4.4.1, Proposition 4.4.2, Lemma 4.4.4 | BCGNT25 line 2359, line 2388, line 2429 | §§5.11–5.12, 7.9, determinant/pairing compatibility and inverse inertia characters retained. |
| BCGNT25 Proposition 6.2.3 and construction in the proof of Theorem 6.2.4 | BCGNT25 line 3079, line 3293 | §§9.10–9.12, arithmetic image is the actual subgroup G, not full GU with incompatible determinant. |
| BLGHT11 Lemma 4.6 and Corollaries 4.7–4.8 | BLGHT11 line 1182, line 1228 | §§5.2, 5.6, 5.10; rank-two characteristic-three exception is treated separately in the roadmap. |
| BLGHT11 Lemmas 5.1–5.3 | BLGHT11 line 1262, line 1321, line 1348 | §§7.4, 7.8, 7.10; untwisted Steinberg roots need the common Tate factor. |
| KATZ09 Theorem 5.3 and Remark 5.4 | KATZ09 line 470 | §3.4, comparison is over the punctured base and uses the prescribed exponent multiplicities. |
| KATZ09 Lemma 8.8 | KATZ09 line 1234 | H-invariant specialization does not justify arbitrary-character maximal monodromy. |
| DK17 Definition 1.3.2, Theorem 1.3.3 and §5 | DK17 line 204, line 217, line 545 | §7.12, normalized slopes, indecomposability and crystalline companions. |
| BLGGT14 Theorem 3.1.2 and its proof | BLGGT14 line 1852 | §9.4, finite set of even ranks, distinct parameter coordinates and avoidance; geometric part separated from automorphy. |
| BLGGT14 Lemma A.2.4 | BLGGT14 line 4110 | §9.8 and declared Hecke-character gap, constant conjugate-pair infinity-type sum. |
| DMOS82 Propositions 7.4 and 7.6 | DMOS82 line 2115, line 2177 | §2.1, Fermat eigenspaces and Hodge grades; R08 isolates Griffiths' residue input. |
| DMOS82 Proposition 7.10 | DMOS82 line 2310 | §2.1, prime-to-residue-characteristic étale realization, not p-adic étale cohomology in characteristic p. |
| BH89 Proposition 3.3 and Theorem 3.5 | BH89 line 276 | §§0.3–0.4, irreducibility and Levelt normal form; inherited arbitrary-field version is the supplier's target. |
| ACC23 Lemma 7.1.8 | ACC23 line 7895 | §9.9, coefficient field Q_l is essential. Source's assertion (2) needs a small-prime qualification; the package's large primes avoid it. |
| ACC23 Corollary 7.2.4, prime-choice proof | ACC23 line 8245 | §9.9, good ordinary primes and full residual GL₂ image. |
| CEGS §1.4, fundamental characters | CEGS line 215 | §7.9, ramification exponent and geometric reciprocity normalization. |
| ACAMPO24 Definitions 2.1.1–2.1.2 and Proposition 2.5.7 | ACAMPO24 line 299, line 972 | §8.1, exponent vector (1,2,2,0,0) gives two singleton blocks. |
| WATERHOUSE69 Theorem 4.1 | WATERHOUSE69 line 619 | Declared elliptic-curve gap and §9.7; q=p admits trace 0 and trace 1, including p=2,3. |

DICKSON01 §260 was also located at DICKSON01 line 10079 and its projective subgroup list read through line 10132. It includes the icosahedral alternative; OCR obscures several multiplicity formulas, which were not used to certify a claim. BER10 Theorem 3.2.1 was read at BER10 line 628: dual conventions are identifiable, but its endpoint inequality is not certified from this OCR.

Five additional prose comparisons, beyond the target-locator comparisons: §1.1's proof with QIAN23 line 341; §1.5's interval argument with QIAN23 line 493; §0.8's proof with BCGNT25 line 2333; §2.1's residue/comparison proof with DMOS82 line 2177; and the qianGauss docstring with QIAN23 line 782. The roadmap condenses, reformulates and supplements those arguments; no source sentence, translated passage, source table, exercise list or clause-by-clause prose reproduction was identified. No external formalization was identified as the origin of a retained Lean declaration.

For arrangement, QIAN23 has four main sections: introduction, preparatory lemmas, Dwork motives, main proof (QIAN23 lines 15, 202, 441, 1043). The roadmap has ten mathematical layers. QIAN23 §3 is split across Layers 0–8; material from §2 is separated between Layers 1 and 6; Layer 9 includes auxiliary constructions from BCGNT25 and BLGGT14. This is not a one-to-one run of source sections. Needs lines force the family→eigen-cohomology→comparison→monodromy→torsor chain and then determinant/local inputs→switching. The unitary preliminaries precede geometry here, unlike BCGNT25 §§4.1–4.4. No arrangement or reuse finding.

## Not verifiable

- LEWIS82 §4; KM74 Theorem 2; KIS99, local-constancy locator; KATZ90 Chapter 8, including the cited rigidity/determinant results; ARTIN55, classical-group order comparison; ZS76, transvection classification: these six manifest entries are settled uncertified. Their texts were not requested again. Their precise source hypotheses and wording remain uncertified, even where the mathematics has independent checks or named suppliers.
- BER10 Theorem 3.2.1: the cached OCR does not reliably distinguish the endpoint inequality. No extension to the endpoint m=p is asserted in this report. DICKSON01 §260's OCR permits recognition of the subgroup alternatives, but not certification of every printed count.
- Published-version numbering asserted alongside arXiv numbering was not independently checked against paywalled published versions. The source checks above use the cached versions identified by sources.toml.
- The supplied elaborated signatures were inspected; a new `#check` run was not performed because this pass explicitly forbids Lean builds. No claim is made that the proposed repairs have elaborated.

Source independence: 36 passages compared with 13 sources, no unforced prose copying found; largest share QIAN23, 54 of 185 source-locator citation blocks before the References section; contents compared with QIAN23: independent. Repeated source mentions with a locator are counted as citation blocks, not as distinct numbered theorems. The six uncertified works remain outside this wording certification.

## Source issues

- **Misprint** in QIAN23 at the paragraph preceding Lemma 3.9, arXiv v1 p.19 (QIAN23 line 978): the source says the chosen embedding sends ζ_N to the exponential with denominator n; it should be denominator N; affects the proof.
- **Gap** in QIAN23 at Lemma 3.8, formula (3.3), arXiv v1 p.18 (QIAN23 line 897): the source says choose a local automorphism inverting ζ_N while fixing ζ_p; it should be replaced by g(b)g(−b)=q, since that automorphism need not exist; affects the proof.
- **Error** in QIAN23 at §4, arXiv v1 p.22 (QIAN23 line 1128): the source says n divides the residue-field unit-group order when n=l^a m; it should be m divides that order, removing the l-power by its bijective power map; affects the proof.
- **Misprint** in QIAN23 at §4, arXiv v1 p.22 (QIAN23 line 1132): the source says the symmetric power of elliptic H¹ has positive cyclotomic determinant exponent; it should be exponent −n(n−1)/2 for the stated cohomological representation; affects the proof.
- **Error** in QIAN21 at Remark 1.2, p.2 (QIAN21 line 57): the source says one zero exponent guarantees a single unipotent block; it should be a hypothesis controlling all exponent multiplicities; (1,2,2,0,0) at N=5 has two blocks; affects a stated result.
- **Error** in QIAN21 at Lemma 4.2, p.20 (QIAN21 line 919): the source says maximal nilpotent monodromy forces ordinarity; it should be supplemented by consecutive labelled Hodge–Tate weights; jumps 0,3 with Frobenius slopes 1,2 refute it; affects a stated result.
- **Misprint** in BCGNT25 at Lemma 4.2.4, arXiv v3 pp.41–42 (BCGNT25 line 2058): the source says the comparison character's norm exponent is N−n and the V-duality twist is 1−N; it should be N−n−1 and 2−N respectively; affects a stated result.
- **Gap** in BCGNT25 at Proposition 4.2.5(1), proof, arXiv v3 p.42 (BCGNT25 line 2095): the source says the untwisted cohomology's integral Frobenius polynomial implies integrality after twisting; it should be supplemented at the residue prime by crystalline slope nonnegativity; affects the proof.
- **Misprint** in BCGNT25 at Proposition 4.2.6, last norm expansion, arXiv v3 p.45 (BCGNT25 line 2275): the source says the final base-q digit is indexed d; it should be indexed d−1, matching the summation tuple and the next sentence; affects the proof.
- **Error** in BCGNT25 at Definition 4.3.1, arXiv v3 p.45 (BCGNT25 line 2312): the source says SU is the multiplier kernel in GU; it should be U for that kernel, with SU its determinant-one subgroup; affects a stated result.
- **Misprint** in BCGNT25 at Remark 4.3.3, arXiv v3 p.45 (BCGNT25 line 2322): the source says the scaled form equals minus its conjugate on the same ordered arguments; it should be minus the conjugate after exchanging the arguments; affects a stated result.
- **Gap** in BCGNT25 at Definition 4.4.1 and Proposition 4.4.2, arXiv v3 pp.46–47 (BCGNT25 line 2363): the source says arbitrary determinant identifications and pairings yield a geometrically irreducible level scheme; it should be required that each determinant identification respect the induced determinant pairing, ensuring nonempty isometry fibres; affects a stated result.
- **Error** in BCGNT25 at Lemma 4.4.4, arXiv v3 p.48 (BCGNT25 line 2436): the source says the cohomological residual characters have positive fundamental-character exponents in its geometric Artin convention; it should be the inverse characters, whose product is the stated inverse cyclotomic determinant; affects a stated result.
- **Misprint** in BCGNT25 at Lemma 4.4.4, proof, arXiv v3 p.48 (BCGNT25 line 2442): the source says the Dwork eigenspace is in degree N−1; it should be degree N−2, the hypersurface's middle degree; affects the proof.
- **Error** in BCGNT25 at Proposition 6.2.3(13), arXiv v3 p.62 (BCGNT25 line 3079): the source says the auxiliary image is full GU_m with the prescribed multiplier and cyclotomic determinant; it should be the actual arithmetic image constrained by both characters; affects a stated result.
- **Gap** in BLGHT11 at Lemma 4.6, proof, p.32 (BLGHT11 line 1197): the source says the transvection classification leaves only SL, Sp and SU over subfields in every rank; it should be supplemented in rank two, characteristic three, by the SL₂(F₅) exception and its exclusion here; affects the proof.
- **Error** in BLGHT11 at Lemma 5.1(2), pp.34–35 (BLGHT11 line 1269): the source says untwisted Frobenius roots start at ±1 and have ratio the base-place residue cardinality; it should be ±Q^((N−1−n)/2),…,±Q^((N+n−3)/2), with Q the residue cardinality of F; affects a stated result.
- **Misprint** in ACAMPO24 at Definition 2.1.2, arXiv v1 p.8 (ACAMPO24 line 310): the source says the complement listing starts with s₁; it should be s₀, giving d−n entries as in the preceding exponent vector; affects a stated result.
- **Error** in ACC23 at Lemma 7.1.8(2), p.1092 (ACC23 line 7903): the source says full residual SL₂ image excludes every unramified-at-l quotient, including l=2; it should be restricted at least to l≥5; y²+y=x³−x has mod-2 S₃ image and quadratic quotient Q(√37), unramified at 2; affects a stated result.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "3e807ed2cf5e92a862e1e0f414027cedc7e557ba", "job": "RT-PotentialAutomorphyDworkMotivesPartII~1a", "model": "gpt-6-astra", "worker": "chris-30"} -->
