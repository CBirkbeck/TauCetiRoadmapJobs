# Repair findings

Pass a establishes no new package finding. Pass b establishes one new finding, F01 (also called S01 in its retrospective table); it is settled below. Both reviews explicitly preserve the earlier disposition of b F05. Their tables retest earlier findings rather than raise them anew.

## F01 (P3) — applied

Implicit use of a module totalization bound for sheaves → explicit application after derived sections on every étale affinoid, followed by sheafification. Repaired the EnhancedDerivedSheaves supplier contract, §§7.4–7.5 routes, both Needs lines and Layer 7 Dependencies. Added lower-bound and cohomology-sheaf controls in §7.4; retained all existing Check values. No Lean declaration or supplier gap is needed.

## Mathematical evidence

EnhancedDerivedSheaves §E5:animation.3 on main states the bound for spectra and D∞(R), with r≥max(0,b−k+1) and π_k=H⁻ᵏ. Substitution b=0 and k=−i gives r≥i+1. The supplier does not state this directly for the derived category of étale sheaves. BH line 780–782 uses precisely that sheaf-valued instance in the proof of Theorem 3.10, printed p.18. The finding is therefore a missing justification of the application, not a false truncation bound.

Here is the bridge at the required generality. For constant coefficients Λ=ℤ/n and an étale object j:V→Y, extension by zero after the constant-sheaf functor on V gives an exact left adjoint to sections on V. Its enhanced derived right adjoint is RΓ(V,−), so RΓ(V,−) preserves all the limits defining Tot and Tot_r. It preserves the cohomological lower bound zero because it derives a left-exact functor. Composition of direct images on the slice gives RΓ(V,Rf_{q,*}Λ)=RΓ(X_q×_Y V,Λ), without any appeal to proper base change. These adjunctions and composition comparisons are supplied by EnhancedDerivedSheaves §§0.1–0.4 and E1.1.

For a bounded-below sheaf complex K, choose a bounded-below injective resolution I. The presheaf V↦Hⁱ(I(V)) computes V↦Hⁱ(RΓ(V,K)); its associated sheaf is Hⁱ(I)=Hⁱ(K), since sheafification is exact. Apply this to the canonical map Tot F•→Tot_{i+1} F•. The module comparison on every étale affinoid therefore yields the claimed comparison of cohomology sheaves, naturally in F•. No exactness of sections on an affinoid, nor commutation of stalks with infinite limits, is asserted.

In §7.5 the two diagrams after taking RΓ already lie in D≥0(𝔽_p). Apply the same module bound directly on both sides of the canonical scalar-extension map. BH line 1102–1117 supplies the field-extension theorem and its smooth-toric comparison input; the existing smooth proper hypercover route retains the singular proper case.

The pattern search covered every occurrence of totalization, Tot, E5:animation.3 and the i+1 cutoff. The supplier paragraph, §§7.4–7.5, their Needs lines and Layer 7 Dependencies now distinguish the module theorem from its application to sheaves. The nodal-curve worked example uses the same finite cutoff and retains its computed values.

## Adversarial mathematics pass

Write O=O_C, R=O/p, a=ζ_p−1 and Λ=ℤ/n. Shifts are cohomological. In the tables, an unchanged value means the existing mathematical statement and its Check are retained; the change column identifies the repaired arguments separately. Negative controls are outside the indicated hypotheses.

| Statement | Instances tried | Computed values on the two sides | Result; change |
| --- | --- | --- | --- |
| Module bound used in the supplier contract | i=0, normalized Λ→Λ by id in degrees 0,1 | H⁰(Tot)=0=H⁰(Tot₁); H⁰(Tot₀)=Λ | i+1 is necessary; module domain explicit. |
| Module bound at the next degree | i=1, normalized Λ→Λ by id in degrees 1,2 | H¹(Tot)=0=H¹(Tot₂); H¹(Tot₁)=Λ | i+1 retained in both routes. |
| Lower-bound hypothesis | n>1; normalized N²=Λ[2], all other normalized terms zero | H⁰(Tot)=Λ, H⁰(Tot₁)=0; H⁻²(N²)=Λ≠0 | Excluded negative-control Check added. |
| Derived sections preserve limits | Constant diagram Λ on a point; constant diagram Λ on ℙ¹_C | Point: RΓ(Tot)=Λ=Tot RΓ. ℙ¹: both have H⁰=Λ, H¹=0, H²=Λ(−1) | Adjunction justifies all limits; no section acyclicity assumed. |
| Derived sections preserve the lower bound | Rf_*Λ for a point inclusion; zero coefficient ring n=1 | RΓ(V,Rf_*Λ) has H⁰=Λ if V contains the point, zero if disjoint, and Hʲ=0 for j<0; n=1 gives zero throughout | Composition on slices gives the required module diagrams. |
| Sheafifying hypercohomology | Constant sheaf diagram on ℙ¹_C, n>1 | H²(RΓ(ℙ¹,Λ))=Λ(−1), but H²(Λ_Y)=0 and the associated sheaf of V↦H²(RΓ(V,Λ)) is 0 | New Check separates groups from sheaves. |
| Naturality and zero objects in the bridge | Zero map of constant Λ diagrams; identity of the zero diagram | Induced maps are 0 on both stabilized groups; for Λ=0 all groups are 0 and the comparison is 0→0 | Canonical comparison, no chosen isomorphism or nonzero-ring restriction. |
| §7.5 module cutoff before and after extension | Point; ℙ¹; rational proper curve with one split node | Point: Λ in degree 0 on both sides. ℙ¹: ranks (1,0,1). Node: H⁰=Λ, H¹=Λ, H²=Λ(−1) on both sides | Direct use in D≥0(𝔽_p); existing values retained. |
| Valued-field and reduction conventions | K=𝔽₂((t)); K=C; π²=p in a ramified quadratic field | Quotient levels are O_K/t, O_K/t² and O/p, O/p² respectively; π≠0 but π²=0 modulo p, while π=0 in the residue field | Unchanged; no division by p in equal characteristic. |
| Almost-zero convention | O/p and O/𝔪_C; 0<v(ε)<v(p) | ε·1≠0 in O/p, whereas every ε∈𝔪_C kills O/𝔪_C and its almostification is 0 | Unchanged; single-scalar torsion is distinct. |
| Shift and Tate conventions | ℙ¹ and the point class | H²(Λ[−2])=Λ, H²(Λ[2])=0; twisted point trace=1 | Unchanged; global shift −2d. |
| Sign and orientation conventions | Two surface coordinates; p=2 | Swapped wedge=−original wedge, swapped scalar trace=−original trace; modulo 2 both signs reduce to +1 | Unchanged; integral sign retained. |
| Left/right conversion | S₃ with g=(12), h=(23); cyclic group | (gh)⁻¹=(132)=h⁻¹g⁻¹, while gh=(123); in a cyclic group both products commute | Unchanged; inversion is an anti-involution. |
| §0.1 Almost coherent categories | O; O/𝔪_C; completed infinite free sum | O has one generator; (O/𝔪_C)ᵃ=0; fixed ε leaves infinitely many independent εe_j modulo p in the infinite sum | Almost finite generation discriminates these objects; unchanged. |
| §0.2 Affine and proper comparison, Hom bounds | RHom(O,G) for a negative infinite tail; formal ℙ¹ with O, O/p, O(−2) | RHom(O,G)=G is not bounded below. The three pairs (H⁰,H¹) are (O,0), (R,0), (0,O); generic pairs are (C,0), (0,0), (0,C) | Correct variance and integral information; unchanged. |
| §0.3 Almost proper duality | Identity modulo p and p², with A=B=O/p; split two-point map; smooth curve | Ext¹_R(R,R)=0; Ext¹_{O/p²}(O/p,O/p)=O/p; counit (1,0)↦1; f!O=Ω¹[1] in degree −1 | Base ring and shift retained; unchanged. |
| §0.4 Nearby complexes | Point; smooth two-torus; square-zero thickening | Point: A=Oᵃ, K=Rᵃ in degree 0; torus ranks (1,2,1); Cε is p-divisible so (O⊕Cε)/p=O/p and its p-completion kills ε | Almost amplitude and nilpotent control agree; unchanged. |
| §0.5 Generic fibre | O; O/p²; lattice pO | Localizations are C, 0, C respectively on both descriptions | Exact generic-fibre statement; unchanged. |
| §1.1 Formal dualizing complexes | Point; smooth surface; line over 𝔽₂((t)); completed ℤ_p[pT,T²,T³] | Dualizing generators have degrees 0, −2, −1. In the last example x=pT survives modulo p but x²=xT²=xT³=0, giving an embedded point | Full complex, not just its bottom sheaf; unchanged. |
| §1.2 Étale and algebraic comparisons | U=2T at odd residue characteristic; n=0,1; identity | Both bottom transitions multiply by 2; reductions are modulo ϖ and ϖ²; identity transition=1 | Unchanged. |
| §1.3 Gluing kernel | U=X; empty U at Spf O_K; pair (1,0) | Kernel for U=X is {(s,s)}≅F; empty U gives K for F=O_K; restriction difference on (1,0) is 1 | Compatibility and map direction fixed; unchanged. |
| §1.4 Reflexive Hartogs | Smooth affine with U=X; point with U empty; node uv=ϖ | Recovery gives O in the first case; empty-open recovery gives C≠O; a dense residue open must meet both nodal branches | Density and reducedness retained; unchanged. |
| §1.5 Bottom trace | Identity; split r points; r=p | Tr(1)=1 for identity, Tr(e₁)=1 and Tr(unit)=r; at r=p the last value reduces to 0 | Unnormalized counit; unchanged. |
| §1.6 Generic canonical line | Point; torus; coordinate U=T⁻¹ | Unit↦unit; dlog T↦canonical generator; dlog U=−dlog T on both descriptions | Unchanged in either characteristic. |
| §1.7 Coherent trace | S=Tʳ with r≠0 in K; r=p in characteristic p; ramified point over ℚ_p | Pullback dlog S=r dlog T, trace dlog T=dlog S, composite=r. In characteristic p derivative=0, so excluded; O_{ℚ_p(√p)}/p has nonzero square-zero π | Étale and algebraic-closure hypotheses distinguish controls; unchanged. |
| §2.1 Torsion-free quotient and exterior cup | O⊕O/p²; degree-one square at p=2 | Torsion-free quotient=O; 2x²=0 and 2-torsion-freeness imply x²=0 | Quotient, not torsion submodule; unchanged. |
| §2.2 Cotangent maps | Point; smooth one- and two-dimensional charts | Ω¹(point)=0; image lattices are aR̃¹ and a²R̃², not R̃¹ and R̃² | Intrinsic twist scaling retained; unchanged. |
| §2.3 Smooth integral inverse | n=0; smooth curve; p=2 | Degree-zero maps=id; curve ranks (1,1,0); a=−2 at p=2 and aⁿΨ′ⁿ(x)=ι_n((Φⁿ)⁻¹(aⁿx)) on both sides | No division at dimension zero; unchanged. |
| §2.4 Nice models | Polydisc; uv=ϖ; t²=ϖ | Residue rings are polynomial, k[u,v]/uv (reduced), k[t]/t² (nonreduced) respectively | Third model excluded despite smooth generic fibre; unchanged. |
| §2.5 Rational normalization | Coordinate character; identity point; split r cover | jΦ⁻¹Sch(dlog T)=dlog T; extra a gives a⁻¹dlog T; point trace=1, split-unit trace=r | No residual scalar; unchanged. |
| §2.6 Faltings trace | d=0,1; singular special fibre | Point trace=id; smooth curve target ω₀[1][−2]=ω₀[−1] in degree 1; bottom inclusion starts from H⁻ᵈ(ω•)[d] before shift −2d | Shifts and full dualizing object retained; unchanged. |
| §2.7 Pseudo-finite maps | Identity; formal blow-up; positive-dimensional generic fibre | Identity has nearby amplitude [0,d]; blow-up has generic degree 1 with possible exceptional ℙ¹; positive-dimensional generic fibre is not finite | Amplitude is part of the definition; unchanged. |
| §2.8 Finite pro-étale trace | Split p-cover; degree one; split r then s | Tr(unit)=p=0 modulo p, Tr(e₁)=1; degree-one trace=id; composites on unit=rs and on component=1 | No averaging; unchanged. |
| §2.9 Trace square | Identity; split double and p-covers | Both routes give 1, x+y, and p (0 modulo p) respectively; e₁ gives 1 | Same normalization across all layers; unchanged. |
| §3.1 Product-polystable charts | Empty block set; n_i=0; two node blocks; zero parameter | Empty chart=O, d=0; n_i=0 eliminates a coordinate; two nodes have d=2; uv=0 has vanishing two partials at origin and singular generic fibre | Nonzero parameters retained, units allowed; unchanged. |
| §3.2 Root tower | Dimension zero; one torus; p=2 node | Γ=1; Γ=ℤ_p(1); closed-node root fibre has basis 1,x,y and length 3 versus generic rank 2 | No integral finite-flat assertion; unchanged. |
| §3.3 Character multiplication | uv=ϖ; normalized exponents (1,0),(0,1); unit parameter | Common minimum=1; product=ϖ·1; for ϖ=p image=pO≠O, while unit ϖ gives an isomorphism | Parameter factor retained; unchanged. |
| §3.4 Koszul cohomology | Γ=1; Γ=ℤ_p trivial; order-p character | H*(Γ=1)=O[0]; trivial one-generator complex gives H⁰=H¹=O; nontrivial gives H⁰=0, H¹=O/a≠0 | Scalar annihilation distinct from almost zero; unchanged. |
| §3.5 Décalage | Trivial torus; [O→a O]; torsion-free line | Free ranks (1,1); the a-torsion cohomology O/a is removed; O/O[a]=O whereas O/a is torsion | Correct torsion quotient; unchanged. |
| §3.6 Root projection | m=0; one-torus root m=1; n=0 | Projection=id at m=0; τ(1)=1, τ(T^{1/p})=0, τ(T)=T; ordinary positive-stage torus trace of 1=p=0 in characteristic p; n=0 gives field identity | Integral-character projection, not algebra trace; unchanged. |
| §3.7 Root duality | p=2,3 node; m=0; n=0 | At p=2 the fractional branch duals are (u),(v); ker(u)/im(v)=(v)/(v)=0 and ker(v)/im(u)=0. At p=3 the x,x² block is [[0,u],[u,0]] onto the constrained dual. At m=0 or n=0 the adjoint evaluates at 1 to its input | Bijective adjoint and positive Ext vanishing, no false freeness; unchanged. |
| §3.8 Group orientation trace | d=0,1,2; swap two generators | Tr=id at d=0; degree-one generator↦1; swapping two generators multiplies top trace by −1 | Ordered orientation retained; unchanged. |
| §3.9 Continuous-cochain duality | Point; trivial curve; opposite/nonopposite characters; high denominators | Point adjoint b↦b; degrees 0 and 1 multiply to degree 1; χ+(−χ)=0 survives projection, other cosets give 0; v(ζ_{pᵐ}−1)=v(p)/(p^{m−1}(p−1))→0 | Completed sum/product needs small-tail estimate; unchanged. |
| §3.10 Local polystable duality | Point; curve; surface | Point adjoint=id; curve targets ω(−1)[−1] and ω₀(−1)[−1]; surface pairs 0↔2 and 1↔1 with sign −1 on swap | Derived adjoints, not projectivity; unchanged. |
| §4.1 Faltings pairing | Rank 0,1,r at the point; curve | Adjoints have matrices I₀, (1), I_r over Rᵃ; curve local degrees 0 and 1 pair | Both adjoints and coefficient ring specified; unchanged. |
| §4.2 Rig-isomorphism descent | Identity; admissible blow-up | Identity sends 1↦1; blow-up generic map is identity while an exceptional residue fibre can be ℙ¹ | Derived pushforward and counit retain correct map; unchanged. |
| §4.3 Good quotients | G=1; split C_p-torsor; fixed generic point | Fibre sizes 1, p, 1 respectively; last size is not p | Wild torsors allowed, nonfree generic action excluded; unchanged. |
| §4.4 Invariants and orbits | Finite S₃ regular; infinite ℤ regular; trivial C_p over 𝔽_p; C₃ over 𝔽₂ | Finite regular invariants=coinvariants=M; infinite regular invariants=0 but coinvariants=M; H¹(C_p,𝔽_p)=𝔽_p; 3⁻¹=1 over 𝔽₂ | Finiteness and derived operations retained; unchanged. |
| §4.5 Equivariant pushforward and Hom | G=1; C_p; noncommuting S₃; d=1 | Identity comparisons=id; H¹ of trivial C_p coefficients=R; (gh)⁻¹=h⁻¹g⁻¹; ordinary bound 2d=2 | No exact-invariants or d-only ordinary bound; unchanged. |
| §4.6 Good-quotient descent | Split C_p and S₃ torsors | Invariant diagonal=M, coinvariant generator=M; unit trace=p=0 modulo p but component trace=1; S₃ invariant sum has six components | Torsor Shapiro, not norm on an arbitrary trivial module; unchanged. |
| §4.7 General local duality | Point; uv=ϖ; t²=ϖ | Point adjoint=id; node residue has two reduced branches; t²=0 residue has nonzero nilpotent | Niceness excludes the last model; unchanged. |
| §5.1 Global trace | Point; two points at p=2; curve | Trace values 1; (1,1)↦0 and (1,0)↦1; curve top group in degree 2 maps through Rᵃ(−1)[−2] | Summation and shift agree; unchanged. |
| §5.2 Global almost duality | Point; ℙ¹; two points | Point=Rᵃ; ℙ¹ endpoint pairing=1; two-point matrix diag(1,1) has determinant 1 even when trace of unit=0 | No connectedness needed for pairing; unchanged. |
| §5.3 Almost detection and top trace | Zero map 𝔽_p→𝔽_p; identity; two-point sum | Zero map has kernel/cokernel 𝔽_p, extending to nonzero Rᵃ; identity has both zero; sum has one-dimensional kernel | Detection and connected top-trace hypotheses agree; unchanged. |
| §5.4 Mod-p duality | ℙ¹; two points; i=2d+1; characteristic-p ℙ¹ | Endpoint pairing=1; matrix I₂; paired degrees above range give 0 and 0 using integer degree −1; characteristic-p ℙ¹ has H²(𝔽_p)=0 but H⁰=𝔽_p | Mixed-characteristic hypothesis essential; unchanged. |
| §5.5 Finite mod-p local systems | Rank 0,r at a point; C₂ Jordan block over 𝔽₂ | Pairings I₀, I_r; Jordan fixed line=span(e₁) and quotient=𝔽₂; degree-two scalar trace=0 | Odd Sylow-index splitting retained; unchanged. |
| §5.6 p-power duality | n=1,2; ℙ¹; coefficient reduction | Pairing=1 in 𝔽_p and ℤ/p²; Tor₁^{Λ_n}(Λ_n,𝔽_p)=0 but Tor₁^{ℤ_p}(Λ_n,𝔽_p)=𝔽_p | Derived reduction over Λ_n; unchanged. |
| §5.7 Integral/rational traces | Point at every p-level; ℙ¹; ℤ_p/p | Compatible traces of 1 equal 1; point class trace=1 integrally and rationally; localization of ℤ_p/p=0 | Coefficient compatibility retained; unchanged. |
| §5.8 Integral duality | ℙ¹; [ℤ_p→p ℤ_p]; point | Endpoint pairing=1; H¹=𝔽_p, Hom(𝔽_p,ℤ_p)=0 but Ext¹(𝔽_p,ℤ_p)=𝔽_p; point pairing=1 | Derived dual keeps torsion; unchanged. |
| §5.9 Rational duality | ℙ¹; torsion; two points | Pairing (1); (ℤ_p/p)[1/p]=0; two-point matrix diag(1,1), determinant 1 | No collapse to product of total sums; unchanged. |
| §7.1 Constructibility and local boundedness | Point skyscraper; constant sheaf; disjoint points with shifts −j | Stalks Λ on support, 0 off support; constant has identity specialization; lowest nonzero degree −j has no common lower bound | Locally bounded convention retained; unchanged. |
| §7.2 Affinoid algebraization | Structural identity Spec K; rank r; point skyscraper | Unit sheaf maps to Λ, rank-r to Λ^r in degree 0; supported sheaf has stalk Λ at the same closed point and 0 off it | Absolute comparison remains an input; unchanged. |
| §7.3 Finite-cover generators | Point; point in disc; C₂ Jordan block | Finite constant stalk=M; point pushforward stalk=Λ with positive images 0; Jordan representation is extension of two trivial lines | Algebraization/generator ownership retained; unchanged. |
| §7.4 Proper pushforward | Identity; point inclusion; node; two point inclusions; normalized cochains | Identity gives F; point gives skyscraper and R^{>0}=0; smooth hypercover pieces have dimensions 1,0; common smooth open is Y∖{a,b}; normalized tests give 0 at stages 1,2 instead of Λ at stages 0,1 | Sheaf application now proved through derived sections; boundary controls added above. |
| §7.5 Field extension | Point; ℙ¹; Λ=ℤ/p²; split node | Maps preserve 1; ranks (1,0,1); point coefficient ℤ/p² unchanged; node cohomology (Λ,Λ,Λ(−1)) before and after extension | Module-category application explicit; existing values unchanged. |
| §7.6 All-torsion exchange | Identity base map; ℙ¹ at p²; n=1; empty source | Identity exchange=id; H²=Λ(−1) on both sides for ℙ¹; n=1 and empty source give 0→0 | No coefficient restriction introduced; unchanged. |
| §7.7 Constant cohomology sheaf | Proper point; two points; Y=ℙ¹ with Z=point | R⁰=Λ, Λ² respectively; R²pr_*Λ=0 for Z=point although H²(Y×Z,Λ)=Λ(−1) | Sheaf assertion consistent; H remains uncertified. |

The native acceptance declarations were also recomputed individually.

| Statement | Instances tried | Computed values on the two sides | Result; change |
| --- | --- | --- | --- |
| monomialRootAlgebra | p=0,1,2,3; n=0,1 | p=0 gives ℤ[t]/(∏t), p=1 the zero ring; n=0 gives ZMod p; node monomials u,v survive but uv=0 | Definition has a real body and the advertised coefficient generality; unchanged. |
| monomialRootAlgebraCharP | p=0,1,2,3; evaluation at zero | Constant 1 maps to 1 in ZMod p; for p=2, u+u=0; for p=3, 2u≠0 and 3u=0; at p=1 both rings are zero | Quotient kills no additional constants; unchanged. |
| monomialClass | Node exponents (0,0),(1,0),(0,1),(1,1),(2,2) | Values 1,u,v,0,0; product u·v=0 equals the class of (1,1) | Real product in the quotient; unchanged. |
| monomialRootModule | m=0; p=2,m=1; p=3,m=1 | a•x=ax, a²x, a³x respectively; u•1=u² at p=2 rather than underlying multiplication u | Frobenius restriction retained with explicit prime binder; unchanged. |
| monomial_root_duality, projection | Node p=2,m=1, exponent (1,0),(2,0),(3,0),(2,2) | τ(u)=0, τ(u²)=u, τ(u³)=0, τ(0)=0=uv; at n=0, τ(1)=1 and τ(t₀)=0 | All projection equations agree with the quotient; unchanged. |
| monomial_root_duality, adjoint and Ext | Node p=2,3; n=0; m=0 | Branch maps land bijectively in (u),(v); periodic Ext quotients are (v)/(v)=0 and (u)/(u)=0; p=3 matrix [[0,u],[u,0]]; free cases give Hom(A,A)=A and positive Ext=0 | Genuine derived root duality, not a Check promoted to a headline; unchanged. |

For completeness, the algebraic reason the headline survives beyond these low-dimensional controls is as follows. Set q=pᵐ. Write each exponent vector as qf+r with 0≤r_i<q. For a nonzero monomial the support S of r is proper. The residue-vector summand is A/(∏_{i∉S}t_i); its Hom into A is the ideal (∏_{i∈S}t_i). Alternating multiplication by these two complementary products gives an exact periodic free resolution and zero positive Ext. The zero residue vector gives the free summand A. The projection pairing matches r with its coordinatewise negative modulo q and has value ∏_{i∈S}t_i, the generator of that dual ideal. Thus the adjoint is bijective block by block. This also checks that the singular base does not need projectivity. Z line 2825–2838 fixes the source algebra, projection and theorem.

The thirteen existing supplier contracts retain the same slugs and statements in the README and plan. Their boundary controls are recorded separately so they are not mistaken for implemented supplier declarations.

| Contract | Instances tried | Computed values | Result; change |
| --- | --- | --- | --- |
| valuation-formal-proper-mapping | Formal ℙ¹ with O, O/p, O(−2) | (H⁰,H¹)=(O,0),(O/p,0),(0,O); associated sheaves retain these modules | Existing gap, unchanged. |
| reduced-model-cofinality | Split points over C; ramified quadratic point over ℚ_p | C-model residue algebra k×k is reduced; ramified O_L/p has nonzero π with π²=0 | Algebraic-closure restriction retained; unchanged. |
| refined-formal-algebraization | Completion of O_K[T] | Completion=O_K⟨T⟩; relative dimension=1; generic differential module rank=1 | Existing gap, unchanged. |
| finite-formal-quotients | Split regular G-action on G×Spf O | Quotient=Spf O; generic degree=card(G); invariant functions are diagonal O | Finite wild groups included; unchanged. |
| polystable-uniformization-zigzag | Already polystable model | Identity zigzag; one chart; generic degree=1; reduced residue node uv=0 | Existing gap, unchanged. |
| finite-branched-covers | S=Tᵖ over a characteristic-zero disc, with branch locus S=0 | On the punctured disc derivative pT^{p−1}≠0; over S=0 there is one root of multiplicity p | Complement and normalization restrictions retained; unchanged. |
| proper-generic-smoothness | Point inclusion {a}→disc; two such inclusions | Maximal smooth opens Y∖{a} and Y∖{b}; intersection Y∖{a,b} | Proper dense opens belong to the target; existing gap, unchanged. |
| valuation-upper-shriek | Identity; smooth relative curve | id!O=O in degree 0; f!O=Ω¹[1] with generator in degree −1 | Existing gap, unchanged. |
| valuation-duality-amplitude | Smooth point, line, plane | Dualizing generators in degrees 0,−1,−2, within [−d,0] | Existing gap, unchanged. |
| valuation-canonical-reflexivity | Smooth affine chart; reduced normal-crossing chart | Canonical module free of rank 1; double dual map sends generator to itself | Existing gap, unchanged. |
| general-nearby-coherence | Point; smooth two-torus; square-zero thickening | Almost ranks (1), (1,2,1); p-divisible nilpotents give zero in mod-p and completed coefficients | Existing gap, unchanged. |
| integral-toric-field-extension | Constant perfectoid tower over a geometric point | O_C⊗̂_{O_C}O_C′=O_C′ on both sides | Existing smooth-toric contract, unchanged. |
| quasi-excellent-direct-images | Identity; closed point inclusion | Identity direct image=F; closed-point image has stalk Λ on its support and 0 off it, positive images zero | Existing gap, unchanged. |

These controls preserve the prior repaired cases: the p² identity-Hom Check, split degree trace, correct Hom variance, finite-group Shapiro, parent §§2.5/11.2, characteristic-p headline, equal-characteristic Layer 1, i+1 cutoff, general nearby-cycle contract, rank-one stalk domain, quotient indexing and D2.2 attribution. No earlier repair is undone.

## Supplier, ownership and source audit

Read the shapes of TauCetiRoadmap/EnhancedDerivedSheaves/README.md, TauCetiRoadmap/DerivedModuleAlgebra/README.md and TauCetiRoadmap/AdicSpacesPartIII/README.md on main. The change follows the existing supplier/prose/Checks structure and adds no layer or target.

The roadmap service's object search for totalization and sheafification finds the module bound at EnhancedDerivedSheaves §E5:animation.3. That roadmap remains the owner of the generic enhancement, adjunctions and totalization theorem. This package supplies only their application in its own existing proper-pushforward and field-extension proofs. Searches of the board packages and indexed main/open roadmap texts do not require an ownership move. No new Lean name, foundational construction or supplier contract is introduced. Ownership against open pull requests without supplied files was not independently checked beyond the service's indexed object search.

The cross-roadmap references were resolved against main and the indexed open heads. Section locators were inspected in the corresponding supplier texts:

| Supplier | Sections consumed |
| --- | --- |
| PerfectoidSpaces | P0.1–P0.13, P0.29; P3.11–P3.22; P5.9–P5.13.4; P6.5–P6.7, P6.15–P6.16 |
| AdicSpacesPartII | R0–R1, particularly R0.19–R0.20 |
| AdicSpacesPartIII | F0.6–F0.8; R2.2–R2.8; R3.1–R3.8 |
| AdicSpacesPartIIPartII | RZ.0–RZ.5, in packages/AdicSpacesPartIIPartII/design/README.md; the service has no final roadmap README |
| RigidAnalyticGeometry | §§1.1–1.2 |
| ResolutionOfSingularitiesCharacteristicZero | §§7.5, 7.8 |
| SchemeAndStackFoundations | §§0.6, 0.8–0.9, 0.21, 2.18–2.21 |
| DerivedModuleAlgebra | §§0.2, 0.4, 0.8, 0.10–0.17; 1.T.1, 1.1–1.8, 1.E.1, S.1 |
| DerivedDeRhamCohomology | §1.22 |
| EnhancedDerivedSheaves | §§0.1–0.4, E1.1–E1.5, E2:towers.1, E5:animation.3 |
| AInfCohomology | AI.0:integral.1, AI.1.1–AI.1.7, AI.3.1–AI.3.2, AI.4.1, AI.6.1–AI.6.2 |
| PadicHodgeTheory | §§2.1, 2.4, 2.7, 7.2; §2.7 includes singular proper comparison and integral finiteness |
| ArithmeticGaloisDuality | D7.1–D7.3; R02.1.2–R02.2.3 |
| DiamondsAndVStacks | D1.1–D1.6, D1.9–D1.11, D2.2 |
| DiamondEtaleCohomology | C0.1, C0.23, C1.7–C1.12, C2.10 |
| ClassicalAdicEtaleCohomology | §§1.1–1.5(c), 2.5, 3.2, 8.2, 8.4, 9.1, 9.5–9.7, 10.5, 11.1–11.2 |
| HodgeTateAndCanonicalSubgroups | §§7.5–7.6 |
| EtaleCohomologyFoundations | G.1–G.3, F.0, F.3, §§0.5, 0.11 |
| AdicCoefficientsAndComparisons | L2/fp-compactification-limit, L2/fp-strict-cofiltered |

The initial resolver lead for AdicSpace.henselianComparison_bijective_of_spec is not a missing library dependency: it is the planned parent target in ClassicalAdicEtaleCohomology §2.5, sheaf-comparison-3-2-9. The parent text explicitly supplies the name and its torsion coefficient domain. It remains a roadmap import, not a pinned declaration.

The manifest pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The definitions used in the Lean statement were inspected at these pins: iterateFrobenius in Mathlib/Algebra/CharP/Lemmas.lean:327; ModuleCat.restrictScalars in Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean:85; CategoryTheory.Abelian.Ext in Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118. LinearMap.IsPerfPair in Mathlib/LinearAlgebra/PerfectPairing/Basic.lean:39 has the two bijectivity fields and no finite-dimensional or projectivity field. Representation.invariants in Mathlib/RepresentationTheory/Invariants.lean:73 imposes fixedness under every element, not finiteness of the group. Scheme.smallEtaleTopology in Mathlib/AlgebraicGeometry/Sites/Etale.lean:50 has a scheme carrier. TauCeti/RepresentationTheory/Unipotent/PowerOrder.lean:151 and :158 supply the fixed-vector results with nontrivial, finite-dimensional coefficient representation and p-group hypotheses. TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean:243 defines the adic carrier as the full subcategory of sheafy locally affinoid pre-adic spaces.

The changed mathematical argument uses the existing legal cached BH source, especially BH line 764–787 and BH line 1102–1117, and the named enhancement supplier; the algebraic acceptance theorem was compared with Z line 2825–2847. All cited works already have unique keys in sources.toml. No new source was introduced or fetched; H remains settled as uncertified at its published locator and was not requested again.

## Required checks and maintainer notes

- Suggested.lean elaboration: prescribed `lake env lean` invocation from the pinned content checkout completed with exit 0. The sole diagnostic was `Suggested.lean:70:8: warning: declaration uses 'sorry'`, for monomial_root_duality. There are no TauCeti imports to build first.
- Signature check: a scratch copy with `#check @name` for all five declarations elaborated with exit 0. Compared the complete elaborated types with README §3.7. The quotient, characteristic instance and monomial classes keep explicit p,n; the root module and theorem keep explicit p,n,m and Fact p.Prime. No section binder was lost. No signature or README headline needed changing.
- Dependency check: both prescribed-command runs completed with exit 0. The first output was:

```text
depcheck: 53 roadmaps, 607 edges, 0 problem(s)
```

The final run after the README edits returned:

```text
depcheck: 54 roadmaps, 613 edges, 0 problem(s)
```

Neither run emitted an UPWARD, CYCLE or moved line.

- Citation resolution: no cross-roadmap citations found nowhere. Its default run could not inspect pinned Lake packages, so the relevant library declarations and the initial parent-name lead were checked directly as described above.
- Gap consistency: thirteen plan gaps, thirteen README slugs; the sets are equal. design/plan.json, metadata.toml, sources.toml and Suggested.lean are unchanged.
- Whitespace check: `git diff --check` completed with exit 0.
- Formatting gate repairs: the finding heading now uses F01 without a space-containing review prefix; the three flagged README paragraphs (supplier contract and §§7.4–7.5 routes) put braced subscripts in ASCII inline code. No formula or hypothesis changes. No mathematical acceptance or independent-review result is claimed by this repair.
- Formatting recheck: the worker parser recognizes F01 with disposition applied; coverage against both reviews returns no problems. README scans return tex=0 and latex=0. The prescribed Lean elaboration again exits 0 with only the same line-70 sorry warning. The dependency rerun exits 0 with `depcheck: 54 roadmaps, 613 edges, 0 problem(s)` and no UPWARD, CYCLE or moved line. `git diff --check` exits 0. Suggested.lean and all five signatures are unchanged.

Maintainer-owned items persist: the earlier b F05 disposition reserves the PD.6 scope/nodes to the maintainer because only the plan's top-level gaps are editable here. The thirteen supplier gaps remain prerequisites. In particular AdicSpacesPartIIPartII's design lists generic smoothness/flatness among its non-goals; gap:proper-generic-smoothness already records the requested extra supply, and changing that supplier's scope is outside this package. No supplier obligation, declaration name cited by another roadmap or merge-order placement changes in this repair. Only packages/ClassicalAdicEtaleCohomologyPartII/README.md and this report are changed. No commit or external write was made.
