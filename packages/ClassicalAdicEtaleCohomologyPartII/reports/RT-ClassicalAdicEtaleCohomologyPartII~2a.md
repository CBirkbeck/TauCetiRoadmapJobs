<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/971#issuecomment-6400122664 -->
Red team round 2 pass a (codex) of 0c4ae2f

Verdict: accepted

No new package finding was established. This verdict is conditional on the thirteen declared supplier contracts and preserves the settled maintainer disposition of earlier finding b F05.

## Earlier findings, individually retested

Locations in this table refer to `packages/ClassicalAdicEtaleCohomologyPartII/README.md` unless another file is named. The identifiers are those in the repair report, preserving the distinction between reviews a and b.

| Earlier finding | Disposition at this head | Repaired passage and witness |
| --- | --- | --- |
| a F01 | Repaired | Line 203: “For n=0 … degree zero”; “For n=1 … H¹=O_Cᵃ/p”. With M=O_C/p, Ext¹ over O_C/p is 0; over O_C/p² the periodic p-resolution gives M. Both almostifications have the asserted values. |
| a F02 | Repaired | Line 514: “on the identity point map”; “trace sends the unit to r and one component unit to 1”. The split double cover gives 2 integrally and 0 modulo 2, while a component gives 1. |
| a F03 | Repaired | Line 177: “the first argument is bounded above and the second bounded below”. AC line 4834 supplies exactly these bounds. RHom(O,G)=G: a negative infinite tail is excluded, and a connective G remains connective. |
| a F04 | Repaired | Lines 122 and 897: “For finite G and the regular induced module”; the latter also gives the infinite ℤ control. For S₃, invariant and coinvariant modules are M; for ℤ the respective values are 0 and M. |
| a F05 | Repaired | Lines 130, 906, 916 and 1154, 1164 explicitly cite parent §§11.2 and 2.5. The parent targets are `ordinary_etale_cohomological_dimension` and `AdicSpace.henselianComparison_bijective_of_spec`. At d=1 the ordinary bound is 2, not the nearby object's bound 1. Absolute comparison supplies the non-tautological cohomology comparison for the structural identity. |
| a F06 | Repaired | `Suggested.lean:70`: “theorem monomial_root_duality”; README line 732 includes projection equations, bijective multiplication adjoint and positive Ext vanishing. At the characteristic-two node the branch duals are (u),(v), and their periodic resolutions have zero positive Ext. At p=3 the branch pairing matrix is [[0,u],[u,0]]. |
| a F07 | Repaired | Lines 17, 267 and 366: “an arbitrary complete … field K”; “modulo ϖⁿ⁺¹”; “in either characteristic”. For K=𝔽₂((t)), the canonical line is O_K⟨T⟩dT in degree −1 and reductions are modulo t,t². The inseparable map T↦Tᵖ is excluded from the finite étale Check at line 398. |
| b F01 | Repaired | Lines 102 and 1186: “EnhancedDerivedSheaves §E5:animation.3”; “through cosimplicial degree i+1”. On main, that supplier states r≥max(0,b−k+1). Set b=0,k=−i to obtain i+1. For N¹→N²=id, H¹(Tot₂)=0, whereas H¹(Tot₁)=Λ. The obsolete gap is absent from both gap lists. |
| b F02 | Repaired | Line 114 gives the formal scheme, finite dimension, specialization, affine section condition, amplitude, base change, completeness and reduction without using this roadmap's category. AC lines 7390–7428 give the corresponding nearby-cycle assertions. Point ranks are (1); the two-torus ranks are (1,2,1). The same slug and needs occur in the plan. |
| b F03 | Repaired | Lines 130, 1136, 1186 and 1223 cite “1.5(c)”, “3.2” and “9.1”, including the bounded-below and qcqs restrictions in the contract. For a rank-one C-point and n=p the stalk is RΓ of the fibre; the cited §7.1 prime-to-residue theorem is no longer used for this step. |
| b F04 | Repaired | Line 267: “n≥0”; “𝔛₀ is the modulo-ϖ fibre”. Thus n=0 gives O_K/ϖ and n=1 gives O_K/ϖ²; at ϖ=p the trace target uses the same mod-p dualizing object as §2.6. |
| b F05 | Not repaired; settled as not actionable in this package | Line 11: “Proper smooth mod-p, finite p-power and finitely generated integral local systems … are consumed here”. The plan still contains PD.6 and its nine nodes. The repair report correctly reserves scope/node edits for the maintainer; the authorized package-stage plan changes are only gaps. No re-raised finding. |
| b F06 | Repaired | Lines 104, 126, 1186 and 1205 attribute the surjectivity criterion to “DiamondsAndVStacks §D2.2”, transported using the diamond comparison. Its actual qc-source/qs-target criterion is present. A split finite surjection has full image and gives a cover; the empty map to a nonempty point has empty image and fails. |

The citation-resolver lead concerning `AdicSpace.henselianComparison_bijective_of_spec` is a false positive as a missing-owner allegation: it is a planned target in `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:961`, not asserted to exist in the pinned library.

## Computed target inventory

Each numbered bold target of the README has a row below. Values are computed in the stated coefficient category; 0 means the zero object, not merely a zero cardinality. Write O=O_C, R=O/p, a=ζ_p−1, Λ=ℤ/n. Almostification is retained where asserted. Tests outside a hypothesis are negative controls, not counterexamples. The shift convention is Hⁱ(M[r])=Hⁱ⁺ʳ(M).

| Target | Instances and computed sides | Result and change |
| --- | --- | --- |
| Conventions | ℙ¹: H²(Λ[−2])=Λ, H²(Λ[2])=0. Surface coordinate swap sends the wedge and trace to −1 times their former value, reducing to +1 modulo 2. In R, ε·1≠0 for 0<v(ε)<v(p); in k, ε·1=0 for every ε∈𝔪. In O_{ℚ_p(√p)}/p, π≠0 but π²=0. | Correct; no change. |
| 0.1 Almost coherent categories | Oᵃ has one generator; kᵃ=0. A completed direct sum of infinitely many O's has, for any fixed nonzero small ε, infinitely many independent ε-weighted coordinate classes: no finite set generates modulo ε. | Correct; ordinary finite generation and almost finite generation are distinguished. |
| 0.2 Affine and proper comparison | RHom(O,G)=G, so a negative infinite tail is not bounded below. On formal ℙ¹, H*(O)=(O,0), H*(O/p)=(R,0), H*(O(−2))=(0,O); generic fibres give (C,0),(0,0),(0,C). Finitely many generators of 𝔪 have minimum positive valuation δ, missing p^{1/N} with v(p)/N<δ. | Correct bounds; no change. |
| 0.3 Almost coherent duality | On the identity point modulo p, Ext¹_R(R,R)=0. For M=O/p over O/p², the periodic p-resolution gives Ext¹(M,M)=M. Smooth relative curves have f!O=Ω¹[1], in degree −1; two points have counit (x,y)↦x+y. | Correct repaired base indexing. |
| 0.4 Nearby complex | A point gives H⁰=Rᵃ and Hⁱ=0 for i>0; a smooth two-torus gives ranks 1,2,1 in degrees 0,1,2. For C[ε]/ε², the nilpotent ideal is p-divisible in the power-bounded ring, giving zero in O⁺/p and in its p-adic completion. | Consistent with amplitude and nilpotent invariance. |
| 0.5 Generic fibre | O[1/p]=C, (O/p²)[1/p]=0, (pO)[1/p]=C. The zero object remains zero. | Correct; no change. |
| 1.1 Formal dualizing complexes | A point has O in degree 0; a smooth plane has Ω² in degree −2; over 𝔽₂((t)) a smooth line has Ω¹ in degree −1. In the flat model ℤ_p[pT,T²,T³]^, x=pT survives modulo p but x²=xT²=xT³=0: special fibre is not Cohen–Macaulay. | Full complex is necessary; reduced-special-fibre restriction is not silently inferred from flatness. |
| 1.2 Smooth identification | n=0 reduces modulo ϖ, n=1 modulo ϖ². With U=2T and p odd, dU=2dT on both descriptions. Identity coordinate change multiplies by 1. | Correct, including equal characteristic. |
| 1.3 Gluing | For U=X the equalizer is the diagonal copy of F. For a point and U empty, the generic piece is K whereas integral sections are O. The incompatible pair (1,0) has difference 1. | Correct; openness alone does not give integral recovery. |
| 1.4 Reflexive recovery | For the point, empty U gives generic sections C rather than O and fails density of the residue open. On a reduced node both generic branches must be retained; deleting a component changes the recovered sections. | Correct with the stated density hypothesis. |
| 1.5 Formal trace | Identity trace is 1. Split r-point trace sends (1,…,1) to r and e₁ to 1. For r=p, reduction sends the unit to 0 but e₁ to 1. | Correct unnormalized trace. |
| 1.6 Generic canonical line | A point identifies O with O. On a torus the generator is dlog T; T↦T⁻¹ sends it to −dlog T. | Correct sign and line. |
| 1.7 Coefficient trace comparison | S=Tʳ gives pullback dlog S=r dlog T, trace dlog T=dlog S, and trace after pullback r. In characteristic p with r=p, the derivative is 0 and the map is not étale. The ramified √p model has nonreduced residue fibre. | Both negative controls are excluded; no change. |
| 2.1 Torsion-free nearby cohomology | For O⊕O/p², quotient by torsion is O, whereas the torsion submodule is O/p². At p=2, graded commutativity gives 2x²=0 and torsion-freeness gives x²=0 integrally. | Correct quotient and exterior-algebra use. |
| 2.2 Cotangent line | At a point Ω¹=0. For a smooth chart the degree-n comparison image is aⁿ times the differential lattice: a in degree 1, a² in degree 2. | Correct; twist identification does not erase its lattice index. |
| 2.3 Integral comparison | n=0 gives identity; n=1,2 give images aR and a²R in the corresponding integral lattices. Multiplication back after division yields aⁿx on both sides. A smooth curve has ranks 1,1,0 in degrees 0,1,2. | Correct. |
| 2.4 Nice models | Smooth model: reduced residue fibre. uv=ϖ: reduced nodal residue fibre. t²=ϖ: residue equation t²=0, so not nice. | Three discriminating controls; no change. |
| 2.5 Faltings trace normalization | j∘Φ⁻¹=Sch⁻¹ acts by 1 on the chosen coordinate generator; an additional a changes this to a⁻¹. Identity point gives 1; split two-point map gives 2, not 1. | Earlier repair holds. |
| 2.6 Derived Faltings trace | At d=0 the trace is identity. At d=1, ω₀•[−2]=ω₀[−1] has its canonical sheaf in degree 1. On a singular model the bottom-sheaf inclusion retains the other degrees of the dualizing complex. | Correct shifts and target. |
| 2.7 Proper functoriality | Finite maps have Rⁱf*=0 for i>0. A rig-isomorphism induces the identity generic object. A proper generic map with positive-dimensional fibres is not a rig-isomorphism. | Correct scope. |
| 2.8 Trace transitivity | Split r then s covers send the unit to rs in either order; at r=p the value modulo p is 0. A single component unit has trace 1. | Correct without dividing by degree. |
| 2.9 Coherent/nearby trace | Identity square has both composites 1; split double cover has both composites x+y; split p-cover sends the unit to p on both sides. | Correct. |
| 3.1 Product charts | Empty block family gives O and d=0. A block with n_i=0 eliminates its lone coordinate. Two one-dimensional node blocks give d=2. Unit parameter gives a torus; zero parameter gives uv=0 with singular generic fibre and is excluded. | Generality and nonzero parameters retained. |
| 3.2 Root tower | All n_i=0 gives trivial Γ. One torus root stage has generic degree p. At the node and p=2, the fibre of u=x²,v=y², xy=0 at u=v=0 has basis 1,x,y, length 3, whereas generic rank is 2. | No false finite-flat assertion. |
| 3.3 Character multiplication | For uv=ϖ, complementary fractional character factors multiply to ϖ; for unit ϖ this factor is invertible, for nonunit ϖ it is not. Integral character summand is the full base ring, not only constants. | Correct parameter retention. |
| 3.4 Koszul calculation | Γ=1 gives H⁰=R only. Trivial ℤ_p action gives [R→0 R], hence H⁰=H¹=R. A character of order p over O gives [O→a O], hence H⁰=0,H¹=O/a, which is not almost zero. | Correct; no false acyclicity. |
| 3.5 Décalage | The a-torsion summand O/a is removed by Lη_a, whereas O remains. The trivial one-torus has ranks 1,1. Torsion-free quotient of O⊕O/a is O. | Correct. |
| 3.6 Character projection | m=0 gives identity. At a genuine root stage, τ(1)=1, τ(T^{1/p})=0, τ(T)=T. Ordinary ring trace at positive torus stage in characteristic p sends 1 to pᵐ=0; this projection sends 1 to 1. | The map is specified, not an arbitrary trace. |
| 3.7 Root duality | For A=𝔽₂[u,v]/uv, F_*A=A⊕(A/(v))x⊕(A/(u))y. τ(x²)=u, τ(y²)=v, τ(xy)=0. Branch duals are (u),(v); periodic alternating u,v resolutions have ker(u)=(v), ker(v)=(u), so Ext^{>0}=0. For p=3 the x,x² branch matrix is [[0,u],[u,0]]. | Bijective adjoint into the constrained dual, not a claim that u is a unit. |
| 3.8 Group trace | d=0 gives identity. Ordered d=1 generator has trace 1. Swapping two generators at d=2 multiplies by −1; scaling one by 2 at p=3 multiplies by 2. | Orientation recorded; no change. |
| 3.9 Continuous duality | Point adjoint is identity. Curve degrees 0 and 1 pair into degree 1. Opposite characters have a nonzero integral projection; nonopposite characters project to 0. v(ζ_{pᵐ}−1) tends to 0, so a fixed positive bound does not control all stages. | Tail estimates are necessary, and present. |
| 3.10 Local polystable duality | Point gives identity; curve pairs into ω₀[−1]. For a surface degrees 0↔2 and 1↔1 pair, with the degree-one swap sign −1. | Correct derived rather than projective assertion. |
| 4.1 Affine/Zariski gluing | On a point, rank-r evaluation pairing is I_r over Oᵃ/p, including I₀ on 0. A curve pairs degrees 0 and 1. | Correct; compatible traces exclude rescaling. |
| 4.2 Rig-isomorphism descent | Identity rig-isomorphism has identity generic pullback and trace. A formal blowup can have a one-dimensional exceptional residue fibre while its generic fibre map is identity. | Derived proper counit is retained. |
| 4.3 Finite quotients | G=1 gives identity. A split C_p torsor has p points over the point, with free permutation action. A fixed point has orbit size 1, not p, and fails the generic-torsor hypothesis. | Correct; wild groups included. |
| 4.4 Induced modules | For finite S₃ and cyclic C_p, regular-module invariants and coinvariants both identify with M. For infinite ℤ, finitely supported invariant functions are 0 but coinvariants are M. For C₃ over 𝔽₂ the averaging scalar 3 is 1. | Finiteness repair is effective. |
| 4.5 Bar duality | G=1 gives identity. For C_p acting trivially on 𝔽_p, H¹=𝔽_p, so invariants are not exact. In S₃, (στ)⁻¹=τ⁻¹σ⁻¹, enforcing the action reversal. For a dimension-d space the uniform ordinary bound used is 2d. | Correct wild and nonabelian tests. |
| 4.6 Quotient trace | For the split C_p torsor, invariant diagonal and coinvariant single-component classes both give M. Unit trace is p=0 mod p; component trace is 1. | Correct induced-module identification; trivial-module norm would be wrong. |
| 4.7 General local duality | Point gives identity. Reduced nodal residue fibre is allowed. t²=ϖ has nonreduced residue fibre and is outside the nice-model statement. | No newly introduced overclaim. |
| 5.1 Global trace | Point trace 1; two-point trace sum; smooth curve top degree 2 maps to Λ via Λ[−2]. | Correct orientation and degree. |
| 5.2 Almost global duality | ℙ¹ has ranks 1 in degrees 0,2 and pairing 1. Two points have matrix diag(1,1), determinant 1 even in characteristic 2, although the unit's trace is 0. | Correct. |
| 5.3 Descent from almost isomorphisms | Zero map 𝔽_p→𝔽_p has one-dimensional kernel and cokernel; tensoring gives nonzero Rᵃ on both. Identity has kernel=cokernel=0. Two-point summation has one-dimensional kernel. | Reflects isomorphisms; detects wrong maps. |
| 5.4 Constant mod-p duality | ℙ¹ pairs endpoint generators to 1; two points pair by I₂. At i=2d+1 both relevant groups are 0 using integer subtraction. In characteristic p, H²_et(ℙ¹,𝔽_p)=0, so the mixed-characteristic hypothesis matters. | Correct. |
| 5.5 Local systems | Rank 0 gives the zero pairing, rank r at a point gives I_r. At p=2 the nontrivial 2×2 unipotent Jordan representation has invariant line and one-dimensional quotient. A Sylow-index prime to p is invertible. | Correct induction, no fixed-vector reproving. |
| 5.6 Finite p-power duality | n=1 recovers mod p. At n=2, ℙ¹ endpoint pairing is 1 in ℤ/p². Unit tensor over Λ_n has no positive Tor; tensoring 𝔽_p over ℤ_p instead has Tor₁=𝔽_p. | Correct repaired coefficient ring. |
| 5.7 Integral trace | Point traces are compatible 1 modulo every pⁿ; ℙ¹ point class has trace 1 integrally. ℤ_p/p becomes 0 after rationalization. | Correct compatibility and normalization. |
| 5.8 Integral duality | For [ℤ_p→p ℤ_p], H¹=𝔽_p; ordinary Hom(𝔽_p,ℤ_p)=0 but Ext¹(𝔽_p,ℤ_p)=𝔽_p. ℙ¹ has free endpoint groups. | Derived duality retains torsion; no false groupwise perfect pairing. |
| 5.9 Rational duality | ℙ¹ endpoint pairing is 1 over ℚ_p. Torsion ℤ_p/p vanishes. Two-point pairing remains I₂, not a one-dimensional quotient. | Correct. |
| 7.1 Zariski constructibility | A point skyscraper has stalk Λ on its support, 0 off it. A constant sheaf uses one stratum. On a disjoint union of points with shifts tending to −∞, each component is bounded but there is no global lower bound. | Local boundedness distinguished from global boundedness. |
| 7.2 Affinoid algebraization | Structural identity still requires H*(Spec A,F)=H*(Spa A,F^an); a point-supported sheaf algebraizes to its closed point. Spec K with constant Λ^r gives Λ^r in degree 0 on both sides. | Correct use of absolute comparison, not a tautological identity square. |
| 7.3 Proper generators | Closed point generator gives a skyscraper. The characteristic-two C₂ Jordan representation is an extension of trivial rank-one objects. At a point the generator with coefficient module M has stalk M. | Correct devissage. |
| 7.4 Constructible proper pushforward | Finite point map has no higher direct images. Normalized N⁰→N¹=id has H⁰(Tot₁)=0 versus H⁰(Tot₀)=Λ. N¹→N²=id has H¹(Tot₂)=0 versus H¹(Tot₁)=Λ. Finite intersections of dense smooth opens stay dense; no infinite intersection is used. | Correct i+1 bound and finite-stage reduction. |
| 7.5 Field extension | Point gives Λ on both sides; ℙ¹ gives ranks 1,0,1. A split rational nodal proper curve gives Λ,Λ,Λ(−1) in degrees 0,1,2 via normalization and the two-branch difference; these are unchanged after algebraically closed field extension. | Singular proper case is retained. |
| 7.6 All-torsion proper base change | Identity exchange is identity. n=1 and empty space give 0 on both sides. For ℙ¹ and n=p² the top group Λ(−1) remains Λ(−1) after base change. | Correct, including wild exponent. |
| 7.7 Constant proper cohomology sheaf | Proper Z=point gives R⁰=Λ and R^{m>0}=0; two points give Λ². With Y=ℙ¹ and Z=point, R²pr_*Λ=0 while H²(Y×Z,Λ)=Λ(−1). | Correct sheaf statement; it is not a claim that total cohomology ignores Y. |

## Lean declaration and context inventory

All five elaborated signatures supplied for this exact head were compared with the complete file and README. There is no section-variable block; every parameter below is explicit. No new elaboration was run, respecting the read-only/no-build instruction. All carriers are small native polynomial-quotient rings and module categories; Ext uses the library's small shifted-Hom construction.

| Declaration (Suggested.lean line) | Context and instance obligations | Values and signature comparison |
| --- | --- | --- |
| monomialRootAlgebra (41) | p,n : ℕ, no primality assumption; Fin(n+1) | n=0 gives (ℤ/p)[t]/(t)=ℤ/p. p=1 gives the zero ring. p=0 gives the integral monomial quotient. These wider helper domains cause no theorem overclaim. |
| monomialRootAlgebraCharP (46) | p,n : ℕ; quotient CharP p instance, proved body | n=0 gives CharP(ℤ/p)p. p=0 has characteristic 0; p=1 is the zero ring of characteristic 1. Evaluation at zero makes every constant in the monomial ideal zero. |
| monomialClass (59) | p,n : ℕ; e : Fin(n+1)→ℕ | All e_i=0 gives 1; all e_i>0 gives 0. At n=1, e=(1,0) gives u≠0, e=(1,1) gives uv=0. |
| monomialRootModule (63) | p,n,m : ℕ; [Fact p.Prime]; restriction along iterateFrobenius | q=pᵐ>0; m=0 has ordinary scalar action, m=1 has c•x=cᵖx. At n=0 the action on 𝔽_p is again ordinary. No division-by-zero exponent is admitted. |
| monomial_root_duality (70) | Same prime context; ∃τ followed by all exponent equations, ∃adj with product equation and bijectivity, ∀k>0 Ext vanishing | n=0: τ=id, adj identifies Hom(𝔽_p,𝔽_p) with 𝔽_p, Ext^{>0}=0. m=0: τ=id and adj x is multiplication by x. At the p=2 node, the nonfree branch duals and positive Ext are as in row 3.7. The p=3 matrix [[0,u],[u,0]] tests the nontrivial fractional classes. |

The supporting definitions are necessary to state the root-duality headline. The single admitted theorem does not follow from one library tactic or one cited lemma: it includes the singular Frobenius-module dual and all positive Ext groups. No padding deletion is warranted. Symmetry of ring multiplication supplies the second adjoint from the stated first adjoint; it is not a missing symmetry hypothesis.

## Headline coverage and pinned ownership

The headline inventory is: formal canonical/Hartogs comparison and traces; integral Faltings traces; characteristic-p root duality; integral product-polystable root duality; polystable continuous and nearby duality; wild quotient descent; global almost duality; geometric mod-p duality; finite-local-system duality; finite p-power derived duality; integral derived duality; rational duality; affinoid constructible algebraization/generators; constructible proper pushforward; proper field-extension invariance; all-torsion proper base change; and the constant proper cohomology sheaf. The characteristic-p headline is stated. The other sixteen groups are individually identified in `Suggested.lean:13–28`, with their missing carriers. No stand-in theorem is substituted for them.

The pinned `Mathlib/AlgebraicGeometry/Sites/Etale.lean:50` defines a topology on schemes étale over a scheme. The corresponding Proetale and ElladicCohomology files also concern schemes. `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean:243` supplies a full-subcategory carrier, not the rigid ringed sites, formal models, specialization, almost coefficients or the trace comparisons required by these headlines. Searching the pins by these objects did not find those constructions. An arbitrary sheaf category on a free site would not make these geometric statements statable.

The native definition checks were:

| Pinned location | Actual contract and separating value |
| --- | --- |
| `Mathlib/LinearAlgebra/PerfectPairing/Basic.lean:39` | IsPerfPair asserts bijectivity of both adjoints; no finite-dimensionality or projectivity field. The zero module pairing is permitted. |
| `Mathlib/RepresentationTheory/Invariants.lean:73` | Carrier condition is fixed by every g; no finite-group assumption. Regular ℤ has invariants 0, unlike finite regular G. |
| `Mathlib/Algebra/CharP/Lemmas.lean:327` | iterateFrobenius uses ExpChar and x↦x^(p^m); m=0 gives x, m=1 gives x^p. |
| `Mathlib/Algebra/CharP/Quotient.lean:45` | quotient' requires natural constants in the ideal to vanish already. Constant evaluation proves that condition for the monomial ideal. |
| `Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean:85` | restrictScalars acts by f(r), not r. At p=2 the scalar coordinate acts on 1 as its square. |
| `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118` | Ext is a small shifted Hom of single complexes. Positive-degree Subsingleton asserts vanishing, not projectivity of the first argument. |
| `TauCeti/RepresentationTheory/Unipotent/PowerOrder.lean:151,158` | The fixed-vector statements retain nonzero finite-dimensional coefficients and exponential characteristic; the p-group may be infinite. The zero representation is excluded. |
| `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean:243` | Sheafy locally affinoid pre-adic objects; this alone does not supply the étale/nearby complexes. |

The pin identifiers were checked against `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. None of the five own fully qualified declaration names collides with a declaration found in the searched roadmaps or pinned libraries.

## Supplier, gap and direction audit

Nineteen named roadmap supplier families were resolved against the supplied main material, current earlier-roadmap material returned by the roadmap service, or the accepted board design where that is the available current document. The particularly consequential contracts were re-read at these locations:

| Supplier location | Contract actually consumed |
| --- | --- |
| `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md`, §§1.5(c), 2.5, 3.2, 8.4, 9.1, 9.5–9.7, 11.2 | Rank-one strict-localization stalks; absolute henselian comparison; overconvergence and maximal-stalk detection; proper amplitude; normalized trace; ordinary 2d bound. The arbitrary p-primary base-change conclusion of this package is not imported. |
| `TauCetiRoadmap/EnhancedDerivedSheaves/README.md`, E5:animation.3 | r≥max(0,b−k+1) for bounded totalization; b=0,k=−i gives i+1. E1 and E2 supply enhancements and towers. |
| `TauCetiRoadmap/DiamondsAndVStacks/README.md`, D1 and D2.2 | Perfectoid component calculus and qc-source/qs-target surjectivity criterion. |
| `TauCetiRoadmap/DiamondEtaleCohomology/README.md`, C0.1, C0.23, C1.7–C1.12, C2.10 | Rigid/diamond comparison, bounded-below étale-to-v embedding, quasi-pro-étale comparison and common-cutoff hyperdescent. |
| `TauCetiRoadmap/PadicHodgeTheory/README.md`, §§2.1, 2.4, 2.7, 7.2 | Completed coefficients, primitive comparison including singular proper constants, perfectness and lattice comparison. |
| `TauCetiRoadmap/HodgeTateAndCanonicalSubgroups/README.md`, §§7.5–7.6 | Proper smooth local systems, finite and integral coefficients, geometric fibres and rigid base changes. |
| `TauCetiRoadmap/AInfCohomology/README.md`, AI.0:integral.1, AI.1, AI.3, AI.4.1, AI.6.1–AI.6.2 | Cotangent twist with image a, décalage and Koszul operations, smooth toric comparison and single-block cyclotomic semistable charts. This does not already provide arbitrary-parameter product-block duality. |
| `TauCetiRoadmap/AdicCoefficientsAndComparisons/README.md`, L2/fp-compactification-limit and L2/fp-strict-cofiltered | Finitely presented compactifications, descending objects/arrows/equalities, strict cofilteredness over qcqs bases. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md:678,4094,4275,4390` | Reflexivity on its stated bases; proper right adjoint; Noetherian upper shriek; relative dualizing pairs. The three valuation extensions are declared separately. |
| `TauCetiRoadmap/AdicSpacesPartIII/README.md:2729,4356,7480,11858` | Formal modules, admissible valuation-ring models, completion/generic comparison and finite locally free traces. The valuation proper mapping/refined model conclusions are separate contracts. |
| `packages/AdicSpacesPartIIPartII/design/plan.json`, RZ.0–RZ.5 | Zariski geometry, normalization/Riemann extension, smooth loci, weakly Shilov points and rigid resolution. The service has no final roadmap README for this name; the sectioned accepted design is present on the board. No absence finding is inferred from that stage. |
| `TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md:965,1016` | Quasi-excellent characteristic-zero resolution and affinoid-scheme specialization, preserving the entire regular locus. |
| `TauCetiRoadmap/RigidAnalyticGeometry/README.md`, §§1.1–1.2 | Classical affinoid noetherianity and excellence. |
| `TauCetiRoadmap/DerivedModuleAlgebra/README.md`, §§0.2–0.17, 1.T.1, 1.1–1.8, 1.E.1, S.1 | Native module-derived operations, towers and Milnor maps, effectivity and double-complex spectral sequence. |
| `TauCetiRoadmap/DerivedDeRhamCohomology/README.md:882` | Completion exchanges with perfectness/connectivity retained. |
| `TauCetiRoadmap/ArithmeticGaloisDuality/README.md`, R02.1.2–R02.2.3, D7.1–D7.3 | Group cochains and derived coefficient comparisons on their stated ordinary coefficient domains; the ringed-site almost extension remains §4.4 here. |
| `TauCetiRoadmap/PerfectoidSpaces/README.md:1618,3419,15178`, P3/P5/P6 | Almost finite presentation, almost sheaves, almost purity, finite-stage descent and perfectoid presentations. |
| `TauCetiRoadmap/AdicSpacesPartII/README.md`, R0–R1 | Affinoid geometry, smooth/étale charts, continuous differentials and tilde limits. |
| `TauCetiRoadmap/EtaleCohomologyFoundations/README.md`, F.0, F.3, G.1–G.3, §§0.5–0.11 | Scheme constructibility, compactification and refinements; the general quasi-excellent direct-image extension remains a declared gap. |

All thirteen gap slugs have named suppliers and the same registration in `design/plan.json` and Exact supplier contracts. Twelve needs sentences agree literally; integral-toric-field-extension writes the same completed tensor product in words in the README. These are mathematical contracts, not unowned assumptions:

| Gap | Why it is an extension rather than a duplicated target |
| --- | --- |
| valuation-formal-proper-mapping | Coherent integral formal higher direct images over nondiscrete valuation rings, including torsion coefficients; noetherian proper mapping and rigid GAGA alone do not give it. |
| reduced-model-cofinality | Reduced residue models over algebraically closed fraction fields, not all admissible models or all ground fields. |
| refined-formal-algebraization | Flat algebraization with smooth generic fibre and prescribed pure dimension. |
| finite-formal-quotients | Admissible finite-group quotient with its generic-fibre comparison over the valuation base. |
| polystable-uniformization-zigzag | Exact reduced/quasiprojective intermediate models and generic torsor quotients needed by local-duality descent. |
| finite-branched-covers | Extension of complement covers as finite normal branched covers, beyond normalization and Riemann extension. |
| proper-generic-smoothness | Dense smooth locus in the target of a proper map, beyond the smooth locus in its source. |
| valuation-upper-shriek | Coherent pseudofunctor and base change on universally coherent valuation quotients, extending the supplier's Noetherian regime. |
| valuation-duality-amplitude | The exact cohomological and relative Tor interval [−d,0]. |
| valuation-canonical-reflexivity | Canonical bottom sheaf on flat valuation-ring models with reduced residue fibre. |
| general-nearby-coherence | One nearby-object contract with affine sections, amplitude, étale base change, integral completeness and reduction; no reference to a consumer-defined category remains. |
| integral-toric-field-extension | Integral power-bounded base extension compatible with the Koszul model; rational comparison alone is insufficient. |
| quasi-excellent-direct-images | Nonproper bounded constructible direct images over general quasi-excellent Noetherian bases, beyond fields and excellent traits. |

The related clauses of each gap describe one construction and its required comparison structure; no unrelated additional theory or supplier-less gap was found. Acceptance is conditional on these declared contracts, as permitted by the brief. Their present absence from supplier implementations is not a finding.

Object searches used the roadmap service and the supplied main, Completed, board and open-head files. All 51 specifically supplied open-head roadmap locations were included. Their only match for the focused Faltings/polystable/Zariski-constructible-proper/almost-Poincaré/root-duality terms was the Bhatt–Hansen bibliography in `TauCetiRoadmap/AdmissiblePairsAndPadicHodgeStructures/README.md:2185`; it does not assign these targets to that roadmap. Broader searches located the parent and the explicitly imported AInf, PadicHodge and local-system interfaces above. This package owns the new traces and duality extension because the parent stops at its analytic trace/prime-to-residue duality and the other suppliers do not state the product-block or wild-descended almost duality. No ownership move is needed in this round.

The prescribed read-only dependency check returned exit 0:

```text
depcheck: 52 roadmaps, 600 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Internal *Needs* references were compared with the target order; no cycle or forward dependency requiring a later target was found. The existing PD.6 plan remnants are the settled maintainer item b F05, not a newly introduced dependency.

## Source-locator audit

The legal cached text was used, not remembered theorem numbers. The following are the 84 distinct line anchors occurring in the README; surrounding definitions, hypotheses and the relevant proof steps were read. A line anchor may cover several nearby theorem locators. This count is not a claim to have checked every line of all eight books/papers.

| Source | Verified line anchors |
| --- | --- |
| Z (54) | 475, 507, 635, 755, 831, 901, 956, 987, 1060, 1125, 1142, 1200, 1266, 1326, 1373, 1657, 1957, 2088, 2093, 2143, 2168, 2195, 2301, 2353, 2420, 2560, 2629, 2774, 2818, 2825, 2834, 3008, 3066, 3106, 3188, 3219, 3227, 3288, 3328, 3392, 3587, 3640, 3677, 3805, 3831, 3877, 3920, 3964, 3968, 3979, 4217, 4253, 4369, 4538 |
| AC (8) | 4286, 4725, 4834, 4854, 4990, 5058, 5504, 7390 |
| SW (1) | 3295 |
| BH (11) | 475, 567, 594, 647, 672, 684, 764, 780, 864, 878, 1102 |
| U (1) | 169 |
| PS (1) | 766 |
| Han (6) | 134, 196, 226, 801, 817, 946 |
| FQ (2) | 756, 1349 |

The main source-sensitive distinctions survive: AC's Hom bounds have the correct variance; Z's traces have cohomological shifts −2d and no extra a factor; finite-root multiplication retains nonunit parameters; mod-p reductions are over the finite coefficient ring; and BH's singular proper field-extension argument uses smooth proper hypercovers instead of assuming every singular affinoid has a toric chart. Source defects identified during this verification are listed below, independently of the package verdict.

## Verified sound

No new S-numbered package finding was established. Twelve earlier findings are repaired; b F05 remains settled as not actionable at the package stage. Counts: **5 Lean declarations read**, **54 numbered README targets read**, **184 README Check bullets tested**, **84 distinct readable source anchors verified**, **19 roadmap supplier families checked**, **13 declared gap contracts matched**, and **51 supplied open-head roadmap locations searched for ownership**. The computed target and declaration tables above record the substantive values; inapplicable test classes are excluded by explicit hypotheses rather than assigned fictional values.

Policy checks found one `import Mathlib`, one admitted headline theorem, real bodies for all four supporting declarations, no `lemma` declaration, no `set_option`, no sorry'd data, no placeholder condition, and no computational algorithm. The README's occurrence of “five lemma” is mathematical prose, not a forbidden Lean declaration. The five own names occur in the README. The full PR diff is confined to this package folder (9 files, 2494 insertions and 43 deletions); this review changed only its report and scratch notes. No command built Lean, modified the checkout's tracked mathematical files, or posted externally.

## Not verifiable

- **H** remains the explicitly settled uncertified source. Its §2.6, Proposition 2.18 and proof, printed p.279 locator is retained without a fresh request; direct textual certification is unavailable. The stated proper-constant-cohomology application was tested on the point, two points and ℙ¹ as recorded above.
- A fresh Lean elaboration was not performed: the task is read-only and forbids Lean builds. The supplied elaborated signatures for this exact head were examined instead; no dropped binder or mismatch was found. This report does not claim an independent successful Lean run.
- The thirteen supplier gaps are future contracts. This review certifies their registration, specificity and separation from current ownership, not their future implementation.
- The AdicSpacesPartIIPartII supplier is available here as its accepted sectioned design, not a completed package README. Its RZ references were checked there; there is no claim to have read a nonexistent final README.
- Complete proofs of the deep geometric results are not present in a roadmap. Computed examples and checked source hypotheses provide adversarial evidence, not a formal proof of all targets.

## Source issues

- **Misprint** in AC at Definition 4.5.2, printed p.95 (AC line 4059): the source says the open subset belongs to the module; it should be an open subset of the formal scheme; affects nothing.
- **Misprint** in AC at Lemma 4.5.22 proof, printed p.100 (AC line 4294): the source cites the formal lemma being proved; it should cite the earlier scheme analogue Lemma 4.1.11; affects the proof.
- **Misprint** in AC at Corollary 4.9.6 proof, printed p.113 (AC line 4839): the source uses F in both Hom arguments; it should retain G in the second argument; affects the proof.
- **Error** in AC at Lemma 4.9.7(2), printed p.113 (AC line 4852): the source reverses the boundedness directions for Hom; it should take the first argument bounded above and the second bounded below; affects a stated result.
- **Misprint** in AC at Theorem 5.5.5, printed p.129 (AC line 5512): the source directs proper pushforward from the target category to the source category; it should run from source to target; affects a stated result.
- **Misprint** in AC at the construction after Theorem 5.5.5, printed p.130 (AC line 5528): the source tensors target-side complexes over the source structure sheaf; it should tensor over the target structure sheaf; affects the proof.
- **Misprint** in AC at Lemma 5.5.6, printed p.130 (AC line 5540): the source places the pushforward comparison in the source derived category; it should be in the target derived category; affects a stated result.
- **Misprint** in AC at Theorem 6.13.6(3), printed p.172 (AC line 7414): the source uses an undefined coefficient E; it should use the completed integral structure sheaf; affects a stated result.
- **Misprint** in Z at Theorem 2.2.3, printed p.11 (Z line 507): the source gives the upper-shriek domain with base R while the theorem fixes S; it should use the finitely presented S-category; affects a stated result.
- **Misprint** in Z at Lemma 2.2.7(2), printed p.13 (Z line 558): the source gives upper shriek the pushforward direction; it should map complexes on Y to complexes on X; affects a stated result.
- **Misprint** in Z at Lemma 2.7.9 proof, printed p.29 (Z line 1281): the source interchanges the affine names A′ and B′ when shrinking X and Y; it should keep each algebra attached to its original scheme; affects the proof.
- **Error** in Z at equation (3.7), compared with Remark 3.4.15, printed pp.43–44 (Z lines 2038, 2084): the source inserts an extra power of 1−ζ_p into the rational comparison; it should use the unscaled inverse comparison dictated by Φ=Sch∘j; affects a stated result.
- **Misprint** in Z at Lemma 3.6.4 proof, printed p.46 (Z line 2206): the source cites the scheme flatness lemma for a formal canonical sheaf; it should cite the formal consequence Corollary 2.4.5; affects the proof.
- **Misprint** in Z at Lemma 4.2.7 proof, printed p.50 (Z line 2399): the source adds a further shift d to the limit of dualizing complexes; it should omit that additional shift; affects the proof.
- **Error** in Z at Remark 4.2.14 and Lemma 4.2.15, printed pp.53–54 (Z lines 2536, 2563): the source treats multiplication of complementary weight lines as an isomorphism; it should retain the parameter factor, which need not be a unit; affects a stated result.
- **Misprint** in Z at Definition 4.3.1, printed p.59 (Z line 2828): the source allows integer exponents in the polynomial monomial notation; it should require nonnegative exponents; affects a stated result.
- **Misprint** in Z at Theorem 4.3.16 proof, printed p.65 (Z line 3150): the source gives the integral trace a reduced target; it should use the integral canonical target before reduction; affects the proof.
- **Misprint** in Z at Theorem 4.3.16 proof, printed p.65 (Z line 3162): the source tensors integral objects over the mod-p structure sheaf; it should tensor over the integral structure sheaf; affects the proof.
- **Misprint** in Z at Theorem 4.4.1 proof, printed p.66 (Z line 3209): the source interchanges the labels of quotient models; it should preserve the source and quotient labels of the stated diagram; affects the proof.
- **Gap** in Z at Theorem 4.4.24, printed p.74 (Z line 3587): the source asserts the pairing on arbitrary separated admissible models with smooth generic fibre; it should assume reduced residue fibre or extend the defined trace and descent beyond nice models; affects the proof.
- **Error** in Z at Definition 5.2.1, printed p.75 (Z line 3640): the source shifts the global trace target by positive 2d; it should shift by negative 2d; affects a stated result.
- **Misprint** in Z at Theorem 5.5.2, printed p.81 (Z line 3922): the source omits the cohomological shift from the finite-coefficient duality target; it should include the shift −2d; affects a stated result.
- **Misprint** in Z at Theorem 5.5.2 proof, printed p.81 (Z line 3928): the source reduces a finite-coefficient complex by tensoring over ℤ_p; it should tensor over ℤ/pⁿ to obtain the stated reduction; affects the proof.
- **Misprint** in Z at Theorems 5.5.4 and 5.5.6, printed pp.82–83 (Z lines 3969, 3980): the source omits the cohomological shift from the integral and rational adjoint targets; it should include −2d; affects a stated result.
- **Misprint** in Z at Definition D.1, printed p.95 (Z line 4513): the source labels a mod-p trace with a mod-pⁿ subscript; it should consistently use the mod-p coefficient label; affects a stated result.
- **Misprint** in Z at Remark D.10, printed p.97 (Z lines 4625, 4629): the source mixes mod-pⁿ notation into a mod-p comparison diagram; it should keep the diagram's mod-p coefficients; affects the proof.
- **Misprint** in Z at Lemma D.11, printed p.97 (Z line 4642): the source labels a coefficient sheaf by X where the diagram uses X′; it should use the pulled-back coefficient sheaf on X′; affects a stated result.
- **Misprint** in Z at Lemma D.13 proof, printed p.99 (Z line 4717): the source reverses the ring and plus ring in an adic spectrum; it should put the Tate ring first and its plus ring second; affects the proof.
- **Misprint** in BH at Remark 2.30, printed p.13 (BH line 581): the source places the complement Y minus T inside T; it should place that complement inside Y; affects nothing.
- **Misprint** in BH at Theorem 3.10 proof, printed p.18 (BH line 784): the source places the dense smoothness open in the source X; it should place it in the target Y; affects the proof.
- **Gap** in BH at Lemma 3.25 proof, printed p.25 (BH line 1113): the source chooses a toric perfectoid torsor for an arbitrary possibly singular affinoid; it should first reduce proper cohomology through smooth proper hypercovers; affects the proof.
- **Misprint** in Han at Proposition 4.6 proof, printed p.22 (Han line 924): the source calls Y regular after reducing only X to the regular case; it should say X is regular and resolve Y preserving X; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "0c4ae2fab722220c184999105059c92704270e2d", "job": "RT-ClassicalAdicEtaleCohomologyPartII~2a", "model": "gpt-6-astra", "worker": "chris-38"} -->
