# Repair report: ClassicalGroupsPartII

The review groups retain the original finding identifiers. The shared density repair is recorded under both findings that raised it. All edits are in packages/ClassicalGroupsPartII/README.md and packages/ClassicalGroupsPartII/sources.toml, together with this report.

# Review r2a

## F01 (P2) — applied

Contractions only for 2≤k≤g → contractions in every degree k≥2, zero boundary maps, and primitives only through degree g. CG.1.5 now types the twisted commutator and raising maps explicitly. Checks compute degrees 0, 1, 2 at g=2, and the negative coefficient at g=1, k=2. Consumers retain their original primitive and surjectivity ranges.

## F02 (P1) — applied

Density assumed inside the point comparison → an owned GSp rational-point density target in CG.1.2, using ReductiveGroups Layer 7/§7C coordinates and an infinite-grid argument. Milne 17.93(a) supplies the density locator; 4.32 supplies the stabilizer step. Three new Checks test the rational big cell, failure over F₂, and the insufficient multiplier-one fibre.

## F03 (P3) — applied

Generic SplitK0 Checks → rank-one standard-square decomposition, distinct unit/multiplier classes, and the inverse multiplier. Their dimensions are 4=3+1 and 1=1=1; scalar-2 characters distinguish 1, 4 and 1/4. The generic class identities remain in the API prose. No Lean padding was added.

# Review r2b

## F01 (P2) — applied

J identified with JFin → J=−JFin in Conventions, the native supplier contract and CG.1.4–1.5. The positive contraction convention is preserved; a Check computes the library pairing as −1. The multiplier, coordinate equations and Sp fibre are unchanged by negating the form. The raising-map discussion now also accounts for negating both operators.

## F02 (P2) — applied differently

Unstated Layer 6 criterion → the pinned TauCeti.HopfIdeal.eq_augmentation_of_isNormal_of_smoothUnipotent_of_isFaithful, with its algebraic-closure, reducedness, finiteness and complete-reducibility hypotheses. CG.0.2 supplies the faithful simple standard action and native characteristic-zero smoothness/reducedness. The supplier contract and Needs agree. No unipotent-fixed-vector gap is needed: the pin contains the criterion and its fixed-vector input.

## F03 (P3) — applied

Unnamed arithmetic-statistics deferral → explicit ownership of this coordinate presentation and its matrix-points comparison. The generic Hopf dictionary remains with ReductiveGroups. No blanket assertion that other roadmaps never mention GSp was added: ownership searches distinguish uses of GSp from construction of this coordinate specialization.

## F04 (P3) — applied

Unnamed native torus, Weyl representatives and abstract representation ring → exact pinned declarations in the supplier contracts, CG.0.4, CG.0.5 and CG.1.1, including their Needs. The contracts retain commutative-ring, distinct-index and field/monoid hypotheses. Their defining matrices and conjugation formulas were read at the pin.

## F05 (P3) — applied

Proposition 4.32 cited as density → Theorem 17.93(a), p.382, for density and Proposition 4.32, p.96, for stabilizers. This is the same mathematical repair as r2a F02. Both README References and the existing milne manifest entry now distinguish the two results; no second source key was created.

# Evidence and ownership

The cached legal sources were read directly. Source text was not copied into the package. All cited works already have certified manifest entries; no new source or missing-reference request was needed.

| Claim | Exact evidence read | Consequence |
| --- | --- | --- |
| Yu's matrix/form convention | yu line 3745, especially line 3747 through line 3755; Remark 7.1.1, printed p.64 | Its upper-right block is +I, matching J=−JFin. |
| Support and character endpoints | yu line 3730, line 3736, line 3761 and line 3766 through line 3770; §7.1 and Remark 7.1.1, p.64 | Integral reciprocal invariants, primitive correction and constituent ring are the existing endpoints. |
| Stabilizers require density | milne line 4245 through line 4249; Proposition 4.32, p.96 | Density is a premise, not the conclusion of this proposition. |
| Rational-point density | milne line 15761 through line 15771; Theorem 17.93(a), p.382 | A connected group variety over an infinite perfect field has dense rational points; our smooth group is reduced, so the density is schematic. |
| Base change | milne line 4256 and line 4281 through line 4287; Corollary 4.34 and Exercise 4-4(a,b), pp.96–97 | Invariant and extended-Hom comparisons retain arbitrary field-extension hypotheses. |
| Normal-unipotent and faithful criterion | milne line 16482 through line 16504; Lemma 19.16, Proposition 19.17, Corollary 19.18, Example 19.19, p.401 | Normality stabilizes the nonzero fixed space; faithfulness kills the subgroup after simplicity makes the fixed space the whole module. |
| Type C, root order and split highest weights | milne line 19149, line 19287, line 19291 and line 19304 through line 19319; Summary 21.98, p.461, Theorem 22.2 and Complements 22.3–22.6, pp.464–466 | Roots and dominance match; integer central twists remain unrestricted. |
| Central descent and semisimplicity | milne line 19367, line 19813, line 19859 through line 19877; Complement 22.12, p.466, Lemma 22.39 and Theorem 22.42, pp.477–479 | Descent uses the actual lattice; characteristic zero supplies complete reducibility. |
| Contraction and primitive dimensions | sternberg line 5020 through line 5058 and line 5143 through line 5152; §7.9, pp.131–133 | The contraction formula extends to all exterior degrees; surjectivity is used only for 2≤k≤g. The dimension is binom(2g,k)−binom(2g,k−2), not the misprinted lower index at line 5054. |

The pins in lake-manifest.json are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The Tau Ceti checkout HEAD agrees and has no local modifications. These changed contracts were checked in the pinned files:

| Declaration | File and lines | Exact restriction relevant here |
| --- | --- | --- |
| Matrix.J | Mathlib/LinearAlgebra/SymplecticGroup.lean:58 | fromBlocks 0 (−1) 1 0 over a commutative ring. |
| TauCeti.JFin; JFin_two_eq | TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/Basic.lean:243, 263 | Transport preserves the opposite sign; entry (e₁,f₁) is −1. |
| TauCeti.GLSymplecticFin.diagonal | TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/Diagonal/Basic.lean:95 | Unit-valued coordinates over a commutative ring, with paired inverse entries. |
| differenceShortRootWeylElement | TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/Weyl.lean:79, 404 | Distinct indices; the normalizer statement uses the actual symplectic diagonal torus. |
| positiveLongRootWeylElement; negativeLongRootWeylElement | TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/Weyl.lean:422, 428, 523, 563, 578, 603 | Both representatives induce reciprocal inversion on Sp; in GSp the corresponding paired exchange fixes t. |
| TauCeti.repRing | TauCeti/RepresentationTheory/RepresentationRing/Basic.lean:106 | SplitK0 (FDRep k G), for a field and a monoid; it imposes split relations. |
| TauCeti.smoothCommHopfAlgProperty_of_charZero; TauCeti.HopfAlgebra.isReduced_of_charZero | TauCeti/Algebra/AlgebraicGroup/Smooth/CharZero.lean:148, 165 | Finite-type commutative Hopf algebra over a characteristic-zero field; no reductivity premise. |
| TauCeti.Comodule.isCompletelyReducible_of_isSimpleOrder | TauCeti/Algebra/Coalgebra/Comodule/LinearlyReductive.lean:154 | Simplicity of the subcomodule lattice gives the precise complete-reducibility predicate used by the criterion. |
| TauCeti.HopfIdeal.eq_augmentation_of_isNormal_of_smoothUnipotent_of_isFaithful | TauCeti/Algebra/AlgebraicGroup/Unipotent/Radical/Faithful.lean:62–66, 94–114 | Algebraically closed field; reduced finite-type H; finite-dimensional faithful completely reducible comodule; normal ideal with smooth unipotent quotient; common universe. |
| Its fixed-vector input | TauCeti/Algebra/AlgebraicGroup/Unipotent/Embedding.lean:108–112 | Reduced finite-type Hopf algebra over an algebraically closed field, finite-dimensional nonzero comodule, and unipotence of every point. This suffices on the geometric fibre; no new arbitrary-field fixed-vector target is requested. |

Thus the section-citation criticism in r2b F02 is correct, but its suggested new supplier gap would duplicate pinned theory. The GSp proof first establishes geometric smoothness/reducedness, constructs the matrix coaction and proves it simple and faithful, then specializes the existing normal-subgroup criterion. It does not assume the desired semisimplicity of every GSp representation.

Every cross-roadmap citation was compared with main: ReductiveGroups Layers 0, 1, 3, 6, 7, §7C, §10A and §10B; ClassicalGroups Layers 0–5; LieHighestWeight Layer 4. In particular ReductiveGroups §7C's early split root maps and ordered coordinates retain arbitrary split fields; the C-only covering argument is not used for arbitrary K. ClassicalGroups Layer 2 supplies the column Schur/exterior comparison. Shape examples were read from ClassicalGroups, SchurWeyl and Completed/OrthogonalL2Bases.

Ownership was searched by object in main, Completed, board packages, the indexed roadmap search, and the README/Suggested.lean of all 33 explicitly supplied sibling heads. The sibling matches concern automorphic coefficients, polarized deformation conditions and related uses, not this coordinate presentation or primitive comparison. Generic unipotent theory remains native/ReductiveGroups; generic split root coordinates remain ReductiveGroups Layer 7/§7C. This Part II owns only their GSp specialization and the existing character endpoints. No fully qualified acceptance name collides with a readable supplier declaration. Unsupplied open-head files were not inspected; indexed search hits alone were not treated as supplier contracts.

# Adversarial mathematics pass

Write w_i=t/z_i, x_i=z_i+w_i, q_i=e_i∧f_i and Ω=Σq_i. All representation assertions retain g≥1 and a characteristic-zero field. Integral assertions admit g=0 except the two positive-rank headlines. The field hypothesis excludes the zero ring, characteristic 2/3 coefficients and DVR coefficients. Value algebras may be zero or nonreduced. Negative exterior indices denote zero, never a conversion by truncated subtraction. No q, topological compactness, fan, cover or polynomial-degree parameter occurs.

The following rows cover the conventions and mathematical targets, including their API identities, proof formulas and examples. Values at the torus are formal unless a point is specified. Each retained Lean declaration has a separate row in the following table.

| Statement | Instances tried | Computed values on the two sides | Result; change |
| --- | --- | --- | --- |
| Rank/coefficient convention | g=0, g=1, characteristics 2 and 3 | At g=0 the matrix equation gives 0=s·0 for every s; at g=1 s=det; 2=0 in F₂ and 3!=0 in F₃ | Representation rank/characteristic restrictions retained. |
| Algebraic comodule convention | G_m weight 1, trivial weight, F₂ points | At 2, actions are 2 and 1; over F₂ the two functions t and 1 agree at its sole unit although their coefficients at weight 1 are 1 and 0 | Algebraic coactions are not arbitrary point representations. |
| Form and basis | g=1, e₁,f₁ | Our pairings are 1,−1; library pairings are −1,1 | Corrected J=−JFin throughout. |
| Equivalent matrix equations and sign invariance | h=diag(2,3) | hJhᵀ=hᵀJh=6J; with JFin both equal 6JFin | Same multiplier 6, opposite pairing; repaired adapter. |
| Torus and centre convention | diag(2,3), 2I | (t,z)=(6,2),(4,2); scalar-degree values are d(t)=2,d(z)=d(w)=1 | Independent multiplier retained. |
| Dominant lattice convention | g=1, weights (−1,0),(0,−1) | First is dominant of degree −2; second is not dominant, degree −1 | Negative central twists included. |
| Integral coefficient convention | g=1 orbit z²+w² and constant orbit | x²−2t=z²+w², coefficients 1,1; constant orbit is 1, whereas p₀=2 | No Weyl averaging or doubled zero orbit. |
| Exterior-degree convention | k=−1,0,1,2g+1 | E₋₁=0,E₀=1,F₁=E₁−t·0=E₁,E_(2g+1)=0 | Signed indices retained. |
| Positive convention | −x₁ and t⁻¹ | Coefficients of −x₁ are −1,−1 with h=0,0; t⁻¹ has coefficient 1 with h=−1 | Positivity is support, not coefficient sign. |
| CG.0.1 coordinate functor | g=1, diag(2,3), zero matrix | s=det=6, D=1/6; zero matrix has D·det=0≠1 over Q | Coordinate presentation unchanged. |
| CG.0.1 Hopf multiplication direction | h=diag(2,3), j=[[0,1],[−1,0]] | hj=[[0,2],[−3,0]], jh=[[0,3],[−2,0]]; Δ(x₁₂)(h,j)=2≠3 | Noncommuting witness fixes coaction order. |
| CG.0.1 counit, antipode, scalar product | I, h above, h·diag(5,7) | s(I)=1, s(h⁻¹)=1/6, s(product)=210=6·35 | Group-like multiplier and inverse verified. |
| CG.0.1 Sp fibre | s=1, diag(2,1/2) | hJhᵀ=J; ideal of equations for J is the same as for −J | Fibre comparison preserved after sign repair. |
| CG.0.2 central kernel | ε=1,−1 | π(I,1)=I; π(−I,−1)=I; c²=1 implies c⁻¹=c | Kernel μ₂, not either factor separately. |
| CG.0.2 fppf lift | diag(1,2) over Q | Required c²=2 has no Q-solution; in Q[C]/(C²−2), (C⁻¹h)J(C⁻¹h)ᵀ=J | Point surjectivity is not presumed. |
| CG.0.2 nonreduced lift | Q[ε]/ε², s=1+ε | (1+ε/2)²=1+ε; discarded term ε²/4=0 | Nonreduced value algebras retained. |
| CG.0.2 faithfulness and reduction | g=1, diag(2,3) | Matrix coefficients recover s=6 and inverse-matrix coefficients recover s⁻¹=1/6; smooth geometric coordinate rings have zero nilradical | Native criterion's input hypotheses supplied before reductivity. |
| CG.0.2 complete-reducibility premise | U₂ on K² | u(a)e₁=e₁; u(a)e₂=e₂+ae₁; fixed space dimension 1; an invariant complementary line would require a=0 for all a, false at a=1 | Faithful nonreductive example fails complete reducibility; new Check. |
| CG.0.2 normality premise | U₂ inside GL₂, pair-swap j | j u(a) j⁻¹=[[1,0],[−a,1]], different from U₂ at a=1 | A nonnormal unipotent subgroup is not incorrectly killed by the native criterion. |
| CG.0.3 cover-weight pullback | (m,u)=(−1,2),(0,1) at g=1 | Images (2,0),(1,1); inverse m=(d−u)/2 gives −1,0; (u,d)=(1,0) fails parity | Both directions of lattice/parity identification retained. |
| CG.0.3 simple roots/coroots | g=0,1,2 | Empty roots at 0; α=(−1,2) has degree 0 at 1; roots (0,1,−1),(−1,0,2) pair as u₁−u₂,u₂ at 2 | Chamber and central direction consistent. |
| CG.0.3 root order | 0, α,2α,e₁,e_t in rank one | 0≤α and 0≤2α; α≤0 false; 0≤e₁ and 0≤e_t false by degrees 1,2 versus 0 | Reflexive relation but not symmetric; both set directions tested. |
| CG.0.4 torus/Hopf restriction | g=1,t=6,z=2; t=1,z=2 | diag(2,3), determinant 6; diag(2,1/2), determinant 1; off-diagonal entries 0 | Named native diagonal specializes at t=1. |
| CG.0.4 scalar subtorus | g=2,c=2 | Coordinates (t,z₁,z₂)=(4,2,2); paired entries 2,2 | One scalar parameter inside three torus parameters. |
| CG.0.5 pair flip | g=1,(m,u)=(−1,2) | Flip gives (1,−2), twice gives (−1,2); both degrees 0; e_t fixed | Native representative preserves this action after sign repair. |
| CG.0.5 permutation direction and relations | swap at g=2, cycle at g=3 | Swap takes (−1,2,−3) to (−1,−3,2) and back; cycle sends z₁ to z₂, inverse convention sends z₁ to z₃ | Inverse pullback convention retained. |
| CG.0.5 Laurent/fixed-ring action | z²,t⁻¹,−3,x₁ | Flip sends z² to t²/z², fixes t⁻¹,−3,x₁; rank-two transposition sends x₁ to x₂≠x₁ | Both permutation and flip conditions required. |
| CG.0.6 representation descent | Sp standard u=1, d=0,1; u=0,d=±2 | Kernel scalar at ε=−1 is −1,+1; for d=±2,u=0 it is +1 | Standard degree 0 excluded, V and ν±1 descend. |
| CG.1.1 ring, dimension and point evaluation | g=1,V²,unit,ν,ν⁻¹ | 4=3+1; x²=(z²+t+w²)+t; dimensions 1,1,1; values at 2I are 1,4,1/4 | Replaced generic Checks with GSp-discriminating ones. |
| CG.1.1 generic split relations | 0,1,V⊕ν,V⊗ν | Dimensions 0,1,3,2; classes give 0,1,[V]+[ν],[V][ν] | Retained API identities outside Checks. |
| CG.1.2 standard coaction and boundary powers | e₁ under diag(2,3), Λ⁰,Λ³ at g=1 | e₁↦2e₁; dimensions 1 and 0; torus weights z,w both degree 1 | No inverse matrix action. |
| CG.1.2 action over nonreduced values | (1+ε)I over Q[ε]/ε² | Standard eigenvalue 1+ε, Λ² eigenvalue (1+ε)²=1+2ε | Coaction statement includes nilpotent tests. |
| CG.1.2 density on rank-one chart | a=2,b=3,r=5,s=7 | u⁻diag(r,s)u⁺=[[5,15],[10,37]], determinant 185−150=35=rs | New chart Check; infinitely many parameters detect Laurent coefficients. |
| CG.1.2 density finite-field failure | GL₂(F₂); [[α,1],[1,0]] over F₄ | Six rational points; x₁₁²−x₁₁=0 on each, but α²−α=1 and determinant 1 at the F₄ point | New negative control excludes finite fields. |
| CG.1.2 density cannot use only Sp | s−1 at Sp and at 2I | Values 0 and 4−1=3 | New Check distinguishes the group being tested. |
| CG.1.2 subspace criterion | K e₁,0,V | Torus preserves e₁, pair swap sends it to −f₁; dimensions of actual stable boundary subspaces are 0 and 2g | Both implications retain all GSp points and algebraic coaction. |
| CG.1.3 multiplier twists | m=0,1,−1; scalar 2 | Characters 1,t,t⁻¹; scalar values 1,4,1/4; t·t⁻¹=1 | Integral powers and algebraic dual preserved. |
| CG.1.4 contraction and sign | e₁∧f₁,f₁∧e₁; scalar 2 | κ values 1,−1; transformed first image 4=ν(2I); library-form values −1,1 | Repaired native comparison, preserved positive contraction. |
| CG.1.4 degree range and primitive definition | g=1,κ₂; k=2g+1; P₀,P₁ | κ₂(q₁)=1, exterior source above top is 0; dim P₀=1,dim P₁=2g | Full κ family; P₂ absent at g=1. |
| CG.1.5 raising map | Ω at g=2; scalar 2 | L₀(1)=q₁+q₂; scalar action on each q_i is 4=ν(2I) | Source ν has the correct twist. |
| CG.1.5 twisted commutator | (g,k)=(2,0),(2,1),(2,2),(1,2) | κL,Lκ values: 2,0; e₁,0; Ω,Ω; 0,q₁. Differences: 2,e₁,0,−q₁=(g−k) times the vector | Extended degrees and negative integer coefficient tested. |
| CG.1.5 Lefschetz string coefficient | Primitive 1, (g,j)=(2,1),(2,2),(3,2),(3,3) | κL^j=j(g−j+1)L^(j−1): coefficients 2,2,4,3; hence 2,2Ω,4Ω,3Ω² | Newly explicit string identity tested with nonzero values. |
| CG.1.5 surjectivity, dimensions, tensor splitting | (g,k)=(2,2),(3,3), k=1 | κ₂ onto K since κ₂(q₁)=1; dimensions 6−1=5,20−6=14,2g−0=2g; antisymmetrizer squares to itself since a_k²=k!a_k and k!≠0 | Primitive range and signed correction retained. |
| CG.1.6 Hom/weight extension | Q→C, Hom(1,1) | C⊗Q Q→C sends a⊗b to ab, dimension 1→1 over respective fields; unextended Q→C misses i | Extended comparison is an isomorphism, unextended functor is not full. |
| CG.1.6 reflection of isomorphism | One-dimensional modules; determinant locus | Identity determinant 1 remains 1; zero determinant 0 remains 0; a nonzero polynomial nonvanishing at a K-point is not identically zero over infinite F | Infinite-field descent argument retains its needed hypothesis. |
| CG.1.7 Cartan model | g=2,u=(3,1); rank one m=−1,u=0 | (a₁,a₂)=(2,1); 2(1,0)+(1,1)=(3,1); tensor degree 2+2=4=Σu; twist degree −2 | Specified top vector ties the model to its weight. |
| CG.1.8 classification comparison | g=1,(m,u)=(-1,0),(0,1),(1,2) | GL₂ top exponents (−1,−1),(1,0),(3,1); dimensions 1,2,3; End(unit)=Q or C, dimension 1 | Negative twists and scalar endomorphisms retained. |
| CG.1.9 ring base change | K=Q,C; standard and multiplier | Simple coefficients map 1↦1, standard dimensions 2g↦2g, multiplier dimension 1↦1 | Basis-preserving ring map, not category equivalence. |
| CG.2.1 formal character and trace | 0,1,V,ν⁻¹ at g=1 | Characters 0,1,z+w,t⁻¹; at diag(2,3) traces 0,1,5,1/6; augmentations 0,1,2,1 | Native weights and multiplier signs agree. |
| CG.2.2 highest-weight injectivity | g=1,ν⁻¹−1; relation among determinant twists | Laurent polynomial t⁻¹−1 has coefficients 1 at (−1,0), −1 at 0; each distinct twist has coefficient 1 at its own highest weight | Nonzero class detected; finite partial-order maximality works. |
| CG.2.3 generating polynomial | g=0,1,2,3 | g=0 gives 1; g=1 gives 1+xU+tU²; E₂=e₂+gt at g=2,3; E₃=e₃+2te₁ at g=3 | Boundary values and binomial factors recomputed. |
| CG.2.3 primitive correction | g=1,k=1; g=2,k=2; g=3,k=3 | F₁=x; F₂=x₁x₂+t, augmentation 5; F₃=e₃+te₁, augmentation 8+6=14 | Signed correction agrees with primitive dimensions. |
| CG.2.4 orbit recurrence | p₀,p₁,p₂,p₃ at g=1 | 2,x,x²−2t,x³−3tx equal 2,z+w,z²+w²,z³+w³ | Integer coefficients suffice, no division by 2. |
| CG.2.4 triangular change | g=2 and 3 | e₂=F₂−(g−1)t; at g=3 e₃=F₃−tF₁; leading coefficient 1 in each | Polynomial inverse integral. |
| CG.2.5 primitive characters | (g,k)=(2,2),(3,3) | aug(E₂−tE₀)=6−1=5; aug(E₃−tE₁)=20−6=14 | Same contraction decomposition and characters. |
| CG.2.6 full character equivalence | g=1,Sym²V,ν⁻¹ | ch(Sym²V)=x²−t=z²+t+w²; inverse x²−t gives [V]²−[ν]; t⁻¹ gives [ν⁻¹] | Specified generators exclude translations. |
| CG.3.1 exponent normal form | g=1, z²w³ and t⁻¹ | (m,u)=(3,−1), h=2, normal form t²w=z²w³; t⁻¹ has h=−1 and no form in nonnegative letters | Both membership directions tested. |
| CG.3.1 subset inequalities and superadditivity | (0,1),(0,−1) | h-values 0,−1; h(sum)=0≥−1; subset sums for (3,−1) are 3,2 with minimum 2 | Functional is not incorrectly additive. |
| CG.3.2 positive orbit normal form | g=1,z²+w² and constant orbit | Positive orbit inverse X²−2T; constant inverse 1; all T exponents 0 or 1 | No negative multiplier powers or doubled constant. |
| CG.3.3 constituent subring versus Z[[V]] | g=1,ν in degree 2 | V²=Sym²V⊕ν, dimensions 4=3+1; character t is independent of x | All constituents are needed; [V] alone insufficient. |
| CG.3.3 multiplication closure | unit at d=0; ν times V | Degrees 0 and 2+1=3; ν⊗V has character tx and is a summand of V³ | Z-span of constituent classes closed under multiplication. |
| CG.3.4 exact occurrence, both directions | g=1,(m,u,d)=(0,0,0),(0,0,2),(1,0,2),(-1,2,0) | Conditions give true,false,true,false; scalar 2 acts as 1,4,4,1 respectively on the relevant tensor degree, while L(-1,2) has dimension 3 and is not in V⁰ | Degree equality alone does not suffice; m≥0 necessary. |
| CG.3.4 Cartan sufficiency | g=2,u=(3,1),m=2 | Primitive tensor degree 4, multiplier degree 4, sum 8=2m+Σu | Exact tensor degree, not only some occurrence. |
| CG.3.5 constituent character equivalence | g=1,Sym²V and ν⁻¹ | Sym² character has weights (0,2),(1,0),(2,−2), h=0,1,0; ν⁻¹ has h=−1 | Polynomial character included, inverse multiplier excluded. |
| CG.3.6 generation/localization | ν⁻²P₁ and primitive k=1 | Multiply by ν² to get P₁; t⁻²F₁·t²=F₁; [P₁]=[V]−[ν]·0=[V] | Denominators cleared without rationalizing integer coefficients. |

An exact-integer scratch calculation independently evaluated κL−Lκ on every basis wedge for g=0,1,2,3 and all 0≤k≤2g: 85 basis wedges, zero failures. At (g,k)=(2,2) it gave Ω−Ω=0; at (1,2) it gave 0−q₁=−q₁. It also computed the string coefficients 2,2,4,3 above. This tests formulas; it is not a proof of the general targets.

The light definitions and all three acceptance headlines were checked individually:

| Declaration | Instances tried | Computed values | Result; change |
| --- | --- | --- | --- |
| Weight | g=0,1 | Z×0≅Z; Z×Z≅Z²; (−1,0) present | Native lattice, unchanged. |
| Laurent | g=0,1 | Coefficients distinguish 1,t,t⁻¹; t²t⁻²=1 | Formal basis, unchanged. |
| monomial | weights 0,(−1,2),(1,−2) | [0]=1; [−1,2][1,−2]=1; coefficient at its own weight 1 | Real body, unchanged. |
| t | exponent (1,0) | Coefficient 1; scalar degree 2; value at 2I is 4 | Independent multiplier, unchanged. |
| tInv | exponent (−1,0) | Coefficient 1; degree −2; value 1/4; t·tInv=1 | Inverse, unchanged. |
| z | g=1,i=0 | Weight (0,1), degree 1, scalar-2 value 2 | First letter, unchanged. |
| pairedZ | g=1,i=0;t=6,z=2 | Weight (1,−1), degree 1, value 3; z·pairedZ=6=t | Not ordinary inverse, unchanged. |
| permWeight | transposition and three-cycle | (−1,2,−3)↦(−1,−3,2); e₁↦e₂ for cycle (123) | Pullback direction, unchanged. |
| flipWeight | (−1,2),e_t | (−1,2)↦(1,−2)↦(−1,2); e_t↦e_t; degree 0 both | Involution, unchanged. |
| permLaurent | z₁²,t⁻¹,−3 | Transposition gives z₂²,t⁻¹,−3 | Induced automorphism, unchanged. |
| flipLaurent | z²,z⁻¹,t⁻¹ | Images t²/z²,z/t,t⁻¹ | Includes negative exponents, unchanged. |
| invariantSubring | g=0,1,2 | Full Laurent ring at 0; x fixed and z not fixed at 1; x₁↦x₂ under rank-two swap | Both generator families, unchanged. |
| pairSum | g=1 | Coefficients 1 at (0,1),(1,−1); coefficient 0 at (0,−1); augmentation 2 | Reciprocal sum, unchanged. |
| exteriorCharacter | g=0,1,2 | g=0: E₋₁=0,E₀=1,E₁=0; g=1: E₁=x,E₂=t; g=2:E₂=x₁x₂+2t,E₄=t² | Signed boundaries, unchanged. |
| fundamentalCharacter | (g,k)=(1,1),(2,2),(3,3) | x,x₁x₂+t,e₃+te₁; augmentations 2,5,14 | Primitive correction, unchanged. |
| MultLaurent | exponents 2,−2 | T²,T⁻² have respective coefficient 1 at 2,−2; product 1 | Laurent coefficients, unchanged. |
| coeffT | exponents 1,0,−1 | Coefficients 1,0,0 | Positive basis element, unchanged. |
| coeffTInv | exponents −1,0,1 | Coefficients 1,0,0; coeffT·coeffTInv=1 | Inverse basis element, unchanged. |
| fullInvariantPresentation | g=0,1,2 | g=0: Z[T±1]→Z[t±1]; g=1: X↦x,T↦t,T⁻¹↦t⁻¹; g=2: inverse e₂=X₂−T | Deep integral headline retained. |
| positiveSubring | g=0,1 | B₀=Z excludes t despite h(t)=1; B₁ contains z,w,−x,t and excludes t⁻¹ | Construction admits rank zero, unchanged. |
| positiveInvariantSubring | g=0,1 | At 0 equals Z; at 1 contains −x,t and excludes z,t⁻¹ | Fixed intersection, unchanged. |
| coneValue | rank-one (0,1),(1,−1),(0,−1) | Values 0,0,−1; h(e)+h(−e)=−1≤h(0)=0 | Superadditive, unchanged. |
| mem_positiveSubring | g=1,−x,t⁻¹,0; g=0,t | At 1: membership true,false,true; support inequalities true,false,vacuously true. At 0: membership false but h(t)=1≥0 | Explicit 0<g binder necessary and present. |
| positiveInvariantPresentation | g=1,2; rank-zero negative control | Variables map to t,F_k; at 1 inverse(z²+w²)=X²−2T; at 2 inverse(e₂)=X₂−T; at 0 B₀=Z excludes t | Explicit 0<g binder retained; no rank-zero presentation claimed. |

# Validation

- Suggested.lean elaboration from the content checkout: exit 0. Exact diagnostics after expressing the file relative to the repository:

  ```text
  packages/ClassicalGroupsPartII/Suggested.lean:116:8: warning: declaration uses `sorry`
  packages/ClassicalGroupsPartII/Suggested.lean:137:8: warning: declaration uses `sorry`
  packages/ClassicalGroupsPartII/Suggested.lean:143:8: warning: declaration uses `sorry`
  ```

- A single scratch file containing the acceptance file and `#check @name` for all 24 declarations elaborated: exit 0, with the same three expected warnings. Every elaborated type was compared with its README statement. No binder disappeared; in particular fullInvariantPresentation quantifies every natural g, whereas mem_positiveSubring and positiveInvariantPresentation explicitly take 0<g. No Lean statement needed changing.
- Suggested.lean remains 149 lines, with one import Mathlib, 21 real-bodied definitions/aliases and three headline theorem admissions. There is no Tau Ceti import to build, no admitted data, no set_option and no example padding. The representation-theoretic headlines remain explicitly unstatable on the missing GSp coordinate/comodule carriers. Expanding κ's degree range does not change any of the three statable integral headlines.
- The required dependency command returned exit 0 with exactly:

  ```text
  depcheck: 34 roadmaps, 311 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or moved line occurred. The order file and tooling were untouched.
- Citation resolution returned exit 0: cross-roadmap citations found nowhere: None; Lean names found nowhere: None. That tool reports it cannot inspect pinned Lake packages in its own configuration; the pinned native checks above were performed directly in the supplied checkouts, not inferred from the resolver.
- All three manifest entries parse as schema tauceti-roadmap-sources/v1 with their existing unique lifetime keys and legal-cache provenance. No gate failures were listed in the brief; none required a separate repair.
- git diff --check: exit 0. Only the two authorized package inputs and this requested report changed. No commit or external write was made.

# Maintainer notes

The existing three ReductiveGroups gaps are unchanged in README and design/plan.json: generated-vector-base-change, central-quotient-representations and finite-comodule-category. Their previous not-actionable dispositions are not reopened. No fourth gap is required for the reductivity argument, because the necessary theorem is already at the pin.

No Lean name, signature or downstream acceptance interface changed. Contraction now exists above primitive degree g; consumers of primitives still use only 0≤k≤g. All sign-dependent uses were checked in Conventions, the coordinate/fibre comparison, the standard pairing, CG.1.4–1.5 and the primitive-character consequences CG.2.5/CG.3.6. The latter depend on kernels and dimensions and are unchanged by the corrected native adapter. The only added cross-roadmap consumption is the explicit Layer 7/§7C density route. Independent review remains the acceptance authority.
