# Review of RefinedTraceMethodsPartII (package, round 2)

**Verdict:** needs changes

Eleven findings: one P1 and ten P2. The three previous findings are repaired. Suggested.lean elaborates with only its three `sorry` warnings; none of its three theorems is padding. The new findings concern mathematical scope, ownership, supplier attribution and statements left unspecified in the README. The package's overall Part II scope is appropriate and repairable.

## Previous findings, checked first

| Previous finding | Repaired passage and verification | Status |
| --- | --- | --- |
| F01, nonexistent KTheoryFiniteLocalFields §5.16a | README line 41 now says “of QWittVectors §1.4a”; line 101 imports the series groups from KTheoryFiniteLocalFields Conventions; lines 661 and 670 use QWittVectors §1.4a. All occurrences of 5.16a are gone from the package README. QWittVectors pull request 1351, `TauCetiRoadmap/QWittVectors/README.md:230`, supplies the comparison. Its value on (2,−1) is 1+2t+3t², agreeing with the repaired uses. | Repaired |
| F02, length over a nonfield | README line 161: “When k is a perfect field this is the length over W(k)”; lines 622–623 likewise restrict length to perfect fields and retain general perfect algebras for the K-theory isomorphism. For (2,5,0) and k=𝔽₃, T={1,3}, W_T(k)=ℤ/9 has length 2; for k=𝔽₃×𝔽₃ the length is 4. The perfection of 𝔽₃[t] gives infinite length already for T={1}. The Lean docstrings agree. | Repaired |
| F03, missing perfectoid predicate assertion | README line 65 now names `TauCeti.Perfectoid.IsIntegralPerfectoid p A`; Suggested.lean lines 19–20 and 30 retain the actual missing K-theory and big-Witt carriers. The class is at `TauCeti/RingTheory/Perfectoid/Integral.lean:76`. Perfect characteristic-p rings qualify; the existence of this class does not supply K-theory. | Repaired |

No previous finding was marked not actionable. No finding below re-raises a settled finding. The repaired patterns were searched throughout the README and Lean file, including every length assertion and every use of the Witt power-series comparison. For unchanged material, the earlier numerical rows were reproduced or cross-checked; prose-only assurances were not treated as evidence.

## R01 (P2) — Connectivity of the bar pieces does not suffice for arbitrary E₁ coefficients

**Location.** `packages/RefinedTraceMethodsPartII/README.md:289`, §2.3: “whose connectivity also tends to infinity”. The standing coefficient hypothesis at line 282 is every E₁-ring k.

**Claim.** Increasing connectivity of B^cy(Π;m) implies increasing connectivity of THH(k) smashed with these pieces, hence the coproduct-to-product equivalence.

**Witness.** Take k=Hℚ[β,β⁻¹], |β|=2, and Π=Π₂. For m=2j+1, the bar piece is Σ^(2j)T₊. Each π₀X_m contains ℚ; the all-ones element of the product is absent from the direct sum.

**Repair.** Add a bounded-below hypothesis on THH(k) to this convergence/product/Tate-interchange bullet, retaining the general E₁ cyclotomic splitting. A connective k is a sufficient stated case. Add the periodic example as a negative control. For k=H𝔽_p, these odd-weight pieces have bottom degree 2j, so their π₀ vanishes for j>0; for the periodic example the retract Σ^(2j)k supplies π₀=ℚ at every j. The source's application in speirs-axes Lemma 21, line 709, is to discrete coefficients; it does not prove the added nonconnective generality.

## R02 (P2) — The Frobenius cell comparison lacks a hypothesis on B′

**Location.** `packages/RefinedTraceMethodsPartII/README.md:433`, §3.6: “a finite pointed T-CW complex B of dimension N and a T-map ψ : B → B′^{C_p} that is an isomorphism”.

**Claim.** Finiteness of B alone gives the asserted high-degree Frobenius isomorphism.

**Witness.** Set R=𝔽_p, B=S⁰, N=0, and B′=S⁰∨ET₊ for a free contractible T-CW space ET. Then B′^{C_p}=S⁰, but π₀ of the asserted map is 𝔽_p→𝔽_p², inclusion into one summand.

**Repair.** Require B′ to be finite as a pointed T-CW complex as well, or require explicitly that B′/B′^{C_p} is a finite free pointed C_p-cell complex. Specify the residual T/C_p action used to identify the fixed-point domain. In speirs-trunc Lemma 8, lines 347–374, the finite free cofibre is what makes its Tate construction vanish; speirs-axes Corollary 17, lines 603–624, applies this to finite word cells. Replacing ET by the finite free circle T in the witness makes the extra Tate summand zero, giving π₀=𝔽_p→𝔽_p. Keep the infinite example as a negative control.

## R03 (P2) — The generic birelative trace theorem has an existing owner

**Location.** `packages/RefinedTraceMethodsPartII/README.md:470`, §4.2: “Prove that for every Milnor square of rings”; “Prove also nil-invariance of K^inv”.

**Claim.** This roadmap constructs the general integral and rational birelative comparison and nil-invariance.

**Witness.** RefinedTraceMethods pull request 1493, `TauCetiRoadmap/RefinedTraceMethods/README.md:2349`, §4.18, already states nil-invariance, Milnor-square excision for K^inv, and the rational HC comparison with its one-degree shift.

**Repair.** Delete these generic construction targets here and import §4.18 in Scope and the exact supplier contracts. Have §§4.3–4.4 consume that supplier directly. Retain the axes/cusp applications and their numerical Checks without a removed-target stub. The imported theorem gives K₂=𝔽_p=TC₂ in the axes example and rational K₂=HC₁=ℚ for k=ℚ; no new general comparison is needed. Calling the repeated theorem a specialization does not create a distinct mathematical object.

## R04 (P2) — The examples of bounded δ-pairs omit bounded torsion

**Location.** `packages/RefinedTraceMethodsPartII/README.md:681`, §8.1: “Prisms (A,I) with A-algebras R, and the pairs (ℤ_p, R) and (W(k), R) ... are bounded δ-pairs”.

**Claim.** These pairs are bounded for arbitrary indicated algebras R.

**Witness.** Let M=⊕_(n≥1)ℤ/p^n and R=ℤ_p⊕M with square-zero M. The pair (ℤ_p,R) has elements of exact additive order p^n for every n, so its p-power torsion has no uniform bound.

**Repair.** Require A and R to have bounded p-power torsion, including a bounded prism in the prism example. Preserve the unrestricted definition of a δ-pair separately. Add the square-zero example as a negative control. For R=ℤ/p^n, the uniform exponent p^n works; for R=ℤ_p it is vacuous; neither argument works for the displayed direct sum. This is precisely the distinction in akn-delta lines 121–125 and in the package's own definition at line 678.

## R05 (P2) — The definition of a prismatic package admits nonalgebra comparison maps

**Location.** `packages/RefinedTraceMethodsPartII/README.md:694`, §8.2: “c is a φ_A-semilinear map ... of ... filtered graded A-modules”. At line 698, C_A is instead identified with the E∞-algebras in G_A.

**Claim.** The opening quadruple description defines the latter algebra category.

**Witness.** Over A=ℤ_p take H=N=ℤ_p in grading zero with the step filtration, φ=id and c=2id. This satisfies the stated module-map condition, but c(1)=2, so c is not a unital algebra map.

**Repair.** Define G_A first and then define C_A as CAlg(G_A), or require c to be a unital multiplicative semilinear E∞-algebra map with the indicated filtered coherence. Do not leave the two descriptions inconsistent. Source: akn-delta Definition 8.1, lines 1701–1717. Under the corrected definition c=2id is excluded. It would give the weight-zero syntomic fibre fib(id−2id)=0, whereas the unit package with c=id gives ℤ_p⊕ℤ_p[−1]. Add this distinguishing Check; apply the corrected definition throughout §§8.3–8.6.

## R06 (P2) — The comparison with a prism requires an algebra over its quotient

**Location.** `packages/RefinedTraceMethodsPartII/README.md:714`, §8.3(2): “If A is a prism, Δ_{R/A} is Bhatt–Scholze's derived relative prismatic cohomology.”

**Claim.** A prism structure on A suffices, without a condition relating its ideal to A→R.

**Witness.** For (A,I)=(ℤ_p,(p)) and R=ℤ_p, p maps to p≠0. This bounded δ-pair is admitted here, but R is not an A/I-algebra, so the claimed relative-prismatic comparison has no such target.

**Repair.** State a bounded prism (A,I), an A/I-algebra R, and the resulting natural comparison, including completion conventions. akn-delta Theorem 1.2(2) uses the quotient convention introduced at line 54; PrismaticCohomology pull request 1057, `TauCetiRoadmap/PrismaticCohomology/README.md:2330`, explicitly uses animated A/I-algebras. The corrected claim applies to R=𝔽_p and gives Δ=ℤ_p; it excludes R=ℤ_p for this prism. In the same numbered list, restore the relatively-quasisyntomic domain of the descent clauses (5)–(6), as in akn-delta lines 144–147, rather than asserting those clauses without their domain.

## R07 (P2) — Unrestricted δ-pair descent uses an unbuilt animated base theory

**Location.** `packages/RefinedTraceMethodsPartII/README.md:736`, §8.4: “with no condition on A → B”. §§8.1–8.3 construct only ordinary bounded δ-ring bases.

**Claim.** The constructed functor already admits the universal-descent Čech diagrams for every base map.

**Witness.** For A=ℤ_p[[x]], δ(x)=0, B=ℤ_p, and R=S=𝔽_p, R→S is the identity. But Tor₁^A(B,B)=ℤ_p, while B⊗_A B has Tor degree one zero. The derived Čech base is not ordinary.

**Repair.** Preserve the general descent target by adding the animated δ-ring/δ-pair extension of the package as an explicit prerequisite, with its resolution construction, comparison to ordinary pairs, and derived Čech compatibility. Import generic animation from its owner; do not rebuild it. The existing ordinary theory alone supports the flat A→B, faithfully flat R→S version. akn-delta lines 168–170 explicitly explain this distinction before Corollary 1.3. On the displayed example, the extension must retain π₁(B⊗ᴸ_A B)=ℤ_p rather than replacing the base by its π₀. A source's announcement of this extension is not an owned construction in this roadmap.

## R08 (P2) — The finite-basis and nilpotence targets leave their constraints unspecified

**Location.** `packages/RefinedTraceMethodsPartII/README.md:844`, §9.4: “have exponents below p and the stated weight constraints”; line 860, §9.5: “certain ... powers ... in prescribed Nygaard levels”.

**Claim.** These sentences specify the bases and the intermediate nilpotence results needed by the finite model and vanishing theorem.

**Witness.** At p=2, n=3, s=0, [a,b]=[2,2], the prismatic basis contains z₀². Source akn24 lines 1055–1056 allow k=2<n; “exponents below p” applied to k instead gives no basis vector in this weight.

**Repair.** Define a,b_v,f_u,g_(u,v), d̃, λ_u and R_u before use, with their domains and defining relations. State 0≤k<n, digit exponents 0≤e_u,e_(u,v)<p, finite support, and weight k+nΣp^u e_u+Σp^u e_(u,v)∈[a,b]. For the Nygaard basis specify j=max(0,i−Σp^u e_u−Σp^u e_(u,v)). These are akn24 Propositions 3.33–3.34, lines 1037–1089. The repaired rule includes z₀² and gives rank one in the displayed weight. State the actual exponents and level bounds of Lemma 5.9 and Corollary 5.10, lines 2131–2157, in place of “certain” and “prescribed”. For p=2,n=2,e=1,j=2, they give z⁶=0 with z⁵≠0, and z³d̃^i=0 with z²d̃^i≠0 for i≥3. The final vanishing theorem can retain its full stated generality.

## R09 (P2) — The negative-K supplier has a narrower hypothesis than the contract

**Location.** `packages/RefinedTraceMethodsPartII/README.md:121`: “§10.13: vanishing of negative K-groups of regular noetherian rings”; also §4.4's Needs at line 499.

**Claim.** GeneralAlgebraicKTheory §10.13 supplies the assertion for all regular noetherian rings.

**Witness.** GeneralAlgebraicKTheory pull request 1212, `TauCetiRoadmap/GeneralAlgebraicKTheory/README.md:2344`, assumes left noetherian and finite left global dimension. SchemeKTheoryOperations pull request 1229, `TauCetiRoadmap/SchemeKTheoryOperations/README.md:1830`, supplies the general regular-noetherian statement actually requested.

**Repair.** Repoint the regular-noetherian negative-vanishing contract and its uses to SchemeKTheoryOperations §5.2, already a supplier here. Retain GeneralAlgebraicKTheory §10.5 for the Bass theorem, and cite §10.13 only with its actual finite-global-dimension hypothesis if it is still used. For k a field, both suppliers give K_(−1)=0; for arbitrary regular noetherian k, the replacement supplies the exact quantifier without adding an unrequested finite-dimensionality restriction. This is a contract mismatch, not a claim that regular negative vanishing is false.

## R10 (P2) — The filtered comparison target has neither a statement nor its smoothness hypothesis

**Location.** `packages/RefinedTraceMethodsPartII/README.md:754`, §8.5: “The filtered Hodge–Tate comparison ... and the filtered base-change square”.

**Claim.** A theorem name and locator suffice to specify these promised interfaces for the preceding filtered δ-pairs.

**Witness.** akn-delta Proposition 10.37, lines 2415–2418, requires a prismatic filtered pair with p-adically smooth Rees(F⋆(A/I))→Rees(F⋆R). It concludes a particular tangent-twisted gerbe statement. Neither hypothesis nor conclusion appears here.

**Repair.** State that hypothesis, the map FWCart_HT(R/A)→FSpf R, its tangent band, and the graded analogue. State the actual base-change maps and completions of Proposition 10.31 and Corollary 10.34, including their relatively-quasisyntomic domain; distinguish generic and special fibres. A trivial filtration on (ℤ_p,𝔽_p[x]) has rank-one cotangent module and satisfies the smooth hypothesis. At p=2, R=𝔽₂[ε]/ε² instead has cotangent complex [R→0 R] in degrees −1,0: H^(−1)=R≠0. This negative control excludes the unsupported smooth-gerbe application. The general filtered construction remains a target; the comparison has its own narrower hypotheses.

## R11 (P1) — Filtered completion and Rees constructions are attributed to the wrong supplier

**Location.** `packages/RefinedTraceMethodsPartII/README.md:142`, the EnhancedDerivedSheaves contract; lines 700 and 757, §8.2 and §8.5 Needs: “filtered objects and Rees constructions”.

**Claim.** EnhancedDerivedSheaves E5 supplies the filtered/Rees infrastructure used to define the packages.

**Witness.** On main, `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1436` starts E5:abstract with monoidal categories, not filtered completion or Rees equivalences. DerivedDeRhamCohomology pull request 868, `TauCetiRoadmap/DerivedDeRhamCohomology/README.md:671`, begins the actual owner, §§1.14–1.17.

**Repair.** Split the contract: retain EnhancedDerivedSheaves for coherent categorical and E∞ machinery, and cite DerivedDeRhamCohomology §§1.14–1.17 for filtered diagrams, completion, Rees and completed Day convolution. Use its enhancement compatibilities where needed. Correct all affected Needs lines and Layer 8 Dependencies; do not create a second filtered theory. Verification: the step filtration of A has Rees A[t], t=1 gives A, t=0 gives gr⁰=A, and completion of the nonzero constant filtration is zero. These precise laws appear at the replacement supplier's lines 699, 735 and 745–801; the originally cited supplier has no corresponding target. This is a falsely supplied prerequisite, not a declared gap.

## Verified sound

The review read all four package files, the plan's two gaps, the previous review and repair report, the board package index, overlap/citation leads and the library-match/signature leads. There are nine layers and 41 numbered target subsections. The report table below concentrates on all fifteen seeded targets, the headlines, new findings, repaired passages and previously uncomputed portions; unchanged numerical rows of the preceding review were also checked against the formulas. No general acceptance is inferred from elaboration alone.

### Principles, organisation and shape

The introduction correctly extends RefinedTraceMethods rather than replacing it. The new applications keep p=2, perfect algebras beyond fields, regular noetherian axes coefficients, perfectoid truncated-polynomial coefficients and finite extensions of ℚ_p with arbitrary ramification. No computational algorithm, copied source passage, process identifier, machine path, HTML anchor, `set_option`, sorry'd data or `lemma` was found in the package text. The scope separation for chromatic purity and local fields is explicit. The generic theorem duplication in R03 must nevertheless be removed.

The layer order is justified mathematically: indexing and cyclic cells feed Tate and trace calculations; the axes, cusp and truncated-polynomial theorems consume these; relative filtered prismatic constructions then feed the chain-ring syntomic model. It is not an unsupported source chapter order. Each layer has Examples and Dependencies. Definition sections have API prose and at least three Checks, but the missing laws/hypotheses and unspecified interfaces identified above are substantive shape failures. The last three layers' mathematical targets are not algorithms merely because the sources also contain algorithms.

### Seeded source verification

All fifteen requested targets were checked at the supplied legal cached texts. Pages below are the source's printed/preprint page markers, not an inferred journal pagination. Where the README cites extraction lines instead of a page, the displayed page is the page containing those lines. The manifest's versions were used; no unexamined published version was silently substituted.

| Sample | Text opened and locator | Result |
| --- | --- | --- |
| 1.1 Cusp count and truncation sets | hn-cusp lines 20–30, p.1; hesselholt-cusp-polytopes Lemma 1.4, line 329, p.7, Corollaries 1.6–1.7, lines 386–399, p.8 | Positive solutions, coprimality and conductor agree. Cardinality correct. The repaired field restriction for length is necessary. |
| 1.4 Cyclic words and axes indices | speirs-axes Definition 8 and Lemma 33; lines 1250–1278, pp.30–31, table at line 1282, p.32 | The cyclic no-repetition condition, Möbius count and integer signs agree; m≥1 matters. The p=2 index correction is supported by the actual cell calculation. |
| 2.4 Linear and rational splittings | speirs-axes Lemma 29, line 1128, p.28, and the following circle components | HH splitting and rational mixed-complex reduction agree; the Connes operator on weight m is multiplication by m, not 1. |
| 3.1 Tate of finite C_p-complexes | hn-cusp Lemma 2, line 162, pp.4–5; speirs-trunc Lemma 8, line 347, pp.9–10; speirs-axes Lemma 15, line 506, p.13 | Finite/free cofibre arguments support the repaired p-complete reading, not the integral lax-smash assertion printed in speirs-axes. |
| 3.6 Homotopy of circle cells | speirs-axes Corollary 17, line 603, p.16; speirs-trunc Corollary 9, line 377, p.10 | Representation and circle shifts agree. The package's extension to unrestricted B′ is unsupported: R02. |
| 4.2 Birelative trace | hn-cusp line 97, p.3; hesselholt-cusp-polytopes Theorem 4.1, line 839, p.18; named RefinedTraceMethods §4.18 | The modern supplier supports the general theorem; the older source alone has coefficient/completion restrictions. Existing ownership is R03. |
| 4.3 Normalization squares | speirs-axes line 110, p.3; hn-cusp line 89, p.3; hesselholt-cusp-polytopes Remark 1.5, line 373, p.8 | Both pullback squares and the cusp conductor agree. The two cusp quotient rings need only become equal after killing nilpotent augmentation ideals. |
| 5.2 Plane axes | hesselholt-axes Theorem A, line 21, p.1; p-typical conversion lines 36–41; Theorem B, lines 70–85, p.2 | Regular noetherian 𝔽_p-algebras, de Rham–Witt degrees and p-power lengths agree. No perfect-field restriction was substituted. |
| 6.1 Relative cusp TC | hn-cusp lines 216–393, pp.6–9; h-index lines 43–57, p.2; coefficient maps lines 294–311 and staircase lines 330–349 | The can/Frobenius directions, cutoffs and zero cases agree with the p-typical h-index formula. |
| 6.2 Cusp K-theory | hn-cusp Theorem A, lines 27–37, p.1 | Isomorphism holds for perfect 𝔽_p-algebras; only the length sentence needs a field. Package now distinguishes them. |
| 7.2 Truncated polynomials | riggenbach-trunc Theorem 1.1, line 67, p.2, Corollary 6.5, line 1279, p.27; sulyma-slopes line 43, p.2 | Perfectoid coefficients, p-completion, r≥1 and V_e quotient agree. e=1 gives zero. |
| 8.2 Packages and syntomic complexes | akn-delta Definition 8.1, lines 1701–1717, p.42; Proposition 8.3, Definition 8.4, Lemma 8.5, Proposition 8.6, lines 1745–1786, p.43; Corollary 8.7, line 1787, p.44 | Strict finite-stage bound and module-versus-algebra colimits are correctly handled. The first definition omits multiplicativity of c: R05. |
| 8.3 Relative δ-ring cohomology | akn-delta Theorem 1.2, lines 126–153, pp.4–5; Proposition 1.6 and Theorem 1.7, lines 200–219, p.6; Proposition 9.15, line 2010, p.49 | δ-conjugate fibre and qrsp comparison agree; prism quotient and descent domains need restoration: R06. |
| 8.5 Filtered prismatic cohomology | akn-delta Definitions 10.2–10.10, lines 2105–2136, pp.51–52; Definition 10.29, line 2301, p.55; Proposition 10.31, p.56; Corollary 10.34 and Proposition 10.37, lines 2386–2418, p.57; Proposition 10.43, line 2489, p.59; Construction 10.44, p.60; Proposition 10.46/Corollary 10.47, line 2583, p.61 | δ multiplies filtration weight by p; filtered-envelope and associated-graded conventions agree. The bare comparison title is insufficient: R10; infrastructure attribution is R11. |
| 8.6 Degeneration and completeness | akn24 Proposition 2.6, line 325, pp.7–8; Proposition 2.11 and Lemma 2.12, lines 357–381, pp.8–9; Theorem 2.20, line 457, pp.10–11 | Equality of associated gradeds, complete filtered regular presentations, and the two distinct completion hypotheses agree. Equality of filtered complexes themselves is not asserted. |

The two expressly uncertified sources are recorded under Not verifiable. No other unverified locator was found requiring a new fetch. Every cited work has a manifest entry; no author-recorded entry was modified.

### Computed adversarial table

Here “pass” means the listed instance and the associated hypothesis/convention check passed, not a proof by finite testing. Infinite or derived counterexamples include an explicit homotopy group, kernel, rank or element. Values inherited from the earlier review were independently compared with the present statements. Changes refer to the findings above.

| Statement / convention | Instances | Computed left and right values | Result / change |
| --- | --- | --- | --- |
| 1.1 counting definition, conductor and periodicity | (a,b)=(2,3), m=6,11,12 | ℓ=0,2,1 by positive pairs; ℓ(m+6)=ℓ(m)+1; conductor 2=(2−1)(3−1), t absent and t²,t³ present | Pass |
| 1.1 first Lean headline | (2,3), r=0,1,2; (3,5,2) | #S=5,11,17,41; 2#S+2=12,24,36,84; RHS=12,24,36,84 | Pass |
| 1.1 second Lean headline | Same inputs | #T=1,3,5,20; 2#T=2,6,10,40; RHS=2,6,10,40 | Pass |
| Counting junk values and hypotheses | a=b=2,r=0; a=b=m=0 | S infinite, ncard=0 so first LHS=2 versus RHS=9 without coprimality; cuspCount(0,0,0)=0 from empty Icc | Hypotheses retained; no unintended theorem at junk values |
| 1.2 Witt restriction quotient | S={1,2,3,4}, n=2, k=𝔽₂; n=1 | T={1,3}, quotient order 4; retaining index 2 would give order 8. For n=1, V₁=id and quotient=0=W_empty | Pass |
| 1.3 cusp h-indices | (2,3,0), p=2, m′=1,3,5; p=5,m′=1 | For m′=1, ℓ(1)=ℓ(2)=ℓ(4)=0, ℓ(8)=1: s=3,h=1; h(3)=h(5)=0; at p=5, h(1)=1 | Sum h=1=#T |
| 1.4 third Lean headline | d=0,1,2,3; m=1,…,6 | d=0,1: all counts and formula values 0. d=2: 0,2,0,2,0,2. d=3: 0,6,6,18,30,66 on both sides | Pass |
| 1.4 m=0 and primitive words | m=0; d=3,s=2,…,6 | Empty-word count 1 versus formula d; primitive orbit counts 3,2,3,6,9; e.g. (66−6−6)/6=9 | m≥1 necessary; Möbius normalization correct |
| 1.4 odd/even thresholds | (p,r,m′)=(2,1,3) | t_od=1, t_ev=0; 3≤2r+1=3, but 3>2r=2 | Pass; source p=2 formula needs correction |
| 1.5 threshold and error count | ℤ/4; i=2,n=2; n=1 | j=2,[j]₂=3,B=12; ε support {1,3} has size 2=i(n−1); n=1 support empty, size 0 | Pass |
| Witt sign and V normalization | (2,−1) over ℤ; V₂ over 𝔽₂ | Ghosts (2,2); γ=1+2t+3t² versus componentwise 1+2t+4t². V₂(1)=2 in ℤ/4; quotient ℤ/2 | Pass; F01 repaired |
| 2.1 pointed algebra | Π₀; Π₂; cusp (2,3) | Contracted Π₀ algebra k, uncontracted algebra k×k; Π₂ rank 2 versus 3; cusp relation x³=y² | Definitions distinguish absorbing zero |
| 2.2 cyclic bar / ψ | Π₀; free t; Π₂ weight 2 | B(Π₀)=S⁰ and ψ=id; weight 1 goes to p; weight-2 cofibre has reduced H₁=ℤ/2, so is not a point | Pass |
| 2.3 cyclotomic splitting | k=𝔽_p, Π₂, weight 1 | 𝔽_p[u]⊗H_*(T₊) has one generator in each nonnegative degree; unreduced basepoint would give two in even degrees | Pass |
| 2.3 convergence | k=Hℚ[β±1], Π₂, weights 2j+1 | Each π₀ has a ℚ retract; ⊕ℚ→∏ℚ misses (1,1,…). For connective H𝔽_p, π₀=0 for j>0 | Fails / R01 |
| 2.4 rational mixed splitting | ℚ[t], weight m=2; p=2 torsion cell | HH₀=HH₁=ℚ, B=2; HC₀=ℚ, higher HC=0 in that weight. A degree-2 cell has torsion homology ℤ/2, killed rationally and retained over 𝔽₂ | Pass; coefficient condition essential |
| 2.5 word cells | xy, xyz, xxy | xy has reduced integral homology in degrees 1,2; xyz in 2,3; xxy is contractible. Word xx of period 1 is excluded from the nontrivial-period contractibility assertion | Pass |
| 2.6 cusp/truncated mixed models | cusp (2,3), m=1,6; e=1 | m=1 gives H₀=H₁=ℤ; m=6 Koszul(2,3) is acyclic since gcd=1; e=1 relative complex=0 | Pass for accessible comparisons; two cited source texts uncertified |
| 3.1 finite Tate and lax map | induced C_p₊; sphere unit | Induced-object Tate=0 on both sides. Uncompleted π₀ lax map includes ℤ_p⊗ℤ_p→ℤ_p, not an isomorphism; after p-completion both become ℤ_p | Package's completion is necessary |
| 3.2 circle norm convention | X=Hℤ, m=1,p | m=1 homotopy-fixed π₁=ℤ, not π₀; m=p circle Tate is ℤ/p in odd degrees because of the single suspension | Pass |
| 3.3 representation trivialization | E=Hℤ, λ=ℂ(1) | Underlying sphere shift is 2; Hℤ-module automorphisms have discrete π₀={±1}, hence no nontrivial BT-monodromy; resulting π_(2−2j)=ℤ in homotopy fixed points | Pass in the stated module setting; not an arbitrary-sphere trivialization |
| 3.4 perfectoid coefficients | R=𝔽_p,n=0,1,2 | n=0 THH=𝔽_p[u]; Tate π₀ at n=1,2 is ℤ/p,ℤ/p²; homotopy-fixed π₀ is ℤ/p²,ℤ/p³; V sends 1 to p | Pass |
| 3.5 staircase | s=0,2; all maps zero | Kernel A₀=0; kernel A₁=W₂(k); with all maps zero kernel=∏𝔽_p and cokernel=∏𝔽_p | Isomorphism hypotheses discriminate |
| 3.6 cell shifts and range | λ=0,m=1; dim_C λ=1,m=p; N=3 | Shifts 1 and 3; π₁ in the N=3 example is 0 in source versus a nonzero 𝔽_p Tate class in target | Pass in finite-cell source setting |
| 3.6 omitted B′ condition | B=S⁰, B′=S⁰∨ET₊ | π₀ source=𝔽_p, target=𝔽_p²; finite replacement T has extra Tate=0 | Fails / R02 |
| 4.1 relative/birelative fibres | identity square; axes over 𝔽_p | Identity gives 0 on all four relative fibres; axes birelative K₁=0,K₂=𝔽_p | Pass; not generic excision of K |
| 4.2 trace and rational shift | axes over 𝔽_p and ℚ | K₂=TC₂=𝔽_p; rational K₂=HC₁=ℚ, whereas HC₂=0 | Mathematics passes; duplicate ownership / R03 |
| 4.3 normalization | cusp (2,3); d=2,k=ℤ | A/c=k, B/c=k[t]/t², both nil-reduce to k. Axes pullback consists of pairs of polynomials with equal constant term | Pass |
| 4.4 homotopy invariance | field; k=𝔽_p[ε]/ε² | NK(field)=0; unit 1+εt is nonconstant with inverse 1−εt, so NK₁(k)≠0 | Hypothesis necessary; supplier generality / R09 |
| 5.1 low-degree trace | d=2,k=𝔽_p,q=0,1,2 | Birelative TC groups 0,0,𝔽_p, matching K | Pass |
| 5.2 axes headline | k=𝔽₃,q=1,…,6; k=𝔽₂,q=4 | Values 0,𝔽₃,0,𝔽₃²,0,ℤ/9⊕𝔽₃; at p=2,q=4: ℤ/4, not 𝔽₂² | Pass |
| 5.3 perfect-field axes headline | d=3,q=3,5,p=2,3; q=1 | q=3 gives k² for both primes; q=5 gives k⁸; q=1 gives 0. Printed p=2 extra m′=3 factor would give k² at q=1 | Package correction passes |
| 5.4 rational axes headline | d=2,k=ℚ,q=4; k=ℚ(t),q=3 | K₄=ℚ; K₃=Ω¹_(ℚ(t)/ℚ)=ℚ(t)dt. Perfect-field characteristic-p even formula at q=4 instead has two length-one terms for odd p | Pass; generality not conflated |
| 6.1 cusp TC / h decomposition | (2,3,1), p=5,3 | T={1,5,7}; h at p=5 gives lengths 2,1, hence ℤ/25⊕𝔽₅; at p=3 gives three lengths 1, hence 𝔽₃³ | Pass |
| 6.2 cusp headline | (2,3,2), p=2,5; (2,5,0),p=3 | 𝔽₂⁵; ℤ/25⊕𝔽₅³; ℤ/9 respectively; lengths 5,5,2 equal #T | Pass |
| 6.2 repaired length | k=𝔽₃×𝔽₃, (2,5,0); k=𝔽₃[t]perf,T={1} | (ℤ/9)² has W(k)-length 4 versus #T=2; second example length infinite versus #T=1 | General isomorphism retained, field-only length repaired |
| 7.1 weight decomposition | e=1; e=2,k=𝔽_p, weight 1 | e=1 all relative cells=0; e=2 weight 1 gives ΣTHH with π₁=𝔽_p | Pass |
| 7.2 truncated-polynomial headline | e=1; k=𝔽₃,e=2,r=2; k=𝔽₂,e=3,r=1,2,3 | 0; ℤ/9; ℤ/4, ℤ/8⊕ℤ/2, ℤ/16⊕(ℤ/2)². Even groups=0 | Pass |
| 8.1 δ-pairs | ℤ_p→ℤ/p^n; ℤ_p→ℚ_p; square-zero R of R04 | Torsion exponent p^n; derived completion ℚ_p^∧=0≠ℚ_p; R04 has exact orders p^n without bound | Boundedness claim fails / R04 |
| 8.1 characteristic-p first entry | A=𝔽_p | δ(p)=1−p^(p−1)=1 but δ(0)=0 | Nonexample correct |
| 8.2 definition / algebra maps | trivial H=N=ℤ_p,c=2id or id | c(1)=2≠1; fib(id−2id)=0; fib(id−id)=ℤ_p⊕ℤ_p[−1] | Wrong model admitted / R05 |
| 8.2 finite-stage bound | absolute 𝔽₂,i=1,j=1,3 | Integral 2a↦a is invertible, syntomic=0. j=3 gives 0 again; printed j=1 bound gives 𝔽₂⊕𝔽₂[−1]≠0 | Strict bound in package passes |
| 8.2 Breuil–Kisin control | (ℤ₂[[z]],ℤ₂),i=1 | Mod 2 map f↦zf+f² has kernel {0,z}, cokernel 𝔽₂². j=3 finite model has H⁰=𝔽₂,H¹=𝔽₂²; j=2 gives H⁰=0,H¹=𝔽₂ | Package's quotient and bound pass |
| 8.2 limits/colimits | zero module package; unit algebra package | Zero maps to 0; initial algebra unit maps to ℤ_p⊕ℤ_p[−1]≠0 | All module colimits versus sifted algebra colimits correctly distinguished |
| 8.3 δ-conjugate graded piece | A=R=ℤ_p,i=u=0 | LΩ⁰=ℤ_p, fib(0)=ℤ_p⊕ℤ_p[−1]; dropping the fibre would leave just ℤ_p | Pass |
| 8.3 prism comparison | (ℤ_p,(p)),R=𝔽_p versus ℤ_p | p maps to 0 versus nonzero p; first relative complex=ℤ_p, second claimed quotient-algebra input does not exist | R06 |
| 8.4 syntomic degrees | R=ℤ/4,i=1; i=−1 | H¹=(ℤ/4)×=ℤ/2; negative-weight complex=0 while the negative twist itself is nonzero | Pass |
| 8.4 derived descent domain | ℤ_p[[x]]→ℤ_p with R=S=𝔽_p | Resolution [A→x A] gives Tor₁(B,B)=ℤ_p; ordinary tensor has π₁=0 | R07 |
| 8.5 filtered δ compatibility | z in weight 1, δ(z)=0 or 1 | 0∈F^p; 1∉F^p; trivial filtration has only gr⁰; z-adic associated graded is W(k)[z] | Pass |
| 8.5 comparison hypotheses | R=𝔽_p[x] versus 𝔽₂[ε]/ε² | L smooth case=R dx[0], rank 1; dual-numbers cotangent differential 2ε=0, giving H^(−1)=R | Missing smoothness and conclusion / R10 |
| 8.5 imported Rees conventions | step filtration; constant filtration | Rees(step A)=A[t], fibres at 1 and 0 both A in appropriate degree; completion(constant A)=cofib(A→id A)=0 | Replacement owner verified / R11 |
| 8.6 crystalline degeneration | ℤ/4 and 𝔽₂[z]/z² | Both associated gradeds=𝔽₂[z]/z²; K₃ groups ℤ/8 versus 𝔽₂² have different orders, 8 versus 4 | Only graded comparison asserted, correctly |
| 8.6 completeness | ℤ_p⟨z⟩ versus ℤ_p[[z]] | 1+z is a unit only in the latter; 1+pz is a unit in both. The former is z-separated but not z-complete | Negative control correct |
| 9.1 finite-field boundary | n=1 | Positive p-completed K groups=0; TC_(−1)=ℤ_p versus K_(−1)=0 | Range distinction correct |
| 9.2 finite syntomic window headline | n=1,i=1; R=ℤ/4,i=1 | Window [1,0] empty gives 0; ℤ/4 has window [1,1], H¹=ℤ/2,H²=0 | Pass |
| 9.3 order quotient headline | ℤ/4,i=2; ℤ/8,i=3 | 8/2=4=2²; 128/2=64=2⁶ | Pass |
| 9.4 finite free model | ℤ/4,i=1; p=2,n=3,s=0,weight 2 | Model ranks 1,2,1; weight-two prismatic basis rank 1 from z₀², versus 0 if every exponent is <2 | Final ranks consistent; basis rule needs R08 |
| 9.5 even vanishing headline | ℤ/4; n≤e with e arbitrarily large | B=12, hence i≥13; |K_(2i−1)|=(2^i−1)2^i. For j=1, B=p²n/((p−1)e)→0, recovering all positive even vanishing in equal characteristic | Pass for final theorem |
| 9.5 intermediate nilpotence | p=2,n=2,e=1,j=2 | Exponent 2·3−4(2−2)=6: z⁶=0,z⁵≠0; Nygaard exponent 3−2(2−2)=3 | R08 requires these statements, not just a name |
| 9.6 v₁-nilpotence headline | ℤ/4; n=1 | [2]₂=3 is the stated sharp index; at n=1, v₁ already zero and [1]_p=1 | Pass; distinction between bound and sharpness retained |

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

Object searches covered pointed/contracted monoid algebras, cyclic bars, finite Tate comparisons, big Witt vectors, cusp counts, word counts, K-theory of axes/cusps/truncated polynomials, δ-pairs, filtered prismatic cohomology, syntomic complexes and Rees completion, in the pinned libraries, main, board package index and open roadmap heads through `roadmaps grep/show`. No pinned proof of any of the three Lean headlines was found. The unrelated modular cusp-function, truncation and totient search hits are not duplicate theorems. The names and simple carriers used in Lean resolve. No declaration here shares a fully qualified name with a read supplier declaration.

The main overlap defect is R03. The filtered prismatic construction is distinct from the filtered bundles/modifications of PrismaticCohomologyPartIII–IV; R11 imports its generic filtered infrastructure from the existing owner. AlgebraicKTheory's cusp Picard example (pull request 1142, `TauCetiRoadmap/AlgebraicKTheory/README.md:704`) is not the general cusp K-theory calculation. KTheoryFiniteLocalFields §§5.16–5.17 owns the classical truncation calculation and genuine TR inputs, and is explicitly imported; the perfectoid extension in Layer 7 is different. GeneralAlgebraicKTheoryPartII §5.5 owns chromatic purity and is only named as an excluded direction, not used as an upward input.

### Supplier resolution, overlap and order

The board index was read before checking ownership. The supplied overlap report has no dropped cited IDs, open-only revision numbering, conflicting head or dropped local ID requiring a compatibility map. Closest-roadmap ownership was checked against RefinedTraceMethods and the four prismatic parts at their heads. No additional overlap-policy finding results. Every Needs line was read; the concrete supplier defects are R09 and R11, with R07 identifying a genuinely additional prerequisite.

| Supplier and version read | Resolved inputs / evidence |
| --- | --- |
| RefinedTraceMethods, pull request 1493 | §§1.2–1.4,1.9; §§2.1,2.3–2.6,2.8–2.10,2.13,2.16; §§4.12,4.17–4.18. In `TauCetiRoadmap/RefinedTraceMethods/README.md`, mixed complexes start at line 142, group actions at 484, and the duplicated excision assertion is at 2349. |
| KTheoryFiniteLocalFields, pull request 1281 | Conventions; §§1.1–1.6,2.1,4.0,4.4,5.1,5.16–5.17; Layer 6 is an exclusion. `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:1176` and 1204 locate the classical monoid and regular-characteristic-p inputs. No 5.16a is claimed now. |
| QWittVectors, pull request 1351 | §§1.1–1.5 and 1.4a. `TauCetiRoadmap/QWittVectors/README.md:230` supplies the power-series comparison; `TauCetiRoadmap/QWittVectors/Suggested.lean:71` declares BigWitt.TruncationSet in its enclosing roadmap namespace. This resolves the automated citation lead. |
| AInfCohomology, pull request 1044 | AI.0 and AI.7.2; `TauCetiRoadmap/AInfCohomology/README.md:513`, 3815, 3926: perfectoid input and trace coefficients. |
| CrystallineCohomology, pull request 857 | CR.2 and CR.4; `TauCetiRoadmap/CrystallineCohomology/README.md:1624`, 3638: crystalline and de Rham–Witt theories. |
| DerivedDeRhamCohomology, pull request 868 | Layers 2 and 5 at `TauCetiRoadmap/DerivedDeRhamCohomology/README.md:3039`, 4256. The additional exact owner of filtered infrastructure is §§1.14–1.17, lines 671–801, needed by R11. |
| PrismaticCohomology, pull request 1057 | §§0.55–0.56,0.73–0.76,0.93,1.2–1.4,2.1–2.13. `TauCetiRoadmap/PrismaticCohomology/README.md:1054`, 1326, 1595, 1757, 2328, 2517. The range includes the stated prism conventions and envelopes, not a δ-ring-base extension. |
| PrismaticCohomologyPartII, pull request 1065 | §§3.6,3.9–3.10,3.19–3.20,3.24; §§4.4–4.10,4.17–4.19,4.22–4.23,4.25,4.29,4.31. `TauCetiRoadmap/PrismaticCohomologyPartII/README.md:250`, 323, 534, 821, 1084, 1103, 1169, 1329. Animated R over a fixed prism does not itself supply animated δ-ring bases. |
| PrismaticCohomologyPartIII, pull request 1070 | §§6.8–6.9,6.28,6.31,7.0. `TauCetiRoadmap/PrismaticCohomologyPartIII/README.md:285`, 314, 580, 637, 751: syntomic complexes and motivic TC filtration. |
| GeneralAlgebraicKTheory, pull request 1212; SchemeKTheoryOperations, pull request 1229 | Relative K, Bass theorem and regular invariance. `TauCetiRoadmap/GeneralAlgebraicKTheory/README.md:1574`, 2187, 2342; `TauCetiRoadmap/SchemeKTheoryOperations/README.md:1816`. Scope mismatch in R09. |
| StableHomotopyKTheory, pull request 1227 | §§7.9–7.10 and 7.14–7.18, `TauCetiRoadmap/StableHomotopyKTheory/README.md:2457`, 2476, 2526–2558: towers, Milnor sequences and completion. |
| BordismFormalGroups, main | F6.5 at `TauCetiRoadmap/BordismFormalGroups/README.md:1526` explicitly supplies Borel actions, norm, Tate and lax monoidal/module naturality. |
| EnhancedDerivedSheaves, main | E5:abstract at `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1436`, presentability, animation and completion machinery were read. Generic enhancement is supplied; the claimed filtered/Rees owner is wrong, R11. |

The two declared gaps have identical slugs in `packages/RefinedTraceMethodsPartII/design/plan.json` and the README's exact supplier contracts:

- `bigwitt-ptypical-decomposition`: QWittVectors §1.5. Existing comparison on Div(p^a) does not supply decomposition for arbitrary truncation sets over ℤ_(p)-algebras. The hypotheses and compatibility requirements are precise and necessary.
- `perfect-homotopy-invariance`: SchemeKTheoryOperations §5.2. Regular-noetherian invariance does not supply all perfect 𝔽_p-algebras. The perfection of 𝔽_p[t] illustrates the larger scope; the contract names exactly IK(A)→IK(A[T]).

These are declared supplier contracts, not findings. Acceptance after repairs may be conditional on them. This needs-changes verdict does not turn either gap into an unowned prerequisite.

The prescribed dependency check completed with output:

```text
depcheck: 236 roadmaps, 2145 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. No order file was edited. The proposed replacements in R09 and R11 use already earlier suppliers.

### Headline coverage, Lean elaboration and padding

The README's headline list comprises the two cusp cardinalities, the cyclic-word count, Hesselholt's plane-axes formula (§5.2), Speirs' characteristic-p and characteristic-zero axes formulas (§§5.3–5.4), the Hesselholt–Nikolaus cusp theorem (§6.2), Riggenbach's perfectoid truncated-polynomial theorem (§7.2), relative/filtered prismatic cohomology and degeneration (Layer 8), and the finite-chain-ring structure, order quotient, even vanishing and v₁ bound (§§9.2,9.3,9.5,9.6).

All three statable counting headlines are present. The module docstring identifies every remaining family and its missing carriers. The pin's perfectoid predicate is acknowledged, but it supplies neither algebraic K-theory nor big Witt vectors. There is no stand-in theorem. The finite free syntomic model also needs syntomic complexes and is covered by the finite-chain-ring discussion. No additional statable headline was found missing.

`lake env lean` was run from the content checkout on the package's absolute Suggested.lean path as prescribed. Exit code 0; the only warnings are `declaration uses 'sorry'` for the three theorems at lines 61, 69 and 77. There is only `import Mathlib`, so no TauCeti module build was needed. The package files were not changed for testing.

A scratch copy with `#check @...` for each of the six actual declarations elaborated successfully. Each counting theorem retains explicit a,b≥2 and coprimality where required; the word theorem retains m≥1 and permits d=0. All three definitions have real bodies, use only their explicit parameters and agree with the README. The automated seven-entry signature lead includes a docstring parsing artefact, not a seventh declaration. No binder disappeared and no declaration changed.

Every sorried theorem was probed on a scratch copy with one-tactic alternatives: `rfl`, `simp` with the three definitions, and `infer_instance`. All three remained unproved; the native near-match declarations were checked by type and object, and none can discharge one by `exact`. In particular a free-group cyclic reduction theorem does not count proper colourings of a cycle, and totient does not give a cusp truncation cardinality. No theorem mirrors a small README Check or states a boundary case. The three definitions are necessary for these headline statements; all six own backticked declaration names resolve to this Lean file.

## Not verifiable

- `larsen-mixed`, the mixed-complex source used in §2.6, is settled as uncertified. Its full text was not available in the supplied legal cache; its recorded locator was retained without pretending to inspect it.
- `bach-hypersurfaces`, also used in §2.6, is settled as uncertified. The same limitation applies. No repeated fetch or missing-text request was made for either settled source.
- Source checks certify the cached preprint/author versions identified by the manifest, not unprovided published versions. The akn-delta v2 target numbering was checked; no independent claim of having opened its earlier v1 is made.
- Finite examples, source comparisons and elaboration are not formal proofs of the deep spectral/prismatic theorems. The concrete failures above prevent acceptance even though the Lean acceptance signatures elaborate.

## Source issues

- **Error** in hn-cusp at Theorem A discussion, printed p.1, line 36: the source says the Witt quotient has the stated finite length for every perfect algebra; it should be restricted to perfect fields for this length formula; affects a stated result.
- **Error** in hesselholt-cusp-polytopes at Corollary 1.7, printed p.8, line 395: the source says the cardinality gives module length for arbitrary commutative coefficients; it should require coefficients making the Witt filtration factors simple, in particular a perfect field in the present application; affects a stated result.
- **Error** in speirs-axes at Lemma 15, printed p.13, line 506: the source says the lax Tate smash comparison is an integral equivalence; it should assert the p-completed comparison used by the subsequent calculation; affects a stated result.
- **Error** in speirs-axes at Theorem 1, printed pp.1–2, and Theorem 2, printed p.4: the source says the characteristic-two odd answer includes a product over an extra valuation range; it should retain one factor per odd m′≤2r+1 and eligible word period, as the cell calculation gives; affects a stated result.
- **Error** in akn-delta at Proposition 8.6, printed p.43, line 1770: the source says (p−1)j≥i suffices for the finite-stage syntomic formula; it should use a sufficient strict bound (p−1)j>pi from Lemma 8.5; affects a stated result.
- **Misprint** in hesselholt-cusp-polytopes at the proof of Lemma 1.4(5), printed p.8, line 371: the source says the second summand is bit; it should be bjt, giving 16 rather than 10 for (a,b,i,j,t)=(2,3,1,2,2); affects the proof.
- **Misprint** in akn24 at the proof of Proposition 3.34, printed p.25, line 1098: the source says the g-generator contribution to filtration weight has an extra factor n; it should be Σp^u e_(u,v), as in the proposition's statement; affects the proof.
