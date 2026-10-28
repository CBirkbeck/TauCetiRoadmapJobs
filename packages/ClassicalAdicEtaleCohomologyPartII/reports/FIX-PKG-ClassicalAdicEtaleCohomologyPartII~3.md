# Repair report: ClassicalAdicEtaleCohomologyPartII

## F01 (P1) — applied

Undeclared coherent formal proper mapping → gap:valuation-formal-proper-mapping, assigned to AdicSpacesPartIII §§R2.2–R2.8 in both required locations. Updated §0.2’s route and Needs, §0.5’s comparison route, Layer 0 dependencies and the AC manifest locator. Added four integral boundary Checks. The almost proper-mapping target and its generality are retained.

## Mathematical evidence and ownership

AC Theorem 5.1.5, pp.116–117, AC line 4990, gives both coherent cohomology modules and their associated-sheaf comparison with higher direct images. AC Theorem 5.1.6, AC line 5009, is the separate almost theorem. Its proof invokes the coherent result for the approximations at AC line 5058 and again for completed localization at AC line 5070. Accordingly the repair names both conclusions of the coherent input, rather than treating module finiteness alone as sufficient.

The valuation-ring generality is legitimate. AC Set-up 4.5.1, AC line 4037, requires completeness, topological universal adhesiveness and torsion-freeness, together with an almost setup. AC line 2426 and AC line 4040 identify the complete valuation-ring examples. For the ordinary coherent theorem the almost ideal can be the unit ideal: its square and tensor square are the ring itself. Thus the contract does not require algebraic closedness, mixed characteristic, a discrete valuation or torsion-free coefficients. The admissible formal source and target, properness and topological finite presentation remain explicit.

AdicSpacesPartIII on content main has the following boundaries:

- `TauCetiRoadmap/AdicSpacesPartIII/README.md:2731`, F0.6: the coherent formal-module statement imposes local Noetherianity.
- `TauCetiRoadmap/AdicSpacesPartIII/README.md:4358`, R2.2: admissible formal schemes and coherent modules allow nondiscrete valuation bases; this is the appropriate carrier and coherence interface for the requested extension.
- `TauCetiRoadmap/AdicSpacesPartIII/README.md:10727`, R3.6: Kiehl proper mapping is over the analytic generic fibre. Its coefficients cannot recover integral p-torsion.

Object searches used the roadmap service across content main and the indexed open heads, searches of board packages, and both pinned libraries. The nearby AInfCohomology §AI.6.3 proper formal cohomology target concerns a formal space proper over O_C or O_K. It does not supply the relative associated-sheaf comparison over every topologically finitely presented algebra A. The Noetherian formal-support contracts in SchemeKTheoryOperationsPartII and formal existence in AlgebraicModuliForArithmeticGeometry also have different bases and conclusions. This package adds no competing construction: general coherent formal proper mapping is requested from AdicSpacesPartIII; the almost approximation theorem remains §0.2 here.

The pattern search covered every formal proper-mapping, coherent pushforward, proper comparison and F0.6–F0.8 occurrence. Besides §0.2, the affected use is §0.5 and its enclosing Layer 0 dependency paragraph; both now name the contract. Later consumers reach it through Layer 0. Scheme upper shriek and generic Kiehl mapping retain their separate contracts.

## Adversarial mathematics pass

Each numbered target below includes its defining assertion, API and Checks. The supplied review’s earlier verdicts were treated as claims: the values below were recomputed from the stated objects. Write O=O_C, Λ=ℤ/n and a=ζ_p−1 where appropriate. Equalities refer to the specified canonical map, rather than an arbitrary isomorphism between its endpoints. All changed statements are expanded in the first table.

| Changed statement or boundary | Instances and computed values | Result | Change |
| --- | --- | --- | --- |
| Coherent formal proper-mapping contract, degree zero | On the completed ℙ¹_O, the two-chart Čech difference sends (f(T),g(T⁻¹)) to f−g. Its kernel is the diagonal constants O and its cokernel is 0. Hence H⁰=O, H¹=0 and the degree-zero sheaf map sends 1 to 1. | Integral unit and canonical map agree. | New contract and Check. |
| Same contract with torsion coefficients | Reduce the Čech complex modulo p: the kernel is O/p and the cokernel is 0. The class 1 is nonzero because v(p)=1>v(1)=0. Inverting p gives 0, whereas the unit sheaf instead gives C. | Flat formal schemes admit coherent p-torsion coefficients; generic Kiehl theory loses this module. | New Check; no coefficient flatness imposed. |
| Same contract in positive degree | For O(−2), the Laurent quotient is O⟨T,T⁻¹⟩/(O⟨T⟩+T⁻²O⟨T⁻¹⟩)=O·[T⁻¹]. H⁰=0, H¹=O; the associated-sheaf map carries [T⁻¹] to the same local cohomology class. | Tests a nonzero R¹, including its comparison map. | New Check. |
| Non-Noetherian boundary | A finite collection of nonzero elements of 𝔪_C has minimum valuation δ>0. Its ideal contains no element of value below δ. An n-th root of p has value 1/n<δ for n>1/δ, for p=2 and p=3 alike. | 𝔪_C is not finitely generated. | New negative-control Check. |
| General valuation bases | Over ℤ₂, ℤ₃ and 𝔽₂⟦t⟧, the same ℙ¹ calculations give respectively (H⁰,H¹)=(R,0), and with O(−2), (0,R); quotient coefficients give (R/ϖ,0). The zero sheaf gives (0,0). | No nondiscrete-only or mixed-characteristic-only shortcut in the supplier contract. | Contract retained over complete rank-one valuation rings. |
| Identity and empty-source boundaries | For id:Spf A→Spf A and coherent M^Δ, H⁰=M and Hⁱ=0 for i>0; the comparison is id. For the empty proper source, Hⁱ=0 and the comparison is 0→0 in every degree. | The specified map has the correct source, target and degeneracies. | No additional target. |
| §0.2 coherent approximation route | If ker(G→F) and coker(G→F) are killed by a finitely generated ideal J, the two short exact sequences show the cohomology-map kernel is killed by J² and its cokernel by J; both are killed by J². For F=G=O the error modules are 0. | The coherent theorem feeds the almost approximation argument, not its conclusion. | Explicit contract and both required conclusions. |
| §0.5 proper generic-fibre comparison | For the unit on completed ℙ¹, formal H⁰=O becomes C, matching analytic H⁰=C; H¹=0 on both sides. For O/p, formal H⁰=O/p becomes 0, matching the zero analytic sheaf. For O(−2), formal H¹=O becomes analytic H¹=C. | Contract propagated through the existing §0.2 dependency; all three examples commute with inversion. | Route and Layer 0 dependencies updated. |

| Target, definition or identity | Instances tried and values computed | Result | Change |
| --- | --- | --- | --- |
| Conventions: almost zero | In O/p, p·1=0 but ε·1≠0 when 0<v(ε)<1; in O/𝔪_C, every ε∈𝔪_C gives ε·1=0. | Only the second module is almost zero. | None. |
| Conventions: shifts and Tate line | For the curve, H²(Λ[−2])=Λ and H²(Λ[2])=0; the twisted point class has trace 1. | Negative trace shift and twist agree. | None. |
| Conventions: dlog and signs | On the torus, jΦ⁻¹(Sch(dlog T))=dlog T; rescaling Φ by a gives a⁻¹dlog T. A coordinate swap has determinant −1 and sends dT₁∧dT₂ to its negative. | Lattice normalization and orientation are distinguished, also integrally at p=2. | None. |
| Conventions: residue reductions and universes | In ℤ_p[π]/(π²−p) modulo p, π≠0 and π²=0; modulo its maximal ideal π=0, at p=2,3. An identity cover uses one index and remains within the chosen cutoff; an empty source has zero sections. | Neither residue reduction nor size conventions identify different objects. | None. |
| 0.1 Almost coherent formal sheaves | O has one generator, O/pⁿ has one generator and relation pⁿ; O/𝔪_C becomes 0. Modulo p, ε times an infinite direct sum has nonzero entries in arbitrarily many independent coordinates for 0<v(ε)<1. | Excludes all complete modules as the coherent category. | None. |
| 0.2 Affine comparison and Hom | RHom_O(O,O)=O[0]; RHom_O(O,G)=G for G nonzero in every negative degree; for id the higher unit groups are 0. The integral proper examples are computed above. | Bounds, affine comparison and extra supplier input agree. | Contract and four Checks added. |
| 0.3 Almost coherent proper duality | Identity counit: 1↦1; smooth relative curve: f!O=Ω¹[1], with H⁻¹=Ω¹; split two-point counit: (1,0)↦1. | Hom comparison lies on the target and shift is correct. | None. |
| 0.4 Almost nearby cycles | Point ranks: (1); smooth two-torus: (1,2,1). On the square-zero generic algebra, p·(Cε)=Cε, so the nilpotent coefficient contributes 0 modulo p. | Formal nearby coefficients cannot be replaced by the naive nonreduced formal algebra. | None. |
| 0.5 Generic fibre | O[1/p]=C; (O/pⁿ)[1/p]=0; (ϖO)[1/p]=C. Identity sends 1 to 1. | Localization forgets integral lattices and kills torsion. | Route names formal proper mapping. |
| 1.1 Formal canonical objects | Point: ω•=O[0]; smooth surface: H⁻²=O·dT₁∧dT₂. In the completed ℤ_p[pT,T²,T³] example, x=pT remains nonzero modulo p but x²=xT²=xT³=0. | A non-Cohen–Macaulay reduction requires the full dualizing complex. | None. |
| 1.2 Completion and étale comparison | Identity generator↦itself. At odd p, U=2T gives dU=2dT, with determinant the unit 2. At n=1 the reduced complex is ω•₁. | Étale and reduction comparisons preserve the specified maps. | None. |
| 1.3 Gluing kernel | Whole open on a point: ker(C⊕O→C)={(s,s):s∈O}; (1,0) maps to 1. Empty open gives C. | Excludes an unrestricted direct sum and false integral recovery. | None. |
| 1.4 Hartogs | For the whole open, s↦(s,s) recovers O. For the empty point-open, sections instead become C≠O. On uv=ϖ, a dense open meets both residue components; meeting one misses the other generic point. | Density and reducedness retain their roles. | None. |
| 1.5 Bottom traces | Identity has value 1 on 1. Two-copy trace sends each component unit to 1. Degree-p trace sends the total unit to p, then 0 modulo p. | Underived normalization and composition agree. | None. |
| 1.6 Generic canonical identification | Point: s(1)=1. On the one-torus the generator is dlog T; for U=T⁻¹ both identifications give dlog U=−dlog T. | Canonical bottom comparison has the same sign. | None. |
| 1.7 Coherent rigid traces | S=Tʳ gives f*dlog S=r dlog T and Tr(dlog T)=dlog S, hence Tr(f*dlog S)=r dlog S, including r=p. A ramified quadratic point has nonzero square-zero residue π; over C the generic algebra is C². | Trace is unnormalized; reduced-model cofinality needs its algebraically closed base. | None. |
| 2.1 Torsion quotient | (O⊕O/p²)/(p-power torsion)=O; O itself is unchanged. For p=2, 2x²=0 in a scalar-torsion-free module forces x²=0. | Alternation at 2 is stronger than anticommutativity. | None. |
| 2.2 Cotangent maps | At the point, Ω̂¹=0 and Φ¹=0. On a smooth torus, im Φ¹=aR̃¹ and its cokernel is R̃¹/a; rescaling by a gives the smaller a²R̃¹. | Intrinsic cotangent normalization distinguishes the wrong map. | None. |
| 2.3 Smooth inverse | Dimension zero: Ψ⁰(1)=1. For d=1 the ranks are 1,1,0. The normalized coordinate character maps to dlog T, whereas an extra inverse scalar gives a⁻¹dlog T. | Degree-zero extension uses no division; positive degrees retain the image lattice. | None. |
| 2.4 Nice models | Smooth chart residue is k[T₁,…,T_d]; node residue is k[u,v]/uv, reduced; t²=ϖ has residue k[t]/t² with t≠0. | Nice allows the node and excludes the ramified quadratic model. | None. |
| 2.5 Rational normalization | jΦ⁻¹Sch(dlog T)=dlog T; the r-power cover has pullback coefficient r and trace coefficient 1; point maps have value 1. | Same convention as 1.7 and 2.3. | None. |
| 2.6 Faltings traces | Point trace is id. Curve target: Ω¹[1](−1)[−2]=Ω¹(−1)[−1], with H¹=Ω¹(−1). A non-Cohen–Macaulay reduction retains additional dualizing cohomology. | Both shifts and the full singular target are necessary. | None. |
| 2.7 Pseudo-finite maps | Identity: generic degree 1, nearby amplitude [0,d]. A blowup has generic degree 1 while a residue exceptional fibre can be ℙ¹. A positive-dimensional generic fibre is not finite. | Generic finiteness and the amplitude condition remain separate. | None. |
| 2.8 Pro-étale trace | Split p-cover: Tr(1,…,1)=p, Tr(e₁)=1. Degree one: 1↦1. For successive split r- and s-covers, a component unit maps to 1 under either iterated sum. | Coefficient changes and composition preserve summation. | None. |
| 2.9 Trace square | For id, both routes give 1; for two copies, both give x+y; for p copies both give p integrally, 0 modulo p on the unit, and 1 on e₁. | No hidden degree normalization. | None. |
| 3.1 Polystability | uv=ϖ has dimension 1 and reduced two-branch residue; a unit parameter gives a torus; uv=0 has both derivatives 0 at the origin. With no blocks, d=0. | Nonzero parameters and product dimension are essential. | None. |
| 3.2 Root tower | n_i=0 gives Γ=1; one torus gives Γ=ℤ_p(1). At a characteristic-two node the closed-node root fibre is k[x,y]/(x²,y²,xy), basis 1,x,y, length 3, while generic degree is 2. | Finite root stages need not be flat over R⁺. | None. |
| 3.3 Character normalization | For uv=p, normalized exponent vectors (1,0)+(0,1) subtract minimum 1, so V_uV_v=pV₀≠V₀. A unit parameter gives a unit factor; the integral coset contains both 1 and T. | Additive decomposition does not erase multiplication factors. | None. |
| 3.4 Character cohomology | Trivial one-generator complex [O→⁰O] has H⁰=H¹=O. Differential ζ_{pᵐ}−1 gives H⁰=0, H¹=O/(ζ_{pᵐ}−1). Γ=1 gives H⁰ only. | Correct differential and nonzero torsion, not almost-zero cohomology. | None. |
| 3.5 Décalage | Lη_a of [O→aO] has zero cohomology; on the trivial torus the free ranks remain 1,1. Quotienting O by its a-torsion gives O; taking O/a instead gives torsion. | The torsion quotient is not reduction. | None. |
| 3.6 Projection trace | For m>0, tr_m(1)=1, tr_m(T^{1/pᵐ})=0 and tr_m(T)=T. At m=0 all weights remain. Ordinary characteristic-p degree-pᵐ trace sends 1 to 0. | Projection is determined by the character summands. | None. |
| 3.7 Root derived duality | m=0: r maps to multiplication by r. At the node, Hom(A/(v),A)=Ann(v)=(u). On the quadratic torus the Gram matrix is diag(1,T), determinant T∈A×. | Derived duality retains singular branch constraints. | None. |
| 3.8 Oriented group trace | Γ=1 gives id in degree 0; Γ=ℤ_p sends its degree-one generator to 1. Swapping two generators has determinant −1 and reverses the top generator. | Scalar trace requires orientation. | None. |
| 3.9 Cochain duality | d=0: b↦(c↦bc). For d=1, degrees 0 and 1 multiply into the top degree. Opposite characters project to the base coset; a nonintegral total character has projection 0. | Opposite-character and completed sum/product distinctions persist. | None. |
| 3.10 Polystable duality | Point adjoint: id. Curve targets are ω(−1)[−1] and ω•₀(−1)[−2]=ω₀(−1)[−1]. Two torus coordinates pair 0 with 2 and 1 with 1, with top swap −1. | Local shifts agree. | None. |
| 4.1 Pairing and adjoints | Point multiplication has both adjoints id; the zero object has adjoint 0→0. On a smooth curve D=Ω¹/p(−1)[−1], so local paired degrees are 0 and 1. | Perfection does not assert finite projectivity. | None. |
| 4.2 Rig-isomorphism descent | id leaves the adjoint unchanged. An admissible blowup has generic degree 1 despite an exceptional ℙ¹; the generic coefficient complexes coincide, and normalized trace gives 1↦1. | Derived pushforward has the required direction. | None. |
| 4.3 Good quotients | G=1: fibre size 1. Split C_p-torsor: fibre size p and quotient one base copy. Trivial C₂-action on a point has fibre size 1≠2. | A generic stabilizer excludes the diagram; wild split torsors are included. | None. |
| 4.4 Homotopy invariants and orbits | Trivial C_p-action modulo p has cyclic differentials g−1=0 and N=p=0, hence H¹=O/p. The S₃-induced module has one invariant regular sum and one coinvariant generator; higher groups vanish. For C₃ over 𝔽₂, 3=1. | General averaging is invalid; invertible-order and induced cases agree with their formulas. | None. |
| 4.5 Equivariant pushforward and Hom | G=1 gives identity comparisons. Trivial C_p invariants retain H¹=O/p. For noncommuting g=(12), h=(23) in S₃, (gh)⁻¹=h⁻¹g⁻¹≠g⁻¹h⁻¹. | Inversion is the required right-action conversion. | None. |
| 4.6 Good-quotient descent | On the split p-torsor M^p, invariants are diagonal M and coinvariants are M; component trace is 1, while the invariant total unit has trace p=0 modulo p. S₃ gives six summands and the same component trace 1. | Uses torsor Shapiro, not a norm isomorphism on arbitrary modules. | None. |
| 4.7 Local almost duality | Point: id. uv=ϖ has two reduced residue branches. In t²=ϖ, t≠0 but t²=0 in the residue algebra. | The last model fails niceness and is outside the theorem. | None. |
| 5.1 Global trace | Point: 1↦1. Two points at p=2: (1,1)↦0 and e₁↦1. Curve target has H²=Oᵃ/p(−1). | Summation and −2d shift agree. | None. |
| 5.2 Global almost duality | Point multiplication is perfect. ℙ¹ has ranks 1,0,1 and top trace 1. Two points have Gram diag(1,1), determinant 1 even when Tr(1)=0. | Vanishing total-unit trace does not degenerate the pairing. | None. |
| 5.3 Almost detection and top trace | Zero map 𝔽_p→𝔽_p has kernel and cokernel 𝔽_p, each extending to nonzero Oᵃ/p; id has both 0. Two-point summation has a one-dimensional kernel. | Both detection directions and connectedness boundary hold. | None. |
| 5.4 Geometric mod-p duality | ℙ¹: H⁰=H²(−,𝔽_p(1))=𝔽_p with pairing 1. Two points: diag(1,1). At i=2d+1, both groups vanish; over characteristic-p ℙ¹, Artin–Schreier instead gives H²(−,𝔽_p)=0. | Integer indices and mixed-characteristic scope are required. | None. |
| 5.5 Finite local-system duality | Rank 0 gives 0→0; constant rank r at a point gives matrix I_r. The C₂ Jordan block over 𝔽₂ has fixed line e₁ and trivial quotient, but degree-two transfer scalar 2=0. | Filtration works at 2; the splitting degree must be prime to p. | None. |
| 5.6 Finite p-power duality | n=1 recovers mod p. On ℙ¹ with Λ=ℤ/p², degrees 0 and 2 pair to 1. Tor₁^{ℤ_p}(ℤ/pⁿ,𝔽_p)=𝔽_p, while Λ_n⊗ᴸ_{Λ_n}𝔽_p=𝔽_p[0]. | Correct tensor ring and target shift. | None. |
| 5.7 Integral and rational traces | Point traces send 1 to 1 at all finite levels and in the limit. ℙ¹ point class has value 1. (ℤ_p/p)[1/p]=0. | Compatible trace cannot be defined by torsion-free bases. | None. |
| 5.8 Integral derived duality | ℙ¹ target is ℤ_p[−2]. For [ℤ_p→pℤ_p] in degrees 0,1, H⁰=0, H¹=ℤ/p; its dual has H⁰=Ext¹(ℤ/p,ℤ_p)=ℤ/p. Point pairing is 1⊗1↦1. | Derived Ext term is retained. | None. |
| 5.9 Rational duality | ℙ¹ endpoint matrix is (1). Torsion rationalizes to 0. Two-point matrix diag(1,1) has rank 2, unlike the product-of-sums matrix of rank 1. | Rationalization and summation pairing agree. | None. |
| 7.1 Zariski constructibility | Point skyscraper on a disc has stalks Λ,0 on its two strata; a constant sheaf has one stratum. On disjoint points with Λ[j], the j-th fibre is nonzero only in degree −j. | Local boundedness does not imply a global lower bound on a non-qc space. | None. |
| 7.2 Affinoid algebraization | Z=Spec A gives the identity proper structural map. Point skyscraper stays on its point; on two points H⁰ is Λ² on both sides. | Correct scheme argument and constructibility notion. | None. |
| 7.3 Locality and generators | At a point the generator is Λ. Finite point inclusion gives stalks Λ,0. The length-two unipotent C₂-system has two trivial composition factors. | Thick generation includes nontrivial extensions. | None. |
| 7.4 Proper constructible pushforward | id leaves F unchanged. Point inclusion has R⁰=i_*Λ and Rⁱ=0 for i>0. Its smooth base-open is D∖{a}; two inclusions give D∖{a,b}. [Λ→idΛ] has H⁰=0; [0→Λ→idΛ] has H¹=0, unlike their shorter truncations with value Λ. | Per-map smooth opens and i+1 cutoff are correct. | None. |
| 7.5 Field extension | Point map: Λ→Λ, 1↦1. ℙ¹ ranks stay 1,0,1. Rational one-node proper curve: normalization contributes Λ in degrees 0,2, and the branch difference (a,b)↦a−b yields an additional H¹=Λ. | Smooth hypercover terms handle the singular example before toric comparison. | None. |
| 7.6 All-torsion base change | id gives id. ℙ¹ at n=p² preserves H⁰=Λ and H²=Λ(−1). At n=1 the coefficient ring is 0, giving 0→0; empty source also gives 0→0. | No good-primes restriction or nonempty-source assumption. | None. |
| 7.7 Constant big-site sheaf | Point Z gives R⁰=Λ and R^{>0}=0. Two points give R⁰=Λ². For point Z and Y=ℙ¹, R²=0 but H²(Z×Y,Λ)=Λ(−1). | Sheaf statement is distinct from product cohomology. | None. |
| Layer Examples 0–2 | Formal point: (A,K)=(Oᵃ,Oᵃ/p), generic fibres (C,0). Torus cover: pullback coefficient r, trace coefficient 1. Curve Faltings target: Ω¹(−1)[−1]. | Examples agree with their layer targets. | None. |
| Layer Examples 3–4 | Node root fibre length 3 versus degree 2; opposite monomials multiply to ϖ. Split C_p-torsor sends e₁ to 1 and total unit to p; trivial C_p-module has H¹=O/p. | Singular multiplication and wild descent controls remain distinct. | None. |
| Layer Examples 5 and 7 | ℙ¹ has generators in 0,2 for all four stated coefficient rings. Point inclusion has positive direct images 0. Point product with ℙ¹ has H²=Λ(−1) although the relevant R² sheaf is 0. | Integral and sheaf/cohomology distinctions persist. | None. |
| Worked elliptic and nodal examples | Elliptic ranks (1,2,1); symplectic matrix [[0,1],[−1,0]] has determinant 1 at p=2,3 and zero diagonal even at 2. Rational one-node curve has ranks (1,1,1); its smooth normalization has ranks (1,0,1). | Global and local curve degrees, alternation and singular descent agree. | None. |

| Other exact supplier contract | Instances and computed values | Result | Change |
| --- | --- | --- | --- |
| reduced-model-cofinality | Point over C: model Spf O. Ramified quadratic point over ℚ_p: residue π≠0, π²=0; after extension to C its algebra is C². | Algebraic closedness retained. | None. |
| refined-formal-algebraization | O_K⟨T⟩ completes O_K[T], with generic dimension 1; a component supported only on the generic locus has empty formal completion. | Pure-relative-dimension assertion remains explicit. | None. |
| finite-formal-quotients | G=1 gives id; G×𝔛 has |G| components and quotient 𝔛, including |G|=p. | No prime-to-p assumption added. | None. |
| polystable-uniformization-zigzag | Point: dimension 0 and length-zero diagram. uv=ϖ: one block, dimension 1, two reduced residue branches. | Exact geometric obligation retained. | None. |
| finite-branched-covers | T=S² over a punctured characteristic-zero disc has derivative 2S invertible there; at S=0 it vanishes and the extension remains branched of degree 2. | Cover extension includes the branch locus. | None. |
| proper-generic-smoothness | Proper point inclusion has S_f=D∖{a}; finitely many inclusions have common open D∖{a_j}; all point inclusions have empty intersection on classical points. | Quantifiers remain per map. | None. |
| valuation-upper-shriek | id: O[0]; smooth relative line: Ω¹[1]; split two-point counit sends (x,y) to x+y. | Scheme duality is not formal proper mapping. | None. |
| valuation-duality-amplitude | Point: [0,0]. Smooth d=2: Ω²[2], only H⁻² nonzero; its coefficient sheaf is flat. | Both amplitudes fit [−2,0]. | None. |
| valuation-canonical-reflexivity | Smooth affine line has ω=O_K[T]·dT and bidual id; t²=ϖ gives nonreduced residue k[t]/t². | The last model fails the geometric hypothesis. | None. |
| connective-totalization-truncation | [Λ→idΛ] gives H⁰=0 versus Λ after degree-zero truncation; [0→Λ→idΛ] gives H¹=0 versus Λ after dropping level 2. | The i+1 interface is necessary in the tested degrees. | None. |
| general-nearby-coherence | Point ranks (1); smooth two-torus (1,2,1). Cε/pCε=0 for a square-zero generic nilpotent. | General admissible models remain separate from proper primitive comparison. | None. |
| integral-toric-field-extension | Constant coefficient 1 maps to 1. The finite character differential ζ_{pᵐ}−1 maps to the same scalar over C′. At a node both partial derivatives vanish at its origin. | Toric comparison is applied on smooth charts only. | None. |
| quasi-excellent-direct-images | For j:𝔾_m→𝔸¹ in characteristic zero, the boundary stalk of R¹j_*Λ is Λ(−1), not 0. | Nonproper finiteness is a separate input. | None. |

## Source, citation and pinned-library checks

The legal cached AC v3 text was read at Set-up 4.5.1, Theorems 5.1.5–5.1.6 and both proof invocations cited above. Its manifest entry retains the same key, version, hash and legal provenance, with an explicit Theorem 5.1.5 locator and supplier-contract use added. There are nine unique source keys. All cited works have supplied legal cached texts except H, whose settled `uncertified` status and published locator are retained. No new source is required and no missing-text request was created.

Content main was verified as 5f173a7b9ac37eb6b62d01eb3db5047b92d19363. The manifest revisions and actual checkouts agree: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a; Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Pinned declarations were opened directly because the citation resolver does not inspect these external Lake directories:

| Pin evidence | Content and boundary |
| --- | --- |
| `Mathlib/LinearAlgebra/PerfectPairing/Basic.lean:39` | `LinearMap.IsPerfPair` asks for both adjoints bijective; no finite-projective field is present. |
| `Mathlib/RepresentationTheory/Invariants.lean:73` | `Representation.invariants` consists of vectors fixed by every group element; no finite-group hypothesis. |
| `Mathlib/AlgebraicGeometry/Sites/Etale.lean:50` | `Scheme.smallEtaleTopology` is a site of a scheme, not an analytic space. |
| `TauCeti/RepresentationTheory/Unipotent/PowerOrder.lean:151` and :158 | The supplied fixed-vector and invariants theorems use a nontrivial finite-dimensional representation over a field of exponential characteristic p and `IsPGroup p G`. |
| `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean:243` | `TauCeti.AdicSpace` is the full subcategory of sheafy locally affinoid pre-adic spaces. It does not add formal schemes, almost modules or analytic étale sites. |

Source-object searches at both pins found no coherent formal proper-mapping theorem on valuation-base formal schemes. The required general formal carrier and coherent sheaf comparison remain supplier work. The headline audit retains the sixteen module-docstring explanations: none acquires a statable native geometric interface from adding this supplier gap. An abstract pairing or completion theorem would not express the specified geometric trace.

Main-branch shape references read were SchemeAndStackFoundations, EnhancedDerivedSheaves and AdicSpacesPartIII. Cross-roadmap citations were resolved afresh, and their section statements were inspected on main or the indexed new-roadmap heads as appropriate:

| Supplier and sections | Boundary verified |
| --- | --- |
| PerfectoidSpaces P0.1–P0.13, P0.29, P3.11–P3.22, P5.9–P5.13.4, P6.5–P6.7, P6.15–P6.16 | Almost setup, acyclicity and tower domains retain flatness, characteristic and cutoff hypotheses. |
| AdicSpacesPartII R0–R1, especially R0.19–R0.20 | Spectral limits and ordinary tilde-limits retain their topological and density requirements. |
| AdicSpacesPartIII F0.6–F0.8, R2.2–R2.8, R3.1–R3.8 | Formal carriers, Noetherian coherent statements and generic coherent mapping have the distinct boundaries described above. |
| AdicSpacesPartIIPartII RZ.0–RZ.5 | The supplied board design contains Zariski geometry, normalization, smooth loci, weakly Shilov geometry and resolution; additional cover and generic-smoothness conclusions remain gaps. |
| RigidAnalyticGeometry §§1.1–1.2; ResolutionOfSingularitiesCharacteristicZero §§7.5, 7.8 | Affinoid excellence and scheme resolution over quasi-excellent characteristic-zero bases. |
| SchemeAndStackFoundations §§0.6, 0.8–0.9, 0.21, 2.18–2.21 | Noetherian reflexivity and duality are not silently substituted for the three valuation-base contracts. |
| DerivedModuleAlgebra §§0.2–0.17, 1.T.1, 1.1–1.8, 1.E.1, S.1; DerivedDeRhamCohomology §1.22 | Module-derived operations and exchanges keep Tor, completeness and boundedness conditions. |
| EnhancedDerivedSheaves §§0.1–0.4, E1.1–E1.5, E2:towers.1 | Enhancement and homotopy-limit calculus are distinct from the geometric hyperdescent supplier. |
| AInfCohomology AI.0:integral.1, AI.1.1–AI.1.7, AI.3.1–AI.3.2, AI.4.1, AI.6.1–AI.6.3 | Intrinsic dlog, décalage and single-block semistable domain; absolute formal finiteness is not the requested relative formal theorem. |
| PadicHodgeTheory §§2.1, 2.4, 2.7, 7.2 | Primitive comparison and proper perfectness retain their coefficient and geometry domains; general nearby coherence remains a gap. |
| ArithmeticGaloisDuality D7.1–D7.3, R02.1.2–R02.2.3 | Ordinary group-derived calculus is used on its own coefficient domains; almost ringed-site extension remains owned here. |
| DiamondsAndVStacks D1.1–D1.6, D1.9–D1.11; DiamondEtaleCohomology C0.1, C0.23, C1.7–C1.12, C2.10 | Bounded-below v-comparison, hyperdescent and the separate quasi-pro-étale base-change domain. |
| ClassicalAdicEtaleCohomology §§1.1–1.4, 7.1, 8.2, 8.4, 9.5, 9.7, 10.5, 11.1 | Parent trace, amplitude and comparison domains; arbitrary p-primary proper exchange remains this Part II’s theorem. |
| HodgeTateAndCanonicalSubgroups §§7.5–7.6 | Relative local systems and their geometric-fibre and rigid-base-change comparisons belong to that supplier. |
| EtaleCohomologyFoundations G.1–G.3, F.0, F.3, §§0.5–0.11; AdicCoefficientsAndComparisons L2/fp-compactification-limit and L2/fp-strict-cofiltered | General compactifications and finitely presented strict refinements are distinct; `fpCompactificationLimit` and `fpStrictCofiltered` exist at the cited head. |

The roadmap service does not list an indexed head for AdicSpacesPartIIPartII; its explicitly supplied earlier board package, `packages/AdicSpacesPartIIPartII/design/README.md`, was used rather than alleging a missing section. Ownership searches included the named open-roadmap set through the supplied index and the board packages. No later supplier, duplicate owned construction or renamed Lean declaration was introduced.

## Mechanical check outcomes

- Prescribed `lake env lean` elaboration of `packages/ClassicalAdicEtaleCohomologyPartII/Suggested.lean`, run from content: exit 0, no diagnostics. No Tau Ceti import needed an object-file build. No Lean process remains running.
- Mechanical declaration and binder inventory: zero declarations. Thus the `#check @name` comparison has zero elaborated signatures to compare; there are no implicit hypotheses to lose and no binder changes. The file is unchanged, with one `import Mathlib`, its module docstring and namespace, no sorry’d data, no padding and no `set_option`.
- README inventory: 54 numbered targets, 173 Checks, at least three per target. The four added Checks remain prose; no new Lean name is claimed.
- JSON and TOML parse successfully. Fourteen gap slugs match the README contracts one for one. The new gap’s supplier and needs sentence agree exactly. The existing thirteen entries are unchanged; comparison with the original parsed JSON confirms every top-level field except `gaps` is unchanged.
- Final citation resolver: exit 0. Cross-roadmap citations found nowhere: None. Lean names found nowhere: None. The external-Lake limitation was covered by direct reads at the verified pins.
- Prescribed final dependency check: exit 0, with this exact output:

    depcheck: 51 roadmaps, 598 edges, 0 problem(s)

There is no UPWARD, CYCLE or moved line. No merge-order change was made.

- `git diff --check`: exit 0, no output. The three TeX gate matches in §0.2 were replaced by prose: the projective line over O_C, the structure sheaf of Spf O_C and an n-th root of p. The report uses the same root notation. Their mathematical values and hypotheses are unchanged. A fresh README notation scan found zero TeX matches outside inline code. The prescribed Lean elaboration and dependency check were repeated after this repair, with the same successful outcomes above.

## Maintainer consequences

The package now declares fourteen supplier gaps. The added obligation is the general coherent formal proper-mapping theorem and its canonical associated-sheaf comparison, owned by AdicSpacesPartIII §§R2.2–R2.8. Declaring that obligation repairs the undeclared prerequisite; it does not claim the supplier has already stated or proved it. The almost theorem and downstream headlines retain their scope. No Lean names changed, no other roadmap was edited, and no commit or network write was made.
