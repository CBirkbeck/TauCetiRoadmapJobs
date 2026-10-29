<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1623#issuecomment-6484472174 -->
Red team round 2 pass a (codex) of 4f98d3f

Verdict: needs_changes

1. **F01** (P1) The transported BR convention admits a singular localisation parameter

   **Location:** packages/SpringerResolutionAndCharacteristicCycles/README.md:484, 486, 504: “at every nilpotent p-character χ and integral weight λ with ⟨λ+ρ,α∨⟩∉pZ”.

   **Claim:** This condition makes the stated derived-global-sections/localisation functors inverse at the actual character parameter of D̃.

   **Witness:** BR12 lines 1114–1127 use the same line character but the opposite ρ. For SL₂, p=3, λ=ρ, the README pairing is 2; BR's is 0. The nonzero D^ρ-module O(−1) has RΓ=0.

   **Exact repair text:** “In this positive-characteristic paragraph ν denotes the actual character parameter of D̃, so tensoring by L_B(μ−ν) changes ν to μ. In our positive-root convention the regularity condition is ⟨ν−ρ,α∨⟩∉pZ for every root α. Use this parameter consistently in the Frobenius/Harish–Chandra fibre, splitting bundle and localisation equivalence; BR's dot action here has shift −ρ. This parameter is distinct from the highest-weight labels used in Layer 10.” Replace the p=3 Check by: “ν=0 has pairing −1 and is regular; ν=ρ has pairing 0 and is excluded; ν=2ρ has pairing 1 and is regular. The singular twist L_B(ρ)=O(−1) has zero derived global sections.”

   **Repair test:** The counterexample ν=ρ is excluded; ν=0 and 2ρ agree with BR's criterion. The already repaired dual-kernel twist remains (ρ,α−ρ). This is a new consequence of transporting the root convention, not a re-raising of the repaired twist finding.

2. **F02** (P2) The convolution order is not transported with the inverse component labels

   **Location:** packages/SpringerResolutionAndCharacteristicCycles/README.md:482: “O_(X_s₁)⋆⋯⋆O_(X_sₘ)≅O_(X_w)”; :486: “the factors keep BR's reversed order”.

   **Claim:** The word and dual-word identities use an unspecified pullback/tensor/projection product while citing BR's convention.

   **Witness:** BR12 lines 233–235 put the second kernel on factors 1,2; lines 955–963 use the inverse orbit label. For SL₃, s₁s₂≠s₂s₁: BR's product of X_s₁,X_s₂ is X_s₂s₁, not X_s₁s₂.

   **Exact repair text:** “For our relative-position labels define K⋆L=Rp₁₃*(Lp₁₂*K ⊗ᴸ Lp₂₃*L), on kernels proper over the two factors. This is the opposite of BR's convolution. Thus the reduced word s₁⋯sₘ gives X_(s₁⋯sₘ); the dual kernel uses the reversed word with the transported twists (ρ,αᵢ−ρ).” Add the Check: “For SL₃, s₁=(12), s₂=(23), z=diag(1,2,4), the s₁⋆s₂ graph has second Cartan coordinate diag(2,4,1); the opposite product has diag(4,1,2).”

   **Repair test:** The repaired product composes the two relative positions in the stated order. The empty-word and rank-one tests remain valid but cannot distinguish the two products; the new rank-two test does.

3. **F03** (P2) Two supplier ownership claims have drifted

   **Location:** packages/SpringerResolutionAndCharacteristicCycles/README.md:15: “F2.2 owns all-order algebraic differential operators”; :18: “§6.7 owns affine generic-length module cycles and exact additivity”.

   **Claim:** FormalConnectionsOpers and DeformationAndDerivedPatchingAlgebra are the original owners of these two generic carriers.

   **Witness:** TauCetiRoadmap/ComplexComparisonPartII/README.md:2393–2423 assigns the operator/principal-parts floor to C5.1. TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:1298 makes its cycle a definitional abbreviation of PadicLocalLanglandsForGL2Qp §0.5.

   **Exact repair text:** “ComplexComparisonPartII C5.1 owns ordinary algebraic differential operators, all-order principal parts, their universal property and localization/sheafification. FormalConnectionsOpers F2.2 supplies symbols, Lie–Rinehart PBW and the smooth characteristic-zero comparison on that carrier.” Also: “PadicLocalLanglandsForGL2Qp §0.5 owns affine generic-length module cycles, exact additivity and quotient comparison; DeformationAndDerivedPatchingAlgebra §6.7 reuses that carrier and supplies its stated applications.” Apply these distinctions to the supplier contracts and the relevant *Needs:* lines in Layers 7–8; retain DeformationAndDerivedPatchingAlgebra for completion and local algebra.

   **Repair test:** On k[x], [∂,x]=1 is an assertion about the C5.1 carrier, with F2.2 providing gr D=k[x,ξ]. On k[ε]/ε² the cycle coefficient is still 2 and the residue-module coefficient 1, now on the single §0.5 carrier. Both original owners precede this roadmap in the order. No new carrier or gap is needed.

4. **F04** (P2) The local-nilpotence proof target repeats a pinned theorem

   **Location:** packages/SpringerResolutionAndCharacteristicCycles/README.md:1313–1315: “Prove the highest-weight integrability criterion”; “the negative simple-root operator is locally nilpotent exactly for α∈I_w”.

   **Claim:** The forward rootwise local-nilpotence implication is new work in this subsection, including its semisimple case.

   **Witness:** TauCeti/Algebra/Lie/HighestWeight/Integrable.lean:119 already proves `TauCeti.exists_pow_toEnd_eq_zero_of_mem_rootSpace_neg` for an irreducible highest-weight module with that one simple-coroot value in ℕ; no dominance at other roots is required.

   **Exact repair text:** “For the Killing-semisimple derived algebra consume TauCeti.exists_pow_toEnd_eq_zero_of_mem_rootSpace_neg and TauCeti.locallyFiniteSubmodule_eq_top_of_isSl2Triple from TauCeti/Algebra/Lie/HighestWeight/Integrable.lean. Transport these along the supplied reductive decomposition. Prove the converse criterion and the compatible algebraic P_I-integration and uniqueness here; do not re-prove the supplied local-nilpotence implication.” Add these exact pinned inputs to the Tau Ceti contract and §12.1 needs.

   **Repair test:** For SL₂ with λ=0 the native theorem gives f m=0 on L(0); for λ=−2ρ the hypothesis λ(α∨)=n∈ℕ fails, leaving the converse as genuine work. For SL₃ λ=−2ρ+α₁, the native theorem already applies to α₁ (pairing 0) despite the α₂ pairing −3. The parabolic-integration target remains intact.

5. **F05** (P2) The holonomic definition claims the next subsection's output

   **Location:** packages/SpringerResolutionAndCharacteristicCycles/README.md:1009: “obtain the abelian and finite-length API”; :1016: “CC gives an additive map K₀(Hol(D_Y))→Z_n(T*Y)”.

   **Claim:** §9.4 obtains finite length and the K₀ cycle map from characteristic support and Bernstein inequality, with only §§8.5 and 9.3 as needs.

   **Witness:** The actual finite-length and cycle-additivity proof is packages/SpringerResolutionAndCharacteristicCycles/README.md:1029–1031 (§9.5), which consumes §9.4, §8.6, §8.4 and length additivity. Support alone sees δ and δ⊕δ identically; their lengths are 1 and 2.

   **Exact repair text:** In §9.4 replace the proof-route sentence with “Define the full subcategory, including zero; Bernstein inequality and the exact-support theorem show that it is abelian and closed under extensions.” Delete its K₀/CC API bullet. Keep finite length, cycle additivity and the induced K₀ homomorphism solely in §9.5 with its existing needs.

   **Repair test:** §9.4 classifies both δ and δ⊕δ as holonomic from their one-dimensional supports. §9.5 then distinguishes coefficients 1 and 2 and proves 2=1+1, without needing its own output in §9.4.

## Earlier findings: repair verification

IDs below use the repair report’s F labels (the original reports also use R labels).

| Earlier finding | Status at this head | Repaired passage and verification witness |
| --- | --- | --- |
| Pass a F01; pass b F01: parabolic action | Repaired | packages/SpringerResolutionAndCharacteristicCycles/README.md:1337: “saturated along the fibres of π_w on the first flag”. For SL₂, w=e, P=B, g₁pB=g₁B; the old counterexample (ke₂,ke₂,0) remains fixed under refinement. packages/SpringerResolutionAndCharacteristicCycles/README.md:1343 explicitly rejects its first-flag left translate. |
| Pass a F02: relative-Spec modules | Repaired | packages/SpringerResolutionAndCharacteristicCycles/README.md:848: “SchemeAndStackFoundations §0.2 supplies `relativeSpec_modulesEquiv`”. On A¹, gr O=k[x,ξ]/(ξ) sheafifies to O of the zero section; packages/SpringerResolutionAndCharacteristicCycles/README.md:853 records this. SchemeAndStackFoundations §0.2 states the equivalence. |
| Pass a F03: Borel–Moore supplier | Repaired | packages/SpringerResolutionAndCharacteristicCycles/README.md:1237: “define rational Borel–Moore homology, its proper pushforward and open restriction by AffineMorseLefschetz A4.0”. For SL₂, top BM degree 4 has rank 2, versus H₄(T*P¹)=0. The top fundamental-class and convolution comparisons are explicitly owned in §11.1. |
| Pass a F04: independent KL proof route | Not repaired; settled outside this package | packages/SpringerResolutionAndCharacteristicCycles/README.md:1268 still starts “Use the composition-multiplicity theorem established here”. The repair report marked this not actionable because of later owners. No finding is re-raised solely for the unchanged issue; its proof remains uncertified here. |
| Pass a F05: type-A Hecke owner | Repaired | packages/SpringerResolutionAndCharacteristicCycles/README.md:1266: “generator-preserving map from TypeAHeckeAlgebras H1 … is an isomorphism”. For S₃ both bases have 6 elements; v=1 gives T_s²=1. The minus-generator map fails the generic quadratic relation by 2(v−v⁻¹)T_s. |
| Pass a F06: BR root/line-bundle sign | Repaired | packages/SpringerResolutionAndCharacteristicCycles/README.md:486: “their twist (−ρ,ρ−α) therefore becomes (ρ,α−ρ) here”. For SL₂ this is (ρ,ρ), giving O(−1,−1), the canonical bundle of Tot O(−1,−1); the former twist gives O(1,1). |
| Pass a F07: unresolved simple-module reference | Repaired | packages/SpringerResolutionAndCharacteristicCycles/README.md:1251: “those of §10.4, transported to F×F by the induction equivalence of §10.3”. SL₂ simples give (1,0),(0,1) with these labels. |
| Pass a F08: undefined extension Check | Repaired | packages/SpringerResolutionAndCharacteristicCycles/README.md:892: “0→D/Dx→D/Dx²→D/Dx→0”. Multiplication on the right by x identifies the kernel; associated graded lengths at (x) are 1,2,1 and 2=1+1. |
| Pass b F02: G98 multiplicity locator | Repaired | packages/SpringerResolutionAndCharacteristicCycles/README.md:920: “its rank-over-the-component multiplicity not being used (G98 line 191)”. D/Dx² has localized length 2 and reduced-component rank 1, so the distinction is substantive. |
| Pass b F03: process residue | Repaired | packages/SpringerResolutionAndCharacteristicCycles/README.md:695: “Reducedness of Q is a hypothesis”; :959: “constructed in this subsection on top of gap:derived-bimodule-sheaves”; :983 cites §9.1 and that gap; :1077 says descent “is proved in this subsection”; :1114 uses that descent. The five prior process placeholders have been replaced. |

## Adversarial statement table

The rows cover all 69 numbered target blocks of packages/SpringerResolutionAndCharacteristicCycles/README.md, including their definitions, APIs and Checks. There are no separately bold mathematical targets: the numbered headings carry them. Results below are finite tests, not proofs of the general statements. “Retain” means no counterexample from the recorded tests; supplier and source qualifications remain applicable.

Contexts: **G** = split connected reductive group over a field with specified B,T; **H** = characteristic zero or p>h for structural results in Layers 2–5; **C** = characteristic zero; **Dmod** = smooth separated finite-type pure n-dimensional scheme in characteristic zero, coherent left D-module with quasi-coherent underlying O-module; **Comp** = the excellence, closed-point, support-dimension and actual-ideal hypotheses printed in the section. The zero ring is not a field and is not an instance of G, C or Dmod. Empty support and zero modules remain allowed. No Lean section variables are implicit in these contexts.

| Target, context | Instances and values computed on the relevant sides | Result / change |
| --- | --- | --- |
| Conventions: dimensions and line character, G | Trivial group: (N,r,D,dim B)=(0,0,0,0). SL₂: (1,1,3,2), dim T*P¹=2. L_B(ρ) has degree −1, while the inverse character has degree +1. | Retain; S01 transports this sign into positive-characteristic parameters. |
| Conventions: Weyl order, G | GL₃ cycle w and z=(1,2,4): w⁻¹z=(2,4,1), wz=(4,1,2), unequal. Identity gives z=z. | Retain; S02 uses the noncommuting test for convolution. |
| Conventions: moment and inverse-image shifts, C | Signed cotangent pair has sum −a+a=0; unsigned pair has sum 2a. For δ at 0 in A¹, Tor₀=0, Tor₁=k; Li*δ[−1] has H⁰=k. Identity shift=0. | Retain. |
| Conventions: weights and cycles, C | SL₂ λ_e=−2ρ, λ_s=0; M=((1,0),(1,1)). Dual numbers have lengths 2 for A and 1 for k; zero has length 0, so 2=1+1. | Retain. |
| 1.1 flag quotient, G | Torus: G/B=point. SL₂: P¹, base line ke₁. GL₃: line-in-plane dimension 3 versus lines alone dimension 2. Torsor fibre difference is b=g⁻¹g′. | Retain fppf quotient, not naive S-points. |
| 1.2 smooth projectivity, G | SL₂: dim F=1, dim B=2, dim G=3. Torus: 0,r,r. Trivial group: all 0. A positive regular root-lattice character 2ρ gives L_B(−2ρ) ample; ρ need not be a character for PGL₂. | Retain integral-character qualification. |
| 1.3 relative position, G | SL₂: U_e={(L,L)}, dim 1; U_s={(L,L′):L≠L′}, dim 2, closure P¹×P¹. Torus: one point. Replacing a representative by T changes no B-coset. | Retain. |
| 1.4 orbit dimensions/closures, G | SL₂ e: N+ℓ(e)=1+0=1, closure U_e. s: 1+1=2, closure U_e∪U_s. Torus: 0+0=0. | Retain both containment directions. |
| 1.5 intersections of subbundles, reduced Jacobson base and constant fibre rank | In k² identical lines intersect in dimension 1; distinct coordinate lines in dimension 0. Over k[ε]/ε², Ae₁∩A(e₁+εe₂)=εAe₁, not free, despite reduced fibre dimension 1. | Retain reduced-base hypothesis; nonreduced control excluded. |
| 2.1 simultaneous resolution, G | SL₂: rank b=2 bundle over dim-1 P¹, total dim 3. Torus: rank r over point, total t. At zero operator the fibre is all F; at E₁₂ it has one geometric flag. | Retain actual associated bundle and operator map. |
| 2.2 regular/semisimple loci, G,H | SL₂: dim centralizer of E₁₂=1, of diag(1,−1)=1, of 0=3; only the diagonal element is regular semisimple. Torus: all centralizers have dim r, all elements regular semisimple. p=2 excluded for SL₂; p=3 allowed. | Retain. |
| 2.3 proper covering, G,H | SL₂ regular semisimple fibre: two distinct Borels, degree 2=card W. E₁₂: one geometric Borel, scheme fibre length 2 (local line equation x²=0). Torus: identity, degree 1. | Retain covering only on regular semisimple open, not all regular points. |
| 3.1 double incidence, G | Torus: t×_t t=t. SL₂ ψ=0: P¹×P¹, dim 2. At E₁₂ the only geometric pair is (ke₁,ke₁). Ambient flag-pair/operator space has dim 2+3=5. | Retain scheme fibre product. |
| 3.2 Cartan maps, G | On SL₂ diagonal flags κ₂=κ₁; on opposite flags κ₂=−κ₁. Torus κ₁=κ₂=id_t. GL₃ 3-cycle gives (1,2,4) and (2,4,1). | Retain quotient b→b/u and inverse-Weyl convention. |
| 3.3 strata, G | SL₂ V_e has base dim 1, operator rank 2; V_s has base dim 2, rank 1; both total dim 3. Torus has one stratum t. | Retain locally closed, not generally closed, strata. |
| 3.4 incidence bundle ranks, G | SL₂ ranks r+N−ℓ(e)=2 and r+N−ℓ(s)=1; totals 1+2=2+1=3. Torus rank r and total r. | Retain constant-rank subbundle construction under §1.5. |
| 3.5 component closures, G,H | SL₂ X_e is the diagonal simultaneous resolution; X_s=Tot O(−1,−1). Each has dim 3, with distinct generic relative positions. Torus X_e=t, one component. | Retain reduced closures, not whole inverse images of orbit closures. |
| 3.6 Bruhat support, G,H | For SL₂, X_e projects to diagonal; X_s to all P¹×P¹. At ψ=0 all these pairs lift. Hence U_v meets projection exactly for v≤w. | Retain both directions. |
| 3.7 local complete intersection, G,H | SL₂ flag slopes x,y give equations c−2ax−bx²=0 and c−2ay−by²=0 in dim 5; expected dim 5−2=3. Torus: zero equations, dim r−0=r. | Retain complete-intersection dimension argument. |
| 3.8 reducedness, G,H | In the SL₂ chart eliminate c: (x−y)(2a+b(x+y))=0, two distinct factors when 2≠0. Generic multiplicity is 1 on both; torus polynomial ring has nilradical 0. | Retain CM plus generic reducedness. |
| 3.9 birational projections, G,H | Over regular semisimple SL₂ each first Borel has one Borel in specified relative position, generic degree 1. At ψ=0 and first flag L, X_s has full P¹ as second flags, so the full projection is not an isomorphism. | Retain regular-open restriction. |
| 4.1 fibre dimensions, G,H | Torus: r−r=0. SL₂ X_e and X_s: 3−1=2 at every Cartan value; κ=0 on X_s has two dim-2 components. | Retain local-fibre upper-semicontinuity/scaling argument. |
| 4.2 CM/integral kernels, simply connected semisimple and p>h | SL₂ p=5: 5>2, simple component smooth dim/depth 3; p=2: 2>2 false. Empty word is diagonal. X_s line bundle O(−1,−1) has canonical bundle O(−1,−1), matching twist (ρ,ρ). | Original twist repair verified; S01–S02 concern the remaining localisation and composition conventions. |
| 4.2 crystalline centre/localisation subtarget | Over F₃, [∂³,x]=3∂²=0 and [∂,x³]=3x²=0. At ν=ρ, proposed regularity value 2≠0 but transported value 0; RΓ(P¹,O(−1))=0 while O(−1)≠0. At ν=2ρ values 0 and 1 are reversed. | S01. |
| 4.2 convolution subtarget | SL₃ word s₁s₂: expected κ₂=(2,4,1) for κ₁=(1,2,4). BR's unreversed product yields κ₂=(4,1,2). Empty word and one reflection give identical answers under both orders. | S02; rank-one Checks do not determine order. |
| 4.3 CM spreading/descent, G,H | SL₂ X_s smooth: depth=dim=3. Flat disjoint union Spec Z_(p) ⊔ Spec Q[x,y]/(x²,xy): special fibre depth=dim=0, bad generic piece depth 0<dim 1. Scaling plus projectivity excludes this escape in the actual model. | Retain added specialization argument; flatness alone is insufficient. |
| 4.4 local miracle flatness, G,H | SL₂ local equality 3=1+2; torus r=r+0. For point⊔A¹→A¹, global fibre dimension 0 does not save the point component: local equality would read 0=1+0, false. | Retain local dimension hypotheses. |
| 5.1 Weyl relation, G,H | SL₂ κ₂=−κ₁ on s. GL₃ cycle κ₂=(2,4,1)=w⁻¹(1,2,4)≠w(1,2,4). Torus id=id. | Retain. |
| 5.2 smooth Cartan/flag map, G,H | SL₂ V_e→U_e×t has fibre dim 1, V_s has fibre dim 0; dimensions 3=(1+1)+1 and 3=(2+1)+0. Torus fibre dim 0. | Retain unipotent-intersection affine fibres. |
| 5.3 one-root wall, G,H | SL₂ wall z=0, z+E₁₂ centralizer dim 1 versus zero's dim 3. GL₃ diag(a,a,c)+E₁₂ (a≠c) centralizer dim 2+1=3=r. Torus has no root wall. | Retain root-vector nonzero and single-wall requirements; declared gap supplies general case. |
| 5.4 normality, G,H | SL₂ X_e and X_s are smooth dim-3 bundles, hence local regular examples depth=dimension. Torus A^r normal. Node k[x,y]/xy is reduced but has two branches and is not a normal domain: reducedness alone would not suffice. | Retain CM plus codimension-one regularity route. |
| 6.1 nilpotent cone, G,C | Torus invariant quotient is identity, zero fibre {0}; a nonzero central ε over dual numbers is ad-nilpotent but its invariant coordinate ε≠0. SL₂ cone equation a²+bc=0; GL₂ equations tr=det=0 retain central direction. | Retain scheme quotient rather than pointwise ad-nilpotence. |
| 6.2 Springer comparison, G,C | SL₂: rank-1 nilradical bundle on P¹, total dim 2; zero fibre P¹, regular E₁₂ fibre one reduced point. Torus total/fibre point. | Retain comparison of supplied carrier including maps and ideals. |
| 6.3 cotangent/sign comparison, G,C and chosen invariant form | tr(E₁₂E₂₁)=1. With form 2tr the same functional is represented by E₁₂/2. Signed pair has sum 0, unsigned pair has sum 2ψ. Torus Springer point versus Grothendieck t separates the two resolutions. | Retain chosen form and signed incidence. |
| 6.4 reduced Steinberg variety, G,C | SL₂ Z_e=T*P¹ on diagonal, Z_s=P¹×P¹ at ψ=0; both dim 2, intersection diagonal P¹ dim 1. Torus Z=point. | Retain reduction and specified closed embedding. |
| 6.5 fibre-product comparison, G,C | Reduction is iso iff nilradical=0: k[ε]/ε²→k has kernel (ε)≠0, whereas k→k has kernel 0. Torus fibre product is k, so comparison is iso. | Retain explicit reducedness hypothesis, not inferred from the support. |
| 6.6 conormal components, G,C | SL₂ diagonal orbit dim 1, conormal rank 1, total 2; open orbit dim 2, conormal rank 0, closure zero section dim 2. Torus rank/base dim 0. | Retain signed conormal closures. |
| 7.1 top component group, Noetherian finite-dimensional Y | SL₂ top group has two generators Z_e,Z_s, hence Z². Torus group Z. Empty scheme gives 0; lower-dimensional point inside a curve contributes 0 in degree 1. | Retain native cycle subgroup; no rational-equivalence quotient. |
| 7.2 generic-length gluing, finite coherent M with support bound | Dual numbers: cycle(A)=2[point], cycle(k)=[point], cycle(0)=0; 2=1+1. DVR: cycle₁(O)=1[(0)], cycle₁(O/π)=0; cycle₀(O/π)=1[m]. | True tests; S03 corrects the affine carrier owner. |
| 7.3 scheme Cartan zero fibres, G,C | On SL₂ X_s chart κ=b(x−y)/2, so κ=0 gives b(x−y)=0: two branches with lengths (1,1). X_e zero fibre gives only Z_e, length 1. Torus fibre point, length 1. | Retain scheme multiplicities. |
| 7.4 CM zero fibres, G,C | SL₂: nonzerodivisor κ cuts CM dim 3 to depth/dim 2. Torus: r coordinates cut dim r to 0. A repeated equation x² gives length 2, showing CM does not imply reduced. | Retain CM and dimension conclusions only. |
| 8.1 D-module category, Dmod | On A¹ [∂,x]=1. O has usual derivative; D/Dx has x∂δ=−δ. Assigning x=∂=0 on nonzero k gives commutator 0≠1. Zero module satisfies 0=0. | Retain quasi-coherent underlying O, coherence over D; S03 changes base carrier citation. |
| 8.2 PBW/cotangent sheaf, Dmod | Order pieces on A¹ have O-ranks 1,2,3 in orders 0,1,2; gr D=k[x,ξ]. Gr O=k[x,ξ]/ξ is zero-section sheaf; gr δ=k[x,ξ]/x is cotangent-fibre sheaf. | Retain actual module equivalence; earlier F02 repaired. |
| 8.3 good filtration, Dmod | Standard O filtration has gr=k[x], ξ=0; D order filtration has gr=k[x,ξ]. Constant all-integer filtration of nonzero M has gr=0 but is not bounded below. | Retain lower-bound condition. |
| 8.4 global good filtrations, Dmod | Shift O filtration by 1: each comparison bound a=1 works. D/Dx→D/Dx²→D/Dx with right-multiplication first map has graded lengths 1,2,1 and 2=1+1. Finite cover of s charts gives s coherent generators and one finite sum. | Retain global finite-cover argument and repaired exact-sequence Check. |
| 8.5 characteristic support, Dmod | O: ξ=0, dim 1; δ: x=0, dim 1; D: full plane dim 2; 0: empty. D/Dx² and δ have identical reduced support although lengths 2 and 1. | Retain reduced support independently of thickening. |
| 8.6 all-component CC, Dmod | CC(O)=[ξ=0]; CC(D/Dx²)=2[x=0]; CC(D)=[A²]; CC(0)=0. CC(D⊕O)=[A²], not [A²]+[ξ=0], because the latter support is embedded. Rank-a connection gives coefficient a, including a=0. | Retain filtration independence, reject unrestricted mixed-dimensional additivity. |
| 9.1 transfer/duality, Dmod and smooth source/target | Point k² dual dimension 2, shift 0. On A¹ dual O has Ext¹=ω and ω⁻¹[1] puts O in degree 0. Closed point pushforward is k[∂], x∂δ=−δ; identity transfer D has shift 0. | Retain derived and canonical-bundle normalizations; conditional on derived-bimodule gap. |
| 9.2 Kashiwara, smooth closed immersion codimension c | δ at 0: ker x=kδ, coker x=0, so Tor₁=k, Tor₀=0 and Li*δ[−1]=k[0]. Double δ gives ker dimension 2; identity c=0 recovers M. | Retain quotient Tor₀ correction. |
| 9.3 Bernstein, Dmod | A¹ supports of O,δ,D have dimensions 1,1,2, all ≥1. Point: 0≥0. A nonzero finite-dimensional Weyl module would have tr[∂,x]=0≠dim M in characteristic zero. | Retain componentwise inequality. |
| 9.4 holonomicity, Dmod | O and δ satisfy 1≤1; D fails 2≤1; zero is holonomic by empty-support convention. δ and δ⊕δ have equal support but distinct lengths 1,2. | Definition sound; S05 moves finite-length/CC output to §9.5. |
| 9.5 finite length/additivity, holonomic Dmod | δ⊕δ has length 2 and cycle 2[x=0]; zero length/cycle 0; nonsplit displayed extension also gives 2=1+1. | Retain positivity of generic lengths, not support counting. |
| 9.6 intermediate extension, smooth locally closed j | id: E→E. G_m→A¹: j_!*O=O, j_+O=O[x⁻¹], quotient δ≠0. Point→A¹: j_!*k=δ. | Retain normalized restriction for positive codimension. |
| 9.7 regularity, holonomic Dmod | Trivial connection has connection form 0; delta comes from a point. Exponential at t=1/x has form −dt/t², pole order 2, so fails logarithmic regularity though holonomic. | Retain distinction from holonomicity; field descent is an owned target. |
| 9.8 strong equivariance, smooth H, Dmod | G_m on point: weights 0,1 differentiate to 0,1 against tangent action 0, so only 0 passes. Trivial H on A¹ admits D with CC=[A²]. Constant finite S₃ on point has Lie algebra 0 and allows its nontrivial representations. | Retain nonconnected H and differentiated condition. |
| 9.9 moment support/classification, stated orbit hypotheses | Signed SL₂ pairs give −ψ+ψ=0; double flags have two orbits and two trivial-character simples. G_m acting on G_m by t² has stabilizer μ₂: two component characters, so dropping connected stabilizers changes the classification. | Retain connected-stabilizer hypothesis; no general finite-group triviality inferred. |
| 10.1 D-affinity, G,C | Torus F=point: Γ=id, higher cohomology 0. On P¹, H⁰(O)=k, H¹(O)=0. O(−1) has H⁰=H¹=0 but is not an ordinary D_P¹-module, so is not a counterexample here. | Retain ordinary-D and strict-centre conventions. |
| 10.2 Beilinson–Bernstein, G,C, strict χ₀ | Torus U(t)/(t)=k, Loc(k)=k at point. Generalized module k[z]/z² has z≠0 and is excluded by strict χ₀. For SL₂ Loc(k)=O_F with zero-section cycle. | Retain strict reduction and equivalence domains. |
| 10.3 induction, G,C | Torus induction is identity. SL₂ δ at base flag induces diagonal module on P¹×P¹; O_F induces O_(F×F). Slice restriction recovers δ and O in degree 0; normalized codimension pullback would add a shift and is not the stated quasi-inverse. | Retain unshifted noncharacteristic slice restriction. |
| 10.4 principal category O, G,C | SL₂ M_e=M(−2ρ) simple; M_s=M(0) has two factors L_e,L_s. Torus strict centre gives finite-dimensional k-spaces and one simple. Weight −2ρ is an actual PGL₂ character; ρ is not. | Retain rational T-lattice and fixed central action. |
| 11.1 Verma cycles, G,C | SL₂ CC(M_e)=(1,0), CC(M_s)=(1,1). Top BM H₄ of Z is Q²; ordinary H₄(T*P¹)=0 whereas BM H₄(T*P¹)=Q. Torus both cycles coefficient 1. | Earlier BM repair sound; general convolution comparison remains a substantial owned target. |
| 11.2 simple triangularity, G,C | SL₂ smooth orbit closures: A=((1,0),(0,1)), a_s,e=0 though M_s has coefficient 1 along Z_e. Torus A=(1). | Retain nonnegative triangularity; no irreducibility asserted in higher rank. |
| 11.3 KL multiplicities, principal block | SL₂ M=((1,0),(1,1)); unprefixed polynomials swap the allowed off-diagonal entry. A₃ P_(s₂,s₂s₁s₃s₂)=1+q gives 1,2,3 at q=0,1,2. S₃ Hecke ranks 6=6; at v=1 Ts²=1. | Values consistent; earlier F04 proof-route issue remains settled and uncertified. |
| 11.4 three integral bases, G,C | SL₂ det M=1, inverse ((1,0),(−1,1)); A=id. Torus det(1)=1. Negative entry in inverse distinguishes integral group from effective-cycle monoid. | Retain integral, not merely rational, basis conclusion. |
| 12.1 parabolic integrability, G,C | SL₂ e pairs −2, so I=∅, P=B; s pairs 0, so P=G. SL₃ s₁ gives pairings (0,−3), hence plane-stabilizer P. Torus root set empty, P=G. | Mathematics consistent; S04 imports pinned rootwise forward implication. |
| 12.2 partial-flag saturation, G,C | SL₂ e: g₁pB=g₁B, while upper unipotent left translation sends (ke₂,ke₂,0) off diagonal. s: Z_s=P¹×P¹×0 permits every first flag. SL₃ s₁: equal planes give base dim 4, Hom(k³/P,P) rank 2, total 6=2N; changing first line inside P changes no condition. | Earlier action finding repaired. |
| 12.2 smooth-pullback cycle formula, smooth f and Dmod | A²→A¹ projection: pullback of D/Dx² has support x=0, new fibre covector η=0, generic coefficient 2=2. Identity pullback leaves coefficient 2; empty inverse image contributes 0. Transpose df is an embedding precisely because f is smooth. | Retain flat-pullback generic-length argument. |
| 13.1 Cartan graphs, G,C | SL₂ ring k[x,y]/(x²−y²), graphs y=±x. Torus quotient=id, fibre product diagonal t. GL₃ cycle sends (1,2,4)→(2,4,1), not (4,1,2). | Retain inverse labels. |
| 13.2 reduced graph union, G,C | In characteristic zero the two SL₂ factors are distinct, nilradical 0, intersection origin. In characteristic 2 actual Weyl action is trivial, quotient=k[t], diagonal nilradical 0 with coincident labels; reducing integral square quotient gives ε²=0, a different ring. | Retain characteristic-zero hypothesis and corrected char-2 control. |
| 13.3 completed graph detection, G,C, closed point | k[x]_(x)→k[x,y]_(x,y) completes to k[[x]]→k[[x,y]], closed fibre k[[y]], dimension 2=1+1. On graph e, y−x=0 but y+x=2x≠0; identity completion has closed fibre k. | Retain actual completed maps and both directions of iff. |
| 13.4 tangent upper bound, G,C, ψ=0 | SL₂ (w,v)=(e,e): 1+1+1=3; (s,e): 2+0+1=3; (s,s): 2+1+0=3. Actual X_e,X_s tangent dim 3. Torus: 0+r+0=r. | Retain zero-operator and common-residue-field requirements. |
| 13.5 smoothness criterion, G,C | SL₂ (s,e): codim fixed space 1=ℓ(s)−ℓ(e), bound=local dim=3. (s,s): 0=1−1, same dimension 3. Torus bound r=dim r. | Retain sufficient criterion only. |
| 14.1 completion of cycles, Comp | A¹→k[[t]] has one branch coefficient 1. Node y²=x²(1+x) factors formally as (y−x√(1+x))(y+x√(1+x)), two distinct branches coefficient 1 each. Axes at (1,0): y=0 contributes 1, x=0 contributes 0. | Retain sum of all branches and missing-component zero. |
| 14.2 completed module cycle, Comp | Point k²: 2=2·1. Node structure module: one global coefficient 1 becomes (1,1); its double becomes (2,2). Point-supported module on curve has degree-1 cycle 0 before and after completion. | Retain finite-module, exact-completion and ambient-dimension qualifications. |
| 14.3 completed simple cycles, G,C, closed point | Torus sole coefficient 1. SL₂ at diagonal zero: L̂_e and L̂_s each give their own component. At nonzero E₁₂, only Z_e remains: L̂_e coefficient 1, L̂_s=0. | Retain cycle completion, not D-module completion. |
| 14.4 completed KL equality, G,C, closed point | SL₂ w=s at common point: (1,1)=(1,0)+(0,1). Off Z_s: 1=1+0. Torus: 1=1. At a point missing X̄_w both sides have every supported summand zero. | Retain conditional on earlier uncompleted theorem and settled KL input. |

## Suggested.lean declaration and headline audit

| Declarations read | Section / variable / instance context | Adversarial result |
| --- | --- | --- |
| 0 definitions, 0 instances, 0 theorems, 0 examples | packages/SpringerResolutionAndCharacteristicCycles/Suggested.lean:1–38: one Mathlib import and empty TauCetiRoadmap.SpringerResolutionAndCharacteristicCycles namespace; no variable or include block | No values are hidden behind an admitted carrier. No binder can silently drop an instance because no declaration is made. No padding theorem or name collision exists. |

The 15 headline groups explicitly named at lines 12–26 are: regular covering; reduced lci incidence; birational projections; CM/flatness; normality; Springer/Steinberg comparisons; characteristic cycles; Kashiwara/Bernstein; holonomic length/intermediate extension; localisation/category O; Verma/simple/integral bases; partial-flag saturation; formal graph detection; tangent/smoothness; completed cycles/KL. Every group names its missing geometric carrier or functor. Native Scheme, VermaModule, AlgebraicCycle and DerivedCategory alone do not supply those constructions. A matrix version of the tangent inequality or a free-cycle KL identity would be an impermissible stand-in. The newly pinned rootwise theorem in S04 is an input, not a reason to add padding to this file. No statable missing headline was established in this review. No #check elaboration or Lean build was run: the brief prohibits it, and the declaration list is empty.

## Supplier, pin and dependency ledger

Citations to existing roadmaps were resolved against the content repository's main copy, rather than treating a progress/revision pull request as a supplier. New-folder suppliers were read through the roadmap service; FormalConnectionsOpers was also read at its supplied head. The generic-object search used `roadmaps grep` and the board packages, including designs, rather than matching only proposed Lean names. No declaration in the empty Suggested.lean can duplicate a sibling fully qualified name.

| Supplier citation group | Current locator and scope checked | Test / consequence |
| --- | --- | --- |
| ReductiveGroups Layers 2–3, 7–9, 10A–10B, 11C–11D | TauCetiRoadmap/ReductiveGroups/README.md:227, 234, 627, 1023, 1092, 1731, 1959: Lie/quotient/root/integral models, character-lattice representations, complex regular-semisimple lane | G/B is an fppf quotient, not a pointwise quotient; torus F=point. Extra arbitrary-field Lie/Borel-cover comparisons remain the declared gap. |
| AlgebraicVectorBundles L0A–L2B | TauCetiRoadmap/AlgebraicVectorBundles/README.md:215–340: sheaf operations, relative Spec, geometric vector bundles | Tot(E)=Spec Sym(E∨); frame-torsor weights 1,−1,0 give degrees 1,−1,0. Associated-bundle comparison remains the declared gap. |
| SchemeAndStackFoundations §§0.2,0.4,0.7–0.9,0.16–0.21,0.30,1.1,1.16,2.6,2.18,2.22,4.11,4.13,5.1 | TauCetiRoadmap/SchemeAndStackFoundations/README.md:529, 602, 755, 798, 848, 1099–1394, 1956, 2071, 2589, 3437, 3959, 4428, 5528, 5643, 6567 | Relative-Spec module equivalence is at :539; finite modification theorem at :5534. Finite-type cycle grading is not automatically the completed-local grading. These contracts do not assert completed branches integral. |
| DeformationAndDerivedPatchingAlgebra §§1.13–1.16,3.3–3.4,6.7 | TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md, sections on finite-module/local-map completion and local miracle flatness; §6.7 at :1294 | Actual closed fibre after completion is k[[y]], not k[y]_(y). Local dimension 3=1+2 is the needed flatness criterion. Its affine cycle carrier is now imported: S03. |
| SchubertGeometry S1,S2.3 | TauCetiRoadmap/SchubertGeometry/README.md:9–15, 32–43 | Its standard flags use B−; opposition is required to get this package's B+. SL₂ orbit dimensions remain 1 and 2 after transport. |
| AffineMorseLefschetz A4.0–A4.1 | TauCetiRoadmap/AffineMorseLefschetz/README.md:210 onward: locally finite chains, compact-pair comparison, fundamental cycles, compatible triangulation | BM versus ordinary top homology on T*P¹ is Q versus 0. Rational coefficients follow by the flat Q extension of the supplied integral compact-pair comparison. |
| ComplexComparisonPartII C−1.1 and C5.1 | TauCetiRoadmap/ComplexComparisonPartII/README.md:2393–2423 for shared operators; C−1.1 for scheme analytification | Complex point fibre products preserve the intended Steinberg realization. Generic operator ownership must be corrected by S03. |
| TypeAHeckeAlgebras H1 | TauCetiRoadmap/TypeAHeckeAlgebras/README.md:9–50 | Same quadratic relation with q=v; S₃ rank 6 and specialization Z[S₃]. The opposite sign on the generator is not the generic comparison. |
| NilpotentOrbits N1,N5.0,N7 | TauCetiRoadmap/NilpotentOrbits/README.md, those named sections | The complex zero-fibre ideal, Springer map and cotangent map are supplied; this package retains ownership of arbitrary-field comparisons and double-incidence cycles, not a new complex Springer carrier. |
| FormalConnectionsOpers F2.2,F4.3 | TauCetiRoadmap/FormalConnectionsOpers/README.md:179–219 for operators/PBW; F4.3 for invariant quotient and regular-nilpotent Borel | PBW needs the projective Lie-module/smooth characteristic-zero comparison. Invariant restriction is coaction invariance, including central polynomial factors; S03 separates the operator floor from PBW. |
| EnhancedDerivedSheaves §§0.1–0.4,E1.3–E1.4 | TauCetiRoadmap/EnhancedDerivedSheaves/README.md:429–510, 549–625, on main | Additive enhancement permits noncommutative coefficients; the tensor/Hom formulas here assume commutative coefficients. Hence the noncommutative bimodule gap is real, not supplied by the symmetric monoidal tensor API. |
| RepresentationTheory/LieHighestWeight Layers 3–4,7,9 | TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:405, 513–557, 931, 1432 | Semisimple Verma carrier and central-character convention are supplied; reductive centre must be fixed. The stronger rootwise pinned theorem is S04, and does not require global dominance. |
| PadicLocalLanglandsForGL2Qp §0.5, earliest affine cycle owner | TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:331–345 | Covers arbitrary Noetherian A and dim Supp M≤d; A=k[ε]/ε² yields coefficient 2, and DVR closed modules vanish in degree 1. S03 should cite this owner directly. |

The four gap slugs occur with the same named suppliers and needs in packages/SpringerResolutionAndCharacteristicCycles/design/plan.json and packages/SpringerResolutionAndCharacteristicCycles/README.md. They are accepted contracts, not defects:

| Gap | Precision/minimality check and computed control |
| --- | --- |
| lie-invariants | Specifies field range, invertible-degree isogenies, regular-Borel maps and single-root-wall input; not merely “Lie theory”. SL₂ centralizer dimensions 1 and 3 separate the required loci. The characteristic-zero invariant quotient is separately supplied by F4.3. |
| associated-bundle-descent | Specifies the actual inverse-action descent datum, representation, locally direct summands, incidence and base change. Frame-torsor weights ±1 give degrees ±1; reversing the action would fail this test. Generic torsor descent and relative Spec are already imported. |
| local-geometric-comparisons | Specifies component ideals, closed point, excellence, reduced pure finite type and dimension. One nodal global component becomes two reduced completed branches, each coefficient 1; a one-branch assertion would be wrong. Generic affine cycles/completion are already imported. |
| derived-bimodule-sheaves | Specifies associative-ring actions, derived tensor/Hom/pushforward and their comparisons, beyond the commutative tensor contract. D_A¹ has ∂x−x∂=1, so replacing it by a commutative coefficient sheaf cannot satisfy the requested actions. |

Pin audit used Mathlib f6090c7095e1e56b3464c1daba5f24631f1290d2 and Tau Ceti 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a from lake-manifest.json, not the pins of the earlier reports. Verified declarations include:

- Mathlib/AlgebraicGeometry/Scheme.lean:40, `AlgebraicGeometry.Scheme`; the structure alone adds no separatedness or finite-type assumption.
- Mathlib/CategoryTheory/Limits/Shapes/Pullback/HasPullback.lean and Mathlib/AlgebraicGeometry/Pullbacks.lean: categorical pullbacks and scheme instances; these add no reducedness theorem.
- Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44: `AlgebraicCycle` abbreviates `Function.locallyFinsupp X R`, with only `[Zero R]` on coefficients; no dimension grade or rational-equivalence relation is built into that definition.
- Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean:372: `IsFinite.of_isProper_of_locallyQuasiFinite` has both properness and local quasi-finiteness.
- Mathlib/RingTheory/Length.lean:30,168: `Module.length` is ℕ∞; `length_eq_add_of_exact` includes injectivity, surjectivity and exactness. Length of k[ε]/ε² is 2, while zero has 0; infinite length cannot be silently converted to a finite coefficient.
- Mathlib/LinearAlgebra/Finsupp/LinearCombination.lean:52: `Finsupp.linearCombination`; negative coefficients allow the SL₂ inverse matrix entry −1.
- Mathlib/RingTheory/AdicCompletion/Basic.lean:171: compatible quotient families, with actual transition maps. Completeness is not automatic without further ideal hypotheses; Noetherian local applications here provide finite generation.
- Mathlib/Algebra/Category/ModuleCat/Sheaf.lean:31 and Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87: module-sheaf and derived carriers; neither is the missing D-module transfer construction.
- TauCeti/AlgebraicGeometry/FinitelyPresentedSheaf/Basic.lean:48; TauCeti/AlgebraicGeometry/Modules/TensorProduct.lean; TauCeti/Algebra/Category/ModuleCat/Sheaf/TensorProduct/Monoidal.lean and Closed.lean: coherent-O substrate and ordinary sheaf operations.
- TauCeti/Algebra/Lie/HighestWeight/Verma.lean:195: quotient of U by the Verma left ideal, under its splitting Cartan/Killing-semisimple characteristic-zero hypotheses; not a general reductive category O.
- TauCeti/Algebra/Lie/HighestWeight/Integrable.lean:119,154: actual rootwise local nilpotence and local finiteness, with irreducibility, highest-weight vector and a natural simple-coroot value retained (S04).

The resolver's missing-name lead for `IsModification.isIso_of_isFinite` is not a defect: it is explicitly a planned SchemeAndStackFoundations §4.11 export, at its main README line 5534, rather than a claimed pinned Mathlib theorem.

Mechanical dependency-check output, run on the unedited README with the specified order and movable mode:

```text
depcheck: 186 roadmaps, 1218 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The two corrected direct owners in S03 have merge positions 32 and 42, before this roadmap at 70. No target was moved during this read-only pass. The internal §9.4/§9.5 problem in S05 is finer than this roadmap-level checker.

The package-only diff has 8 files, 2403 insertions and 119 deletions, all under packages/SpringerResolutionAndCharacteristicCycles. README and docstrings contain no pull-request numbers, no algorithmic target, no `set_option`, and no `lemma` declaration. No suspicious fetched-text instruction was followed. Only this report and scratch notes were written.

## Source locator ledger

All six cited works are already in sources.toml and legally available in the supplied extraction cache; no new source key or missing-reference request was needed. Source statements are used with the hypotheses and corrections below, not copied. The following tally lists 29 individually reconciled core named locators; surrounding sections and proof passages were also read, including BHS19 §§2.1–2.5 and the extra M23 operations/regularity locators.

| Source | Core named locators counted | Extraction witnesses and qualification |
| --- | --- | --- |
| BHS19 (9) | Lemma 2.3.2; Proposition 2.3.3; Proposition 2.4.6; Theorem 2.4.7; Lemma 2.4.8; Lemma 2.5.2; Proposition 2.5.3; Lemma 2.5.5; Corollary 2.5.6 | BHS19 lines 645–717, 927–1061, 1098–1190. Correct local flatness, root conventions, KL indices, parabolic saturation and completed generic lengths as documented above. This source does not supply an independent proof of KL multiplicities. |
| BR12 (6) | Theorem 2.2.1; Theorem 2.4.1; Proposition 2.6.7; Proposition 2.8.1; Remark 2.11.1; Proposition 2.14.2 | BR12 lines 974–983, 1116–1141, 1346, 1413–1455, 1618–1625, 1700–1730. Inverse labels and reversed convolution order must both be transported. The localisation sign failure is S01. |
| M23 (10) | Theorem 2.11; Theorem 2.21; Corollary 2.22; Propositions 3.24,3.25,3.33; Definition 6.40; Propositions 6.41,6.42; Example 6.11 | M23 lines 218–300, 371–397, 754–859, 2226–2260, 2728–2779. Generic-length independence really is all-component; exact additivity is restricted to holonomic modules. Also inspected the cited duality, Kashiwara, intermediate-extension and regularity passages. |
| G98 (1) | Definition 1.1.12 | G98 lines 170–207: support convention usable, reduced-component rank not the needed multiplicity. Also read the bibliographic §§2.1 and 4.1 at G98 lines 1059–1142 and 2825–2868; these use complex varieties, and the arbitrary-coefficient-module almost-commutativity exercise fails as noted below. Earlier multiplicity correction retained. |
| ElliottBB (2) | Theorems 1 and 2 | ElliottBB lines 174–312: actual sections/localisation route, with semisimple algebraically closed hypotheses and character normalization separated from the package's reductive extension. Coherent twists, not a uniform quasi-coherent Serre bound. |
| EH18 (1) | Definition 4.10 | EH18 lines 1725–1740 and chapter field assumptions: strong versus weak equivariance over the algebraically closed characteristic-zero field. The package explicitly owns the arbitrary-field extension. |

## Verified sound

Read 1556 README lines and all 38 Suggested.lean lines; 69 numbered target blocks, 0 Lean declarations, and all 15 docstring headline groups. Reconciled all 11 earlier findings: 10 repaired and one explicitly settled but unrepaired (pass a F04). Recorded 29 core named source locators across six works and 13 supplier citation groups, with the limits stated in the ledger. Read all 222 Check bullets inside the numbered sections and the 9 convention/associated-bundle bullets; their repeated numerical examples are consolidated in the computation table, not counted as independent evidence.

The discriminating tests preserve the corrected partial-flag saturation, inverse Weyl coordinates, signed conormal moment map, finite generic lengths, strict characteristic-zero centre, holonomic-only additivity, and all completed branches. Zero module, trivial group, torus, ranks one and two, nonabelian S₃, dual numbers, small positive characteristics, identity maps, empty support and a formal node are explicitly distinguished. Inseparable field extension is not silently used to infer geometric reducedness from reducedness; the relevant characteristic-zero completion/regularity tests use separability. Schemes outside finite-type/separated hypotheses and non-split groups are not admitted as instances of those targets. The four declared supplier gaps remain conditional contracts.

## Not verifiable

- Pass a F04 remains without an independent KL multiplicity proof route. The previous repair explicitly classed its ownership/order decision as outside this package; the cited later owners occur at positions 117 and 178, versus this roadmap at 70. This review does not certify that route or re-raise the settled finding. The completed KL identity is correspondingly conditional on the missing proof decision.
- No Lean elaboration was run, as required by the read-only brief. There are no named declarations for the requested `#check @name` audit, so there is no uninspected elaborated signature.
- This is a source and adversarial-instance audit, not a formal proof of the new general-field descent, top Borel–Moore convolution comparison or positive-characteristic localisation development. Their construction targets remain substantial work. “Certified” source-cache status certifies neither these extensions nor the package's transport conventions.
- Open-work ownership was searched by object using the supplied heads, main, board packages and the roadmap index. Unprovided open heads were not read or accepted as suppliers. An index hit such as GroupSchemesOverABase is not a verified ownership overlap without its authorized text; ownership against such unprovided heads is not checked.
- No inaccessible source was represented as read, and no settled manifest key was reopened. No new legal-text request is outstanding.

## Source issues

- **Misprint** in BHS19 at §2.1, printed p. 309 (BHS19 line 459): the source says the Coxeter-number bound is the definition of good characteristic; it should be an explicit stronger characteristic assumption; affects nothing.
- **Misprint** in BHS19 at proof of Proposition 2.2.5, printed p. 313 (BHS19 line 578): the source says the cited numbered result is a lemma; it should be Proposition 2.2.1; affects nothing.
- **Error** in BHS19 at Lemma 2.3.2, printed p. 315 (BHS19 lines 665–673): the source says global dimension and fibre equidimensionality suffice for flatness; it should be the local dimension equality at every relevant source point; affects a stated result.
- **Gap** in BHS19 at proof of Proposition 2.3.3, printed p. 316 (BHS19 lines 705–707): the source says flatness and the CM special fibre give CM throughout the model; it should be supplemented by the scaling and projective-flag specialization argument controlling generic-fibre points; affects the proof.
- **Misprint** in BHS19 at equation (2.15), printed p. 322 (BHS19 lines 934–936): the source says the operator stays unchanged while the first flag is normalized; it should be conjugated by the same inverse representative used to normalize that flag; affects the proof.
- **Error** in BHS19 at Theorem 2.4.7(ii), printed p. 323 (BHS19 line 1001): the source says the multiplicity polynomial uses unprefixed Weyl labels; it should be evaluated with both longest-element prefixes in this indexing; affects a stated result.
- **Error** in BHS19 at Lemma 2.4.8 and Remark 2.4.9, printed p. 324 (BHS19 lines 1025–1061): the source says the standard parabolic preserves the cycle by left translation of only the first flag; it should be saturation under refinement over the partial first flag, equivalently parabolic stability on the base-flag slice; affects a stated result.
- **Misprint** in BHS19 at proof of Lemma 2.4.8, printed p. 324 (BHS19 line 1040): the source says the cotangent product is the product of Grothendieck resolutions; it should be the product of Springer resolutions; affects the proof.
- **Misprint** in BHS19 at proof of Lemma 2.5.2, printed p. 326 (BHS19 line 1107): the source says the generic Cartan-graph point is regarded in the incidence-space completion; it should be regarded in the Cartan-fibre-product completion; affects the proof.
- **Error** in G98 at Definition 1.1.12 and Theorem 1.1.13, printed pp. 5–6 (G98 lines 191–204): the source says reduced-component generic rank supplies characteristic multiplicity independently of filtration; it should be localized module length before reducing the module; affects a stated result.
- **Misprint** in M23 at Theorem 2.11 and its proof, printed pp. 3–4 (M23 lines 227,285): the source says the order-filtration inclusions run downwards; it should be the increasing inclusions consistent with the order bound; affects a stated result.
- **Misprint** in M23 at proof of Theorem 5.5, printed pp. 35–36 (M23 lines 1726–1729): the source says termwise ordinary biduality holds for bounded complexes of finitely generated modules; it should be bounded complexes of finitely generated projective modules; affects the proof.
- **Misprint** in M23 at Example 6.11, printed p. 45 (M23 line 2229): the source says the input of pullback along X→Y is a left D_X-module; it should be a left D_Y-module; affects a stated result.
- **Misprint** in M23 at proof of Proposition 6.24, printed pp. 50–51 (M23 line 2500): the source says the quotient by a normal coordinate computes Tor₁; it should be Tor₀, with Tor₁ the kernel; affects the proof.
- **Error** in M23 at Example 7.27, printed p. 93 (M23 line 4792): the source says every submodule of the DVR fraction field is generated by a power of the uniformizer; it should restrict to nonzero finitely generated lattices; affects the proof.
- **Misprint** in M23 at Example 7.28, printed pp. 93–94 (M23 lines 4800,4809): the source says the residue contribution lacks the section's scalar factor; it should multiply that scalar by the residue coefficient, making the connection vanish at zero; affects a stated result.
- **Misprint** in ElliottBB at footnote 11, printed p. 6 (ElliottBB lines 198–203): the source says the cotangent fibre is the dual of the Borel algebra; it should be the annihilator of the Borel, equivalently the dual of its quotient in g; affects the proof.
- **Error** in ElliottBB at footnote 12 and §4, printed p. 9 (ElliottBB lines 290–299): the source says Serre vanishing applies uniformly to a quasi-coherent module after sufficient twisting; it should apply to each coherent submodule before filtered-colimit arguments; affects the proof.
- **Misprint** in ElliottBB at §4, printed p. 10 (ElliottBB line 312): the source says the final selected weight is λ₁ without defining it; it should use the previously chosen weight ν₁; affects the proof.
- **Error** in G98 at Exercise 2.1.13, printed p. 24 (G98 line 1135): the source says differential endomorphisms of any module form an almost-commutative filtered ring; it should restrict this claim, since for M=A² the order-zero matrix algebra already has nonzero commutators; affects a stated result.
- **Gap** in G98 at §2.1.4, printed p. 23 (G98 lines 1079–1083): the source says differentiating an arbitrary monic equation uniquely determines the lifted derivative; it should use formal étaleness or an equation with invertible derivative, since a squared relation gives no such determination; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "4f98d3f6c284d32b58469e41b8c7e7ae3f93af81", "job": "RT-SpringerResolutionAndCharacteristicCycles~2a", "model": "gpt-6-astra", "worker": "chris-30"} -->
