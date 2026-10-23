## H01 (CBirkbeck) — applied

In `TauCetiRoadmap/QWittVectors/README.md:811`, discreteness of every R̂_p for p|m → bounded p-primary torsion for every p|m as the hypothesis for relative (q^n−1)-completion discreteness; the separate coefficient-change equivalence retains p-completion on both sides. The Checks at lines 826–827 give the square-zero example, with T₂(R)=0 but a surviving Prüfer subgroup after ψ₂-twisting and hence nonzero H⁻¹ of relative completion; the descent argument now transfers a fixed torsion bound (wagner line 1118, line 1179, line 1621 and line 3123).

## H02 (CBirkbeck) — answered

SchemeKTheoryOperations §§6.2.1–6.2.2 and PrismaticCohomologyPartII §§3.16, 5.0, 5.13, 5.18–5.20 are prerequisites, as the contracts in `TauCetiRoadmap/QWittVectors/README.md:60` and line 92 state; the live PR description omits both in its dependency list and merge chain. The worker must add #1229 (SchemeKTheoryOperations) after #853 (AlgebraicModuliForArithmeticGeometry) and before #848 (ComplexComparisonPartII), and #1065 (PrismaticCohomologyPartII) after #1057 (PrismaticCohomology), in both places; PR-text edits are excluded from this job, and the dependency check validates the README graph rather than completeness of PR metadata.

## H03 (CBirkbeck) — applied

The general étale-DGA extension is attributed to CrystallineCohomology §CR.4.6, “Witt localization and étale descent,” in `TauCetiRoadmap/QWittVectors/README.md:84`, line 100 and §7.7; DerivedDeRhamCohomology supplies ordinary de Rham and Cartier theory through §§2.1–2.21, 3.4–3.6. The imported mapping property retains B-linear morphisms, central degree zero and strict odd alternation, including at 2; this matches the existing general lemma at `TauCetiRoadmap/CrystallineCohomology/README.md:5915` and the construction at wagner line 2561.

## H04 (CBirkbeck) — applied

The blanket PrismaticCohomology attribution → precise imports of its §§0.68–0.69 and CrystallineCohomology §CR.2.2, with a QWittVectors adapter in `TauCetiRoadmap/QWittVectors/README.md:1312` (§9.6a). That stage explicitly owns the passage to arbitrary p-completely ind-smooth smooth-quotient presentations, p-regular δ-extension, completed multiplicative E∞ comparison and coherent presentation changes; §9.7 now consumes it, and `TauCetiRoadmap/QWittVectors/Suggested.lean:48` names its missing carriers (wagner line 3492, line 3518 and line 3528; bhatt-scholze line 968).

## Validation

`lake build TauCetiRoadmap.QWittVectors.Suggested` exited 0:

```text
⚠ [8976/8976] Built TauCetiRoadmap.QWittVectors.Suggested (20s)
warning: TauCetiRoadmap/QWittVectors/Suggested.lean:80:8: declaration uses `sorry`
warning: TauCetiRoadmap/QWittVectors/Suggested.lean:100:8: declaration uses `sorry`
Build completed successfully (8976 jobs).
```

Gate exited 0:

```text
gate QWittVectors: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency-direction output:

```text
depcheck: 26 roadmaps, 231 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The merge order places CrystallineCohomology at 18, SchemeKTheoryOperations at 33, PrismaticCohomologyPartII at 55 and QWittVectors at 67; no ownership move across the order is required.

All four declarations were re-elaborated together with `#check @name` and compared with §§1.1–1.2 and §8.1. No signature changed and no hypothesis disappeared:

| Declaration | Elaborated context compared with README | Result |
| --- | --- | --- |
| BigWitt.TruncationSet | Type with positive membership and positive-divisor closure; no coefficient ring | Same positive-index object, including ∅ |
| BigWitt.ghostPolynomial | Arbitrary universe, CommRing R, n : ℕ, x : ℕ→R | The README explicitly distinguishes this unital signature from its planned nonunital extension |
| BigWitt.ghost_image | CommRing R, S, independent endomorphisms φ, prime-lift congruences hφ, b | No torsion-free or commuting-lift hypothesis; n∈S and p|n force positive indices |
| QWitt.framedGamma_existsUnique | Two arbitrary universes; both commutative rings; A→R and A[T]→R; scalar tower; Algebra.Etale A[T] R; i : Fin r | All algebra, tower and étale instances retained; automorphism is over PowerSeries A and preserves constant coefficients |

The Lean change is confined to the module docstring: the PD adapter is listed with the other unavailable headlines and its δ-presentation/PD-de-Rham carriers are identified. No stand-in declaration or new definition was added.

## Sources, ownership and citation evidence

Main was read at a07e2024f391f3022520c3f8ad194912b3eab614. The two main roadmap examples read for form were DerivedModuleAlgebra and EtaleCohomologyFoundations. Supplier references were resolved against that main or the indexed open heads, and the given 25 sibling roadmap folders and board packages were searched by the objects: étale extension of a differential, PD presentations, δ-envelopes and their completed comparison. The additional adapter is the assembly needed by the existing smooth q-Witt comparison; it imports generic PD theory and does not introduce another generic PD envelope or étale-DGA construction. HabiroCohomologyFoundations's envelope/gluing comparisons consume QWittVectors and its own §8.5 imports the distinct q-PD framing comparison; neither is a supplier to this adapter. No Lean declaration was assigned another roadmap's fully qualified name.

| Contract | Exact material read | Consequence |
| --- | --- | --- |
| Relative versus absolute completion | wagner line 1083 (Cor. 2.24), line 1118 (Cor. 2.26), line 1141, line 1179, line 1621 (Remark 2.47), line 3123 (§4.19) | Finite freeness justifies the absolute discreteness result; a bounded primary-torsion bound transfers through a flat twist, whereas a zero Tate module need not |
| Étale DGA extension | wagner line 2561, especially line 2566; CrystallineCohomology §CR.4.6, lines 5915–5917 | Import the general extension and mapping property; B-linearity follows from killing B; tensor products preserve strict odd alternation |
| Ordinary de Rham and Cartier | DerivedDeRhamCohomology §§2.1–2.21 and §§3.4–3.6; its polynomial Cartier target at line 3677 | Relative polynomial Cartier theory has arbitrary characteristic-p base and the Frobenius-twisted source |
| δ-envelope boundary | bhatt-scholze line 968 (Cor. 2.39); PrismaticCohomology §§0.68–0.69 | The existing theorem has finite mod-p regular-sequence and p-regular hypotheses; passage to the presentations used here is an explicit adapter target |
| PD Poincaré and presentation changes | CrystallineCohomology §CR.2.2, line 1694 and its embedding-independence targets | Import the contraction and generic presentation comparisons |
| Completed enhanced adapter | wagner line 3492, line 3496, line 3518, line 3524, line 3528 and line 3535 | Retain the multiplicative comparison, presentation category, completed tensor coproducts and functorial free δ-presentation |
| Elementary λ supplier | SchemeKTheoryOperations §§6.2.1–6.2.2, lines 1698–1712 | Only PreLambda, Hom, Special, integral identities and Newton operations are consumed; no scheme K₀ input |
| Complete framed supplier | PrismaticCohomologyPartII §3.16, line 550; §5.0, line 1582; §§5.13–5.20, lines 1900–2099 | The named framing, skew product, Frobenius comparison and framing-change interfaces exist at the cited sections |
| Other retained suppliers | DerivedModuleAlgebra §§0.K.1, 0.2, 1.1–1.9; DGAInfinity Layers 0–1; AInfCohomology §§AI.1.1–AI.1.7; EnhancedDerivedSheaves §0.3, E5:abstract and E5:spectra-comparison; BordismFormalGroups §F6.5; SchemeAndStackFoundations §§0.23a, 0.24, 0.29, 4.1; HabiroCyclotomicCompletions's cyclotomic ideal stages | The citations and declared names resolve; no supplier/consumer reversal was introduced |

All source texts needed for the repairs were available legally under the existing manifest keys. No new work, duplicate key or missing-text request was introduced; the additional Corollary 2.39 locator uses the existing bhatt-scholze work.

The library copies matched the manifest: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The citation resolver found no unresolved cross-roadmap citation or roadmap Lean name after the edits; its library lookup was unavailable, so the library declarations were verified directly at those pins:

| Pinned file | Declarations and native scope verified |
| --- | --- |
| Mathlib/RingTheory/WittVector/Defs.lean:52 | WittVector has `coeff : ℕ → R`; ext at line 77 compares coefficients; the prime is fixed and this is the p-typical carrier |
| Mathlib/RingTheory/WittVector/Basic.lean:253 | map, map_coeff (267), ghostMap (287), ghostComponent and ghostComponent_apply (299); ring structure retains CommRing and Fact p.Prime |
| Mathlib/RingTheory/WittVector/Truncated.lean:62 | Carrier `Fin n → R`; instCommRing (270), WittVector.truncate (288), coeff_truncate (303), TruncatedWittVector.truncate (334); length zero is allowed |
| Mathlib/RingTheory/WittVector/Frobenius.lean:218 | frobenius; ghostComponent_frobenius (240); characteristic-p equality with map (270); frobeniusEquiv (283) additionally needs PerfectRing |
| Mathlib/RingTheory/WittVector/Verschiebung.lean:109 | verschiebung; coefficient shift (150) and injectivity (154) |
| Mathlib/RingTheory/WittVector/Teichmuller.lean:93 | Multiplicative teichmuller and its ghost formula (124) |
| Mathlib/RingTheory/Etale/Basic.lean:46 | FormallyEtale records vanishing of Kähler differentials and H1Cotangent; Etale at 205 adds finite presentation, not finiteness as a module |
| Mathlib/RingTheory/Kaehler/Basic.lean:355 | Universal derivation and linearMapEquivDerivation |
| Mathlib/RingTheory/TensorProduct/Basic.lean:277 | includeRight fixes the right scalar factor |
| Mathlib/RingTheory/PowerSeries/Basic.lean:76 | coeff, constantCoeff (139), algebraPowerSeries (942); arbitrary commutative coefficients |
| Mathlib/RingTheory/PowerSeries/Inverse.lean:109 | isUnit_iff_constantCoeff |
| Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:278 | Φ₀=1, Φ₁=X−1 (283), divisor product (337), omitted-one product (357) |
| Mathlib/RingTheory/Polynomial/Cyclotomic/Expand.lean:38 | Integral expansion identities (38,87); characteristic-p identities (131,145) retain the prime and divisibility hypotheses |
| TauCeti/RingTheory/Kaehler/FormallyEtale.lean:58 | Scalar tower and formally étale hypothesis precede kaehlerBasisOfFormallyEtale (67) and its basis-vector formula (71) |
| TauCeti/RingTheory/WittVector/Complete.lean:197 | isAdicComplete_span_p_teichmuller retains characteristic p, perfectness and the input adic completeness |
| TauCeti/RingTheory/WittVector/Frobenius.lean:65 | continuous_frobenius; inverse continuity (79) retains perfectness and the adic-topology hypothesis |
| TauCeti/RepresentationTheory/Homological/ContCohomology/Bockstein/Basic.lean:92 and Integral.lean:136 | explicitBockstein1 and integralBockstein concern continuous group cohomology, not the regular-parameter DGA construction |

## Adversarial mathematics record

Rows record concrete witnesses and negative controls, not proofs from successful elaboration. For the repaired statements the rows separate each assertion; the remaining rows record the roadmap's defining objects and identities against its Checks. Parameters excluded by a statement (noncommutative coefficient rings, n=0 where n>0 is required, non-étale maps, or singular algebras in smooth results) are negative controls, not extra accepted inputs.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| §5.3 bounded primary torsion survives flat scalar extension | M killed by 4; flat twist F | 4(M⊗F)=0=4M⊗F; ker(2^j)⊗F=ker(2^j on M⊗F) | A fixed bound transfers | Bound is the discreteness hypothesis |
| §5.3 bounded h_n-power torsion gives discrete completion | h_n=q^n−1; h_n^c kills all h_n-torsion | In a compatible tower, x_j=h_n^c x_(j+c)=0; H⁻¹=0 | Ordinary and derived completions coincide | State the ordinary comparison explicitly |
| §5.3 coefficient-completion equivalence | A=R=ℤ, m=2 | Both p-completed sides ℤ_p[q]/(q²−1) | Same coefficient map | Retain both completions |
| §5.3 original integer-torsion hypotheses | A=ℤ, R=ℤ/4, m=1 | 2≠0 but 2·2=0 in Q₁=ℤ/4 | Perfect coverage does not remove R-torsion | No narrowing of R |
| §5.3 square-zero module definition | r=0,1/3,4/9,13/27 | f=1,2,3,4; orders 2,4,8,16; exponent increments 1/3,1/9,1/27 | Domain and finite maximum explicit | Add negative Check |
| §5.3 square-zero module action | e₀ acted on by t^(1/3) then t^(1/9) | 2e_(1/3)↦4e_(4/9)=t^(4/9)e₀; at exponent 1/2 or above both composites are 0 | Powers telescope and preserve orders | Add module-law witness |
| §5.3 perfect cover | u=2, v=0; u=4, v=1 | A[t^(1/2)] has basis 1,t^(1/2); A[t^(1/12)] has four residue-exponent basis vectors | Free positive ranks, integral inclusion; ψ_k on rational exponents invertible | Add explicit base and cover |
| §5.3 T₂ of original coefficients | Each fixed cyclic coordinate ℤ/2^f(r) | Intersection of 2^j multiples is 0; every compatible tower has all projections 0; T₂(M)=T₂(R)=0 | Original completion is discrete | Demonstrate weaker hypothesis |
| §5.3 Adams-twisted exponent component | Stage generators t, t^(1/3), t^(1/9) | t=ψ₂(t^(1/3))t^(1/3); t^(1/3)=ψ₂(t^(1/9))t^(1/9) | Transition maps correct | Add twist calculation |
| §5.3 Prüfer subgroup in N | e₀→2e_(1/3)→4e_(4/9) | Orders of stage generators 2,4,8; each transition preserves the preceding order | Colimit ℤ[1/2]/ℤ, not 0 | Add negative Check |
| §5.3 absolute square-zero kernel | (x₁,x₂) in W_{1,2}(A⋉M) over W_{1,2}(A) | Products of M-coordinates 0; F₂(x₁,x₂)=2x₂; V₂(x)=(0,x) | q=−1 on first coordinate, q=1 on V-coordinate | Verify the presentation used by Check |
| §5.3 relative linearity | First τ₂(am); proper V₂(am) | τ₂(am)=ψ₂(a)τ₂(m); V₂(am)=aV₂(m) | First component N survives; proper-V relations affect second component | Add split square-zero description |
| §5.3 non-discrete relative completion | z_j=(−1)^(j−1)e_(r_(j−1)) in the colimit | (q−1)z_(j+1)=−2z_(j+1)=z_j, 2^j z_j=0, z₁≠0 | H⁻¹ contains nonzero T₂(N) | Exclude false implication |
| §5.3 uncompleted coefficient target | Infinite toric base; m=p=2 | Mod 2^n the sum Σ_(1≤i<n)2^i e_(T_i) has finite support; the limit has infinite support | Uncompleted target need not be complete | Retain prior Check |
| gap:ordinary-derham étale extension | P=Ω*_{ℤ[T]/ℤ}, S=ℤ[T,T⁻¹] | d(T⁻¹)=−T⁻²dT; 1⊗d on the new scalar would give 0 | Unique extension is nontrivial | Import CrystallineCohomology §CR.4.6 |
| gap:ordinary-derham B-linearity | B=ℤ[q], P=Ω*_{B[T]/B}, localize T | d(q)=0, d(qT⁻¹)=−qT⁻²dT=q d(T⁻¹) | Relative coefficients remain constant | Specify B-linear morphisms |
| gap:ordinary-derham strict odd alternation | B=𝔽₂; ω=a u+b v in exterior degree one | ω²=a²u²+ab(uv+vu)+b²v²=0; in 𝔽₂[u], u²≠0 | Tensor extension preserves the stronger condition | Keep strict alternation at 2 |
| gap:ordinary-derham mapping property | Identity localization versus map T↦2 into Ω*_{ℚ/ℤ} | T⁻¹↦1/2; dT↦0 and d(T⁻¹)↦0 on both paths | Extension determined by P and S maps | Attribute existing property |
| §7.7 centrality boundary | P⁰=ℤ[x], P¹=ℤ[x]u, ux=0; invert x | Compatible multiplication would give u=(ux)x⁻¹=0 but scalar extension leaves u≠0 | Noncentral associative DGA excluded | Retain negative Check |
| §9.6a B and δ reconstruction | B=ℤ₂, x toric | φ(2)=2, δ(2)=(2−4)/2=−1; φ(x)=x², δ(x)=0 | Coefficient and variable δ conventions distinct | Explicit adapter context |
| §9.6a zero-kernel comparison | R=A, π=id_B | D(π)=B, Ω⁰=B, Ω^(i>0)=0; augmentation=id | Identity source and target | Add Check |
| §9.6a invertible-p boundary | A=ℚ, any fixed p | B=0, R̂_p=0, completed PD/de Rham objects 0 | No prime omitted | Add Check |
| §9.6a PD polynomial contraction | x^[1], x^[2], x dx | hd(x)=x; hd(x^[2])=x^[2]; dh(x dx)=x dx; d(1)=0 | dh+hd=id−ev₀ | Add explicit normalization |
| §9.6a induced δ on PD envelope | p=2, δ(x)=0 | δ(x^[2])=(x⁴/2−x⁴/4)/2=x⁴/8=3x^[4]≠0 | Zero δ on divided powers fails | Add negative Check |
| §9.6a p-regularity | Completed PD polynomial model over ℤ_p | Coefficients in the PD basis have px=0 only when every coefficient is 0 | Finite regular model satisfies required conclusion | Make passage and p-regularity explicit targets |
| §9.6a presentation coproduct | Two free δ-presentations over B with x,y↦0 | Both augmentation paths send (1,x,y,dx,dy) to (1,0,0,0,0); induced H⁰ map id_B | Comparison agrees on the contractible models | Add coherence API and Check |
| §9.6a need for PD forms | Ordinary 𝔽₂[x] versus PD polynomial model | d(x²)=0 but x dx≠0 in ordinary H¹; d(x^[2])=x dx in PD model | Ordinary forms would give wrong comparison | Add negative Check |
| §9.7 adapter input | A=R=ℤ, prime-power index; then p=2,m=6 | Adapter augmentation=id in degree zero; scalar exponents are 2 and 6 in the two m=6 factors | Adapter does not alter Adams twists | Cite §9.6a in proof and Needs |
| Convention: positive indices and length | m=1, p=2,a=1; n=0 | Div(1)={1}; Div(2) has 2 coordinates; Fin 0 is empty | Length a+1, not a | Retained |
| Convention: total ghost polynomial | n=0,1,2 | divisors(0)=∅ gives w₀=0; w₁=x₁; w₂=x₁²+2x₂ | Theorems use n>0 | Retained |
| Convention: q-integers | n=0,1,2; q=1 | [0]=0,[1]=1,[2]=1+q; [2]_1=2 | Polynomial sum, no 0/0 | Retained |
| Convention: scalar twist | A=R=ℤ[U], n=2 | U⊗1=1⊗U²; ψ₂(U)⊗1=1⊗U⁴ | Right-factor direction fixed | Retained |
| Convention: completions | Ideals (0),(1) | Λ₀M=M; Λ₁M=0 | Zero and unit distinguished | Retained |
| Convention: cochain signs | K with D₁=∂X,D₂=∂Y on XY | d⁰(XY)=(Y,X), d¹(Y,X)=1−1=0 | Minus sign fixed | Retained |
| Convention: odd squares at 2 | 𝔽₂ exterior generator versus polynomial generator | u²=0 in exterior algebra; u²≠0 in polynomial algebra | Graded commutativity alone insufficient | Retained |
| §1.1 truncation sets and shifts | S=Div(6), n=2; S=∅; {2} | S/2={1,3}; (S/2)/3={1}=S/6; ∅/2=∅; {2} omits divisor 1 | Closure and empty case agree | Retained |
| §1.1 ghost evaluation | All x_d=1, n=6 | 1+2+3+6=12; coefficient-map reduction mod 2 gives 0 on both sides | Mixed divisors required | Retained |
| §1.2 ghost-image equivalence | ℤ, S=Div(2), φ₂=id | x=(1,1) gives (1,3), difference 2∈2ℤ; b=(0,1) has difference 1∉2ℤ and x₂=1/2∉ℤ | Both directions tested | Retained |
| §1.2 injectivity and empty set | 𝔽₂ and S=∅ | (0,0),(0,1) both ghost (0,0); on ∅ there is one S-coordinate sequence | Torsion hypothesis needed only for injectivity | Retained |
| §1.2 mixed prime congruences | ℤ, all coordinates 1 on Div(6) | (w₁,w₂,w₃,w₆)=(1,3,4,12); differences 8∈2ℤ,9∈3ℤ | Mixed index consistent | Retained |
| §1.3 Witt addition | τ(1)+τ(1) over ℤ at level 2 | Coordinates (2,−1) give ghosts (2,2); (2,0) gives (2,4) | Componentwise addition wrong | Retained |
| §1.3 nonunital construction | Zero-product ℤ; ∅ and zero ring | (a,b)+(c,d)=(a+c,b+d); product (0,0); empty carrier has one element | Unitization kernel correct | Retained |
| §1.4 Frobenius/Verschiebung | Div(2), x=(a,b), V₂(c) | F₂x=a²+2b; F₂V₂(c)=2c; F₁=V₁=id | Shift and scale fixed | Retained |
| §1.4 Teichmüller | τ(−1), −τ(1)+V₂τ(1) over ℤ | Both coordinates (−1,0), ghosts (−1,1) | Multiplicative, not additive | Retained |
| §1.4 projection formula | Level 2 over ℤ, x=(a,b), y=c | xV₂(c)=(0,(a²+2b)c)=V₂(F₂(x)c) | Nonunit factor allowed | Retained |
| §1.4a finite series comparison | N=2, x=y=(1,0) | γ(x+y)=γ(2,−1)=1+2t+3t²=(1−t)⁻² mod t³; wrong component sum gives coefficient 4 | Inverse-product convention fixed | Retained |
| §1.4a torsion/nonunital controls | 𝔽₂, (0,1); zero-product ℤ | γ(0,1)=1+t²≠1 despite zero ghosts; γ(a,b)=1+at+bt² in square-zero unitization | No torsion-free assumption needed | Retained |
| §1.4a restriction/naturality | ℤ, x=(1,1), reduce N=2→1 and mod 2 | 1+t+2t²→1+t on both paths | Coefficients and restrictions agree | Retained |
| §1.4a V substitution | N=4,n=2, x=(1,1); N=3 | Both 1+t²+2t⁴ mod t⁵; at N=3 both 1+t² | Floor bound necessary | Retained |
| §1.4a infinite comparison | a₁=1, other coordinates 0; N=0 | Series 1+t+t²+…; restrictions at 1,2,3 truncate it; empty product 1 | Stabilization and empty case agree | Retained |
| §1.5 p-typical comparison | p=2,a=1 and p=3,a=2 | Last ghosts x₀²+2x₁ and x₀⁹+3x₁³+9x₂ | a+1 convention correct | Retained |
| §1.6 étale Witt pushout | ℤ→ℤ×ℤ; S=∅,{1},{1,2} | Targets 0, ℤ×ℤ, W₂(ℤ)×W₂(ℤ); F₂ pushout ℤ×ℤ | Finite étale scope respected | Retained |
| §1.8 finite arithmetic square | M=ℤ,N=2; N=1; M=ℤ[1/p] | ℤ₂∩ℤ[1/2]=ℤ in ℚ₂; N=1 right vertex 0; p-completion of ℤ[1/p]=0 but localization nonzero | Both detecting terms necessary | Retained |
| §1.9 cochain completion | [ℤ[h] --h→ℤ[h]] | H⁰=0,H¹=ℤ before and after h-completion; (p,h)-completed H¹=ℤ_p | Correct fixed-degree comparison | Retained |
| §1.9 nonuniform bounds | M^i=ℤ[h]/h^(i+1), d=0 | h-completion M^i; (p,h)-completion ℤ_p[h]/h^(i+1); bounds 1,2,3,… | No uniform degree bound asserted | Retained |
| §1.10 Bockstein derivation | dx=2u, f=2 | β[x]=[u]; β[x²]=[2xu]=0=β[x][x]+[x]β[x] | Plus sign and Leibniz agree | Retained |
| §1.10 parameter change | dx=4u, f=4,g=2,a=2 | Fβ₄V[x]=[2u]=0=β₂[x]; omitting V gives [u] | Scale factor required | Retained |
| §1.10 associative case | Matrix DGA, dx=3u | β((xE₁₂)(xE₂₁))=2xuE₁₁=uE₁₂·xE₂₁+xE₁₂·uE₂₁ | Commutativity unnecessary here | Retained |
| §1.11 differential quotient | dx=u; J generated by x | d(x)=u∉(x); differential ideal (x,u); quotient ℤ | Ordinary ideal insufficient | Retained |
| §1.11 two-sided and char-2 quotients | Free associative ℤ⟨x,y,z⟩; exterior DGA mod 2 | Quotient kills xy,yx but yz≠zy; u²=0 survives reduction mod 2 | Two-sided and alternation conditions retained | Retained |
| §2.1 Witt coalgebra/Adams | ℤ and toric ℤ[T] | ψ₂(2)=2≠4; ψ₂ψ₃(T)=T⁶=ψ₆(T); ψ₂(T)−T²=0 | Frobenius congruence, not power map generally | Retained |
| §2.1 torsion obstruction | Nonzero 𝔽₂ | δ₂(2)=−1 but δ₂(0)=0 | Adams-only definition would admit wrong model | Retained |
| §2.1a λ/Witt correspondence | Toric line l; canonical integer 2 | σ(l)=(1−lt)⁻¹,λ(l)=1+lt; σ(2)=1+2t+3t², λ(2)=1+2t+t²; ψ₂(2)=4−2=2 | Inversion and sign necessary | Retained |
| §2.1a torsion detection | A=ℤ[ε]/(2ε,ε²) | V₂τ(ε) has all ghosts 0 but γ=1+εt²≠1 | Integral bridge retains extra data | Retained |
| §2.1a zero and impossible field | A=0; nonzero 𝔽₂ | Zero ring has one series; in 𝔽₂ sum law would force λ²(0)=1≠0 | Correct boundaries | Retained |
| §2.2 prime sets/free objects | P=∅,{2}; empty generator set | Identity comonad; infinite 2-typical carrier; free empty ring ℤ with ψ_n=id | Prime set not a finite length | Retained |
| §2.3 perfection | ℤ; toric ℤ[T] | ℤ^perf=ℤ; T at stage 1 equals T² at stage 2; ψ₂⁻¹(T)=T^(1/2) in perfection | Colimit direction fixed | Retained |
| §2.4 coverage | Toric polynomial; dual numbers | ψ₂ has basis 1,T and ψ₃ basis 1,T,T²; dual-number ψ₂(ε)=2ε reduces to 0 mod 2 | Torsion-free need not be covered | Retained |
| §2.5 relative perfection | R=A; ℤ[T]/ℤ | a⊗b↦ψ_n(a)b has inverse b↦1⊗b for R=A; T absent from ψ₂-image over ℤ | Absolute and relative perfection distinct | Retained |
| §3.1 q-FV system | ℤ, m=2 | F₂V₂(1)=2; V₂F₂(1)=1+q | Replacing V by 2 fails | Retained |
| §3.2 initial quotient | m=1, R=0, ℤ at m=2 | Q₁(R)=R, Q_m(0)=0; V₂(1)=1+q | Normalizations consistent | Retained |
| §3.3 ghosts | ℤ,m=2; m=1 | gh₁(1+q)=0 at q=−1; Q₂→Q₁ at q=1 sends it to 2, ordinary restriction sends it to 0 | Ghost and restriction distinguished | Retained |
| §3.4 V resolution | m=6; m=1; m=2^a | x↦(−V₃x,V₂x)↦−V₂V₃x+V₃V₂x=0; level 1 augmentation=id; a=0 has no lower level | Sign and boundary correct | Retained |
| §3.5 ghost injectivity | ℤ and 𝔽₂ at m=2 | ℤ[q]/(q²−1) ghosts jointly injective; V₂(1)≠0 in Q₂(𝔽₂) with both ghosts 0 | Torsion hypothesis essential | Retained |
| §3.6 absolute completion | ℤ,m=2; m=1; n=m=2 | p-completed ring ℤ_p[q]/(q²−1); zero-parameter completion leaves R or Q₂ unchanged | Absolute theorem unaffected by H01 | Retained |
| §3.7 injectivity/exactness | R=0; m=1; R=𝔽₂,m=2 | Zero sequence; original exact sequence; nonzero V₂(1) remains nonzero | Kernel rings may be nonunital | Retained |
| §4.1 comparisons | ℤ; toric ℤ[T],m=2 | c₂(V₂1)=1+q; toric image ℤ[T²,q]+(1+q)ℤ[T,q] misses T | Imperfect-base comparison not onto | Retained |
| §4.2 relative system | A=R=ℤ[T],m=2 | Relative F₂ sends right scalar T↦T; semilinear substitute gives T² | A-linearity fixed | Retained |
| §4.3 proper-V linearity | A=ℤ[T],R=A[X],m=2 | The tensor-only model maps V₂(TX)⊗1 to ε and V₂(X)⊗T to 0; relative quotient sets their difference to 0 | Additional relations necessary | Retained |
| §4.4 twisted ghost | A=R=ℤ[T],m=d=2 | gh₁(s₂T)=T⊗1=1⊗T²; reversed balancing would give T⁴=T | Twist direction correct | Retained |
| §4.5 Λ-base change | Toric variable T evaluated at 2 | fψ₂(T)=4 while ψ₂f(T)=2 | Non-Λ coefficient maps excluded | Retained |
| §4.6 perfect-cover exactness | A=ℤ; R=A; toric R/ℤ | Relative V injective even with coefficient torsion; s_(m/A)=id for R=A; c₂ on ℤ[T]/ℤ misses T | Distinct hypotheses kept | Retained |
| §5.1 étale preservation | Identity; m=1; ℤ→𝔽₂ | Identity; original étale map; Tor₁^ℤ(𝔽₂,𝔽₂)=𝔽₂≠0 | Arbitrary quotient not étale | Retained |
| §5.2 derived ghost pushout | A=R=ℤ,R′=𝔽₂,m=d=2 | Periodic resolution gives ker(2 on ℤ/4)/0=𝔽₂ in Tor₁ | Non-étale pushout not derived | Retained |
| §5.4 finiteness | r=0; m=2,r=1; infinite variables | Rank m for base polynomial quotient; generators 1,T over T²-subring; (T₀,…,T_n) strictly increases | Finite-type hypotheses needed | Retained |
| §6.1 coefficient Frobenius | ℤ×ℤ; A=ℚ; smooth ℤ[T] | φ₂=id on ℤ₂×ℤ₂; completions 0 over ℚ; mod 2 image of T↦T² misses T | Étale, not smooth equivalence | Retained |
| §6.2 common topology | p=2,d=1; p=3,d=1; d=0 | Φ₂≡h mod 2; Φ₃≡h² mod 3; at d=0 Φ₀=1 and both completions 0 | Equal radicals, not equal ideals | Retained |
| §6.3 ghost Frobenius | τ_m(r), pd|m | r^(m/(pd))↦r^(m/d) on both paths; q=1+h fixed versus q²=1+2h+h² | Coefficient Frobenius fixes q | Retained |
| §7.1 strict q-V multiplication | m=1; characteristic 2 | d(T²)=2T dT; (dT)²=0 even mod 2 | Exterior condition necessary | Retained |
| §7.2 initial differential system | m=1; R=A; R=0 | Ω*; A[q]/(q^m−1) only in degree 0; zero | Positive-degree relations preserve degree 0 | Retained |
| §7.3 differential Frobenius | p=2,3 on τ_p(T) | F₂(dτ₂T)=T dT versus dF₂(τ₂T)=2T dT; at 3, T²dT versus 3T²dT | dF=pFd, not chain map | Retained |
| §7.4 prime-V identity | p=2; x=0; q=1 polynomial model | γ₂(V₂x)=V₂(x²); at T both sides of dV₂(T²)=V₂(T)dV₂(T) are 4T dT; at 0 both 0 | No inverse of 2 | Retained |
| §7.5 semilinear derivation | m=p=2,R=ℤ[T] | θ₂(τT)=T dT; θ₂V₂(T)=dT; θ₂((τT)²)=2T³dT versus ordinary-derivation 2T²dT | Semilinearity essential | Retained |
| §7.6 differential ghosts | V₂(T),V₂(dT), degree 0/1 | Ghost values 2T and 4dT; F-compatibility on dτ₂T gives 2·T dT=d(T²) | Degree-dependent powers required | Retained |
| §7.7 differential base change | Identity and m=1 localization | Identity; d(T⁻¹)=−T⁻²dT on both ordinary and q-Witt level-one sides | Correct differential transported | Supplier attribution repaired |
| §8.1 γ on native series | ℤ[T], inverse; 𝔽₂[T]; rank 0 | γ(T²)=(1+2h+h²)T²; γ⁻¹T=(1−h+h²−…)T; mod 2 value (1+h²)T²; rank 0 no γ_i | Completion and indices necessary | Retained |
| §8.1 regular quotient | P/(hT); inseparable T↦Z² over 𝔽₂ | hT=0 but constant T≠0; square of any series has h coefficient 0 but (1+h)Z² has coefficient Z² | Non-étale map excluded | Retained |
| §8.2 divided differences | T,T²,T³,T⁻¹; relative U | 1,(1+q)T,(1+q+q²)T²,−q⁻¹T⁻²; D(U)=0 | Division-before-reduction normalization | Retained |
| §8.2 two Leibniz forms | f=g=T | D(T)T+γ(T)D(T)=T+qT=(1+q)T; reversed form same | Twisted product formulas agree | Retained |
| §8.3 scaled complex | T²; rank-two XY; rank 0 | d_C=(1+q)T dT; d_H=(q²−1)T dT; d¹d⁰(XY)=1−1=0; rank 0 only coefficients | h-scaling distinct | Retained |
| §8.3 skew multiplication/naturality | One coordinate; merge X,Y into T | dT·T=qT dT versus T·dT=T dT; merged values 2T dT versus (1+q)T dT | Coordinate-injective scope needed | Retained |
| §8.4 framed Frobenius | p=2; toric U; h²=0 then mod 2 | φ(h)=2h+h²; H-map dT↦T dT; C-map dT↦(1+q)T dT; φ(U)=U²; φ(h)=0 in 𝔽₂[h]/h² | Both conventions and semilinearity fixed | Retained |
| §9.1 Frobenius basis | r=1,p=2,α=1; r=0; α=0 | Ring basis 1,T; one-form basis T dT,dT; rank 0 one scalar summand; α=0 form dT | No negative exponent required | Retained |
| §9.2 two-term cohomology | p=2,α=1,e=0; e=α | ann(h)=(h+2), coker(h)=ℤ₂; at e=α differential 0 and both cohomologies S_α | Kernel/cokernel distinct descriptions agree | Retained |
| §9.2 tensor splitting/base | e₁=e₂=0; α=0 | Triangular combination of degree-one generators changes differentials (h,h) to (h,0); ambient Tor₁(S₀,S₀)=S₀ but tensor over S₀ has no negative degree | Correct tensor base | Retained |
| §9.3 framed Bockstein | m=1,T; m=2,T²; rank 0 | β₁T=dT; β₂[T²]=[T dT]≠0; rank 0 β=0 | Quotient differential would give 0 | Retained |
| §9.4 product homotopy | Rank 1, α=a dT,β=b | Commutator a(γb−b)dT=Ta(hDb)dT; H(a dT,b dT)=−Tab dT | Contraction sign correct | Retained |
| §9.4 rank-two boundary witness | ω=YdX+XdY,m=2 | d_Hω=0; (γ_X−1)ω=hX dY≠0; dXω+ωdX=hX dX∧dY=d_H(−XYdX) | Commutativity is in cohomology | Retained |
| §9.4 positive-degree witness | α=dX∧dY, β=ZdX+XdZ | H(α,β)=XZ dX∧dY; both identity sides hX dX∧dY∧dZ | Higher sign checked | Retained |
| §9.5 framed system | m=1; m=2,T²; rank 0 | β₁T=dT; dT·T²=q²T²dT=T²dT mod q²−1; rank 0 E_m=R[[h]]/(q^m−1),β=0 | Cohomology/product conventions agree | Retained |
| §9.5a q-PD datum | p=2,3 | δ(h)=h at 2, h+h² at 3; γ(h)=0 at 2,−h² at 3; δ([2]_q)=−q≡1 mod [2]_q | Ideals (h) and ([p]_q) distinguished | Retained |
| §9.5a iteration | α=0; p=2,α=1,2 | J₀=1,f₀=h; J₁=h+2; J₂=(q+1)(q²+1)=[4]_q; φ_C²(dT)=[4]_qT³dT | Full iteration and factor retained | Retained |
| §9.5a scalar twist | A=ℤ[U],p=2; R=A[T,(T²−U)⁻¹] | First twist denominator T²−U²; mod 2 it is (T−U)²; second ψ₂-iteration sends U↦U⁴ | Untwisted coefficients change the algebra | Retained |
| §9.6 simultaneous induction | α=0; p=2,T dT | Q₁Ω=Ω, β_h=d; F₂(dτ₂T)=T dT | Base case and lifting agree | Retained |
| §9.6 differential V quotient | p=m=2 | F₂dV₂(T)=dT; F₂V₂(ω)=2ω | dV-image cannot be omitted | Retained |
| §9.7 smooth E∞ comparison | m=1; p=2,m=6; p=3,m=2 | Identity ordinary de Rham comparison; twists ψ₂,ψ₆ with factors q²−1,q⁴+q²+1; at p=3 two q±1 factors comaximal since difference 2 is a unit | General indices and primes retained | Adapter dependency explicit |
| §10.1 integer torsion | R=A; m=1; singular ℤ[x]/x² | Positive forms 0 for R=A; smooth Ω has no integer torsion; singular Ω¹ has x dx≠0,2x dx=0 | Smoothness cannot be dropped | Retained |
| §10.2 bounded difference torsion | m=1; A=R=ℤ,m=2 before/after mod 2 | h=0 at m=1 gives bound 1; over ℤ, h(h+2)=0; mod 2, h²=0 but h≠0 gives bound 2 | Integer and difference torsion differ | Retained |

Commit: c3c3d76 — `QWittVectors: review repairs (bounded completion torsion and precise differential and PD suppliers)`. The worktree is clean; no push or GitHub write was made.
