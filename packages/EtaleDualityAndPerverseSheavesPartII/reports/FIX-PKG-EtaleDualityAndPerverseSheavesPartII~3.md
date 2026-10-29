# Repair report: étale duality and perverse sheaves, part II

## F01 (P1) — applied

Section 1.7's algebraization over V → equivariant algebraization of B, passage to invariants, and ideal descent over V^H. Explained completeness and the DVR property, corrected the geometric base, and added the ramified C₂ negative control. The headline is unchanged. Evidence: ILO14 lines 2986–3035, especially V 3.2.3–3.2.4, printed pp. 67–68.

## F02 (P2) — applied

Section 8.4's new split-cover assertion → an explicitly imported ArcTopologyAndDescent §11.2 input in scope, contracts and proof route. Retained the cohomological calculation and matched-open comparison; added the two-factor Check. Evidence: the supplier's §11.2 and CS24 lines 774–797, 864–871. Its §3.6 supplies the ultraproduct components.

## F03 (P3) — applied

Layer 6's two obsolete contract qualifiers → the actual F.2/F.5 finite-cohomological-dimension domain, coefficient/finite-type duality from the base roadmap, and this package's §6.8 exchange with its tensor–Hom suppliers. Neither obsolete contract remains. The individual targets and the three existing plan gaps are unchanged.

## F04 (P3) — applied

Section 0.5's abbreviated higher-graded definition → explicit a ≥ 1, base-graded compatibility, and prose identity, inverse and composition laws. Retained both Checks and added the closed-fibre-only counterexample. All additions stay in the README. Evidence: ILO14 lines 1872–1898, III Definition 4.2, printed p. 39.

## Scope, source and ownership audit

Only `packages/EtaleDualityAndPerverseSheavesPartII/README.md` and this report change. The six headline statements, three native structures, metadata, source manifest and design plan are unchanged. No mathematical target was weakened, no supplier gap was invented, and no external action or merge-order edit is requested.

The pattern search covered the whole README and Suggested.lean. F01 also occurs through the coefficient action in §1.4, the bundle's equivariance/invariant-degree fields, §1.5's base dimension, and the uses of §1.7 in §§2.2–2.3 and 6.9. Those consumers require the regular smaller base, not the original V; their statements remain valid. F02 was repaired in all four places: scope, exact contract, target and route. Section 8.5 continues to consume the cohomological comparison. F03's stale phrases occurred only in the Layer 6 summary; §6.8 and the individual Needs clauses already use the direct exchange route. F04's convention is used by §§0.7 and 5.6; neither now substitutes agreement of closed fibres for graded comparison.

Read ILO14 lines 2818–2881, 2986–3035 for the Weierstrass, henselian and invariant descent steps, and lines 1872–1919 for higher-graded comparison. In particular, the henselian polynomial ring is taken at the origin of the closed fibre (ILO14 line 2839). For finite H of invertible order, the averaging projector is linear over invariant coefficients and commutes with flat completion; it identifies the completed invariant algebra with B^H. The restricted valuation on V^H has a nonzero subgroup of ℤ as value group, because p is invariant and has positive value. An invariant nonzero fraction of nonnegative valuation lies in V^H, and fixed points form a closed subset of V. Thus this is a complete DVR of mixed characteristic, including when the coefficient action is ramified or nonfaithful.

The C₂ calculation uses the free W-basis 1, π of V: invariance of a+bπ means 2bπ=0, hence b=0. This computation applies coefficientwise to B. It proves both asserted fixed-ring identities. The obstruction to a V-algebra structure uses only that a unital ring map fixes 3, so does not presuppose W-linearity.

For F02, a local lift of a section through an epimorphism of sheaves gives an étale cover; its supplied splitting gives a global lift. Consequently global sections are exact on each quasi-compact open in question. A constant-sheaf section there has finite image and is specified by a finite clopen partition. Section 8.3 preserves those partitions and orthogonality, supplying the comparison without reproving splitting. The source proof is CS24 lines 864–871.

No source was fetched under a new key. Every cited work is already in `sources.toml`; the legal cached texts suffice for these findings. Ill03 and Epp73 remain uncertified under their existing keys, and no settled access request was reopened.

Read main at `794d0fcd` and used `roadmaps list`, `roadmaps grep` and `roadmaps show` for ownership and citation checks. Searches included the objects higher-graded approximation, partial algebraization, valuation products, their components and splitting, rather than only proposed declaration names. The first two extensions remain owned here; polynomial approximation and the split-cover assertion remain with their named suppliers. The searches of available open roadmap heads found no competing owner for the newly spelled-out higher-graded API. Open ownership was checked through the supplied index; existing-roadmap suppliers below are read at main even where that index also lists a revision.

| Citation family | Copy and locator verified | Consumed meaning |
| --- | --- | --- |
| SchemeAndStackFoundations | Main, §§0.7, 0.12–0.16, 0.20–0.22, 2.11–2.12, 2.15–2.16, 4.16–4.20 | Dimension, henselization, approximation inputs, excellence, normalization, descent and ordinary alterations. |
| AlgebraicModuliForArithmeticGeometry | New-roadmap head, §§6.0–6.1 | Polynomial approximation and common étale neighborhoods; no higher-graded comparison is imported. |
| DeformationAndDerivedPatchingAlgebra | New-roadmap head, §1.10 | Coefficient maps; the declared coefficient-field gap remains explicit. |
| AdicCoefficientsAndComparisonsPartII | `packages/AdicCoefficientsAndComparisonsPartII/design/README.md`, §§PA.0.2–PA.0.8, PA.0.11, PA.1.2–PA.1.4, PA.4.1–PA.4.8, PA.5.1–PA.5.4 | Degree-controlled alterations, valuative spaces, log modifications and stable curves. |
| AdicEtaleGeometry | Main, §§A1.14–A1.15, including coherent-topos-enough-points | General coherent-site input on its stated small-site/universe domain. |
| EnhancedDerivedSheaves | Main, §§0.1–0.4 and Layer E2 (inverse limits and descent) | Ringed-site enhancements, tensor–Hom, coherent adjunctions and hypercover descent. |
| EtaleCohomologyFoundations | Main, §§0.7, F.0–F.3, F.5–F.6, F.8 | Extension by zero and tensor compatibility; F.5 explicitly has F.2's finite-cohomological-dimension domain. Generic noetherian constructibility remains a declared gap. |
| EtaleDualityAndPerverseSheaves | New-roadmap head, §§0.1–0.2, 1.1, 2.1–2.11 | Coefficient duality, finite-type duality and perverse interfaces on their stated geometric domain. |
| LefschetzPencilsAndVanishingCycles | New-roadmap head, §§0.2–0.5, 0.10, 6.2 | Trait interfaces and purity; the independent trait affine bound remains gap:ILLUSIE-2003. |
| ClassicalAdicEtaleCohomology | New-roadmap head, §5.4 | Scheme-oriented product and its universal property. |
| ArcTopologyAndDescent | `packages/ArcTopologyAndDescent/design/README.md`, §§3.6, 8.3, 8.6–8.9, 11.1–11.2, 11.5, 12.6 | Components, completion/descent and, specifically at §11.2, split covers of quasi-compact opens of aic valuation products. |
| PerfectoidQuotients | New-roadmap head, §§0.4–0.6 | Integral operations, p-integral closure and product perfectoidness. |
| PerfectoidQuotientsPartII | `packages/PerfectoidQuotientsPartII/design/README.md`, §§Q5.1–Q5.3, Q6.3–Q6.7 | Integral tilts, powered sharp quotient, valuation tilting and algebraic closure. |
| PerfectoidSpaces | Main, §P1.24 | Integral perfectoid convention used by the supplier. |
| PurityForFlatCohomology | `packages/PurityForFlatCohomology/design/README.md`, Layer PF.1 | Downstream local-Lefschetz use; no supplier edge is introduced. |

The citation resolver still lists four names it cannot find on main or in its open-head index: AdicCoefficientsAndComparisonsPartII, ArcTopologyAndDescent, PerfectoidQuotientsPartII and PurityForFlatCohomology. The table identifies their supplied board copies and actual sections. These are resolver coverage limitations, not missing mathematical contracts. Its appended claim that no pinned Lake packages are available does not describe this worker's content checkout; the library checks and elaborations below used that checkout directly.

## Computed adversarial mathematics pass

Here k is separably closed for strict-local cohomology calculations; Λ is a nonzero finite ring of invertible order unless specified. Each row records explicit test values, not an inference from elaboration. The numbered rows cover all 55 target subsections; additional rows separate the changed definition laws, coefficient-base argument and supplier input. Unchanged targets were tested without adding new roadmap targets or Lean padding.

| Statement | Instances tried | Computed values on the two sides | Result and change |
| --- | --- | --- | --- |
| Local-ring and completion conventions | Zero ring; k; k⟦t⟧ | Zero ring has 0=1 and fails native nontriviality; k has dimension 0; the maximal-adic completion of k⟦t⟧ is itself with kernel 0. | Nonzero/separated hypotheses retained. |
| Coefficients and shifts | n=1,2; Λ[2] | n=1 gives 0; for n=2, cardinalities of Λ and Λ² are 2 and 4. H⁻²(Λ[2])=Λ and H⁰=0. | Layer 6's n≥2 and shift convention retained. |
| Transition twist and sign | Strict trait; regular strict surface | Kummer 1 maps to the generator of H²_s(Λ(1))=Λ; two successive classes give H⁴_x(Λ(2))=Λ. | Positive twist/shift retained throughout Layers 5–7. |
| §0.1 alteration category | Spec k; origin in A¹; blow-up of A² | Objects over k are finite reduced k-algebras; origin has no dominating generic point. Ordinary blow-up product contains E×E over 0; the dominating part keeps the diagonal generic closure. | Generic finiteness and md are distinct; retained. |
| §0.2 topology and hypercovers | ℤ[i]/ℤ; ℓ=2,3; empty augmentation | Generic degree 2 has gcd(2,3)=1 and gcd(2,2)=2. Empty degree-zero image misses Spec ℤ. | Both degree restrictions and augmentation coverage retained. |
| §0.3 standard forms | Identity; integral finite flat cover of degree 3, ℓ=2 | Identity degree=1; the second cover has gcd(3,2)=1. Taking Y=X and V=X gives the stated composites literally. | Retained. |
| §0.4 valuative criterion | G_m in A¹; excellent DVR normalization; non-Japanese DVR | At the origin t is a nonunit and cannot map to a unit in a local lift. Excellent finite normalization has finite module rank; the stated non-Japanese integral closure has infinite module size. | Positive and negative domains remain distinguished. |
| §0.5 higher-graded definition | X=Spec k⟦t⟧; Y=Spec k; a=1,2 | For a=1 both fibres are k but gr¹₁(X)=k and gr¹₁(Y)=0. For a=2 on X, degrees −2,−1,0 give 0,k,k[t]/t². | F04: closed fibre alone is rejected; n≤0 convention is consistent. |
| §0.5 identity law | Identity of X above | Degree-one map sends t mod t² to itself: k→k is multiplication by 1; fibre map is id. | Added prose API; no Lean declaration. |
| §0.5 inverse law | X=Spec ℚ⟦t⟧[z], z↦2z | Inverse sends z↦z/2; composites send z↦z and t↦t, including degree one. | Added inverse API with base compatibility. |
| §0.5 composition law | z↦2z, 3z, 5z on that X | Two composites give 6z; either triple parenthesization gives 30z; base t remains t. | Added associative composition API. |
| §0.5 base compatibility | X=S=Spec ℚ⟦t⟧; proposed gr¹ map t↦2t | Base generator maps to t under the structure map and to 2t under the proposal; t≠2t in gr¹₁. | The new base-graded condition excludes this wrong comparison. |
| §0.5 approximation theorem and retained Checks | X=Ŝ; étale quadratic with unit u and 2 invertible | A/𝔪ʳ=Â/𝔪ʳ for every r. In t²−u, t is a unit and derivative 2t is a unit. A singular base still has its original positive tangent defect. | Both retained Checks remain valid; no regularity inferred from étaleness alone. |
| §0.6 henselian reduction | Regular connected pair; disjoint union of two such pairs | Identity source count=1; component cover count=2; inverse-image snc supports equal the original supports. | Connected-source condition retained. |
| §0.7 complete-local reduction | Boundary xy(x−y), chart y=xu | Pullback is x³u(1−u); reduced support is xu(1−u), with at most two components meeting at a point, before and after completion. | Pair data, not merely the ambient ring, are approximated. |
| §1.1 Cohen–Gabber | Cusp at p=2,3; d=0 | At p=2, parameter y gives generic degree 3 and derivative x²≠0; at p=3, parameter x gives degree 2 and derivative 2y≠0. At d=0 the map is k→k, degree 1. | General characteristic scope retained. |
| §1.2 equivariance | Sign action on k⟦x⟧; S₃ permutation action; wild order 2 | Parameter x² gives degree 2 and is fixed; symmetric parameters give degree 6. In characteristic 2, group order 2 maps to 0, not a unit. | Nonabelian and wild controls retained. |
| §1.3 Epp and cancellation | Unramified trait; displayed characteristic-2 equation | Unramified ramification index=1. Subtracting (uπ⁻¹)²−uπ⁻¹ leaves 2uπ⁻¹=0; transformed equation is z²−z=0. | Splitting is allowed after cancellation; retained. |
| §1.4 mixed Cohen–Gabber | ℤ_p⟦x⟧ identity; t↦x^p | Identity has degree 1 and zero relative differentials. For t↦x^p the derivative is px^(p−1), nonunit at the generic point of the p-fibre although nonzero generically. | p-dense condition retained. |
| MixedCohenGabberPresentation | Ramified coefficient actions (p,ℓ)=(3,2),(2,3); Q₈, S₃ | B/A has degree ℓ but B^H/A degree 1. Q₈ element orders are 1,2,4; S₃ has order-3 elements. | Invariant degree, nonfaithful actions and ℓ-group condition retained. |
| §1.5 partial algebraizability | k⟦x⟧; k; ideals (x),(x²) | Base k has dimension 0<1; no nonzero local base has dimension <0 for k. Quotient lengths are 1 and 2 despite equal support. | Strict dimension drop and scheme-theoretic ideals retained. |
| PartialAlgebraization API | (x)∩(x²) in k[x]_(x), then completion | Intersection=(x²) on each side; extension to k⟦x⟧ gives (x²). Identity presentation has base dimension 1=1 and is rejected. | Flat-completion API agrees with the bundle. |
| §1.6 equal-characteristic algebraization | Node k⟦x,y⟧/(xy), ideals (x),(y); empty family | C=k[x,y]/(xy) completed at (x,y) gives the node; dim k+1=0+1=1. For the empty family the same completion identification remains. | Finite-family statement and base dimension retained. |
| §1.7 invariant coefficient DVR | V=W[π]/(π²−3), H=C₂ | (a+bπ)^H requires 2bπ=0, hence fixed coefficients=W; coefficientwise B^H=W⟦x⟧. Restricted v₃ takes integral values. | F01: V^H replaces V in the algebraization base. |
| §1.7 no V-algebra structure | A′=W⟦x⟧; image b(x) of π | b(x)²=3 would give b₀²=3, hence 2v₃(b₀)=1, impossible for integer v₃(b₀). | New negative-control Check rejects the former base. |
| §1.7 equivariant descent and completion | B̃=V[x]_(π,x)^h with sign action; finite quotients | Averaging sends a+bπ to a; after completion the same map sends a(x)+b(x)π to a(x). Both invariant completions are W⟦x⟧. | F01: algebraize the action before taking invariants. |
| §1.7 geometric base and ideals | d=2,3; C=W[x], 𝔫=(3,x) | Base dimensions are 1+(2−2)=1 and 1+(3−2)=2. At d=2, completed C_𝔫=W⟦x⟧; extension of (x−3) is (x−3). | Corrected base remains regular of dimension d−1. |
| PrimeToEllLocalExtension | Identity; quadratic extension; reduction modulo p | Identity generic fibre dimension=1. gcd(2,2)=2 and gcd(2,3)=1. Reduction kills p≠0 and fails injectivity. | Bundle hypotheses retained, including the actual generic degree. |
| §2.1 equivariant curve alteration | Smooth P¹ with disjoint sections; P¹_L over K, [L:K]=2 | Identity has both quotient degrees 1. In the second case generic constants have degree 2, whereas a birational base quotient would require degree 1. | Geometric irreducibility hypothesis retained. |
| §2.2 weak uniformization | Cone xy=z², including characteristic 2 | Blow-up charts are polynomial rings k[x,z₁] and k[y,z₂]; exceptional charts have one regular parameter. Generic degree=1. | Regularity and snc support survive the small characteristic test. |
| §2.3 prime-to-ℓ uniformization | Degree-ℓ quotient; birational resolution; displayed cubic | gcd(ℓ,ℓ)=ℓ versus gcd(1,ℓ)=1. Cubic closed fibre has degrees 1+2; deleting the degree-1 point leaves degree 2 at the boundary although generic degree is 3. | Pointwise covering condition retained. |
| §2.4 regular hypercovers | Constant hypercover; q=0,1 | Constant cosimplicial differentials alternate 0,id, giving H⁰=Λ and Hⁱ=0 for i>0. General control uses 2 levels for q=0 and 3 for q=1. | Truncation and degree-zero coverage retained. |
| §3.1 oriented product | Punctual base; self-product of strict trait | With punctual base the product is ordinary; on the trait the allowed underlying pairs are (s,s),(η,η),(s,η), count 3; reversed pair is absent. | Specialization direction retained. |
| §3.2 tube base change | X=Y=S a separably closed point, F=Λ | Each side is Λ in degree 0 and 0 in higher degrees; projection and pullback maps are identities. | Retained on the stated coherent domain. |
| §3.3 diagram topology | Identity; type-(iv) blow-up; {0}→A¹ | Identity augmentation is an equivalence; the blow-up ladder is type (iv); the point map misses every nonzero point. | Ambient category and covering distinctions retained. |
| §3.4 proper oriented acyclicity | π=id; zero complex | Adjunction is id_F:F→F; on zero coefficients it is the unique 0→0 map in every degree. | Abelian scope and proper-base domain retained. |
| §3.5 oriented descent | Two-point cover of a separably closed point | Degree-zero sections Λ² have equalizer diagonal Λ inside Λ²; the next difference has coordinates 0,b−a,a−b,0. Higher Čech cohomology is 0. | Ordinary-descent specialization agrees; retained. |
| §3.6 hypercover base change | Constant hypercover; zero K | Augmentation comparison is id on H⁰=Λ; for K=0 both sides have all groups 0. | No extra nonabelian target introduced. |
| §4.1 constructibility | Strict trait j; cited non-quasi-excellent boundary | For j, stalk ranks are 1 in degrees 0,1 and 0 later. In the negative control R¹ ranks are 2 at infinitely many points versus 1 generically. | Constructibility and quasi-excellence distinction retained. |
| §4.2 finiteness | snc branch counts r=0,1,2; characteristic-primary A¹ | Exterior ranks are (1), (1,1), (1,2,1). Artin–Schreier classes t^m, p∤m, give infinitely many independent classes. | Boundedness and invertibility domain retained. |
| §5.1 dimension functions | Strict trait; line meeting plane | Trait values 1,0 differ by 1. On the line component of the union, −dim O gives 0 at its generic point and −2 at the meeting point, instead of −1. | Sign and generality retained. |
| §5.2 existence | Point; strictly henselian trait | On a point δ=c for every integer c. On the trait δ(η)=c+1 and δ(s)=c, with difference always 1. | Local existence statements remain distinct from excellence. |
| §5.3 regular base change | Identity; A=ℚ[t]_(t), quadratic z²=1+t | Identity gives the same stalk groups. Over A no rational square root exists; in ℚ⟦t⟧ its initial terms are 1+t/2−t²/8, whose square is 1+t modulo t³. | Sheaf base change is not mistaken for unrestricted global comparison. |
| §5.4 dimension transport | A¹_k→Spec k, base δ=0 | Finite-type transport gives 1,0 at generic/closed points; regular transport gives 0,−1. The difference is the constant 1. | Both formulas and later functoriality use the same normalization. |
| §5.5 strict-local trait bound | Dimension 0 point; generic open of strict trait | At d=0, H⁰=Λ and H^q=0 for q>0. At d=1, H¹=Λ(−1) and H^q=0 for q>1. | The independent supplied trait bound remains necessary. |
| §5.6 affine Lefschetz | Strict regular surface, complement of a regular divisor | δ(U)=2 and δ(R¹j_*Λ)=1=2−1; H^q(U,Λ)=0 for q>2. | Support and degree signs retained. |
| §5.7 henselian local bound | Strict DVR; DVR with finite residue field | cd_ℓ(k)=0,1 respectively; fraction-field dimensions are 1,2, equal to 1+0 and 1+1. | Residue-field contribution retained. |
| §5.8 general cohomological dimension | d=0,1,2; empty open; unbounded torsion orders | Bounds 2d−1 are −1,1,3. A point has cd=0, explaining exclusion of d=0; H¹ of the strict trait and H³ of a punctured strict surface attain 1,3. Empty groups are 0. Orders ℓ^r on infinitely many components have no common exponent. | Full affine-basis torsion signature retained. |
| §6.1 immediate transitions | Identity; wild C₂ acting by −1 on ℤ/3; inseparable degrees 2,3 | Identity gives multiplication by 1; average (1+(−1))/2=0 on the wild module. In ℤ/3, 2·2=1; in ℤ/2, 3·1=1. | Transition projection and inverse residue-degree normalization retained. |
| §6.2 top class and higher transitions | d=0,1,2 regular strict local schemes | Top groups with twist d are Λ in degrees 0,2,4; consecutive codimension-one transitions send 1 to 1 in the degree-4 group. | No arbitrary-codimension derived map asserted. |
| §6.3 pinned complexes | Strict trait, K=Λ(1)[2]; wrong K=Λ; empty scheme | Correct K has generic H⁻²=Λ(1) and closed support H⁰=Λ. Wrong K has generic H⁰=Λ. Empty scheme has only the zero object. | Pinnings determine the normalized object; retained. |
| §6.4 regular potential complex | Strict trait, δ=−codim | δ(η)=0 and δ(s)=−1; RΓ_s(Λ)=Λ(−1)[−2], with H²=Λ(−1), exactly the pinning at δ(s). | Unshifted regular normalization retained. |
| §6.5 perverse t-structure | Point p=0; strict trait p=−2δ | Point gives standard degree 0. Trait K=Λ(1)[2] has generic degree −2 and support degree 0; Λ has generic degree 0>−2 and fails the upper condition. | Arbitrary monotone perversity remains distinct from field middle perversity. |
| §6.6 existence and pinned uniqueness | Geometric point, Λ=ℤ/5 | K=Λ has endomorphism ring Λ in degree 0; among the four units 1,2,3,4 only 1 preserves the identity pinning. | Pinned, rather than unmarked, uniqueness retained. |
| §6.7 functoriality | Identity; A¹_k→Spec k | Identity preserves δ and K. Smooth shriek yields Λ(1)[2] with δ-values 1,0; ordinary regular pullback yields Λ with values 0,−1. | Same dimension witness as §5.4; retained. |
| §6.8 open tensor–Hom exchange | j=id, F=Λ; empty U; generic trait open | Sides equal K, then 0, then Rj_*Λ. In the last case closed-stalk H⁰=Λ and H¹=Λ(−1), whereas j_! would give 0. | F03 summary now names this direct route. |
| §6.8 dualizing predicate | Point; K=Λ²; Λ=ℤ/4; Λ=ℤ/6 | D_ΛD_ΛΛ=Λ; D_(Λ²)D_(Λ²)Λ=Λ⁴. Hom_(ℤ/4)(ℤ/2,ℤ/4) has 2 elements and its double dual is ℤ/2. Mixed-prime tensor terms over ℤ/6 are 0. | Nonzero coefficients and all-constructible duality retained. |
| §6.9 biduality | Strict trait, K=Λ(1)[2], F=j_!Λ | F's generic stalk is Λ and closed stalk is 0; double dual has the same stalks Λ and 0. For F=0 both duals are 0. | Retained; the corrected algebraization base changes no statement. |
| §6.10 excellent duality and necessity convention | Λ=ℤ/6, factorwise shifts on strict trait | Shift indices (η,s) are (−2,0) for the 2-factor and (−3,−1) for the 3-factor. Each rises by 2; floors of their negative halves are (1,0). | Finite-quasi-injective-dimension necessity and factorwise shifts retained. |
| §6.11 normalized regular local duality | d=0,1,2 | K equals Λ, Λ(1)[2], Λ(2)[4]; its nonzero ordinary degrees are 0,−2,−4 and its closed support is Λ in degree 0 in all cases. | Normalization retained. |
| §6.12 local duality | Strict trait, F=Λ; geometric point | H²_x(Λ)=Λ(−1)=Hom_Λ(Λ(1),Λ); H⁰_x(Λ)=0=Hom_Λ(0,Λ). At a point finite-module double dual returns the module. | Degree reversal retained. |
| §7.1 principal punctured vanishing | Strict DVR, uniformizer; f=0 | Generic H¹=Λ(−1) and H^q=0 for q>1. For f=0 the open is empty and every group is 0. | Excellence remains in this auxiliary theorem. |
| §7.2 extension-by-zero support | Strict DVR, uniformizer; f=0 | H⁰_x(j_!Λ)=0; H¹_x(j_!Λ)=Λ is allowed at the boundary i=d=1. For f=0 the sheaf and all support groups are 0. | Strict inequality i<d retained. |
| §7.3 local Lefschetz | DVR modulo uniformizer; f=0; d=0 | In boundary degree 0, map 0→Λ is injective but not surjective. For f=0 every restriction is id; at d=0 the boundary degree is −1 and both groups are 0. | Integral degree convention retained, with no natural-subtraction underflow. |
| §8.1 matched opens | Rank-one algebraically closed valuation; characteristic-p algebraically closed field, ϖ=0 | Rank-one case has whole/generic opens, two pairs; field case has whole/empty opens, two pairs. Common special-fibre spectrum has one point. | Closed-complement definition and completion conventions retained. |
| §8.2 multiplicative generic tilt | Perfect characteristic-p A; mixed-characteristic C | In characteristic p a root sequence is (a,a^(1/p),…) and first-coordinate evaluation is inverse. In C, both (1,1,…) and (1,ζ_p,ζ_(p²),…) have first coordinate 1. | Inverse limit is not replaced by C itself. |
| §8.3 idempotent comparison | Connected ring; two factors; empty open | Idempotent counts are 2,4,1; in the two-factor case e₁e₂=0 and e₁+e₂=1 on both sides. | Orthogonality, including the empty case 0=1, retained. |
| Supplied split-cover input | One algebraically closed field; two fields; arbitrary ultraproduct rank | Global-section functor has no positive derived groups; on these finite examples H⁰ is G,G². Nonprincipal components retain the membership values 0 or 1 for each product idempotent. | F02: input belongs to ArcTopologyAndDescent §11.2. |
| §8.4 product cohomology comparison | One/two rank-one generic factors; empty open; infinite I | H⁰ equals G,G²,0 respectively, and H^q=0 for q>0. e_J is 1 on an ultrafilter component exactly for J in the ultrafilter; otherwise it is 0. | F02: comparison retained and two-factor Check added. |
| §8.5 algebraic tilting | Perfect complete characteristic-p A; G=ℤ/p | A^♭=A and every matched open is itself, so maps on all H^i are identities; for an algebraically closed field the groups are ℤ/p in degree 0 and 0 later. | Characteristic-primary torsion remains included. |
| §8.6 supported tilting | Z empty; whole algebraically closed characteristic-p field; O_C | Support complexes are respectively 0, G[0], and 0, since in the last case restriction is id:G→G with higher groups 0. For 𝔽_p, H¹(ℤ/ℓ)=ℤ/ℓ need not vanish. | No nondiscrete purity or perfect-field acyclicity is inferred. |
| Downstream hypersurface consequence | k⟦x,y⟧/(xy); DVR modulo uniformizer | For the first, H⁰_𝔪=0 below d−1=1. In the second d−1=0, negative groups vanish but H⁰=Λ. | Consumer degree threshold unchanged. |

## Pinned declarations and elaborated signatures

The content manifest pins Mathlib at `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Object searches in both pinned trees found no existing higher-graded approximation or partial-algebraization theorem to replace the targets. Native inputs were inspected directly:

- `Mathlib/RingTheory/LocalRing/Defs.lean:30`: IsLocalRing includes nontriviality.
- `Mathlib/RingTheory/AdicCompletion/Basic.lean:56`: IsAdicComplete includes Hausdorffness and precompleteness.
- `Mathlib/Algebra/Algebra/Subalgebra/Operations.lean:98`: FixedPoints.subring uses the actual fixed additive subgroup and multiplicative submonoid; it asserts no V-algebra structure on invariants.
- `Mathlib/RingTheory/Etale/Locus.lean:35`: Algebra.IsEtaleAt is formal étaleness of the source-prime localization; the presentation's finite noetherian map provides the additional finiteness context.
- `Mathlib/GroupTheory/PGroup.lean:41`: IsPGroup is the native group condition, allowing a nonfaithful action.
- `TauCeti/Algebra/Module/ZMod/Injective.lean:50`: Module.Baer.zmod_self carries the nonzero-modulus binder.

One scratch file contained the unchanged module followed by `#check @name` for each of its nine declarations. It elaborated successfully. Compared every printed signature to its README statement:

| Declaration | Hypotheses/data confirmed in the elaborated type | Change |
| --- | --- | --- |
| cohenGabber_equalCharacteristic | Complete noetherian reduced local A, prime positive characteristic, dimension and every-minimal-prime equidimensionality; actual finite torsion-free generically étale map. | None. |
| cohenGabber_equivariant | Field algebra, complete reduced local A, finite group and invertible order, dimension, induced residue action and actual equivariance equation. | None. |
| MixedCohenGabberPresentation | Domain/local input A and parameters p,ℓ,d; coefficient and extension hypotheses remain fields of the bundle. | None. |
| cohenGabber_mixedCharacteristic | Complete normal local domain, characteristic zero, prime residue characteristic, prime ℓ≠p and d≥2. | None. |
| PartialAlgebraization | Noetherianity and maximal-adic completeness are explicit input binders; arbitrary ideal-index universe remains. | None. |
| partialAlgebraization_equalCharacteristic | Reducedness, a field algebra, positive dimension and finite ideal family; regular base with dim base+1=dim A. | None. |
| PrimeToEllLocalExtension | Domain/local A and ℓ; actual finite injective local extension and generic degree are bundle fields. | None. |
| partialAlgebraization_mixedCharacteristic | All mixed-characteristic hypotheses, ℓ≠p and dimension≥2; extension chosen before all r and ideal families; base residue characteristic p is explicit. | None. |
| cohomologicalDimension_le_of_strictlyLocal | Henselian local A with separably closed residue field, noetherianity, positive dimension, invertible prime ℓ, affine-basis sectionwise torsion and 2d≤q. | None. |

No section binder disappeared. No declaration was added, deleted or renamed, and README/Lean generality is unchanged.

## Required check outcomes

- `lake env lean` on `packages/EtaleDualityAndPerverseSheavesPartII/Suggested.lean`, run from the pinned content checkout: exit 0; exactly six expected “declaration uses sorry” warnings at the six headline theorems; no errors. There are no TauCeti imports to build first.
- Scratch `#check @name` elaboration: exit 0; all nine types printed, with the same six expected warnings and no errors. The comparisons are recorded above.
- Dependency-direction command with the requested name, order and `--movable`: exit 0; exact output:

```text
depcheck: 52 roadmaps, 596 edges, 0 problem(s)
```

- No UPWARD, CYCLE or moved line appeared.
- `git diff --check`: exit 0, no whitespace errors.
- Whole-package searches: neither deleted contract qualifier remains; the former geometric base over V and the new-target split-cover clause each have zero occurrences. Section 0.5 has three prose API bullets and three Checks.
- No additional gate failures were listed in the brief. The citation resolver leads and their board resolutions are recorded above; no source-access failure remains for this repair.

Maintainer consequences: ArcTopologyAndDescent §11.2 is explicitly consumed for its existing theorem. The three declared gaps retain their suppliers, sections and slugs. All downstream names and headline signatures remain stable. No commit, push, pull-request edit or other external write was performed.
