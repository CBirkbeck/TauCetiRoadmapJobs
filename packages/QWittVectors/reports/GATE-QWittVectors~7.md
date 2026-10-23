# Human-review response: QWittVectors

Reviewed head: c3c3d76df6399f3faa41a1cda67af3c545ff5a8f. The first numbered finding contains three separate declaration corrections: direct suppliers, inherited prerequisites, and the authorship/consumer assertions; these are H01–H03, followed by the cyclotomic finding H04. The affirmative inspection notes are not additional findings.

## H01 (CBirkbeck) — answered

The special λ-ring bridge imports SchemeKTheoryOperations §§6.2.1–6.2.2, and the framed/prismatic construction imports PrismaticCohomologyPartII §§5.0, 5.18, 3.16, 5.13, 5.19–5.20 (`TauCetiRoadmap/QWittVectors/README.md:60`, line 94); both direct suppliers remain absent from the live dependency and merge-order declarations. Add SchemeKTheoryOperations after its prerequisites, including AlgebraicModuliForArithmeticGeometry and AlgebraicKTheory, and PrismaticCohomologyPartII after PrismaticCohomology, both before QWittVectors; the PR-text correction remains unresolved because editing that text is outside this job's permitted files.

## H02 (CBirkbeck) — answered

The inherited paths are AlgebraicKTheory A2/A4 → SchemeKTheoryOperations §3.6; IntegralIwasawaTheory §7.1 → ColemanPowerSeries §§1.45–1.49 → PhiGammaModulesAndIwasawaCohomology §2.5; TangentialBordism §B4 items 2 and 7 → AInfCohomology §AI.7.2; and PurityOfBranchLocus §§0.1, 2.1–2.2 plus AbhyankarLemma §§0.1–0.3, 1.1, 3.3–3.4 → CrystallineCohomology §CR.5:log-algebra.4. Add the five omitted prerequisites to both PR-body declarations while retaining QWittVectors' narrower section-level mathematical imports; LocalPurity is on main, and these verified omissions do not certify completeness of the entire transitive merge closure.

## H03 (CBirkbeck) — answered

The assertion that no other author's open pull request is needed is false for the whole-PR merge plan: AlgebraicKTheory and TangentialBordism are by kim-em, and PurityOfBranchLocus and AbhyankarLemma are by tdupu. Correct that assertion and the claim that every otherwise unlisted README roadmap is a consumer, using the prerequisite paths in H01–H02; these PR-text defects remain unresolved rather than being reported as fixed by the content repair.

## H04 (CBirkbeck) — applied differently

The purported prime-generator supplier export in `TauCetiRoadmap/QWittVectors/README.md:98` is now the explicit local consequence §3.2a (line 545), proved from HabiroCyclotomicCompletions §4.1 and the pinned divisor factorization, with empty-product, m=1, m=2,3,6,12 and characteristic-two controls (wagner line 320, Lemma 2.2; wagner line 346, Lemma 2.3). The supplier contract at line 78 names its actual §§4.1 and 5.2, and §3.3's proof and Needs at lines 572–574 now consume §3.2a, treating m=1 directly also for nonunital coefficients; no supplier file, new carrier or Lean headline was added.

**Evidence and ownership.** Main was checked at 35c99162e8be040065af64b05336c29b27b40d1c. All seven omissions are absent from that main tree and from both live PR-body declarations; the indexed open heads identify SchemeKTheoryOperations at 88dbd5a787e63263d086c798f1873d401debe960, PrismaticCohomologyPartII at 2a6d2286389d83772b6fb1ed121a5bab8892e7de, AInfCohomology at b47987ba7258bfcfa1fb49ba14834c8440fd9058, CrystallineCohomology at 013a9213642094a35a83bbb9842a8eb397064e0b, and PhiGammaModulesAndIwasawaCohomology at 6ec1d643f6e17ee135b260525432856be52d267d. Their actual supplier contracts confirm the paths above. These are packaging prerequisites, not extra hypotheses on the elementary λ-ring equivalence or early Koszul input.

HabiroCyclotomicCompletions at 3caf5c7f1d8548c285a3aab260368b41fa56e52a explicitly owns the pairwise ideal/comaximality statements in §4.1 and product splitting in §5.2, but does not state the prime-generator identity. Searches by the cyclotomic objects across main, the indexed open roadmap heads, the supplied sibling checkouts and the available board package READMEs identify HabiroRings as another consumer of that requirement, not a new supplier. The local consequence uses the established cyclotomic owner and introduces no foundational construction or fully qualified declaration; no ownership moves or additional dependencies are needed. The supplied open-roadmap files were checked; no exclusive ownership claim is made about board packages whose README is absent from this checkout.

**Sources and citations.** Wagner's residual-factor and divisibility-chain proof is at wagner lines 326–342; the empty-product alternative is covered explicitly in the new proof, and the false m=1 extension is excluded even though the source's printed statement says positive m. The same cached v5 text provides the finite-product ideal lemma at wagner lines 346–371. All eight cited works have the supplied legal cached texts and existing keys in `packages/QWittVectors/sources.toml`; the repair uses only the existing wagner entry and requires no new source or manifest edit. The narrow λ-ring import is supported by borger lines 615–627; the framed input by wagner lines 2830–2872 and pridham lines 371–384; the twisted prismatic input by bhatt-scholze lines 4289–4297.

Cross-roadmap resolution finds no unresolved roadmap citation. The cited sections and names were compared with main and the indexed open heads, including the special λ, commuting-endomorphism Koszul, complete-frame, skew-product, PD and derived-completion interfaces. The resolver does not inspect the pinned external libraries on this host, so library evidence was checked directly at Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. In particular, `Polynomial.prod_cyclotomic_eq_X_pow_sub_one` is in `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:337` with 0<n and CommRing R; `prod_cyclotomic_eq_geom_sum` is at line 357; the integral expansion identities are in `Mathlib/RingTheory/Polynomial/Cyclotomic/Expand.lean:38` and line 87. The local argument uses these factorizations and the supplied integral comaximality, not coprimality merely over a field.

**Elaborated signatures.** One scratch file containing `#check @name` for all four declarations was elaborated through the permitted targeted build, then the unchanged acceptance file was restored and built again. The elaborated types match README §§1.1–1.2 and 8.1: positivity/divisor closure remain fields of BigWitt.TruncationSet; the ghost polynomial retains CommRing R; ghost_image retains the Frobenius-lift congruence; and framedGamma_existsUnique retains Algebra A R, the polynomial-algebra action, IsScalarTower and Algebra.Etale. No binder was lost, no signature changed, and Suggested.lean is unchanged. Native Witt coordinates are ℕ→R (`Mathlib/RingTheory/WittVector/Defs.lean:52`), whereas truncated coordinates are Fin n→R (`Mathlib/RingTheory/WittVector/Truncated.lean:62`); neither supplies a general big-Witt ring carrier. Native étaleness bundles formal étaleness and finite presentation (`Mathlib/RingTheory/Etale/Basic.lean:205`); it does not impose finiteness of the algebra as a module. The power-series scalar action is coefficientwise (`Mathlib/RingTheory/PowerSeries/Basic.lean:942`), and the differential-basis transport retains the scalar tower and formal-étale hypothesis (`TauCeti/RingTheory/Kaehler/FormallyEtale.lean:67`).

**Computed mathematics pass.** The following rows record concrete values for the repaired claims, their ingredients and the existing roadmap targets/conventions. These are consistency and negative-control calculations, not proofs of the admitted headline theorems. “None” in the change column means the stated hypotheses already distinguish the displayed wrong model.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Prime-generator formula, §3.2a | m=1,2,3 | m=1: (0)≠(q−1); m=2: [2]_q=q+1=Φ₂; m=3: [3]_q=q²+q+1=Φ₃ | m>1 required | New boundary/prime Checks |
| Residual-product definition, §3.2a | m=4,8,9 | u₂=1 for m=4,8 and u₃=1 for m=9; generators q²+1, q⁴+1, q⁶+q³+1 equal Φ₄,Φ₈,Φ₉ | Empty product is the unit | New proof/Check |
| Factorization, §3.2a | m=6 | (q+1)(q²−q+1)=q³+1; (q²+q+1)(q²−q+1)=q⁴+q²+1 | Forward ideal inclusion | New proof/Check |
| Reverse ideal inclusion, §3.2a | m=6 | (q⁴+q²+1)−q(q³+1)=q²−q+1=Φ₆; u₃−qu₂=1 | Integral reverse inclusion | New proof/Check |
| Every prime is needed, §3.2a | m=6,q=−1 | Prime-2 generator evaluates to 0, but Φ₆ evaluates to 3 | Single-prime ideal is strictly smaller | New negative control |
| Prime-power multiplicities, §3.2a | m=12 | u₂=q²+1; u₃=q⁴+q²+1; u₃−q²u₂=1 | Multiplicities retained | New Check |
| Nonreduced reduction, §3.2a | m=12 mod 2 | u₂=(q+1)²; u₃+q²u₂=1 | No squarefree-factor argument | New Check |
| Chain obstruction, §3.2a | m=6; m=30 | m=6 forces d₂=2,d₃=3, incomparable; for m=30 a chain maximum would have valuations (1,1,1), hence 30 rather than a proper divisor | Supplied comaximality excludes a common maximal ideal | New proof |
| Specialization of prime-generator ideals | q=1,m=2,3,6,12 | Generator ideals (2),(3),(2,3)=(1),(2,3)=(1); Φ_m(1)=2,3,1,1 | Specialization agrees | None |
| Integral pair quotients, contract | Orders 1,2; 1,3; 1,6; 1,1 | Quotients 𝔽₂,𝔽₃,0,ℤ respectively; Φ₆−qΦ₁=1 | Distinct-order restriction necessary | Contract cites actual supplier |
| Cyclotomic expansion/product splitting, contract | p=2,m=6; p=3,m=2 | q⁶−1=(q²−1)(q⁴+q²+1), second−(q²+2)first=3∈ℤ_(2)×; (q+1)−(q−1)=2∈ℤ_(3)× | Finite CRT applies | Contract names §§4.1,5.2 |
| Excluded CRT split | p=2,m=2 | (q−1,q+1)=(2,q−1)≠(1) over ℤ_(2)[q]; mod 2 both are q−1 | Must use single factor q²−1 | None |
| Absolute ghost quotient, §3.3 | m=1; m=2,R=ℤ | At m=1 (q−1)x=0 gives R; at m=2 q↦−1 sends 1+q to 0 | Uses local consequence only for m>1 | Proof/Needs changed |
| Nonunital level one, §3.3 | R=ℤε, ε²=0 | εq^j↦ε for every j; (q−1)ε↦0, and ε survives | Quotient is R without a unit assumption | Proof clarified |
| Positive/divisor-closed truncations, §1.1 | Div(6), ∅, {2} | Div(6)={1,2,3,6}; ∅ has one coordinate function; {2} lacks divisor 1 | Definition accepts first two, rejects third | None |
| Truncation shifts, §1.1 | S=Div(6),n=2,k=3 | S/2={1,3}; (S/2)/3={1}=S/6 | Shift direction agrees | None |
| Ghost polynomial, §1.1 | All coordinates 1,n=0,1,2,3,6 | Total w₀=0; w₁=1,w₂=3,w₃=4,w₆=12 | Index zero excluded from targets | None |
| Dwork equivalence, §1.2 | ℤ,Div(2),φ₂=id | Coordinates (1,1) give (1,3), difference 2; desired ghosts (0,1) require 2x₂=1 and have difference 1 | Both image/congruence directions distinguished | None |
| Mixed-prime Dwork congruences, §1.2 | ℤ,Div(6),all coordinates 1 | w₆−w₃=12−4=8∈2ℤ; w₆−w₂=12−3=9∈3ℤ | Tests every prime divisor | None |
| Ghost injectivity, §1.2 | 𝔽₂,Div(2); ∅ | (0,1) and (0,0) have identical ghosts (0,0); empty-coordinate map is singleton→singleton | Torsion hypothesis necessary | None |
| Big Witt addition, §1.3 | ℤ,Div(2) | (1,0)+(1,0)=(2,−1), ghosts (2,2); coordinatewise sum (2,0) gives (2,4) | Universal integral law needed | None |
| Nonunital and zero carriers, §1.3 | Zero-multiplication ℤ; empty/zero ring | (a,b)+(c,d)=(a+c,b+d), product=(0,0); empty and zero carriers are singleton | Unitization kernel agrees | None |
| F,V and projection formula, §1.4 | Div(2),x=(a,b),y=c | F₂V₂(c)=2c; xV₂c=(0,(a²+2b)c)=V₂(F₂(x)c); F₁=V₁=id | Directions and factors agree | None |
| Teichmüller addition/sign, §1.4 | ℤ,r=−1 | τ(−1) has ghosts (−1,1); −τ(1)+V₂τ(1) gives (−1,−1)+(0,2)=(−1,1) | τ is not additive | None |
| Finite series comparison, §1.4a | ℤ,N=2 | γ₂(2,−1)=1+2t+3t²=(1−t)⁻² mod t³; γ₂(2,0)=1+2t+4t² | Inverse-product normalization | None |
| Series comparison with torsion, §1.4a | 𝔽₂,N=2,x=(0,1) | Ghosts (0,0); γ₂(x)=1+t²≠1 | Ghost cancellation excluded | None |
| Teichmüller/linear series distinction, §1.4a | ℤ,N=2 | γ₂τ(2)=1+2t+4t²; γ₂(2,−4)=1+2t | Coordinates determine correct series | None |
| Substitution/restriction/limits, §1.4a | N=4,n=2,x=(1,1); N=0 | γ₄V₂x=γ₂x(t²)=1+t²+2t⁴; N=0 gives 1; infinite τ(1) truncates to 1+t+t² | Correct truncation/substitution | None |
| Nonunital series comparison, §1.4a | R²=0,N=2 | γ₂(a,b)=1+at+bt²; product has t² coefficient b+d, not b+d+ac | Unitization multiplication used | None |
| p-typical length comparison, §1.5 | a=0; p=2,a=1; p=3,a=2 | Lengths 1,2,3; final ghosts x₀,x₀²+2x₁,x₀⁹+3x₁³+9x₂ | Length is a+1 | None |
| Finite Witt étale base change, §1.6 | S={1},∅,Div(2); ℤ→ℤ×ℤ | Targets ℤ×ℤ,0,ℤ×ℤ for the respective Frobenius pushouts | Finite truncation/products agree | None |
| Coprime iterated truncation, §1.6 | a=2,b=3 versus a=b=2 | Div(6) has 4 coordinates, as 2×2; Div(4) has 3 coordinates versus 2×2 | Coprimality cannot be omitted | None |
| Arithmetic fracture, §1.8 | N=1; M=ℤ,N=2; M=ℤ[1/2] | Right product 0 at N=1; ℤ₂∩ℤ[1/2]=ℤ in ℚ₂; ℤ[1/2] has 2-completion 0 | Localization term essential | None |
| Unbounded cochain completion, §1.9 | [ℤ[h]→ℤ[h]],map h | H⁰=0,H¹=ℤ before/after h-completion; H¹=ℤ_p after (p,h)-completion | Two ideals distinguished | None |
| Degree-dependent bounds, §1.9 | Zero-differential Mⁱ=ℤ[h]/h^(i+1) | h-completion=Mⁱ; (p,h)-completed Hⁱ=ℤ_p[h]/h^(i+1), bound i+1 | No uniform bound needed | None |
| Bockstein product/sign, §1.10 | dx=2u,u²=0,f=2 | β₂[x]=u; β₂[x²]=2xu=0; quotient differential on x is 0 | Plus lift convention retained | None |
| Bockstein parameter change, §1.10 | dx=4u,f=4,g=2,a=2 | Fβ₄V[x]=2u=0=β₂[x]; Fβ₄[x]=u≠0; f=1 has zero quotient | V cannot be omitted | None |
| Associative Bockstein, §1.10 | Matrix DGA,dx=3u | β₃[(xE₁₂)(xE₂₁)]=2xuE₁₁=uE₁₂xE₂₁+xE₁₂uE₂₁ | Noncommutative product rule agrees | None |
| Differential ideal quotient, §1.11 | dx=u,relation x; J=0,P | Differential closure (x,u), quotient ℤ; J=0,P give P,0 | Algebra ideal (x) insufficient | None |
| Two-sidedness, §1.11 | ℤ⟨x,y,z⟩,d=0,J=(x) | xy=yx=0 in quotient; yz−zy≠0 survives in ℤ⟨y,z⟩ | Associative scope retained | None |
| Arithmetic coaction/Adams, §2.1 | ℤ,toric ℤ[T],𝔽₂ | ψ₂(2)=2≠4; ψ₂(T)=T²,ψ₃(T)=T³; λ²(1+1)=1 contradicts λ²(0)=0 over 𝔽₂ | Adams-only torsion model rejected | None |
| Integral λ/Witt equivalence, §2.1a | Line l,integers 2,−1 | σ(l)=(1−lt)⁻¹ gives λ(l)=1+lt; λ²(2)=1,λ²(−1)=1; ψ₂(2)=4−2=2 | Inversion/substitution order agrees | None |
| Torsion in λ/Witt equivalence, §2.1a | ℤ[ε]/(2ε,ε²) | V₂τ(ε)≠0 has all ghosts 0; series 1+εt²≠1 | Integral coefficients retained | None |
| Prime sets/free objects, §2.2 | P=∅,P={2},no generators | Empty-prime comonad=id; {2} uses all indices 2ⁱ; free empty object ℤ | Full prime-set scope | None |
| Perfection/initial map, §2.3 | ℤ; toric ℤ[T] | ℤ stays ℤ; ψ₂(T^(1/2))=T after perfection; T has no ψ₂-preimage before | Colimit transition direction agrees | None |
| Perfect coverage, §2.4 | Toric ℤ[T]; ℤ[ε]/ε²,ψ_nε=nε | ψ₂,ψ₃ have bases (1,T),(1,T,T²); mod 2 dual-number ε acts as 0 on the nonzero ψ₂-target | Torsion-freeness alone insufficient | None |
| Relative twists/perfection, §2.5 | R=A; toric ℤ[T]/ℤ | a⊗b↦ψ_n(a)b, so T⊗1↦Tⁿ; over ℤ the image of ψ₂ misses T | Right scalar factor retained | None |
| q-FV system, §3.1 | R=ℤ,m=2,d=1 | F₂V₂(1)=2; V₂F₂(1)=1+q; at q=−1 values are 2 and 0 | FV and VF distinct | None |
| Initial q-Witt quotient, §3.2 | m=1,2; R=0 | Q₁(R)=R; Q₂(ℤ)=ℤ[q]/(q²−1); Q_m(0)=0; V₂(1)=1+q | Presentation boundaries agree | None |
| Ghost/V normalization, §3.3 | m=2,R=ℤ; m=1 | gh₁(V₂1)=0,gh₂(V₂1)=2; at m=1 ghost=id | First-ghost index correct | Dependency repaired above |
| Restriction negative control, §3.3 | m=2,R=ℤ | q↦1 sends V₂1 to 2; ordinary Witt restriction sends it to 0 | No ordinary restriction map inferred | None |
| V-resolution signs, §3.4 | m=6; m=1 | x↦(−V₃x,V₂x)↦−V₂V₃x+V₃V₂x=0; m=1 augmentation=id | Signed cube agrees | None |
| Localization/torsion, §3.5 | R=ℤ; R=𝔽₂,m=2 | ℤ[q]/(q²−1) injects into ℤ×ℤ; Q₂(𝔽₂)=ℤ/4 has nonzero V₂1=2 with both ghosts 0 | Ghost injectivity needs torsion control | None |
| Absolute completion, §3.6 | R=ℤ,m=2; m=1 | p-completion=ℤ_p[q]/(q²−1); q²−1 acts by 0 at m=2; at m=1 qⁿ−1=0 | Quotient retained before completion | None |
| Witt injection/exactness, §3.7 | R=𝔽₂,m=2; R=0,m=1 | W₂(𝔽₂)=ℤ/4→Q₂(𝔽₂)=ℤ/4 keeps 2; zero maps between zero objects; level one is original exact sequence | Zero ghosts do not refute injection | None |
| Λ comparison/image, §4.1 | A=ℤ; toric A=ℤ[T],m=2 | First case c₂s₂=id; toric image ℤ[T²,q]+(1+q)ℤ[T,q] misses T; c₂s₂(T)=T² | Perfectness distinction retained | None |
| Relative q-FV scalar law, §4.2 | Toric A=R=ℤ[T],m=2 | Relative F₂(T)=T; ψ₂-semilinear substitute gives T²; FV(1)=2,VF(1)=1+q | Relative F fixes right scalars | None |
| Relative initial quotient, §4.3 | A=R; m=1; toric A=ℤ[T],R=A[X] | Q_m(A/A)=A[q]/(q^m−1); Q₁(R/A)=R; witness sends V₂(TX)⊗1 to ε and V₂(X)⊗T to 0 | V-linearity relations necessary | None |
| Relative ghost twist, §4.4 | Toric A=R=ℤ[T],m=d=2 | T⊗1=1⊗T²; both identify with T²; reversed twist would require T⁴=T | ψ_d acts on right factor | None |
| Relative base change, §4.5 | A′=A,0; ℤ[T]→ℤ,T↦2 | First comparisons id,0; the last map gives fψ₂(T)=4≠ψ₂f(T)=2 | Must be a Λ-map | None |
| Perfect-cover comparison, §4.6 | R=A; toric ℤ[T]/ℤ | s_(m/A) is an isomorphism; relative linearized Adams on A/A is id after balancing; polynomial c₂ still misses T | Existence versus isomorphism separated | None |
| Étale preservation/F-pushout, §5.1 | Identity,m=1; ℤ→𝔽₂ | Identity comparisons; at m=1 target original algebra; Tor₁^ℤ(𝔽₂,𝔽₂)=𝔽₂ | Arbitrary coefficient maps excluded | None |
| Étale ghost pushout, §5.2 | Non-étale ℤ→𝔽₂,m=d=2 | After tensor, periodic maps are 2,0 on ℤ/4; ker(2)=2ℤ/4≅𝔽₂ gives Tor₁ | Derived conclusion needs étaleness | None |
| Relative torsion, §5.3 | A=ℤ,R=ℤ/4,m=1 | Q₁(R/A)=ℤ/4; 2≠0 and 2·2=0 | Coverage of A does not remove R-torsion | None |
| Both coefficient completions, §5.3 | Infinite-variable toric A,p=m=2 | Residues Σ_(i<n)2ⁱe_(T_i) mod 2ⁿ compatible; each new coefficient 2ⁱ is nonzero at its next stage, so no finite-support lift | Right-hand completion essential | None |
| Flat-twist discreteness control, §5.3 | Square-zero example,r₀,r₁,r₂ | r_j=0,1/3,4/9; e_j orders 2,4,8; transitions e_j↦2e_(j+1) give ℤ[1/2]/ℤ and nonzero T₂ after twist, while T₂(M)=0 | Bounded-primary-torsion hypothesis retained | None |
| Finite type, §5.4 | r=0,1; infinitely many variables | Rank m for ℤ[q]/(q^m−1); at m=2 basis generators 1,T over subring with T²; ideals (T₀)⊊(T₀,T₁)⊊⋯ | Finite-type hypothesis needed | None |
| Completed étale Frobenius, §6.1 | ℤ→ℤ×ℤ,p=2; ℤ[T] | Completed φ₂=id on ℤ₂² and mod 2 squaring=id; polynomial map T↦T² misses T | Étale hypothesis necessary | None |
| Cyclotomic radical convention, §6.2 | d=0; p=2,3,d=1 | Φ₀=1 gives unit ideal; Φ₂ mod 2=q−1; Φ₃ mod 3=(q−1)² | Equal radicals need not be equal ideals | None |
| Completed coefficient/ghost map, §6.3 | m=p,d=1;p=2,q=1+h | Teichmüller paths both r^p; coefficient map sends q to 1+h, framed substitution to 1+2h+h² | q-fixed convention retained | None |
| Strict alternation, §7.1 | Characteristic 2,odd u; ordinary forms | Exterior u²=0 while symmetric u²≠0; d(T²)=2T dT=0 mod 2 | Sign law alone insufficient | None |
| Initial differential q-Witt algebra, §7.2 | m=1,R=A[T]; R=A,0 | Ordinary exterior de Rham; only degree zero for A/A; zero for R=0 | Positive-degree relations preserve degree zero | None |
| Differential Frobenius scale, §7.3 | R=ℤ[T],p=2,3 | F₂(dτT)=T dT,dF₂(τT)=2T dT; F₃(dτT)=T²dT,dF₃(τT)=3T²dT | F is a graded map with scaled differential | None |
| Prime V/PD operation, §7.4 | p=2,q=1,graded V scales | γ₂(V₂x)=V₂(x²),2γ₂(v)=v²; dV₂(T²)=4T dT=V₂(T)dV₂(T) | No inversion of 2 | None |
| Semilinear derivation, §7.5 | p=2,R=ℤ[T] | θτT=T dT,θV₂T=dT; θ((τT)²)=2T³dT rather than 2T²dT | F-semilinearity matters | None |
| Differential ghost degree factor, §7.6 | m=2,d=1 | gh₂V₂(T)=2T; gh₂V₂(dT)=4dT | Factor n^(i+1) retained | None |
| Étale differential extension, §7.7 | ℤ[T]→ℤ[T,T⁻¹] | d(T⁻¹)=−T⁻²dT, while coefficientwise tensor differential gives 0 | Use unique extended differential | None |
| Graded-commutative supplier scope, §7.7 | Noncentral square-zero DGA,ux=0; x inverted | Left tensor leaves Su≠0, but ux=0 would force u=0 after inversion | Noncentral countermodel excluded | None |
| Framed automorphism, §8.1 | (ℤ/4)[T],𝔽₂[T],rank 0 | γ(T²)=(1+2h+h²)T² or (1+h²)T²; rank 0 has no i | Torsion/empty-coordinate scope agrees | None |
| Automorphism inverse/uniqueness, §8.1 | Laurent frame; inseparable T↦Z² mod 2 | γ(T⁻¹)=(1−h+h²−⋯)T⁻¹; every square has h coefficient 0 but (1+h)Z² has coefficient Z² | Completion/étaleness essential | None |
| Divided-difference normalization, §8.2 | 1,T,T²,T³,T⁻¹; base U | D-values 0,1,(1+q)T,(1+q+q²)T²,−q⁻¹T⁻²; D(U)=0 | Relative basis and sign agree | None |
| Koszul signs, §8.3 | Rank 2,XY; scalar operators 2,3 | d¹d⁰(XY)=1−1=0; scalar composite 6−6=0; wrong plus gives 2,12 | Matches supplied cochain convention | None |
| Skew/scaled product, §8.3 | T² in one coordinate | dT·T=qT dT; d_C(T²)=(1+q)T dT; d_H(T²)=(q²−1)T dT | Central forms would give 2T dT | None |
| Framed Frobenius/scalars, §8.4 | p=2,toric U | φ(h)=2h+h²; φ_H(UdT)=U²T dT; φ_C(UdT)=(1+q)U²T dT | Both scaling and semilinearity retained | None |
| Frobenius decomposition, §9.1 | r=1,p=2,α=1; α=0;r=0 | Ring basis 1,T; form basis T dT,dT; α=0 gives dT; r=0 one degree-zero summand | No inverse monomial/empty minimum | None |
| Two-term cohomology, §9.2 | p=2,α=1,e=0; e=α | ann(h)=(h+2),coker(h)=ℤ₂; at e=α differential 0 gives H⁰=H¹=S_α | Kernel/cokernel agree | None |
| Tensor-base convention, §9.2 | α=0,S₀=ℤ₂[[h]]/(h) | Tor₁ over ℤ₂[[h]]=S₀; tensor over S₀ has no negative cohomology | Ambient derived tensor excluded | None |
| Framed Bockstein sign, §9.3 | T,m=1; T²,m=2 | d_HT=h dT gives β₁T=dT; d_HT²=(q²−1)T dT gives β₂T²=T dT | Plus connecting map | None |
| Product homotopy, §9.4 | ω=YdX+XdY,α=dX | H(α,ω)=−XYdX; d_HH=hX dX∧dY=αω+ωα; d_Hω=0 | Boundary, not coefficient invariance | None |
| Higher product-homotopy sign, §9.4 | α=dX∧dY,β=ZdX+XdZ | H=XZ dX∧dY; d_HH=hX dX∧dY∧dZ=αβ−βα | Degrees two/one agree | None |
| Framed cohomology algebra, §9.5 | m=1; m=2,T,T² | β_hT=dT; dT·T²=q²T²dT=T²dT mod q²−1; T is not closed | Cohomological commutativity is the claim | None |
| Iterated prism ideal, §9.5a | p=2,α=0,1,2 | J₀=1,J₁=q+1,J₂=(q+1)(q²+1)=[4]_q; φ_C²(dT)=[4]_qT³dT | Every transported ideal factor present | None |
| q-PD/prism distinction, §9.5a | p=2,3 | δ₂(h)=h,γ₂(h)=0; δ₃(h)=h+h²,γ₃(h)=−h²; δ₂([2]_q)=−q≡1 | Distinct ideals retained | None |
| Frobenius-twisted prismatic input, §9.5a | Toric U,p=2,R=A[T,(T²−U)⁻¹] | Twisted denominator mod 2 is T²−U²=(T−U)²; untwisted denominator is T²−U | Retain ψ_p-twisted source | None |
| Prime-power induction (a), §9.6 | α=0,R=ℤ[T]; singular control | Ω¹=ℤ[T]dT has no 2-torsion; Ω¹ of ℤ[x]/x² has 2xdx=0,xdx≠0 | Smoothness essential | None |
| Prime-power induction (b), §9.6 | Framed ℤ[T],p=2,α=1 | T² and (q+1)T are closed under d_H mod q²−1; they match the polynomial image generators | Cohomology/degree-zero comparison agrees | None |
| Prime-power induction (c), §9.6 | α=0; α=1,p=2 | α=0 comparison is Ω→Ω; at α=1 degree-zero coordinate Frobenius sends T to T² | Complex comparison keeps its twist | None |
| Cartier lifting (d), §9.6 | p=2,α=0,ξ=T dT | dξ=0 mod 2 and F₂(dτ₂T)=T dT; F₂dV₂T=dT but F₂V₂ω=2ω | Quotient must include dV as well as V | None |
| PD-presentation contraction, §9.6a | x↦0; identity presentation | h(x^[n]dx)=x^[n+1], so dh+hd=id−ev₀; identity gives B in degree zero | PD forms give the contraction | None |
| δ on completed PD envelope, §9.6a | p=2,δ(x)=0 | φ(x^[2])=12x^[4],(x^[2])²=6x^[4]; δ(x^[2])=3x^[4] | Zero δ on x^[2] excluded | None |
| General-index smooth comparison, §9.7 | p=2,m=6; p=3,m=2;m=1 | First factors use ψ₂,ψ₆ and q²−1,q⁴+q²+1; second use ψ₁,ψ₂ and q−1,q+1; m=1 gives Ω | Correct twists and prime factors | None |
| Smooth integer torsion-freeness, §10.1 | m=1,polynomial versus ℤ[x]/x² | First Ω¹ is free; second has nonzero xdx killed by 2 | Smooth scope retained | None |
| Degreewise completion, §10.2 | m=1; m=2 over ℤ and mod 2 | h=0 gives bound 1; h(h+2)=0 over ℤ gives bound 1; mod 2 h²=0,h≠0 gives bound 2 | Bounds depend on reduction/index | None |
| Functoriality of coordinate constructions | Toric maps T↦U,U↦V²; identities | Both composite ghost/Teichmüller paths send Tⁿ to V^(2n); identity fixes Tⁿ; tensor right unit maps to 1⊗1 | Stated identity/composition directions agree | None |

**Commit.** a1d1ebed — QWittVectors: review repairs (derive the cyclotomic prime-generator identity locally). Only `TauCetiRoadmap/QWittVectors/README.md` changed; the worktree is clean, and nothing was pushed or posted. H01–H03 remain worker-owned PR-description corrections, not completed edits.

**Build outcome.** `lake build TauCetiRoadmap.QWittVectors.Suggested` exited 0; the final acceptance file produced exactly two `sorry` warnings and no errors:

```text
warning: TauCetiRoadmap/QWittVectors/Suggested.lean:80:8: declaration uses `sorry`
warning: TauCetiRoadmap/QWittVectors/Suggested.lean:100:8: declaration uses `sorry`
Build completed successfully (8976 jobs).
```

The separate scratch signature elaboration also exited 0. The dependency-direction check exited 0 with exactly:

```text
depcheck: 26 roadmaps, 232 edges, 0 problem(s)
```

No UPWARD or CYCLE line was emitted for QWittVectors. This is the README dependency check, not certification of the separate PR-description merge closure.

**Gate outcome.** The pre-commit run exited 1 solely with `dirty=1` for the edited README. After the requested commit, the gate against origin/main exited 0:

```text
gate QWittVectors: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
