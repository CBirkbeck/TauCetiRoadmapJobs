# Human-review response: QWittVectors

Reviewed head: a1d1ebed358fb815615b067ebdfd011f14d2f34a. The review's packaging finding contains seven prerequisite omissions, two incorrect assertions and a transitive-closure qualification, numbered below in textual order; its affirmative mathematical inspection notes are not additional findings. All ten points concern the live PR description or whole-PR merge plan, which this job expressly forbids editing. They remain unresolved there; neither permitted roadmap file requires a repair, and no content commit was made.

## H01 (CBirkbeck) — answered

SchemeKTheoryOperations §§6.2.1–6.2.2 supplies the special λ-ring structures, integral identities and Newton operations consumed by §2.1a (`TauCetiRoadmap/QWittVectors/README.md:60`, line 62), so it is a direct supplier absent from both live PR-body declarations. Add it to both declarations after its prerequisites, including AlgebraicModuliForArithmeticGeometry and AlgebraicKTheory, and before QWittVectors; this does not add a K₀ hypothesis to the elementary λ/Witt equivalence.

## H02 (CBirkbeck) — answered

PrismaticCohomologyPartII §§5.0, 5.18, 3.16, 5.13, 5.19–5.20 supplies the complete framing, skew multiplication and Frobenius/comparison interfaces consumed in Layers 8–9 (`TauCetiRoadmap/QWittVectors/README.md:92`, line 94), so it too is a direct supplier absent from both declarations. Add it after PrismaticCohomology and before QWittVectors in the PR dependency list and merge-order block.

## H03 (CBirkbeck) — answered

The assertion that every otherwise unlisted README roadmap is a consumer is contradicted by the two explicit supplier contracts in H01–H02. Correct that assertion in the PR description; the README already distinguishes these suppliers from HabiroRings and HabiroCohomologyFoundations, its downstream consumers.

## H04 (CBirkbeck) — answered

SchemeKTheoryOperations' low-degree supplier contract and §3.6 consume AlgebraicKTheory A2's determinant, scalar section and SK₁ splitting and A4's semilocal stable-range theorem, so AlgebraicKTheory is an inherited whole-PR prerequisite missing from both declarations. Place AlgebraicKTheory before SchemeKTheoryOperations while retaining QWittVectors' narrow §§6.2.1–6.2.2 mathematical import.

## H05 (CBirkbeck) — answered

PhiGammaModulesAndIwasawaCohomology §2.5 explicitly imports ColemanPowerSeries §§1.45–1.49, whose §1.48 consumes IntegralIwasawaTheory §7.1. The omitted whole-PR order is therefore IntegralIwasawaTheory → ColemanPowerSeries → PhiGammaModulesAndIwasawaCohomology; add ColemanPowerSeries to both PR-body declarations.

## H06 (CBirkbeck) — answered

AInfCohomology §AI.7.2 explicitly imports the actual dual Steenrod Hopf algebras and their structure maps from TangentialBordism §B4 items 2 and 7. TangentialBordism must precede AInfCohomology in the whole-PR merge plan and appear in both declarations; this adds no Steenrod input to QWittVectors' use of the earlier Koszul/décalage sections.

## H07 (CBirkbeck) — answered

CrystallineCohomology's supplier contract and §CR.5:log-algebra.4 consume PurityOfBranchLocus §§0.1 and 2.1–2.2 for stalkwise unramifiedness and branch purity. Add PurityOfBranchLocus before CrystallineCohomology in both whole-PR declarations; LocalPurity is present on main and is not an outstanding prerequisite.

## H08 (CBirkbeck) — answered

The same crystalline section consumes AbhyankarLemma §§0.1–0.3, 1.1 and 3.3–3.4 for DVR tameness, the codimension-one tame-cover predicate and regular-divisor normalization. Add AbhyankarLemma before CrystallineCohomology in both whole-PR declarations, preserving the supplier's own earlier prerequisites.

## H09 (CBirkbeck) — answered

The no-other-author assertion is false for the whole-PR dependency plan: the still-open AlgebraicKTheory and TangentialBordism roadmaps are authored by kim-em, and PurityOfBranchLocus and AbhyankarLemma by tdupu. Correct that assertion together with the declarations above; the authors and open status were independently rechecked.

## H10 (CBirkbeck) — answered

The seven verified omissions establish that the live merge plan is incomplete; they do not certify its entire transitive closure, and the successful README dependency check does not provide that certification. Whole-PR closure and its consistent PR-description update remain unresolved outside the permitted content edits; shrinking it would require independently mergeable supplier foundations and corresponding supplier-contract changes, also outside this job.

**Evidence.** The live description was read at the reviewed head: each of the seven omitted PR numbers occurs zero times, and both disputed assertions remain present. Main was checked at dfdf9a3671420779ef892df5948d52764a1c66ce: all seven prerequisite folders are absent, whereas `TauCetiRoadmap/LocalPurity/README.md` is present. The indexed heads agree with the live supplier metadata:

| Roadmap | Verified head | Contract checked |
| --- | --- | --- |
| SchemeKTheoryOperations | 88dbd5a787e63263d086c798f1873d401debe960 | §§6.2.1–6.2.2; low-degree supplier contract; §3.6 |
| PrismaticCohomologyPartII | 2a6d2286389d83772b6fb1ed121a5bab8892e7de | §§5.0, 5.18, 3.16, 5.13, 5.19–5.20 |
| PhiGammaModulesAndIwasawaCohomology | 6ec1d643f6e17ee135b260525432856be52d267d | Analytic supplier contract; §2.5 |
| ColemanPowerSeries | 37908a0e0b2a4c0856c049980723e12b894e6f73 | §§1.45–1.49, especially §1.48 |
| AInfCohomology | b47987ba7258bfcfa1fb49ba14834c8440fd9058 | TangentialBordism supplier contract; §AI.7.2 |
| CrystallineCohomology | 013a9213642094a35a83bbb9842a8eb397064e0b | Branch-purity and tame-cover supplier contracts; §CR.5:log-algebra.4 |
| AlgebraicKTheory | e5df75ba384b2f944b7b626c00803871017b0b1c | A2 and A4 |
| TangentialBordism | bf9da30d97d50f6008e1f069a2bcee47e87dd4d8 | B4 items 2 and 7 |
| PurityOfBranchLocus | 14e0d1c9b886a311a32f4cef092cd245b83a0288 | §§0.1, 2.1–2.2 |
| AbhyankarLemma | 49830c31b33cf596033123bd0b84d92ee59d49c9 | §§0.1–0.3, 1.1, 3.3–3.4 |

**Ownership and citation checks.** Searches by special λ-ring, commuting-endomorphism Koszul, complete framing, big Witt and q-Witt objects across main, the indexed open heads, the 26 supplied sibling folders and available board package content retain the owners already named in the scope section. SchemeKTheoryOperations owns special λ-rings; AInfCohomology owns commuting-endomorphism Koszul complexes; PrismaticCohomologyPartII owns complete framing and skew q-de Rham complexes; CrystallineCohomology owns generic étale differential extension. HabiroRings and HabiroCohomologyFoundations explicitly consume QWittVectors' arithmetic and differential objects. No construction, ownership transfer, additional supplier or fully qualified declaration was introduced. The board index contains packages whose README is not locally available; no exhaustive exclusion claim is made about those packages.

Cross-roadmap resolution at the stated main/open-head snapshot reports no unresolved citation or Lean name. The actual named supplier sections were inspected, including main's DerivedModuleAlgebra completion contracts, SchemeAndStackFoundations' étale/Frobenius inputs and BordismFormalGroups' arithmetic-square section. The resolver does not inspect the external pinned libraries on this host; library evidence instead uses the actual Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 checkouts, matching the manifest.

The native Witt carrier has `coeff : ℕ → R` (`Mathlib/RingTheory/WittVector/Defs.lean:52`), with the p-typical operations in its Basic, Frobenius, Verschiebung, Teichmuller and Truncated files; it does not provide the arbitrary-truncation big Witt ring. Native étaleness consists of formal étaleness and finite presentation (`Mathlib/RingTheory/Etale/Basic.lean:205`), with no module-finiteness condition. The power-series scalar action is `(map (algebraMap R A)).toAlgebra` (`Mathlib/RingTheory/PowerSeries/Basic.lean:942`), so a series-algebra automorphism fixes h. The Kähler basis transport retains formal étaleness and the scalar tower (`TauCeti/RingTheory/Kaehler/FormallyEtale.lean:58`, line 67). The cyclotomic factorization and expansion inputs are at `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:337`, line 357, and `Expand.lean:38`, line 87; the characteristic-p identities are at `Expand.lean:131`, line 145.

**Sources.** All eight existing source keys have readable legal cached texts and remain settled in `packages/QWittVectors/sources.toml`; no source or manifest change is needed. Relevant retained statements were compared with hesselholt line 223 (the independent prime lifts in Lemma 1.1), borger line 615 (§1.17's integral λ/coalgebra correspondence), wagner line 320 (the cyclotomic argument, retaining the roadmap's necessary m>1 restriction), wagner line 2830 (complete coordinate scaling), pridham line 371 and scholze line 319 (the framed construction), wagner-habiro line 647 (étale coefficient Frobenius), wagner line 3198 (degree-dependent cochain completion), langer-zink line 601 (the differential Verschiebung identity and the source proof's F–V setting), bhatt-scholze line 4289 (the Frobenius-twisted input), and wagner line 3492 (completed PD presentations and coherent functoriality). These checks support retaining the mathematical imports rather than changing them to hide packaging prerequisites.

**Elaborated signatures.** The supplied scratch file contains `#check @name` for all four declarations and its mechanically elaborated output was compared with README §§1.1–1.2 and 8.1. TruncationSet retains positivity and divisor closure as fields; ghostPolynomial retains CommRing; ghost_image retains every required prime-lift congruence; framedGamma_existsUnique retains Algebra A R, the polynomial-algebra structure, IsScalarTower and Algebra.Etale. No section binder is lost and no signature changed, so no post-edit re-elaboration was necessary. The actual acceptance module was built successfully below.

**Computed adversarial pass.** These are concrete consistency and negative-control calculations for the retained statements and conventions, not proofs of the admitted headline theorems. Every row records values; no mathematical statement was added or changed. Conditions about unrelated noncommutative groups, local fields or noncompact spaces do not instantiate the commutative-ring carriers here; the genuinely associative DGA assertions are tested on matrices and free associative algebras below.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Positive indices and total ghost sum, §1.1 | n=0,1,2,3,6; all coordinates 1 | w₀=0; w₁=1,w₂=3,w₃=4,w₆=12 | Zero excluded from theorem indices | None |
| Truncation-set definition, §1.1 | Div(6), ∅, {2} | Div(6)={1,2,3,6}; empty product has one element; {2} misses 1 | Positive-divisor closure distinguishes the nonexample | None |
| Shifted truncations, §1.1 | S=Div(6),n=2,k=3 | S/2={1,3}; (S/2)/3={1}=S/6 | Shift direction agrees | None |
| Ghost image, §1.2 | ℤ,φ₂=id,Div(2) | Coordinates (1,1) give (1,3), difference 2∈2ℤ; ghosts (0,1) require 2x₂=1, difference 1∉2ℤ | Both directions distinguish image from nonimage | None |
| Mixed-prime congruences, §1.2 | Div(6),ℤ,all coordinates 1 | w₆−w₃=8∈2ℤ; w₆−w₂=9∈3ℤ | Both prime divisors required | None |
| Ghost injectivity, §1.2 | 𝔽₂,Div(2); ∅ | Coordinates (0,1) and (0,0) both give ghosts (0,0); empty map is singleton→singleton | Torsion control necessary, empty case valid | None |
| Big Witt addition, §1.3 | ℤ,Div(2) | (1,0)+(1,0)=(2,−1), ghosts (2,2); (2,0) has ghosts (2,4) | Coordinatewise addition rejected | None |
| Nonunital and zero Witt rings, §1.3 | R²=0; R=0; S=∅ | Product (a,b)(c,d)=(0,0); sum=(a+c,b+d); last two carriers are singleton | Unitization convention agrees | None |
| F,V and projection law, §1.4 | Div(2),x=(a,b),y=c | F₂V₂c=2c; xV₂c=(0,(a²+2b)c)=V₂(F₂x·c) | Sources, targets and factor 2 agree | None |
| F/V composites, §1.4 | a=b=2; a=2,b=3 | F₂V₂=2; F₂V₃=V₃F₂ | gcd factor is 2 or 1 respectively | None |
| Teichmüller sign, §1.4 | r=−1,Div(2),ℤ | Ghosts τ(−1)=(−1,1); ghosts −τ(1)+V₂τ(1)=(−1,−1)+(0,2)=(−1,1) | Multiplicative convention agrees | None |
| Finite series comparison, §1.4a | N=2,ℤ | γ₂(2,−1)=1+2t+3t²=(1−t)⁻²; γ₂(2,0)=1+2t+4t² | Inverse product and Witt addition agree | None |
| Series comparison with torsion, §1.4a | N=2,𝔽₂,(0,1) | Ghosts (0,0), series 1+t²≠1 | Ghost cancellation would lose data | None |
| Teichmüller series, §1.4a | N=2,ℤ,a=2 | τ(2) gives 1+2t+4t²; (2,−4) gives 1+2t | Linear series distinguished | None |
| V substitution and restrictions, §1.4a | N=4,n=2,x=(1,1); N=0 | Both substitution paths give 1+t²+2t⁴; empty vector gives 1 | Quotient degrees agree | None |
| Infinite series limit, §1.4a | τ(1),N=1,2,3 | Reductions 1+t,1+t+t²,1+t+t²+t³ | Coefficients stabilize | None |
| Nonunital series kernel, §1.4a | R²=0,N=2 | γ₂(a,b)=1+at+bt²; product has coefficients a+c,b+d since ac=0 | Unitization kernel agrees | None |
| p-typical length, §1.5 | a=0; p=2,a=1; p=3,a=2 | Lengths 1,2,3; final ghosts x₀,x₀²+2x₁,x₀⁹+3x₁³+9x₂ | Length a+1 retained | None |
| Finite Witt étale pushout, §1.6 | S={1},∅,Div(2),ℤ→ℤ×ℤ | Original product algebra, zero algebra, and F₂-pushout ℤ×ℤ respectively | Empty and split cases agree | None |
| Coprime iterated Witt comparison, §1.6 | a=2,b=3; a=b=2 | Div(6) has 4 coordinates=2·2; Div(4) has 3≠2·2 | Noncoprime extension excluded | None |
| Arithmetic fracture, §1.8 | N=1; M=ℤ,N=2; M=ℤ[1/2] | Right product 0; ℤ₂∩ℤ[1/2]=ℤ in ℚ₂; completion of ℤ[1/2] is 0 | Localization term required | None |
| Cohomology/completion, §1.9 | [ℤ[h] —h→ ℤ[h]] | H⁰=0,H¹=ℤ before/after h-completion; H¹=ℤ_p after (p,h)-completion | Two completion ideals distinguished | None |
| Degree-dependent torsion bounds, §1.9 | Mⁱ=ℤ[h]/h^(i+1),d=0 | h-completion=Mⁱ; (p,h)-completed Hⁱ=ℤ_p[h]/h^(i+1), bound i+1 | No uniform bound needed | None |
| Bockstein sign/product, §1.10 | dx=2u,u²=0,f=2 | β[x]=u; β[x²]=2xu=0; quotient differential on x=0 | Plus connecting sign, not quotient differential | None |
| Bockstein parameter change, §1.10 | dx=4u,f=4,g=2,a=2 | Fβ₄V[x]=2u=0=β₂[x]; Fβ₄[x]=u≠0 | V cannot be dropped | None |
| Associative Bockstein, §1.10 | Matrix DGA,dx=3u | β₃[(xE₁₂)(xE₂₁)]=2xuE₁₁=uE₁₂xE₂₁+xE₁₂uE₂₁ | Noncommutative product law agrees | None |
| Differential ideal, §1.11 | dx=u,relation x; J=0,P | Closure (x,u), quotient ℤ; J=0,P yield P,0 | Differential closure required | None |
| Two-sided quotient, §1.11 | ℤ⟨x,y,z⟩,J=(x),d=0 | xy=yx=0; yz−zy≠0 in quotient ℤ⟨y,z⟩ | Associative scope retained | None |
| Arithmetic coaction/Adams, §2.1 | ℤ; toric ℤ[T]; 𝔽₂ | ψ₂(2)=2≠4; ψ₂(T)=T²,ψ₃(T)=T³; δ₂(2)=−1 cannot equal δ₂(0)=0 | Adams-only torsion model rejected | None |
| Integral λ/Witt equivalence, §2.1a | Line l; integers 2,−1 | σ(l)=(1−lt)⁻¹,λ(l)=1+lt; λ²(2)=λ²(−1)=1; ψ₂(2)=4−2=2 | Inversion and substitution agree | None |
| Torsion retained by equivalence, §2.1a | ℤ[ε]/(2ε,ε²) | V₂τ(ε) has zero ghosts but series 1+εt²≠1 | Integral identities required | None |
| Special unit condition, §2.1a | Nonzero 𝔽₂ | Sum law would give λ²(0)=λ²(1+1)=1, versus λ²(0)=0 | No special λ-structure on this ring | None |
| Prime-set definitions, §2.2 | P=∅,{2}; empty generators | Identity comonad; indices 1,2,4,…; free empty ring ℤ | Infinite p-typical scope retained | None |
| Perfection and initial map, §2.3 | ℤ; toric ℤ[T] | ℤ unchanged; ψ₂(T^(1/2))=T after colimit, no preimage of T beforehand | Transition direction agrees | None |
| Perfect coverage, §2.4 | ℤ[T]; dual numbers ψ_nε=nε | ψ₂,ψ₃ bases (1,T),(1,T,T²); mod 2, ε annihilates the nonzero ψ₂-target | Torsion-freeness alone insufficient | None |
| Relative twists and perfection, §2.5 | R=A=ℤ[T]; R=ℤ[T] over ℤ | T⊗1↦T²,1⊗T↦T in first case; linearized ψ₂ misses T in second | Right scalar action and relative notion agree | None |
| q-FV definition, §3.1 | R=ℤ,m=2,d=1 | FV(1)=2; VF(1)=1+q; at q=−1 values 2 and 0 | Two composite laws distinct | None |
| Initial q-Witt quotient, §3.2 | m=1,2; R=0 | Q₁(R)=R; Q₂(ℤ)=ℤ[q]/(q²−1),V₂1=1+q; Q_m(0)=0 | Boundary cases agree | None |
| Prime-generator ideal, §3.2a | m=1,2,3 | (0)≠(q−1); generators q+1=Φ₂,q²+q+1=Φ₃ | m>1 necessary | None |
| Residual product, §3.2a | m=4,8,9 | u_p=1; prime generators q²+1,q⁴+1,q⁶+q³+1 | Empty products handled | None |
| Integral reverse inclusion, §3.2a | m=6 | (1+q²+q⁴)−q(1+q³)=q²−q+1=Φ₆; u₃−qu₂=1 | Both ideal inclusions hold in witness | None |
| Missing-prime negative control, §3.2a | m=6,q=−1 | Prime-2 generator 0; Φ₆(−1)=3 | One prime alone insufficient | None |
| Repeated factors, §3.2a | m=12; mod 2 | u₃−q²u₂=1 with u₂=q²+1,u₃=q⁴+q²+1; mod 2 u₂=(q+1)² and difference still 1 | Nonreduced reduction valid | None |
| Ghost quotient and index, §3.3 | m=1,2,R=ℤ | Level one=id; gh₁(V₂1)=0 at q=−1, gh₂(V₂1)=2 at q=1 | First-ghost convention agrees | None |
| Ordinary restriction negative control, §3.3 | m=2,R=ℤ | q↦1 sends V₂1 to 2; ordinary Witt restriction sends it to 0 | No ordinary restriction claimed | None |
| Signed V-resolution, §3.4 | m=6; m=1 | x↦(−V₃x,V₂x)↦−V₂V₃x+V₃V₂x=0; level-one augmentation=id | Deletion signs agree | None |
| Integer torsion/ghost kernel, §3.5 | ℤ; 𝔽₂,m=2 | For a+bq, ghosts a−b,a+b imply a=b=0 over ℤ; V₂1=2∈ℤ/4 has both ghosts 0 | Torsion hypothesis retained | None |
| Absolute completion, §3.6 | ℤ,m=2; m=1 | p-completion ℤ_p[q]/(q²−1); q²−1 acts as 0; at m=1 qⁿ−1=0 | Quotient retained before completion | None |
| Witt injection and kernel exactness, §3.7 | 𝔽₂,m=2; m=1; R=0 | W₂(𝔽₂)=ℤ/4 maps with 2≠0 preserved; level one original exact sequence; zero case 0→0 | Zero ghosts do not refute injection | None |
| Λ comparison/image, §4.1 | ℤ; toric ℤ[T],m=2 | c₂s₂=id on ℤ; c₂s₂(T)=T²; image ℤ[T²,q]+(1+q)ℤ[T,q] misses T | Perfection distinction retained | None |
| Relative FV/scalar action, §4.2 | A=R=ℤ[T],m=2 | F₂(T)=T on right scalars; ψ₂ substitute gives T²; FV1=2,VF1=1+q | Relative F fixes scalars | None |
| Relative initiality/V-linearity, §4.3 | R=A; m=1; R=A[X],A=ℤ[T] | Q_m(A/A)=A[q]/(q^m−1); Q₁(R/A)=R; negative-control map sends V₂(TX)⊗1 to ε and V₂(X)⊗T to 0 | Additional quotient relations necessary | None |
| Relative ghost balancing, §4.4 | Toric A=R=ℤ[T],m=d=2 | T⊗1=1⊗T² maps to T²; reversed twist would require T⁴=T | ψ_d twist agrees | None |
| Relative base change, §4.5 | A′=A,0; toric T↦2 | Identity and zero; fψ₂(T)=4≠ψ₂f(T)=2 | Λ-map hypothesis required | None |
| Perfect-cover comparisons, §4.6 | R=A; ℤ[T]/ℤ | Linearized base map a⊗b↦ψ_m(a)b is invertible for R=A; polynomial c₂ misses T | Relative perfectness differs from absolute | None |
| Étale F-pushout, §5.1 | Identity,m=1; ℤ→𝔽₂ | Identity, original algebra; Tor₁^ℤ(𝔽₂,𝔽₂)=𝔽₂ | Arbitrary coefficient maps excluded | None |
| Derived ghost pushout, §5.2 | A=R=ℤ,R′=𝔽₂,m=d=2 | Periodic resolution tensored with ℤ/4 has maps 2,0; ker(2)=2ℤ/4≅𝔽₂ | Non-étale derived extension false | None |
| Relative coefficient torsion, §5.3 | A=ℤ,R=ℤ/4,m=1 | Q₁(R/A)=ℤ/4 with 2≠0 and 2·2=0 | Base coverage alone insufficient | None |
| Both-side coefficient completion, §5.3 | Infinite-variable toric base,p=m=2 | Compatible residues Σ_(i<n)2ⁱe_(T_i) mod 2ⁿ have a new nonzero coefficient 2ⁱ at every next level; no finite-support lift | Uncompleted direct sum is incomplete | None |
| Flat twist and discreteness, §5.3 | Square-zero example,r_j=(1−3^(−j))/2 | r₀=0,r₁=1/3,r₂=4/9; orders 2,4,8 with transitions e_j↦2e_(j+1); limit ℤ[1/2]/ℤ has T₂≠0, unlike each finite coordinate | Bounded torsion hypothesis needed | None |
| Finite type, §5.4 | r=0,1; infinite variables | Rank m at r=0; basis generators 1,T over T²-subring at m=2; ideals (T₀)⊊(T₀,T₁)⊊⋯ | Finite-variable condition required | None |
| Completed étale Frobenius, §6.1 | ℤ→ℤ×ℤ,p=2; smooth ℤ[T] | Identity on ℤ₂² reduces to squares; on 𝔽₂[T], T↦T² misses T | Étaleness required for equivalence | None |
| Cyclotomic radicals, §6.2 | p=2,3,d=1; d=0 | Mod 2 Φ₂=Φ₁=q−1; mod 3 Φ₃=(q−1)²; Φ₀=1 makes completion 0 | Radicals, not ideals, agree | None |
| Unequal ideals, §6.2 | p=3,d=1 | q−1 mod (3,Φ₃) is nonzero with square 0, whereas q−1 mod (3,q−1)=0 | Same radical need not mean same ideal | None |
| q-fixed completed ghosts, §6.3 | p=m=2,d=1; τ₂(r) | Two Teichmüller paths give r²; q-fixed map gives 1+h, substitution gives 1+2h+h² | Coefficient and framed Frobenius differ | None |
| Strict alternating q-V systems, §7.1 | Level one ℤ[T]; 𝔽₂[u],degree u=1 | d(T²)=2T dT,dT²=0; nonzero u² violates the extra alternation axiom despite sign commutativity | Characteristic two included | None |
| Initial differential system, §7.2 | m=1; R=A,0 | Ω*; base ring only in degree zero; zero DGA | Positive-degree relations preserve degree zero | None |
| Differential Frobenius scale, §7.3 | p=2,3,R=ℤ[T] | F₂dτ₂T=T dT,dF₂τ₂T=2T dT; at 3 values T²dT,3T²dT | dF=nFd, not chain-map law | None |
| V-only prime differential, §7.4 | p=2,q=1,V on degree i=2^(i+1) | dV₂(T²)=4T dT=V₂(T)dV₂(T); γ₂(V₂x)=V₂(x²),2γ₂(v)=v² | No inverse of 2 used | None |
| Positive-degree Frobenius construction, §7.5 | p=m=2,R=ℤ[T] | θ₂τ₂T=T dT; θ₂V₂T=dT; θ₂((τ₂T)²)=2T³dT, versus ordinary-derivation value 2T²dT | Semilinear derivation required | None |
| Differential ghost coefficients, §7.6 | m=2,degree 0,1 | gh₂V₂(T)=2T; gh₂V₂(dT)=4dT; gh₂dV₂(T)=2dT | Coefficients n^(i+1) consistent with Vd=n dV | None |
| Étale differential extension, §7.7 | ℤ[T]→ℤ[T,T⁻¹],m=1 | d(T⁻¹)=−T⁻²dT≠0; coefficient-blind extension gives 0 | Unique derivation extension required | None |
| Excluded associative scalar issue, §7.7 | ub=b(0)u,localize at x | Left tensor retains Su≠0; multiplication would imply u=(ux)x⁻¹=0 | Central degree-zero condition matters | None |
| Framed scaling/existence, §8.1 | ℤ[T]; localization; r=0 | γ(T²)=(1+2h+h²)T²; γ⁻¹(T)=(1−h+h²−⋯)T; γ(T⁻¹)=q⁻¹T⁻¹; no Fin 0 index | Completion and index conditions agree | None |
| Nonreduced frame and quotient, §8.1 | (ℤ/4)[T]; P/(hT) | γ(T²)=(1+2h+h²)T²; hT=0 in quotient but T≠0 | Quotient differs from P/(T) | None |
| Inseparable nonexample, §8.1 | 𝔽₂[T]→𝔽₂[Z],T↦Z² | Any square series has h-coefficient 0; (1+h)Z² has coefficient Z²≠0 | Étale hypothesis excludes failed lift | None |
| Divided difference, §8.2 | T,T²,T³,1,T⁻¹; relative scalar U | D values 1,(1+q)T,(1+q+q²)T²,0,−q⁻¹T⁻²; D(U)=0 | Normalization and denominator regularity agree | None |
| Skew/h-scaled DGA, §8.3 | T²; two coordinates XY | d_C(T²)=(1+q)T dT,d_H(T²)=(q²−1)T dT; d¹d⁰(XY)=1−1=0 | h factor and exterior sign agree | None |
| Product and coordinate maps, §8.3 | dT,T; merging X,Y into T | dT·T=qT dT versus T·dT=T dT; merged derivative 2T versus (1+q)T | Skew product and injection-only maps needed | None |
| Framed Frobenius chain law, §8.4 | p=2; toric scalar U; h²=0 | φ(h)=2h+h²; φ_H(dT)=T dT; both chain paths on T=(q²−1)T dT; φ_H(UdT)=U²T dT; mod (2,h²),φ(h)=0 | Semilinearity and scaled factors agree | None |
| Framed Frobenius decomposition, §9.1 | r=1,p=2,α=1; r=0; α=0 | Ring basis 1,T; form basis T dT,dT; rank-zero summands 1; α=0 form basis dT | No inverse coordinate or empty minimum needed | None |
| Two-term cohomology, §9.2 | p=2,α=1,e=0; e=α | ann(h)=(h+2),coker(h)=ℤ₂ in ℤ₂[[h]]/(h(h+2)); e=α differential 0 | Kernel and cokernel formulas agree | None |
| Tensor splitting/base ring, §9.2 | Two factors with differential h; α=0 | Basis change (e₁−e₂,e₂) gives differentials 0,h; Tor₁ over ℤ₂[[h]] of S₀ with itself=S₀, over S₀ gives 0 | Ordinary tensor over S_α essential | None |
| Framed Bockstein, §9.3 | m=1,2; r=0 | β₁T=dT; β₂[T²]=[T dT]≠0; no positive degrees gives β=0 | Plus sign and nonzero value agree | None |
| Product homotopy in rank one, §9.4 | α=a dT,β=b | H(a dT,b dT)=−Tab dT; commutator a(γb−b)dT=Ta(hDb)dT | Contraction sign agrees | None |
| Closed product homotopy, §9.4 | ω=YdX+XdY; α=dX∧dY,β=ZdX+XdZ | d_Hω=0; dXω+ωdX=hX dX∧dY=d_H(−XYdX); αβ−βα=hX dX∧dY∧dZ=d_H(XZ dX∧dY) | Boundary identity replaces false cochain invariance | None |
| Framed cohomology system, §9.5 | m=1,2; T² versus T | β₁T=dT; at m=2,T² is closed and q²T²dT=T²dT; T is not closed and qT dT≠T dT | Cohomology commutativity distinguished | None |
| q-PD/prism conventions, §9.5a | p=2,3 | δ₂(h)=h,γ₂(h)=0; δ₃(h)=h+h²,γ₃(h)=−h²; δ([2]_q)=−q≡1 | (h) and ([p]_q) distinct | None |
| Iterated décalage factors, §9.5a | α=0,1,2,p=2 | J₀=(1),f₀=h; J₁=(h+2); J₂=((q+1)(q²+1))=([4]_q); φ_C²(dT)=[4]_qT³dT | All-α factors and base twist agree | None |
| Frobenius-twisted prismatic input, §9.5a | A=ℤ[U],R=A[T,(T²−U)⁻¹],p=2 | Twist gives T²−U²; over 𝔽₂(U),k[Y,(Y−U)⁻¹] versus untwisted k[T,(T²−U)⁻¹] | Coefficient twist cannot be suppressed | None |
| Simultaneous induction, §9.6 | α=0; p=2,cycle T dT | Q₁Ω=Ω; F₂(dτ₂T)=T dT; F₂dV₂T=dT while F₂V₂ω=2ω | Base case valid; dV must join V in quotient | None |
| Completed PD adapter, §9.6a | π=id; extra variable x↦0,p=2 | Identity gives B; d(x^[n+1])=x^[n]dx; δ(x^[2])=x⁴/8=3x^[4] | PD contraction and δ operation agree | None |
| PD presentation comparisons, §9.6a | Extra variables x,y | Both augmentations send x,y,dx,dy to 0 and 1 to 1; H⁰=B,positive cohomology 0; ordinary mod-2 forms retain x dx | PD relations essential | None |
| Smooth E∞ comparison, §9.7 | m=1; p=2,m=6; p=3,m=2 | Identity at m=1; factors (ψ₂,q²−1),(ψ₆,q⁴+q²+1); at p=3 factors q±1 with difference 2 a unit | Twist and CRT factors agree | None |
| Scalar tensor base, §9.7 | n=1,A=R=ℤ | Tensor over C_α gives C_α; ambient ℤ[q]-derived tensor adds Tor₁=C_α | Intermediate base C_α required | None |
| Smooth integer torsion, §10.1 | R=A; m=1; nonsmooth ℤ[x]/x² | Positive base degrees 0; smooth Ω finite projective over torsion-free R; nonsmooth relation 2x dx=0 with x dx≠0 | Smoothness necessary | None |
| Bounded difference torsion, §10.2 | m=1; A=R=ℤ,m=2; mod 2 | h acts as 0 at m=1; ann(h)=(h+2) before reduction with bound 1; mod 2 gives 𝔽₂[h]/h² with h≠0,h²=0, bound 2 | Integer torsion and h-torsion distinct | None |
| Zero ring and invertible primes, all applicable layers | A=R=0; p invertible in A | All carriers singleton/zero; p-completion 0, hence both completed comparison sides 0 | No good-prime exclusion needed | None |

**Build outcome.** `lake build TauCetiRoadmap.QWittVectors.Suggested` exited 0. Exact completion line: `Build completed successfully (8976 jobs).` The only warnings were `declaration uses sorry` at `TauCetiRoadmap/QWittVectors/Suggested.lean:80:8` and line 100:8. No Lean process remains running.

**Dependency-direction output.** The prescribed movable dependency check exited 0 and printed exactly:

```text
depcheck: 27 roadmaps, 235 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. This is evidence about the roadmap's section-level supplier graph, not correction of the live PR's whole-PR declarations.

**Gate outcome.** The prescribed gate against origin/main exited 0. Exact summary line:

```text
gate QWittVectors: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
