<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13121#issuecomment-6783571585 -->
Review (codex) of 6260ce2

Verdict: needs_changes

1. **F01** (P1) The absolute prismatic example of ℤ_p is incorrect

   **Location.** `packages/RefinedTraceMethodsPartII/README.md:703`, first Check of §8.2: “Δ̂_{ℤ_p} = ℤ_p with φ = id”.

   **Claim.** The absolute Nygaard-completed prismatic object of ℤ_p is the scalar ring with identity Frobenius.

   **Witness.** PrismaticCohomologyPartII, pull request 1065, `TauCetiRoadmap/PrismaticCohomologyPartII/README.md:1350`: Frobenius on Δ_{ℤ_p} has cofibre ℤ_p[−1]. Nygaard completeness follows at line 1309. Identity Frobenius instead has zero cofibre.

   **Repair.** Change this Check to A=ℤ_p, R=𝔽_p, with Δ̂_{𝔽_p}=ℤ_p and φ=id. Its weight-zero syntomic fibre is ℤ_p⊕ℤ_p[−1], matching étale cohomology of Spec 𝔽_p. Keep the abstract unit-package example at line 706 separately. Add the negative control that φ on Δ̂_{ℤ_p} is not invertible, citing the existing supplier §§4.29 and 4.31. The repaired 𝔽_p example has cofibre(φ)=0; the excluded ℤ_p model would give 0 where the actual cofibre has H¹=ℤ_p. The syntomic answer displayed for ℤ_p is not itself refuted; the claimed prismatic object and the argument for that answer are.

2. **F02** (P1) The additive exponent is p^j, not j

   **Location.** `packages/RefinedTraceMethodsPartII/README.md:48`: “j = ⌈n/e⌉ (the exponent of the additive group of R)”.

   **Claim.** For R=O_K/ϖ^n the additive-group exponent is ⌈n/e⌉.

   **Witness.** For R=ℤ/4, p=2,e=1,n=2 gives j=2, but 2·1=2≠0 and 4·1=0. The additive exponent is 4. For 𝔽₂ the asserted exponent is 1 instead of 2.

   **Repair.** Say “Put j=⌈n/e⌉, so the additive group of R has exponent p^j; equivalently j is the least positive integer with p^jR=0.” Keep j, [j]_p and every subsequent bound unchanged. Add ℤ/4 as the distinguishing Check. Verification: p^j=4 for ℤ/4 and p^j=2 for 𝔽₂. More generally p^j has ϖ-valuation ej≥n, while e(j−1)<n, proving both annihilation and minimality.

3. **F03** (P3) Local section references were not updated after renumbering

   **Location.** `packages/RefinedTraceMethodsPartII/README.md:786`: “explicit W(k)-basis (Layer 9, §9.5)”. Also `packages/RefinedTraceMethodsPartII/sources.toml:58`, 78, 114, 238 and 256, whose cited_for arrays retain “4.4”.

   **Claim.** The basis lives in §9.5 and the cited source applications include a present §4.4.

   **Witness.** The basis is at README lines 846–849 in §9.4. §9.5 begins at line 862 with even vanishing. Layer 4 ends at §4.3, line 490; no §4.4 exists.

   **Repair.** Change the basis cross-reference to §9.4. Update the affected source cited_for arrays to the actual applications: former normalization §4.3 is now §4.2; former relative-versus-birelative §4.4 is now §4.3; remove obsolete references to the deleted generic comparison as a local target, retaining its applications where relevant. In particular, hesselholt-axes, riggenbach-cusp and amm-perfectoid must point their former 4.4 entries to 4.3; speirs-axes must point former 4.3/4.4 to 4.2/4.3; deduplicate hn-cusp's resulting 4.2/4.3 entries. Verify that every resulting local id is a heading and that §9.4 contains both ordinary and Nygaard bases. No author-recorded manifest entry was changed by this reviewer.

Three findings: two P1 and one P3. The eleven preceding mathematical findings are repaired, with a remaining renumbering defect recorded below. The three Lean headline statements elaborate and are not padding. The Part II scope is appropriate; these defects can be repaired without redesigning it.

## Previous findings, checked first

Locations in this table are in `packages/RefinedTraceMethodsPartII/README.md`. The quotations are from the repaired package, not from source texts.

| Round-2 finding | Repaired passage and verification | Status |
| --- | --- | --- |
| R01, convergence with arbitrary E₁ coefficients | Line 293: “Suppose that THH(k) is bounded below”. The periodic rational negative control at line 302 has a ℚ summand in every relevant π₀; connective coefficients have π₀=0 in sufficiently positive weight. | Repaired |
| R02, finiteness of the second cell complex | Line 438 now requires “let B and B′ be finite pointed T-CW complexes” and specifies the residual action. The infinite ET example at line 447 gives π₀=𝔽_p versus 𝔽_p² and is excluded. | Repaired |
| R03, duplicated general birelative comparison | Line 94 imports “nil-invariance and excision of truncating invariants” from RefinedTraceMethods §4.18; lines 480 and 506 consume it. The generic construction target is gone. | Mathematical repair complete; numbering follow-through partly repaired, R03 below |
| R04, unbounded torsion examples | Lines 675–678 require “bounded p^∞-torsion” in A and R. The square-zero sum of ℤ/p^n at line 688 is excluded, whereas ℤ/p^n has bound p^n. | Repaired |
| R05, nonmultiplicative package maps | Line 693: “C_A = CAlg(G_A)” and “unital and multiplicative up to coherent homotopy”. At line 707, c=2id has c(1)=2≠1 and is excluded. | Repaired |
| R06, prism quotient and descent domain | Line 714: “R is an A/I-algebra with bounded p^∞-torsion”; lines 717–718 specify “relatively quasisyntomic δ-pairs”. The new Check has p=0 in 𝔽_p but p≠0 in ℤ_p. | Repaired |
| R07, animated base hidden in descent | Line 737: “A → B flat and R → S faithfully flat”; Scope explicitly excludes the unconstructed animated extension. The nonflat Čech example at line 748 retains Tor₁=ℤ_p as a negative control. akn-delta lines 165–170 support exactly this available ordinary-base result. | Repaired by the stated scope correction |
| R08, unspecified bases and powers | Line 847: “0 ≤ k < n”; the digit bounds, weights, Nygaard exponent and relations are explicit in lines 847–849. Line 866 gives the actual nilpotence exponents. z₀² survives at p=2,n=3; the nilpotence test gives exponents 6 and 3. | Repaired |
| R09, regular negative-K supplier | Line 129: “for every regular noetherian X”; line 494 uses SchemeKTheoryOperations. Its actual statement has the required generality. | Repaired |
| R10, unspecified filtered comparison | Line 756 specifies “at the generic fibre” and “at the special fibre” with the maps and completion; line 34 explicitly excludes the unused smooth Hodge–Tate gerbe theorem. The step-filtration fibres give A at t=1 and gr⁰=A at t=0. | Repaired by retaining the needed comparisons and deleting the unused promise |
| R11, false Rees supplier | Line 119: “the filtered derived category”; lines 699, 758 and 790 use DerivedDeRhamCohomology. Its Rees, completion and completed Day-convolution targets were opened. | Repaired |

The repair report's choices for R07 and R10 are justified: the former extension is announced, not constructed, in the cited source, and the latter unused comparison is explicitly outside scope. No settled “not actionable” finding is re-raised. Repaired patterns were searched throughout the package: coefficient connectivity, finite cells, generic trace ownership, bounded torsion, multiplicative comparison maps, quotient-algebra conditions, derived base change, numerical constraints, and filtered suppliers. The previous round's computed rows were used only for unchanged assertions; changed passages and all fifteen newly sampled targets were reviewed afresh. In particular, the previous unit-package calculation did not verify the claim about actual prismatic cohomology of ℤ_p exposed below.

## Verified sound

Read all four package files, all 40 numbered subsections in nine layers, the eleven preceding findings and repair report, both declared gaps, board index, overlap and citation leads, elaborated signatures and library-match leads. All fifteen seeded targets were checked against the readable cached sources. The table below gives computed values for the sample, headlines, repaired assertions and findings; unchanged numerical evidence was also checked against the prior review. These computations test statements and conventions; they do not purport to prove the deep spectral results.

### Principles and shape

The roadmap extends RefinedTraceMethods and specifies where the existing trace library stops. It keeps p=2, perfect algebras beyond fields, regular noetherian axes coefficients, all perfectoid truncated-polynomial coefficients, and arbitrary ramification in finite extensions of ℚ_p. The generic trace theorem is now imported. No route-specific prime restriction, computational algorithm, copied source passage, process identifier, machine path, HTML anchor, sorry'd data, `lemma` or `set_option` was found in the author files.

Indexing and cyclic cells supply Tate calculations, which supply the axes, cusp and truncated-polynomial theorems; relative filtered prismatic cohomology supplies the finite-chain-ring syntomic model. This dependency order explains the organisation rather than a source's chapter sequence. Every layer ends with Examples and Dependencies. Definition sections retain their API and at least three Checks. The theorem hypotheses, proof-route inputs and source locators were read, including the corrected clauses in Layer 8; the failures above are not excused as mere examples. Main-branch SuccessiveMinima and QuadraticCharactersAndReduction were read for house shape. No further shape or ownership repair was identified.

### Seeded source verification

Pages are the printed/preprint page markers in the cached version identified by the manifest, not inferred journal pagination. All cited works have manifest entries; sixteen entries comprise fourteen readable texts and two settled uncertified texts. No source was fetched or added. The remaining manifest problem is R03.

| Sample | Locator actually opened | Hypotheses and result |
| --- | --- | --- |
| 1.1 Cusp counting and truncation sets | hn-cusp line 20, p.1; hesselholt-cusp-polytopes Lemma 1.4 line 329, p.7, Corollary 1.6 line 386, p.8 | Positive solutions, a,b≥2 and coprimality agree. Cardinality and conductor follow with the stated normalisation. |
| 1.2 Restriction to the coprime part | hesselholt-cusp-polytopes Corollary 1.7 and proof, lines 395–410, pp.8–9 | Restriction kills the V_a and V_b images and identifies the quotient; the coefficient-independent coordinate argument gives the stated finite list of divisors. The separate length assertion requires a field. |
| 1.3 p-typical index functions | hn-cusp lines 43–61, p.2; hesselholt-axes lines 36–41, p.1 | The s/h cutoffs and a=p^u a′, p∤b convention agree, including s=0 and u=0. Arbitrary-set Witt decomposition remains the declared supplier contract. |
| 1.4 Cyclic words and axes indices | speirs-axes Definition 8 line 357, p.9; Lemma 33 line 1250, pp.30–31; Möbius inversion line 1264, p.31 | m≥1, period and orbit division agree. The d=0 extension has both sides zero. The corrected characteristic-two odd indexing agrees with the cell computation. |
| 2.4 Linear and rational splittings | speirs-axes Lemma 29 line 1128, p.28, subsequent weight components | The contracted monoid algebra and relative mixed-complex splitting agree; rational coefficients make the nonzero weight Connes multiplier invertible. |
| 3.2 Circle-orbit identity | hn-cusp Proposition 3, lines 178–213, p.5 | The adjoint representation supplies one real suspension for T/C_m; homotopy fixed and Tate shifts have the stated direction. |
| 3.3 Suspension invariance | riggenbach-double Proposition 4.2 and Corollary 4.4, lines 292–348, pp.7–8 | Even E∞ coefficients, E-module actions and the representation-dimension shift are essential. This is not a canonical trivialisation of arbitrary sphere actions. |
| 4.1 Birelative theories | hesselholt-axes lines 47–85, p.2; speirs-axes lines 110–162, pp.3–4 | Common-ideal square and total fibre agree. This is a construction of the application, not a new generic excision theorem. |
| 6.1 TC of the cusp relative to normalization | hn-cusp lines 216–393, pp.6–9 | Frobenius sends m to pm; corestriction/Verschiebung and can have the stated directions. The h cases include divisibility by b, s<u and u≤s. |
| 6.2 Cusp K-theory | hn-cusp Theorem A, lines 27–37, p.1 | Perfect 𝔽_p-algebras support the isomorphism. The package correctly restricts the length conclusion to perfect fields. |
| 7.2 Truncated-polynomial K-theory | riggenbach-trunc Theorem 1.1 line 67, p.2, Corollary 6.5 line 1279, pp.27–28; sulyma-slopes Theorem 1.1/Remark 1.3, p.2 | All perfectoid rings, p-completion, r≥1, the V_e quotient and even vanishing agree; no perfect-field-only substitute is used. |
| 8.1 δ-pairs | akn-delta Definitions 2.1–2.2, lines 296–311, p.8; boundedness lines 121–125, p.4; Definitions 9.1–9.2, lines 1838–1864, p.45 | A has δ, R need not; both torsion bounds and the relatively quasisyntomic conditions are present. Flat base changes keep ordinary δ-pairs in the stated domain. |
| 8.4 Relative syntomic complexes | akn-delta Definition 7.8/Corollary 7.10, lines 1599–1619, p.40; ordinary-base qualification lines 165–170, p.5; Corollaries 8.9–8.10 lines 1812–1836, pp.44–45 | Fibre, negative weights and left Kan extension agree. The repaired flat-base, faithfully-flat-R descent is the explicitly available version. |
| 9.1 Reduction to syntomic cohomology | akn24 Corollary 2.3 and surrounding reduction, lines 265–291, pp.6–7 | Positive p-adic K-theory is recovered through TC/syntomic cohomology; negative TC is not silently identified with negative K. |
| 9.2 Bounded syntomic cohomology | akn24 Lemma 2.8, Corollaries 2.13–2.14 and 2.16, lines 333–414, pp.8–9 | For i≥1, support window [1,in−1], cohomological degrees 1 and 2, and the boundary n=1 agree. |

The repaired material was additionally compared with akn-delta Theorem 1.2 (lines 126–170), Definition 8.1 (1701–1717), Lemma 8.5/Proposition 8.6 (1759–1786), Proposition 9.15 (2010), Definitions 10.2–10.10 (2105–2136), Corollary 10.34 (2386), Proposition 10.46/Corollary 10.47 (2583–2600); and akn24 Lemma 3.6 (670), Construction 3.21/Corollary 3.23 (883–913), Propositions 3.33–3.34 (1037–1103), Lemma 5.9/Corollary 5.10 (2131–2163). The strict finite-stage bound, filtered comparison maps, bases and denominators now agree. The first absolute ℤ_p Check remains false independently of these repairs.

### Computed adversarial table

“Pass” records the specified computations and domain checks. Negative controls show why a condition matters. There is no inference from a finite set of tests to the general theorem.

| Statement | Instances | Computed values on the two sides | Result / change |
| --- | --- | --- | --- |
| 1.1 positive counting, conductor, periodicity | (a,b)=(2,3), m=6,11,12 | ℓ=0,2,1; ℓ(m+6)=ℓ(m)+1; conductor 2=(2−1)(3−1), with t missing but t²,t³ present | Pass |
| First Lean headline, #S | (2,3),r=0,1,2; (3,5),r=1 | #S=5,11,17,26; 2#S+2=12,24,36,54, equal to (a+1)(b+1)+2rab | Pass |
| Second Lean headline, #T | Same inputs | #T=1,3,5,12; 2#T=2,6,10,24, equal to (2r+1)(a−1)(b−1) | Pass |
| Counting junk inputs | a=b=2,r=0; a=b=m=0 | Without coprimality S is infinite, ncard=0 and first LHS=2 versus RHS=9; cuspCount(0,0,0)=0 from empty intervals | Hypotheses exclude false extension |
| 1.2 Witt restriction | S={1,2,3,4},n₁=2,k=𝔽₂; n₁=1 | T={1,3}; quotient 𝔽₂² has order 4, not 8; V₁=id gives quotient 0=W_empty | Pass |
| 1.3 cusp indices | (2,3,0),p=2,m′=1,3,5; p=5,m′=1 | s(1)=3 from ℓ(1),ℓ(2),ℓ(4)=0 and ℓ(8)=1; h=1,0,0; p=5 gives h(1)=1; total length 1=#T | Pass |
| 1.3 decomposition, lengths | S={1,2,3,4},p=2 | Chains {1,2,4},{3} have lengths 3,1; sum 4=#S, giving W₃×W₁ | Pass, conditional supplier contract |
| Third Lean headline, cycle words | d=0,1,2,3; m=1,…,6 | d=0,1: 0 throughout; d=2: 0,2,0,2,0,2; d=3: 0,6,6,18,30,66, in enumeration and polynomial formula | Pass |
| 1.4 period and excluded m=0 | d=3,s=2,…,6; m=0 | Primitive orbit counts 3,2,3,6,9; (66−6−6)/6=9. Empty-word count 1 versus formula 3 at m=0 | m≥1 and orbit division necessary |
| 1.4 axes thresholds | p=2,r=1,m′=3 | t_od=1, t_ev=0 because 3≤3 but 3>2 | Pass |
| 1.5 error function / cutoff | i=2,n=2; n=1; ℤ/4 | ε supported at {1,3}, size 2=i(n−1); n=1 gives size 0; j=2,[j]₂=3,B=12 | Pass for formulas |
| Additive exponent convention | ℤ/4; 𝔽₂; ℤ/9 | j=2,1,2 but additive exponents=4,2,9; p^j=4,2,9 | Fail, R02 |
| Witt signs / V | τ(1)+τ(1) over ℤ; V₂ over 𝔽₂ | Witt coordinates (2,−1), ghosts (2,2), series 1+2t+3t²; componentwise guess gives 1+2t+4t². V₂(1)=2 mod 4, quotient ℤ/2 | Pass |
| 2.1 contracted algebra | Π₀, Π₂; zero monoid | k versus uncontracted k×k; Π₂ rank 2 versus 3; 0=1 monoid gives zero quotient | Native MonoidWithZero allows the last case; definition handles it |
| 2.2 cyclic bar and Frobenius | Π₀; free t; Π₂,weight 2 | S⁰ with identity; weight 1 maps to p; reduced weight-two H₁=ℤ/2, not zero | Pass |
| 2.3 splitting | k=𝔽_p,Π₂,weight 1 | 𝔽_p[u]⊗H_*(T₊) has rank 1 in every nonnegative degree; uncontracted extra basepoint would give rank 2 in even degrees | Pass |
| 2.3 repaired convergence | periodic Hℚ[β±¹], weights 2j+1; connective H𝔽_p | Periodic π₀ has ℚ in every weight, and ⊕ℚ misses (1,1,…) in ∏ℚ; connective π₀=0 for j>0 | Bounded-below hypothesis now excludes the failure |
| 2.4 rational linear splitting | ℚ[t],weight 2; torsion cell mod 2 | HH₀=HH₁=ℚ, B=2; HC₀=ℚ and higher HC=0 in this weight. ℤ/2 torsion cell vanishes rationally but is nonzero mod 2 | Pass |
| 2.5 word cells | xy,xyz,xxy; period-one xx | Reduced homology of xy in degrees 1,2, of xyz in 2,3; xxy=0; xx has nontrivial T/C₂ orbit model | Period-one exclusion matters |
| 2.6 cusp and truncation cells | (2,3),m=1,6; e=1 | m=1 gives H₀=H₁=ℤ; m=6 has Koszul(2,3) homology zero since gcd=1; e=1 relative complex zero | Accessible statements pass; two texts remain uncertified |
| 3.1 finite Tate | induced C_p₊; sphere unit | Induced Tate=0; integral lax unit includes ℤ_p⊗ℤ_p→ℤ_p, not an iso; completed sides both ℤ_p | Completion in package is necessary |
| 3.2 circle-orbit identity | Hℤ,m=1,p | m=1 gives ΣHℤ, π₁=ℤ; m=p circle Tate has odd groups ℤ/p and even groups 0 | Suspension agrees on both sides |
| 3.3 even E∞ suspension | E=Hℤ,λ=ℂ(1) | Shift 2; homotopy-fixed π_(2−2j)=ℤ on both sides; no connected BT action through the discrete module automorphism group {±1} | Pass in module setting |
| 3.4 perfectoid coefficient tower | R=𝔽_p,n=0,1,2 | THH at n=0 has 𝔽_p[u]; Tate π₀ at n=1,2: ℤ/p,ℤ/p²; fixed π₀: ℤ/p²,ℤ/p³; V(1)=p | Pass |
| 3.5 staircase | s=0,2; zero maps | Kernel=0,W₂(k); replacing the required isomorphisms by zero gives both kernel and cokernel ∏𝔽_p | Hypotheses discriminate |
| 3.6 cell range and finite B′ | λ=0 or dimℂλ=1; B′=S⁰∨ET₊ versus S⁰∨T₊ | Shifts=1,3. Infinite B′ gives π₀ 𝔽_p→𝔽_p²; finite replacement gives 𝔽_p→𝔽_p, extra Tate=0 | Repaired hypothesis passes |
| 4.1 birelative definitions | identity square; axes over 𝔽_p | Identity total fibre=0; axes K₁=0,K₂=𝔽_p | Pass; common-ideal identification required |
| 4.2 normalization | cusp (2,3); axes d=2 | A/c=k, B/c=k[t]/t², nil-reductions k,k; axes pairs have equal constant coefficients | Pass |
| Imported trace comparison | axes over 𝔽_p and ℚ | K₂=TC₂=𝔽_p; rational K₂=HC₁=ℚ whereas HC₂=0 | Shift correct; generic owner imported |
| 4.3 regular/perfect invariance | field; k=𝔽_p[ε]/ε² | NK(field)=0; 1+εt has inverse 1−εt and is nonconstant, so NK₁(k)≠0 | Regular/perfect hypotheses essential |
| 5.1 plane-axes TC | d=2,k=𝔽_p,q=0,1,2 | TC birelative=0,0,𝔽_p, agreeing with K | Pass |
| 5.2 regular axes headline | k=𝔽₃,q=1,…,6; k=𝔽₂,q=4 | 0,𝔽₃,0,𝔽₃²,0,ℤ/9⊕𝔽₃; at p=2,q=4: ℤ/4 rather than 𝔽₂² | Pass |
| 5.3 perfect-field axes headline | d=3,p=2,3,q=1,3,5 | 0,k²,k⁸ for both primes; printed extra characteristic-two factor would already give k² at q=1 | Corrected package formula passes |
| 5.4 rational axes headline | d=2,k=ℚ,q=4; k=ℚ(t),q=3 | K₄=ℚ; K₃=ℚ(t)dt from Ω¹, nonzero while Ω¹_(ℚ/ℚ)=0 | General coefficient dependence retained |
| 6.1 cusp TC | (2,3,1),p=5,3 | T={1,5,7}; p=5 chain lengths 2,1 give ℤ/25⊕𝔽₅; p=3 lengths 1,1,1 give 𝔽₃³ | Product/h-index computations agree |
| 6.2 cusp headline | (2,3,2),p=2,5; (2,5,0),p=3 | 𝔽₂⁵; ℤ/25⊕𝔽₅³; ℤ/9; lengths 5,5,2 equal #T | Pass |
| 6.2 field-only length | (2,5,0),k=𝔽₃×𝔽₃ | (ℤ/9)² has W(k)-length 4, versus #T=2; general Witt quotient still correct | Field restriction retained |
| 7.1 truncated cells | e=1; e=2,k=𝔽_p,weight 1 | All relative cells zero at e=1; weight 1 gives ΣTHH and π₁=𝔽_p | Pass |
| 7.2 perfectoid truncated headline | e=1; 𝔽₃,e=2,r=2; 𝔽₂,e=3,r=1,2,3 | 0; ℤ/9; ℤ/4,ℤ/8⊕ℤ/2,ℤ/16⊕(ℤ/2)²; even groups 0 | Quotient chains give the same groups |
| 8.1 bounded δ-pairs | ℤ_p→ℤ/p^n; square-zero ⊕ℤ/p^n | First has torsion bound p^n; second has elements of orders p,p²,… with no bound | Repaired definition excludes second |
| 8.1 coefficient/nonexample | A=𝔽_p; ℤ_p→ℚ_p | δ(p) would be 1 while δ(0)=0; derived p-completion of ℚ_p is 0≠ℚ_p | Distinguishes δ-ring and completeness conditions |
| 8.2 package algebra structure | c=id versus c=2id on step ℤ_p | c(1)=1 versus 2; fib(id−id)=ℤ_p⊕ℤ_p[−1] versus fib(−id)=0 | Repaired CAlg condition excludes wrong model |
| 8.2 actual ℤ_p prismatic Check | R=ℤ_p; replacement R=𝔽_p | Actual cofibre(φ) for ℤ_p is ℤ_p[−1], but claimed id gives 0; replacement 𝔽_p has actual and claimed cofibre 0 | Fail, R01 |
| 8.2 finite-stage formula | absolute 𝔽₂,i=1,j=1,3 | Syntomic=0 from invertible 2a↦a; j=3 model gives 0; printed j=1 bound gives 𝔽₂⊕𝔽₂[−1] | Package's strict bound passes |
| 8.2 Breuil–Kisin finite stage | p=2,i=1,E=z−2; j=3,2 | Map f↦zf+f² has H⁰=𝔽₂,H¹=𝔽₂²; j=3 has the same; j=2 instead has H⁰=0,H¹=𝔽₂ | Quotient and strict inequality discriminate |
| 8.2 limits and colimits | zero module package; unit algebra package | Syntomic images 0 and ℤ_p⊕ℤ_p[−1]≠0 | All module colimits versus only sifted algebra colimits |
| 8.3 prism comparison | (ℤ_p,(p)),R=𝔽_p or ℤ_p | p maps to 0 or nonzero p; first Δ=ℤ_p; second is not a quotient algebra | Repaired domain correct |
| 8.3 δ-conjugate piece | A=R=ℤ_p,i=u=0 | LΩ⁰=ℤ_p and fib(0)=ℤ_p⊕ℤ_p[−1], not just ℤ_p | Pass for Hodge–Tate cohomology, distinct from R01 |
| 8.4 syntomic degrees | R=ℤ/4,i=1; i=−1 | H¹=units p-part=ℤ/2; negative weight=0 while twisted prismatic object need not vanish | Pass |
| 8.4 descent domain | ℤ_p[[x]]→ℤ_p,R=S=𝔽_p | Derived tensor has Tor₁=ℤ_p; ordinary tensor has π₁=0 | Nonflat map excluded; W(k)→W(k)[[z]] used in §9.4 is flat |
| 8.5 filtered δ, Rees | δ(z)=0 or 1; step A; constant A | 0∈F^p but 1∉F^p; Rees(step)=A[t], fibres A at 1 and gr⁰=A at 0; completion(constant)=0 | Correct suppliers and conditions |
| 8.5 filtered base change | Breuil–Kisin pair, weight u | Both sides of special-fibre comparison W(k)z^u; generic fibre W(k)[[z]] on both sides | Repaired explicit comparison passes |
| 8.6 crystalline degeneration | ℤ/4 and 𝔽₂[z]/z² | Same graded ring 𝔽₂[z]/z²; K₃=ℤ/8 versus 𝔽₂² of orders 8 versus 4 | Only associated gradeds identified |
| 8.6 completeness | ℤ_p⟨z⟩ versus ℤ_p[[z]] | 1+z unit only in formal ring; 1+pz unit in both | Negative control correct |
| 9.1 finite-field boundary | n=1 | Positive p-completed K=0, but TC_(−1)=ℤ_p versus K_(−1)=0 | Range correct |
| 9.2 finite syntomic window headline | n=i=1; ℤ/4,i=1 | Empty [1,0] gives 0; [1,1] gives H¹=ℤ/2,H²=0 | Pass |
| 9.3 order quotient headline | ℤ/4,i=2; ℤ/8,i=3 | 8/2=4=2²; 128/2=64=2⁶ | Pass |
| 9.4 basis and finite model | p=2,n=3,s=0,weight 2; ℤ/4,i=1 | z₀² gives rank 1 (wrong digit bound would give 0); finite model ranks 1,2,1 | Explicit repaired bounds pass |
| 9.4 Nygaard basis | p=2,n=3,s=0,weight 3 | f₀ contributes rank 1; dropping k<n would also allow z₀³ and incorrectly give rank 2 | Repaired constraints discriminate |
| 9.5 intermediate powers | p=2,n=2,e=1,j=2 | z⁶=0 but z⁵≠0; z³d_N^i=0 but z²d_N^i≠0 for i≥3 | Explicit repaired exponents pass |
| 9.5 even vanishing headline | ℤ/4; n≤e | B=12, so i≥13 suffices; when j=1, B=p²n/((p−1)e) can tend to 0, giving all positive even vanishing in equal characteristic | Pass; no good-prime restriction |
| 9.6 v₁ headline | ℤ/4; n=1; e=2,n=3 | Sharp index 3=[2]₂; index 1=[1]_p; ramified case bound p+1 without a sharpness claim | Pass |
| Local locators | Basis heading; Layer 4 headings | §9.4 contains two bases, §9.5 none; 4.1,4.2,4.3 exist, 4.4 does not | Fail, R03 |

### Pinned declarations and duplication by object

Opened at the pinned libraries, not at a newer Mathlib checkout:

| Declaration / carrier | File and line | Comparison made |
| --- | --- | --- |
| MonoidWithZero | `Mathlib/Algebra/GroupWithZero/Defs.lean:125` | Absorbing-zero monoid, no commutativity or nontriviality assumption. The contracted algebra remains a new quotient. |
| MonoidAlgebra | `Mathlib/Algebra/MonoidAlgebra/Defs.lean:76` | Finitely supported functions; the basis vector at absorbing zero is not killed by this native definition. |
| finRotate | `Mathlib/Logic/Equiv/Fin/Rotate.lean:27` | Cyclic successor; at m=0 it is the empty equivalence. Matches the word theorem. |
| ArithmeticFunction.moebius_mul_coe_zeta | `Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean:177` | μ*ζ=1 provides inversion, not the cycle-colouring count itself. |
| Set.ncard | `Mathlib/Data/Set/Card.lean:643` | ENat-to-Nat cardinality gives zero for infinite sets, accounted for in the counting hypotheses. |
| WittVector / TruncatedWittVector | `Mathlib/RingTheory/WittVector/Defs.lean:52`; `Mathlib/RingTheory/WittVector/Truncated.lean:62` | ℕ-indexed and Fin-indexed p-typical coordinates; neither is the big-Witt truncation-set carrier. |
| WittVector.verschiebung / frobenius / teichmuller | `Mathlib/RingTheory/WittVector/Verschiebung.lean:109`; `Mathlib/RingTheory/WittVector/Frobenius.lean:218`; `Mathlib/RingTheory/WittVector/Teichmuller.lean:93` | Shift, Frobenius and multiplicative Teichmüller operations are imported, not rebuilt. |
| KaehlerDifferential | `Mathlib/RingTheory/Kaehler/Basic.lean:148` | Native differential module, not de Rham–Witt forms. |
| NodeAlgebra and maps | `TauCeti/RingTheory/Node/Basic.lean:37`, coord at 65, relation at 75, lift at 97 | d=2 axes quotient and its maps exist. Higher axes and K-theory do not follow from this ring carrier. |
| IsIntegralPerfectoid | `TauCeti/RingTheory/Perfectoid/Integral.lean:76` | Adic element, Frobenius surjectivity and principal θ-kernel conditions; F03 is repaired. |
| Totient candidate | `Mathlib/Data/Nat/Totient.lean:53`, 79 | Counts residues coprime to one integer; does not count cusp solutions or their truncation set. |
| Cyclically reduced free-group candidate | `Mathlib/GroupTheory/FreeGroup/CyclicallyReduced.lean:41` | Signed letters must not cancel. This differs from adjacent letters being unequal, and supplies no requested counting formula. |

Additional basic carriers were checked at `Mathlib/NumberTheory/Divisors.lean:53` (positive divisors, empty at zero), `Mathlib/Data/Finset/Card.lean:47` (multiset cardinality), `Mathlib/Algebra/Polynomial/Basic.lean:69` (finitely supported coefficients), `Mathlib/Algebra/MvPolynomial/Basic.lean:80` (additive monoid algebra), `Mathlib/RingTheory/PowerSeries/Basic.lean:57` (one-variable formal series), and `Mathlib/RingTheory/Ideal/Quotient/Defs.lean:83` (quotient ring map). These are native coefficient-ring infrastructure, not spectral K-theory. The library search found no higher K-theory spectrum, THH, TC, big-Witt truncation-set ring or syntomic complex supplying the unstatable headlines. A Grothendieck-group construction or a p-typical Witt carrier does not supply those missing theories.

Object searches used the pinned libraries, main, the supplied board index and `roadmaps grep/show` at open heads: contracted monoid algebras, cyclic bars, finite Tate comparison, cusp counts, cycle-word counts, Witt decomposition, axes/cusp/truncated-polynomial K-theory, δ-pairs, relative/filtered prismatic cohomology and Rees completion. Broad hits were narrowed to the relevant objects. The boards listed AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory on their own heads; none is silently treated as absent from this checkout. No declaration in the Lean file duplicates a pinned theorem or a read supplier's fully qualified name.

KTheoryFiniteLocalFields, pull request 1281, `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:1176` and 1204, owns classical monoid THH and the regular-characteristic-p truncated-polynomial input; it is imported here. The new perfectoid extension is distinct. RefinedTraceMethods, pull request 1493, `TauCetiRoadmap/RefinedTraceMethods/README.md:2349`, owns the general excision comparison; the duplicate is now gone. AlgebraicKTheory, pull request 1142, `TauCetiRoadmap/AlgebraicKTheory/README.md:704`, has a cusp Picard calculation, not this general higher cusp theorem. PrismaticCohomology's prism pairs, PartII's qPD pairs and PartIV's log-prism pairs do not supply cohomology relative to an arbitrary bounded δ-ring. The filtered relative construction is distinct from PartIII's filtered bundles. Generic filtered infrastructure belongs to DerivedDeRhamCohomology and is now imported. These distinctions justify this roadmap's ownership without assigning a second owner to a foundational object.

### Supplier resolution and order

Every Needs line and supplier contract was read. The current open heads, not remembered numbering, were used. Main-branch suppliers were read on main even where a separate revision exists. The table records the resolutions; each path is repository-relative.

| Supplier / version | Resolved inputs and file evidence |
| --- | --- |
| RefinedTraceMethods, pull request 1493 | §§1.2–1.4,1.9; 2.1,2.3–2.6,2.8–2.10,2.13,2.16; 4.12,4.17–4.18. `TauCetiRoadmap/RefinedTraceMethods/README.md:142`, 484, 557, 646, 804, 879, 1043, 1227, 1988, 2226, 2311; the general comparison is at 2349. |
| KTheoryFiniteLocalFields, pull request 1281 | Conventions; §§1.1–1.6,2.1,4.0,4.4,5.1,5.16–5.17; Layer 6 only as exclusion. `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:211`, 398, 638, 700, 800, 1176, 1204. |
| QWittVectors, pull request 1351 | §§1.1–1.5 and 1.4a, `TauCetiRoadmap/QWittVectors/README.md:138`, 160, 179, 203, 229, 259. `TauCetiRoadmap/QWittVectors/Suggested.lean:71` declares BigWitt.TruncationSet in its enclosing namespace, resolving the automated missing-name lead. |
| AInfCohomology, pull request 1044 | AI.0 and AI.7.2, `TauCetiRoadmap/AInfCohomology/README.md:513`, 3815, 3930: perfectoid carriers and trace coefficients. |
| CrystallineCohomology, pull request 857 | CR.2 and CR.4, `TauCetiRoadmap/CrystallineCohomology/README.md:1624`, 3638: crystalline and de Rham–Witt inputs. |
| DerivedDeRhamCohomology, pull request 868 | §§1.14–1.17 and Layers 2,5, `TauCetiRoadmap/DerivedDeRhamCohomology/README.md:671`, 710, 745, 775, 3039, 4256. This is the corrected filtered/Rees owner. |
| PrismaticCohomology, pull request 1057 | §§0.55–0.56,0.73–0.76,0.93,1.2–1.4,2.1–2.13, `TauCetiRoadmap/PrismaticCohomology/README.md:1054`, 1326, 1595, 1757, 2328, 2517: δ-ring, prism and envelope inputs. |
| PrismaticCohomologyPartII, pull request 1065 | §§3.6,3.9–3.10,3.19–3.20,3.24; 4.4–4.10,4.17–4.19,4.22–4.23,4.25,4.29,4.31, `TauCetiRoadmap/PrismaticCohomologyPartII/README.md:250`, 323, 534, 821, 1084, 1103, 1169, 1227, 1305, 1329. The actual Frobenius Check at 1350 refutes R01's package example. |
| PrismaticCohomologyPartIII, pull request 1070 | §§6.8–6.9,6.28,6.31,7.0, `TauCetiRoadmap/PrismaticCohomologyPartIII/README.md:285`, 314, 580, 637, 751: syntomic complexes and motivic TC filtration. |
| GeneralAlgebraicKTheory, pull request 1212 | §§8.1 and 10.5, `TauCetiRoadmap/GeneralAlgebraicKTheory/README.md:1574`, 2187: relative K and Bass theorem. The wrongly generalised §10.13 contract is gone. |
| SchemeKTheoryOperations, pull request 1229 | §5.2, `TauCetiRoadmap/SchemeKTheoryOperations/README.md:1816`, with regular-noetherian negative vanishing at 1826. |
| StableHomotopyKTheory, pull request 1227 | §§7.9–7.10,7.14–7.18, `TauCetiRoadmap/StableHomotopyKTheory/README.md:2457`, 2476, 2526–2558: towers, Milnor sequences and completion. |
| BordismFormalGroups, main | F6.5, `TauCetiRoadmap/BordismFormalGroups/README.md:1526`: Borel actions, norm, Tate and lax monoidal/module naturality. |
| EnhancedDerivedSheaves, main | E5:abstract.1–2 and E5:presentability.2, `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1440`, 1456, 1624: coherent monoidal/E∞ and presentability infrastructure, not the Rees owner. |

The supplied overlap facts report no conflicting head, dropped cited id or open-only revision numbering. The five nearest heads—RefinedTraceMethods (1493), PrismaticCohomology (1057), PartII (1065), PartIII (1070), PartIV (1080)—were read and compared by object. Their relevant inputs resolve, and no shared ownership or mutual supply remains. No other roadmap citation to the deleted local generic-comparison id was found by the explicit RefinedTraceMethodsPartII name search; the stale local source-manifest ids are R03, not an external merge-order defect. Open-roadmap ownership was checked using the supplied tooling and heads; no ownership claim is made about inaccessible or unprovided files outside that inventory.

Both declared gaps are precise, have the same slug in `packages/RefinedTraceMethodsPartII/design/plan.json` and the exact supplier contracts, and are not existing results at the pins or the named supplier:

- `bigwitt-ptypical-decomposition`, QWittVectors §1.5: the natural decomposition for a prime p, a ℤ_(p)-algebra and an arbitrary truncation set, with the stated F,V and restriction compatibilities. The existing comparison on p-power divisor sets is insufficient. Compatibility is part of this one natural decomposition, not a separate unrelated request.
- `perfect-homotopy-invariance`, SchemeKTheoryOperations §5.2: IK(A)→IK(A[T]) for every perfect 𝔽_p-algebra A. Regular-noetherian invariance is narrower; amm-perfectoid Proposition 5.1, line 558, p.13, supports the intended extension.

They remain supplier contracts, not findings. A future acceptance may be conditional on them; this needs-changes verdict does not label either unowned.

The prescribed dependency check completed with exactly:

```text
depcheck: 236 roadmaps, 2145 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. No merge-order or supplier file was edited.

### Headline coverage, elaboration and padding

The README's headline families are: the two cusp cardinalities and cyclic-word count; plane axes over regular noetherian 𝔽_p-algebras (§5.2); axes in affine d-space over perfect fields and ind-smooth ℚ-algebras (§§5.3–5.4); cusp K-theory (§6.2); perfectoid truncated-polynomial K-theory (§7.2); relative/filtered prismatic cohomology and degeneration (Layer 8); finite-chain-ring structure, finite free syntomic model, order quotient, even vanishing and v₁ bound (§§9.2–9.6).

All three statable counting headlines appear in `packages/RefinedTraceMethodsPartII/Suggested.lean`. Every remaining family is named in its module docstring with its missing spectral, big-Witt, de Rham–Witt or prismatic/syntomic carrier. The perfectoid predicate at the pin is acknowledged; it does not make the K-groups or big-Witt quotient statable. No weakened stand-in or omitted statable headline was found.

The prescribed `lake env lean` elaboration was run from the pinned content checkout on the package file. Exit code 0; the only warnings were the three declarations using `sorry`, at lines 61, 69 and 77. Its sole import is `import Mathlib`, so no TauCeti object-file build was needed. A scratch signature probe with `#check @name` for all six actual declarations also elaborated: both cusp theorems retain a,b≥2 and coprimality, and the word theorem retains m≥1 while allowing d=0. The three definitions have real bodies and explicit parameters. No binder disappeared. The automated seven-entry lead contains a parsing artefact; there are three definitions and three theorems.

Every sorried theorem was tested on a scratch copy with one-tactic alternatives `rfl`, `simp` with the three definitions, and `infer_instance`; all three goals remained. The exact-library-lemma candidates were compared at the pin: totient counts different objects, and cyclically reduced free groups prohibit cancellation rather than equal neighbours. Neither is an exact proof of these signatures. No other single-lemma proof was found. None of the three statements restates its definition, computes a small value or states a boundary Check. The six own identifiers—cuspCount, cuspTruncationSet, cuspCoprimeSet, ncard_cuspTruncationSet, ncard_cuspCoprimeSet and card_noCyclicRepetition—agree in README and Lean. No additional backticked own declaration is promised.

## Not verifiable

- `larsen-mixed`, used in §2.6, is settled as uncertified. Its text was not legally available in the supplied cache; its recorded locator was retained without pretending to inspect it.
- `bach-hypersurfaces`, also used in §2.6, is settled as uncertified with the same limitation. Neither source was requested again or added to a missing-text request.
- Source checks certify the manifest's cached versions. No unprovided published version was silently substituted; in particular the akn-delta v2 numbering was checked, without claiming to have opened its earlier v1.

## Source issues

- **Error** in hn-cusp at Theorem A discussion, printed p.1, line 36: the source says the quotient has the stated finite length for every perfect algebra; it should restrict that length formula to perfect fields; affects a stated result.
- **Error** in hesselholt-cusp-polytopes at Corollary 1.7, printed p.8, line 395: the source says cardinality equals module length for arbitrary commutative coefficients; it should require simple Witt-filtration factors, in particular perfect fields in this application; affects a stated result.
- **Error** in speirs-axes at Lemma 15, printed p.13, line 506: the source says the lax Tate smash comparison is an integral equivalence; it should assert the p-completed comparison used in the calculation; affects a stated result.
- **Error** in speirs-axes at Theorem 1, printed p.1, line 64, and Theorem 2, printed p.4, line 191: the source says the characteristic-two odd answer has an extra valuation product; it should have one factor per eligible odd weight and word period, with the odd-degree cutoff; affects a stated result.
- **Error** in akn-delta at Proposition 8.6, printed p.43, line 1770: the source says (p−1)j≥i suffices for the finite-stage formula; it should use the sufficient strict bound (p−1)j>pi of Lemma 8.5; affects a stated result.
- **Misprint** in hesselholt-cusp-polytopes at proof of Lemma 1.4(5), printed p.8, line 371: the source says the second summand is bit; it should be bjt, giving 16 rather than 10 at (a,b,i,j,t)=(2,3,1,2,2); affects the proof.
- **Misprint** in akn24 at proof of Proposition 3.34, printed p.25, line 1098: the source says g-generator weights have an extra factor n; it should use Σp^u e_(u,v), as the proposition states; affects the proof.
- **Misprint** in akn-delta at Remark 8.2(iii), printed p.43, line 1740: the source says C_A forms a stack in stable categories; it should say categories, since CAlg(G_A) has distinct initial unit and terminal zero; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "6260ce299891a40c89b54549c6e4e4d87898cc3e", "job": "REV-PKG-RefinedTraceMethodsPartII~3", "model": "gpt-6-astra", "worker": "chris-3"} -->
