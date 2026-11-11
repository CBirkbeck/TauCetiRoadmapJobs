<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13001#issuecomment-6782188601 -->
Review (codex) of f92c3f3

Verdict: needs_changes

1. **F01** (P2) The promised compatible systems omit coefficient places

   **Location:** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:44`, “Coefficient places `λ` … are always prime to `2N`”; :516 and :1324.

   **Claim:** §7.11 constructs weakly compatible systems, in the supplier's and BLGGT's sense, from the fibres constructed under that convention.

   **Witness:** For N=401, n=3, t=0, members at λ above 2 and 401 are absent. BLGGT14 line 2828 requires every coefficient prime; line 2833 requires de Rham members even above the bad-place set.

   **Exact repair:** Separate integral/residual constructions at λ∤2N from rational eigensummands at every finite place of M (and M⁺). Construct the latter using the rational character projector on middle cohomology, including λ|N and λ|2; construct their comparison-character avatars and twists using the all-place algebraic-character family of PotentialModularityAndCompatibleSystems §1.9. Extend the rational comparison and compatibility targets accordingly before asserting §7.11. Retain the restrictions needed by the integral forms and residual group theorems. Adding primes to S does not remove the requirement to construct those members. Do not weaken “weakly compatible” to a good-coefficient-primes substitute.

   **Repair test:** The N=401, t=0 system must now have rank-three members at 2 and 401. The 2-adic member is crystalline at good reduction; the 401-adic member is de Rham at places above 401, although those base places belong to S. Rational projectors can divide by N in M_λ even at λ|N. BCGNT25 line 2006 defines rational V for any λ, unlike the integral localization used here. The semisimplifications introduced by the previous repair remain necessary.

2. **F02** (P2) General hypersurface torsion-freeness has an earlier owner

   **Location:** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:498`, “Integral cohomology of smooth hypersurfaces is torsion-free”; :500–504.

   **Claim:** This package owns and proves the general hypersurface theorem, its positive-characteristic form and its family consequences.

   **Witness:** EtaleDualityAndPerverseSheaves, open pull request #1040, `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:4227`, §4.3(c), already supplies integral torsion-freeness for smooth complete intersections; :4230–4236 supplies families. A quadric surface has H²=ℤ_ℓ² in both statements.

   **Exact repair:** Import §4.3(c),(e) in Scope and the exact supplier contract; replace the duplicated étale/family target and its integral Lefschetz proof by that import. Repoint the consumers, including §§2.3 and 2.7. If the integral Betti formulation is needed separately, retain only its explicitly distinguished comparison corollary: finite generation, Artin comparison for every ℓ, and the supplier's torsion-freeness imply absence of all primary torsion. Treat dimension zero by the finite set of geometric points, without replanning integral weak Lefschetz.

   **Repair test:** For a smooth quadric surface this gives H²(−,ℤ_ℓ)=ℤ_ℓ² and H²(−,ℤ)=ℤ². For the Fermat quintic it supplies torsion-free middle cohomology of rank 204, so reduction modulo ℓᵏ has the needed rank. An Enriques surface is excluded by the complete-intersection hypothesis. QIAN23 Proposition 3.2 and BLGHT11 Lemma 4.1(2) establish the Dwork freeness application, not the general theorem as written here.

3. **F03** (P2) The ordinary open must retain the generic-slope locus

   **Location:** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:1360`, “take `U = T_{1,k(v)}[1/u]` pulled back”.

   **Claim:** Nonvanishing of the trace polynomial alone defines an open on which all the slopes are 0,…,n−1.

   **Witness:** Generic slopes (2,1,0) and special slopes (3/2,3/2,0) have prefixes (2,3,3) and (3/2,3,3), sum 3 and minimum 0. Only the latter has gap 3/2. BCGNT25 lines 2139–2146 retain U⊂V.

   **Exact repair:** Name the dense open V on which §7.12 gives constant generic slopes with successive gaps ≤1. Define U as the intersection of V with the pullback of T₁[1/u], on the domain of that pullback. Prove nonemptiness as the intersection of two dense opens of the irreducible parameter curve. Keep this intersection in the Checks and in uses of §7.13.

   **Repair test:** On U, s_n=0 and s_i−s_{i+1}≤1 give s_i≤n−i; equality of their sum with n(n−1)/2 forces equality term by term. The displayed special slope vector violates the gap condition and is therefore excluded. This is a witness to the omitted inference, not an assertion that this particular polygon occurs in this Dwork family. The existence theorem itself has the cited proof after this repair.

4. **F04** (P2) The second auxiliary switch uses undefined data

   **Location:** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:1561`, “Applying it again to `T(s̄_{aux,𝔭}, Sym^{nm−1}ρ̄_{A,q}|_{G_{F₅}})`”; also :1511, :1525, :1546 and :1575.

   **Claim:** §§9.7–9.11 give self-contained auxiliary-system constructions from the named earlier targets.

   **Witness:** No preceding target defines S_aux or s̄_aux; B′ is also undefined. BCGNT25 line 3318 defines S_aux as Sym^(n−1)R⊗R_aux; lines 3238 and 3248 define B and B′. Lines 3164–3165 impose HT(R)={0,m}, det(R)=ε^(−m).

   **Exact repair:** State the common input data in the roadmap's own words before their use: n≥1, m≥2, the rank-two strongly irreducible very weakly compatible R with those labelled weights and determinant, a good place v₀ and its residue prime p₀, and the preliminary CM field F₀. Define L_j=EF_j, the residual-kernel extension B of F₂(ζ_N,ζ_p,ζ_r), and B′ as its compositum with the field cut out by the chosen elliptic residual representation over F₃. After constructing R_aux, define S_aux=(Sym^(n−1)R|G_F₅)⊗R_aux, its residual member s̄_aux,𝔭, and its determinant, weights and induced Hermitian structure. Use the existing compatible-system operations, with a precise supplier citation, and add the resulting input to the second switch's Needs. Move the local-point statement after its field/prime data or make its data independent explicitly; “in the setting of the proof” cannot replace these hypotheses. Retain the final enlarged avoidance field.

   **Repair test:** At (n,m)=(3,2), tensor weights {0,2,4}+{0,1} are exactly {0,1,2,3,4,5}; at (2,3), {0,3}+{0,1,2} gives the same list. Both have rank 6 and determinant ε^(−15). This is the residual object the rank-six level torsor requires; an arbitrary rank-six residual representation, such as the trivial one, is not a replacement. ModularityAndLanglandsExtensions §2.24 already names this tensor operation in its sufficient-condition theorem; importing that operation does not import its automorphy conclusion.

5. **F05** (P2) The companion gap asks again for supplied full faithfulness

   **Location:** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:112`, “together with full faithfulness of restriction from overconvergent to convergent F-isocrystals”; the matching `curve-crystalline-companions` entry of `design/plan.json`.

   **Claim:** That full-faithfulness theorem is missing from the named supplier and must be provided as part of the gap.

   **Witness:** PadicDifferentialEquationsAndRigidCohomology, open pull request #1002, `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:8782`, §RD.5.8, states full faithfulness for smooth separated finite-type schemes, hence for the smooth curves used here.

   **Exact repair:** Narrow the same gap slug, in both README and the plan's top-level gaps entry, to the missing crystalline-companion construction with ℓ≠p and its Frobenius-polynomial comparison. Cite §§RD.3.37 and RD.5.8 for restriction and full faithfulness in the ordinary supplier contract and §7.12 Needs. Do not request or implement a second full-faithfulness theorem.

   **Repair test:** On X=𝔸¹_𝔽p with the rank-one unit F-isocrystal, the map on Frobenius-horizontal endomorphisms is K^σ→K^σ, the identity, both in the requested clause and the existing theorem. On a proper smooth curve the restriction is even an equivalence. The genuinely missing companion still has a named owner and remains a permitted conditional contract.

6. **F06** (P2) The disjointness contract drops its field tower

   **Location:** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:130`, “if `A` and `D` are linearly disjoint over `C` then `A ∩ BD = B`”.

   **Claim:** Linear disjointness alone gives the displayed intersection identity for the four named fields.

   **Witness:** Set C=D=ℚ, A=ℚ(√2), B=ℚ(√3). A and D are linearly disjoint over C, but A∩BD=ℚ≠B (degrees 1 and 2). PotentialModularityAndCompatibleSystems §2.14 explicitly assumes C⊆B⊆A and C⊆D.

   **Exact repair:** Restore the common overfield and both tower inclusions in the exact supplier contract. At §§9.1 and 9.3 identify which fields instantiate C,B,A,D when using the intersection statement. No new disjointness theorem is needed. The supplier is `TauCetiRoadmap/PotentialModularityAndCompatibleSystems/README.md:781`, §2.14, read at its available head.

   **Repair test:** The counterexample is excluded by B⊄A. For C=ℚ, B=A=ℚ(√2), D=ℚ(√3), the repaired assumptions hold, [BD:ℚ]=4 and A∩BD=B has degree 2, as asserted. With B=C the usual disjointness intersection has degree 1.

7. **F07** (P3) A cyclic-quotient Check ignores perfectness

   **Location:** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:912`, “If `gcd(N, n) = d > 1`, … could stop at a normal subgroup of index dividing `d`: the hypothesis is used”; also :907.

   **Claim:** The cyclic-cover passage from a full SL_n image can leave a nontrivial cyclic quotient because gcd(N,n)>1.

   **Witness:** n=3, N=603, l=7237 gives gcd(N,n)=3 and l≡1 mod N. SL₃(𝔽₇₂₃₇) is perfect, so every cyclic quotient has order 1, although its centre has order 3.

   **Exact repair:** Replace this Check by the distinction between central composition factors and cyclic quotients: for n>2, perfectness forces the image of the normal cyclic-cover subgroup to be the whole SL_n. Simplify this passage in the proof using the already imported `Matrix.SpecialLinearGroup.commutator_eq_top_of_three_le_card` (`TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Perfect.lean:116`). The roadmap may retain gcd(N,n)=1 where some other construction uses it; this finding does not demand removing it globally.

   **Repair test:** In the displayed gcd=3 instance the only possible cyclic quotient has order 1. A purported index-three normal subgroup would give a nontrivial abelian quotient of a perfect group. The repaired Check distinguishes those two facts.

8. **F08** (P3) The rank-two classification has no exact source locator

   **Location:** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:317`, “for (2), Dickson's classification of the subgroups of `PSL₂(𝔽_q)`”.

   **Claim:** The rank-two exception in §0.11 is supplied by an exact primary-source citation recorded in the manifest.

   **Witness:** The original manifest has no Dickson work. DICKSON01 lines 11000–11039 give the subgroup list in Chapter XII, §260, printed pp. 285–286; the README gives neither work nor section/page.

   **Exact repair:** Cite L. E. Dickson, *Linear groups, with an exposition of the Galois field theory* (1901), Chapter XII, §§249–260, especially §260, pp. 285–286, for the projective subgroup list; retain the roadmap's argument lifting the transvection-generated subgroup to SL₂ and isolating the characteristic-three exception. Add the work to References. Use the DICKSON01 entry added by the sources service, fill its bibliographic fields and replace its generic chapter locator with the precise locator above. The service's entry supplies provenance and the cached text; it does not itself repair the README citation.

   **Repair test:** The list includes the icosahedral group at q=9, whose inverse image in SL₂(𝔽₉) has order 120; the full SL₂(𝔽₉) has order 720. Thus the exceptional alternative cannot be silently discarded. At q=5 that inverse image is the ordinary SL₂(𝔽₅) case. The dimension-greater-than-two classification remains ZS76's settled uncertified citation, corroborated by the two read applications.

9. **F09** (P2) The fundamental-character convention omits ramification

   **Location:** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:50`, “The direct fundamental characters … on inertia multiply to `ε̄_l`”.

   **Claim:** For the characters defined by residue embeddings composed with geometric Artin inverse, their product is the cyclotomic character, without a ramification restriction.

   **Witness:** CEGS lines 204–206 and 225–230 include absolute ramification index e: ∏ω_τ^e=ε̄. For K=ℚ₅(√5), e=2, f=1, an inertia element with ω=2 has ε̄=4, not 2.

   **Exact repair:** State the general formula with e for a finite K/ℚ_l and residue embeddings τ. Scope the two-character formula θ_τθ_cτ=ε̄_l⁻¹ to the unramified quadratic field used in §7.9; over subsequent ramified extensions use restrictions of those characters, rather than silently redefining them through the new field's Artin map. Add the ramified degree-two negative control to Conventions. Cite CEGS §1.4, pp. 5–6.

   **Repair test:** For K=ℚ₅ the formula gives 2¹=2; for K=ℚ₅(√5) it gives 2²=4. For the unramified quadratic K/ℚ₅, the two direct characters multiply to ε̄, and their inverses multiply to ε̄⁻¹ exactly as required in §7.9. The existing unramified local theorem does not need weakening.

Nine findings: seven P2 and two P3; no P1. All 18 findings from round 2 are repaired on their original witnesses. The additional findings below concern coverage, ownership, hypotheses and proof interfaces. This is a repairable Part II, not a proposal to replace the base roadmap.

The README, Suggested.lean and metadata were not changed. The sources service added one previously absent work, DICKSON01; none of the author's 19 manifest entries was rewritten. No pull request, issue, merge-order file or library was changed.

## Verified sound

### Previous findings, checked first

All locations in this table are in `packages/PotentialAutomorphyDworkMotivesPartII/README.md` unless stated otherwise. Short quotations identify the repaired passages. Each original counterexample was re-evaluated; changed passages and the rest of the package were searched for the same pattern. None of the 18 repairs was marked “not actionable in this package”, and no settled finding is re-raised.

| Round-2 finding | Repaired passage | Result and witness |
|---|---|---|
| R01 inverse spectrum | §0 overview and §0.4: “`h∞` and `h₀⁻¹`” | Repaired. diag(1/2,1/3), diag(2,4) has inverse-spectrum intersection {2}; the negative control correctly excludes it. |
| R02 diagonal factor | Mathlib contract: “a diagonal factor of determinant one”; §0.1: “`w(2)w(−1) = diag(2, 1/2)`” | Repaired. Exact rational multiplication gives diagonal (2,1/2), determinant 1. |
| R03 native SL results | Tau Ceti contract names “`closure_range_toSpecialLinearGroup_eq_top_of_field`” and both perfectness and simplicity theorems | Repaired. The five declarations were opened at the pin; no duplicate Lean theorem remains. R07 is a different remaining misuse of composition factors. |
| R04 interval formula | §1.5: “`max(0, L − \|d\|) + max(0, L + \|d\| − N)`” | Repaired. N=11,L=3,d=5 gives 0=0, and all 2660 tested odd-N cases through 41 agree. |
| R05 Fermat coefficients | §2.6: “after extension from `O⁺` to `O`” | Repaired. Fifth roots are absent from 𝔽₉× (order 8) and present in 𝔽₈₁× (order 80); the descended paired blocks have rank 2. |
| R06 symplectic determinant | §5.11: “induced by the two alternating forms” | Repaired. The induced determinant trivialization permits 1320 rank-two isometries over 𝔽₁₁; scaling it by 2 permits none. |
| R07 large image | §9.9: “in the density-one set of PotentialAutomorphyInfrastructure §2.20”; elliptic input §2.18 of ModularityAndLanglandsExtensions | Repaired. Irreducible monomial image order 72 versus SL₂(𝔽₇) order 336 remains the separating Check. Both stronger suppliers exist. |
| R08 Dwork ownership | Scope: “the Dwork eigenrealization … (§2.9)” and “the … semistable models … (§2.10)”; §8.1 verifies the imported criterion | Repaired. Former §§8.1–8.4,8.6 and the duplicated §6.8 construction are gone. Integral-family/comparison refinements are distinguished. The removed equivariant-model gap is absent. R02 concerns a separate general cohomology object. |
| R09 slope scale | §7.12: “`v(p) = 1`”; “over the prime field” | Repaired, also propagated into §7.13. Eigenvalues 1,p² over 𝔽p² give normalized slopes 0,1, not 0,2. R03 concerns loss of the open, not the normalization. |
| R10 semisimplification | §7.11: “the semisimplifications `{V^{ss}_{t,λ}}`”; §9.10: “`R_aux = {W^{ss}_{t,λ}}`” | Repaired. J₂ and I₂ have the same polynomial (X−1)² but different semisimplicity. R01 concerns the missing coefficient members. |
| R11 reduction of roots | §4.7: “`ζ₁₅` modulo a prime over `3` has order `5`” | Repaired. The prime-to-3 part survives; ζ₉ has order 1 after reduction. |
| R12 residue cardinality | §6.3 uses “`q = 5^42`” | Repaired. ord₃₀₁(5)=42 and q=227373675443232059478759765625; ord₃₀₁(3)=42 with 3²¹=−1. |
| R13 determinant nontriviality | §5.9 makes the order of the cyclotomic image explicit | Repaired. At n=3,l=7 its −3 power has order 2 over ℚ(ζ₄₀₁) and order 1 after adjoining ζ₇. |
| R14 ramified base-change Check | The old “`x = S²`” obstruction was deleted with the duplicated semistable-model target | Repaired. That total space is regular of dimension 1, so it is no longer used as a singularity witness. |
| R15 restriction of irreducibility | §3.6: “the standard two-dimensional representation of `S₃`” restricted to A₃ | Repaired. Constituent dimensions [2] become [1,1], with character −1 on a 3-cycle. |
| R16 new modulus, new prime | Layer 9 example: “The auxiliary prime must then be chosen anew” | Repaired. 3208=8·401 has odd divisors only 1,401; 3209≡2 mod 3. |
| R17 pagination | §§3.3,4.2–4.4 cite “pp. 30–31” or the proof on “p. 31”; §§2.2,2.7 cite “p. 28” | Repaired against printed footers. Statement and proof pages are no longer conflated. |
| R18 invented companion names | Contract cites “§2.46” and “§2.60” descriptively | Repaired. The three unsupported prospective names are absent; the rank-two pinned companion is separately identified. |

### Principles, shape and scope

All 83 numbered targets, their API/Checks, all 83 Needs lines, ten layer summaries and dependencies, supplier contracts, conventions and downstream statements were read. Every numbered target has at least three Checks; every layer has Examples and Dependencies. The organization runs from finite-group and geometric inputs to monodromy, determinants, local realizations and switches. Its order is explained by these dependencies; no layer is named for a source chapter and no sentence says to follow a source's exposition. The base PotentialAutomorphyInfrastructure boundary is stated in the introduction.

The general-library principle fails at R01 and the single-owner principle at R02/R05. No computational algorithm, copied source passage, route-specific replacement of a general classification, forbidden supplier, upward edge, sorry'd data or `set_option` was found. The exceptions to complete hypotheses, interfaces and source locations are identified in the findings above. Definitions distinguish actual constructions from notation; mathematical symbols such as W and R_aux are not prospective Lean declaration names. The ten declared Lean names are all discussed in the README. The source passages consulted were used as evidence, not instructions.

The three gap slugs agree exactly between README and the plan's top-level gaps. Each names an earlier supplier. Tame specialization and the general-level modular-curve integral/monodromy interface remain explicit contracts, not claims that missing objects already exist. For the modular-curve gap, ModularityAndLanglandsExtensions §2.23 already supplies the prime-level number-field curve and universal family, but not the entire general-integer-level integral and monodromy contract. R05 identifies the fully supplied component of the companion gap; the absence of the companion itself is not a finding.

### Computed adversarial evidence

The following is the requested report table: it covers the seeded targets, all Lean headlines, the changed patterns, and every finding. For unchanged passages already carrying numerical rows in round 2, those rows were used as evidence only after checking that the statement and hypotheses remain the same. Other passages were read afresh. Computations below are finite checks and counterexample tests, not claimed proofs of the large monodromy theorems.

| Statement | Instances tried and values computed on both sides | Result / change |
|---|---|---|
| §0.1 transvection and diagonal factor | E₁₂(1)−I has rank 1, square 0 and determinant 1; I−I has rank 0. w(2)w(−1)=diag(2,1/2), determinant 1. | Nonidentity condition and native factorization agree. |
| §0.2 sampled companion displacement | C((X−1)²)=[[0,−1],[1,2]], inverse [[2,1],[−1,0]]. For q=(X−2)(X−4), C(q)C(p)⁻¹−I=[[7,0],[−4,0]], rank 1. p=q gives 0, rank 0. | First-column convention, distinctness and invertibility pass. |
| §§0.3–0.4 Levelt order | diag(1/2,1/3)·diag(1,3/4)·diag(2,4)=I; inverse spectra intersect at 2. For n=1, middle factor βα⁻¹ differs from 1 exactly when α≠β. For n=0, p=q=1 and GL₀={1}. | Repaired convention and empty rank handled. |
| §0.5 sampled finite unitary groups | In 𝔽₉/𝔽₃, exhaustive 2×2 enumeration gives #U₂=96 and #SU₂=24; #μ₄=4, and 96/24=4. diag(i,1) is unitary with determinant i≠1. At n=1, U₁=μ₄ and SU₁={1}. | Multiplier kernel U and determinant kernel SU are distinguished. |
| §§0.6–0.8 forms | i²=−1 in 𝔽₉: B(1,i)=−i, B(i,1)=i, c(−i)=i. Norm(i)=1, Norm(1+i)=2. Bilinear xy gives i instead of −i. In 𝔽₄/𝔽₂, Tr(ω)=1, Norm(ω)=1. | Slots, conjugation, trace-zero scaling and finite-field hypothesis pass. |
| §0.9 small classical groups | #SL₂(𝔽₃)=24, abelianization order 3; #PSL₃(𝔽₃)=5616. The n≥3 or q≥4 native ranges exclude precisely the odd-characteristic (2,3) exception. | Imported ranges correct. |
| §0.11 sampled classification | Exceptional inverse image of A₅ has order 120 inside SL₂(𝔽₉) of order 720. Upper unitriangular 3×3 matrices preserve a line of dimension 1<3. | Exceptional/reducible models separated; locator needs R08. |
| §§1.1,1.4 sampled indices | qianIndexSet(401,3)={1,2,398}: size 3, sum 401≡0. selfDualIndexSet(5,2)={2,3}: size 2, sum 5≡0. For (7,4), {2,3,4,5} sums to 14≡0. | Real Lean definitions agree on valid inputs; large-N bounds exclude truncated ranges. |
| §1.4 zero-shaped definition | N=3,n=2,a=(0,0,0): zero multiplicity 3=n+1, B={1,2}. N=5,a=(1,2,2,0,0): B={1,2}, but repeated nonzero 2 fails zero-shaped injectivity. N=1,n=0,a=(0): B=∅. | Rank and extra zero-shaped laws distinguish the wrong datum. |
| §1.5 repaired interval | N=11,L=3,d=5: actual overlap 0, repaired formula 0, former formula −2. d=1: overlap 2=L−1. All 2660 odd-N cases N≤41 agree. | Repaired throughout. |
| §§2.1,2.7 Fermat ranks | All-nonzero zero-sum triples mod 3 number 2; length-five vectors mod 5 number 204=(4⁵−4)/5. Fermat cubic grades are 0 and 1. | Rank and inverse-action conventions agree. |
| §2.2 sampled torsion-freeness | Smooth cubic H¹=ℤ²; quadric H²=ℤ², hence zero torsion. Enriques H² has ℤ/2 torsion and is outside the hypersurface domain. | Mathematics passes; earlier owner gives R02. |
| §§2.3–2.6 coefficients and pairing | For N=5,l=3, [𝔽₃(ζ₅):𝔽₃]=4 and real residue degree=2; 5∤8 and 5∣80. Cup target twist=2−N=−3. A split pair of eigenlines has dimension 2 over full coefficients. | Scalar extension and descent distinguished after repair. |
| §§4.2–4.3 local eigenvalues | N=401,n=3: exponents 1,2,398 give determinant ζ⁴⁰¹=1 and no eigenvalue 1. [[1,1],[0,1]] has rank(T−1)=1, determinant 1; identity has rank 0. | Coprimality supplies nontriviality beyond Picard–Lefschetz. |
| §§4.4–4.6 sampled infinity and headline | J₃−I has successive ranks 2,1,0; I₃−I gives 0,0,0. In characteristic 3, J₃³=I while nilpotence index remains 3. | Characteristic polynomial alone is not maximal unipotence; the cyclic/minimal-polynomial input is present. |
| §5.1 Lean SL headline | N=401,n=3,l=5: ord₄₀₁(5)=25, so −1 is absent; both generator determinants are 1. n=2 fails 2<n. | Hypotheses match QIAN23; this does not enumerate SL₃(𝔽₅²⁵). |
| §5.2 Lean Sp headline | N=7,n=4: B={2,3,4,5}=−B, sum 14 and determinant 1. Rank 2 gives m=1, excluded by 1<m. | Real trace-field and dimension conditions retained. |
| §5.3 Lean SU headline | N=401,l=3: order 400 and 3²⁰⁰≡400=−1. Small model SU₃(3) has order 6048 versus U₃(3) order 24192. diag(i,1,1) is unitary but has determinant i. | Involution and determinant conditions exclude the larger wrong group. |
| §5.4 Lean product headline | N=401,l₁=5,l₂=3209: residue degrees 25,1, distinct characteristics and max=3209>10. Same-factor diagonal has #H rather than (#H)² elements. | Distinct-simple-quotient hypothesis is essential. |
| §5.5 cyclic cover (R07) | N=603,n=3,l=7237: gcd=3, l mod N=1, centre order gcd(3,7236)=3, abelianization order 1. | The claimed nontrivial cyclic obstruction is unavailable; replace Check. |
| §5.6 exceptional rank two | Prior computed enumeration: SL₂(𝔽₅) has 120 elements, 20 of order 3; products of two such elements have orders {1,3,4,6,10}. The stated 𝔽₉ pair has closure order 720. | Unchanged row from round 2; exceptional-case repair preserved. |
| §5.7 sampled residual pairing | N=401,n=3: 2−N=−399, n+1−N=−397, difference −2=1−n. In 𝔽₉, η=i and B(x,y)=i·x·y³ give B(1,1)=i with trace 0; ηB(1,1)=−1. | Skew/Hermitian conversion and Tate twist agree. |
| §§5.11–5.12 torsors | n=2,N=5,l=11: #SL₂=11(121−1)=1320; induced η gives 1320 points, independent 2η gives 0. | Pfaffian determinant repair passes. |
| §6.2 Lean Gauss headline | N=3,n=2,a=(0,0,0), F=𝔽₇: g(0)=1, g(1)g(2)=7; LHS=7³=343, RHS=7²·7=343. Direct complex sums differ by <3.3×10⁻¹³. N=1,n=0 gives 1=1. | Sign, exponent and empty product pass; no division by a zero Gauss sum. |
| §6.3 sampled descent | N=301: ord₃₀₁(5)=ord₃₀₁(3)=42, 3²¹=−1, q=5⁴². An exponent inverting ζ₃₀₁ is odd, whereas fixing ζ₅ needs a multiple of 4. Sum of B is 0, giving character-change multiplier 1. | Descent route avoids the impossible automorphism. |
| §6.4 sampled nth-power determinant | N=5,n=2,q=11,l=3: det=q³=1331≡2 mod 3, nonsquare in 𝔽₃; in 𝔽₉, i²=2. Formula q^(N−4)·q²=q³ agrees. | Quadratic coefficient extension is needed. |
| §6.7 sampled auxiliary determinant | N=401,n=3: exponent before cancellation 594, after subtracting 3 it is 591=3·197. N=9,n=2,q=37,l′=19: det=q⁷, normalized det=q⁶=(50653)². | Correct ε sign and actual coefficient-field root condition. |
| §§6.8,7.5 rational character weights | N=401,n=3: V weight 399, Ψ weight 397, W weight 2. Twisting subtracts 397, rather than adding it. | Sign agrees; all coefficient avatars still require R01. |
| §§7.1–7.4 Hodge labels | Fermat cubic (1,1,1) gives 3/3−1=0, (2,2,2) gives 6/3−1=1. ε has weight −1 here, +1 in the suppliers; filtration jump −1 in both. | Explicit sign dictionary is consistent. |
| §7.7 sampled good reduction | n=3,f=2: φ^f valuations 0,2,4 divide by 2 to slopes 0,1,2. At t=0, tᴺ−1=−1 is a unit; at t=1 it is 0. | φ^f, good reduction and the Hodge-type slope criterion are distinguished. |
| Conventions, ramification (R09) | K=ℚ₅: e=1, ω=2 gives ε̄=2. K=ℚ₅(√5): e=2, ω=2 gives ε̄=4; the unqualified product gives 2. | Restore e and scope the two-character special case. |
| §7.9 fundamental characters | n=3: θ², θθᶜ, (θᶜ)² have determinant (θθᶜ)³=ε̄^(−3), matching 0+1+2=3. | Dual Tate-module convention would give +3 and fail. |
| §§7.10,8.1 near infinity | N_op=[[0,1],[0,0]], d=2: dN_op≠0, (dN_op)²=0, kernel dimension 1. φ=diag(1,p) gives N_opφ=pφN_op. N=5,a=(1,2,2,0,0) instead has two singleton blocks and N_op=0. | Ramification scaling and the extra maximal-block hypothesis pass. |
| §7.11 sampled compatibility (R01) | n=3: determinant q³ and monic constant term −q³; J₂ and I₂ share (X−1)². For N=401,t=0, excluded coefficient characteristics are {2,401}; required member count at these two characteristics is 2, constructed count 0. | Semisimplification repaired; all-member coverage fails. |
| §7.12 sampled slopes (R05) | Kummer extension at an 𝔽p²-point: valuations (0,2), absolute degree 2, slopes (0,1), gap 1. Scale v(p)=2 or relative degree 1 gives (0,2), gap 2. Decomposable 1⊕ℚ_l(−2) has gap 2. | Normalization and indecomposability are necessary; supplied full faithfulness should be imported. |
| Companion-gap overlap (R05) | Unit F-isocrystal on 𝔸¹: horizontal Frobenius endomorphisms are K^σ on both sides; restriction acts as 1 on each scalar. | Existing §RD.5.8 supplies exactly this map, in general. |
| §7.13 generic open (R03) | (2,1,0) vs (3/2,3/2,0): equal total 3, equal minimum 0, specialized prefixes ≤ generic, but gaps (1,1) vs (0,3/2). | Trace unit alone does not supply the gap bound; intersect V. |
| §§9.1,9.3 tower contract (R06) | C=D=ℚ,A=ℚ√2,B=ℚ√3 gives [A∩BD:ℚ]=1 versus [B:ℚ]=2. With B=A, both degrees are 2. | Restore C⊆B⊆A. |
| §9.3 sampled switch | v_l(1/l)=−1; v_l′(l′)=1. A CM field of degree 2d contributes d complex factors to the real Weil restriction. F′∩a field containing F has degree at least [F:ℚ]>1. | Local signs and corrected K-disjointness pass. |
| §9.4 self-dual switch | Rank-two complex conjugation diag(1,−1) has multiplier −1, determinant −1 and eigenspace dimensions 1,1. | Real-point requirement and induced determinant agree. |
| §9.5 sampled finite constancy | Kummer cover y²=t over ℚ₅ at t=1: on 1+5ℤ₅ the square class is 1 and fibre is split (two points); t=2 has nontrivial square class. For f=y²−t at (1,1), derivative 2 is a unit. | A genuine neighbourhood, not all parameters; finite intersection handles finitely many levels. |
| §§9.7–9.10 auxiliary definitions (R04) | (n,m)=(3,2): {0,2,4}+{0,1}={0,…,5}; (2,3): {0,3}+{0,1,2}={0,…,5}; sum 15, rank 6. Trivial rank-six representation has determinant 1 instead of ε^(−15). | Define S_aux and its actual tensor structure. |
| §9.9 image input | Monomial normalizer in GL₂(𝔽₇) has order 2·6²=72; SL₂ has order 7·48=336. | Stronger imported image theorem correctly used. |
| §9.11 rank-two level | At cyclotomic value 2 mod 5, det A[5]=2 and det H¹=2⁻¹=3. The dual seed reverses 3 to 2. | Pairing convention passes, conditional on the named modular-curve contract and R04. |
| Layer 9 example | ord₄₀₁(5)=25 is odd, so 𝔽₂₅ is not a subfield of 𝔽₅²⁵. Odd divisors of 3208 are {1,401}. | New N requires a newly selected auxiliary prime. |

### Seeded source sample and editions

All 15 seeded targets were compared with the cached texts at the locators below. Page numbers are those of the version identified in the package: QIAN23 arXiv v1, BCGNT25 arXiv v3, DK17 arXiv v11, and the recorded BLGHT11 author copy. A source application's scope is not silently enlarged into the original classification theorem. The six settled uncertified originals are listed under Not verifiable.

| Seeded target | Text and exact locator read | Assessment |
|---|---|---|
| 0.2 Rank-one companion difference | QIAN23 line 628, Lemma 3.4 and displayed matrices, p. 14; BLGHT11 line 1174, Corollary 4.4, p. 32; HypergeometricMotives §3.4(iv) | Matrix orientation and first-column displacement verified. General field statement comes from the named supplier, not a claim that the complex source literally quantifies over every field. |
| 0.5 Finite unitary groups | BCGNT25 lines 2306–2322, Definition 4.3.1, p. 45 | Definition's multiplier-kernel misnaming is corrected: U=ker ν, SU also imposes determinant 1. The explicit-involution variant is compared with native star groups. |
| 0.11 Transvection-generated groups | QIAN23 lines 682–715, proof of Lemma 3.6, pp. 15–16; BLGHT11 lines 1182–1218, Lemma 4.6, pp. 32–33; DICKSON01 lines 11000–11039, Chapter XII §260, pp. 285–286 | Applications support the n>2 classification. The original ZS76 remains uncertified. The extra rank-two alternative is consistent with Dickson's list; R08 supplies its missing exact citation. |
| 1.4 Exponent data and index sets | QIAN23 lines 442–489, §3, pp. 10–11; BLGHT11 lines 946–973, §4, pp. 26–27 | Odd/even Qian formulas, n+1 zeros, no repeated nonzero exponent, and self-dual interval checked. The large-N and parity hypotheses prevent overlap/truncation. |
| 2.2 Integral hypersurface cohomology | QIAN23 Proposition 3.2, p. 13; BLGHT11 lines 1002–1017, Lemma 4.1(2), pp. 27–28 | Read citations give the Dwork application. General complete-intersection torsion-freeness and families are an existing supplier target: R02. |
| 4.4 Infinity unipotence | QIAN23 lines 600–623, Lemma 3.3, p. 13; BLGHT11 lines 1107–1141, Lemma 4.3 and proof, pp. 30–31; KATZ09 lines 493–500, Theorem 5.3, p. 96 | Unipotence is supported by the comparison route; one Jordan block needs the subsequent cyclic-matrix argument. The proof's corrected page 31 is right. KATZ90's cited local-monodromy theorem remains uncertified. |
| 5.7 Residual skew-Hermitian pairing | BCGNT25 lines 2359–2386, Definition 4.4.1 and following discussion, pp. 46–47 | Coefficient conjugation, sesquilinear slots and multiplier ε^(1−n) match the corrected construction. Direct calculation of the twist gives 1−n. |
| 6.3 Cyclotomic descent of Gauss products | QIAN23 lines 844–933, formulas (3.2)–(3.3), proof of Lemma 3.8, p. 18 | Product invariant under changes of additive character because the exponent sum vanishes. Pairing inverse characters supplies the self-dual case without the source's invalid automorphism choice. |
| 6.4 nth-power determinant | QIAN23 lines 764–766 and 769–933, Lemma 3.8, pp. 16–18 | Correct target subgroup is (𝔽_l²×·k(λ)×)^n; when 𝔽_l²⊂k(λ), it becomes k(λ)×^n. Square-root contribution checked in rank two. |
| 6.7 Auxiliary determinant matching | QIAN23 lines 1119–1134, §4, p. 22; formula (3.1), pp. 17–18 | Roadmap explicitly strengthens/corrects the coefficient-root argument and cyclotomic sign. Rearranged exponent is n(N−2n−1)/2, and the extra congruence is sufficient, not necessary. |
| 7.7 Good-reduction crystallinity and Frobenius | BCGNT25 lines 2074–2123, Proposition 4.2.5(2) and proof, pp. 42–43; QIAN23 Lemma 3.10(2), pp. 20–21 | Smooth proper model, character projector and twist route checked; φ^f uses the absolute residue degree. Katz–Messing original remains uncertified, with its precise earlier supplier present. All-place extension is still needed for R01. |
| 7.11 Weak compatibility | BCGNT25 lines 2086–2090, Proposition 4.2.5(3), p. 42; BLGGT14 lines 2820–2835, §5.1, p. 62 in arXiv v4 | Semisimplification repair is correct; definition quantifies over every coefficient prime, exposing R01. Arithmetic semisimplicity is not inferred from purity. |
| 7.12 Generic slopes | DK17 lines 193–245, §1.3.2 and Theorem 1.3.3, pp. 4–5; proof §5, pp. 11–12 | Absolute degree, v(p)=1, descending slopes, prefix inequality and indecomposable hypothesis agree. Curve companions are the proof input; full faithfulness has an earlier owner (R05). |
| 9.3 Qian switch | QIAN23 lines 1137–1215, Proposition 4.2 and intersections, pp. 23–24; lines 1299–1311, final proof, p. 26 | Three local conditions and avoidance construction support the geometric switch. README correctly substitutes K for the source's impossible ℚ-disjointness claim about F′. R06 restores the exact tower hypotheses in its supplier contract. |
| 9.5 Finite-level local constancy | BCGNT25 lines 3273–3292, proof of Theorem 6.2.4, p. 66 | The source uses Kisin for a stronger assertion. The finite-level result here has its own finite-étale/implicit-function proof, with the relevant supplier found. No full l-adic constancy is asserted. |

The changed or convention-sensitive passages were also compared with DMOS82 Propositions 7.4/7.6 (lines 2142–2176), BH89 Proposition 3.3/Theorem 3.5 (lines 280–315), BER10 §1.3 and Théorème 3.2.1 (lines 364–376, 626–628), CEGS §1.4 (lines 204–230), QIAN21 Theorem 1.1/Remark 1.2 and Lemma 4.2 (lines 52–59, 919–926), ACAMPO24 Proposition 2.5.7 (lines 972–983), BLGGT14 proof of Theorem 3.1.2 (lines 1951–1994), and ACC23 Lemma 7.1.8 (lines 7895–7911). CEGS's explicit ramification exponent gives R09. The source-level corrections found in this pass are recorded at the end.

### Lean acceptance, signatures and padding

From the pinned content checkout, the required `lake env lean` invocation on the package's `Suggested.lean` completed with exit code 0. Its only diagnostics were the five expected `sorry` warnings, at lines 92,111,131,150,185. No TauCeti module import required building. The file contains one `import Mathlib`, one namespace, ten explicit declarations (five definitions/structure and five theorems), no admitted examples, no sorry'd data, and no option override.

A scratch copy appended `#check @name` for all ten declarations and elaborated successfully. All field, finite, characteristic, primitive-root, generated-field, rank and character hypotheses remain in the displayed types. No section binder disappeared and no change to Suggested.lean was needed. `ZeroShapedDatum.indexSet` retains `[NeZero N]`; the Gauss theorem retains `[IsDomain R]`, exact character order, odd N and primitive additive character. In the Sp theorem, the injective algebra map transports characteristic to k; no missing `[CharP k l]` assumption is needed. The unitary automorphism is forced to be the nontrivial involution because it inverts a primitive root of odd order N>1 which generates the field.

Every admitted theorem was tested on a scratch copy with the one-tactic alternatives `simp`, `rfl`, and `infer_instance`, each required to close the entire goal. All five failed, leaving precisely the intended nontrivial goal. The near-match declarations were read at the pin for the one-library-lemma alternative: the modular-form generator-invariance lemma assumes its subgroup equality, native group instances assert only existence of a group structure, the symplectic/unitary membership lemmas only unpack definitions, and the Gauss/Jacobi identities do not state the zero-shaped product. None is an `exact` proof of a headline. No padding finding is warranted.

| README headline | Acceptance-file coverage and pin assessment |
|---|---|
| Full residual SL, Sp, SU and two-prime product, §§5.1–5.4 | Four theorems at lines 92,111,131,150. Native finite fields, matrices, characteristic polynomials and subgroup closure; no proxy predicate. |
| Gauss-sum determinant formula, §6.2 | `zeroShaped_gauss_product`, line 185; actual characters, native finite sum and the four-field exponent-data structure. |
| Katz comparison, infinity monodromy and companion model, §§3.4,4.4–4.6 | Named in the module docstring as not statable: relative cohomology eigensheaves and their monodromy carriers are absent at the pins. |
| Geometric full residual image and irreducible level torsors, §§5.5–5.12 | Named there; no étale-fundamental-group representation on these cohomological stalks or Dwork moduli torsor at the pins. |
| Hecke comparison character, §7.5 | Named there; native Hecke characters exist, but their Galois avatars and this cohomological comparison do not. |
| Consecutive Hodge–Tate weights, de Rham/crystalline/ordinary/Steinberg properties, weak compatibility and generic ordinarity, §§7.4–7.13,8.1 | Named there with the missing comparison/period realization and compatible-system carriers. Existing period-ring and isocrystal definitions do not supply those maps. R01/R03/R09 are prose defects, not reasons to insert a stand-in theorem. |
| Qian, self-dual, auxiliary and rank-two switches, §§9.3,9.4,9.10,9.11 | Named there with missing Dwork level torsors and Moret-Bailly realization. R04 repairs their mathematical input data; it does not require ad hoc Lean encodings. |

### Pinned declarations opened

Pins from `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The following file locations were read, including the native definitions' hypotheses rather than merely their names.

| Pinned file and line | Declarations / significance |
|---|---|
| `Mathlib/LinearAlgebra/Transvection/Basic.lean:56` | `LinearMap.transvection`; x↦x+f(x)v. At :138, :223, :270 the invertible transvection, transvection set and dilatransvection set; these sets include identity. |
| `Mathlib/LinearAlgebra/Transvection/Basic.lean:408` | `LinearEquiv.mem_dilatransvections_iff_finrank`; :426 characterizes transvections with fixedReduce=1, :527 is base change, :633 determinant 1+f(v), :674 determinant-one transvection. |
| `Mathlib/LinearAlgebra/Transvection/Generation.lean:487` | `mem_transvections_pow_mul_dilatransvections_of_not_isExceptional`, with its non-exceptional hypothesis. |
| `Mathlib/LinearAlgebra/Matrix/Transvection.lean:81` | `Matrix.transvection`; :143 `TransvectionStruct` requires distinct indices; :674 matrix transvection/diagonal factorization. |
| `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:70` | SL consists of determinant-one matrices; :297 centre equivalence uses roots of unity of order max(card n,1); :699 gives the SL diagonal-factor decomposition. The README's standing n≥2 avoids the empty-index centre issue. |
| `TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Transvection.lean:600` | `closure_range_toSpecialLinearGroup_eq_top_of_field`, all fields and finite index types. |
| `TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Perfect.lean:102` | `commutator_eq_top_of_four_le_natCard`; :116 `commutator_eq_top_of_three_le_card`. |
| `TauCeti/LinearAlgebra/Projectivization/PSL/Simple.lean:127` | `isSimpleGroup_of_three_le_card`; :142 `isSimpleGroup_of_four_le_natCard`, with nontrivial index type. |
| `TauCeti/LinearAlgebra/Matrix/RationalCanonicalFormFinTwo.lean:69` | `TauCeti.companionFinTwo` is [[0,−d],[1,t]], the same column convention. |
| `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:43` | GL is the units of the matrix ring; it does not express monodromy. |
| `Mathlib/LinearAlgebra/UnitaryGroup.lean:105` | `Matrix.unitaryGroup`; :117–121 membership, :278 special unitary intersection with determinant kernel, :285 `mem_specialUnitaryGroup_iff`. |
| `Mathlib/LinearAlgebra/SymplecticGroup.lean:102` | `Matrix.symplecticGroup`, `SymplecticGroup.mem_iff` (:118) and `mem_iff'` (:186): AJAᵀ=J and equivalent AᵀJA=J; :386 determinant-one consequence. None identifies a two-generator subgroup. |
| `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean:149` | `LinearMap.IsSymm` has the semilinear-first convention; :525 `SeparatingLeft` is a nondegeneracy condition, not a symmetry axiom. |
| `Mathlib/FieldTheory/Finite/GaloisField.lean:219` | `FiniteField.unitsMap_norm_surjective`; includes characteristic two. |
| `Mathlib/RingTheory/Trace/Basic.lean:519` | `Algebra.trace_surjective`, requiring finite dimension and separability. |
| `Mathlib/FieldTheory/Finite/Basic.lean:448` | `FiniteField.frobenius_pow`; :525 `ZMod.pow_totient` is on units. |
| `Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean:63` | `IsPrimitiveRoot` includes power-one and divisibility of every exponent giving one. |
| `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:227` | `Polynomial.cyclotomic`; N=0 is defined separately. `Mathlib/GroupTheory/OrderOfElement.lean:179` defines `orderOf`; finite-order hypotheses prevent its infinite-order zero value entering modulus arguments. |
| `Mathlib/Data/Nat/Prime/Defs.lean:403` | `Nat.exists_prime_and_dvd`, hypothesis n≠1. |
| `Mathlib/GroupTheory/Goursat.lean:131` | `Subgroup.goursat`, with normal kernels and isomorphic quotients, not a product theorem from projections alone. |
| `Mathlib/GroupTheory/GroupAction/Iwasawa.lean:83` | `MulAction.IwasawaStructure.isSimpleGroup`; requires perfectness, faithful action and the Iwasawa data. |
| `Mathlib/RepresentationTheory/Homological/GroupCohomology/Hilbert90.lean:84` | Multiplicative Hilbert 90 for the stated Galois action. |
| `Mathlib/NumberTheory/MulChar/Basic.lean:73` | `MulChar.map_nonunit'`; in a field every character, including the trivial one, is zero at 0. |
| `Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean:60` | `AddChar.IsPrimitive`, nontriviality after each nonzero multiplicative shift. |
| `Mathlib/NumberTheory/GaussSum.lean:76` | `gaussSum` at :72, `gaussSum_mulShift` at :76; :200 `gaussSum_mul_gaussSum_eq_card`, requiring χ≠1 and primitive ψ. |
| `Mathlib/NumberTheory/JacobiSum/Basic.lean:48` | `jacobiSum`; :194 Gauss/Jacobi quotient has nonzero-cardinality and nontrivial-product hypotheses; :325 power-product identity has 0<n<orderOf χ. Neither is the zero-shaped identity. |
| `Mathlib/NumberTheory/ModularForms/Identities.lean:55` | `SlashInvariantForm.slash_action_generators` concerns invariance and assumes Γ=closure s; it is not a monodromy generation theorem. |
| `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:140` | `Matrix.charpoly`; `Matrix.rank` is finrank of the image (`Mathlib/LinearAlgebra/Matrix/Rank.lean:134`); `Mathlib/FieldTheory/Minpoly/Basic.lean:41` uses 0 for nonintegral elements. Companion cyclicity supplies integrality where used. |
| `Mathlib/LinearAlgebra/Matrix/ConjTranspose.lean:43` | Conjugate transpose is transpose followed by the supplied star. |
| `Mathlib/AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean:34` | `FundamentalGroup` as endomorphisms of the fundamental groupoid; the loop-order adapter is needed. |
| `Mathlib/Algebra/MonoidAlgebra/Defs.lean:76`, `Mathlib/Algebra/MvPolynomial/Basic.lean:80` | Native finite group algebra and polynomial carriers; no cohomological projector realization is hidden in them. |
| `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:59` | `AlgebraicGeometry.Smooth`; smoothness does not itself assert properness. |
| `Mathlib/RingTheory/Henselian.lean:154` | `IsAdicComplete.henselianRing`; the complete local ring in §9.5 has the required ideal-adic completeness. |
| `Mathlib/RingTheory/Perfectoid/BDeRham.lean:88` | `BDeRham` is a period ring, not the D_dR functor or comparison isomorphism for Dwork cohomology. |
| `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/FiniteComponent.lean:85` | Actual finite-component map; `HeckeCharacter` is the continuous character of the idele class group in Basic.lean:70. No l-adic Galois avatar or Dwork comparison was found in this carrier's files. |

Object searches covered characters, norm/trace, matrix transvections, generated subgroups, finite classical forms, companion matrices, cohomology/period realizations, finite étale carriers, compatible systems, character avatars and twists, across both pinned trees. Relevant near-matches were compared as above. The only native-generation duplication from the previous round has been removed. No kept theorem has the fully qualified name of a declaration in the libraries or the readable sibling Lean files.

### Cross-roadmap resolution, ownership and order

The board package index was read before absence claims. The named open heads were accessed through `roadmaps show` and searched by object through `roadmaps grep`; on-main roadmaps and the board packages were included. The provided overlap report has no conflicting head, dropped cited id, or id supplied only by an open revision. The closest five roadmaps were inspected; the absence of mechanical overlap flags was not treated as an ownership proof.

The citation resolver's five leads are all explained: the three `VanishingCycles` names are prospective declarations explicitly supplied by EtaleCohomologyFoundations §F.0.2 and InverseGaloisAndArithmeticFundamentalGroups §IG.0.T2, not claims about pinned Tau Ceti; `ZeroShapedDatum.indexSet` and `injOn_nonzero` are declared/generated in this package. The former “native finite étale carrier” claim has not returned.

| Supplier | Resolved section or declaration and location in its README |
|---|---|
| ClassicalArithmeticCompletion | §2.46 at :3775, §2.60 at :4188: companion carrier, determinant/minimal polynomial and characteristic polynomial. |
| HypergeometricMotives (#1716) | §§3.1,3.2,3.4 at :961,:996,:1042: companion cyclicity, triple order and field-form Levelt theorem. The roadmap's two-pair/conjugation adapters differ from the imported theorem and declare that difference. |
| EtaleCohomologyFoundations | §F.0.2 at :200, including `lisseMonodromyEquiv` at :213; arithmetic sequence §F.0.A2 :368; proper base change :504; §§F.2.4–F.2.7 at :592,:613,:645,:759; smooth-proper lissity in F.3 at :708; adic realization :979,:1041; smooth purity :1200. |
| ComplexComparisonPartII | C5.2 at :3257 and relative Betti theorem :3441; C5.3 at :3584, pure Hodge theorem :3663 and relative Hodge bundles :3683; C6.5 :5045 and C6.6 :5143. These retain finite-type/smooth/proper and finite-coefficient hypotheses as appropriate. |
| InverseGaloisAndArithmeticFundamentalGroups | IG.0.T2 :531 and IG.0.T3 :566, finite and rational trace formulas; IG.1.3 :1168, specialization and tame boundary input. |
| DeligneWeightsAndPurity | §§0.1,3.2,7.15,8.19 at :560,:1202,:2308,:2718; geometric semisimplicity does not imply arithmetic semisimplicity. |
| EtaleDualityAndPerverseSheaves (#1040) | §§0.5–0.6 at :668,:821; the additional existing complete-intersection target §4.3 gives R02. |
| LefschetzPencilsAndVanishingCycles | §§0.5,0.8a,1.1,1.6 at :544,:693,:960,:1241; §2.4 implicit-function theorem at :1761; §§2.7–2.8 at :2080,:2196. The separate tame-point gap is not confused with these supplied statements. |
| ArithmeticGaloisRepresentations | §2.4 at :1978: arithmetic Weil–Deligne adapter, with supplied exp/log and monodromy substrate. |
| PadicHodgeTheory | §§3.2–3.4,3.6 at :665,:682,:705,:754; §§6.1,6.4 at :1130,:1186; §§8.1–8.2 at :1378,:1407. Ordinary slope criteria require the prescribed Hodge type, which §7.6 supplies. |
| LocalGaloisDeformationRings | §1.7 :1380, §6.8 :3025, §6.19 :3238, §6.25 :3338. The local models have supplier-sign weights 0,−m,… and determinant ε^(−mn(n−1)/2). |
| PadicDifferentialEquationsAndRigidCohomology (#1002) | RD.2.3 :4222, RD.3.34 :6474, RD.3.43 :6767, RD.7.7 :13968. RD.5.8 :8782 also supplies the supposedly missing full faithfulness (R05). |
| SchemeAndStackFoundations | §§1.15–1.16 at :2604,:2693: torsors and twisting with the stated flatness/descent domains. |
| AbelianSchemesAndArithmeticModuli | A6.30–A6.31 at :3714,:3735: quasi-projective field cases of Weil restriction and geometric splitting. |
| AlgebraicModuliForArithmeticGeometry | §3.4 at :1683: relative Hom and Weil restriction. |
| ArithmeticGaloisDuality | R02.4.6, “Roots after prescribed totally real base change”, at :4352: roots in algebraically closed coefficients, prescribed unramifiedness and avoidance. This package's finite-field-valued refinement is additional. |
| BelyiMaps | §§5.2,5.6 at :1966,:2173: peripheral order p₁p₀p∞=1 and free group. The package conjugates the middle loop to obtain its order. |
| Chebotarev; GlobalNumberFields | Chebotarev Layer 10 density and Frobenius prime-set interface; GlobalNumberFields Layers 9–10 Hecke characters/infinity types. Neither constructs a Dwork system. |
| ModularCurves; ModularCurvesPartII | §5C at :2252; §5.14 at :1936: paired rational-field twists and compactification. The general integral/monodromy contract is separately declared. |
| PotentialModularityAndCompatibleSystems (#1075) | §§1.1,1.4,1.9,1.11 at :95,:164,:302,:334; §§2.14,2.15,2.17,2.18,2.20 at :779,:789,:823,:837,:855; §3.1 :918. R06 concerns omitted hypotheses, not a missing section. |
| ModularityAndLanglandsExtensions (#1180) | §§2.9–2.12 at :941,:962,:985,:1005; §2.14 :1044 and §2.18 :1120. These earlier Dwork inputs are imported, with refinements expressly identified. §2.23 :1186 supplies prime-level twists over number fields; §2.24 states the tensor-system sufficient-condition interface. |
| PotentialAutomorphyInfrastructure (#1081) | §2.20 at :1044 supplies crystalline density-one full residual SL₂ containment, not just irreducibility. |
| PotentialAutomorphyInfrastructurePartII (#2135) | Scope :66–67 and contract :326 consume this package's geometric switch; it does not supply the package's geometric construction. Its automorphy refinement at :1346 remains downstream. |
| EllipticCurveModularityImaginaryQuadratic (#1048) | Scope and §§0.2,5.1,5.3 distinguish prime-level elliptic seeds and image/prime-switch infrastructure from the Dwork construction. It is consumed through the earlier explicit ModularityAndLanglandsExtensions interface. |

All locations in this table are repository-relative `TauCetiRoadmap/<Supplier>/README.md` locations at the available main/head, not scratch-file line numbers. R02/R05 identify the two newly found ownership overlaps. No cycle with the downstream PotentialAutomorphyInfrastructurePartII is introduced by the repaired large-image citation to the base PotentialAutomorphyInfrastructure.

The required dependency check was run with the supplied configuration, package README, name, merge order, `--movable` and content checkout. Its complete output was:

```text
depcheck: 236 roadmaps, 2152 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This mechanical result does not certify semantic supplier coverage; that is why R02, R04, R05 and R06 still require repairs.

## Not verifiable

- LEWIS82, §4: settled uncertified original. The finite-field argument and its use in BCGNT25 Lemma 4.3.4 were read; no claim is made to have opened the original classification text.
- KM74, Theorem 2: settled uncertified original. The BCGNT25 application and PadicDifferentialEquationsAndRigidCohomology §RD.7.7 contract were checked.
- KIS99, Theorem 5.1: settled uncertified original. §9.5 uses a weaker finite-level argument checked independently; no stronger Kisin theorem was guessed.
- KATZ90, Theorems 8.4.11 and 8.12.2(1a): settled uncertified book. KATZ09 and the read Dwork papers corroborate the uses, but do not count as opening that book at those locators.
- ARTIN55, Theorem 2: settled uncertified original. The restricted application in QIAN23 Proposition 3.7 and its exceptional-order tests were checked.
- ZS76, main theorem: settled uncertified original. The n>2 applications in QIAN23 and BLGHT11 were read. The separate rank-two issue now has the legally fetched DICKSON01 source.

None of these six settled items was requested again. DICKSON01 was initially blocked by a landing-page HTTP error and an unclassified archive redirect; the sources service subsequently fetched the public-domain institutional archive scan successfully. Its extraction is readable at the required subgroup list. There is no outstanding source request. Published/preprint numbering is reported only according to the editions and crosswalks in the manifest; inaccessible originals are not silently treated as verified.

## Source issues

- **Misprint** in BCGNT25 at Definition 4.3.1, p. 45: the source says the multiplier kernel is SU; it should be U, with SU also imposing determinant one; affects a stated result.
- **Misprint** in BCGNT25 at Remark 4.3.3, p. 45: the source says a skew-Hermitian value equals its own negative conjugate without swapping arguments; it should be the value with the arguments swapped; affects a stated result.
- **Misprint** in BCGNT25 at §4.2, duality and comparison-character formulas, pp. 41–42: the source says twists and purity weights shifted by one from middle cohomological degree; it should be duality twist 2−N and comparison-character weight N−n−1; affects a stated result.
- **Gap** in BCGNT25 at Definition 4.4.1 and Proposition 4.4.2, pp. 46–47: the source says determinant and Hermitian trivializations may be specified independently; it should require compatibility of their induced determinant forms; affects a stated result.
- **Error** in BCGNT25 at Lemma 4.4.4, p. 48: the source says the cohomological residual inertia uses positive powers of the direct fundamental characters; it should use their inverses under the stated reciprocity convention; affects a stated result.
- **Misprint** in BCGNT25 at proof of Proposition 4.2.6, p. 45: the source says the final base-q digit is indexed r_d; it should be r_(d−1) in the term r_(d−1)q^(d−1); affects the proof.
- **Error** in BCGNT25 at proof of Theorem 6.2.4, p. 67: the source says the auxiliary arithmetic image is all GU_m despite its prescribed determinant; it should be the actual arithmetic image G containing SU_m, with its determinant restriction; affects a stated result.
- **Gap** in BCGNT25 at proof of Theorem 6.2.4, p. 67: the source says the second switch retains the preceding avoidance field; it should also avoid the field cut out by the new auxiliary residual representation to preserve that image; affects the proof.
- **Misprint** in BLGHT11 at proof of Lemma 4.3(2), p. 31: the source says the relevant cohomological degree is n−1; it should be N−2, the hypersurface dimension; affects the proof.
- **Gap** in BLGHT11 at the definition of the self-dual level-structure space, p. 28: the source says determinant-level data suffice for its symplectic torsor; it should require pairing-preserving level structures with their induced determinant trivialization; affects a stated result.
- **Error** in QIAN23 at proof of Lemma 3.8, p. 18: the source says an automorphism can invert the Nth roots while fixing the additive-character roots; it should use the inverse-character Gauss identity, since that automorphism need not exist; affects the proof.
- **Error** in QIAN23 at §4 determinant-root construction, p. 22: the source says n divides the residue-field multiplicative order even when l divides n; it should impose the condition on n's prime-to-l part; affects the proof.
- **Error** in QIAN23 at §4 auxiliary symmetric-power determinant, p. 22: the source says the cohomological symmetric power has positive cyclotomic determinant exponent; it should have exponent −n(n−1)/2; affects the proof.
- **Gap** in QIAN23 at §4 auxiliary root extraction, p. 22: the source says quadratic coefficient-valued nth-power information gives a root in the chosen residue field; it should establish nth-power values in that field and the required roots-of-unity condition; affects the proof.
- **Error** in QIAN23 at final proof of Theorem 1.4, p. 26: the source says F′ is disjoint over ℚ from a Galois closure containing F; it should assert this for K=L′LF^suff(ζ_N), with FK=F′; affects the proof.
- **Error** in QIAN21 at Remark 1.2, p. 2: the source says one zero exponent guarantees maximal unipotence; it should require the single-block condition, violated by (1,2,2,0,0) at N=5; affects a stated result.
- **Error** in QIAN21 at Lemma 4.2, p. 20: the source says maximal nilpotent monodromy alone forces regular ordinarity; it should include the consecutive Hodge-type hypothesis needed by the invoked criterion; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "f92c3f34d64e1f2d00bdce959912157128b99067", "job": "REV-PKG-PotentialAutomorphyDworkMotivesPartII~3", "model": "gpt-6-astra", "worker": "chris-33"} -->
