# Mathematical repair report

The two reviews reuse identifiers F01–F03. Each section below identifies its review explicitly; the second review's overlapping F01 uses the single resolution recorded for the first review's F01. Findings were treated as claims, including their proposed repairs. No helper agents were used.

## F01 (P3) — applied

Review r2a. Elementary positivity, relation evaluation, monomial calculus and ten example blocks → README mathematics and computed Checks only. Their unused definitions were deleted. The remaining four declarations are the torus definition, two torus milestones and prime cyclotomic decomposition. The uniform estimate itself remains §1.8; positivity is not its acceptance theorem.

## F02 (P3) — applied

Review r2a. Obsolete q-Witt declaration spellings → descriptive imports from the actual QWittVectors sections throughout the ownership table, contracts and §§0.2, 1.1–1.2, 3.18 and 7.2. The supplied head states the mathematical interfaces without those old names. Its §6.3 sends 1+h to 1+h, whereas substituting q² gives 1+2h+h².

## F03 (P1) — not actionable in this package: the missing general interface belongs to a supplier extension

Review r2a. E5:abstract supplies strong/lax coCartesian functors, not the dual-cartesian/oplax span correspondence. Added matching gap:oplax-dual-fibration in README and plan; conditioned §§5.9, 5.11–5.12 and corrected the ownership claim. Added unit, rank and coalgebra-coherence Checks. EnhancedDerivedSheaves must supply the extension; editing this package cannot implement or accept it.

## F04 (P1) — applied

Review r2a. Earlier supplier CohomologyComparisons also described as a downstream consumer → its classical maps are imports, while the new specialization equalities and scheme descent are outputs here. The paragraph no longer asserts the reverse edge. Any consumer extension needs separate later ownership; no existing Part II is asserted to own it.

## F05 (P3) — applied

Review r2a. Divided-power notation for the input and Paragraph 3.28 → the ordinary root-adjoined p-completed quotient and proof of Lemma 3.29, p.39, QH lines 1719–1729. The exponents remain (1,1,0,0) and (2,2,1,0). Sch Lemma 4.1 moved from §8.2 to §1.10; Sch Conjecture 7.5 left §1.20. Envelope divided powers remain distinct.

## F06 (P3) — applied differently

Review r2a. Repeated laws → computed instances in every block identified by its definition audit: §§1.18, 2.3–2.4, 2.7, 3.20, 4.1, 4.4, 4.6, 4.9, 4.12, 4.14, 4.17, 5.15, 8.1, 8.18–8.19. The rational line uses the completed coordinate filtration; crystalline Frobenius p·dlog T is distinguished from ordinary Witt F(dlog[T])=dlog[T]. No Lean padding was added.

## F07 (P3) — applied

Review r2a. Future own API identifiers → mathematical API bullets and descriptive references; the four retained Lean names still occur in the README. The module title and introduction now identify an acceptance test, enumerate its native headlines and explain the missing carriers for each unavailable cohomological headline family, including proper perfectness and both canonical-map equalities.

## F08 (P2) — applied

Review r2a. Arbitrary global frames on every Čech term → chosen frames only where assigned, local framed refinements and descent elsewhere, retaining qΩ on unframed terms. Added polynomial, split-cover and elliptic identity-cover Checks. The elliptic witness holds: a pole of order n at infinity makes df have n+1 affine zeros, so no global étale coordinate exists.

## F09 (P1) — applied

Review r2a. Locally owned arbitrary-scalar polynomial Jackson calculus → import HabiroCyclotomicCompletions §1.1. Deleted qDiff and jackson_calculus; updated ownership, §§1.2 and 7.2 and all consumers of the deleted names. The distinct theorem owned here is global/framed comparison §1.14. The adapted derivative has sign D′=(1−q)D; the framed q-Hodge operator is −D′.

## F10 (P1) — applied

Review r2a. Superseded PR/DD/CR.0/Q3 locators → actual earlier sections throughout all layers. Local q-theory, Nygaard and AΩ/uniqueness now name PrismaticCohomologyPartII; generic cotangent/powers and module completion name DerivedModuleAlgebra; ordinary envelopes name DerivedDeRhamCohomology §PD.6; perfect prisms name PerfectoidSpaces §P4.15.2. CohomologyComparisons references also use its numbered sections. The finite-projective Nygaard gap now names its existing base owner.

## F11 (P2) — applied

Review r2a. A new request for distinct-order integral quotient classification → import HabiroCyclotomicCompletions §4.1. Both README and plan retain only the residual common-completion/product contract under the same slug. Updated §0.2's Needs and added the (3,12), (1,6) and equal-order computations. The residual supplier extension remains conditional, rather than asserted to exist.

## F01 (P3) — applied differently

Review r2b. Settled together with r2a F01: deleted qHodge_polynomial, its unused differential definition and examples, retaining the formulas as README targets/Checks. The suggested proof-in-place alternative conflicts with this job's deletion rule, and keeping the README's deleted Lean name would violate agreement; both name occurrences were therefore replaced by mathematical prose.

## F02 (P3) — applied

Review r2b. Three Check references to Lean counterparts → computations alone. Section 0.2 retains the cyclotomic values, §2.2 states the evaluation identity for m≥0 while cyclotomic reduction uses m≥1, and §8.2 retains the sign calculation. Section 7.2 records [2]_q, [3]_q and the coefficient difference/sum in mathematical prose.

## F03 (P3) — applied

Review r2b. “Denominator estimates below” → “denominator estimates of §§1.5–1.8”. Sch25's cited range 6.0–6.3 → 6.1–6.3. The Sch manifest entry also records the rational framed comparison and connection/torus uses actually cited. No source key was added or renamed.

## Source, ownership and interface evidence

All statements and Checks are authored mathematical descriptions, not copied source passages. The cached sources retain their existing legal provenance. There are no missing or newly requested texts. Sch25 is used only for its institutional course index, not as a read proof of analytic constructions.

| Question | Evidence read and conclusion |
| --- | --- |
| Root-adjoined quotient and coefficient powers | QH line 1700 states Lemma 3.29; QH lines 1719–1729 give its root-adjoined quotient, envelope basis and exponent max(n−floor(i),0). Input x=0 and envelope x≠0 are distinct. |
| Framing requirement | QH lines 3156–3159 require a framed smooth algebra. The elliptic pole-divisor proof supplies the negative instance independently. |
| Rational comparison locator | Sch lines 417–433 concern the rational framed comparison and its differential operator. Sch lines 788–797 concern the conjectural independence of q-connection categories, not Čech comparison of qΩ. |
| Oplax direction | QH lines 2689–2715 distinguish the dual fibrations and bounded cartesian-edge assertion. EnhancedDerivedSheaves E5:abstract.1–3 and BordismFormalGroups F6.5's monoidal/fibration sub-lane supply coCartesian strong/lax interfaces; no corresponding dual-span statement is there. |
| Nygaard domain | QH lines 1431–1443 define the explicit filtration. PrismaticCohomologyPartII §§3.13–3.16 place relative Nygaard on φ_A*Δ and supply Frobenius/décalage. The extra finite-projective twisted compatibility remains the declared gap. |
| q-PD envelope hypotheses | BS lines 4148–4178 and QH lines 3193–3235; PrismaticCohomologyPartII §§5.7–5.8 retain complete relative regularity, flatness and complete quotient hypotheses. No four independent rings stand for an envelope comparison. |
| Ordinary PD and cotangent owners | DerivedDeRhamCohomology §PD.6 imports the module prefix from DerivedModuleAlgebra; the latter §§0.4, 0.8–0.14, 1.1–1.4 supply full cotangent/powers and module completion. Its §0.K.1 supplies regular Koszul acyclicity. |
| Derived de Rham owner | DerivedDeRhamCohomology §§1.14–1.17, 1.22, 2.22–2.27, 3.2–3.6, 4.6 and 5.1–5.7 supply filtered operations, animation/completion, conjugate theory, torsion boundary and quasisyntomic descent. |
| Perfect prisms | PerfectoidSpaces §P4.15.2 explicitly owns the perfect-prism/integral-perfectoid equivalence; PerfectoidQuotients imports it under “From PerfectoidSpaces: derived and prism interfaces”, and its §0.0 owns complete étale δ-extension. |
| Canonical specialization suppliers | AInfCohomology AI.1, AI.3–AI.5 and CrystallineCohomology CR.2/CR.4 have the cited domains. CohomologyComparisons §§1.2, 1.4, 1.7–1.9, 6.10 export maps to Habiro consumers. Its export does not consume the new equalities back. BMS1 line 5752 and BS lines 4579–4595 identify their classical normalization. |
| Polynomial calculus | HabiroCyclotomicCompletions §1.1 states the arbitrary-ring coefficientwise operator, twisted product, derivative specialization and D′=(1−q)D. Thus q=0 and the change of sign create no new ownership. |
| Integral intersections | HabiroCyclotomicCompletions §4.1 already states the prime-power ideal equality and comaximality otherwise; QW line 305 locates the source lemma. The only remaining requested contract concerns their derived-completion consequences. |
| q-Witt imports | Each cited label at the supplied QWittVectors head was read: §§2.1–2.4, 3.2–3.3, 4.2–4.4, 5.1–5.2, 6.1–6.3, 7.1–7.7, 8.1–8.3, 9.6–9.7, 10.1–10.2. Mathematical contracts persist; obsolete API spellings do not. |
| Supply direction and ownership | Required roadmaps grep/show and object searches of main, board packages and all 22 supplied sibling heads were performed. HabiroRings owns ordinary marked étale models; QWittVectors owns relative differential q-Witt/framed calculus; QSeriesPartitionsAndMockModularForms imports elementary calculus and does not own these cohomological constructions. Other sibling matches concern unrelated regulators, Euler conditions or K3 Nygaard theory. |

The main content revision was a07e2024f391f3022520c3f8ad194912b3eab614. Open suppliers were read through the indexed roadmaps show interface; QWittVectors and all supplied sibling heads were checked at their specified copies. No fully qualified name retained here duplicates a declaration in a readable roadmap. This package owns enhanced Habiro module descent, arithmetic global qΩ, animated and twisted applications, chosen q-Hodge pairs, canonical sections and the stated canonical-map equalities; ordinary polynomial calculus is imported. No target moved from a later supplier into this package.

Pinned declarations were inspected by object and name. Mathlib `Algebra.Etale` in Mathlib/RingTheory/Etale/Basic.lean:205 and `Algebra.Smooth` in Mathlib/RingTheory/Smooth/Basic.lean:539 include formal étaleness/smoothness and finite presentation, not frames. `IsAdicComplete` in Mathlib/RingTheory/AdicCompletion/Basic.lean:56 includes Hausdorffness and precompleteness, not an enhanced completion carrier. `RingTheory.Sequence.IsRegular` in Mathlib/RingTheory/Regular/RegularSequence.lean:146 extends weak regularity. `AddMonoidAlgebra.lift` in Mathlib/Algebra/MonoidAlgebra/Basic.lean:597 lifts a multiplicative character, and its single-monomial law determines the map. Tau Ceti's character in TauCeti/LinearAlgebra/Basis/DiagonalTorus/Basic.lean:102 evaluates a finite product of unit powers; it is not the Laurent algebra automorphism or enhanced quotient descent.

Mathlib's geometric sums (Mathlib/Algebra/Ring/GeomSum.lean:232), cyclotomic divisor product/prime formulas (Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:337,357,366,374,381), derivative and divided-power multiplication were inspected at the pin. `WittVector.fontaineTheta_teichmuller` in Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:182 supplies θ on Teichmüller coefficients. Neither this nor the existing 1-categorical DerivedCategory supplies the missing enhanced qΩ/AΩ, relative differential q-Witt, Nygaard, coherent pair or analytic carriers listed in the module docstring.

## Computed adversarial pass

These are boundary computations and negative controls, not proofs of the universal targets or an independent acceptance decision. Each row identifies its statement or explicitly named API clause. B denotes the coefficient ring of that row, h=q−1, and complexes use cohomological degrees. A zero ring is allowed where the domain permits it; a negative control can deliberately violate a hypothesis. The general source hypotheses remain attached to each target. No arbitrary-DVR formula replaces a ℤ_p formula, and no prime is excluded.

| Statement | Instances tried | Computed values on the two sides or wrong model | Result; change |
| --- | --- | --- | --- |
| Conventions: indices and geometric sums | r=0,1,2; q=0,1,2 | [0]_q=0, [1]_q=1, [2]_q=1+q; [2]_0=1, [2]_1=2, [2]_2=3; f₀=0 is excluded | Agrees; no completion at f₀ introduced |
| Conventions: shifted quotients and degrees | ℤ/2, f=2; one form | Cone(0) has H⁻¹=H⁰=ℤ/2; Ω¹[−1] has H¹=Ω¹, H⁰=0 | Agrees; kernels and shifts retained |
| Conventions: completion order | ℚ; ℤ at p=2,3 | ℚ^∧_p=0; ℤ^∧_p[1/p]=ℚ_p; (ℤ[[h]]⊗ℚ)^∧_h=ℚ[[h]], but the uncompleted tensor misses Σhⁿ/(n+1)! | Agrees; no exchange by mere flatness |
| Conventions: strict odd alternation | ℤe in odd degree; characteristic 2 | e∧e=0 integrally and modulo 2; graded commutativity alone only gives 2e²=0 | Agrees; alternation retained in imports |
| §0.1 reflection | M=0, B/h, ℚ(q) | L_H(0)=0; L_H(B/h)=B/h; L_H(ℚ(q))=0 despite ℚ(q)≠0 | Agrees; detection restricted to complete objects |
| §0.1 towers, tensor and detection | unit and h-torsion | L_H(B)⊗̂L_H(B)=L_H(B); (B/h)/h has H⁻¹=H⁰=A; h-completion of the unit is A[[h]] | Agrees; generic owner citation corrected |
| §0.2 finite descent and restrictions | m=1,2,6,12 | Rational m=2 gives two factors; m=6 gives four; m=12,p=2 gives two p-factors indexed 1,3; every unit transition 6→2→1 and 6→3→1 gives 1 | Agrees; no repeated prime-chain factors |
| §0.2 integral overlap | (3,12),(1,6),(3,3) | First quotient 𝔽₂[q]/(q²+q+1): q²=q+1, 2q=0; second quotient 0 since Φ₆−qΦ₁=1; third ℤ[q]/Φ₃ | Imported classification; residual gap narrowed |
| §0.2 characteristic-two gluing | m=2 over ℤ,ℚ,𝔽₂ | Over ℚ two independent idempotents; over ℤ values (1,0) disagree mod 2; over 𝔽₂ both loci have support q=1 | Agrees; Check no longer names Lean tests |
| §0.3 marked lifts | R=A,A²; non-étale ℚ[y]/y² | E₁=A[[h]], E_m(A²)=E_m(A)²; y²=0 lift has nilpotent y, y²=h lift is a domain | Agrees; marking and étaleness exclude wrong lifts |
| §0.3 Frobenius and transitions | split ℤ²,p=2; p=2,d=1 | φ₂(a,b)=(a,b) on ℤ₂²; q-fixed overlap sends 1+h→1+h, substitution q² gives 1+2h+h² | Agrees; descriptive supplier contracts |
| §1.1 local coefficients | p=2,3; unit | Φ₂=h+2, Φ₃=h²+3h+3; B/(h)=ℤ_p and B/(Φ_p)=ℤ_p[ζ_p] | Agrees; q-PD and prism ideals remain distinct |
| §1.2 polynomial Jackson | f=x²,g=x,q=0,1,2 | D₀x³=x²; D₂x²=3x; D₂x³=7x²=6x²+x²; f(2x)−f(x)=3x²=h x D₂f | Agrees; imported from earlier owner |
| §1.2 adapted sign | x²,q=2; x in char 2 at q=1 | D′₂x²=−3x, hD₂x²=3x; D₁x=1 but hD₁x=0 | Agrees; sign Check retained in prose |
| §1.3 local animation and torsion | unit; R=𝔽₂/ℤ₂ | Unit qdR=B; derived dR model [ℤ₂⟨z⟩ —z−2→ ℤ₂⟨z⟩] has 2(z^[2]−2)=0, unlike crystalline ℤ₂ | Agrees; local and global smooth claims distinguished |
| §1.5 δ and q-divided-power bounds | p=2; h,h² | δ(h)=h, δ(h²)=2h²+2h³; γ_q(h)=h−h=0; δ(2⁻¹z) has denominators bounded by 2³ | Agrees; q-PD owner corrected |
| §1.6 forward envelope expansion | p=2,δ(T)=0,n=1,2 | γ(T)=T²/2=(1+h/2)γ_q(T); γ²(T)=T⁴/8, whose denominator divides the allowed 64 bound | Agrees; ordinary envelope owner corrected |
| §1.7 reverse expansion | same T,p=2 | γ_q(T)=γ(T)/(1+h/2)=γ(T)−hγ(T)/2+h²γ(T)/4−…; h exponents i and i+1 at p=2,3 | Agrees; prime-dependent inverse bound retained |
| §1.8 uniform denominator | n=0,1,2,3 | N₀=N₁=1, N₂=64, N₃=2¹⁴3²⁶>0 | Agrees; scalar positivity removed from acceptance file |
| §1.4 rational envelope comparison | unit at p=2,3 | Both h-complete rational corners equal ℚ_p[[h]], unit maps 1→1; rationalizing then p-completing would instead give 0 | Agrees; denominator locator fixed |
| §1.9 twisted Koszul comparison | empty sequence; g=2,u=3 on ℚ | Rank 0 complex ℚ on both sides; rank 1 components (1,3) satisfy 3·2=6·1; inverse is (1,1/3) | Agrees; no same-index commutation added |
| §1.10 rational framed operator | 1,x,x² | Automorphism factors 1,1+h/2,1+h+h²/3; u∂(x²)=(2+h)x=D_q(x²); modulo h all factors are 1 | Agrees; Sch Lemma 4.1 moved here |
| §1.11 envelope square | empty frame; one coordinate | Empty comparison 1→1; coordinate differential at h=0 is dx on both routes | Agrees; local framed owner corrected |
| §1.12 arithmetic qΩ | S=A=ℤ; zero smooth algebra | Unit pullback ℤ[[h]], p-corners ℤ_p[[h]], rational corner ℚ[[h]]; zero input has zero corners | Agrees; rational corner not dropped |
| §1.13 three specializations | ℤ[x],p=2 | x²↦(2+h)x dx reduces to 2x dx; local prism ideal h+2; rational linear differential 1 gives H¹=0 | Agrees; no extra perfect-coverage hypothesis |
| §1.14 framed/global equivalence | empty frame; x,x² | Empty frame A[[h]]; both models send x→dx and x²→(2+h)x dx | Agrees; this is the owned comparison, not polynomial calculus |
| §1.15 completed base change | ℤ→ℚ; identity | Unit completed tensor ℚ[[h]] on both sides; plain tensor misses Σhⁿ/n!; identity sends h→h | Agrees; completion retained |
| §1.16 comparison cocycle | identical frames, triple identity | 1→1, dx→dx by direct/composite maps; −id gives 1→−1 and fails | Agrees; enhanced transport retained |
| §1.17 PD totalization | ℤ[T]→ℤ,T→0 | Zeroth envelope ℤ⟨T⟩, Tot ℤ; taking a single envelope leaves nonzero T instead of 0 | Agrees; PD owner corrected |
| §1.18 derived-commutative lift | unit; ℤ[x], then mod 2 | Unit product 1·1=1; mod h d(x)=dx,d(x²)=2x dx; mod 2 these become dx,0 | Agrees; repeated laws replaced by actual values |
| §1.19 étale descent | identity and S→S² | Identity Tot=qΩ_S; diagonal cover equalizer {(a,a)}≃qΩ_S; (1,0) fails the overlap | Agrees; no global frame used |
| §1.20 framed diagram transport | ℚ[x]; elliptic affine curve | Polynomial maps x²→(2+h)x dx; a pole n on the elliptic curve gives df a pole n+1 and n+1 affine zeros | General descent preserved; global frame assertion repaired |
| §1.20 augmentation/coherence | split cover | Two projections send (1,dx)→(1,dx); choosing −id on one copy gives (−1,−dx) | Agrees; unframed augmentations kept as qΩ |
| §1.21 étale sheaf | affine identity, disjoint union, D(x)∪D(1−x) | Sections qΩ_S; disjoint union gives two factors and zero cross-intersection; 1=x+(1−x) makes the two opens cover | Agrees; complete module owner corrected |
| §1.22 flat framed connection | M=C; empty frame | ∇x=1, x∇1=0; ∇x³=(1+q+q²)x²; empty frame gives ordinary finite projectives | Agrees; ∇ is coefficient-linear, not C-linear |
| §1.23 torus scaling definition | d=0; q=1; q=2,d=1,m=−1 | Identity on B in rank 0; all coefficients unchanged at q=1; x⁻¹→x⁻¹/2 at q=2 over ℚ | Agrees; unit binder retained |
| §1.23 action and inverse | q=2,a=1,b=2,m=−1 | σ₃x⁻¹=x⁻¹/8=σ₁σ₂x⁻¹; σ₋₁σ₁x⁻¹=x⁻¹ | Agrees; action binder retained |
| §1.23 unique invertible characterization | a=(2,−1),m=(−1,3),q=2 | Dot product −2−3=−5; coefficient 1/32; inverse has coefficient 32; zero ring has one possible map | Agrees; generators determine the algebra map |
| §1.24 modified connection | Γ=σ; Γ=2σ over ℚ[[h]] | ∇̃x=h; id+x∇̃=Γ; for Γ=2σ, Γ1−1=1 is not h-divisible | Agrees; modified and ordinary connections distinct |
| §1.25 lattice descent | d=0; d=1,q=1 | C⋊0=C; at q=1 the extra Laurent group variable remains and H¹(ℤ,C)=C | Agrees; trivial action does not remove stabilizers |
| §1.26 coherent equivariance | q=2 on ℚ[x±1] | θ(1⊗x)=2x, θ⁻¹(x)=1⊗x/2 under the specified identification; d=0 has no extra H¹ | Agrees; direction of linearization fixed |
| §1.27 quotient QCoh | q=1 and q=−1,d=1 | Stabilizers ℤ and 2ℤ; unit Ext¹ is C at q=1, versus 0 on the coarse affine | Agrees; infinite lattice retained |
| §1.28 heart and perfectness | zero, unit, regular group representation | Underlying C-ranks 0,1,∞; C[ℤ] compact equivariantly but not finite projective over C | Agrees; affine perfectness not replaced by equivariant compactness |
| §2.1 cones and filtration direction | 2 on ℤ and ℤ/2; id | First quotient ℤ/2 in H⁰ only; second ℤ/2 in H⁻¹,H⁰; cone(id) has zero cohomology | Agrees; no derived quotient replaced by cokernel |
| §2.2 coefficient relation | m=2,(2,3,1),(2,2,1) | βt−(q²−1)=0 and −1 respectively; at m=0,(2,0,0) gives 0 | Agrees; evaluation target kept only in prose |
| §2.2 grading and Rees quotients | β,t,q at m=1 | Degrees +1,−1,0; βt has degree 0; mod t gives A[β], mod β gives A[t], and q→1 in each | Agrees; swapping weights fails individual degrees |
| §2.3 degree-one quotient | h-adic unit | Step 0 A, step 1 0; same-index quotient has A in step 1 | Agrees; actual Check retained |
| §2.3 torsion and trivial filtration | M=ℤ[q]/h | Constant filtration gives H⁻¹=H⁰=M each step; trivial filtration step 1 gives H⁻¹=M,H⁰=0 | Agrees; two new discriminating Checks |
| §2.4 animation | polynomial ℤ[x], split rational algebra | x²↦(2+h)x dx; H⁰(qdR_(ℚ²))=ℚ[[h]] versus H⁰(qΩ)=ℚ²[[h]] | Agrees; product-preservation wrong model excluded |
| §2.5 smooth global discrepancy | ℚ[x±1] | H¹(qdR)=0, H¹(qΩ)=ℚ[[h]]dlog x; both local p-completions are 0 | Agrees; p-local smooth agreement is not global agreement |
| §2.6 animated base change | unit; identity | Completed unit base change A′[[h]] on both sides; identity (1,h)→(1,h) | Agrees; coefficient extension owner resolved |
| §2.7 combined filtration | unit; rational line | Unit F¹=hB; line completed F¹=[hS→Sdx], containing h,dx but not 1; ordinary Hodge F¹ excludes h | Agrees; completed model distinguished from raw animation |
| §2.8 global rational comparison | unit; ℚ² | Unit rational value A_ℚ[[h]]; split-algebra animated value ℚ[[h]] on both sides, not ℚ²[[h]] | Agrees; animation not silently completed at Hodge |
| §2.9 p-rational comparison | unit ℤ,p=2,3 | Target ℚ₂[[h]] or ℚ₃[[h]]; Σp⁻ⁿhⁿ not in ℤ_p[[h]][1/p] before h-completion | Agrees; operation order retained |
| §2.10 comparison square and c_p | unit and rational base | Unit routes both send h→h in ℚ_p[[h]]; rational base has p-corners 0, global corner ℚ[[h]] | Agrees; no deduction of filtered c_p from c alone |
| §2.11 décalage/Frobenius | α=0; p=2,3; linear class | [1]_q=1 so η=id; [2]_q=h+2,[3]_q=h²+3h+3; η_h[B —h→B] has differential 1 after rescaling | Agrees; relative Frobenius owner corrected |
| §3.3 restriction obstruction | initial unit at m=2; zero family | A putative R₂ must kill V₂1=1+q, while q→1 sends it to 2≠0; zero family has unique maps 0→0 | Agrees; obstruction is to the initial family on the full domain |
| §3.6 ordinary-to-q-Witt map | a=0; p=2,a=1 | At index 1 the comparison is identity on Ω; at index 2 the unit V₂1=1+q has F₂V₂1=2 | Agrees conditionally; relative factorization remains supplier gap |
| §3.13 scaled Frobenius | dlog x,p=2,3 | Ordinary Witt F(dlog[x])=dlog[x]; chain Frobenius gives 2dlog[x],3dlog[x] | Agrees; comparison uses scaled F̃, not F |
| §3.12 q-Witt arithmetic square | A=S=ℤ,m=2 | Ghosts ℚ²; integral image {(a,b):a≡b mod 2}; V₂1→(2,0) | Agrees; no rational product substituted integrally |
| §3.12 scalar tensor base | C=ℤ[q]/(q²−1) | C⊗ᴸ_C C_(2)=C_(2) in degree 0; C⊗ᴸ_(ℤ[q])C_(2) also has Tor₁=C_(2) | Agrees; tensor base retained |
| §3.14 functorial obstruction | nonrational ℤ; rational ℚ | At m=2,V₂1=1+q≠0 and F₂V₂1=2; over ℚ rational pair construction exists with hD on framed inputs | No counterexample to scoped obstruction; not every family of modules excluded |
| §3.15 twisted complexes | m=1; unit m=2; ℤ[x] | m=1 gives η₁=id; unit coefficient f₂-completion; transition misses the H¹ class xdx with coefficient B/[2]_q | Agrees; naive twisted limit not called Habiro descent |
| §3.16 twisted fracture/Frobenius | m=2, unit; identity divisor | Unit local rings complete at (2,h) with 1→1; inverting 2 makes Φ₂(1)=2 a unit near q=1 | Agrees; simplified local pieces used only after parameters invert |
| §3.18 animated forms/stupid filtration | m=1,S=ℚ²; unit m=2 | gr⁰=ℚ² but dR=ℚ; F¹ has H¹=ℚ; unit stupid F¹=0 while N¹ contains 1+q | Agrees; graded agreement does not imply uncompleted filtered agreement |
| §3.17 twisted deformation | unit,m=1,2 | Unit reduction B/f_m=A[q]/f_m; at m=2 V₂1 has ghosts (2,0); zero algebra gives 0 | Agrees; derived rather than arbitrary degreewise quotient |
| §3.20 explicit Nygaard | a=1,p=2,3,S=ℤ | Ghost N¹=(2ℤ,0),(3ℤ,0); N²=(4ℤ,0),(9ℤ,0), respectively | Agrees; repeated laws replaced by computed lattices |
| §3.20 split/zero Nygaard | S=ℤ²,0;p=2 | Two independent N¹ lattice generators ((2,0),(0,0)),((0,0),(2,0)); zero input gives 0 | Agrees; diagonal wrong model excluded |
| §3.21 divided-Frobenius square | unit,p=2,n=1 | N¹=[2]_qℤ maps by F̃₂/2 to ℤ via [2]_qa→a; preimage of zero is 0, the first stupid step | Agrees; division tied to the constructed image |
| §3.22 relative unit Nygaard | a=1,p=2,3 | Relative linearization id_B gives N¹=Φ_pB,N²=Φ_p²B; 1∉N¹; absolute φ would have φ⁻¹(Φ_p)=(h) | Agrees; Frobenius twist prevents wrong filtration |
| §3.22 root-adjoined envelope | n=1,2;i=0,1/p,1,2 | max(n−floor(i),0) gives (1,1,0,0),(2,2,1,0); x in N¹ without Φ_p, 1 requires Φ_p | Agrees; input notation and exact source locator repaired |
| §3.23 divided F on graded pieces | unit,p=2,n=1,2 | N¹/N²≃2ℤ/4ℤ; F/2 sends generator to 1 mod 2; N²/N³≃4ℤ/8ℤ; F/4 likewise | Agrees; degree 0 is an isomorphism below positive n |
| §3.24 Frobenius kernel | unit,p=2,a=1 | F₂ evaluates at 1; kernel (q−1)⊂ℤ[q]/(q²−1)≃ℤ; ghost at −1 sends q−1 to −2, not to a unit | Agrees; stated abstract kernel isomorphism does not assert raw ghost is itself onto ℤ |
| §3.25 Nygaard graded fiber | unit,a=1,n=0,1 | n=0 has Ω⁰⊗ℤ[ζ_p]=ℤ[ζ_p]; n=1 has Ω¹=0 and graded piece ℤ/p, the conjugate target | Agrees; no a=0 index p⁻¹ |
| §3.26 animated/smooth agreement | unit and polynomial line | Unit completed Nygaard ghosts pℤ_p,p²ℤ_p; line stupid gr¹ has H¹=Sdx; identity cover preserves these values | Agrees; comparison does not skip animation |
| §3.27 prismatic graded fiber | unit,p=2,a=1 | Filtered reduction of Φ₂^nB by hΦ₂ gives Φ₂^nB/(hΦ₂^nB)≃ℤ₂ in each positive step; step 0 is B/f₂ | Agrees; normalizing identifies transition with 2, not h |
| §3.28 comparison of Nygaard filtrations | same unit | For n≥1 the reduced step Nⁿ identifies with im V₂·2^(n−1), whose ghost at 1 is 2ⁿℤ₂; transition factor 2 on both sides | Agrees; shifted filtered quotient retained |
| §3.19 smooth graded forms | rational split; polynomial line | Split gr⁰=ℚ²,gr¹=0; line gr¹=Sdx[−1] has H¹=Sdx,H⁰=0 | Agrees; no double shift or full-filtration identification |
| §3.29 rational Nygaard | unit near ζ₂; root example | Unit Nⁿ=(q+1)ⁿB; root example after p-inversion gives (x,Φ_p)ⁿ, with x in step 1 and 1 outside | Agrees; source proof input corrected |
| §3.30 multiplicative refinements | unit; two one-forms | Unit 1·1=1; dx∧dy=−dy∧dx; dx²=0 also at p=2 | Agrees; derived-commutative upgrades still conditional |
| §3.31 uncompleted framed Koszul | empty frame; x,x⁻¹ | Empty complex E; D̃x=h; D̃x⁻¹=(q⁻¹−1)x⁻²; multiplying degree 1 by x gives γ−1 | Agrees; no h-division and no Taylor supplier |
| §4.1 pair axioms | unit; ℚ² | Unit Fⁿ=hⁿB,F/β positive=0; split F¹ has H⁰=hℚ[[h]],H¹=ℚ[[h]]/h | Agrees; filtration is not required static |
| §4.1 wrong pullback filtration | unit ℤ | Naive F²=hB versus required h²B; positive filtered quotient nonzero instead of 0 | Wrong model excluded; new Check |
| §4.2 no section | nonrational base; rational base | ℤ has Â₂=ℤ₂≠0; ℚ has all Â_p=0 and rational pairs exist | Agrees; smooth no-section distinct from object obstruction |
| §4.3 exponent-one obstruction | p=2 free δ-generator | Required correction contains hδ(x)/2, whose scalar coefficient 1/2 is not integral; x=0 in quotient but not envelope | Agrees; no freely chosen element substitutes for generator |
| §4.4 modification unit | Fⁿ=hⁿB | Normalize hⁿB≃B: h transitions become id; colimit/completion B, zero transitions give 0 | Agrees; instance replaces defining law |
| §4.4 nonunit modification | rational split; linear polynomial | Split completed H⁰=ℚ²[[h]] rather than ℚ[[h]]; linear differential h gives H¹=B/h versus 0 for differential 1 | Agrees; instance replaces completion restatement |
| §4.5 symmetric monoidality | unit⊗unit; two lines | Unit completed tensor B; two-coordinate qHdg differentials hD_x,hD_y and degree-2 interchange sign −1 | Agrees; pair data carried by tensor |
| §4.6 conjugate filtration | unit; ℤ[x,y]; ℤ[x] | Unit graded only A at 0; plane ranks (1,2,1,0) in cohomological degrees (0,1,2,3); line H¹=ℤ[x]dx rather than ⊕ℤ/n | Agrees; three concrete discriminating Checks |
| §4.7 graded localization | M=A[β,t], βt=h | Invert β, quotient h: A[β±1]; degree 0 A; associated graded in positive conjugate degrees 0 | Agrees; β and t not interchangeable |
| §4.8 coordinate pair | x,x²; rank 0 | x→h dx,x²→h(2+h)x dx; empty frame gives B; at q=1 all modified differentials 0 | Agrees; complete framed operator imported |
| §4.8 Λ-framed comparison | rank-one coordinate | ψ²x=x²; Γx=qx; Lη_h of linear [B —h→B] gives [B —1→B] | Agrees; Λ-compatible frame hypotheses retained |
| §4.9 recursive twisted filtration | unit,p=2,index 2 | F¹=f₂B,F²=f₂²B; positive F/β₂=0; Nygaard instead has nonzero [2]_q | Agrees; wrong filtration distinguished |
| §4.9 rescaling | trivial unit over ℤ[q] | Transition id sends 1→1; rescaled transition sends 1→q+1, a nonunit | Agrees; rescaling remains lax |
| §4.10 rational twisted filtration | unit,a=0,1,p=2 | F¹=hℚ₂[[h]] at 1; F¹=(q+1)ℚ₂[[q+1]] at −1, with quotient ℚ₂ | Agrees; local points distinguished |
| §4.11 lower-point compatibility | p=2,a=1,i=0 | Near q=1 after 2-inversion, Φ₂=h+2 is a unit; both normalized filtrations h-adic; before inversion 2 nonunit | Agrees; integral equivalence not inferred |
| §4.12 global twist | unit ℚ,m=2,6 | m=2 has two factors with ideals hⁿ,(q+1)ⁿ; m=6 has exactly four factors 1,2,3,6 | Agrees; numeric Checks replace general gluing law |
| §4.12 completed polynomial step | ℚ[x],m=1 | Completed F¹=[hS[[h]]→S[[h]]dx] contains h,dx, excludes 1 | Agrees; Check explicitly uses completed model |
| §4.13 filtered deformation | unit,m=1,2,n=1 | cofib(f_m:B→f_mB)=0; step 0 quotient B/f_m, matching the stupid unit filtration | Agrees; degree shift in source retained |
| §4.14 partial modification | unit ℚ,m=2; line m=1 | T₂ has two factors; h-completion kills second since h(−1)=−2; linear T₁ H¹=ℚ[[h]]/h | Agrees; no repeated chain or unmodified qΩ |
| §4.15 two Nygaard denominators | unit,p=2 | Normalize Φ₂ transitions: id, colimit B; normalize hΦ₂: h transitions, colimit B[1/h], (2,h)-completion 0 | Agrees; denominator distinction retained |
| §4.16 partial completion | unit ℚ,m=2,n=1 | h-completion of ℚ[[q−1]]×ℚ[[q+1]] equals ℚ[[h]]; identity divisor retains both factors | Agrees; complete equivalence not raw equality |
| §4.17 Habiro limit | unit; split étale; line | Unit E; split E² with two idempotents; line h-completed H¹=B/h | Agrees; concrete Checks replace generic laws |
| §4.17a framed Habiro comparison | empty frame; x and x⁻¹ | Empty map id_E; x→h dx; x⁻¹ scaling factor q⁻¹, agreeing under toric rescaling | Agrees; comparison has source and target |
| §4.20 q-Witt filtration | unit and line,m=1 | Unit gr⁰=A, positives 0; line gr⁰=S,gr¹=Sdx[−1],gr²=0 | Agrees; increasing direction retained |
| §4.18 strong Habiro tensor | unit; two lines | Unit⊗̂unit=unit; double line gr¹=Sdx⊕Sdy,gr²=Sdx∧dy; interchange sends dx∧dy to −dy∧dx | Agrees; ghost localization remains part of route |
| §4.19 descent factorization | unit and line | h-completion unit B; line x→h dx and H¹=B/h, not qΩ's zero linear H¹ | Agrees; chosen pair still essential |
| §4.22 completion and décalage | unit; linear complex | Unit Lη_hB=B; η_h[B —h→B]=[B —h→hB]≃[B —1→B], H¹=0 | Agrees; original filtration need not complete |
| §4.21 étale coefficient identification | R=A,A²,ℚ(i) | H=E,E²; for ℚ(i), Fʲ has H⁰=hʲℚ[[h]],H¹=(R/ℚ)[[h]]/hʲ, yet modification R[[h]] | Agrees; staticity concerns H, not raw positive steps |
| §4.23 structure transport | unit; polynomial Bockstein | 1·1=1; (d_qHdg x)/h mod h=dx; zero Bockstein would give 0 | Agrees; conditional derived-commutative refinement retained |
| §4.24 cohomology and Bockstein | m=1,x,x²;p=2 | Reduction differential 0; Bockstein x↦dx,x²↦2x dx, latter 0 mod 2 | Agrees; graded cohomology and differential distinguished |
| §4.25 pair scalar extension | A→A²; identity | Each Fⁱ extends to Fⁱ⊕Fⁱ; unit F/β has A² at 0 and 0 above; identity maps 1→1 | Agrees; no forgotten clause datum |
| §4.26 twisted scalar extension | A→A²,p=2 | Φ₂-rescaling diagonal (h+2,h+2); N¹ extends to Φ₂B²; identity comparison id | Agrees under declared transport gaps |
| §4.27 Habiro scalar extension | finite split; flat ℤ→ℚ | lim(T⊕T)=(lim T)²; ℤ[[h]]⊗ℚ misses Σhⁿ/(n+1)! | Agrees; finite projectivity retained |
| §4.28 periodicity | unit, β-degree k; linear coordinate | Degree k is β^kB after completion; invert β gives differential h, invert t gives 1 on the linear summand | Agrees; graded completion not ungraded direct-sum completion |
| §4.28 divisor coherence | unit,6→2→1,6→3→1 | All three maps send 1→1; negating one underlying-module edge sends 1→−1 and fails | Agrees; factorial restriction does not erase divisibility data |
| §4.28 étale and base-change exports | R=A²; finite split base | H=E², positive q-Witt degrees 0; finite split scalar extension doubles each projection | Agrees; conditional item (vi) not made unconditional |
| §5.1 truncation and adjoints | n=0,1; ℤ(1) | τ₀ℤ(1)=ℤ(0) while quotient by the first step gives 0; extension by zero and constant extension have different step 1 values 0,ℤ | Agrees; right/left adjunction directions retained |
| §5.2 canonical construction | unit; line,n=0,1 | Unit bound 0 gives h-adic filtration; line at bound 1 gives F¹=[hS→Sdx]; bound 0 does not satisfy the line's dimension requirement | Agrees; construction versus q-Hodge guarantee distinguished |
| §5.3 dimension guarantee | ℤ,ℤ[x],ℤ[x,y] | Relative dimensions 0,1,2; first two need no prime inverted, third needs 2 | Agrees; no all-primes shortcut |
| §5.4 framed canonical equality | empty frame; line | Empty completed F¹=hB; line F¹ contains h,dx and excludes 1 on both canonical/framed models | Agrees; comparison is the specified map, not any map |
| §5.5 local action | p=2,3 | μ₁ trivial; at p=3 involution q→q⁻¹ sends h→−h/(1+h), not h | Agrees; action normalization retained |
| §5.6 categorical pushout | n=0; target ℤ or ℤ[1/2] | Bound-0 objects étale; no ℤ-algebra map ℤ[1/2]→ℤ since 2 is a unit only in source; identity mapping component remains nonempty | Agrees conditionally; generic fully faithful pushout remains a supplier gap |
| §5.7 compatible bounds | unit, bounds 0,1; line bounds 1,2 over ℤ[1/2] | Unit F¹=hB at either bound; line F¹=[hS→Sdx] at either bound; maps send 1→1 | Agrees; no choice of bound affects result |
| §5.8 smooth section domain | ℤ,ℤ[x],ℤ[x,y],ℤ[1/2][x,y] | Required prime sets ∅,∅,{2},{2}; first,second,fourth qualify; third fails | Agrees; obstruction not claimed to prove optimality of bound |
| §5.8a local ranks | S=ℤ×ℤ[1/2][x,y] | Ranks 0,2; 2 nonunit globally but invertible on rank 2 factor; first H factor L_H(ℤ[q]) | Agrees; local condition not global maximum condition |
| §5.8a animated pullback | S=ℚ² | qdR H⁰=ℚ[[h]]; qΩ H⁰=ℚ²[[h]]; Fʲ H⁰=hʲℚ[[h]],H¹=ℚ[[h]]/hʲ | Agrees; product of animated pairs is wrong model |
| §5.9 admissible simplices | ℤ-line; twice and thrice multiplication | d=1,r=2 needs 2 invertible; r=3 needs 2,3; ℤ[1/2] qualifies for two but fails three | Agrees; subset not called an ∞-operad |
| §5.9 noncomposition control | (ℤ[x],ℤ[x])→(ℤ,ℤ)→ℤ | Intermediate tensor dimension 0, composite input tensor dimension 2 needing 2; two admissible edges can have inadmissible composite | Agrees; dual variant explicitly conditional |
| §5.10 truncated monoidality | n=1, unit and line | Unit truncated F⁰=B,F¹=hB,F²=0; line modulo h forms in degrees 0,1 only; tensor unit preserves 1 | Agrees; truncation before extension retained |
| §5.11 dual strong case | identity on ℤ-modules | Unit 1→1, binary a⊗b→a⊗b; both invertible | Agrees conditionally on dual-fibration supplier |
| §5.11 oplax nonstrong case | F(M)=M⊗(ℤe₀⊕ℤe₁) | Unit (1,1)→2 by counit; binary ranks 2→4, hence noninvertible | Agrees; F(1)→1, not reversed lax unit |
| §5.11 composition/unit coherence | Δe_i=e_i⊗e_i | Both ternary maps e_i→e_i⊗e_i⊗e_i; wrong Δe₀=e₀⊗e₁ gives (ε⊗id)Δe₀=e₁≠e₀ | Agrees; arbitrary span maps excluded |
| §5.12 partial multiplication | d=0,1;r=2,3 | Étale d=0 needs no prime; d=1 gives cutoffs 2,3; over ℚ all finite cutoffs invertible | Agrees; partial structure remains conditional on oplax gap |
| §5.13 scheme cohomology | affine line; disjoint mixed-rank scheme | Line h-completed differential x→h dx; mixed rank retains L_H(ℤ[q]) as first factor | Agrees; every sheaf input uses local admissibility |
| §5.13 relative base | A=ℤ[t],ψ^m(t)=t^m,S=A[x] | x→h dx; coefficient t has dt=0; treating t as another coordinate adds a wrong form | Agrees; relative rather than absolute cohomology |
| §5.14 proper perfectness target | Spec ℤ; Spec(ℤ×ℤ); zero object | Coefficient modules E,E²,0 have ranks 1,2,0, respectively, over E; the first two schemes are proper smooth of relative dimension 0 | Agrees on these cases; general perfectness remains a target |
| §5.15 quasi-lci | identity, polynomial, regular quotient | L=0,Rdx[0],R[1], respectively; polynomial is not concentrated in homological degree 1 | Agrees; explicit three-way test |
| §5.15 relative semiperfectness | identity, étale, nonzero polynomial mod p | Relative Frobenius iso, iso, and not onto x, respectively | Agrees; concentration of L alone not substituted |
| §5.15 perfect-regular presentation | B=A,J=∅,(x²),(0) | Positive Koszul homology 0,0,B for a nonzero B and regular x | Agrees; zero generator excluded |
| §5.15 perfectly covered δ-base | ℤ_p; perfect base; polynomial φx=x^p | φ=id or iso in first two; mod-p polynomial Frobenius free of rank p, with ranks 2 and 3 at the first primes | Agrees; perfect coverage need not be perfectness |
| §5.15 condition (R) | étale; torsion-free higher-power quotient; 𝔽_p | Cotangent 0,R[1],𝔽_p[1]; last has p·1=0 and fails torsion-freeness | Agrees; torsion predicate not omitted |
| §5.15 free δ versus ordinary polynomial | x→0,1,p in ℤ_p | δ0=δ1=0; δ(p)=1−p^(p−1), giving −1 at 2 and −8 at 3; polynomial δx=0 cannot realize x→p | Agrees; universal property distinguishes free object |
| §5.16 staticity | unit; free-base quotient A/x² | Unit dR=ℤ_p; quotient ordinary envelope has x² nonzero as a divided-power generator although its image in R is 0; Ω¹_(R/A)=0 | Agrees; concentration in degree 1 retained |
| §5.17 static preimage | A=R=ℤ_p | C¹=hℚ_p[[h]], ordinary preimage hℤ_p[[h]]; derived pullback has H¹=ℚ_p/ℤ_p, class 1/p≠0 | Agrees; static construction not derived pullback |
| §5.18 filtered injection | unit,n=1,2 | Fⁿ∩hB=hⁿB=hF^(n−1); Fⁿ/hF^(n−1)=0 for n>0 | Agrees; equality tests both inclusions in this model |
| §5.19 higher-power theorem | p=2,α=2 versus α=1 | α=2 lift Γ₁²/(q+1) reduces x⁴/2; exponent-one obstruction still requires nonintegral hδ(x)/2 | Agrees; no evenness restriction at p=2 |
| §5.20 obstruction | p=2,α=1; δ(x) independent | Correction coefficient h/2 is not in ℤ₂[[h]]; p-inverted value exists but integral lift does not | Agrees; generator identified in envelope |
| §5.21 flat δ-base change | identity; finite split base | Ordinary ideals hⁿB extend to hⁿB², with two identity projections; no positive H¹ appears in static extension | Agrees; target restricted to constructed naive filtration |
| §5.22 global quasi-regular gluing | étale unit; exponent-one free quotient | Unit Fⁿ=hⁿB satisfies quotient axiom; exponent-one example has missing x^p/p lift | Agrees; condition (R) alone does not define the smaller q-Hodge class |
| §5.23 quasi-regular tensors | flat unit; ℤ/p⊗ᴸℤ/p negative control | Unit⊗unit=unit; torsion example has H⁻¹=ℤ/p and is not static/torsion-free | Agrees; tensor closure hypotheses retained |
| §5.24 uniqueness direction | unit pair; normalized smooth line | Canonical unit map 1→1; smooth line normalized dx→dx, rescaling by −1 sends dx→−dx and fails normalization | Agrees; initial and terminal directions distinct |
| §5.25 étale arithmetic export | unit,ℤ²; discriminant-inverted quadratic field | H=E,E²; quadratic étale model has rank 2 and two conjugate cyclotomic pieces, not a K₃ class | Agrees; number-field ordinary identification stays downstream |
| §5.26 powerful predicate | m=1,4,12 | Valuation conditions vacuous,true,false respectively; v₂(4)=2, v₃(12)=1 | Agrees; powerful distinct from high-powered |
| §5.26 higher-power lift | p=2,n=1 | −h+(q+1)=2; wrong plus sign gives 2q; Γ₁=x²−hδ(x); Γ₁^α/(q+1) mod h=x^(2α)/2 | Agrees; sign agrees with §§1.2,7.2,8.2 |
| §5.26 local torsion | p=2,α=2 | In ℤ₂⟨y⟩/(y−4), 2(y^[2]−8)=y²−16=0; class nonzero since formal preimage needs coefficient 1/2 | Agrees; no p-torsion-free local claim |
| §5.26 rational corner at m=1 | ℤ/1=0 | qdR_(0/ℤ)=ℚ[[h]], constant filtration; completed filtration and qHdg both 0 | Agrees; empty local product not used for raw qdR |
| §5.26 rational overlap | z=y−p^α,α≥2 | Coordinate p^r has coefficient p^floor(r/2); after multiplying by p^k, valuation k+floor(r/2)<r for large r, so no multiple of z kills the class | Agrees; C_p not replaced by ℚ_p |
| §5.26 divisibility functor | powerful m=4,16 | Quotient x⁴→x² at p=2 induces ℤ/16→ℤ/4; 1→1 and filtration ideals map into corresponding ideals | Agrees; contravariant direction retained |
| §6.1 analytic problem domain | ℤ-plane; ℤ[1/2]-plane | d=2 needs 2 invertible: first outside, second inside algebraic domain; analytic localization unspecified | No analytic theorem asserted; no substitute Lean statement |
| §6.2 multiplication bounds | line and square | Line dimension 1 admitted; square dimension 2 needs 2; analytic root specialization is not identified with qW₂ | Agrees; analytic statements remain a problem specification |
| §6.3 solid coefficients | ℚ rationalization of ∏ℤ | Sequence (1/(n+1)!) has no common denominator, hence outside (∏ℤ)⊗ℚ | Agrees; continuity and lower-bound hypotheses not erased |
| §7.1 cohomology/reduction distinction | framed ℤ[x],M=qHdg | H⁰(M)/h=ℤ; H⁰(M/^Lh)=ℤ[x]; x is supplied by h-torsion in H¹(M) | Agrees; derived reduction cannot be moved outside cohomology |
| §7.2 polynomial operators and native milestones | q=0,1,2; char 2; n=0 | D₀x³=x²; D₁x=1; hD₁x=0; hD₂x²=3x; constant derivative 0; D₁x²=0 mod 2 | Agrees; imported calculus and prose Checks only |
| §8.1 atlas ideal data | unit,p=2 | B/(h)=ℤ₂, B/(h+2)=ℤ₂ with distinct parameter maps h→0,−2; coefficient comparison sends 1→1 | Agrees; maps and ideals both tested |
| §8.1 atlas operations | linear pair; ℚ,ℤ | Linear H¹=B/h before η,0 after η; ℚ^∧_p[1/p]=0 versus ℤ^∧_p[1/p]=ℚ_p | Agrees; three actual instances replace record-field restatements |
| §8.2 cyclotomic decomposition | p=2,3 | Φ₂=2+h with u=1; Φ₃=3q+h² with u=q; u(1)=1 in both | Agrees; prime binder retained |
| §8.2 primitive system | trivial ε versus primitive ε | Trivial ε gives q=1,h=0,ξ=p,θξ=p≠0; primitive ε gives θq=1 and θξ=0 | Agrees; no arbitrary compatible system allowed |
| §8.2 sign, excluded indices | q=2; p=0,1 | −h+Φ₂=2; h+Φ₂=4 at q=2; p=0,1 fail primality | Agrees; Sch rational citation removed here |
| §8.3 comparison domains | unit,rational object,unframed smooth | Unit h-complete B; p-completed rational object 0; unframed smooth still has qΩ | Agrees; operations do not enlarge source domains |
| §8.4 local prismatic square | unit and line,p=2 | Unit B; line x² differential has [2]_q=h+2 factor; global qΩ p-completion has same local object | Agrees; local prism owner corrected |
| §8.5 framed q-crystalline square | δ(T)=0,linear coordinate | (γ−1)T=hT, so divided operator on T=1; rational Koszul factor mod h=1 | Agrees; denominator hT justified by framing/regularity |
| §8.6 perfectoid square | coefficient unit; rational object | Unit completed tensor A_inf; θq=1; perfectoid change kills ℚ via initial p-completion | Agrees; primitive AΩ/prismatic and uniqueness owners separated |
| §8.7 h-décalage square | [B —h→B] | η gives [B —h→hB]≃[B —1→B]; H¹ changes B/h→0 | Agrees; no exactness assertion about η |
| §8.8 prism-ideal décalage | unit,p=2,3 | Relative unit source and η_(Φ_p)B both B; N¹=Φ_pB with Φ₂(1)=2,Φ₃(1)=3 | Agrees; relative twist and ideal retained |
| §8.9 filtration obstruction | unit,m=p | Trivial F¹=0 versus relative N¹=Φ_pB≠0 before rational comparison | Agrees; failure concerns that canonical gluing proposal |
| §8.10 Nygaard comparison | unit,p=2,a=1,n=1 | Reduced prismatic step Φ₂B/hΦ₂B≃ℤ₂; q-Witt N¹ ghosts (2ℤ₂,0), isomorphic via [2]_qa↦a | Agrees; static realization not arbitrary preimage |
| §8.11 ordinary/q-Witt/crystalline scope | a=0,1; unit,p=2 | Index 1 identity; F₂V₂1=2; qW target lacks ordinary R₂ killing V₂1 | Agrees; comparison remains a map, relative factorization conditional |
| §8.12 torsion exact sequence | ℤ[x],qΩ,i=0 | H⁰(qΩ)/h=ℤ; H⁰_dR=ℤ; H¹(qΩ)[h]=0 here. For qHdg instead H⁰(reduction)=ℤ[x] | Agrees; qΩ and qHdg reductions not conflated |
| §8.13 conjunction of squares | coefficient unit,linear summand | Every unit composite 1→1; η linear differential becomes 1 on both routes | Agrees; existence of β does not prove θ/Witt equalities |
| §8.14 information loss | ℚ and qHdg linear h-torsion | p-change sends ℚ→0; η sends linear H¹=B/h→0 | Agrees; neither operation conservative in that range |
| §8.15 independent relative Nygaard | unit,p=2 | Relative φ_rel=id yields N¹=(h+2), whereas absolute φ-preimage gives (h) | Agrees; independent filtration is an input to comparison |
| §8.16 eight-square examples | unit,p=2,3 | qW_p unit rank p over ℤ_p; N¹,N² ghosts pℤ_p,p²ℤ_p; coefficient specializations 1→1 | Agrees; operation records retained in examples |
| §8.17 coefficient interface | p=2,3 and Teichmüller unit | Φ₂=2+h,Φ₃=3q+h²; θ([ε])=1 | Agrees; coefficient identities alone do not assert canonical-map equality |
| §8.18 θ map equality target | unit; dlog T; T→T²,T³ | Both proposed routes: 1→1,dlog T→dlog T,d(dlog T)→0; pullbacks multiply by 2 and 3 | Target retained; Checks now give explicit map values |
| §8.19 Witt map equality target | same torus;p=2,3 | Both proposed routes send dlog T to its crystalline class; crystalline Frobenius coefficients 2,3, ordinary Witt F coefficient 1 | Target retained; Frobenius conventions separated explicitly |
| Downstream direction | two-node CP/Habiro graph | Before: CP→Habiro→CP; after: CP→Habiro with no edge back, hence zero directed two-cycles | Reverse consumer assertion deleted |

The table covers all 144 numbered subsections, with separate rows for the distinct convention-sensitive or newly changed clauses. Every revised API bullet was reread with its inherited subsection hypotheses. The definition audit's combined predicates in §5.15 were tested separately. Outside the tabulated domains, S₃ and Q₈ cannot replace the free abelian coordinate lattice; inseparable field maps cannot replace the étale coefficient input; square-zero/nonreduced input is allowed only in the stated animated or quasi-regular domain. Empty frame/rank zero, zero algebra, f₀, unit ideals, primes 2 and 3, characteristic 2, identity maps, nonflat base change, and the two possible values of the relation iff are explicitly represented above. These computations do not certify supplier implementation.

## Elaborated signatures and required checks

The pins read from the supplied content manifest are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. No TauCeti module is imported by the acceptance file, so no missing-object build was required.

The required `lake env lean` command was run from the pinned content repository on the absolute path supplied for packages/HabiroCohomologyFoundations/Suggested.lean. Exit status: **0**. Exactly three diagnostics, all expected `declaration uses sorry` warnings, at lines 65, 76 and 91. No errors or other warnings. The file has one `import Mathlib`, one real-bodied definition, three admitted theorems, zero examples, zero sorry'd data and zero set_option commands.

A second, single scratch elaboration contained the same acceptance file followed by `#check @name` for **every one of its four declarations**. Exit status: **0**, with the same three expected warnings and all four signatures printed. They were compared with README §§1.23 and 8.2:

| Declaration | Elaborated binders and conclusion | README agreement |
| --- | --- | --- |
| torusScaleHom | {B : Type u}, [CommRing B], {d : ℕ}, q : Bˣ, a : Fin d→ℤ; B[ℤ^d]→ₐ[B]B[ℤ^d] | All rings, units and dimensions retained; no section binder lost |
| torusScaleHom_action | Same B, ring, d and unit q; σ₀=id and ∀a b, σ_(a+b)=σ_a.comp σ_b | Same arbitrary commutative ring and lattice action |
| torusScale_exists_unique | Same B, ring, d, unit q and a; ∃! B-algebra equivalence with every monomial coefficient q^(Σa_i m_i) | Exactly the unit-valued Laurent characterization |
| cyclotomic_prime_decomposition | ∀p:ℕ, [Fact p.Prime], ∃u:ℤ[X], Φ_p=C(p)u+(X−1)^(p−1) and u(1)=1 | Primality is explicit; polynomial identity is integral |

No retained signature changed mathematically. The eight deleted declarations were removed together with their README identifiers; their mathematical formulas remain in the stated imported calculus or README-only targets. All retained own names occur in the README.

The required dependency command was run with the specified configuration, order file, roadmap name and `--movable`. Exit status: **0**. Its full output was:

```text
depcheck: 23 roadmaps, 198 edges, 0 problem(s)
```

There were no UPWARD, CYCLE or moved lines. The prose-only reverse edge was also removed manually, because a graph scanner does not establish the truth of downstream prose.

The citation resolver was run after the edits against main and the indexed open heads. It reports no unresolved cross-roadmap citations and no unresolved Lean names. Its notice says it did not check external Lean names against pins; those were inspected separately as recorded above. JSON/TOML parsing, README/plan gap-slug and supplier agreement, all-four-name agreement, scope of plan edits and `git diff --check` all passed (exit 0); git diff --check produced no output. No gate failures were listed in the brief; there were no gate-specific repairs to add.

## Consequences for maintainers

The package remains conditional on eight declared supplier gaps. The new oplax gap needs an EnhancedDerivedSheaves extension; the finite-projective Nygaard gap's base owner is now PrismaticCohomologyPartII. The shared cyclotomic slug keeps only a residual completion need here; another roadmap's broader shared-gap text is outside this package's edit scope. No supplier's target was invented, no merge order was edited and no supplier implementation is claimed.

Consumers should cite stable subsection locators for the mathematical APIs, especially §§0.3, 1.14, 3.31, 4.17a, 4.21, 4.28 and 5.26. The deleted actual Lean names are qDiff, jackson_calculus, uniformDenominator, uniformDenominator_pos, coefficientRelation, coefficientRelation_eval, qHodgeDiff and qHodge_polynomial. Future undeclared API spellings have become prose descriptions, including the previous HabiroHodge.etaleModel label; its mathematical characterization remains §4.21. The four retained Lean names are unchanged. A fresh independent review is still required; this report is not an acceptance decision. Nothing was committed or pushed.
