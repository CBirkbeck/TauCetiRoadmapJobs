<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1029#issuecomment-6397708729 -->
Review (codex) of 687a564

Verdict: needs_changes

1. **F01** (P2) The transpose theorem excludes proper nonfinite correspondences

   **Location:** `packages/AutomorphicBundlesPartII/README.md:664`: “For smooth X,C over S and finite locally free legs p₁,p₂”. The proof at line 668 also restricts the argument to finite-flat duality.

   **Claim:** This is the transpose component of the general coherent-correspondence headline. Its finite-locally-free restriction loses part of the cited theorem and excludes proper refinements admitted elsewhere in Layer 3. BP26 Proposition 2.7.3 does not impose this restriction on the legs.

   **Witness:** BP26 lines 1182–1199 assume smooth C,X and finite locally free coefficients. Take both legs to be b:Bl_point(P²_k)→P²_k. Its exceptional fibre is P¹, so b is proper but not finite.

   **Exact repair:** State transpose duality for the correspondences of §3.1 between smooth S-schemes, on perfect coefficients in the specified coherent-duality categories, using derived pullbacks. Retain the Noetherian, boundedness and duality hypotheses from SchemeAndStackFoundations §§2.18–2.21. Require both first legs, before and after transposition, to be proper when asserting the two global actions and their adjointness. With X proper, joint properness from §3.1 ensures this. Use the invertibility of the relative dualizing objects and biduality, as in BP26 lines 1187–1199; keep finite-flat trace as a specialization. Add a proper nonfinite Check.

   **Repair tested on the witness:** Over k, both surfaces have dimension two. Write E for the exceptional divisor. Then b!O_X=O_C(E), and the fundamental class O_C→O_C(E) gives the correspondence on F=G=O_X. Its global map on H⁰(O_X)=k is 1; the transpose acts by 1 on H²(ω_X)=k. Evaluation gives 1=1. The original finite-locally-free hypothesis rejects this case; the repaired statement admits it. The existing three-cycle Check still gives σᵗ=σ⁻¹. This also covers the kind of nonfinite toric refinement explicitly admitted by `TauCetiRoadmap/ShimuraCompactifications/README.md:2707` and used in §3.13.

2. **F02** (P3) Several local prerequisites are absent from their Needs lines

   **Location:** `packages/AutomorphicBundlesPartII/README.md:497`: “constructed in §3.0a”; line 551: “use the solid coherence constructed in §3.0a”; line 911: “the G₁ quotient of §5.0”; line 1060: “regular-thickening results of §5.0”. The corresponding Needs lines are 511, 553, 925 and 1062; §5.11's line 1076 has the same omission.

   **Claim:** The statements and proof routes name local prerequisites that their individual dependency lists omit. These inputs have owners, so this is a dependency-list defect, not an unowned prerequisite.

   **Witness:** The current local graph has no path from §3.1 to §3.0a, or from §5.1/§5.10 to §5.0, despite those sections explicitly consuming their constructions.

   **Exact repair:** Add §3.0a to the Needs lines of §§3.1 and 3.3 for their solid branches. Add §5.0 to §§5.1, 5.10 and 5.11 for quotient descent, EO geometry and boundary regularity respectively. Keep the discrete branches' existing supplier prerequisites.

   **Repair tested:** Adding these five edges to the extracted graph changes 158 edges to 163 and leaves zero cycles. The inputs remain earlier in their construction order. The boundary test k[x,y]/(x²) has injective multiplication by y, whereas k[x,y]/(xy,x²) has yx=0 with x≠0; the missing §5.0 input is exactly what separates these cases.

Two findings: one P2 and one P3. All six preceding findings are repaired or settled as explained below. The remaining blocking issue is the scope of the transpose theorem. It is repairable within this roadmap. No authored package file was changed.

## Verified sound

The review read all 69 numbered target subsections, all 70 Needs lines, the eight layer dependency summaries, conventions, supplier contracts, metadata, sources manifest and the entire 84-line acceptance file. It checked the previous six findings first. For untouched passages, the preceding review's 113 rows with computed values were used as the permitted inherited evidence; changed passages, the seeded sample, headline interfaces and the patterns behind the repairs were checked again. The table below records 59 fresh, discriminating computation rows without reproducing the entire inherited ledger.

The roadmap is a Part II extension of AutomorphicBundles B0–B5, with a stated boundary between the parent's bundle/section theory and higher coherent cohomology. It does not replace an existing roadmap. There are no executable-algorithm targets, copied source passages detected in the inspected statements, admitted data definitions, substitute Prop fields, `set_option`, or `lemma` declarations in Suggested.lean. The general PEL theorem and all three GSp₄ ranges remain targets; the small-prime exclusions in those particular vanishing theorems are source hypotheses, not a restriction of the whole library to good primes. The exception to the required generality is R01.

### Previous findings, checked individually

| Previous finding | Status | Repaired passage and verification |
|---|---|---|
| F01: normalization cycle | Repaired | README:783 now says “*Needs:* §1.3; §3.13”. README:223 places the elementary character computation in §1.3. At (a,b)=(5,2), x=2, 128·4⁻³=2. §7.0 still consumes Layers 4–6; neither §4.1 nor the Layer 4 summary points back to it. |
| F02: spectral sequence and completion suppliers | Repaired | README:79 now names “coefficient/hyper-Tor spectral sequences … (§7.10)”; README:703 names “object completion … DerivedModuleAlgebra §§1.3–1.5” and “perfect-system effectivity … §1.E.1”. Current supplier texts give precisely those results. The object k[x] completes to k[[x]]; the coefficient complex O→ϖO acquires an extra k in H⁰ after reduction. |
| F03: Su regularization | Repaired as a package contract; supplier work remains settled | README:115 says “What AutomorphicSpectralTheory must provide (gap:su-parabolic-regularization)”. README:1232 uses §5.8 for Fin_J acyclicity. The exact ninth gap occurs in plan.json. The repair report's reason that proving the missing supplier theorem is not actionable here is correct; it is not re-raised. The full and parabolic SL₂ relative complexes still have different degree-two values, ℂ and 0. |
| F04: unquantified large-gap bound | Repaired | README:1542 says “There is an absolute real constant R_gap>4”; line 1546 says “R_gap≥R_sep+2”. Quantification precedes field, level, weights and occurrence data. For R_sep=3, R_gap=5 excludes (8,4), whose fourth pairing is 2; (12,6) has pairings 7,11,15,4 and is admitted. §8.9 retains this condition. |
| F05: endpoints and instruction-only Checks | Repaired | README:813 restricts the noninjectivity claim to “k>0”. README:1176 says “vanishing above degree two” and “vanishing above degree one”. On k, ϖ⁰ has kernel 0 and ϖ has kernel k. Lengths 1,2,3 first vanish in degrees 3,2,1. Revised examples throughout Layers 1–8 were recalculated, including the ramified and nonreduced negative controls below. |
| F06: manifest use sites | Repaired | sources.toml:79 now records `cited_for = ["§6.8"]`; line 170 records `cited_for = ["§8.5"]`. These are Sch15 and BR16's actual uses. Their keys and provenance were retained. |

The search for repaired patterns elsewhere found no further §4.1/§7.0 cycle, object/Hom completion confusion, conflation of the full and parabolic pairs, substitution of R_sing for R_gap, or erroneous vanishing endpoint. R02 concerns separate omissions from local Needs lists.

### Source sample and locator verification

All fifteen seeded targets were checked against the available text, including hypotheses and source numbering. There are sixteen manifest keys, fifteen cached texts and one settled uncertified work, GK19. No source was fetched and no manifest entry was edited. The line anchors below identify the mathematical passages; printed pages are distinguished from extraction page markers. The BP26 line-1088 anchor in §3.6 starts printed page 22; the actual §2.6.12 statement begins at line 1132.

| Target | Source opened | Result and retained hypotheses |
|---|---|---|
| 2.1 Equivariant Čech model | CG18 §7.2, pp. 397–398, lines 4048–4079 | Finite affine cover, separated intersections, pulled-back coefficient, actual deck action; terms may have infinite rank. No averaging by the p-group order. |
| 3.6 Base change | BP26 §2.6.12, pp. 22–23, lines 1132–1150 | Source uses finite S′, Tor-independence and flat F. README distinguishes this from the supplier's more general derived coherent base change and retains its conditions. |
| 3.9 Transpose | BP26 Proposition 2.7.3, pp. 23–24, lines 1182–1199 | Formula and direction agree; finite locally free legs are an extra restriction absent from the source. R01. |
| 3.10 Contracted support | BP26 Definition 2.1.19 and Remark 2.1.20, p. 9, lines 429–440 | Set-theoretic inclusion has the stated orientation. Thickening multiplicities do not enter the definition. |
| 4.3 Generators and spin polynomial | CG20 §5.5, p. 33, lines 1320–1346; P20 §5.3, p. 25, lines 1080–1089; BCGP21 §3.10, p. 236, lines 3255–3267 | Matrix similitudes, differing generator labels and ν⁻³ factors are kept. Polynomial coefficients and reciprocal convention agree with the current local suppliers. |
| 5.1 Formal coefficients | Lan17 Definition 8.5, p. 34, lines 1488–1504; Propositions 7.5 and 7.15, pp. 28–32, lines 1235 and 1287 | Formal monomial expansion and finite filtration are necessary. Parent C5.21 owns the definition; this target verifies additional p-level/quotient applications. Reduced boundary ideals are not identified with ramified pullbacks. |
| 5.2 Relative vanishing | Lan17 Theorem 8.6 and Remark 8.9, pp. 34–35, lines 1505–1539 | Canonical case n>0; subcanonical case n≥0. Local-open and refinement forms are retained. Finite coefficients require the chart criterion; no smoothness assertion for normalized models is inferred. |
| 5.8 Mod-p singular weights | CG20 Corollary 5.8, pp. 30–31, lines 1231–1245 | First range gives subcanonical degrees 2,3. Second gives canonical degree 0 and subcanonical degree 3. These tags are correctly different. |
| 5.9 Large twists | CG20 Definition 6.3, p. 36, lines 1456–1466; proof of Theorem 6.13, p. 43, lines 1697–1700 | One bound for a fixed finite family of levels; both section surjections follow. General dominant weights use the stated relative vanishing plus ample Serre vanishing, not a new level-uniform bound. |
| 6.4 Harris comparison | H90 Theorems 2.4.1, 2.4.4, 2.7 and following discussion, pp. 56–59, lines 2164, 2203, 2242, 2268, 2275; CG20 Theorem 5.2, p. 25, lines 1038–1050 | Cusp injection, endpoint comparison and interior containment agree. H90 is OCR; CG20 supplies a readable restatement of the relevant inclusions. Su's canonical comparison is not substituted for Harris's cusp map. |
| 7.3 Large singular decomposition | P20 Theorems 15.2.2.1 and 15.2.3.1, p. 108, lines 4922–4951 | Negative parameter and corrected size condition −λ₁≥R_sing; separate holomorphic/generic multiplicities. The manuscript's sign misprint is not copied. |
| 8.4 Boundary factorization | BCGP21 proof of Lemma 3.10.7, pp. 238–239, lines 3327–3357 | Four distinct monomials, Klingen lower-rank coefficient and normalized factorization retained. The local identity is a named supplier gap, distinct from this geometric identification. |
| 8.7 All rational singular weights | CG20 proof of Theorem 7.11, pp. 54–55, lines 2116–2186 | The all-weight argument, including a=2, does not depend on the large-singular threshold. Nongeneral-type exclusion and the permitted same-finite-part pairing retain the conditional §7.0 inputs. |
| 8.8 Localized cusp contribution | BCGP21 Theorem 3.10.1, pp. 236–237, lines 3269–3294; proof p. 240, lines 3404–3424 | Multiplicity, level invariants, residual condition, absolute large-gap constant and separate injections/equalities agree. Root-separation conversion is now explicit. |
| 8.9 Conditional dimensions | BCGP21 Corollary 3.10.5, p. 237, lines 3302–3309; P20 Proposition 15.2.4.1, p. 109, lines 4986–5000; CG20 proof above | h¹=l₀h⁰ under the large-gap and packet assumptions; rational h¹=h⁰ for a≥2 under the separate all-weight route. No unconditional packet multiplicity claim. |

Also opened the source passages behind the changed Su contract: Su24 Proposition 4.1, p. 38, lines 1609–1624; the central hypothesis at lines 259–267; inverse tower action at line 361; Lemmas 5.1–5.5 and Theorem 5.7 at lines 2396–2456. The Lan–Suh gap was checked against Theorem 3.24, pp. 20–21, lines 986–1024, and Proposition 7.21, pp. 41–42, lines 2012–2035. Lan17err and LanSuhErr were read; their corrections do not restore a claim dropped by the package. The boundary formula described cautiously as a source computation in §8.3 is actually present at P20 lines 4974–4983, including the exceptional k=0 case and doubled Hecke operator.

### Computed adversarial pass

Each row gives an actual value or obstruction, not an elaboration-only assertion. “Retain” means the stated hypotheses exclude the displayed wrong model or give the computed equality. Algebraic controls for geometric theorems test their interfaces and necessary hypotheses; they are not presented as proofs of the full geometric theorem.

| Statement / interface | Instances | Computed values on the two sides | Result / change |
|---|---|---|---|
| 1.1 Polarized frames | g=1, ψ₁=2,c=3; wrong ψ₂=2 | Required ψ₂=3/2 gives ψ₁ψ₂=3; wrong choice gives 4 | Retain defining polarization law. |
| 1.2 Left translation | m=(123) permutation matrix, f(m)=m₂₁, acting element 1 | Correct identity gives 1; f(m⁻¹)=0 | Retain inverse on acting element, not evaluation point; nonabelian control. |
| 1.2 Integral dual lattice | Rank two, degree two, characteristic 2 | Ordinary square cross coefficient 2=0; divided-power cross coefficient 1 | Integral Weyl/dual-Weyl distinction is necessary. |
| 1.3 / 4.1 / 6.7 Central normalization | (a,b)=(5,2), x=2 | Natural 128, twist 4⁻³=1/64, product 2; inverse twist gives 8192 | Repaired early dictionary is consistent in all three layers. |
| 1.4 Coefficient quotient | O=ℤ₃, n=0,1,2 | A₀=0; A₁=𝔽₃; A₂=ℤ/9 with 3≠0, 3²=0 | n>0 retained in headline; no field/zero ring treated as DVR. |
| 1.4 Integer degrees | Spec A₂,F=O; i=−1,0,1 | Modules 0,A₂,0; using toNat at −1 alone would give A₂ | Real-body negative extension correct. |
| 1.4 Derived coefficient change | O→ϖO in degrees 0,1 | H⁰=0,H¹=k; tensor complex with k gives H⁰=k,H¹=k | Ordinary reduction of H⁰ gives wrong value 0. |
| 1.5 Contragredient | k=𝔽₅, δ=2, λ(1)=1 | δλ(1)=3; 3·2=1; wrong action gives 2·2=4 | Inverse-action law distinguishes the dual. |
| 1.5 Ramified Matlis comparison | ϖ²=p, p odd | Different generated by 2ϖ; trace-dual lattice (2ϖ)⁻¹O, not O | Retain character/different requirement for Pontryagin comparison. |
| 1.6 Headline, positive dimension | X=P¹_(A₂), F=O(2), ω=O(−2) | Dual of H⁰(O(−4))=0 equals H¹(O(2))=0; dual of H¹(O(−4))=A₂³ equals H⁰(O(2))=A₂³ | Works over ℤ/9 and k[t]/t², including char 2 and char 0 residue fields. |
| 1.6 Degree/trace controls | d=0; elliptic curve at n=1; F=0 | d=0 dual of A=A; outside degree 0 both sides 0. Elliptic RΓ(ω)[1] has H⁻¹=k,H⁰=k versus k[0]'s 0,k. Zero F gives 0=0 | No false trace isomorphism or natural subtraction. |
| 1.6 Wrong base/coefficient | B=k[ε,δ]/(ε,δ)², F=k | Hom_B(k,B) has dimension 2; its B-dual dimension 4, versus dim F=1 | DVR quotient and locally free hypotheses exclude example. |
| 2.1 Equivariant Čech headline | Trivial C₂ torsor over Spec O; one-open cover | Aₙ[C₂] has Aₙ-rank 2; invariants rank 1; Δ=1 gives rank 1 | Correct upstairs object, not its invariants. |
| 2.2–2.3 Torsor freeness | Split C₂ torsor over 𝔽₂; N=k over A₂ | Regular module rank 1 over k[C₂], trace(1,0)=1 although 2=0; k is not free over A₂ since ϖk=0 | No division by group order; coefficient flatness retained. |
| 2.4 Dual perfect model | P¹_k,F=O | RΓ(F): (H⁰,H¹)=(k,0); RΓ(F∨ω)=(0,k); unshifted dual reverses degree | Correct geometric coefficient and chain/cochain direction. |
| 2.5 Hyper-Tor edge | R=𝔽₂[t]/t², C=[R→tR] in degrees 1,0 | Both homologies k; Tor₂(k,k)=k→H₁(C)⊗k=k is iso; following map k→k is zero | Retain Tor₂, no false injection. |
| 3.0a Solid scheme convention | A=k[t], invert t | Scheme complement V(t) nonempty; D(t) is open. Integer-solid principal localization has the different closed-immersion interface | Retain (A,A)■ and the explicit comparison target. |
| 3.1–3.2 Actual correspondence map | Identity legs on Spec ℚ, coefficient ×2 or 0 | Unit/trace gives 1↦2 or 1↦0 | Excludes arbitrary/zero replacement of the chosen operator. R02 records solid input. |
| 3.3 Composition headline | Pullbacks x↦x+1 then x↦2x | Composite sends x to 2x+1; reversed order gives 2x+2 | Composition orientation retained; add solid coherence edge in R02. |
| 3.4 Fundamental class | Identity; q=t²; inseparable t²=s over 𝔽₂ | Identity differential 1; ramified differential 2t vanishes at t=0; inseparable algebra trace 0 | No automatic étale boundary trace or nonzero class assumption. |
| 3.6 Base-change headline | O→k, F=k | k⊗ᴸ_Ok has k in degrees −1,0; ordinary tensor only degree 0 | Retained Tor/flatness conditions reject false ordinary comparison. |
| 3.9 Transpose headline | Three-point cycle σ | ⟨σe₁,e₂⟩=1=⟨e₁,σ⁻¹e₂⟩; ⟨e₁,σe₂⟩=0 | Formula correct on retained finite-flat case. |
| 3.9 Proper nonfinite test | Both legs Bl_point(P²)→P² | Exceptional fibre dimension 1; generic fibre 0. Global map and transpose are 1 on k, paired value 1=1 | Original hypothesis excludes this source-supported case; R01. |
| 3.10 Contracted support | p₁=id,p₂=constant 0 on {0,1}, Z={1} | p₁⁻¹Z={1}, p₂⁻¹Z=∅; contraction false, complementary inclusion false | Both directions and orientation agree. |
| 3.10 Thickening / Frobenius | t↦t², Z=V(t); absolute Frobenius | Supports {0}={0}, ideals (t)≠(t²); Frobenius inverse support Z=Z | Set-theoretic definition, not ideal containment; ∅ and X also satisfy inclusion. |
| 3.11 Completion headline | k[x], I=(x),(0),(1) | Objects k[[x]], k[x], 0, respectively; completion unit sends x to x in first | Correct object supplier; Hom completion alone is insufficient. |
| 3.12 Filtration headline | One stratum with coefficient k[0], T=×2 | Sole E₁ term k, abutment k, both induced maps ×2; empty stratum contributes 0 | Retain enhancement and actual support triangle. |
| 3.13 Integral Hecke detection | Perfect O-complex representing k[0] | Integral identity acts 1 on k; tensor with E gives zero object and zero map | Generic-fibre equality cannot prove integral convolution. |
| 4.2 Integral division | T=ϖ²id on O; k and exponents 0,1 | Unique quotient id over O; on k, ϖ⁰ kernel 0, ϖ kernel k | Repaired endpoint k>0 correct. |
| 4.3 Spin polynomial | q=2,(T₀,T₁,T₂)=(1,3,2) | X⁴−3X³+14X²−24X+64; reciprocal 1−3X+14X²−24X³+64X⁴ | Correct coefficient order and q powers. |
| 4.3 q=1 and generator labels | Formal q=1,(1,4,4); ℓ=2 | Polynomial (X−1)⁴; similitudes ℓ and ℓ² give factors 1/8 and 1/64 | Formal q=1 only; geometric generator dictionary preserved. |
| 4.4 GAGA/tower headline | P¹_ℂ,O; dual-number point | Both H⁰=ℂ,H¹=0; both nonreduced H⁰=ℂ[ε]/ε² with ε≠0 | Properness and nilpotents retained; trace gap remains separate. |
| 5.0 Quotient descent | C₂ at p=3,2, fixed boundary point | At p=3, e=(1+σ)/2 has e²=e; at p=2, invariant 1+σ also has augmentation 0 | Order condition and compactified stabilizer argument necessary. |
| 5.0 / 5.10 / 5.11 EO regularity | k[x,y]/x² and k[x,y]/(xy,x²), boundary y | First localization kernel 0; second kills x≠0. Koszul(x,y) over k[x,y] has only H⁰=k | Geometry/regular-sequence input distinguished; R02 adds its dependencies. |
| 5.1 Formal coefficients | Toric ray; zero cone; q=t² | Canonical exponents ≥0, subcanonical >0; zero cone gives identical conditions; (q) pulls to (t²), reduced ideal (t) contains t∉(t²) | Correct monoid, empty intersection and ramified boundary test. |
| 5.2 Relative vanishing headline | n=0 versus 1 on a formally subcanonical chart | At n=0 coefficient I_D unchanged and R^iπ_*=0 for i>0; canonical O at n=0 is outside assertion; at n=1 allowed | Endpoint does not promise canonical untwisted vanishing. |
| 5.3 General PEL headline | d=3,μ=0,t=1,2; lengths 1,2,3 | Weights (3,1),(4,2),(4,4) and (4,2),(5,3),(5,5); first vanishing degrees 3,2,1. t=0 fails positivity | Both canonical i<d and subcanonical i>d, with length shifts, retained. |
| 5.4–5.6 Integral ranges | −8≤a,b≤20; p=2,3,5,7,11 | Counts by length: (0,0,0),(0,0,0),(36,33,33),(72,64,62),(144,120,108); all 672 reconstructed weights equal input, zero failed dominance/positivity/smallness tests | Independent finite arithmetic probe, not a claim of proving vanishing. |
| 5.7 Dual weight | (4,2), then (1,−1) | (3−b,3−a)=(1,−1), second application (4,2); exponent 2 remains 2 | Retain actual divided-power dual outside factorial-invertible range. |
| 5.8 Singular mod-p sample | p=5,a=4,3,6 | (4,2): sum 6,difference 2, H²_sub=H³_sub=0; (3,0): 3=(p+1)/2, H⁰_can=H³_sub=0; a=6 outside both | Boundary tags and inclusive endpoints correct. |
| 5.9 Twists/reduction headline | Two level bounds 2,5; complex O→ϖO | N=max(2,5)=5; without vanishing reduction map 0→k not onto; stalk O[0] gives onto O→k | Exact obstruction retained; no all-level uniformity. |
| 5.13–5.14 Convolution/local factors | Unit coset; algebra A₂×A₂ | Unit operator 1; e₁²=e₁,e₂²=e₂,e₁e₂=0,e₁+e₂=1 | Actual integral action and derived factors, not mere H⁰ action. |
| 5.15–5.16 Residual localization | Characters 1,1,1,χ; O[t]/t(t−ϖ) | Pair products 1,χ disagree for χ≠1; generic roots 0,ϖ reduce to one residual root with two-dimensional generic block | Form/multiplier and congruence block retained. |
| 6.2–6.3 Su headline | Trivial coefficient, compact point; full/parabolic SL₂ pair | Point complex V[0]; full relative H²=ℂ, parabolic H²=0 | New gap fixes the pair rather than renaming a full-pair theorem. |
| 6.4 Harris headline | Connected compactified modular curve, nonempty cusp set | Constant section 1 restricts to 1 on D; its cusp/interior contribution is 0 | Canonical and cusp spaces cannot be identified wholesale. |
| 6.5–6.6 Images/multiplicity headline | ℂ²→ℂ,(x,y)↦x; multiplicity 2,fixed-vector dimension 3 | Source 2,kernel 1,image 1; injective summand with relative dimension 1 contributes 2·1·3=6 | Image and spectral source distinguished; multiplicity retained. |
| 6.8 Holomorphic dictionary | (k,r)=(0,2),(0,3) | Parameters (−1,0;4),(−2,−1;6); reconstructed k=0,r=2,3 | Limit endpoint retained. |
| 6.9 Product degree headline | Two real places with permitted degree 0/1 choices | Degree counts 1,2,1; with finite-part dimension 3, contributions 3,6,3 | Full component conditions retained before taking this count. |
| 7.0 Central/transfer convention | (a,b,c)=(5,2,−4) | w=1; coefficient −1 plus representation 1 gives 0. Dual spin orbit (3/2,3/2,−5/2,−5/2) sums −2; original orbit sums 2 | Correct contragredient assignment, not label matching. |
| 7.1–7.2 Chambers headline | Shifted pairs (2,1),(2,−1),(1,−2),(−1,−2); (1,0) | Chamber memberships {0},{1},{2},{3}; (1,0) has {0,1} | Closed walls and singular endpoints retained. |
| 7.3 Singular decomposition sample | R_sing=5,k=4 | λ₁=−5, −λ₁=5≥5; wrong λ₁≥5 false. A three-dimensional finite part with multiplicities 2,1 gives 6,3 | Correct source sign; equality needs extra packet input. |
| 8.1–8.2 Rational boundary headline | Spin system ρ₂⊕χρ₂ | Invariant subspace dimension 2<4; absolute irreducibility forbids this full polynomial system | All-degree rational conclusion uses full polynomials, including char 2. |
| 8.3 Exceptional boundary | k=0,1, Hecke eigenvalue t=3 | Sheaves ω²,ω³(−cusp); doubled operator eigenvalue 6=2·3 in k=0 case | Correct source's exceptional-index slip. |
| 8.4 Boundary Satake sample | α=1,β=2,u=4,q=2 | (X²−3X+2)(X²−12X+32)=X⁴−15X³+70X²−120X+64; uD=8=q³T₀ for T₀=1 | Correct four roots 1,2,4,8; determinant reciprocal has constant 1. |
| 8.5–8.6 Totally real boundary headline | l=(2,3); l=(2,2),k=(2,4); H⁰(D)_m=0 | First boundary contribution 0; second has Hilbert weight (2,4), not parallel. LES gives H⁰_sub≃H⁰_can, H¹ kernel 0 | Nonparallel gap is real; no higher-degree boundary assertion inferred. |
| 8.7 All-weight rational sample | a=2; one allowed pair with dim π_f^K=3 | Shifted (1,0), degrees {0,1}; paired contributions 3,3. Removing generic partner gives 3,0 | Conditional pairing retained at lowest endpoint; no large-weight shortcut. |
| 8.8 Large-gap sample | R_sep=3,R_gap=5; (8,4),(12,6),(8,2) | Pairings respectively (5,7,9,2),(7,11,15,4),(7,7,7,0). First excluded; second all >3; last singular zero allowed and other pairings >3 | Uniform repaired threshold passes both branches. |
| 8.8 Localized injection | Two l=2 places; multiplicity 2,dim π_f^K=3 | Degree 0 source contribution 6; degree 1 source contribution 12 | Injection gives lower bounds; equality additionally needs gap assumptions. |
| 8.9 Dimension headline | l₀=0,1,2 and h⁰=3 | l₀h⁰=0,3,6, matching h¹ under pairing; rational l₀=1 gives 3=3 | Conditional hypotheses retained; totals not confused with one contribution. |

The checks also exclude an empty nonempty-cover substitution, loss of finite-dimensionality by replacing a proper curve with A¹ (H⁰=k[x]), a field as a DVR, and using a characteristic-p trace test in place of full characteristic polynomials. No formula uses the degree of the zero polynomial, an out-of-range finite index, or natural subtraction for d−i. Coefficient division occurs only after the stated inversion or divisibility hypothesis.

### Pinned declarations and duplication audit

The content main commit is `86e155cac97365a2b24380c270383cd1d01628be`. The manifest pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Native declarations were read at these pins. A native carrier's existence was not treated as existence of the headline comparison theorem.

| Object opened | Declaration and pinned repository-relative location | Scope checked |
|---|---|---|
| Relative dimension | `AlgebraicGeometry.SmoothOfRelativeDimension`, `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:127` | Fixed relative dimension through smooth charts; properness separate. |
| Locally free / finite presentation | `SheafOfModules.IsLocallyFree`, `Mathlib/Algebra/Category/ModuleCat/Sheaf/LocallyFree.lean:61`; `SheafOfModules.IsFinitePresentation`, `Mathlib/Algebra/Category/ModuleCat/Sheaf/Quasicoherent.lean:269` | Locally free alone allows infinite rank; separate finite-presentation binder is retained. |
| Exterior powers | `SheafOfModules.exteriorPower`, `TauCeti/Algebra/Category/ModuleCat/Sheaf/ExteriorPower.lean:49` | Sheafifies sectionwise powers; supplies the determinant carrier, no proper duality. |
| Differentials / internal Hom | `AlgebraicGeometry.Scheme.relativeDifferentials`, `TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.lean:85`; `AlgebraicGeometry.Scheme.Modules.instMonoidalClosed`, `TauCeti/AlgebraicGeometry/Modules/TensorProduct.lean:63` | Relative base morphism and closed monoidal sheaf operations are genuine native data. |
| Additive cohomology | `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`, `cohomologyFunctor`, `cohomologyZeroEquiv`, `cohomologyZeroEquiv_naturality`, `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean:61`, `:66`, `:80`, `:86` | Underlying abelian-sheaf cohomology and natural H⁰; no properness/finiteness assertion. |
| Base-linear cohomology | `AlgebraicGeometry.Scheme.Modules.cohomologyBaseModule`, `cohomologyMapBaseLinear`, `cohomologyZeroBaseLinearEquiv`, its naturality theorem, `TauCeti/AlgebraicGeometry/Cohomology/Module/Base.lean:45`, `:57`, `:110`, `:127` | Restriction of scalars from global functions; linear maps and natural sections comparison. Scalar-derived RΓ comparison is still a gap. |
| Connecting map | `TauCeti.AlgebraicGeometry.Scheme.Modules.cohomologyδBaseLinear`, `TauCeti/AlgebraicGeometry/Cohomology/LongExactSequence.lean:242` | Actual short exact coefficient sequence and n₀+1=n₁. |
| Divisor curve duality | `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.cohomologyOneDualEquivCohomologyZero`, `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/SerreDuality.lean:113` | Field, integral separated Noetherian curve, DVR stalks, valuative existence, coheight/function-field/constant-field data and chosen differential divisor. |
| Line-bundle curve duality | `TauCeti.AlgebraicGeometry.InvertibleSheaf.nonempty_cohomologyOneDualEquivCohomologyZero_tensor_dual`, `TauCeti/AlgebraicGeometry/LineBundle/SerreDuality.lean:99` | Field-valued curve line bundles; no comparison of its canonical class with relative Kähler differentials or general finite-coefficient duality. Not a one-lemma proof of the headline. |
| K-projectivity | `CochainComplex.isKProjective_of_projective`, `Mathlib/Algebra/Homology/HomotopyCategory/KProjective.lean:113` | Upper-bounded projective-term complex. |
| Derived morphism lifting | `CochainComplex.IsKProjective.Qh_map_bijective`, `Mathlib/Algebra/Homology/DerivedCategory/KProjective.lean:43` | K-projective source and derived-category instance; bijection of homotopy classes, not a strict simultaneous action. |

The native locally free field is `∃ q : LocalGeneratorsData M, q.IsLocallyFreeData`; its index set is not required to be finite. The separate finite-presentation field is `∃ (σ : QuasicoherentData M), σ.IsFinitePresentation`. These definitions do not include properness or a duality comparison. This is why both coefficient binders and the geometric properness binder were checked explicitly.

Object searches used the roadmap service across main and indexed open heads, plus board package READMEs, for coherent duality/Matlis/perfect objects, hyper-Tor, completion, formally canonical coefficients, Cousin/EO geometry, scheme solid operations, parabolic regularization, boundary Satake and singular/cuspidal contributions. The board-package index was read before resolving its heads. An additional search of all indexed roadmap Lean files for all three fully qualified declaration suffixes returned no match. The pinned library search found the existing field/curve dualities above, rather than relative Aₙ duality.

No additional owner was found for the scheme (A,A)■ six-operation interface: SolidAnalyticRings supplies coefficient categories; VStackSheavesAndLisseCategories supplies the different integer-solid scheme interface. The retained EO targets in §5.0 provide the Hilbert–Siegel geometry needed before this roadmap's integral convolution theorem. IgusaVarietiesAndTorsionConcentration IG.2.12–IG.2.13, at `TauCetiRoadmap/IgusaVarietiesAndTorsionConcentration/README.md:1283` and `:1306`, have overlapping EO/affineness theory but are later in the merge order. The prerequisite is owned here and should be imported there; no upward supplier edge is introduced. Generic Cousin resolutions remain with SchemeAndStackFoundations.

### Supplier citations resolved this round

The 22 supplier subsections were checked against current main for existing roadmaps and indexed heads for new roadmaps. Grouped citations below give section ranges and a concrete file anchor; they do not claim that an entire range fits on its anchor line. Revision pull requests were not used to supply extensions of existing roadmaps.

| Supplier and repository-relative anchor | Resolved contract and ownership boundary |
|---|---|
| `TauCetiRoadmap/AutomorphicBundles/README.md:2019`, `:3072`, `:3133`, `:4887` | B0–B5, B3.10, B3.BGG, B5.10: parent bundles, good-prime integral coefficients, characteristic-zero BGG and section Hecke action. New deep-level/integral/cohomological extensions are distinguished. |
| `TauCetiRoadmap/AlgebraicVectorBundles/README.md:215` | L0A–L0C: tensor, dual, pullback, determinant and polynomial sheaf operations imported. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3437`, `:3959`, `:4094`, `:4275`, `:4558`, `:5448` | §§1.1, 2.6–2.8, 2.18–2.21, 2.23, 4.8–4.10: descent, scalar-derived cohomology, support/Cousin theory, proper duality, formal functions and effectivity; stated boundedness and Tor conditions retained. |
| `TauCetiRoadmap/DerivedModuleAlgebra/README.md:1733`, `:2200` | §§0.2–0.3, 1.1.1, 1.3–1.5, 1.E.0–1.E.1, 1.M.1–1.M.2, S.1: tensor/Hom, completion, perfect retracts/effectivity, arbitrary-residue-field Matlis and signed spectral sequences. |
| `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:1475`, `:1491`, `:1525` | §§7.1, 7.3–7.10: nilpotent lifting, signed duality, strict towers, Hom completion, blocks and coefficient filtration. Repaired §7.10/§7.8 distinction matches actual text. |
| `TauCetiRoadmap/ShimuraCompactifications/README.md:2642`, `:2717`, `:2885`, `:2920` | C3, C4.1–C4.11, C4.16–C4.17, C5.3–C5.31: toroidal/minimal models, spans, refinements, normalized models and formal coefficient condition. Proper blow-ups are not finite-flat maps. |
| `TauCetiRoadmap/LanglandsParameterStacks/README.md:729` | LP3.0 gives field-valued Weyl/dual-Weyl theory; integral lattice extension remains a gap. |
| `TauCetiRoadmap/ComplexComparisonPartII/README.md:1663`, `:2106` | C1.9, C2, C3.3: proper/projective and derived coherent GAGA, including nonreduced objects; actual trace compatibility remains separate. |
| `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:3489` | SR.0–SR.4, especially SR.4.5: smooth towers, convolution/opposite conventions, induction and spin Satake normalization. Klingen factor contract is additional. |
| `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md:1661`, `:1773`, `:3058`, `:3106` | §§2.2–2.3, 3a.1–3a.2, 3b.1–3b.2: finite derived-image blocks, spin polynomial, residual symplectic/non-Eisenstein data and dual/twist transport. |
| `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:1033` | §§1.1–1.3, 4.1–4.2, 6.1–6.7: cochains, components, chambers, Kostant and occurrence calculations. §6.6's first global bound is distinct from its negative-singular bound. |
| `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:2439`, `:2745`, `:2844`, `:2859` | §§4.1–4.5, 4.10, 5.1–5.8: multiplicities, tempered cuspidality, weighted full-pair regularization, finite-character comparisons and acyclicity. The missing parabolic regularization is now expressly a contract. |
| `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4153` | §11.1 under GSp4ClassificationInputs and the unitary normalization: conditional general-type transfer, local parameters, cuspidality and multiplicity-one permitted packet members. |
| `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:1084`, `:1219`, `:1572`, `:3147` | §§1.1–1.12, 2.2, Layer 5: continuous representations, full-polynomial recognition, stable lattices, forms and Frobenius/dual transport. Trace alone in char 2 is not substituted. |
| `TauCetiRoadmap/WeightsInEtaleCohomology/README.md:543`, `:627` | R34.5–R34.6: classical weights at least two and source-qualified Hilbert realizations. Weight one is outside this contract. |
| `TauCetiRoadmap/ModularCurvesPartII/README.md:3741`, `:3850` | §§14.1–14.4a: parabolic coefficient systems, finite/adic realizations, finite-pair adapter and Hecke/level transport. |
| `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md:3836` | R18.3.29(a): every totally real field, parallel k≥2, including even degree without a finite discrete-series place; arithmetic representation is dual to geometric normalization. |
| `TauCetiRoadmap/CrystallineCohomology/README.md:8383`, `:8975`, `:9555` | CR.5.1, CR.5.3–CR.5.4, CR.DDR.6.11–CR.DDR.6.14: logarithmic structures and comparisons. They do not already give the coefficient vanishing with its ampleness/lifting hypotheses. |
| `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:549`, `:1290`, `:1512` | §§0.1–0.3, E1.3, E2:towers, E3.2–E3.3, E5:abstract: coherent enhanced categories, diagrams, limits and tensor/Hom; no functorial cone inferred in a bare triangulated category. |
| `TauCetiRoadmap/SolidAnalyticRings/README.md:193`, `:267`, `:631`, `:689` | §§1.5, 2.2, 6.4, 7.1–7.2: coefficient solidity, reflection, complete tensor and scalar extension; prime-completion hypotheses kept separate. |
| `TauCetiRoadmap/VStackSheavesAndLisseCategories/README.md:709` | VS2.2: analytic measures/complete modules, plus integer-solid spectra; scheme principal opens here use the different (A,A)■ construction. |
| `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:9418` | §7.5 fundamental_class_boundary: finite-flat or determinant fundamental classes with relative Cartier and inverse-image boundary conditions, not arbitrary base-change compatibility of a determinant class. |

### Nine declared supplier gaps

All nine slugs occur in both `packages/AutomorphicBundlesPartII/design/plan.json` and the matching README supplier subsection, with the same needs sentence, named supplier and section. None has supplier `none`; none asks for an already imported object. The compatibility clauses describe one interface apiece, rather than unrelated work. Missing supplier proofs are not findings.

| Slug | Minimality / discriminating value |
|---|---|
| integral-dual-weyl-lattices | LP3.0 field modules do not select integral lattices; char-2 cross coefficients 0 versus 1 distinguish symmetric/divided powers. |
| coefficient-linear-coherent-comparison | Base-linear cohomology already exists, but the derived comparison does not. At Spec O it must identify ×ϖ with ×ϖ, not merely additive carriers. |
| gaga-duality-trace | Existing GAGA leaves actual counit compatibility to prove; degree-two split trace gives (a,b)↦a+b and 2 on the pulled-back unit on each side. |
| boundary-spin-satake | Local Klingen restriction is additional to the spherical spin polynomial; roots 1,2,4,8 give uD=q³T₀=8. |
| coefficient-logarithmic-splitting | Lan–Suh relative coefficient vanishing is additional to log crystalline comparison. For p=7,e=3, m=0 satisfies m<4; m=4 does not. |
| integral-small-weight-dual-bgg | Characteristic-zero parent BGG does not supply integral p-small lattices; length three shifts first subcanonical vanishing to degree 1. |
| classical-weight-one-realization | Existing range starts at 2; requested weight 1 is outside it, while preserving a rank-two full polynomial. |
| nonparallel-hilbert-realization | Parallel (2,2) is supplied; common-parity (2,4) requires the additional existence range. |
| su-parabolic-regularization | Existing full-pair de Rham comparison has H²=ℂ on the SL₂ control, whereas the required parabolic complex has H²=0. Central inverse action and all-degree/Hecke naturality are explicit. |

### Dependency gate and package shape

The required gate was run with the specified configuration, README, roadmap name, order and `--movable`. Its output was:

```text
moved: AutomorphicBundlesPartII moved in the merge order from #178 to #230, right after its last supplier AutomorphicBundles; checked as moved (the worker moves it there when it submits)
depcheck: 51 roadmaps, 601 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The move is permitted and is not a finding. The internal extraction has 69 sections, 70 Needs lines, 158 local edges and zero cycles, including expanded local section/layer ranges; aggregate summaries were also read. The five R02 additions were tested separately and remain acyclic. The citation resolver, using main and the 362 indexed open heads, found no unresolved cross-roadmap citation or backticked name. Its success was not used to certify the mathematical strength of a supplier contract.

The README shape was compared with main's ComplexTori and LocalGaloisGroups roadmaps. It has the required summary, scope, conventions, exact suppliers, build paragraph, eight layers with examples/dependencies, downstream consumers, worked examples and references. Definition API blocks and their Check lists were read; all have at least three checks, with positive/negative and convention controls. No new own API name is claimed without its acceptance-file declaration. Metadata is unchanged. Apart from R02, the listed dependencies and routes are coherent.

### Headline completeness and Lean verification

Fifteen headline families were identified. The single statable family is present, and all fourteen others are individually named with missing genuine carriers in the module docstring.

| README headline | Acceptance-file coverage |
|---|---|
| §1.6 Finite-coefficient coherent Serre duality | `finiteCoefficientSerreDuality`, with the real-body coefficient quotient and integer cohomology extension. |
| Layer 2 Equivariant perfect models and deck descent | Named; lacks actual equivariant torsor/coefficient/derived realization. |
| Layer 3 Correspondence composition, base change and transpose | Named; lacks coherent upper shriek, trace and enhanced correspondence carrier. R01 repairs the README scope, not a Lean stand-in. |
| Layer 3 Solid completion and support filtration | Named; lacks scheme solid sheaves, completed locales and operations. |
| Layers 3–4 Normalized higher Hecke and GAGA/tower comparison | Named; lacks Shimura towers and geometric coefficient spans. |
| §5.2 Lan relative vanishing | Named; lacks PEL contractions and formal coefficient sheaves. |
| §§5.3–5.8 General PEL and integral/singular vanishing | Named; lacks integral model, Hodge, boundary and coefficient carriers. |
| §§5.10–5.15 Integral convolution and local factors | Named; lacks EO/Cousin/Hecke complexes on the actual models. |
| §6.3 Su comparison | Named; lacks growth and parabolic relative-cohomology carriers with their actual map. |
| §§6.4–6.6 Harris comparison and multiplicities | Named; lacks occurrence maps and spectral spaces. |
| Layer 7 Chambers and large singular decomposition | Named; lacks archimedean representation and coherent-image carriers. |
| §8.2 Rational all-degree boundary vanishing | Named; lacks the actual boundary coefficient and residual Hecke action. |
| §§8.5–8.6 Totally real boundary/interior comparison | Named; lacks Hilbert–Siegel boundary and coefficient maps. |
| §§8.7–8.8 Cuspidal injections and exhaustion | Named; lacks spectral multiplicities and geometric congruence localization. |
| §8.9 Conditional dimensions | Named; lacks those spaces and actual packet occurrence data. |

The specified `lake env lean` elaboration of `packages/AutomorphicBundlesPartII/Suggested.lean`, from the pinned content checkout, exited 0. Its only diagnostic was `Suggested.lean:67:8: warning: declaration uses 'sorry'`. All four named Tau Ceti object files were available; no module build was needed. Only the single `import Mathlib` and those four actual Tau imports occur.

A separate scratch copy with `#check @name` for all three declarations also exited 0. The quotient retains O and its CommRing/universe parameters. Integer cohomology retains R, its ring, X and the structural-map instance. The headline retains domain, DVR, maximal-ideal-adic completeness, irreducible ϖ, n>0, smooth relative dimension, properness, local freeness and finite presentation. These match §§1.4–1.6, including integer d−i and characteristic-zero/equal-characteristic coefficients. No binder was lost and nothing was changed.

The only sorried theorem was probed on a scratch copy with `simp`, `rfl` and `infer_instance`; none closed it. The first made no progress (and encountered the sheaf transparency limit); the second found no reflexive equality goal; the third could not synthesize the requested Nonempty equivalence. The exact-one-library-lemma alternative was checked by opening the native divisor and line-bundle duality theorems: both require field/curve carriers and neither states this relative Aₙ theorem. There is no padding finding and no statable headline omitted. No Lean process started by this review was left running.

## Not verifiable

- GK19 Remark 10.1.3, printed p. 962, remains settled as `uncertified`. It was not fetched or requested again. The explicit chamber controls and conditional supplier route were checked independently.
- H90 is an OCR extraction; some formula fragments and part of Theorem 2.7 are imperfectly recognized. Its numbered discussion was read, and the relevant cusp/interior claims were cross-checked against CG20 Theorem 5.2 and BCGP21's comparison discussion. This does not certify every symbol of the scan.
- Version-qualified manuscript locators were checked against their cached text. Independent publisher pagination for every manuscript and BR16's alternate Proposition 1.5.8 numbering were not certified; the available BR16 Proposition 1.14 numbering is the one used.
- The board index was read and its package heads were queried. Five of twenty explicit package README heads were readable: AnalyticNumberTheory, ArithmeticStatistics, AutomorphicCongruences, KatoEulerSystems and LogicAndDefinabilityInNumberTheory. The following fifteen supplied heads returned HTTP 404 at their package README endpoints: ArithmeticLocallySymmetricSpacesPartII `84a41ac`; CompletedCohomologyAndLocalGlobalCompatibilityPartII `948c94c`; CrystallineCohomologyPartII `84ea77e`; EndoscopicTransferAndUnitaryTraceComparisonPartII `80a66cc`; HigherHidaAndColemanTheory `da88512`; LawrenceVenkateshMethod `9ee7ac3`; OrdinaryAutomorphicFormsAndModularityLiftingPartII `7e88c38`; PELModuliPartII `d4bb48d`; PadicHodgeTheoryPartII `6502997`; PadicLocalLanglandsForGL2QpPartII `3e0777d`; RealSurfacePeriodIndex `875bca4`; SchemeAndStackFoundationsPartII `accb0a0`; ShimuraVarietiesPartII `57dc0a4`; VStackSheavesAndLisseCategoriesPartII `0987ba7`; VectorBundlesAndIsocrystalsPartII `b58d862`. Their existence is acknowledged; ownership against those inaccessible package texts is not certified.
- Separately named open pull requests without supplied sibling filesystem paths were not independently inspected as sibling checkouts. The roadmap service did search the available indexed heads and main; no further checkouts were sought. No claim of exhaustive ownership coverage over inaccessible files is made.

There is no unresolved request for a source text. These limitations do not prevent the two concrete findings or the completed checks above.

## Source issues

- **Misprint** in BP26 at §4.3.1, p. 46: the source says left translation evaluates at m⁻¹m′; it should be evaluation at m′⁻¹m; affects nothing.
- **Misprint** in P20 at §5.3, p. 25: the source says the tensor-twisted correspondence targets p₁!O; it should be p₁!Ω^(k,r), retaining the coefficient; affects nothing.
- **Misprint** in P20 at Theorem 15.2.2.1(2), p. 108: the source says the negative singular parameter satisfies λ₁≥R; it should be −λ₁≥R; affects a stated result.
- **Misprint** in P20 at Corollary 15.2.3.1, p. 108: the source says degree-one equality without residual localization on the left; it should be localized at m, matching the congruence-restricted right side; affects a stated result.
- **Misprint** in P20 at proof of Corollary 15.2.3.1, p. 109: the source says the exceptional ω² boundary sheaf occurs at k=2; it should be k=0; affects nothing.
- **Misprint** in P20 at Proposition 15.2.4.1, p. 109: the source says λ₁>0 for the previously defined singular family; it should be λ₁<0, as in §15.2.2; affects a stated result.
- **Misprint** in BCGP21 at proof of Lemma 3.10.7, printed p. 238: the source says four spin monomials with one diagonal repeated; it should be the four distinct diagonals (1,1,ϖ,ϖ), (1,ϖ,1,ϖ), (ϖ,1,ϖ,1), (ϖ,ϖ,1,1); affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "687a5648b2d81846bf4f4d8e7a736fd43ecf744d", "job": "REV-PKG-AutomorphicBundlesPartII~3", "model": "gpt-6-astra", "worker": "chris-17"} -->
