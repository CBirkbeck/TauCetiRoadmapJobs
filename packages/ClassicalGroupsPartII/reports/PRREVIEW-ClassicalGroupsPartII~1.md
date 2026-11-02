# Review of ClassicalGroupsPartII (pull request #1492 at 753d6b5)

**Verdict:** needs changes

:robot: Independent AI review. One P2 ownership finding; no mathematical counterexample to the three Lean headlines was found. The gate and direct Lean elaboration pass. No PR file was changed.

## R01 (P2) — Preserve the three declared supplier contracts

**Location:** `TauCetiRoadmap/ClassicalGroupsPartII/README.md:54`, also lines 199–211, 514–532, 593–605 and 865–878. The scope says these generic constructions “are additional targets here” and “do not ask those supplier layers for extra theorems.”

**Claim:** The README assigns finite-comodule category compatibility, finite-central-quotient representation descent, and generated-vector/base-change theory to this roadmap. The accepted design assigns those same general contracts to ReductiveGroups. This creates two incompatible ownership specifications and removes the README declarations the intake uses to identify the contracts.

**Witness:** `packages/ClassicalGroupsPartII/design/plan.json:4`, `:10`, `:16` assign all three slugs to ReductiveGroups Layers 1/3. None of those slugs occurs in the reviewed README; its three generic target paragraphs reproduce their mathematical obligations.

**Repair:** Restore, under “From TauCetiRoadmap.ReductiveGroups”, the three `What ReductiveGroups must provide (gap:...): ...` entries with the existing slugs and hypotheses. Change CG.0.6, CG.1.1 and CG.1.7 to consume those contracts and retain their GSp specializations, comparison maps and Checks. Remove the competing claim of local ownership at lines 54–58. The design need not change, and this does not require the supplier to have implemented or already stated the missing results.

**Repair check:** Each contract supplies exactly the general assertion now repeated locally: the identity/square quotient in CG.0.6; the trivial two-dimensional comodule with Hom dimension 4 in CG.1.1; and the two-weight vector generating dimension 2 in CG.1.7. Their GSp specializations consequently retain every required input after this repair. A scratch reconstruction of those three entries was checked against the design: the declared-slug sets are equal, of cardinality 3. It adds no order edge to another supplier.

This does **not** reopen F06 of `packages/ClassicalGroupsPartII/reports/FIX-RT-ClassicalGroupsPartII~1.md`: its reason for accepting supplier gaps remains valid. The defect is the subsequent competing local ownership, not absence of those theorems from ReductiveGroups today.

## Verified sound

**Scope and verification counts.** Read all 27 CG subsections, their API bullets, Checks, examples, proof routes and Needs lines, and all 24 Lean declarations. There are 24 “Construction and proof” blocks and 24 “Consequences to check” blocks. The seeded sample supplies repeated labels without unique section identifiers; I checked all 48 blocks, covering every possible match. No locator is marked unverified in the README. All three cited works were available in the supplied legal cache. The source audit below distinguishes statements printed in the references from the roadmap's own derivations.

The Part II endpoints extend the complex Sp/classical-group theory with an independent multiplier, rational primitive models and integral GSp invariant rings; they do not repeat the parent's entire programme. No algorithmic endpoint, copied source passage, restricted-prime workaround, admitted data, option override, arbitrary free predicate or changed file outside the folder was found.

**Headlines.** The README's substantial endpoints are: the central isogeny and connected reductivity (CG.0.2); primitive decomposition/absolute simplicity (CG.1.5); Hom and weight scalar-extension comparisons (CG.1.6); rational Cartan-model and highest-weight comparison (CG.1.7–1.8); scalar-extension equivalence of representation rings (CG.1.9); injectivity and the full rational character isomorphism (CG.2.2, CG.2.6); integral full invariant presentation (CG.2.4); positive support criterion (CG.3.1); positive invariant presentation (CG.3.2); exact tensor occurrence (CG.3.4); constituent character isomorphism (CG.3.5); and multiplier localization (CG.3.6).

The three integral algebra headlines are stated in Lean. The module docstring identifies the missing GSp Hopf/comodule carriers for the representation-theoretic endpoints. The Hom and injectivity comparisons likewise need those carriers; they are not replaced by abstract point representations. Searches at the pins found GL and Sp coordinate Hopf algebras, but no independent-multiplier GSp coordinate Hopf algebra. Defining that heavy carrier solely to fill the acceptance file would violate the stated form rules.

**Adversarial computations.** The tables contain 88 mathematical rows and 24 declaration rows. In the tables, `w_i=t/z_i`, `x_i=z_i+w_i`, and `q_i=e_i∧f_i`. “Retain” means the calculation required no mathematical change. These are explicit tests of the statements and proof mechanisms, not substitutes for their general proofs. An independent exact-integer calculation of κL−Lκ passed on all 341 exterior-basis wedges for ranks 0–4 and all degrees 0 through 2g. A separate enumeration of 3,591 weights (ranks 1–3, u_i from −3 to 3, m from −4 to 4) verified the subset-minimum cone formula, flip invariance and reconstruction whenever the cone value is nonnegative. The triangular coefficient formula at augmentation passed for ranks 0–4.

| Statement/convention | Instances tried | Computed left side | Computed right side / negative control | Result; change |
| --- | --- | --- | --- | --- |
| Positive rank and coefficient conventions | g=0,1; F₂,F₃ | At g=0, hJhᵀ=0 for every s; at g=1, hJhᵀ=det(h)J | 0=s·0 admits s=1,2 over Q; 2=0 in F₂ and 3!=0 in F₃ | Rank and characteristic restrictions have actual work; retain |
| Algebraic versus point representations | G_m over F₂, characters 1 and t | Both evaluate to 1 on F₂× | Their weight-1 coefficients are 0 and 1 | Coactions distinguish them; retain |
| Native pairing sign | g=1, e,f | eᵀJf=1; fᵀJe=−1 | eᵀJFin f=−1; fᵀJFin e=1 | J=−JFin is necessary; retain |
| Two similitude matrix equations | h=diag(2,3) | hJhᵀ=6J | hᵀJh=6J | Same multiplier; retain |
| Independent t and scalar degree | h=diag(2,3), cI=2I | (t,z)=(6,2),(4,2) | d(t)=2, d(z)=d(w)=1; scalar values 4,2,2 | Retain |
| Dominance with unrestricted multiplier | g=1, (−1,0),(0,−1) | First dominant, degree −2 | Second not dominant, degree −1 | Negative twists remain; retain |
| Integral, virtual coefficients | −x and z²+w² | Coefficients −1,−1; and 1,1 | −x is allowed; x²−2t=z²+w² | Neither coefficient positivity nor averaging is used |
| Signed exterior indices | k=−1,0,1,2g+1 | E₋₁=0,E₀=1,F₁=E₁,E_(2g+1)=0 | Natural subtraction would give F₁=E₁−t | Signed convention retained |
| CG.0.1 coordinate presentation | g=1, diag(2,3), zero matrix | s=6,D=1/6; D det(h)=1 | Zero matrix gives D det(0)=0≠1 | Invertibility is encoded; retain |
| CG.0.1 Hopf multiplication order | h=diag(2,3), j=[[0,1],[−1,0]] | (hj)₁₂=2; Δx₁₂(h,j)=2 | (jh)₁₂=3 | Noncommuting example pins multiplication order |
| CG.0.1 counit and antipode | I,h,h⁻¹ | s(I)=1,s(h)=6,s(h⁻¹)=1/6 | 6·(1/6)=1 | Retain |
| CG.0.1 multiplier-one fibre | diag(2,1/2) | hJhᵀ=J | ν=1; same equation with −J | Sp fibre and sign transport agree |
| CG.0.1 zero value algebra | A=0 | One algebra map to A | One matrix unit and one scalar unit | Both point sets have cardinality 1 |
| CG.0.2 central kernel | ε=±1 | π(I,1)=I, π(−I,−1)=I | c²=1 implies a=c⁻¹I=cI | Diagonal μ₂, retain |
| CG.0.2 fppf versus rational-point lift | diag(1,2) over Q | No c∈Q with c²=2 | Over Q[C]/(C²−2), C⁻¹h has multiplier 1 | Rank-two faithfully flat lift works |
| CG.0.2 nonreduced values | Q[ε]/ε², multiplier 1+ε | (1+ε/2)²=1+ε | ε²/4=0 | No reduced-value-algebra assumption |
| CG.0.2 geometric connectedness | g=1 | GL₂ is det≠0 in affine 4-space, hence one component | Surjective quotient of SL₂×G_m also gives one component | General Sp connectedness is available natively; retain |
| CG.0.2 faithful action | g=1,h=diag(2,3) | Matrix entries recover s=6 | Inverse entries recover s⁻¹=1/6; determinant localization supplies 1/6 | Correct closed-immersion notion; retain |
| CG.0.2 reductivity criterion | Upper unipotents U₂ on K² | Fixed subspace K e₁, dimension 1 | u(1)e₂=e₂+e₁; no invariant complementary line | Faithful alone is insufficient; complete reducibility retained |
| CG.0.2 normality premise | j as above, u(a) upper unipotent | j u(1)j⁻¹=[[1,0],[−1,1]] | This is not upper unipotent | Criterion does not kill nonnormal unipotents |
| CG.0.3 lattice pullback and its inverse | g=1,(m,u)=(−1,2),(0,1) | Pullbacks (u,d)=(2,0),(1,1) | (d−u)/2=−1,0; (u,d)=(1,0) has odd difference | Both directions and excluded parity checked |
| CG.0.3 simple roots/coroots | g=0,1,2 | Empty; (−1,2); (0,1,−1),(−1,0,2) | Degrees 0; pairings u₁−u₂,u₂; Cartan off-diagonals −1,−2 | Central coordinate and root lengths agree |
| CG.0.3 root order | g=1,0,α,2α,e_t,e₁ | 0≤α and 0≤2α | α≤0 false; degrees of e_t,e₁ are 2,1 versus 0 | Antisymmetry and equal-degree restriction discriminate |
| CG.0.4 torus immersion and restriction | t=6,z=2; t=1,z=2 | Matrices diag(2,3),diag(2,1/2) | Multipliers 6,1; off-diagonal coordinate images 0 | Maps and directions correct |
| CG.0.4 maximal torus centralizer | g=1, generic diagonal, E₁₂ | Conjugation eigenvalue z²/t | At (z,t)=(2,6), eigenvalue 2/3≠1 | Off-diagonal centralizer candidates excluded |
| CG.0.4 scalar subtorus | g=2,c=2 | (t,z₁,z₂)=(4,2,2) | All four diagonal entries 2 | One parameter in a rank-three torus |
| CG.0.5 flip and square | g=1,(m,u)=(−1,2) | Flip=(1,−2); second flip=(−1,2) | Both scalar degrees 0; t fixed | Correct reciprocal involution |
| CG.0.5 distinct flips and conjugation | g=2,(0,1,2) | f₁f₂ gives (3,−1,−2) | f₂f₁ gives (3,−1,−2); swapping labels exchanges f₁,f₂ | Semidirect relations hold |
| CG.0.5 permutation direction | Cycle (123), weight of z₁ | u∘σ⁻¹ gives weight of z₂ | u∘σ gives weight of z₃ | Direction fixed by a non-involutive permutation |
| CG.0.5 group algebra and constants | [−1,2]·[1,−2], −3 | Product [0,0]=1; coefficient of −3 at 0 is −3 | Induced automorphisms preserve that coefficient | Formal monomials, not Laurent functions |
| CG.0.5 fixed ring | g=0,1,2 | g=0 all Z[t±1] fixed; g=1 x fixed | z is moved to w; g=2 x₁ is moved to x₂ by a swap | Both kinds of Weyl generators required |
| CG.0.6 parity descent | Sp standard u=1, scalar d=0,1 | Kernel actions −1,+1 | d−u=−1,0 | Only degree 1 descends to standard GSp module |
| CG.0.6 negative multiplier descent | u=0,d=2,−2 | Kernel action +1 in both cases | m=1,−1, characters t,t⁻¹ | No nonnegative-central-degree restriction |
| CG.0.6 generic quotient contract | Identity; square G_m→G_m | Dimension 2 stays 2; pullback exponent n becomes 2n | Exponent 1 has kernel action −1, exponent 2 has +1 | Mathematics sound; restore supplier ownership, R01 |
| CG.0.6 infinitesimal kernel control | Square map in characteristic 2, A=F₂[ε]/ε² | (1+ε)²=1; weight 1 acts by 1+ε≠1 | Weight 2 acts by 1 | Scheme-theoretic triviality catches invisible rational-point kernel |
| CG.1.1 finite category compatibility | Trivial H, modules 0,F,F² | Hom(0,F)=0; dim Hom(F,F)=1; dim Hom(F²,F²)=4 | E₁₂E₂₁=E₁₁≠E₂₂=E₂₁E₁₂ | Actual linear category, not discrete; R01 ownership repair |
| CG.1.1 tensor additivity | Maps 2,−2 on unit; char 0 and 2 | Tensor of sum gives 0 | 2id−2id=0; in F₂, (1+1)id=0 | Compatibility survives small characteristic |
| CG.1.1 split ring/dimension | g=1,V⊗V | [V]²=[Sym²V]+[ν], dimension 4 | 3+1=4; x²=z²+2t+w² | Retain |
| CG.1.1 point evaluation and distinct classes | Unit,ν,ν⁻¹ at 2I | Values 1,4,1/4 | All three dimensions are 1 | Dimension alone does not identify classes |
| CG.1.2 standard coaction | δ(e_b)=Σ e_a⊗x_ab; diag(2,3) | e₁ maps to 2e₁, e₂ to 3e₂ | Inverse-action model gives 1/2,1/3 | Column convention correct |
| CG.1.2 powers and weights | g=1,k=0,1,3; d=0 | Dimensions 1,2,0; tensor degree zero has dimension 1 | Standard weights (0,1),(1,−1), each multiplicity 1 | Retain |
| CG.1.2 all-algebra exterior comparison | h=(1+ε)I over Q[ε]/ε² | Λ²h acts by 1+2ε | (1+ε)²=1+2ε | Nilpotents are seen |
| CG.1.2 rational-point density | g=1,(a,b,r,s)=(2,3,5,7) | Big-cell matrix [[5,15],[10,37]], det=185−150=35 | r s=35 | Infinite split chart supplies density |
| CG.1.2 density negative controls | GL₂(F₂), F₄ point [[α,1],[1,0]] | x₁₁²−x₁₁=0 on all six F₂ points | α²−α=1 on the F₄ point, determinant 1 | Finite-field point density excluded |
| CG.1.2 correct group for density | Sp points and 2I | s−1 vanishes on Sp | At 2I it is 4−1=3 | Sp points cannot replace GSp points |
| CG.1.2 stable subspace iff subcomodule | 0,V,K e₁ | First two are stable of dimensions 0,2g | K e₁ is torus-stable but pair swap sends e₁ to −f₁ | Both implications use all group points |
| CG.1.3 integer twists, tensor and dual | m=−1,n=1 at 2I | ν⁻¹⊗ν value (1/4)·4=1 | ν⁰ value 1; dual of ν has value 1/4 | Retain |
| CG.1.4 contraction and equivariance | e₁∧f₁,f₁∧e₁; h=2I | κ values 1,−1; κ(h·q₁)=4 | ν(h)κ(q₁)=4; untwisted target would give 1 | Sign and multiplier twist necessary |
| CG.1.4 kernels and degree range | g=2,k=2; g=1,k=2,3 | κ₂(q₁)=1, kernel dimension 6−1=5 | At g=1 κ₂ still equals 1, P₂ absent; Λ³=0 | Full κ range, restricted P range correct |
| CG.1.5 raising bivector | g=2,1 in ν | L₀(1)=q₁+q₂ | Scalar 2 multiplies both summands by 4=ν(2I) | Correct source twist |
| CG.1.5 commutator degree zero | g=2,k=0 | κL(1)=2; Lκ(1)=0 | Difference 2=(g−k)·1 | Retain |
| CG.1.5 commutator middle degree | g=2,k=1, e₁ | κL(e₁)=e₁; Lκ(e₁)=0 | Difference e₁=(2−1)e₁ | κ₃ is needed and supplied |
| CG.1.5 commutator at and above rank | g=2,k=2,q₁; g=1,k=2,q₁ | Ω−Ω=0; 0−q₁=−q₁ | (2−2)q₁=0; (1−2)q₁=−q₁ | Integer subtraction essential |
| CG.1.5 Lefschetz string coefficient | r=0,(g,j)=(2,2),(3,2),(3,3) | κΩ²=2Ω,4Ω; κΩ³=3Ω² | j(g−j+1)=2,4,3 | Retain |
| CG.1.5 surjectivity and primitive dimension | (g,k)=(2,2),(3,3),(4,4) | Dimensions 6−1=5,20−6=14,70−28=42 | Fundamental dimensions 5,14,42 | Corrected source formula used |
| CG.1.5 tensor summand projector | k=2, antisymmetrizer A=1−swap | A²=2A; (A/2)²=A/2 | In F₂, division by 2 is unavailable | Characteristic-zero hypothesis used |
| CG.1.6 coordinate scalar extension | Q→K, matrix coordinate and s | 1⊗x_ab maps to x_ab; 1⊗s maps to s | Defining equations have the same coefficients 0,±1 | Coordinate comparison respects presentation |
| CG.1.6 Hom scalar extension | Q→C, unit | C⊗Q Q→C, i⊗1 maps to i | Unextended Q→C omits i | Extended Hom isomorphism, not fullness |
| CG.1.6 Hom zero/weight comparison | Hom(V,ν), standard and zero module | Hom dimension 0; standard weight dimensions 1,1 | After extension 0,1,1; all zero-module weight dimensions 0 | Central degrees exclude spurious maps |
| CG.1.6 reflection | Maps 0,2 on unit | Determinants 0,2 over F | Same 0,2 over K; inverse of 2 is 1/2 | Faithful extension detects maps; infinite-field open locus handles object isomorphisms |
| CG.1.7 generated vector | v=0; e₁ in trivial F² | Generated dimensions 0,1 | After extension dimensions 0,1; whole F² has dimension 2 | Least-span definition discriminates; R01 ownership repair |
| CG.1.7 coefficient span/base change | Weights t,t², v=e₁+e₂ | Extracting t and t² yields e₁,e₂, dimension 2 | Ordinary vector span has dimension 1; extended coefficient span dimension 2 | Remains true for inseparable F₂(a)⊂F₂(a^(1/2)) |
| CG.1.7 functoriality of generated span | Projection onto weight-t line | Image of generated F² is F e₁ | Span generated by f(v)=e₁ has dimension 1 | Image equality agrees |
| CG.1.7 Cartan tensor and highest line | g=2,u=(3,1) | a=(2,1), top weight 2(1,0)+(1,1)=(3,1) | Tensor degree 2·1+1·2=4=Σu; top multiplicity 1 | Component is tied to the specified vector |
| CG.1.7 multiplier shift | m=−1,u=0; νⁿ⊗L(m,u) | Character t⁻¹; multiply by tⁿ | t^(n−1), label (m+n,u) | All integer twists retained |
| CG.1.8 classification/End | g=1,(m,u)=(−1,0),(0,1),(1,2) | GL₂ highest exponents (−1,−1),(1,0),(3,1); dimensions 1,2,3 | End of each simple has dimension 1 over K | Split highest-weight supplier has correct generality |
| CG.1.9 ring base change | Q→Q,C,K | Simple-basis coefficient 1 maps to 1; dim V=2g | End(unit) changes Q→K, while its class remains 1 | Ring equivalence does not overclaim category equivalence |
| CG.2.1 integral character and trace | g=1,0,1,V,ν⁻¹ at diag(2,3) | Characters 0,1,z+w,t⁻¹; evaluations 0,1,5,1/6 | Matrix traces 0,1,5,1/6 | Retain |
| CG.2.1 additivity, product and augmentation | V⊕ν,V⊗ν | Characters x+t,tx; augmentations 3,2 | Dimensions 2+1=3,2·1=2 | Coefficient convolution and dimension agree |
| CG.2.2 triangular injectivity | g=1,ν⁻¹−1; Sym²V | Coefficients of t⁻¹−1 are +1,−1 | Sym² weights (0,2),(1,0),(2,−2) form λ,λ−α,λ−2α with top coefficient 1 | Maximal-weight argument detects nonzero combinations |
| CG.2.3 generating function | g=0,1,2 | 1; 1+xU+tU²; E₂=x₁x₂+2t,E₄=t² | Products of (1+z_iU)(1+w_iU) give the same coefficients | Retain |
| CG.2.3 fundamental correction | (g,k)=(1,1),(2,2),(3,3) | F₁=x; F₂=e₂+t; F₃=e₃+te₁ | Augmentations 2,5,14 | Negative exterior index correctly zero |
| CG.2.4 integral flip-orbit recurrence | n=0,1,2,3 | 2,x,x²−2t,x³−3tx | zⁿ+wⁿ; single zero orbit is 1, not p₀=2 | No division by orbit size |
| CG.2.4 triangular coefficients | g=3,k=2,3; g=4,k=4 | E₂=e₂+3t; E₃=e₃+2te₁; E₄=e₄+2te₂+6t² | Binomial formula gives 3,2 and coefficients 1,2,6 | Integral triangular map, diagonal coefficient 1 |
| CG.2.4 full polynomial presentation | g=0,1,2 | Z[T±1]→Z[t±1]; X→x; X₂→e₂+t | Inverse e₂→X₂−T; z²+w²→X₁²−2T | Rank zero works for full ring |
| CG.2.5 actual primitive characters | g=2,k=2; g=3,k=3 | ch P₂=E₂−t=F₂; ch P₃=E₃−tE₁=F₃ | Dimensions 6−1=5 and 20−6=14 | Character correction matches κ target |
| CG.2.6 rational character equivalence | g=1,Sym²V,ν⁻¹ | ch Sym²V=x²−t=z²+t+w²; ch ν⁻¹=t⁻¹ | Inverse classes [V]²−[ν], [ν⁻¹] | Generator normalization excludes translated equivalences |
| CG.3.1 support criterion, both directions | g=1,z²w³,t⁻¹,0,−x | Weights (3,−1), (−1,0); h=2,−1; 0 has empty support | z²w³=t²w; membership true,false,true,true respectively | Negative coefficients and empty support allowed |
| CG.3.1 superadditivity and subset inequalities | g=1,(0,1),(0,−1),(3,−1) | h values 0,−1,2; h(first+second)=0 | 0≥−1; subset values for (3,−1) are 3,2, minimum 2 | Additivity would be false; correct claim retained |
| CG.3.1 rank-zero negative control | g=0,t | h=1≥0 | Empty-generator subring Z does not contain t | Positive-rank binder essential |
| CG.3.2 positive invariant presentation | g=1, z²+w² and 1; g=2,e₂ | Inverses X²−2T,1; X₂−T | Images z²+w²,1;e₂ | Nonnegative T powers suffice; t⁻¹ excluded |
| CG.3.3 constituent subring | g=1,V²; unit at degree 0 | V²=Sym²V⊕ν, dimensions 4=3+1 | t is independent of x, so t∉Z[x] but t∈C₁ | All constituents, not just [V], generate |
| CG.3.3 multiplicative span | ν from degree 2, V from degree 1 | ν⊗V has degree 3 and character tx | Tensoring summand maps gives p i=1·1=1 | Products stay sums of constituent classes |
| CG.3.4 exact occurrence, both directions | g=1,(m,u,d)=(0,0,0),(0,0,2),(1,0,2),(−1,2,0) | Actual occurrence true,false,true,false | Conditions m≥0 and d=2m+u give true,false,true,false | Degree alone would incorrectly admit (−1,2,0) |
| CG.3.4 tensor sufficiency | g=2,u=(3,1),m=2 | Primitive tensor degree 4 plus ν² degree 4 gives 8 | 2m+Σu=4+4=8 | Exact degree, not unspecified occurrence |
| CG.3.4 invariant-vector control | V² at scalar 2 | Every tensor scales by 4 | An invariant vector must scale by 1; 4v=v implies v=0 | ν summand is not trivial |
| CG.3.5 tensor character isomorphism | g=1,Sym²V,ν⁻¹ | Sym² weights have h=0,1,0 | ν⁻¹ has h=−1 | Correct subring image and exclusion |
| CG.3.6 polynomial generators/localization | ν⁻²P₁ and k=1 primitive identity | Multiplying by ν² gives P₁; [Λ¹V]−ν·0=[V] | t²(t⁻²F₁)=F₁; F₁=E₁ | Integral denominator clearing and boundary term agree |

The acceptance-file declarations were also checked individually against their real bodies and elaborated types:

| Declaration in `Suggested.lean` | Instances tried | Computed values on the two sides | Result; change |
| --- | --- | --- | --- |
| `Weight`, line 27 | g=0,1 | Z×(Fin 0→Z)≃Z; Z×(Fin 1→Z)≃Z²; (−1,0) remains present | Retain |
| `Laurent`, line 30 | Weights 0,(1,0) | Coefficient at (1,0) of 1 is 0, of t is 1 | Formal-basis distinction retained |
| `monomial`, line 33 | (−1,2),(1,−2) | Product is weight (0,0), coefficient 1; equals 1 | Retain |
| `t`, line 37 | (1,0) | Coefficient 1 at (1,0), 0 at 0; scalar-2 value 4 | Retain |
| `tInv`, line 40 | (−1,0) | Coefficient 1 there; t·tInv=1; scalar-2 value 1/4 | Retain |
| `z`, line 43 | g=1 | Weight (0,1), scalar degree 1; at t=6,z=2 value 2 | Retain |
| `pairedZ`, line 46 | g=1 | Weight (1,−1); value 3; z·pairedZ=6=t | Ordinary inverse would give 1/2, excluded |
| `permWeight`, line 49 | g=2 swap; g=3 cycle | (−1,2,−3)→(−1,−3,2); e₁→e₂ under (123) | Inverse-index convention correct |
| `flipWeight`, line 57 | g=1,(−1,2) | (−1,2)→(1,−2)→(−1,2); degree 0 at each step | Retain |
| `permLaurent`, line 77 | z₁²,t⁻¹,−3 | Swap images z₂²,t⁻¹,−3 | Coefficients preserved |
| `flipLaurent`, line 81 | z²,z⁻¹,t⁻¹ | Images t²/z²,z/t,t⁻¹ | Negative exponents handled correctly |
| `invariantSubring`, line 85 | g=0,1,2 | Full Laurent ring at 0; x fixed at 1; x₁→x₂ at 2 | Equalizer intersection excludes z and permutation-moving elements |
| `pairSum`, line 93 | g=1 | Coefficients 1 at (0,1),(1,−1); augmentation 2 | Retain |
| `exteriorCharacter`, line 96 | g=0,1,2 and negative k | At 0: E₋₁=0,E₀=1,E₁=0; at 1: E₂=t; at 2: E₂=x₁x₂+2t | Real body agrees with signed-degree prose |
| `fundamentalCharacter`, line 102 | (g,i)=(1,0),(2,1),(3,2) | x, x₁x₂+t, e₃+te₁; dimensions 2,5,14 | No truncated-subtraction defect |
| `MultLaurent`, line 106 | Exponents ±2 | Basis coefficients 1 at ±2; T²T⁻²=1 | Laurent coefficient carrier retained |
| `coeffT`, line 109 | Exponents 1,0,−1 | Coefficients 1,0,0 | Correct positive generator |
| `coeffTInv`, line 112 | Exponents −1,0,1 | Coefficients 1,0,0; product with coeffT=1 | Correct inverse generator |
| `fullInvariantPresentation`, line 116 | g=0,1,2 | At 0 coefficient map T±1→t±1; at 1 X→x; at 2 inverse(e₂)=X₂−T | All-natural-rank statement matches README |
| `positiveSubring`, line 125 | g=0,1 | B₀=Z; B₁ contains z,w,t,−x, excludes t⁻¹ | Closure definition has intended boundaries |
| `positiveInvariantSubring`, line 129 | g=0,1 | At 0 equals Z; at 1 contains t,−x, excludes z,t⁻¹ | Generatedness and fixedness both used |
| `coneValue`, line 133 | (0,1),(1,−1),(0,−1) | Values 0,0,−1; h(0,1)+h(0,−1)=−1≤h(0,0)=0 | Retain |
| `mem_positiveSubring`, line 137 | g=1,0,−x,t⁻¹; g=0,t | At 1 membership/support truth values agree: true,true,false; at 0 false versus true | Explicit `0 < g` is necessary and retained |
| `positiveInvariantPresentation`, line 143 | g=1,2; g=0 control | Images T→t,X→x; e₂ inverse X₂−T at 2; at 0 t∉B₀ | Explicit `0 < g` retained |

**Sources and sampled routes.** The three manifest records use the supplied versions: Yu arXiv v5; Milne's 2022 second edition in the author PDF dated 5 October 2021; Sternberg's 23 April 2004 notes. Printed-page numbering, rather than PDF-image numbering, was checked. There is no fourth cited work to fetch.

| Locator read | Source evidence | Targets checked and limits of support |
| --- | --- | --- |
| Yu §7.1, equation (7.1.1), printed p.64 | `yu line 3728`, `yu line 3731`, `yu line 3736` | Reciprocal substitutions and support inequality. The README's monomial reconstruction proves the converse; positive rank is explicitly retained. |
| Yu Remark 7.1.1, p.64 | `yu line 3745`, `yu line 3746`, `yu line 3756` | GSp defined on all Q-algebras, tautological representation and multiplier. This supports CG.0's object; the coordinate presentation, fppf cover and parity are the roadmap's explicit derivations. |
| Yu Remark 7.1.1, p.64 | `yu line 3761`, `yu line 3766`, `yu line 3768` | Full character isomorphism, primitive exterior generators with negative-degree term zero, and constituent subring. The independent integral orbit proof supplies CG.2.4/CG.3.2, including rank-zero full invariants; Yu does not supply their detailed formal proof. |
| Milne Ch.4 §a, identities (24)–(25), p.84 | `milne line 3734`, `milne line 3742`, `milne line 3763` | Coassociativity/counit and matrix coefficient equations used in CG.0.1/CG.1.1/CG.1.2. |
| Milne Proposition 4.7 and proof, p.86 | `milne line 3834`, `milne line 3850`, `milne line 3860` | The coefficient-span argument constructs a finite subcomodule containing a vector. Minimality and base change in CG.1.7 follow from coefficient extraction and finite-dimensional duality, not from a falsely quoted base-change clause in 4.7. |
| Milne Lemma 5.9/Proposition 5.10, p.100; Proposition 5.21, p.104 | `milne line 4370`, `milne line 4380`, `milne line 4517` | Faithfully flat sheaf descent and quotient factorization on every value algebra. These justify CG.0.6's action and intertwiner descent, without rational-point surjectivity. |
| Milne Proposition 4.32/Corollary 4.34, p.96; Exercise 4-4, p.97 | `milne line 4245`, `milne line 4256`, `milne line 4281` | Schematic density, invariant base change, Hom base change and isomorphism reflection. The last argument uses an infinite field. CG.1.6's characteristic-zero fields satisfy that hypothesis. |
| Milne Theorem 17.93(a), p.382 | `milne line 15761` | Connected group variety, perfect base, and infinite base for rational-point density. CG.1.2 has smooth connected GSp in characteristic zero and spells out the schematic-density promotion. |
| Milne 19.16–19.18, p.401 | `milne line 16482`, `milne line 16488`, `milne line 16492` | Normal unipotents act trivially on semisimple modules; geometrically semisimple faithful representation implies reductivity. CG.0.2 uses the native version on an algebraically closed geometric fibre with reduced finite-type coordinates. |
| Milne Summary 21.98, p.461 | `milne line 19149` | Type-C roots, base, weight lattice and μ₂ centre of Sp. CG.0.3–0.6 retain the additional GSp multiplier rather than confusing its full lattice with the Sp lattice. |
| Milne Theorem 22.2 and complements 22.3–22.6, pp.464–466 | `milne line 19279`, `milne line 19291`, `milne line 19301`, `milne line 19308` | Split reductive hypothesis, one-dimensional highest line, lower weights, scalar endomorphisms, absolute simplicity and base change. CG.1.7–1.9/CG.2.2 transport these after specifying the actual lattice. |
| Milne Complement 22.12, p.466 | `milne line 19367` | Simple-module descent through a central isogeny is governed by the actual character sublattice. The parity computation is supplied explicitly by CG.0.6. |
| Milne Lemma 22.39/Theorem 22.42, pp.477–479 | `milne line 19813`, `milne line 19859` | Semisimplicity descends; reductivity equivalence is in characteristic zero. The roadmap does not extend semisimplicity to characteristic p. |
| Sternberg §7.9, pp.131–133 | `sternberg line 5024`, `sternberg line 5039`, `sternberg line 5043`, `sternberg line 5056`, `sternberg line 5143` | Cartan components and complex Sp fundamental contraction kernels. CG.1.4–1.5 supply the multiplier and sign conventions; CG.1.7 uses the rational tensor model and split algebraic supplier to reach arbitrary characteristic-zero fields. The source's incorrect binomial entry is not copied. |

All 24 proof blocks and 24 consequence blocks reduce to these passages plus the displayed computations. No source text was treated as an instruction. No claim of a proof over arbitrary K is inferred solely from Sternberg's complex setting: the independent rational tensor construction and ReductiveGroups §10B are essential.

**Pinned declaration audit.** The manifest pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The 28 API rows below record the pinned declarations inspected. The following are source files within those libraries, not a newer online API. I opened the declaration bodies/types and relevant assumptions. In particular native finite comodules mean Module.Finite, not semisimplicity; native kernels need coalgebra flatness; faithful comodules mean a closed immersion, not pointwise injectivity.

| Native declarations opened | File and line at the pin | Interface/hypotheses checked |
| --- | --- | --- |
| `Matrix.GeneralLinearGroup` | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:42` | Matrix units; finite decidable index; semiring coefficients. |
| `Matrix.J` | `Mathlib/LinearAlgebra/SymplecticGroup.lean:58` | Blocks 0,−1,1,0. |
| `MonoidAlgebra.domCongr` | `Mathlib/Algebra/MonoidAlgebra/Basic.lean:302` | Monoid equivalence induces algebra equivalence; coefficient action fixed. |
| `MvPolynomial.esymmAlgEquiv` | `Mathlib/RingTheory/MvPolynomial/Symmetric/FundamentalTheorem.lean:340` | Finite cardinality hypothesis; commutative coefficient ring; polynomial variables indexed by Fin n. It supplies the symmetric-polynomial step, not the reciprocal invariant theorem. |
| `TauCeti.FGComoduleCat` | `TauCeti/Algebra/Coalgebra/Comodule/Finite/Basic.lean:96` | Full subcategory of finite right comodules. No built-in reductivity hypothesis. |
| `FGComoduleCat.instMonoidalCategory` | `TauCeti/Algebra/Coalgebra/Comodule/Finite/Monoidal.lean:161` | Native diagonal tensor, module universe matching coefficient universe. |
| `FGComoduleCat.instBraidedCategory` | `TauCeti/Algebra/Coalgebra/Comodule/Finite/Symmetric.lean:81` | Commutative bialgebra; swap braiding. |
| `FGComoduleCat.hasBinaryBiproducts`; native preadditivity | `TauCeti/Algebra/Coalgebra/Comodule/Finite/Product.lean:158`; `TauCeti/Algebra/Coalgebra/Comodule/Finite/Preadditive.lean:48` | CommRing base; inherited full-subcategory preadditivity and additive forgetful functor. These do not by themselves state all of the declared category-compatibility contract. |
| `SplitK0`, `SplitK0.of` | `TauCeti/CategoryTheory/GrothendieckGroup/Split.lean:114`, `:124` | Essentially small category with zero morphisms and binary biproducts; split relations. |
| `SplitK0.of_mul_of`, `liftRingHom`, `mapRingHom` | `TauCeti/CategoryTheory/GrothendieckGroup/Monoidal/Basic.lean:179`, `:263`, `:324` | Monoidal preadditivity; additive multiplicative invariant; additive monoidal functor for scalar-extension ring map. |
| `DiagonalizableGroup.weightSpace`, `isInternal_weightSpace`, `finite_setOf_weightSpace_ne_bot` | `TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Weight.lean:83`, `:105`, `:112` | Corestriction along a coalgebra map; internal sum; Module.Finite gives finite nonzero support. |
| `Comodule.baseChange` | `TauCeti/Algebra/Coalgebra/Comodule/BaseChange.lean:166` | Changes both H and M to their tensor scalar extensions. |
| `Comodule.matrixCoefficientSubcoalgebra`, its finiteness instance | `TauCeti/Algebra/Coalgebra/Comodule/MatrixCoefficient/Subcoalgebra.lean:53`, `:92` | Finite free module hypotheses, satisfied over fields. Not a theorem about the least subcomodule generated by one vector. |
| `Symplectic.coordinateHopfAlgebra` | `TauCeti/Algebra/AlgebraicGroup/Symplectic/Basic.lean:104` | Constant-form quotient at JFin, multiplier fixed to 1. |
| `GeneralLinear.coordinateHopfAlgebra` | `TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Coordinate/HopfAlgebra.lean:479` | Actual determinant-localized Hopf coordinate algebra. |
| `char_extPowerRep_diagonal` | `TauCeti/RepresentationTheory/ClassicalGroups/ExteriorPower.lean:138` | Field, finite-dimensional standard GL action, unit diagonal entries; abstract trace equals elementary symmetric evaluation. |
| `Comodule.Hom.ker`, `ker_finite` | `TauCeti/Algebra/Coalgebra/Subcomodule/Comap.lean:238`, `:249` | Module.Flat on the coalgebra; IsNoetherian on the source for finiteness. |
| `Comodule.exteriorPower`, `Hom.exteriorPowerMap`, `baseChange_subtype_endOfPoint_ιMulti` | `TauCeti/Algebra/Coalgebra/Comodule/ExteriorAlgebra/Power.lean:73`, `:110`, `:166` | Real exterior coaction, morphism and all-value-algebra pure-wedge comparison, including nonreduced algebras. |
| `JFin`, `JFin_two_eq` | `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/Basic.lean:243`, `:263` | Transported native sign convention; README correctly negates it. |
| `GLSymplecticFin.diagonal` | `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/Diagonal/Basic.lean:95` | Unit entries z_i,z_i⁻¹ over a commutative ring. |
| `GLSymplecticFin.differenceShortRootWeylElement`, `positiveLongRootWeylElement`, `negativeLongRootWeylElement` | `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/Weyl.lean:79`, `:422`, `:428` | Distinct indices for the short-root swap; single index for reciprocal flips; normalizer formulas at lines 523 and 578. |
| `repRing` | `TauCeti/RepresentationTheory/RepresentationRing/Basic.lean:106` | Split K₀ of FDRep over a field and a monoid. It is not the rational algebraic representation category. |
| `smoothCommHopfAlgProperty_of_charZero`, `HopfAlgebra.isReduced_of_charZero` | `TauCeti/Algebra/AlgebraicGroup/Smooth/CharZero.lean:148`, `:166` | Finite-type commutative Hopf algebra over a characteristic-zero field. |
| `Comodule.isCompletelyReducible_of_isSimpleOrder` | `TauCeti/Algebra/Coalgebra/Comodule/LinearlyReductive.lean:154` | Simple subcomodule lattice implies complete reducibility. |
| `HopfIdeal.eq_augmentation_of_isNormal_of_smoothUnipotent_of_isFaithful` | `TauCeti/Algebra/AlgebraicGroup/Unipotent/Radical/Faithful.lean:94` | Algebraically closed field, reduced finite-type Hopf carrier, finite-dimensional faithful completely reducible comodule, normal smooth-unipotent subgroup. |
| `Comodule.IsFaithful` and coefficient criterion | `TauCeti/Algebra/AlgebraicGroup/Representation/Faithful/Basic.lean:221`, `:289` | Closed immersion; coefficients **together with antipode images** generate. CG.0.2's use of inverse matrix entries supplies the missing inverse multiplier. |
| `Symplectic.geometricallyConnectedCommHopfAlgProperty_coordinateHopfAlgebra` | `TauCeti/Algebra/AlgebraicGroup/Symplectic/Connected.lean:124` | Geometric connectedness over every field, useful for CG.0.2's quotient argument. |
| `LinearMap.BilinForm.IsAlt.exists_basis_apply_eq_J_inl_zero_eq` | `TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean:317` | Finite-dimensional nondegenerate alternating form; every nonzero vector heads a symplectic basis. Supplies the transitivity ingredient. |

The last two declarations should be cited explicitly when implementing the proof route; they establish that its connectedness and symplectic-basis inputs are available. They do not turn the GSp conclusions into already-proved library statements.

**Ownership and supplier resolution.** Read the relevant main versions of ClassicalGroups, ReductiveGroups and LieHighestWeight as the normative existing work, at content head `fa41b3747f56d4e77bd69e7099c1be4f2e4959ba`. The supplied open revisions of existing roadmaps were considered for overlap, not substituted as dependencies. Object searches used `roadmaps grep` and direct searches of pinned libraries, board packages and the supplied sibling checkouts. No duplicate fully qualified name from this Suggested.lean was found in another roadmap. The three generic contracts in R01 are the ownership exception.

| Cross-roadmap citation | Resolved main location | What it supplies |
| --- | --- | --- |
| ClassicalGroups Layer 0 | `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md:175` | Standard complex matrix action, inclusions and invariant forms; algebraic/rational distinction. |
| ClassicalGroups Layer 1 | Same file, line 200 | Tensor/exterior/symmetric actions and character comparisons. |
| ClassicalGroups Layer 2 | Same file, line 216 | Young-symmetrizer image and column Schur/exterior identification. |
| ClassicalGroups Layer 3 | Same file, line 237, especially 265 | Actual connected Sp highest-weight theory and torus comparison. |
| ClassicalGroups Layer 4 | Same file, line 272 | Formal/torus character formulas for classical groups. |
| ClassicalGroups Layer 5 | Same file, line 297 | Weyl dimension products, including Sp. The binomial fundamental specialization is obtained by the displayed contraction/dimension computation here. |
| ReductiveGroups Layer 0 | `TauCetiRoadmap/ReductiveGroups/README.md:129` | Hopf/scheme/point dictionaries and faithfully flat descent. |
| ReductiveGroups Layer 1 | Same file, line 176 | Rational-action/comodule comparison; native finite coefficient interfaces; closed-immersion faithfulness. |
| ReductiveGroups Layer 3 | Same file, line 234 | Subgroups, quotient sheaves and represented quotients under hypotheses. Representation descent is the explicit declared extra contract, not a hidden assertion about this section. |
| ReductiveGroups Layer 6 | Same file, line 466 | Geometric reductivity, central isogenies and characteristic-zero complete reducibility. |
| ReductiveGroups Layer 7/§7C | Same file, line 627 and 652 | Split root data, normalizer Weyl group, and all-field ordered root/Bruhat charts. §7C distinguishes its all-field algebraic construction from the complex analytic route. |
| ReductiveGroups §10A | Same file, line 1733 | Rational scalar extension, actual torus lattice, finite weights and formal characters. |
| ReductiveGroups §10B | Same file, line 1759 | Split simple classification, absolute simplicity, scalar endomorphisms and arbitrary-field extension. |
| LieHighestWeight Layer 4 | `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:537` | Native abstract finite-dimensional highest-weight classification and uniqueness. |

The open CountingBundlesAndHallAlgebrasOfCurves roadmap explicitly consumes the reciprocal Weyl algebra from this roadmap (`TauCetiRoadmap/CountingBundlesAndHallAlgebrasOfCurves/README.md:183`); it does not own a second integral GSp presentation. Searches of other supplied open files found applications of similitude groups, but no competing owner for this full integral reciprocal invariant theorem or primitive GSp tensor comparison. No supplier was moved upward. The independent Laurent arguments can be consumed without using the representation-theoretic character isomorphism; their proof routes do not use the theorem they establish.

Citation resolution reported no unresolved cross-roadmap citations or roadmap-local Lean names. Its output explicitly says it cannot inspect pinned Lake packages; the pinned checks above were performed directly and are not inferred from that resolver.

**Order and gate.** The required dependency command returned exit 0:

```text
depcheck: 204 roadmaps, 1497 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. Every Needs line was read against the supplier sections above. Restoring the existing gap contracts keeps the same supplier set. The supplied gate at the reviewed head reports:

```text
gate ClassicalGroupsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

The outside-folder diff is empty. The tracked worktree remained unchanged. The original `Suggested.lean` was directly elaborated again from the PR worktree: exit 0, with exactly the three `sorry` warnings at lines 116, 137 and 143. No Tau Ceti import required a prerequisite build.

**Lean form, binders and padding.** The file is 149 lines, with one `import Mathlib`, the required namespace/docstring, 21 real definitions/aliases and three admitted headline theorems. Every definition contributes to those statements. A scratch copy with `#check @name` for all 24 declarations elaborated; every resulting type was compared with the README and the supplied signature record. No binder was lost. The full presentation has arbitrary natural g; the two positive theorems explicitly bind `0 < g`. The ring-equivalence generator equations pin both coefficient directions and all polynomial variables, hence express the promised integer/Laurent algebra maps.

On the scratch copy, `simp`, `rfl` and `infer_instance` failed to close each of the three theorem goals. The probe retained `sorry` only after those attempts; its extra unused/unreachable-tactic lint messages concern the failed diagnostic branches, not the submitted file. Inspection of `MvPolynomial.esymmAlgEquiv` shows why a single `exact` with that library theorem cannot prove either presentation: the reciprocal flip invariants, coefficient embedding and triangular primitive substitution remain to be established. The support theorem concerns the actual generated monomial cone, not a restated closure definition. No padding declaration was found.

The three plan gaps name a supplier, have explicit field/category hypotheses, and request missing compatible interfaces rather than rebuilding the existing tensor, braiding, preadditive, coefficient-subcoalgebra or quotient carriers. Their mathematical test instances pass above. The requested repair restores their agreed single direction of supply; their present absence from ReductiveGroups is not itself a finding.

## Not verifiable

- None of the three cited texts was inaccessible. No new source request or manifest edit was needed.
- The sample labels do not identify unique subsections. Checking every occurrence, rather than guessing the seed's internal identifiers, covers the sample.
- The GSp construction and representation endpoints cannot be elaborated on a native GSp Hopf carrier at these pins because that carrier is the proposed construction. This is the documented acceptance-file limitation, not evidence that those theorems have been formally proved. Mathematical source and example checks were completed separately.

## Source issues

- **Misprint** in sternberg at §7.9, printed p.131 (`sternberg line 5054`): the source says the contraction-kernel dimension subtracts binom(2n,2j−2); it should be binom(2n,j−2); affects a stated result. At n=j=2 the printed expression is 0, whereas the kernel has dimension 5. The roadmap uses the corrected expression.
- **Misprint** in sternberg at §7.9, printed p.132 (`sternberg line 5123`): the source says the second difference-factor product has numerator j; it should be j−1, yielding the displayed telescoping product; affects the proof. At n=3 the printed left product is 9/2 while its stated right product is 3; the corrected left product is 3.
- **Misprint** in sternberg at §7.9, printed p.131 (`sternberg line 5025`): the source says the second highest weight is σ; it should be μ, consistently with the following sum and highest vector; affects nothing.
- **Misprint** in sternberg at §7.9, printed p.132 (`sternberg line 5106`): the source says r_i=a+n−i; it should be r_i=a_i+n−i; affects nothing.
- **Error** in milne at Complement 22.8, equation (139), printed pp.465–466 (`milne line 19330`, `milne line 19346`): the source says the semisimple and central summands of a dominant character are separately integral characters; they should lie in the corresponding rational spaces with only their sum required integral; affects a stated result. For GL₂, (1,0) splits as (1/2,−1/2)+(1/2,1/2), neither an integral character. The roadmap's actual GSp lattice and parity condition avoid this error.
