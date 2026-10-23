# Human review response: QWittVectors

The six numbered review findings contain ten distinct points: finding 3 separates the prerequisite from its specialization/iteration target, finding 4 separates the two construction owners, and finding 6 separates its three support contracts. All ten are addressed below; the positive inspection notes introduce no further requested changes.

## H01 (CBirkbeck) — applied

`TauCetiRoadmap/QWittVectors/README.md:807` changes the relative coefficient-completion comparison from Q_m(R/A)^∧_p ≃ Q_m(R̂_p/A) to Q_m(R/A)^∧_p ≃ Q_m(R̂_p/A)^∧_p, removes the blanket inheritance of the absolute completion formula, and adds the infinite-variable counterexample at line 820. Wagner's argument explicitly completes the coefficient-change map (wagner line 3124); the downstream comparisons in §§6.1–6.3 and 9.5–9.7 retain their completed scalar extensions.

## H02 (CBirkbeck) — applied

`TauCetiRoadmap/QWittVectors/README.md:98` replaces the untwisted prismatic input by S^(1)=(R̂_p⊗^L_(Â_p,ψ_p)D/I)^∧_p, specifies the E₁ multiplicative and Frobenius-compatible comparison, and cites Theorem 16.18 (bhatt-scholze line 4289). Sections 9.5a and 9.6(c) propagate this scalar map, and §9.5a computes the localization over ℤ[U] that distinguishes the twisted algebra from the untwisted one; §9.7 retains ψ_(p^αd).

## H03 (CBirkbeck) — applied

`TauCetiRoadmap/QWittVectors/README.md:88` adds PrismaticCohomologyPartII §§3.16, 5.0, 5.13, 5.18–5.21 to the supplier boundary and cites Part II directly in §9.6's prerequisites, while Part I supplies its actual prism, reconstruction and Hodge–Tate inputs. The supplied merge order already places Part II before QWittVectors, with no reverse dependency found; the worker's prerequisite declaration should include Part II, since pull-request text is outside this job's authorized edits.

## H04 (CBirkbeck) — applied

`TauCetiRoadmap/QWittVectors/README.md:1263` adds the QWittVectors-owned general-base specialization and iteration target before §9.6: it verifies the q-PD/complete-frame hypotheses, states completed Frobenius base change of décalage, and constructs the all-α equivalence and its Bockstein reduction. The target uses S^(1), J_α=([p^α]_q), the degree-k multiplication by h^k identifying the two décalage models, and ψ_(p^α) on the right scalar factor; it requires no conclusion of the simultaneous q-Witt induction (bhatt-scholze line 3905; wagner lines 3441–3474).

## H05 (CBirkbeck) — applied

The duplicate §1.7 construction is deleted, and `TauCetiRoadmap/QWittVectors/README.md:56` imports AInfCohomology §AI.1.7's arbitrary-module commuting-endomorphism Koszul complex, maps and scalar cochain-dual comparison. All former local §1.7 dependencies now name that supplier; its differential convention is retained and tested by d¹d⁰(XY)=1−1=0 in §8.3.

## H06 (CBirkbeck) — applied

`TauCetiRoadmap/QWittVectors/README.md:1074` through §8.4 replaces the duplicate generic framing, derivatives and unscaled complex with power-series realizations of PrismaticCohomologyPartII §5.0 and its §5.18 skew product. These sections verify quotient completeness and coordinate regularity, identify the terms with completed Kähler forms, and require compatibility with products, coordinate-injective maps and Frobenius; the distinct h-scaled model and its Frobenius remain here, and the native-power-series headline in Suggested.lean is unchanged.

## H07 (CBirkbeck) — applied

`TauCetiRoadmap/QWittVectors/README.md:370` adds the equivalence between all-prime Witt coalgebras and the special λ-rings of SchemeKTheoryOperations §§6.2.1–6.2.2, with σ_t=γ_∞s, λ_t=σ_(−t)⁻¹, inverse constructions, morphism compatibility and equality of Newton ψ_n with w_n∘s (borger lines 615–627). Its integral proof route and Checks distinguish a line, canonical ℤ, the zero ring and ℤ[ε]/(2ε,ε²), without using ghost injectivity on torsion rings; the new supplier is restricted to the elementary λ-ring sections.

## H08 (CBirkbeck) — applied differently

The unscheduled cochain-completion supplier extension becomes the concrete local target `TauCetiRoadmap/QWittVectors/README.md:279`, §1.9, with exactly the degree-dependent hypotheses and conclusions of Wagner Lemma 4.25 (wagner lines 3198–3227). Its generality is retained, including unbounded complexes and no uniform torsion bound, and §9.5 now consumes this stage rather than a nonexistent Part II roadmap.

## H09 (CBirkbeck) — applied differently

The unscheduled multiplicative Bockstein extension becomes `TauCetiRoadmap/QWittVectors/README.md:297`, §1.10, on DGAInfinity's associative carriers and AInfCohomology §AI.1.4's additive Bockstein. It states the signed product and parameter-change laws with their actual sources and targets, and §9.3 consumes this stage; the test f=4, g=2, dx=4u computes Fβ_4V[x]=0=β_2[x], whereas omitting V gives [u]≠0.

## H10 (CBirkbeck) — applied differently

The unscheduled differential-ideal quotient extension becomes `TauCetiRoadmap/QWittVectors/README.md:316`, §1.11, with the homogeneous two-sided differential ideal, quotient universal property and preservation of strict odd alternation, and §7.2 now consumes it. The three support targets stay within the already requested contracts and have explicit owners and build positions here; no additional supplier folder, merge-order entry or promise about a nonexistent Part II was introduced.

## Ownership and citation record

The main checkout and origin/main both resolve to a07e2024f391f3022520c3f8ad194912b3eab614. The pinned libraries are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The merged DerivedModuleAlgebra and DGAInfinity roadmaps supplied the shape and scope comparisons; EnhancedDerivedSheaves, SchemeAndStackFoundations and BordismFormalGroups were also read on main, rather than from progress or revision pull requests.

The new-roadmap suppliers were read at their indexed heads: AInfCohomology b47987b, PrismaticCohomology ff0050b, PrismaticCohomologyPartII 2a6d228, SchemeKTheoryOperations 88dbd5a, DerivedDeRhamCohomology 83d00dd and HabiroCyclotomicCompletions 3caf5c7. The exact Part II sections contain the claimed generic objects and one-step results, and SchemeKTheoryOperations §§6.2.1–6.2.2 precedes its K₀ application at §6.2.3. The citation resolver reports no missing cross-roadmap citations or roadmap identifiers; its host-side library-name limitation was supplemented by inspection of the actual pinned library files.

Object searches covered the main roadmaps, the board packages, the indexed open roadmap heads, and all 25 sibling roadmap folders supplied in the brief. The generic Koszul, framing and special λ-ring constructions have the owners above; no separate roadmap was found scheduling the three complete support contracts of §§1.9–1.11. Those already required additional results are therefore concrete QWittVectors targets, with their existing generic inputs imported once.

Read-only consumer follow-up: CohomologyComparisonsPartII §0's supplier contract names the former QWittVectors §1.7 commuting-endomorphism construction; it should consume AInfCohomology §AI.1.7 directly. HabiroCohomologyFoundations' references to QWittVectors §§8.1–8.3 still reach the power-series realizations and h-scaled model, with the generic framing owner explicitly identified. No consumer checkout was edited.

All eight works already recorded under their existing manifest keys have legal cached extractions. The repairs use the existing wagner, bhatt-scholze, borger, hesselholt, pridham and scholze entries and do not require the additional Wagner paper mentioned in the review. No source was missing, no key was renamed, and the source manifest was outside the authorized edits.

Relevant native definitions were inspected at the pins, not inferred from names:

| Pinned interface | Definition or hypotheses inspected | Consequence for this repair |
| --- | --- | --- |
| Mathlib/RingTheory/Etale/Basic.lean:46, :205 | FormallyEtale requires vanishing Kähler and H¹-cotangent modules; Etale adds finite presentation. | A finite module is not required: localization frames remain included. |
| Mathlib/RingTheory/PowerSeries/Basic.lean:76, :139, :942; Inverse.lean:109 | Coefficients, constant-coefficient ring map, coefficientwise scalar action and the constant-coefficient unit criterion. | The algebra equivalence fixes h; filtration continuity follows from preserving its powers, with no extra analytic-topology assumption. |
| TauCeti/RingTheory/Kaehler/FormallyEtale.lean:57, :67, :71 | The scalar tower and formally étale map transport an existing basis, with its actual basis vectors. | The realization uses the supplied coordinate basis and its exterior powers. |
| Mathlib/RingTheory/WittVector/Defs.lean:53; Truncated.lean:61, :270 | The carriers have coordinates ℕ→R and Fin n→R; prime and commutative-ring hypotheses supply their p-typical ring operations. | Neither is a big-Witt or all-prime coalgebra carrier; no p-typical construction is duplicated. |
| Mathlib/RingTheory/WittVector/Basic.lean:244, :267, :287, :299; Frobenius.lean; Verschiebung.lean; Teichmuller.lean | Prime-indexed ring, coefficient-map, ghost, Frobenius, shift and Teichmüller operations retain their displayed coefficient hypotheses. | These are the §1.5 comparison inputs, rather than an all-prime replacement. |
| Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:337, :357; Expand.lean:38, :87, :131, :145 | Positive-index divisor products, integral prime expansion and characteristic-p power identities have distinct hypotheses. | [p^α]_q and its factors are polynomials; no quotient-ring division is used. |
| TauCeti/RepresentationTheory/Homological/ContCohomology/Bockstein/Basic.lean; Integral.lean:136 | The existing maps concern continuous group cohomology and integral coefficient boundaries. | They do not replace the associative-DGA regular-parameter theorem. |
| TauCeti/Algebra/Module/GradedModule/KoszulTensor.lean:42 | The native construction is a sign automorphism of a graded tensor product. | It supplies no competing complex of arbitrary commuting endomorphisms. |

No declaration in Suggested.lean has a supplier's fully qualified declaration name. The two additions to its module docstring name the special λ-ring/coalgebra equivalence and prismatic iteration and explain their missing carriers, rather than introducing substitute theorems or data.

## Elaborated signatures

A single scratch file elaborated `#check @name` for all four declarations after the docstring changes. Comparing those types with the README found no lost binders and required no signature change:

| Declaration | Elaborated context and README agreement |
| --- | --- |
| BigWitt.TruncationSet | A structure in Type, with positive natural indices and positive-divisor closure; the empty set is permitted. |
| BigWitt.ghostPolynomial | Arbitrary universe, explicit CommRing R, n:ℕ and coordinate function ℕ→R. The README distinguishes this unital acceptance-test definition from the later nonunital construction. |
| BigWitt.ghost_image | Explicit CommRing R, S, all prime Frobenius lifts and their congruence hypothesis survive; the congruence conclusion quantifies over n∈S and p dividing n. No commutation or torsion-free assumption was inserted. |
| QWitt.framedGamma_existsUnique | Both universes, CommRing A/R, Algebra A R, the polynomial Algebra instance, scalar tower, Algebra.Etale and i:Fin r survive. The automorphism is over PowerSeries A on the full PowerSeries R carrier, with the constant and coordinate equations stated in §8.1. |

## Adversarial mathematics record

The rows cover the repaired mathematical statements and their API laws, imported conventions whose ownership changed, the retained acceptance-test declarations, and the affected downstream comparisons. Finite polynomial and congruence calculations were evaluated explicitly; infinite-limit rows give the compatible residues and the obstruction to a lift. Tests provide witnesses and negative controls, not proofs of the general roadmap targets.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Positive truncation-set definition | ∅, Div(1), Div(6), {2} | ∅ has 0 members; Div(1)={1}; Div(6)={1,2,3,6}; {2} omits divisor 1 | First three admitted; last excluded | Retained native definition |
| Ghost-polynomial definition | n=0,1,2,6; coordinates all 1 | w₀=0 (empty divisor sum); w₁=1; w₂=3; w₆=12 | Positive-index formulas agree; n=0 outside theorem hypotheses | Retained |
| Ghost-image equivalence, both directions | ℤ, Div(2), φ₂=id | (1,1)↦(1,3), difference 3−1=2∈2ℤ; b=(0,1) has difference 1∉2ℤ and no integral preimage | Both directions distinguish a nonimage | Retained |
| Ghost-image equivalence with torsion | ℤ/2, ℤ/3, ℤ/4; Div(1), Div(2), Div(3), Div(4), Div(6); φ=id | Exact image and congruence-set cardinalities respectively (2,2,4,2,4), (3,9,3,27,9), (4,8,16,8,64) | Sets equal in all 15 finite instances | Retained hypotheses; no torsion-free restriction |
| Ghost injectivity boundary | 𝔽₂, Div(2) | x=(0,1)≠(0,0) but both ghosts are (0,0) | Ghost-only construction rejected | Used in integral bridge audit |
| Imported Koszul sign | D₁=∂X, D₂=∂Y on ℤ[X,Y] | d⁰(XY)=(Y,X); d¹(Y,X)=1−1=0; two plus signs give 2 | Correct cochain sign retained | Direct AInf supplier |
| Imported Koszul commuting hypothesis | M=ℤ², D₁(u₂)=u₁, D₂(u₁)=u₂, other values 0 | (D₁D₂−D₂D₁)(u₁)=u₁≠0 | Noncommuting operators excluded | No duplicate local construction |
| Koszul scalar-dual and rank boundary | M=ℤ, r=1, D=2; r=0; M=0 | Cochain [ℤ --2→ℤ] has H⁰=0,H¹=ℤ/2; chain model has H₀=ℤ/2; r=0 gives M; M=0 gives 0 | Grading and zero cases agree | Supplier convention fixed |
| §1.9 degreewise/derived h-completion | [ℤ[h] --h→ℤ[h]] | Both h-completed cohomologies are (H⁰,H¹)=(0,ℤ); terms become ℤ[[h]] | Equal | Concrete local stage |
| §1.9 cohomology and (p,h)-completion | Same complex, p=2,3 | H¹ after completion is ℤ₂ or ℤ₃; completion of H¹=ℤ gives the same | Equal | All primes retained |
| §1.9 unbounded degree-dependent bounds | M^i=ℤ[h]/h^(i+1), d=0, i=0,1,2,… | Bounds 1,2,3,…; h-completions unchanged; (p,h)-values ℤ_p, ℤ_p[h]/h², ℤ_p[h]/h³,… | No uniform bound exists or is needed | Generality retained |
| §1.9 preservation and mod-p comparison | Same modules, p=2,3 | h-torsion bound i+1 before and after; mod-p module 𝔽_p[h]/h^(i+1) on both sides; p-kernel 0 | Equal | Hypotheses carried explicitly |
| §1.9 units and naturality | Identity and zero maps on the preceding two-term complex | Induced H¹ maps are id_ℤ or 0 before h-completion and id_ℤ or 0 after; (p,h)-values id_ℤp or 0 | Equal | Unit and map compatibility stated |
| §1.9 distinct completion ideals and zero input | ℤ[1/p] with h=0; M=0 | h-completion ℤ[1/p], (p,h)-completion 0; zero input gives 0 on both sides | Ideals distinguished | Negative-control Check |
| §1.10 Bockstein definition and sign | P=ℤ[x]⊗Λ(u), dx=2u, du=0, f=2 | β₂[x]=[u]; quotient differential sends x to 0 | Nonzero β distinguished from the quotient differential; the integral sign is tested by β_h(T)=dT below | Additive supplier reused |
| §1.10 lift independence | Same P, lifts x and x+2x² | d(x+2x²)/2=u+4xu≡u mod 2 | Equal classes | Explicit regular-parameter target |
| §1.10 square zero | Same P | β₂²[x]=β₂[u]=0 | Equals 0 | Retained additive law |
| §1.10 product rule | Same P, degree-zero x | β₂[x²]=2[xu]=0; β₂[x]x+xβ₂[x]=2[xu]=0 | Equal | Multiplicative extension |
| §1.10 signed product rule on odd input | dx=2u, du=0, a=u,b=x | β₂[ux]=0; β₂[u]x−uβ₂[x]=−u²=0 | Equal, including at two | Strict odd square used |
| §1.10 noncommutative product rule | Matrix DGA, dx=3u, f=3 | β₃[x²E₁₁]=2xuE₁₁; uE₁₂·xE₂₁+xE₁₂·uE₂₁=2xuE₁₁ | Equal and nonzero mod 3 | Associative generality retained |
| §1.10 parameter change | dx=4u; f=4,g=2,a=2 | Fβ₄V[x]=2u mod 2=0=β₂[x]; Fβ₄[x]=u≠0 | V factor essential | Computed regression |
| §1.10 parameter maps compose | f=12,g=6,k=2 | V₂→₆ multiplies by 3; V₆→₁₂ by 2; composite by 6=12/2 | Equal | Composition included |
| §1.10 regularity and unit boundary | f=0 on ℤ; f=1 | ker(0:ℤ→ℤ)=ℤ≠0 excludes f=0; P/1=0 and β₁=0 | Domain of construction respected | No division by zero |
| §1.10 naturality | P→P, x↦2x,u↦2u, dx=2u | β₂[2x]=[2u]=0; image of β₂[x] is [2u]=0 | Equal | Same-parameter DGA maps |
| §1.11 least differential ideal | dx=u in ℤ[x]⊗Λ(u), relation x | d(x)=u∉(x); differential closure (x,u); quotient ℤ with d=0 | Algebra ideal alone fails | New quotient stage |
| §1.11 quotient DG laws | Same P, J=(2) | d[x]=[u], d²[x]=0; d[x²]=2xu=0 in characteristic two, matching d[x]x+x d[x] | Equal | Differential descends |
| §1.11 universal factorization | Augmentation P→ℤ, x,u↦0 | Closure (x,u) maps to 0; quotient map ℤ→ℤ sends 1↦1 and is unique | Universal map computed | Source and target specified |
| §1.11 zero/whole ideals | J=0 and J=P | Quotients P and 0; induced projections id and zero | Correct boundary cases | Checks retained |
| §1.11 two-sided and associative hypotheses | ℤ⟨x,y,z⟩, d=0, J=(x) | xy=yx=0 in quotient; yz and zy remain distinct basis words | Left ideal or commutative quotient rejected | Generic associative target |
| §1.11 strict odd alternation | Exterior u, quotient by (2) | u²=0 remains 0; signed symmetry alone gives 2u²=0 and imposes no such value | Stronger condition retained | Characteristic-two Check |
| §2.1a forward definition | Toric line l | σ_t(l)=(1−lt)⁻¹; σ_(−t)(l)⁻¹=1+lt; λ²(l)=0 | Correct inverse/sign order | Integral bridge added |
| §2.1a inverse constructions | Line l and n=2 in ℤ | Inverting λ_(−t) gives (1−lt)⁻¹ or (1−t)⁻²; γ_∞ inverse recovers τ(l) or s(2) | Both composites identity | No Adams-only substitute |
| §2.1a sum, unit and zero laws | 1+1=2; n=0,1 | σ₂=1+2t+3t²+4t³; λ₂=1+2t+t²; λ₁=1+t; λ₀=1 | Sum and special unit values match | Shared special structure reused |
| §2.1a virtual-negative sign | n=−1 | σ_t(−1)=1−t; λ_t(−1)=1−t+t²−t³+⋯ | Inverse-series law matches | Negative-input Check |
| §2.1a integral product identity | Two sums of two independent line elements | Product λ² polynomial at ranks (2,2) is 2²·1+1·2²−2·1·1=6; λ²(4)=6 | Equal with integral coefficients | Supplier product polynomial used |
| §2.1a integral iteration identity | Rank-four class | λ²(λ²(4))=λ²(6)=15; 4·4−1=15 | Equal | Supplier composition polynomial used |
| §2.1a Newton/ghost agreement | n=2, x=2 and a line l | ψ₂(2)=4−2·1=2=w₂s(2); ψ₂(l)=l²−2·0=l²=w₂τ(l) | Equal | Integral recurrence, no division |
| §2.1a torsion information | A=ℤ[ε]/(2ε,ε²) | V₂τ(ε)≠0; all ghosts 0; γ_∞=1+εt²≠1 | Ghost-only inverse rejected | Torsion-sensitive bridge |
| §2.1a quotient example is admissible | Toric ℤ[x], ideal (2x,x²) | λ_t(2x)=1+2xt+x²t²; λ_t(x²)=1+x²t; positive coefficients lie in the ideal | Ideal is λ-stable | Torsion example justified |
| §2.1a morphisms and Adams naturality | ℤ[l]→ℤ, l↦1 | λ_t(l)↦1+t=λ_t(1); ψ₂(l)↦1=ψ₂(1); γ_∞τ(l)↦(1−t)⁻¹ | Equal | Morphism equivalence specified |
| §2.1a zero ring and excluded characteristic two | A=0; proposed A=𝔽₂ | Zero ring has one series/coaction; in 𝔽₂ sum law forces λ²(0)=1 while λ²(0)=0 | Zero accepted; 𝔽₂ rejected | Unit law prevents wrong model |
| §5.3 completed relative comparison | R=A=ℤ, m=2,p=2,3 | Both completed rings ℤ_p[q]/(q²−1); at m=1 both are R̂_p | Equal | Right completion retained |
| §5.3 uncompleted-relative negative control | Infinite-variable A, B=Â₂ | Residues for n=2,3,4 are 2e_T₁; 2e_T₁+4e_T₂; 2e_T₁+4e_T₂+8e_T₃; every newly appearing coefficient is nonzero at its stage | No finite-support lift, hence quotient not complete | Regression added |
| §5.3 derived-completeness obstruction | Same V₂ sequence | Kernel B is complete; quotient ⊕_e B has torsion kernel 0 and the displayed missing limit | Complete middle would force complete quotient, a contradiction | Blanket absolute inheritance removed |
| §5.3 retained torsion hypotheses | A=ℤ,R=ℤ/4,m=1 | 2≠0 but 2·2=0 in Q₁=ℤ/4 | Perfect coverage does not remove coefficient torsion | Prime-specific hypotheses retained |
| §8.1 completed-source realization | Polynomial frame, arbitrary A; h²=0 | D[T]/h²=A[T]⊕hA[T]=A[T][[h]]/h² | Same two coefficient terms | Supplier specialization |
| §8.1 quotient completeness and regularity | R=A[T], A=ℤ/4 or 𝔽₂ | In P/(hT), constant T survives and hT=0; higher coefficients reduce modulo T; hT·f=0 forces every coefficient of f to be 0 | Closure quotient and wrong P/(T) model separated | Hypotheses verified |
| §8.1 automorphism normalization and inverse | γ on T² and T⁻¹ | γ(T²)=(1+2h+h²)T²; γ(T⁻¹)=(1−h+h²−⋯)T⁻¹; inverse scaling sends T to (1−h+h²−⋯)T | γγ⁻¹(T)=T | Native headline preserved |
| §8.1 characteristic-two/nilpotent coefficients | A=ℤ/4, A=𝔽₂ | T² coefficient triples (1,2,1) or (1,0,1) in h | Both equal q²T² | General base retained |
| §8.1 inseparable nonframe | 𝔽₂[T]→𝔽₂[Z], T=Z² | h coefficient of γ(Z)² is 0; h coefficient of (1+h)Z² is Z²≠0 | Excluded by étaleness | Negative control retained |
| §8.1 maps and coordinate injections | A[X]→A[X,Y], X↦X | Both paths send X to qX; extra γ_Y sends X to X | Equal | Imported naturality transported |
| §8.2 divided difference and specialization | T, T², T³; q=1 | D-values 1,(1+q)T,(1+q+q²)T²; at q=1:1,2T,3T² | Coordinate Kähler derivations match | Shared derivative reused |
| §8.2 relative scalar convention | A=ℤ[U], R=A[T] | D(U)=0; D(UT²)=U(1+q)T | Base held fixed | Relative Check added |
| §8.2 two Leibniz presentations | f=g=T | D(T)T+γ(T)D(T)=T+qT=fD(T)+γ(T)D(T) | Equal; discrepancy formula −hT+hT=0 | Supplier presentations reconciled |
| §8.2 inverse and zero exponent | T⁻¹; 1 | D(T⁻¹)=−q⁻¹T⁻², giving −1/18 at q=2,T=3 on both sides; D(1)=0 | Correct sign; no T⁻¹ at exponent zero | Localization retained |
| §8.3 Kähler-term and product transport | Rank 0,1,2 | Terms R[[h]]; R[[h]]dT; R[[h]]dX∧dY, with dY∧dX=−dX∧dY | Ordered bases agree | Explicit carrier transport |
| §8.3 h-scaled differential | f=T²; h=0 | d_C=(1+q)T dT, d_H=(q²−1)T dT; reductions 2T dT and 0 | Two models distinguished | Only scaled construction owned here |
| §8.3 skew DG Leibniz and square | f=T²; coordinate dT | dT·T+T·dT=(q+1)T dT=d_C(T²); dT²=0 | Central forms would give 2T dT | Supplied skew product reused |
| §8.3 coordinate-map restriction | X,Y↦T | Source d(XY) maps to 2T dT; target d(T²)=(1+q)T dT | Not a termwise chain map in general | Merging coordinates excluded |
| §8.4 δ-frame and coefficient twist | A=ℤ[U], p=2,3 | φ(U)=U² or U³; modulo p these equal U^p; φ(h)=2h+h² or 3h+3h²+h³ | Base and q maps fixed | Supplier hypotheses verified |
| §8.4 Frobenius on C versus H | p=2, input T | C form factor (1+q)T; H form factor T; both H chain paths on T give (q²−1)T dT | Equal chain paths; distinct form factors | Scaled Frobenius remains local |
| §8.4 twisted product compatibility | p=2, dT·T=qT dT | C paths give q²(1+q)T³dT; H paths give q²T³dT | Equal in each model | Product transport required |
| §8.4 semilinear one-form transport | p=2, input U dT | H sends to U²T dT; C sends to U²(1+q)T dT | Right coefficient twist visible | Nontrivial-base Check |
| §8.4 infinitesimal q convention | h²=0, p=2, then mod 2 | φ(h)=2h, then 0; q-fixed convention gives h | Wrong convention excluded | Square-zero Check |
| §8.4 injectivity versus smooth linearization | R=A[T], mod p | T^p image exponents are divisible by p; T has no preimage | Injective is not surjective | No smooth Frobenius shortcut |
| §9.5a q-PD versus prism ideals | p=2,3 | δ(h)=h or h+h²; γ(h)=0 or −h²; δ([2]_q)=−q≡1 mod(q+1) | q-PD stability and distinguished generator verified | Separate ideals explicit |
| §9.5a bounded quotient and smooth input | A=ℤ[U], p=2,3 | D/I is Â₂ or Â₃⊕Â₃h as module; p-torsion kernel 0; polynomial S^(1) has 1 free differential coordinate | Required rank p−1 and p-regularity | General base checked |
| §9.5a completed Frobenius flatness | D with p=2,3, reduce source (p,h) along φ | Target reductions (A/p)[h]/h² or (A/p)[h]/h³, with coefficient ψ_p; bases 1,h or 1,h,h² after coefficient change | Complete flatness uses flat ψ_p | Explicit scalar check |
| §9.5a α=0 and one-step iteration | p=2, α=0,1 | J₀=1, f₀=h; J₁=q+1=h+2, hJ₁=q²−1 | Identity and first step agree | General-base stage precedes induction |
| §9.5a all-α product | p=2,3, α=2 | (1+q)(1+q²)=1+q+q²+q³; (1+q+q²)(1+q³+q⁶)=∑_(i=0)^8q^i | [4]_q and [9]_q, respectively | Iteration has the full product |
| §9.5a iterated coefficient and form maps | A=ℤ[U], p=2, α=2 | φ²(U)=U⁴; φ_C²(dT)=(1+q)(1+q²)T³dT | Matches ψ₄ and [4]_q | Single-twist replacement rejected |
| §9.5a η-model identity | Rank one, f=hJ; degree one z=Jb with appropriate cycle condition | h·z=hJb=fb; d_H(h^kz)=h^(k+1)d_Cz | Same divided-differential condition and chain equation | Degreewise h^k map explicit |
| §9.5a Bockstein reduction | α=0 and p=2, α=1 | d_H(T)=h dT gives β_h[T]=dT; d_H(T²)=h(h+2)T dT gives β_f[T²]=T dT | Plus sign and nonlinear Frobenius match | Nonflat reduction uses Bockstein |
| §9.5a twisted localization algebra | p=2, k=𝔽₂(U) | Framed H⁰=k[X,(X−U)⁻¹]; twisted S^(1)_k=k[Y,(Y−U)⁻¹], Y↦X | Isomorphic k-algebras | ψ₂ twist retained |
| §9.5a untwisted negative control | Same localization | Untwisted units generate k[T²,(T²−U)⁻¹], which omits T; Laurent target is generated by units | Not isomorphic as k-algebras | Multiplicativity explicitly required |
| §9.5a zero rank and invertible prime | R=A; A=ℤ[1/p] | S^(1)=D/I and Ω¹=0; after p-completion of A=ℤ[1/p], D=P=Δ=0 | Both boundary cases valid | No good-prime restriction |
| §9.6(c) scalar propagation | p=2, α=0,1,2, A=ℤ[U] | Source U maps to U,U²,U⁴; form factors from the preceding rows | Matches ψ_(p^α) throughout | Route updated |
| §9.7 all-index scalar factors | p=2,m=6; p=3,m=2 | First case twists ψ₂,ψ₆ and factors q²−1,q⁴+q²+1; second twists ψ₁,ψ₂ and factors q−1,q+1 | Existing twists agree with repaired route | Retained without narrowing |
| Downstream §6 q-fixed convention | A=ℤ, étale R=ℤ×ℤ, p=2 | φ₂ coefficients identity; q maps to q, while framed φ sends q to q² | Different maps remain distinguished | Completed coefficient comparison retained |

## Validation outcomes

Commit: `a04ce9b0` — QWittVectors: review repairs (completion, Frobenius twists, and supplier ownership). The worktree is clean; no push was made.

`lake build TauCetiRoadmap.QWittVectors.Suggested` exited 0. Its exact output was:

```text
⚠ [8976/8976] Replayed TauCetiRoadmap.QWittVectors.Suggested
warning: TauCetiRoadmap/QWittVectors/Suggested.lean:78:8: declaration uses `sorry`
warning: TauCetiRoadmap/QWittVectors/Suggested.lean:98:8: declaration uses `sorry`
Build completed successfully (8976 jobs).
```

The required dependency-direction check exited 0 and produced exactly:

```text
depcheck: 26 roadmaps, 230 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line and no merge-order move.

The required gate against origin/main exited 0. Its exact summary line was:

```text
gate QWittVectors: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
