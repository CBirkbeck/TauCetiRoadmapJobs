# Human-review response: QWittVectors

Reviewed head: c3c3d76df6399f3faa41a1cda67af3c545ff5a8f. The review's single numbered finding contains three distinct declaration corrections, numbered below in their order of appearance; its affirmative inspection notes are not additional findings.

## H01 (CBirkbeck) — answered

The integral λ/Witt bridge imports SchemeKTheoryOperations §§6.2.1–6.2.2, and the complete framed and prismatic constructions import PrismaticCohomologyPartII §§5.0, 5.18, 3.16, 5.13, 5.19–5.20, exactly as specified in `TauCetiRoadmap/QWittVectors/README.md:60` and `TauCetiRoadmap/QWittVectors/README.md:92`. Both suppliers are open new roadmaps and absent from both live PR-description declarations: add SchemeKTheoryOperations (#1229, after its prerequisites including AlgebraicModuliForArithmeticGeometry and AlgebraicKTheory) and PrismaticCohomologyPartII (#1065, after PrismaticCohomology), both before QWittVectors; this valid integration defect remains unresolved because PR-text changes are expressly outside this job's authorized edits.

## H02 (CBirkbeck) — answered

Whole-PR prerequisites additionally include AlgebraicKTheory → SchemeKTheoryOperations (§3.6, A2/A4 inputs), IntegralIwasawaTheory → ColemanPowerSeries → PhiGammaModulesAndIwasawaCohomology (§2.5, importing ColemanPowerSeries §§1.45–1.49), TangentialBordism → AInfCohomology (§AI.7.2, importing §B4 items 2 and 7), and PurityOfBranchLocus plus AbhyankarLemma → CrystallineCohomology (§CR.5:log-algebra.4, with the exact purity/tame-cover contracts). The live dependency and merge-order declarations omit these prerequisites (#1142, #1309, #942, #1103, #1104); reconcile both declarations with the transitive supplier graph, preserving the narrower mathematical inputs in QWittVectors, and leave this finding unresolved until that PR-text correction is made—these verified omissions alone do not certify a complete merge closure.

## H03 (CBirkbeck) — answered

The assertion “It depends on no other author's open pull request” is false for the declared whole-PR merge plan: AlgebraicKTheory and TangentialBordism are by kim-em, and PurityOfBranchLocus and AbhyankarLemma are by tdupu, with the dependency paths in H02. Replace it with a declaration that these other-author new-roadmap prerequisites must merge before the supplier PRs that consume them, and remove the claim that every other README-named roadmap is a consumer; both corrections remain PR-text work outside this job, not repaired content findings.

**Evidence and disposition.** The live QWittVectors description was read at the reviewed head: its dependency paragraph and merge-order paragraph omit all seven named roadmaps. Supplier heads independently matched the review: SchemeKTheoryOperations 88dbd5a787e63263d086c798f1873d401debe960, PrismaticCohomologyPartII 2a6d2286389d83772b6fb1ed121a5bab8892e7de, AInfCohomology b47987ba7258bfcfa1fb49ba14834c8440fd9058, and CrystallineCohomology 013a9213642094a35a83bbb9842a8eb397064e0b; PhiGammaModulesAndIwasawaCohomology 6ec1d643f6e17ee135b260525432856be52d267d supplies the explicit Coleman edge. All seven omitted roadmaps are absent from main a4a8652e46fe27e56355bbcf74579562b503fbc3. No roadmap file changed, no ownership moved, no commit was created, and no GitHub write was made. “Answered” records the permitted disposition, not resolution of the blocking integration issue.

**Sources, ownership and signatures.** The mathematical reason for the narrow λ-ring import is Borger's all-ring equivalence (borger line 615, §1.17); its integral specialization and the supplier's §§6.2.1–6.2.2 do not require a K₀ carrier. The complete-frame construction is in wagner line 2830, §4.7, and pridham line 371, Definition 1.22; the twisted comparison is in bhatt-scholze line 4289, Theorem 16.18, with the framed comparison at bhatt-scholze line 4378, Theorem 16.22. These support retaining the mathematical imports, rather than adding the inherited whole-PR prerequisites to the local mathematical statements. All eight cited works have the supplied legal cached texts and existing keys in `packages/QWittVectors/sources.toml`; no additional work or manifest entry was needed.

Cross-roadmap resolution was rerun against main and the indexed open heads; it reported no missing cross-roadmap citations. Object searches across those roadmaps and the supplied sibling checkouts retain the stated owners for special λ-rings, commuting-endomorphism Koszul complexes, complete framing and PD foundations; no new declaration is introduced. The board package index was inspected, but the exact-head CrystallineCohomologyPartII package could not be read (404); ownership against that board package is not certified. No absence claim relies on that failed read.

Pinned Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 were inspected directly. In particular, `WittVector` has natural-number p-typical coordinates (`Mathlib/RingTheory/WittVector/Defs.lean:52`), while `TruncatedWittVector` uses `Fin n` (`Mathlib/RingTheory/WittVector/Truncated.lean:62`); these do not supply the arbitrary-truncation big Witt carrier. `Algebra.FormallyEtale` and `Algebra.Etale` are the native predicates (`Mathlib/RingTheory/Etale/Basic.lean:46`, `Mathlib/RingTheory/Etale/Basic.lean:205`), and the transported differential basis is `TauCeti.kaehlerBasisOfFormallyEtale` (`TauCeti/RingTheory/Kaehler/FormallyEtale.lean:67`). Fresh elaboration of one scratch file containing `#check @name` for all four declarations succeeded: the truncation-set structure, ghost polynomial, ghost-image theorem and framed-automorphism theorem agree with README §§1.1–1.2 and 8.1, with no dropped hypothesis and no signature change. In particular, the Frobenius-lift hypothesis remains on `ghost_image`, and both the scalar-tower and étale instances remain on `framedGamma_existsUnique`.

**Computed mathematics pass.** No mathematical statement was added or changed. The following table records evaluated instances of the existing constructions, conclusions and convention-sensitive identities; these consistency calculations do not prove the admitted headline theorems. “Retain” means the stated hypotheses or negative control already distinguish the computed wrong model; every row leaves the text unchanged.

| Statement | Instances tried | Computed values | Result | Change |
| --- | --- | --- | --- | --- |
| Positive truncations, §1.1 | Div(6), empty, {2} | Div(6)={1,2,3,6}; empty has one coordinate function; {2} omits divisor 1 | Retain divisor closure | None |
| Ghost polynomial, §§1.1–1.2 | All coordinates 1, n=0,1,2,3,6 | w₀=0 for the total Lean definition; (w₁,w₂,w₃,w₆)=(1,3,4,12); n=0 excluded from theorem | Positive-index scope agrees | None |
| Dwork equivalence, §1.2 | ℤ, S=Div(2), φ₂=id | (1,1) gives ghosts (1,3), 3−1=2; desired ghosts (0,1) require 2x₂=1 and fail congruence 1 mod 2 | Both directions distinguished | None |
| Mixed-prime Dwork congruences, §1.2 | ℤ, Div(6), all coordinates 1 | w₆−w₃=12−4=8 in 2ℤ; w₆−w₂=12−3=9 in 3ℤ | Retain every divisor index | None |
| Ghost injectivity, §1.2 | 𝔽₂, coordinates (0,1); empty set | (0,1)≠(0,0), both ghosts (0,0); empty-coordinate map is singleton→singleton | Torsion hypothesis necessary | None |
| Big Witt ring operations, §1.3 | ℤ, Div(2), two τ(1)'s | (1,0)+(1,0)=(2,−1), with ghosts (2,2); (2,0) has ghosts (2,4) | Retain integral operations | None |
| Nonunital/zero construction, §1.3 | Zero multiplication on ℤ; empty/zero ring | (a,b)+(c,d)=(a+c,b+d), product=(0,0); empty and zero carriers have one element | Retain unitization kernel | None |
| F,V composite and projection, §1.4 | Div(2), x=(a,b), y=c | F₂V₂(c)=2c; xV₂(c)=(0,(a²+2b)c)=V₂(F₂(x)c); F₁=V₁=id | Correct directions/scales | None |
| Teichmüller sign, §1.4 | ℤ, r=−1 | τ(−1)=−τ(1)+V₂τ(1) has ghosts (−1,1); −τ(1) alone has (−1,−1) | Retain nonadditivity | None |
| Finite power-series comparison, §1.4a | ℤ, N=2 | γ₂(2,−1)=1+2t+3t²=(1−t)⁻² mod t³; γ₂(2,0)=1+2t+4t² | Inverse-product convention fixed | None |
| Power-series comparison with torsion, §1.4a | 𝔽₂, (0,1), N=2 | Ghosts=(0,0); series=1+t²≠1 mod t³ | Ghost-only argument excluded | None |
| Restriction, substitution and limit, §1.4a | N=4,n=2,x=(1,1); N=0 | γ₄(V₂x)=γ₂(x)(t²)=1+t²+2t⁴; empty vector at N=0 maps to 1 | Positive substitution and boundaries agree | None |
| p-typical comparison, §1.5 | a=0; p=2,a=1; p=3,a=2 | Lengths 1,2,3; final ghosts x₀, x₀²+2x₁, x₀⁹+3x₁³+9x₂ | Retain a+1 convention | None |
| Finite Witt étale pushout, §1.6 | S={1}, empty, Div(2); ℤ→ℤ×ℤ | Targets R′,0,ℤ×ℤ respectively; product has two coefficient factors | Retain finite truncation hypothesis | None |
| Arithmetic fracture, §1.8 | N=1; M=ℤ,N=2; M=ℤ[1/2] | Right product=0 at N=1; ℤ₂∩ℤ[1/2]=ℤ in ℚ₂; 2-completion of ℤ[1/2]=0 while localization stays ℤ[1/2] | Joint detection needed | None |
| Unbounded cochain completion, §1.9 | [ℤ[h]→ℤ[h]], map h | H⁰=0,H¹=ℤ before/after h-completion; H¹ after (p,h)-completion=ℤ_p | Ideals distinguished | None |
| Degree-dependent torsion bounds, §1.9 | Zero-differential term ℤ[h]/h^(i+1) | h-completion unchanged; (p,h)-completion=ℤ_p[h]/h^(i+1), bounds i+1 | No global bound required | None |
| Bockstein sign/product, §1.10 | dx=2u, u²=0, f=2 | β₂[x]=u; β₂[x²]=2xu=0, quotient differential on x=0 | Plus lift convention fixed | None |
| Parameter change, §1.10 | dx=4u, f=4,g=2,a=2 | Fβ₄V[x]=2u=0=β₂[x]; Fβ₄[x]=u≠0 | V cannot be dropped | None |
| Associative Bockstein, §1.10 | Matrix DGA, dx=3u, f=3 | β₃[(xE₁₂)(xE₂₁)]=2xuE₁₁=uE₁₂xE₂₁+xE₁₂uE₂₁ | Commutativity not needed | None |
| Differential ideal quotient, §1.11 | dx=u, J generated by x; J=0,whole | Differential closure=(x,u), quotient=ℤ; other quotients=P,0 | Algebra ideal (x) alone fails | None |
| Arithmetic Adams/coaction, §2.1 | Canonical ℤ, toric ℤ[T], nonzero 𝔽₂ | ψ₂(2)=2≠4; ψ₂(T)=T²; δ₂(2)=−1 contradicts 2=0 in 𝔽₂ | Adams-only torsion model excluded | None |
| Integral λ/Witt bridge, §2.1a | Line l, integer 2, integer −1 | λ_t(l)=1+lt; λ²(2)=1; λ²(−1)=1; ψ₂(2)=4−2=2 | Integral inverse/sign laws agree | None |
| Torsion retained by λ/Witt bridge, §2.1a | ℤ[ε]/(2ε,ε²) | V₂τ(ε)≠0 has all ghosts 0; γ∞=1+εt²≠1 | No division or ghost cancellation | None |
| Prime sets and free objects, §2.2 | P empty, P={2}, no generators | Empty-prime comonad=id; {2} has infinitely many coordinates; free empty object=ℤ | Retain full prime-set scope | None |
| Perfection, §2.3 | ℤ; toric ℤ[T] | ℤ remains ℤ; ψ₂(T^(1/2))=T in ℤ[T^ℚ≥0], but T has no preimage in ℤ[T] | Arithmetic perfection distinguished | None |
| Perfect coverage, §2.4 | Toric ℤ[T]; ψ_n(ε)=nε on dual numbers | ψ₂,ψ₃ have bases (1,T),(1,T,T²); mod-2 dual-number ψ₂ kills ε on nonzero target | Torsion-free does not imply covered | None |
| Relative twists/perfection, §2.5 | R=A; R=ℤ[T], A=ℤ | r⊗a↦ψ_p(r)a has inverse a↦1⊗a for R=A; polynomial Frobenius misses T | Right action and relative scope agree | None |
| Absolute q-FV laws, §3.1 | ℤ,m=2,d=1 | FV(1)=2; VF(1)=1+q; constant V=2 would give wrong polynomial | Both composite laws needed | None |
| Initial absolute q-Witt ring, §3.2 | m=1; R=0; ℤ,m=2 | Q₁(R)=R, Q_m(0)=0; V₂(1)=1+q, F₂V₂(1)=2 | Level/unit boundaries agree | None |
| Absolute ghosts, §3.3 | ℤ,m=2; m=1 | gh₁(1+q)=0 at q=−1; q=1 gives 2; level-one ghost=id | Ghost and ordinary restriction differ | None |
| V-resolution signs, §3.4 | m=6; m=1 | x↦(−V₃x,V₂x)↦−V₂V₃x+V₃V₂x=0; level-one augmentation=id | Correct alternating cube | None |
| Integer torsion and ghost kernels, §3.5 | Q₂(ℤ), Q₂(𝔽₂), m=1 | Over ℤ, (a+b,a−b)=(0,0) forces a=b=0; over 𝔽₂ V₂(1)≠0 has both ghosts 0; m=1 ghost=id | Retain prime-specific hypotheses | None |
| Absolute completion, §3.6 | ℤ,m=n=2; m=1 | q²−1=0 in Q₂, so its completion is Q₂; p-completion=ℤ_p[q]/(q²−1); m=1 parameter=0 | Ambient completion excluded | None |
| Witt injection/exactness, §3.7 | m=1; R=0; R=𝔽₂,m=2 | Maps reduce to original ring sequence, zero sequence, and nonzero V₂(1) in ℤ/4 | Nonunital and torsion cases retained | None |
| Λ comparison maps, §4.1 | ℤ; toric ℤ[T],m=2 | V₂(1)↦1+q; toric image=ℤ[T²,q]+(1+q)ℤ[T,q], which omits T | Perfectness not dropped | None |
| Relative q-FV scalars, §4.2 | A=R=ℤ[T], m=2 | Relative F₂(T)=T; semilinear substitute gives T²; FV(1)=2,VF(1)=1+q | Retain right scalar linearity | None |
| Relative initiality/V-linearity, §4.3 | R=A, R=0, m=1; toric TX relation | Q_m(A/A)=A[q]/(q^m−1), Q_m(0/A)=0,Q₁(R/A)=R; prescribed difference V₂(TX)⊗1−V₂(X)⊗T is killed | Additional quotient retained | None |
| Twisted relative ghost, §4.4 | A=R=ℤ[T],m=d=2 | T⊗1=1⊗T², both sent to T²; reversed balancing would compare T⁴ with T | Correct twist direction | None |
| Λ-base change, §4.5 | A′=A,0; toric T↦2 | Identity/zero outputs; proposed map sends ψ₂(T) to 4 but ψ₂(2)=2 | Arbitrary base maps excluded | None |
| Perfect-cover comparisons, §4.6 | R=A; toric R=ℤ[T] over ℤ | Base comparison=id after canonical identification; toric c₂ misses T | Isomorphism needs relative perfection | None |
| q-Witt étale preservation, §5.1 | Identity; m=1; ℤ→𝔽₂ | Identity, original étale algebra, and Tor₁^ℤ(𝔽₂,𝔽₂)=𝔽₂ for excluded quotient | Flatness/étaleness retained | None |
| Derived ghost pushout, §5.2 | B=ℤ[q]/(q²−1), Q₂(𝔽₂)=ℤ/4 | Resolution maps become 2,0; Tor₁=(2ℤ/4)≅𝔽₂ | Non-étale derived claim excluded | None |
| Relative coefficient completion, §5.3 | Infinite-variable toric A; p=m=2 | Completed source=B[q]/(q²−1); twisted quotient=⊕_e B e; compatible residues Σ_(1≤i<n)2^i e_(T_i) have no finite-support lift | Keep completion on both sides | None |
| Relative bounded-torsion hypothesis, §5.3 | Square-zero control, j=0,1,2 | r_j=0,1/3,4/9; cyclic orders 2,4,8; e_j↦2e_(j+1) yields ℤ[1/2]/ℤ with nonzero Tate module | Discreteness alone insufficient | None |
| Relative integer torsion, §5.3 | A=ℤ,R=ℤ/4,m=1 | Q₁=ℤ/4 and 2≠0,2·2=0 | Base coverage alone insufficient | None |
| Finite type, §5.4 | r=0; r=1,m=2; infinite variables,m=1 | Rank m over ℤ; generators 1,T over subring containing T²; (T₀)⊊(T₀,T₁)⊊⋯ | Finite-type scope retained | None |
| Completed étale Frobenius, §6.1 | A=ℤ,R=ℤ×ℤ,p=2; polynomial control | φ₂=id on ℤ₂²; modulo 2 squaring=id there; polynomial lift T↦T² misses T | Étale equivalence distinguished | None |
| Cyclotomic ideals/radicals, §6.2 | d=0; p=2,d=1; p=3,d=1 | Φ₀=1; Φ₂ mod 2=q−1; Φ₃ mod 3=(q−1)², unequal to (q−1) as ideals | Equal radicals, not ideals | None |
| Completed ghost Frobenius, §6.3 | m=p,d=1; p=2,q=1+h | Teichmüller paths both r^p; q-fixed map gives 1+h, framed substitution gives 1+2h+h² | Distinct Frobenii retained | None |
| Strict odd alternation, §7.1 | Characteristic 2, odd u; level-one forms | Exterior u²=0; symmetric u²≠0 is excluded; d(T²)=2T dT=0 mod 2 | Sign rule alone insufficient | None |
| Initial differential system, §7.2 | m=1,R=A[T]; R=A; R=0 | Ordinary exterior forms; base ring only in degree 0; zero algebra | Degree-zero carrier preserved | None |
| Differential Frobenius scaling, §7.3 | p=2,3, R=ℤ[T] | F₂(dτT)=T dT,dF₂(τT)=2T dT; F₃(dτT)=T²dT,dF₃(τT)=3T²dT | F is not a chain map | None |
| Prime V/PD identity, §7.4 | p=2; q=1,V in degree i is 2^(i+1) | γ₂(V₂x)=V₂(x²); dV₂(T²)=4T dT=V₂(T)dV₂(T) | No inverse of 2 or prior F | None |
| Semilinear θ, §7.5 | p=2,R=ℤ[T] | θ(τT)=T dT; θ(V₂T)=dT; θ((τT)²)=2T³dT rather than 2T²dT | Semilinear product law needed | None |
| Differential ghost degree factor, §7.6 | m=2,d=1 | gh₂(V₂T)=2T; gh₂(V₂dT)=4dT | Retain n^(i+1) factor | None |
| Étale differential extension, §7.7 | ℤ[T]→ℤ[T,T⁻¹] | d(T⁻¹)=−T⁻²dT; coefficientwise tensor differential gives 0 | Unique extended differential required | None |
| Coordinate automorphism, §8.1 | ℤ/4 and 𝔽₂ polynomial frames; r=0 | γ(T²)=(1+2h+h²)T², mod 2=(1+h²)T²; r=0 has no i | Correct torsion and empty-coordinate scope | None |
| Automorphism inverse/étaleness, §8.1 | Laurent frame; 𝔽₂[T]→𝔽₂[Z],T↦Z² | γ(T⁻¹)=(1−h+h²−⋯)T⁻¹; a square has h coefficient 0, while (1+h)Z² has coefficient Z² | Completion and étaleness essential | None |
| Divided differences, §8.2 | 1,T,T²,T⁻¹; coefficient U | D values 0,1,(1+q)T,−q⁻¹T⁻²; D(U)=0 | Normalization and relative base agree | None |
| Framed Koszul signs, §8.3 | Rank 2, XY; scalar operators 2,3 | d¹d⁰(XY)=1−1=0; scalar composite=6−6=0; wrong plus gives 2 or 12 | Supplier basis-sign adapter agrees | None |
| Skew versus central product, §8.3 | One coordinate,T² | dT·T=qT dT; d_C(T²)=(1+q)T dT; d_H(T²)=(q²−1)T dT | Central product would give 2T dT | None |
| Framed/scaled Frobenius, §8.4 | p=2, toric coefficient U | φ(h)=2h+h²; φ_H(UdT)=U²T dT; φ_C(UdT)=(1+q)U²T dT | Factors and semilinearity retained | None |
| Frobenius decomposition, §9.1 | r=1,p=2,α=1; α=0; r=0 | Ring basis 1,T; corresponding form basis T dT,dT; α=0 gives dT; r=0 has one degree-zero summand | No negative-power/empty-minimum error | None |
| Two-term cohomology, §9.2 | p=2,α=1,e=0; e=α | ann(h)=(h+2),coker(h)=ℤ₂; zero differential at e=α gives H⁰=H¹=S_α | Kernel/cokernel agree | None |
| Tensor base, §9.2 | α=0,S₀=ℤ₂[[h]]/(h) | Tor₁ over ℤ₂[[h]]=S₀; ordinary tensor over S₀ has no negative degree | Ambient tensor substitute excluded | None |
| Framed Bockstein, §9.3 | T,m=1; T²,m=2 | d_HT=h dT gives β₁(T)=dT; d_HT²=(q²−1)T dT gives β₂(T²)=T dT | Plus convention retained | None |
| Product homotopy, §9.4 | ω=YdX+XdY, α=dX | H(α,ω)=−XYdX; d_HH=hX dX∧dY=αω+ωα; d_Hω=0 | Boundary, not coefficient invariance | None |
| Higher product-homotopy sign, §9.4 | α=dX∧dY,β=ZdX+XdZ | H=XZ dX∧dY; d_HH=hX dX∧dY∧dZ=αβ−βα | Even/odd signs agree | None |
| Framed cohomology algebra, §9.5 | m=1; m=2,T and T² | β_h(T)=dT; dT·T²=q²T²dT=T²dT mod q²−1, while T is not closed | Cohomological commutativity distinguished | None |
| Iterated prismatic ideal, §9.5a | p=2,α=0,1,2 | J₀=1,J₁=q+1,J₂=(q+1)(q²+1)=[4]_q; φ_C²(dT)=[4]_qT³dT | Iteration includes every ideal factor | None |
| q-PD versus prism ideal, §9.5a | p=2,3 | δ₂(h)=h,γ₂(h)=0; δ₃(h)=h+h²,γ₃(h)=−h²; δ₂([2]_q)=−q≡1 | Ideals (h) and ([p]_q) distinguished | None |
| Twisted prismatic input, §9.5a | Toric U,p=2,R=A[T,(T²−U)⁻¹] | ψ₂ base change gives T²−U²=(T−U)² mod 2; untwisted denominator remains T²−U | Retain ψ_p-twisted source | None |
| Prime-power induction and Cartier lift, §9.6 | α=0,p=2,polynomial T | Q₁Ω=Ω; T dT mod 2 lifts as F₂(dτ₂T); F₂dV₂T=dT but F₂V₂ω=2ω | Both V and dV needed in quotient | None |
| PD-presentation contraction, §9.6a | Extra variable x↦0; identity presentation | h(x^[n]dx)=x^[n+1], so dh+hd=id−ev₀; identity gives B[0] | PD forms, not polynomial substitute | None |
| Induced δ on PD envelope, §9.6a | p=2,δ(x)=0 | φ(x^[2])=x⁴/2=12x^[4]; (x^[2])²=6x^[4]; δ=(12−6)/2 x^[4]=3x^[4] | Zero δ on x^[2] is excluded | None |
| General-index smooth comparison, §9.7 | p=2,m=6; p=3,m=2; m=1 | First factors use ψ₂,ψ₆ and q²−1,q⁴+q²+1; second uses ψ₁,ψ₂ and q−1,q+1; m=1 gives Ω | Twists and prime-factor cases agree | None |
| Smooth integer torsion-freeness, §10.1 | m=1,smooth polynomial; singular dual numbers | Ω¹_(ℤ[T]/ℤ)=ℤ[T]dT; in ℤ[x]/x², xdx≠0 and 2xdx=0 | Smoothness necessary | None |
| Bounded difference torsion/completion, §10.2 | m=1; A=R=ℤ,m=2 before/after mod 2 | h acts as 0 at m=1; h(h+2)=0 gives h-torsion bound 1 over ℤ; mod 2 gives h²=0,h≠0, bound 2 | Bounds depend on reduction/index | None |

**Build outcome.** `lake build TauCetiRoadmap.QWittVectors.Suggested` exited 0, with exactly the two warnings below and no other warnings or errors:

```text
warning: TauCetiRoadmap/QWittVectors/Suggested.lean:80:8: declaration uses `sorry`
warning: TauCetiRoadmap/QWittVectors/Suggested.lean:100:8: declaration uses `sorry`
Build completed successfully (8976 jobs).
```

The scratch signature elaboration exited 0. The dependency-direction check exited 0 and printed exactly:

```text
depcheck: 26 roadmaps, 232 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line for QWittVectors. This validates the checked roadmap direction, not completeness of the PR-description merge closure. The content gate exited 0 and printed exactly:

```text
gate QWittVectors: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
