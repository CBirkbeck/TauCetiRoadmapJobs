<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13121#issuecomment-6787102295 -->
Review (codex) of 784ae25

Verdict: needs_changes

1. **F01** (P3) Restrict the finite-field order quotient Check to i ≥ 2

   **Location.** `packages/RefinedTraceMethodsPartII/README.md:237`: “This is consistent with `|K_{2i−1}(𝔽_q)|/|K_{2i−2}(𝔽_q)| = q^i − 1` being prime to p.”

   **Claim.** In this section i ≥ 1, including the n = 1 specialization immediately before this sentence, the displayed ratio is a quotient of finite group orders.

   **Witness.** Set q = 2 and i = 1. K₁(𝔽₂) = 0, of order 1, whereas K₀(𝔽₂) = ℤ is infinite. The proposed finite order quotient is undefined; the right side is 1.

   KTheoryFiniteLocalFields §1.6, `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:284`, explicitly separates K₀ = ℤ from the finite positive-degree groups. This is a defect in this Check, not in §9.3, whose integral K-group quotient already has i ≥ 2.

   **Exact repair.** Add “For i ≥ 2” to the order-quotient sentence. For i = 1, state separately that `|K_1(𝔽_q)| = q − 1` is prime to p; do not divide by the order of K₀. Keep the preceding ε-count for every i ≥ 1.

   **Repair test.** At q = 2, i = 2, the amended quotient is 3/1 = 3 = 2² − 1. At i = 1, the separate assertion is 1 = 2 − 1, and ε sums to 0. No infinite group order is used.

2. **F02** (P3) Specify the cusp in the infinite-length Check

   **Location.** `packages/RefinedTraceMethodsPartII/README.md:622`: “for the perfection of `𝔽_3[t]` already `K_0 = W_{{1}}(k) = k` has infinite length.”

   **Claim.** This paragraph fixes (a,b,r) = (2,5,0), computes T = {1,3}, and changes only k through its field and product examples. The last example uses T = {1} without specifying a change of cusp.

   **Witness.** For k = 𝔽₃[t]ᵖᵉʳᶠ and (a,b,r) = (2,5,0), §6.2 gives K₀ = W₂(k). Here 3·(1,0) = (0,1) ≠ 0, while 3k = 0.

   The infinite-length conclusion is correct; the missing parameter makes the displayed identification disagree with the cusp just specified. For the simpler cusp (2,3), the displayed identification with k is correct. This is a parameter omission in a Check, rather than a defect in the general theorem.

   **Exact repair.** Either explicitly write “For (a,b,r) = (2,3,0) and k the perfection of 𝔽₃[t], K₀ = W_{ {1} }(k) = k has infinite length,” or retain (2,5,0) and replace the last identification by `K_0 = W_{{1,3}}(k) = W_2(k)`, which has infinite length because it surjects onto k.

   **Repair test.** Enumeration gives T(2,3,0) = {1} and T(2,5,0) = {1,3}. The former has additive exponent 3, the latter exponent 9. In either version the descending chain (t) ⊋ (t²) ⊋ (t³) ⊋ ⋯ in k proves that the quotient k, hence the claimed module, has infinite length.

Two P3 findings in Checks; no blocking finding. The previous blocking supplier finding is repaired. The package elaborates with only three `sorry` warnings, and the dependency check reports no problems. Neither finding calls for changing a headline theorem or narrowing its generality.

## Verified sound

### Previous finding checked first

The round-4 review has one finding, F01. The repair report marks it applied differently, not non-actionable. Its reason for avoiding an edit to a different roadmap is valid.

| Previous finding | Repaired passage and independent verification | Status |
| --- | --- | --- |
| F01: nonexistent Segal supplier | README:84 now contracts “p-completeness of `X^{tC_p}`” without claiming the sphere equivalence. README:34 says “No layer here uses either” of the Segal equivalence and completed lax comparison. RefinedTraceMethods §2.3 at its head indeed has convergence, Tate vanishing and completeness; StableHomotopyKTheoryPartII §2.7 owns the sphere theorem. | Repaired |
| F01: dependent Frobenius route | README:440 now says “followed by the fixed-point comparison of §3.1.” README:369 supplies its compatibility with the lax composite. speirs-trunc Lemma 7 and the proof of Lemma 8, lines 304–376, support precisely this route. Main BordismFormalGroups §F6.5 supplies its projection formula and Tate universal property. | Repaired |

I inspected all changed passages: Scope, both supplier contracts, §2.3's insertion of can, §3.1 and its new Check, §3.6, Layer 3 Dependencies, and the speirs-axes manifest application. Pattern searches covered every Segal, lax, sphere-completion and §3.1/§2.3 use. The cusp and axes consumers use the retained fixed-point comparison. No upward edge is hidden in the exclusion. The stronger comparison was removed from this package's targets; it is not falsely claimed to be a theorem supplied by the later roadmap.

For T = Hℤ and Z = S⁰, the retained comparison and its lax factorization induce the identity ℤ/p → ℤ/p. For Z = Cₚ₊ both sides are zero. Thus neither test needs an identification of the Tate sphere. In §3.6 the fibre of the connective-cover Frobenius lies in degrees ≤ −3, so smashing with an N-dimensional finite complex puts the fibre in degrees ≤ N−3. This implies the claimed isomorphism for j ≥ N. The finite-cell condition is necessary, as the infinite example below shows.

### Coverage, principles and shape

Read all four author files, all nine layers and 40 numbered subsections, the previous review and repair, the package index, overlap/citation/signature/library leads, and the two gap declarations. The changed material and all fifteen seeded targets were checked afresh. For unchanged material, prior computed adversarial rows were used only where they actually supplied values; prose-only assurances were not treated as evidence. The following compact table retains the sampled targets, headlines, changed targets and findings, with further representative checks of the remaining layers. These computations test statements and conventions; they are not proofs of the deep spectral results.

The roadmap is an extension of RefinedTraceMethods: generic trace machinery is imported, and the new scope is explicit. It keeps p = 2, ramification, perfect coefficient algebras that are not fields, regular noetherian coefficients for planar axes, and general integral perfectoid coefficients for truncated polynomials. The unused Segal-dependent comparison is excluded without restricting primes or bypassing a needed theory.

Read main-branch `TauCetiRoadmap/SuccessiveMinima/README.md` and `TauCetiRoadmap/QuadraticCharactersAndReduction/README.md` for house shape. Each layer has Examples and Dependencies; each definition has its API and at least three Checks. R01–R02 are the remaining Check defects. The layers are named by mathematics. Indexing and cells feed Tate computations and normalization; those feed the K-group formulas; relative filtered prisms feed finite-chain-ring theorems. There is no assertion of following a source's organisation, source-chapter layer name, or unforced source-chapter sequence.

No computational algorithm, copied source passage, forbidden supplier, process residue, machine path, HTML anchor, sorry'd data, `lemma`, or `set_option` was found in the author files. The algorithmic part of akn24 is explicitly outside scope. Metadata remains `topic = "math.KT"`. All source-application section numbers resolve. All six actual Lean names are accounted for in the README; mathematical code spans do not introduce extra API declarations. The signatures lead's seventh entry, `and`, is a docstring-parser artifact, not a Lean declaration.

### Seeded source checks

Page numbers below refer to the cached versions identified by `sources.toml`. In particular, akn-delta uses v2 numbering, not the older numbering cited by akn24. Fourteen works are legally readable; two are settled uncertified entries. No additional source was required or fetched, and no manifest entry was changed. There are no further author-flagged unverified locators beyond those two settled texts.

| Seeded target | Source text opened | Hypotheses, locator and support |
| --- | --- | --- |
| 1.3 p-typical indices | hn-cusp line 43, p.2; hesselholt-axes line 36, p.1 | The threshold s and three branches of h agree, after interchanging a,b so p does not divide b. The zero-length case is retained. |
| 1.4 cyclic words and axes indices | speirs-axes lines 17–25, p.1; Lemma 33, line 1250, pp.30–31; table line 1282, p.32 | Positive word length, primitive periods and Möbius inversion agree. The Lean extension to d = 0 is valid by the empty alphabet calculation, not attributed to the source's d ≥ 1 statement. |
| 1.5 finite-chain exponents | akn24 lines 443–452, p.10; Theorem 5.2, line 2074, p.46 | ε counts and rational threshold agree. The source's additive-exponent slip is corrected to pʲ. R01 concerns the package's added finite-field Check. |
| 2.4 linear and rational splittings | speirs-axes Lemma 29, line 1128, p.28; Theorem 30, line 1163, p.29 | Contracted pointed-monoid algebra, relative HH and rational HC splitting agree. Arbitrary ℚ-algebras are permitted for HC; the later K formula separately requires ind-smoothness. |
| 3.4 perfectoid coefficient tower | riggenbach-double Corollary 5.8, line 517, p.12; Lemma 5.13, line 668, pp.15–16; riggenbach-trunc Lemma 4.1, line 575, pp.13–14; hn-cusp line 294, p.7 | Compatible orientation choices, fixed/Tate length offset, can, Frobenius and transfer match. Characteristic-p and mixed-characteristic perfectoid inputs are retained. |
| 3.5 staircase lemma | hn-cusp lines 330–393, pp.8–9; speirs-axes lines 1025–1046, p.26; riggenbach-trunc lines 1266–1272, p.27 | The two recursion directions and cutoff yield the stated abstract kernel. The abstract formulation explicitly supplies the isomorphisms used in the source computations. |
| 5.2 regular planar axes | hesselholt-axes Theorem A, line 21, p.1; decomposition line 36 | Regular noetherian 𝔽ₚ-algebra, positive degree, de Rham–Witt shifts and indices agree. No replacement by a perfect-field special case. |
| 5.4 characteristic-zero affine axes | speirs-axes Theorem 30, line 1163, p.29; Theorem 31, line 1228, p.30 | HC over arbitrary ℚ-algebras and the K formula over ind-smooth ℚ-algebras are distinguished. Form degrees, parity and multiplicities agree. |
| 6.1 cusp TC relative to normalization | hn-cusp §2, lines 216–250, p.6, and 294–393, pp.7–9 | The source computes the cofibre in degree 2r+1; the roadmap takes the fibre in degree 2r. The three divisibility branches and perfect algebra generality agree. |
| 7.2 perfectoid truncated polynomials | riggenbach-trunc Theorem 1.1, line 67, p.2; Corollary 6.5, line 1279, pp.27–28; sulyma-slopes Theorem 1.1/Remark 1.3, lines 43–52, p.2 | r ≥ 1, p-completion, Vₑ quotient and even vanishing agree. Perfect-field results remain Checks of the perfectoid theorem, with the existing owner cited. |
| 8.2 packages and syntomic complexes | akn-delta Definition 8.1, line 1701, p.42; Definition 8.4, line 1753, p.43; Lemma 8.5/Proposition 8.6/Corollary 8.7, lines 1759–1789, pp.43–44 | Filtered semilinear c, unital E∞ structure and fibre formula agree. The package correctly separates G_A from CAlg(G_A), corrects the finite-stage bound and diagram, and restricts algebra colimit preservation to sifted colimits. |
| 8.5 filtered prisms | akn-delta Definitions 10.2–10.10, lines 2100–2140, pp.51–52; Corollary 10.34, line 2386, pp.56–57; Proposition 10.43, line 2489, p.59; Proposition 10.46/Corollary 10.47, line 2583 onward, p.61 | Strict filtered δ-pairs, relative quasisyntomicity and regular envelope hypotheses remain. Rees comparison retains Hodge–Tate completion. No general completeness of the resulting filtration is claimed. |
| 9.1 syntomic reduction | akn24 §2, lines 265–303, pp.6–7 | Henselian trace comparison, residue-field term, completion and motivic grading agree. K₀ is separated from positive K-groups. |
| 9.5 even vanishing | akn24 Theorem 5.2, line 2074, p.46; Corollaries 5.5–5.6, lines 2084–2091, p.47; Lemma 5.9, line 2131, p.48; Corollary 5.10, line 2157, p.49 | Strict i > B, j = ceil(n/e), ramification factor and nilpotence exponents agree. |
| 9.6 v₁ nilpotence | akn24 Proposition 6.2, line 2321, p.52; Theorem 6.3 and proof, pp.53 onward | The bound [j]ₚ and sharpness when e divides n are distinguished. The p = 2 fourth-power comparison is retained; field boundary n = 1 is separate. |

Also reopened the repaired comparison at speirs-trunc Lemmas 7–8, lines 304–376, pp.8–10, and hn-cusp Lemma 2, line 162, pp.4–5. For the cusp headline, hn-cusp Theorem A, lines 27–37, p.1, supports perfect algebras for the Witt quotient; finite length is separately restricted to perfect fields. The gap on perfect homotopy invariance is supported by amm-perfectoid Proposition 5.1, line 558. Settled inaccessible auxiliary cusp texts are recorded below rather than silently certified.

### Computed adversarial evidence

Fresh enumeration tested 112 coprime triples a,b ∈ {2,…,8}, r ∈ {0,…,3}; both cardinality identities passed. The associated p-chain counts were checked at p = 2,3,5 (336 cases). Cyclic words were enumerated for d = 0,…,4 and m = 1,…,7 (35 cases). The remainder combines fresh sampled/changed tests with the explicitly computed unchanged rows of round 4. A zero group has order 1 throughout.

| Statement | Instances tried | Computed sides / wrong-model comparison | Result and change |
| --- | --- | --- | --- |
| 1.1 cuspCount, S and first Lean headline | (a,b,r) = (2,3,0),(2,3,1),(2,3,2),(3,5,1),(2,5,0) | #S = 5,11,17,26,8; 2#S+2 = 12,24,36,54,18 = (a+1)(b+1)+2rab | Pass |
| 1.1 T and Sylvester headline | Same five triples | #T = 1,3,5,12,2; 2#T = 2,6,10,24,4 = (2r+1)(a−1)(b−1) | Pass |
| 1.1 total functions and excluded noncoprime case | m=0; a=b=2,r=0 | cuspCount(2,3,0)=0 but 0∉S. For a=b=2, S contains all odd m, ncard=0: proposed equality would be 2=9 | Positivity and coprimality exclude wrong extensions |
| 1.2 Witt restriction quotient | R=𝔽₂,S={1,2},a=2; a=1 boundary | ℤ/4 divided by {0,2} is ℤ/2 = W_{ {1} }; V₁=id gives 0=0 | Pass; zero map V would leave ℤ/4 |
| 1.3 p-typical cusp lengths | (2,3,1), p=5 and p=3 | T={1,5,7}; p=5 chains have lengths 2,1 giving ℤ/25⊕𝔽₅; p=3 three lengths 1 give 𝔽₃³. In both cases Σh=3=#T | Pass |
| 1.3 zero threshold | m′ outside S; e.g. (2,3,0),p=2,m′=5 | s=0,h=0,W₀=0; no spurious factor | Pass |
| 1.4 cyclic-word headline | d=3,m=1,2,3,4,6 | Enumeration 0,6,6,18,66 equals 2ᵐ+(−1)ᵐ·2 | Pass |
| 1.4 empty alphabet, one letter, empty word | d=0 or 1,m≥1; d=3,m=0 excluded | Both sides 0 for d=0,1 and m≥1. At m=0 there is one empty word, while formula gives 3 | hm is necessary; no natural-subtraction substitution |
| 1.4 primitive cyclic words and two axes indices | d=3,s=2,3,4,6; (p,r,m′)=(2,1,3) | Primitive orbit counts 3,2,3,9; at s=6, (66−6−6)/6=9. t_od=1,t_ev=0 | Pass; two index functions cannot be conflated |
| 1.5 additive exponent and threshold | (p,e,n)=(2,1,2),(2,2,3),(2,3,3),(3,1,2),(2,12,3) | j=2,2,1,2,1; exponents 4,4,2,9,2; B=12,8,4,18,1 | Pass, including ramified/equal-characteristic quotients |
| 1.5 ε and field quotient | (i,n)=(1,1),(2,1),(2,2),(3,3); q=2,i=1 | Counts 0,0,2,6 = i(n−1). At q=2,i=1, denominator K₀=ℤ is infinite, RHS=1 | ε passes; R01 |
| 2.1 contracted monoid algebra | {0,1}, {0,1,x} with x²=0, and 0=1 monoid | Contracted ranks 1,2,0; ordinary monoid algebra ranks 2,3,1 | Pass; quotient is essential, zero monoid allowed |
| 2.2 unstable Frobenius and 2.3 splitting | Π₀, Π₂, weight 1, R=𝔽ₚ | Π₀ gives S⁰; Frobenius sends weight 1 to p. Weight-1 THH factor has one 𝔽ₚ in each predicted nonnegative degree | Pass; weight-preserving Frobenius rejected |
| 2.3 infinite splitting condition | Periodic rational coefficients with unbounded cells | Direct sum gives finite-support sequences; product includes (1,1,…) | Connectivity requirement retained |
| 2.4 linear/rational splitting | k=ℚ,Π polynomial monoid, positive weight m | HH₀=HH₁=ℚ, B=m; HC₀=ℚ, higher HC=0. Exceptional integral 2-torsion becomes 0 over ℚ and two 𝔽₂ groups mod 2 | Pass |
| 2.5 axes cells | xy,xyz,(xyz)²,xxy | Integral adjacent homology respectively (ℤ,ℤ) in degrees (1,2), (2,3); (ℤ/2,0) in (5,6); xxy=0. Mod 2 the exceptional pair is (𝔽₂,𝔽₂) | Pass; cyclic repetition and parity both matter |
| 2.6 cusp and truncated cells | Cusp (2,3),m=5; truncation exponent e=1 | ℓ=1 gives shift 2; for e=1 all transfer cofibres are cofib(id)=0 | Pass; no unwanted e=1 relative term |
| 3.1 repaired fixed-cell comparison and compatibility | T=Hℤ, p=2,3, Z=S⁰ and Cₚ₊ | S⁰: identity ℤ/2→ℤ/2 or ℤ/3→ℤ/3 on π₀, 0→0 on π₋₁; free orbit: 0→0 | Both maps agree, no Segal input |
| 3.1 finiteness negative control | Z=S⁰∨ECₚ₊,T=Hℤ | Fixed-cell source π₀=ℤ/p; target π₀=(ℤ/p)²; map x↦(x,0) | Finite hypothesis necessary |
| 3.2 circle-orbit shift | X=Hℤ,m=1 and m=p | m=1 fixed points ΣHℤ have π₁=ℤ; m=p Tate has odd groups ℤ/p, even groups 0 | Pass; unshifted formula fails |
| 3.3 suspension invariance | Hℤ, complex line; p=2 sign line Tate test | Complex shift gives π_{2−2j}=ℤ in homotopy fixed points. At p=2 sign Tate after suspension has even ℤ/2, odd 0 | Pass; odd sphere automorphisms are outside even-ring hypothesis |
| 3.4 coefficient tower | R=𝔽ₚ,n=0,1,2 | THH=𝔽ₚ[u]; fixed π₀ lengths 1,2,3, Tate lengths 0,1,2; V at first nontrivial stage sends 1↦p | Pass; one-step offset essential |
| 3.5 staircase | s=2 with Witt restriction/Frobenius; s=0,A₀=0 | Kernel parametrized by t∈ℤ/p², x₀=t mod p and constant stable tail; kernel size p². At s=0 kernel 0. Replacing required isomorphisms by zero leaves extra product factors | Pass |
| 3.6 repaired Frobenius range | R=𝔽ₚ,B=S²∧T₊,N=3; infinite ET test | π₂ and π₃ agree; below range π₁ is 0 versus 𝔽ₚ. Infinite ET adds a summand, 𝔽ₚ versus 𝔽ₚ² | Pass; finite range is not an unrestricted equivalence |
| 4.1 total fibre; 4.2 conductor | Identity square; axes; cusp (2,3) | Identity total fibre=0; axes normalization quotient constant difference=k; cusp conductor t², A/c=k and B/c=k[t]/t² | Pass; direction and fibre conventions agree |
| 4.3 invariance hypothesis | k=𝔽ₚ versus k=𝔽ₚ[ε]/ε² | Field has no NK; 1+εt is a nonconstant polynomial unit in the latter and gives nonzero NK₁ | Perfect/regular input cannot be dropped |
| 5.2 regular planar axes headline | k=𝔽₃,q=1,…,6; k=𝔽₂,q=4; k=𝔽ₚ[t],q=3 | 0,𝔽₃,0,𝔽₃²,0,ℤ/9⊕𝔽₃; at p=2,q=4:ℤ/4; polynomial coefficient case:k dt | Pass; field-only formula would miss forms |
| 5.3 affine axes headline | d=3,p=2 and 3,q=1,2,3,5 | 0,k³,k²,k⁸ in both characteristics at these degrees | Pass, including characteristic-two odd factors |
| 5.4 rational axes headline | d=2,k=ℚ,q=4; k=ℚ(t),q=3 | ℚ in degree 4; ℚ(t)dt in degree 3; positive forms vanish for ℚ but not ℚ(t) | Pass |
| 6.1 cusp fibre/cofibre grading | (2,3,0),p=2; (2,3,1),p=5,3 | Cofibre degree 1 and fibre degree 0 both carry k; at r=1 fibre degree 2 is ℤ/25⊕𝔽₅ or 𝔽₃³, of length 3 | Pass; odd fibre groups 0 |
| 6.2 cusp headline and length qualification | (2,5,0),k=𝔽₃ or 𝔽₃×𝔽₃ | W_{ {1,3} } gives ℤ/9 or (ℤ/9)²; lengths 2 and 4, rather than uniformly 2 | General algebra theorem passes; field qualification necessary |
| 6.2 infinite-length Check | k=𝔽₃[t]ᵖᵉʳᶠ | For (2,5,0), W₂(k) has 3·1≠0; for (2,3,0), k has 3·1=0. Both have infinite length | R02 specifies which cusp |
| 7.1 truncated cells; 7.2 headline | R=𝔽₂,e=3,r=1,2,3; p=3,e=2,r=2; e=1 | Quotients: ℤ/4, ℤ/8⊕ℤ/2, ℤ/16⊕(ℤ/2)², ℤ/9,0. Orders 4,16,64,9,1; even groups 0 | Pass; Vₑ quotient and ramified p-divisibility distinguished |
| 8.1 δ-pairs and boundedness | 𝔽ₚ; ℤₚ⊕⊕ℤ/pⁿ square-zero; ℚₚ | δ(p) would be 1 while δ(0)=0; square-zero summands have unbounded orders pⁿ; derived p-completion of ℚₚ is 0≠ℚₚ | All three negative controls discriminate |
| 8.2 package/syntomic definition | Absolute 𝔽ₚ,weight0; absolute ℤₚ; abstract unit | 𝔽ₚ fibre is ℤₚ⊕ℤₚ[−1]; absolute ℤₚ Frobenius cofibre is ℤₚ[−1], whereas identity model gives 0 | Pass; absolute object is not abstract unit |
| 8.2 finite-stage formula | p=2,i=1,R=𝔽₂,j=3 versus j=1 | True fibre 0; j=3 gives 0; printed source bound allows j=1 giving 𝔽₂⊕𝔽₂[−1] | Package's strict bound passes |
| 8.2 finite-stage BK example | E=z−2,p=2,i=1 | Full map f↦zf+f² has (dim H⁰,dim H¹)=(1,2); j=3 gives (1,2), j=2 gives (0,1); wrong target quotient gives (1,1) | Pass; tests bound and target simultaneously |
| 8.2 G_A versus C_A | c=2id,φ=id on step-filtered ℤₚ | c(1)=2≠1, so only a module object; syntomic fibre 0 versus unit fibre ℤₚ⊕ℤₚ[−1] | Unital algebra law excludes wrong model |
| 8.3 relative package | A=R=ℤₚ; A=ℤₚ,R=𝔽ₚ | Identity cotangent complex 0; weight-zero conjugate piece gives ℤₚ⊕ℤₚ[−1]; characteristic-p input is R, not δ-base A | Pass |
| 8.4 flat-base restriction | ℤₚ[[x]]→ℤₚ versus W(k)→W(k)[[z]] | First Čech derived tensor has Tor₁=ℤₚ; second has Tor₁=0. Weight 1 of ℤ/4 has H¹=ℤ/2 | Pass; no unsupported nonflat ordinary δ-descent |
| 8.5 Rees and filtered δ data | Step filtration; δ(z)=0 versus δ(z)=1 | Rees A[t] specializes to A at t=1 and gr=A at t=0; δ(z)=1 violates positive filtration, δ(z)=0 preserves it | Pass; associated graded BK pieces W(k)zᵘ |
| 8.6 degeneration/completeness | ℤ/4 versus 𝔽₂[z]/z²; restricted versus formal series | Same graded rings, different 2-primary K₃:ℤ/8 versus (𝔽₂)². 1+z has formal inverse, not restricted inverse; 1+2z has restricted inverse | Pass; neither splitting nor automatic filtration completeness inferred |
| 9.1 trace and degrees | R=𝔽ₚ and ℤ/4 | TC₋₁(𝔽ₚ)=ℤₚ while connective K₋₁=0; K₁(ℤ/4;ℤ₂)=ℤ/2 sits in H¹, not H⁰ | Pass; residue term and shift retained |
| 9.2 finite-chain structure headline | n=i=1; ℤ/4,i=1; ℤ/8,i=2 | Empty support gives H¹=H²=0; ℤ/4 gives (ℤ/2,0); ℤ/8 gives (ℤ/4⊕ℤ/8,ℤ/2), orders (32,2) | Pass |
| 9.3 order headline | Finite-chain test ratios | 8/2=4,128/2=64,64/1=64 equal the stated p-power quotients; zero groups contribute order 1 | Pass; integral quotient restricted to i≥2 |
| 9.4 finite free model | p=2,n=3,s=0,weight2 and3; ℤ/4,i=1 | Weight2 has z²,rank1; weight3 has f₀,rank1. Wrong bounds give rank0 or2. ℤ/4 complex ranks1,2,1 | Pass |
| 9.5 vanishing headline | B=12,8,18,1 | First permitted i=13,9,19,2, respectively; equality i=B is excluded. Ordinary/Nygaard z-nilpotence exponents (6,3),(8,4),(12,4),(6,3) | Pass |
| 9.6 nilpotence headline | ℤ/4; n=1; e=2,n=3 | At ℤ/4, v₁³=0 and v₁²≠0; field boundary v₁=0; e=2,n=3 gives upper bound p+1 without a sharpness assertion | Pass |

### Pinned library and ownership audit

Searched objects as well as proposed names in both pinned libraries, roadmaps on main, the package index, and the open-head corpus using `roadmaps grep` and `roadmaps show`. Searches included cusp truncation counts, cyclic coloring counts, contracted monoid algebras, THH/TC, big Witt quotients, axes, truncated polynomials, finite fixed cells, staircase equalizers, δ-pairs and filtered prismatic cohomology. The hits for modular cusps, Lie-theoretic staircases and geometric nodes do not supply these K-theory calculations.

| Pinned file and line opened | What it supplies and does not supply |
| --- | --- |
| `Mathlib/Algebra/GroupWithZero/Defs.lean:125` | MonoidWithZero; no nontriviality or commutativity assumption. The 0=1 test is legitimate. |
| `Mathlib/Algebra/MonoidAlgebra/Defs.lean:76` | Finitely supported coefficients on every monoid element, including an absorbing zero. It does not contract the zero basis vector. |
| `Mathlib/RingTheory/WittVector/Defs.lean:52`; `Truncated.lean:62` | Native p-typical carriers; not general big Witt truncation sets. |
| `Mathlib/RingTheory/WittVector/Verschiebung.lean:109`; `Frobenius.lean:218`; `Teichmuller.lean:93` | Actual p-typical V, F and Teichmüller maps. |
| `Mathlib/Logic/Equiv/Fin/Rotate.lean:27`; `Mathlib/Data/Set/Card.lean:643` | Cyclic successor; ncard uses ENat.toNat, hence is zero on infinite sets. The positive RHS in each cusp theorem excludes the infinite case. |
| `Mathlib/NumberTheory/Divisors.lean:53`; `Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean:54` and `:177` | Divisors, Möbius function and its zeta convolution; not the cyclic-word count itself. |
| `Mathlib/RingTheory/Kaehler/Basic.lean:148` and `:226` | The Kähler differential carrier and derivation; not de Rham–Witt or cyclic homology. |
| `TauCeti/RingTheory/Node/Basic.lean:37`, `:65`, `:75`, `:97` | NodeAlgebra, coordinates, product relation and lift. The planar axes carrier is imported rather than rebuilt in Lean. |
| `TauCeti/RingTheory/Perfectoid/Integral.lean:76` | Integral perfectoid predicate with completeness, Frobenius and theta-kernel conditions; no K-theory or trace carrier. |
| `Mathlib/Analysis/Complex/Periodic.lean:120` | cuspFunction is an analytic function, not the numerical-semigroup count. |
| `Mathlib/Data/Nat/Totient.lean:79` | Counts integers coprime to a modulus in a fixed interval; not T(a,b,r). |
| `Mathlib/GroupTheory/FreeGroup/CyclicallyReduced.lean:41` | Forbids inverse cancellation, rather than adjacent equal letters; not this cyclic-word predicate. |
| `Mathlib/Combinatorics/SimpleGraph/Coloring/Constructions.lean:79` and `:108` | Constructs two-/three-colorings of cycles; does not count all d-colorings for all positive m. |

The near-match leads therefore give no one-library-lemma proof of any of the three headlines. There is no duplicate fully qualified declaration name. Native Polynomial, MvPolynomial, PowerSeries, quotients and cardinality operations are used as supplied. No native algebraic K-theory, THH, TC, general big Witt, de Rham–Witt, syntomic or prismatic carrier was found that would make the omitted end theorems statable now.

The closest open roadmaps were read at their heads: RefinedTraceMethods #1493, PrismaticCohomology #1057 and Parts II–IV #1065, #1070, #1080. Their generic trace, prism, absolute syntomic and logarithmic theories are imported or separate. This package owns the singular-ring computations and the relative-to-an-ordinary-δ-base/filtered-ring extension. KTheoryFiniteLocalFields #1281 owns classical pointed THH and the regular/perfect-field truncated-polynomial results; the package cites §§5.16–5.17 and keeps their special cases as Checks. QWittVectors #1351 owns big Witt foundations. HabiroCohomologyFoundations #1428 §5.15, `TauCetiRoadmap/HabiroCohomologyFoundations/README.md:2008`, concerns perfectly covered bases, relative semiperfectness and q-de Rham inputs, not the general relative prismatic package claimed here.

The overlap data has no conflicting head for this roadmap, dropped supplier id, id supplied only by an open revision, or dropped consumer-facing id. The package index was read before the ownership search. No double ownership or mutual supply was found. BordismFormalGroups is consumed as it is on main; its open revisions are not dependencies. StableHomotopyKTheoryPartII #1733 §2.7 and GeneralAlgebraicKTheoryPartII are exclusions, not suppliers.

### Resolved supplier citations and direction

The following references were resolved now, rather than taken from the old report. Paths in this table are `TauCetiRoadmap/<name>/README.md`; line numbers refer to that README, not the wrapper printed by the roadmap tool. Ranges name the sections actually used, not new declarations in this package.

| Supplier | Sections and witness locations | Contract checked |
| --- | --- | --- |
| BordismFormalGroups, main | F6.5, lines 2190–2278 and 2314–2338 | Borel action category, induced-object ideal, Tate universal property, projection formula, lax can. No sphere Segal equivalence assumed. |
| EnhancedDerivedSheaves, main | E5:abstract.1 at 1440; abstract.2 at 1456; presentability.2 at 1624 | Operadic algebras/modules and presentable stable category inputs. |
| RefinedTraceMethods | §§1.2–1.4,1.9 at 142,214,261,403; §§2.1,2.3–2.6 at 484,557,587,607,646; §§2.8–2.10,2.13,2.16 at 804,853,879,1043,1227; §§4.12,4.17–4.18 at 1988,2226,2311 | Mixed complexes, THH and monoids, trace comparison, parametrized Tate, genuine/modern comparison, excision and continuity. Current §2.3 does not supply Segal. |
| KTheoryFiniteLocalFields | §§1.1–1.6 at 211–284; §2.1 at 398; §§4.0,4.4 at 638,700; §5.1 at 800; §§5.16–5.17 at 1176,1204 | Finite-field K including K₀ exception, rigidity, TC coefficients, λ-graded TR and classical pointed/truncated calculations. |
| QWittVectors | §§1.1–1.5 at 138,160,179,203,259, including §1.4a | Big Witt operations, coordinate/power-series comparison and p-power truncation comparison. BigWitt.TruncationSet resolves here (§1.1; Suggested.lean:71), not at the pins. |
| AInfCohomology | AI.0; AI.7.2 at 3815, periodicity at 3926 and perfectoid coefficients at 3940 | Actual integral perfectoid coefficient theorem and compatible generator choices, not just the cyclotomic O_C example. |
| CrystallineCohomology | CR.2 at 1624; CR.2.2 at 1715; CR.4, including 5156 and 5514 | PD de Rham calculations, general p-typical de Rham–Witt and comparisons with their hypotheses. |
| DerivedDeRhamCohomology | §§1.14–1.17 at 671,708,745,775; Layers 2 and 5 | Filtered completion, Rees, completed convolution, derived de Rham, cotangent and quasisyntomic inputs. |
| GeneralAlgebraicKTheory | §8.1 at 1574; §10.5 at 2187 | Relative fibre and fundamental theorem with Nil terms. |
| SchemeKTheoryOperations | §5.2 at 1816 | Regular noetherian homotopy invariance; general perfect coefficients are the declared gap below. |
| StableHomotopyKTheory | §§7.9–7.10 at 2457,2476; §§7.14–7.18 at 2526–2558 | Completion, convergence and finite-complex inputs, with boundedness retained. |
| PrismaticCohomology | §§0.55–0.56 at 1054,1076; §§0.73,0.74,0.76 at 1326,1352,1379; §0.93 at 1595; §§1.2–1.4 at 1757–1798; Layer 2, §2.13 at 2517 | δ-rings, bounded/Breuil–Kisin prisms and envelopes. The cited range 0.73–0.76 supplies its advertised objects through these retained sections; no independent object is assigned to the unused number 0.75. |
| PrismaticCohomologyPartII | §§3.6,3.9–3.10,3.19–3.20,3.24 at 250,323,368,534,546,614; §§4.4–4.10 at 821–945; §§4.17–4.19,4.22–4.23,4.25,4.29,4.31 at 1084–1329 | Nygaard/twists, WCart, absolute packages, crystals, Hodge complexes and absolute Frobenius. The absolute ℤₚ example resolves to §4.31, not an identity Frobenius. |
| PrismaticCohomologyPartIII | §§6.8–6.9 at 285,314; §§6.28,6.31 at 580,637; §7.0 at 751 | Syntomic cohomology, multiplicative motivic filtration, trace comparison. Reversing φ−can to can−φ is target negation, preserving the fibre identification. |

Read every Needs line and layer dependency list, including those of the changed Tate route. The requested mechanical command, with this README, name, ORDER, `--movable` and the content checkout, returned exit 0:

```text
depcheck: 236 roadmaps, 2145 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. No change to merge order or tooling was made.

Both declared supplier gaps are precise, owned and still needed. `bigwitt-ptypical-decomposition` agrees between README:111 and `packages/RefinedTraceMethodsPartII/design/plan.json:2106`; QWittVectors §1.5 supplies the p-power comparison but not this whole functorial product decomposition. `perfect-homotopy-invariance` agrees between README:131 and plan.json:2118; regular noetherian invariance does not cover all perfect algebras. Neither asks for a result already supplied at the pins or in this package. These are contracts, not unowned prerequisites; they are not findings.

### Headlines, Lean signatures and padding

| README headline | Acceptance-test disposition |
| --- | --- |
| Cardinality of S(a,b,r), §1.1 | `ncard_cuspTruncationSet`, explicit a,b≥2 and coprimality |
| Sylvester cardinality of T(a,b,r), §1.1 | `ncard_cuspCoprimeSet`, same hypotheses |
| Cyclic-word multiplicities, §1.4 | `card_noCyclicRepetition`, d arbitrary, m≥1, integer subtraction |
| Planar regular axes, §5.2 | Named in module docstring; algebraic K and de Rham–Witt carriers absent |
| Affine axes in both characteristics, §§5.3–5.4 | Named; K, general Witt-valued K groups and cyclic homology absent |
| Planar cusp groups, §6.2 | Named; K and big Witt carriers absent |
| Perfectoid truncated-polynomial groups, §7.2 | Named; K and big Witt absent, although perfectoid predicate exists |
| Relative/filtered prismatic theory and degeneration, Layer 8 | Named; δ-ring/prism/prismatic carriers absent |
| Finite-chain syntomic structure, order quotient, even vanishing, v₁ bound, §§9.2,9.3,9.5,9.6 | All named; K and syntomic carriers absent |

No statable headline was found missing or replaced by a stand-in. The three real definitions are precisely the finite-set predicates needed by the two cusp counting headlines; no heavy carrier or free Prop proxy is introduced.

Ran `lake env lean` on the absolute package Suggested.lean path from the content checkout as required. It exited 0 with exactly the three `declaration uses 'sorry'` warnings (lines 61,69,77), no other warnings or errors. There is a single `import Mathlib` and no Tau Ceti import requiring a build. No bare lake build or dependency update was run.

A scratch copy with `#check @name` for every actual declaration also elaborated. The three definitions have the intended three natural-number parameters; both cusp theorem signatures retain a≥2, b≥2 and `Nat.Coprime a b`; the cyclic-word theorem retains m≥1. No hypothesis disappeared and no signature changed.

Every admitted theorem was probed, not sampled. A scratch copy tried `rfl`, closing `simp`, and `infer_instance` independently through tactic alternatives; none closed any of the three goals. A second copy unfolded all three definitions under `simp`; all three goals remained unsolved. The pinned near-match audit above found no exact library lemma giving any conclusion. These are substantive general counts, not small-value Checks, boundary cases or definition restatements. No padding deletion is needed.

## Not verifiable

- `larsen-mixed`, the cusp mixed-complex locator used in §2.6, is settled uncertified/paywalled. Its text was not reopened or requested. The accessible hn-cusp discussion and the resulting cell computations were checked, but that is not certification of the inaccessible original proof.
- `bach-hypersurfaces`, the mixed complex of the cusp hypersurface used in §2.6, is likewise settled uncertified/paywalled. No duplicate key or new missing-reference request was created.

All fifteen seeded targets were readable through their listed sources. There is no additional unavailable source or unavailable Lean command. Verification of the computations does not assert that the deep theorems have already been formalized.

## Source issues

- **Error** in hn-cusp at Theorem A discussion, p.1, line 36: the source says the Witt quotient has the stated finite module length for arbitrary perfect algebras; it should be restricted to perfect fields; affects a stated result.
- **Error** in hesselholt-cusp-polytopes at Corollary 1.7, p.8, line 395: the source says the count gives module length for arbitrary coefficient rings; it should require conditions making the coordinate factors simple, as for perfect fields; affects a stated result.
- **Misprint** in hesselholt-cusp-polytopes at proof of Lemma 1.4(5), p.8, line 371: the source says the second term in the multiplied representation uses i; it should use j, giving ait+bjt; affects the proof.
- **Error** in speirs-axes at Lemma 15, p.13, line 506: the source says the lax Tate comparison is an equivalence before completing its source; it should include p-completion of the source; affects a stated result.
- **Misprint** in hn-cusp at the connective TC comparison, p.3, line 115: the source says connective TC of every perfect k is ℤₚ; it should use the prime-field comparison and then the map induced by 𝔽ₚ→k; affects the proof.
- **Misprint** in akn-delta at Remark 8.2(iii), p.43, line 1740: the source says C_A is stable; it should say the underlying module category G_A is stable, while C_A is its category of commutative algebras; affects nothing.
- **Error** in akn-delta at Proposition 8.6 and proof, pp.43–44, lines 1770–1785: the source says (p−1)j≥i suffices and displays the tail map as an equivalence; it should use (p−1)j>pi and the automorphism followed by can from Lemma 8.5; affects a stated result.
- **Misprint** in akn24 at Remark 5.3, p.46, line 2077: the source says j is the additive exponent; it should say pʲ is the exponent, with j its base-p exponent; affects nothing.

No author file was edited during this review. The two findings above are the complete requested repair list; the source issues are recorded as source errata, not additional package findings.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "784ae25733b587c4c4c08927fb2ff8f33107684b", "job": "REV-PKG-RefinedTraceMethodsPartII~5", "model": "gpt-6-astra", "worker": "chris-8"} -->
