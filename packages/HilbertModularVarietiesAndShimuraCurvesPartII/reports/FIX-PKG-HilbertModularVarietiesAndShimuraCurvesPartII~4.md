# Repair report: HilbertModularVarietiesAndShimuraCurvesPartII

## F01 (P1) — applied

§4.4’s integral quotient and patched equality → a quotient onto τ′°/pτ′°, with M∞(W₂) ≅ M∞(τ′°)/p. Normalize the homothetic lattice before forming W₁,W₂ and label the injection ×p. Keep the integral existence assertion; distinguish both reductions at Lemma 8.3.5. Added torsion and lattice-chain controls (BHHMS23 lines 4855–4873, 4901–4920, 4973–4982).

## F02 (P2) — applied

Unspecified away types in §1.1 → non-scalar types isolating the chosen σ_w, selected before R^loc. The smoothness statement and route explicitly use isolation and gap:single-type-rings; Needs includes §0.2 and both relevant gaps. §1.4 reuses those choices. Added the two-weight nodal negative control (EGS15 lines 687–688, 2197–2226; BHHMS23 lines 4406–4438).

## F03 (P2) — applied

Residual support alone in §3.3 → exact central character ψ⁻¹ on O_Fv× for every σ_i and lattice. Added §1.4 to Needs, the det²⁸ counterexample, and the scalar-action witness for downstream adjoint factors. §1.4 explains the away lattices’ Teichmüller characters (BHHMS23 lines 4410–4421, 4662–4708).

## F04 (P3) — applied

§4.1’s nonexistent raw gluing → an existing pullback whose surjection onto R₂,j retains three distinct simple cosocle quotients. Projection from the displayed decomposition supplies the map to P. The corrected Check asserts a quotient of the raw cosocle, without claiming to compute its entirety (BHHMS23 lines 4797–4813; ModpRepresentationsOfGL2OverLocalFields MP.8/projective-lattice).

## Scope, sources and ownership

Only `packages/HilbertModularVarietiesAndShimuraCurvesPartII/README.md` and this report change. No headline, Lean declaration, supplier name, design gap, merge placement or source key changes. The boundary controls stay in the README; they are not acceptance-file padding.

All four claims are mathematically correct. The extraction of Proposition 8.3.3 loses reduction bars: the quotient in BHHMS23 line 4872 must be a reduction, since p annihilates its source and an integral lattice is p-torsion free. The surrounding constituent calculation at BHHMS23 lines 4901–4912 and the explicit reduced inputs of Lemma 8.3.5 at BHHMS23 lines 4978–4982 independently determine the correction. This report does not claim a new visual inspection of the PDF.

The legal cached versions of BHHMS23 and EGS15 were reopened at the locators above. All newly used locators fall inside their existing certified manifest entries. No additional source or missing-reference request is needed. The edited §3.3 explanation cites BHHMS23 Remark 8.2.5 directly, without retaining its secondary references as independently inspected sources.

Object searches used the roadmap service on main and the indexed open heads, and `rg` on board packages, for weight isolation, Barsotti–Tate rings, coefficient patching functors, locally algebraic support, and projective-cover lattices. The supplier copies were retrieved with `roadmaps show`; the three design-only suppliers were read at `packages/ModpRepresentationsOfGL2OverLocalFields/design/README.md`, `packages/LocalGaloisDeformationRingsPartII/design/README.md` and `packages/PotentialAutomorphyInfrastructurePartII/design/README.md`. Existing main roadmaps were checked on main; new roadmap folders were checked at their indexed heads. The service’s citation resolution used main 7922565 and the 2026-10-25T16:15:41Z open-head index and found no unresolved cross-roadmap citation or own Lean name. The service did not check external library names; those were inspected separately at the pins.

No ownership moves are needed. LocalGaloisDeformationRingsPartII T.0, T.6–T.7 and the existing gaps own correspondence/lattice and local-ring inputs; §0.2 here owns comparison with the general BDJ weight set and its isolating-type consequence. ModpRepresentationsOfGL2OverLocalFields MP.5/projective-adjoint and MP.8/projective-lattice, lattice-coinvariants own the local projective decomposition and endpoint. This package applies them to its existing global coefficient functor and intermediate lattices. The existing top-level gaps already request precisely the needed tame correspondence and one-weight smooth ring; no supplier is represented as stating an undeclared result. No new construction is duplicated in a sibling roadmap.

The package’s cross-roadmap section references were checked against these copies, including the local tangent/determinant and crystalline-quotient sections, global Taylor–Wiles sections, patching extraction/augmentation sections, smooth central-character category, completed-cohomology dualities, and local projective-lattice targets. The main-branch shape examples read were `TauCetiRoadmap/ComplexTori/README.md` and `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md`; no layer reorganization was needed.

At the manifest pins (Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a; Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039), the native equal locus is the submodule of equal values (Mathlib/Algebra/Module/Submodule/EqLocus.lean:45), with its kernel-of-difference identity at line 102. It imposes neither surjectivity nor a cosocle condition. `IsLocalRing` includes nontriviality (Mathlib/RingTheory/LocalRing/Defs.lean:30); `Representation` is algebraic (Mathlib/RepresentationTheory/Basic.lean:48); `Module.Free` does not impose finite rank (Mathlib/LinearAlgebra/FreeModule/Basic.lean:43); `Module.FaithfullyFlat` extends flatness (Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean:63). The native completed group algebra is the compatible inverse-limit subalgebra (TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145), without an analytic dimension or patching-functor structure. Searches at those pins do not supply the missing quaternionic cohomology and coefficient-patching carriers listed in Suggested.lean. No numerical or free-predicate replacement has been introduced.

## Pattern and consumer audit

- F01: searched all W₁, W₂, τ′°, lattice-reduction and patched-reduction occurrences. Repaired the entire §4.4 route, including homothety normalization and the Lemma 8.3.5 application. §4.1 already distinguishes T′₂,j/pT₂,j from T′₂,j/pT′₂,j. §§4.6 and 4.8 use respectively that lattice sequence and the reduced patched comparison; §4.8’s annihilator identity Ann M∞(Y_j)=(p)+Ann M∞(T′₂,j) now has the explicit reduction comparison behind it. §4.9 already reduces the integral endpoint before its fibre comparison.
- F02: searched every τ_w, formal-smoothness and power-series assertion. §1.1’s statement, explanation, route and Needs now carry the selection. §1.4 reuses it; §1.5’s single-weight fibre and §1.6’s compatible big module use the same coefficients. The dimension counts, empty away tensor and inert-prime specialization remain unchanged.
- F03: searched central characters, all locally algebraic inputs and applications of §3.3. The fixed-character domain in §§1.4–1.6 is retained. The finite-group types in §§3.2–3.4 have their Teichmüller central character; tensoring by V(α_j) in §§4.1–4.5 does not change it. Their direct sums and pullback lattices in §4.8 stay in that category. No implicit determinant-character correction from §0.3 is substituted for membership in §1.4.
- F04: searched raw/preimage lattice gluings and every use of the decomposition. Only the false Check denied existence. All definitions use R′₂,j with the prescribed embedding, and the subsequent single-cosocle arguments remain on that lattice.

## Adversarial mathematics pass

These are direct computations and hypothesis-boundary tests, not proofs of the arithmetic headline theorems. Here k is the residue field, O a DVR, and arithmetic rows retain the actual generic datum and patching functor. Algebra models test their stated identities; they do not claim to be arithmetic realizations. Separate rows cover every numbered target subsection and the extra assertions changed by the repairs.

| Statement | Instances tried | Values computed on the two sides or for the excluded model | Result and change |
|---|---|---|---|
| Geometric Hecke convention and parent adapter | k=𝔽₂₉, q=5, roots 2,3 | S=25, T=9; S⁻¹T=5=2+3; qS⁻¹=6=2·3. Inverse roots are 15,10. Parent roots 17,21 return 5/17=2, 5/21=3. | Directions agree; retained. |
| Central twisting and adjoint normalization | χ(z)=2; weights (2,−1) | χ⁻²=22, χ²=4; scalar on Sym²det⁻¹ is 1. ε sends (2,−1) to (3,0), sums 1→3. | Signs distinguished; retained. |
| Integral/Pontryagin dual and two-term sign | O/p; O --p→ O | Hom(O/p,O)=0; Hom(O/p,E/O)=k. Dual differential −p has the same cokernel k as p. | Reductions and duals distinct. |
| Nonabelian side convention | u=((1,1),(0,1)), v=((1,0),(1,1)) over 𝔽₂₉ | uv=((2,1),(1,1)), vu=((1,1),(1,2)); (uv)⁻¹=v⁻¹u⁻¹. | Inversion is an anti-map; retained. |
| Scheme-theoretic support | A=k[ε]/ε²; M=A,k,0 | Ann(A)=0; Ann(k)=(ε); Ann(0)=A. ε·1 is ε in A and 0 in k, despite identical prime supports. | Nilpotents and zero retained. |
| Generic datum §0.1 | p=23,29; f=1,0 | At 23 upper bound 8<12; at 29 reducible exponents 12,13,14 and irreducible 13,14,15. Degree 0 cannot occur. | Small-prime/empty-box boundaries retained. |
| Quaternionic parity §0.1 | F=ℚ definite; cubic F indefinite | Real ramification counts 1 and 2 require respectively odd and even finite ramification counts. | No split rational curve or impossible definite datum introduced. |
| BDJ recipes §0.2 | p=5, s=1; f=2 | Reducible weights have dimensions 2,2; irreducible weights 2,4; generic f=2 gives 2²=4 weights. | Embedding/subset counts agree. |
| BDJ extension classes §0.2 | Split ω⊕1 versus très ramifiée extension, p=5 | Split weights have dimensions 1,5,3; très ramifiée case retains only dimension 5. Cardinalities 3→1. | Semisimplification cannot replace the extension class. |
| Weight/type comparison §0.2 | Semisimple ω¹³⊕1, p=29; nonsplit singleton | Weights Sym¹² and det¹³Sym¹⁴ have dimensions 13,15; τ₀ has 28. Isolating intersections have size 1, all-weight intersection size 2; a singleton intersected again remains size 1. | Isolation applies also away from v without semisimplicity. |
| Crystalline dual adapter §0.2 | ρ=ω⊕1, ω(g)=2, p=29 | BDJ trivial weight is present, but raw GK determinant for trivial Hodge type is 2⁻¹=15≠2. The dual lift ε⁻¹⊕1 has determinant 15. | Dual input retained. |
| Quaternionic coefficient spaces §0.3 | Scalars χ(z)=2 and two-term dual | Central determinant correction changes character by 22 rather than 4; torsion integral dual 0 versus Pontryagin dual k. | Same covariant multiplicity convention retained. |
| Finite-level projectivity §0.4 | C₂ and S₃ over 𝔽₂₉; C₂₉ regular module | Trivial projective dimensions 1 versus regular dimensions 2,6; C₂₉ regular dimension 29 and invariant dimension 1. | Projectivity does not mean freeness for arbitrary finite groups. |
| Weighted infinite-level representation §0.5 | r=2; inertia ω¹⁵⊕1 or ω¹³⊕1 | Dual inertia exponents 13 or 15 give respectively {Sym¹²,det¹³Sym¹⁴} or {det¹⁵Sym¹²,Sym¹⁴}; each socle multiplicity is 2. Wrong away weight gives 0. | Existing weight examples agree with §1.1’s choices. |
| Quaternionic weight theorem §0.6 | Two local multiplicities (1,1) and (1,0) | Multiplicity products 1 and 0, giving nonzero and zero weight spaces respectively. At p=5, 5>2 but the A₅ exclusion remains separate. | Both directions and image exception retained. |
| Auxiliary doubling §0.7 | q=2, α/β=3 or 2 in 𝔽₂₉ | (2−3)(2−3⁻¹)=8≠0; for ratio 2 it is 0. Two old copies have twice the dimension. | Unit boundary retained. |
| Patched-ring counts §1.1 | (f,|S|,q)=(1,2,1),(2,1,2),(2,3,4) | R∞ variable counts 10,9,19; S∞ counts 8,5,15; Krull-dimension differences 2,4,4=2f. | Recomputed with isolated away types. |
| Away smoothness §1.1 | Degree one, p=29, two-weight versus isolated type | Two-weight special fibre k⟦x,y,z₁,z₂,z₃⟧/(xy): dimension 4, cotangent dimension 5. Isolated fibre k⟦t₁,…,t₄⟧: 4 and 4. | F02: selection now a hypothesis before R^loc. |
| Empty away tensor §1.1 | S_p={v}, q=f | Tensor unit O; extra local variable count q−f=0. For f=2, |S|=1 the total counts remain 9 and 5. | No fictitious away factor added. |
| Type quotients §1.2 | λ=(1,0),(2,−1),(2,0) | Determinant sums 1,1,2; the first two are compatible, the last fixed-determinant quotient is 0. ε-twisted sums are 3. | Determinant normalization retained. |
| Abstract patching functor §1.3 | Zero functor; A²; A⊕A/(t), A=O⟦t⟧ | Zero rank 0; A² rank 2; depth of A⊕A/(t) is 1<dim A=2. A/(p)⊕A has nonzero p-killed vector. | Axioms neither force rank 1 nor allow torsion lattice values. |
| Arithmetic functor §1.4 | One versus two surviving away weights; σ=0 | Residual dimensions r versus r₁+r₂; for r₁=r₂=1 these are 1 and 2. M∞(0)=0. | F02: same selected types used in rings and functor. |
| Away integral character §1.4 | Finite tame central character at scalar 30, f=1,p=29 | Residue of 30 is 1, so its Teichmüller character value is [1]=1=ψ⁻¹(30). | Exact domain character explained. |
| Residual fibre §1.5 | Modular/nonmodular weight, r=2 | Hom dimensions 2 and 0; corresponding finite residual fibres k² and 0. | Singleton away selection gives the stated weighted π. |
| Big patched module §1.6 | f=1,2; r=2 weight fibre | dim(K₁/Z₁)=3,6; residual canonical dimensions 1,2; Hom fibre dimension 2. Integral dual of k is 0, Pontryagin dual is k. | No finite R∞-module or wrong dual substituted. |
| Iwasawa CM §2.1 | Λ=O⟦T⟧; Λ,Λ/(T),Λ/p,Λ⊕Λ/p,0 | (grade,depth,δ)=(0,2,2),(1,1,1),(1,1,1); direct sum has Ext in degrees 0,1. Zero grade ∞, dimension −∞. | CM and zero conventions retained. |
| Support-freeness criterion §2.2 | A=𝔽₂[ε]/ε², M=A,N=(ε); split k² | Ann(M/N)=(ε), Ann(M)=0, (ε)≅k and one generator; split k² needs 2 and has annihilator quotient 0. | Generation/annihilator hypotheses discriminate. |
| Support-rank definition §2.2 | A/I≠0; M=(A/I)²; M=0 | Ann(M)=I and rank 2; zero support is A/A=0 and 0ʳ=0 for every r. | Rank recovery restricted to nonzero support. |
| Fibre-product freeness §2.3 | Node branches over k; A=k⟦t⟧ with both maps A→k | First pullback A, Ann=0, sum=(x,y). Second pullback A⊕tA≅A², while annihilator sum 0≠(t). | Same-rank criterion distinguishes the two. |
| Fibre-product maps §2.3 | Identity maps; two zero maps k→k | Identity pullback diagonal dimension 1; zero-map pullback dimension 2. Both coordinate images are k, but equality criterion is different. | Actual compatibility equations retained. |
| Central variables §2.4 | A=O⟦T,x⟧, M=A/(x) or A; Ω=k⟦T⟧ | For M=A/(x): grades 1,0 and dimensions 2,2 over A,A/(x). For A: grade 0, dimension 3→2. Length Ω/(Tⁿ)=n, log_n n=1 for n≥2. | Grade and dimension shifts agree. |
| Ramified and p=2 coefficients §2.4 | O=ℤ₃[π]/(π²−3); O=ℤ₂,K=1 | O/(π)=𝔽₃; O/(3)=𝔽₃[π]/π². Integral/residual grades of 𝔽₂ are 1,0. | Uniformizer reduction preserved at ramified and small primes. |
| CM transfer §2.5 | A=O⟦T⟧, B=A⟦y⟧; M=B,B/(y) | Depths for B are 2<3; for B/(y)=A they are 2=2 and dimensions 2=2. | Finiteness over A needed for equal dimensions. |
| Miracle flatness §2.6 | A=O⟦T,x⟧; M=A/(T),A/(ϖ) | Grade pairs 1=1 and 1≠0. First module O⟦x⟧ is coefficient-flat; second has ϖ·1=0 with 1≠0. | Both directions discriminate flatness. |
| Finite-length patched CM §3.1 | A=k⟦x,y⟧, module A/(x); zero input | Depth/support dimension 1=1; ambient dimension 2. Zero input gives zero value. | Scheme support, not ambient dimension, retained. |
| Weight/type common rank §3.2 | Nodal type, r=1,2 | Branch ranks (1,1) and (2,2); special fibre xy=0 has two components although integral xy=p ring is a domain. | No rank-one or away formal-smoothness inference. |
| Component-union ideals §3.2 | Singleton, both branches, empty | Ideals (x), (x)∩(y)=0, A; quotient supports k⟦y⟧, A,0. Sum (x,y) gives only k. | Empty union and sum/intersection directions retained. |
| Cyclic interval quotient §3.2 | Two-branch interval; singleton interval | Ann(x)=(y), so (x)≅A/(y); singleton puncture gives unit ideal and quotient A/I_singleton. | Correct endpoint annihilator. |
| Common-cap sum and flat transport §3.2 | Two-variable node product; noninterval replacement | Valid sum (x₁)+(x₂)=(x₁,x₂); invalid replacement gives (x₁,x₂y₁). At x₁=y₁=y₂=0, x₂ survives only in the latter quotient. Adjoining t keeps Ann(x)=(y). | Interval and flatness hypotheses retained. |
| Locally algebraic support §3.3 | Two disjoint types, multiplicities 1,2; common r=2 | Generic factor ranks 2,4; reduced product support has no nilpotent. Rank need not be constant across components. | Exact central-character restriction added without changing support conclusion. |
| Integral central-character boundary §3.3 | Permitted tame type versus det²⁸ twist, f=1,p=29 | All residual determinant values satisfy a²⁸=1 in 𝔽₂₉×. Scalar 30 contributes 30⁵⁶=784 mod 841 instead of 1. | F03: unchanged residual support does not imply domain membership. |
| Adjoint central character §3.3 and §§4.1–4.5 | Trivial algebraic factor and V(α_j), scalar z | Contributions 1 and σ_j(z)²σ_j(z)⁻²=1. For z=30 modulo 841, 30²=59 and 59⁻¹=784, product 1. | All existing downstream types preserve the required character. |
| Projective-lift freeness §3.4 | r=2; upper and reverse embeddings | Hom(Pσ,D₀²)=2, Hom(Pσ,D₀²/soc)=0; both finite-dimensional modules have dimension 2 dim D₀. | No assertion from socle equality alone. |
| Glued-lattice definitions §4.1 | f=1,2; j=−1,0,1 | Ranks d,4d and d,4d,7d respectively. R′/pR has dimension d; R′/pR′ has dimension 3d. | Preimage reductions distinguished. |
| Raw gluing §4.1 | Projection P⊕P₁⊕P₂→P; raw pullback | Image is P, so the map is surjective. Raw pullback surjects onto R₂,j, hence onto σ_v⊕σ₁,j⊕σ₂,j: 3 distinct simple labels rather than 1. | F04: existence restored; extra quotients give the obstruction. |
| Loewy-length bound §4.2 | Simple σ; allowed same/other-socle cases | For Q=σ, [Q/soc Q:σ]=0≠1. Permitted same-socle length 3; other-socle modular interval length 2. | Hypothesis (b) and all four conditions retained. |
| Minimal adjoint generators §4.3 | r=2, terminal σ quotient | Closed fibre dimension 2 needs ≥2 generators; induction supplies ≤2. Minimum is 2. | Compatible with reduced comparison in §4.4. |
| Adjoint-type freeness §4.4 | Tensor constituent labels a_j=0,1,2 versus −2,−1,3 | Allowed labels count 3; modular constituents in the kernel labels count 0, so M∞(W₁)=0. Reduction of a rank-2 free patched lattice is rank 2. | Integral τ′° retained, quotient reduced. |
| Lattice homothety normalization §4.4 | A=O³; L=Oe₁⊕pOe₂⊕pOe₃; pL | pA⊆L⊆A; pA is not contained in pL, since pe₁∈pL but pe₂∉pL. W₂ is defined for normalized L; multiplication by p identifies L and pL abstractly. | Normalize before quotient definitions. |
| Exact reduction sequence §4.4 | Same A,L | A/L≅k²; L/pL≅k³; L/pA≅k. Injection sends e₂,e₃ to pe₂,pe₃; dimensions 2+1=3. | F01: ×p and distinct denominators explicit. |
| Torsion versus lattice §4.4 | O/p and O | Every O-linear map O/p→O is 0; identity O/p→O/p has image of dimension 1. | F01 negative control added only in README. |
| Lemma 8.3.5 comparison §4.4 | p-torsion-free patched τ′° value S² | M∞(τ′°/pτ′°)≅S²/pS²=(S/pS)²; p kills every vector. Integral S² has no p-torsion. | Correct reduced chain; no integral identification. |
| Adjoint projective freeness §4.5 | Surjection S²→M with p-torsion-free S | Kernel after inverting p is 0; any kernel vector killed by pⁿ is 0 in S². Rank is 2 on both generic sides. | Repaired §4.4 supplies the same rank. |
| Third-radical comparison §4.6 | k[t]/t⁴→k[t]/t³ | Full dimensions 4→3; both rad³ quotients dimension 3. | No full-lattice isomorphism inferred. |
| Generation equivalence §4.7 | f=1,r=2 | Baseline Hom dimension 2, hypothetical extra map gives ≥3, factoring through N_j contradicts dimension 2 there. | r, not residue degree, remains the count. |
| Glued support and twist §4.8 | f=2,j=1; diag(2,1) over 𝔽₂₉ | Profiles 3, total rational rank (1+3+3)d=7d; adding double-adjoint profile gives 16d. Negative determinant value 15 versus positive 2. | Actual support and negative twist retained. |
| Integral gluing ideal §4.8 | p=29,N=12,a₂=2,d₂₁*=1 | Denominators a₂=2,a₂−1=1; unit leading factor 2/a₂=1, so ideal element is 29·(1+O(29³)). | No vanished denominator or replacement of p by ramified ϖ. |
| First-order multiplicity §4.9 | r=2; k⟦t⟧→k | Fibre map k²→k² has kernel dimension 0; before the fibre, (t)≠0 is the kernel of k⟦t⟧→k although both need one generator. | Reduction and fibre remain separate. |
| Weighted GK dimension §5.1 | f=1,2 | 2≥3−δ and δ≤1 give δ=1; 4≥6−δ and δ≤2 give δ=2. Finite-dimensional nonzero representation instead gives δ=0. | Ring-count repair preserves both bounds. |
| Second-congruence structure §5.2 | r=2 | Each constituent multiplicity 2; K₁-invariants D₀² agree with §3.4. Multiplicity 1 would differ by a factor 2. | Structure theorem retained. |
| Faithful flatness §5.3 | f=1,2; fraction field E over O | Grade equalities 2=2 and 4=4; π∨ closed fibre nonzero. Flat E has E/pE=0 and fails faithfulness. | Nonzero fibre remains essential. |
| Banach lifts §5.4 | Compact O and k | Hom_O(O,E)=E, unit ball O, residue k. Hom_O(k,E)=0 despite k≠0. | Flat specialization excludes torsion false lift. |
| Unweighted GK dimension §5.5 | Regular C₂₉-module over 𝔽₂₉ | Enlarged-level invariant subspace has dimension 1 inside dimension 29; finite direct doubling changes neither GK value f. | Level inclusion direction retained. |
| Completed cohomology/Hecke §5.6 | p inert; two p-adic places; O --p→ O | Away tensor has 0 or 1 factors. Reduced differential is 0, giving two copies of k in adjacent degrees; integral complex has only one nonzero cohomology group. Trace/determinant remain 5,6 in the q=5 witness. | No unsupported reduction or non-inert comparison added. |
| Big R=big T and CI §5.7 | R=O⟦x,t⟧, regular sequence (x) | Quotient O⟦t⟧ has dimension 2 versus dim R=3; annihilator on its free rank-one module is 0 in that quotient. Zero module has full annihilator. | Faithfulness kills intermediate kernels; CI codimension 1. |
| gap:tame-types | GL₂(𝔽₂₉) finite tame types | Scalar/principal/cuspidal dimensions 1,30,28; Steinberg dimension 29 excluded. | Existing intrinsic correspondence request suffices. |
| gap:single-type-rings | One-weight degree f=1,2 versus two-weight degree 1 | Relative smooth dimensions 4,5; two-weight relative dimension 4 but residual cotangent dimension 5. | Existing gap already specifies one-weight smoothness; no gap edit. |
| gap:breuil-mezard-pbt | Ramification e=2,f=1, highest weight (1,0) | GK highest-weight pairs (1,0),(0,0) give Hodge pairs (2,0),(1,0); replacing latter by (0,0) changes the type. | General coefficient/embedding convention retained. |
| gap:power-series-cancellation | O⟦t,x⟧ versus O⟦x⟧; k=𝔽₉ | Dimensions 3 and 2; cancellation removes only the shared variable. For a²=−1, a³=−a; inverse Witt Frobenius returns [−a] to [a]. | Coefficient correction and variable counts retained. |

## Verification outcomes

- Elaboration: `lake env lean` on `packages/HilbertModularVarietiesAndShimuraCurvesPartII/Suggested.lean`, from the pinned content checkout, exited 0 with no output. The file has only `import Mathlib` and the empty roadmap namespace, so no Tau Ceti object build was required.
- Elaborated-signature audit: there are zero declarations of any kind in Suggested.lean. There are consequently zero `#check @name` obligations or implicit binders to compare, and no signature changed. The module docstring’s unavailable-headline list still agrees with the README; no Check, API lemma or surrogate headline was added.
- Dependency check: the prescribed `gate --depcheck` with `--movable` exited 0 and produced exactly:

```text
depcheck: 53 roadmaps, 603 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. An earlier invocation also exited 0 and returned `depcheck: 52 roadmaps, 596 edges, 0 problem(s)`; the output above is the final invocation.

- Citation resolver: exit 0; no cross-roadmap citation or own Lean name found nowhere. Its external-library limitation was handled by pin inspection as described above.
- All new integer values, ring dimensions, lattice-chain lengths, character multipliers and residue-degree counts in the repaired Checks were recomputed. No new result depends on an omitted central character, an unchosen away type, a torsion-to-lattice surjection or the nonexistence of a valid pullback.
- No gate failures were supplied in the brief. `git diff --check` exited 0 with no output. The allowed-file audit found only the package README modified and this report added; no other file changed. The edited files contain no machine paths.

No downstream Lean name changes. Existing suppliers’ requested scope is unchanged; consumers now have explicit coefficient-category and one-weight hypotheses at their points of use. No commit or external write was made.
