<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/130#issuecomment-6376933849 -->
Red team round 2 pass a (codex) of 9aa8ff1

Verdict: needs_changes

1. **F01** (P2) The Lefschetz proof uses contractions outside their declared range

   **Location:** `packages/ClassicalGroupsPartII/README.md:703`: “With the stated positive contraction on e_i∧f_i, [κ,L]=(g−k) in degree k.” The construction at lines 653–664 restricts κ to 2≤k≤g.

   **Claim:** The stated contraction family supports the Lefschetz commutator and decomposition in CG.1.5.

   **Witness:** At g=2, κ₃L₁(e₁)=e₁ and κ₄L₂(e₁∧f₁)=e₁∧f₁+e₂∧f₂. The declared range constructs only κ₂, so neither left-hand side exists.

   **Exact repair text:** “Construct κ_k:ΛᵏV→ν⊗Λ^(k−2)V for every integer k≥2, with the displayed signed contraction formula; take negative exterior degrees and κ₀,κ₁ to be zero. Construct L_k:ν⊗ΛᵏV→Λ^(k+2)V for k≥0. On ν⊗ΛᵏV prove κ_(k+2)∘L_k−(id_ν⊗L_(k−2))∘(id_ν⊗κ_k)=(g−k)id, using associators and zero boundary terms. Define P_k only for 0≤k≤g and retain the stated surjectivity range.” Add three Checks at g=2: L₀(1)=e₁∧f₁+e₂∧f₂ with κ₂L₀(1)=2; κ₃L₁(e₁)=e₁; and κ₄L₂(e₁∧f₁)=L₀κ₂(e₁∧f₁)=e₁∧f₁+e₂∧f₂, with the ν factors identified in the chosen basis. These compute 2=2−0, 1=2−1 and 0=2−2; they require the newly stated degrees.

2. **F02** (P1) The point-stability comparison has no owned rational-point density input

   **Location:** packages/ClassicalGroupsPartII/README.md:599: “schematic density of the K-points of this smooth connected split group (Milne, Proposition 4.32, p.96, and its stabilizer argument)”.

   **Claim:** The cited prerequisites supply density over every characteristic-zero K, so K-point stability detects subcomodules.

   **Witness:** milne line 4245 assumes density. TauCetiRoadmap/ReductiveGroups/README.md:176–219 supplies none; its adapter at 387–388 assumes algebraically closed k (253–258). TauCeti/RingTheory/FiniteType/PointSeparation.lean:204 also assumes an algebraically closed target.

   **Exact repair text:** Add before the point comparison: “GSp rational-point density. For g≥1 and every characteristic-zero field K, prove GSp₂g(K) schematically dense in GSp₂g,K (Milne, Theorem 17.93, p.382; milne line 15761). Use ReductiveGroups Layer 7's split Bruhat/root-subgroup coordinates: the big cell U⁻×T×U⁺ is a dense open, with affine-space root factors and a split torus. Over infinite K its K-points are dense; smoothness makes this schematic density. Apply the stabilizer argument of Milne Proposition 4.32, p.96, to deduce the stated subspace criterion.” Add this locator to the existing milne manifest entry, and add the Layer 7 dependency and specialized density target, rather than attributing density to Proposition 4.32. Test K=Q: on the rank-one big cell, a regular function vanishing on all rational affine parameters and nonzero rational torus parameters is zero. Over F₂, GL₂(F₂) has six points and is not dense in four-dimensional GL₂; the hypothesis excludes this failure.

3. **F03** (P3) The representation-ring Checks only test generic SplitK0 axioms

   **Location:** packages/ClassicalGroupsPartII/README.md:560: “[1]=1 and dimension([1])=1”; lines 561–562 give the zero class and biproduct relation.

   **Claim:** These are three discriminating Checks for the GSp representation category and its ring/dimension map.

   **Witness:** Replacing RatRep_g(K) by finite-dimensional trivial-group representations passes all three: 1↦1, 0↦0, and dim(M⊕N)=dim M+dim N. The Checks never detect the missing standard action or multiplier.

   **Exact repair text:** Replace the three bullets with: “At g=1, [V]²=[Sym²V]+[ν], with dimensions 4=3+1; characters are z²+2t+(t/z)² on both sides.” “The multiplier line and unit both have dimension 1 but distinct classes: at 2I their characters are 4 and 1.” “The inverse multiplier has dimension 1, satisfies [ν][ν⁻¹]=1 and differs from both 1 and ν: at 2I its character is 1/4, versus 1 and 4.” Retain the generic class axioms in the API prose. The trivial-group replacement fails the second and third Checks.

## Prior-finding verification

In the prior-finding table, README.md, Suggested.lean, sources.toml and design/plan.json refer to files under packages/ClassicalGroupsPartII. All 17 prior findings were compared with this head. The source and pin witnesses below were reread; no previous review was treated as proof. “Repaired” refers to the original defect, not every possible defect in the surrounding target.

| Prior finding | Status | Repaired passage at this head | Witness / remaining issue |
|---|---|---|---|
| r1a F01 | Repaired | Suggested.lean:137, “(g : ℕ) (hg : 0 < g)”; README:1153, “empty generating set gives only integer constants” | At g=0, B₀=Z, h(t)=1 and t∉B₀; both positive headlines exclude g=0 in the supplied elaborated types. |
| r1a F02 | Repaired | Suggested.lean:1, “import Mathlib”; README:144, “GrothendieckGroup/Monoidal/Basic.lean” | No Tau Ceti imports. Links use a91d3aaf/6b7abb3c; liftRingHom/mapRingHom occur at lines 263/324 of the corrected file. |
| r1a F03 | Repaired | Suggested.lean:14, “are not statable at the pins”; line 117, “∃ e : MvPolynomial … ≃+* invariantSubring g” | 21 real-bodied definitions/aliases, three theorem admissions, no admitted datum. Both presentations fix generators. At rank one the inverse of z²+(t/z)² is X²−2T. |
| r1a F04 | Repaired | Suggested.lean:7, “headline theorems”; only admissions at 120,139,147 | All 58 admitted examples deleted; zero examples remain. README preserves numerical Checks. |
| r1a F05 | Repaired | Suggested.lean:22, “namespace TauCetiRoadmap.ClassicalGroupsPartII”; line 24, “## Layer CG.0” | One root import, namespace/layer order, docstrings on 24 declarations, three theorems; no lemma or set_option. |
| r1a F06 | Repaired as declared contracts; settled supplier work | README:184,190,196, “What ReductiveGroups must provide (gap:…)” | All three slugs, suppliers and sections match design/plan.json. Precise vector/quotient/category contracts reuse native ingredients and are not claimed to exist. No re-raising of the settled disposition. |
| r1a F07 | Repaired | README:778–784, “Identify the explicit primitive-tensor model … with the simple of ReductiveGroups §10B” | Current main §10A–10B:1733–1782 owns rational extension, characters, classification, End=K and absolute simplicity. Only the specified GSp model comparison is new. |
| r1a F08 | Repaired | README:582, “Bundle TauCeti.Comodule.exteriorPower … Reuse … Hom.exteriorPowerMap” | ExteriorAlgebra/Power.lean:73,110,166 supplies coaction, morphism and point formula. At (1+ε)I, Λ² action is 1+2ε over Q[ε]/ε². |
| r1a F09 | Repaired | README:298, “CG.0.2 Central isogeny and connected reductivity”; line 316, “Splitness is established with the diagonal torus below” | Reductivity precedes CG.0.4/0.5. Native faithful-representation normal-unipotent elimination supplies the mathematical criterion; no internal cycle remains. |
| r1a F10 | Repaired | README:718–719, “Corollary 4.34 … Exercise 4-4(a,b)” | milne lines 4256/4281 state invariant/Hom extension. For Q→C, C⊗Q Q→C sends a⊗b to ab; unextended Q→C is not onto. |
| r1a F11 | Repaired for its listed constructions | README:683, “κ₂(e₁∧f₁)=1 … κ₂(f₁∧e₁)=−1”; line 1015, “X₁²−2T” | Zero and opposite-sign contractions fail. Translated generators fail the specified inverse polynomial. S03 concerns another definition's generic Checks. |
| r1a F12 | Partly repaired | README:365–379 gives roots/order; line 1155 names coneValue | All 24 names occur. α₁=(−1,2) has degree 0; 0≤2α₁ but not 0≤e₁. h(0,1)+h(0,−1)=−1<0. Raising-map Checks are still absent; S01 records its missing degree family. |
| r1a F13 | Repaired | sources.toml:1, “tauceti-roadmap-sources/v1” | Three lifetime keys, with versions, hashes, legal origins and locators; all cached legal extractions available. |
| r1b F01 | Partly repaired | README:593–602, “standard point comparison target”; line 705, “ClassicalGroups Layer 2” | Local comparison now stated; alternating-image citation correctly points to Layer 2:231–232. Its arbitrary-K density input remains unowned (S02). |
| r1b F02 | Repaired | README:28/70/120/221, “Scope and ownership”, “Conventions”, “Exact supplier contracts”, “How to read the build” | Required sections, supplier subsections, Needs, Checks and layer endings exist; no display TeX or process references. |
| r1b F03 | Repaired | Suggested.lean:1, “import Mathlib” | All unused Tau Ceti imports and declarations needing them are absent. Retained definitions use Mathlib types. |
| r1b F04 | Repaired | Suggested.lean:52–54/60–74 contain actual permutation/flip proofs | No easy admitted fields or examples remain; none of the three theorems is definitionally true or follows from one native result. |

## Verified sound

Read all **1,347 README lines**, all **149 Suggested.lean lines**, **24 declarations** (3 aliases, 18 definitions, 3 theorems), **27 numbered target blocks**, **80 bold labels** (the summary, eight conventions and target proof/Check/consequence labels), and **97 Check bullets**. The tables below record computations, including the bold consequences. Checked **16 distinct cited locator units across three works** and **14 distinct supplier-section contracts** (ReductiveGroups 0,1,3,6,7,10A,10B; ClassicalGroups 0–5; LieHighestWeight 4). S02 is the unresolved supplier-input issue. No direct citations to the 27 supplied sibling heads occur; all 27 heads were searched by object, as were main, Completed, board packages and the indexed open-roadmap search.

The three retained theorems have the README's integral generality. No false Lean theorem, admitted data, lost section binder, one-tactic theorem padding, namespace collision or omitted statable headline was found. No blanket approval of the proof plans is implied: S01 and S02 need repair. S03 records generic rather than discriminating Checks.

The headline list is: central isogeny/reductivity; primitive exterior decomposition and simplicity; rational Cartan-model comparison; scalar-extension ring equivalence; full invariant presentation; rational character isomorphism; exponent-support criterion; positive invariant presentation; exact tensor occurrence; tensor-character isomorphism; multiplier localization. The three purely integral headlines are stated. The module docstring names the other eight and the missing GSp Hopf algebra, finite-comodule category and associated objects. Its coordinate quotient is a construction target, not a permissible light definition. The pinned Sp and GL Hopf algebras do not include an independent multiplier. Auxiliary character injectivity and Hom/weight comparisons use the same unavailable GSp objects.

The supplied signatures were compared declaration by declaration, not re-elaborated. There are no section variables or universes to be silently dropped; each declaration's complete argument context is listed below. Both positive theorems retain explicit 0<g. The full theorem permits rank zero. Ring equivalences here automatically preserve integers; fixing T and T⁻¹ also fixes every Laurent coefficient, so the README's algebra-equivalence wording agrees with the Lean statements.

### Declaration/context and adversarial table

All names in this table are in packages/ClassicalGroupsPartII/Suggested.lean, namespace TauCetiRoadmap.ClassicalGroupsPartII. There are no standing variable/instance hypotheses. Each row gives the entire additional argument context; the only implicit arguments are marked with braces. Write w=t/z and x=z+w in rank one. Coefficients refer to the formal monomial basis, not evaluations.

| Declaration; line; layer | Full argument context | Instances and computed values | Result/change |
|---|---|---|---|
| Weight;27;CG.0 | g:ℕ | g=0 gives Z×{0}≅Z; g=1 gives Z²; (−1,0) is an element in both ranks | No unintended positivity; none |
| Laurent;30;CG.0 | g:ℕ | g=0: 1,t,t⁻¹ have coefficients at exponent 0 equal to 1,0,0; t²t⁻²=1 | Independent formal basis; none |
| monomial;33;CG.0 | {g:ℕ}, wt:Weight g | [0]=1; [(−1,2)]·[(1,−2)]=[0]; coefficient at its own weight 1, at a different weight 0 | Native multiplication agrees; none |
| t;37;CG.0 | g:ℕ | exponent (1,0), coefficient 1; degree 2; at scalar 2 its value is 4 | Multiplier normalization; none |
| tInv;40;CG.0 | g:ℕ | exponent (−1,0), degree −2; t·tInv=1; scalar-2 evaluation 1/4 | Inverse, not negative t; none |
| z;43;CG.0 | {g:ℕ}, i:Fin g | rank one exponent (0,1), degree 1; coefficient at (1,−1) is 0; scalar-2 value 2 | First letter; no Fin 0 inhabitant |
| pairedZ;46;CG.0 | {g:ℕ}, i:Fin g | exponent (1,−1), degree 1; z·pairedZ=t; at t=6,z=2 gives 3, versus inverse z giving 1/2 | Reciprocal convention; none |
| permWeight;49;CG.0 | {g:ℕ}, σ:Perm(Fin g) | transposition: (−1,2,−3)↦(−1,−3,2)↦original; rank-three cycle sends e₁ to e₂, inverse-cycle convention sends e₁ to e₃ | σ⁻¹ pullback correct; none |
| flipWeight;57;CG.0 | {g:ℕ}, i:Fin g | (−1,2)↦(1,−2)↦(−1,2); both degrees 0; e_t↦e_t; (0,1)↦(1,−1) | Involution, additive; none |
| permLaurent;77;CG.0 | {g:ℕ}, σ:Perm(Fin g) | z₁²↦z₂²; t⁻¹↦t⁻¹; −3↦−3; rank-three cycle agrees with permWeight | Native domCongr preserves coefficients; none |
| flipLaurent;81;CG.0 | {g:ℕ}, i:Fin g | z²↦t²/z²; t⁻¹↦t⁻¹; −3↦−3; inverse z↦z/t | Includes negative exponents; none |
| invariantSubring;85;CG.0 | g:ℕ | g=0 fixed ring L₀; g=1 x fixed and z not fixed (flip(z)=w≠z); g=2 x₁ flip-fixed but transposition gives x₂≠x₁ | Both generator families essential; none |
| pairSum;93;CG.2 | {g:ℕ}, i:Fin g | coefficients 1 at (0,1),(1,−1), 0 at (0,−1); augmentation 2; flip(x)=x | Wrong ordinary inverse excluded; none |
| exteriorCharacter;96;CG.2 | g:ℕ, k:ℤ | g=0: E₋₁=0,E₀=1,E₁=0; g=1: E₁=x,E₂=t,E₃=0; g=2: E₂=x₁x₂+2t,E₄=t² | Signed guard prevents (−1).toNat=0 giving 1; none |
| fundamentalCharacter;102;CG.2 | {g:ℕ}, i:Fin g | i=0 gives E₁−tE₋₁=E₁; g=2,i=1 gives x₁x₂+t, augmentation 5; g=3,i=2 gives e₃+t e₁, augmentation 14 | Integer subtraction retained; none |
| MultLaurent;106;CG.2 | none | T² and T⁻² have distinct support; coefficients at 0 are both 0; product is 1 | Coefficients are Laurent; none |
| coeffT;109;CG.2 | none | coefficients at 1,0,−1 are 1,0,0; square exponent 2; product with coeffTInv=1 | Real body; none |
| coeffTInv;112;CG.2 | none | coefficients at −1,0,1 are 1,0,0; square exponent −2; product with coeffT=1 | Real body; none |
| fullInvariantPresentation;116;CG.2 | g:ℕ | g=0 is Z[T±1]≅L₀; g=1 X↦x,T↦t,T⁻¹↦t⁻¹; g=2 inverse(e₂)=X₂−T; inverse(z²+w²)=X²−2T | True; integral orbit recurrence and symmetric-polynomial theorem required, not one tactic |
| positiveSubring;125;CG.3 | g:ℕ | g=0 contains only constants; g=1 contains z,w,t=zw and −x; excludes z⁻¹ and t⁻¹ with h=−1 | Real closure, signed coefficients; none |
| positiveInvariantSubring;129;CG.3 | g:ℕ | g=0 is Z; g=1 contains −x, excludes z by flip and t⁻¹ by support; t∈B₁∩L₁^W | Intersection correct; none |
| coneValue;133;CG.3 | {g:ℕ}, wt:Weight g | h(0,1)=0,h(1,−1)=0,h(0,−1)=−1; h(e)+h(−e)=−1≤h(0)=0; h(2,1,−2)=0 | Superadditive, Weyl-invariant; none |
| mem_positiveSubring;137;CG.3 | g:ℕ, hg:0<g, f:Laurent g | f=−z−w: membership true, support values 0,0; f=t⁻¹: false, inequality −1≥0 false; f=0: true and empty support universally true | Both directions tested; g=0 counterexample excluded |
| positiveInvariantPresentation;143;CG.3 | g:ℕ, hg:0<g | g=1 none↦t,some 0↦x; g=2 some 1↦x₁x₂+t; inverse(z²+w²)=X²−2T; no polynomial maps to t⁻¹ | Exact images fix translation; g=0 excluded |

### README target and convention table

Locations in this table are packages/ClassicalGroupsPartII/README.md. The 27 numbered rows include their proof formulas, required interfaces and bold “Consequences to check”; additional rows isolate constructions or conventions that need their own calculations. Unless explicitly integral, representations have g≥1 and a characteristic-zero field. The field hypothesis excludes the zero coefficient ring, a DVR that is not a field, and characteristic 2/3; the **value algebra** A may be zero or nonreduced. No arbitrary topological group, nonsplit group or inseparable field extension is quantified over. The unit ideal is not a Hopf ideal over a nonzero field, since its counit image contains 1. No q, cover, fan or degree-of-zero-polynomial parameter occurs. Characteristic-zero field extensions are separable; arbitrary transcendence degree is permitted.

| Statement/location | Instances and values computed on both sides | Result/change |
|---|---|---|
| Summary/full and constituent rings;3–17 | g=1: full Z[t±1,x], constituent Z[t,x]; ν⁻¹ maps to t⁻¹ in the first and is absent in the second | Rings use integer virtual coefficients; no false identity |
| Rank/coefficient convention;72 | g=0: V=0 but multiplier not uniquely recovered from empty matrix; for g=1 it is det. Characteristic 2 makes 1/2 unavailable; characteristic 3 makes 1/3! unavailable | Representation restriction genuine; integral ranks include 0 |
| Algebraic-comodule convention;77 | G_m-weight 1: δ(v)=v⊗t, action at 2 is 2v; trivial action gives v. For finite field F₂, t and 1 agree at its sole unit but are distinct functions | Algebraic actions cannot be replaced by arbitrary point representations |
| Form/basis convention;83 | ω(e₁,f₁)=1, ω(f₁,e₁)=−1; h=diag(2,3): hJhᵀ=hᵀJh=6J | Correct common multiplier, no transpose inverse error |
| Torus/centre convention;88 | diag(2,3): (t,z)=(6,2); scalar 2: (t,z)=(4,2); ν(cI)=c² | Independent t, not a scalar of degree 1 |
| Weight/dominance convention;92 | rank one α=(−1,2), d(α)=0; (−1,0) dominant with d=−2; (0,−1) nondominant | Negative m included; no characteristic-p converse used |
| Integral coefficient convention;98 | coefficients of z²+w² are 1,1; x²−2t has the same coefficients, constant orbit 1 has coefficient 1, not 2 | No Weyl averaging |
| Exterior index convention;102 | k=1: E₁−tE₋₁=E₁, while natural truncated subtraction would give E₁−t; g=0 E₀=1 | Signed degrees agree with Lean |
| Positive convention;109 | −z−w has coefficients −1,−1 and h=0 on both; t⁻¹ has coefficient 1 and h=−1 | Positivity is support, not coefficient sign |
| CG.0.1 coordinate/Hopf/point presentation;258–296 | rank one h=diag(2,3) gives det=6=s; h=0 gives det=0 so D det=1 fails over Q; h⁻¹ has s=1/6; h·diag(5,7) has s=210=6·35 | Correct invertible point functor and Hopf directions |
| Noncommuting Hopf multiplication;263–265 | h=diag(2,3), j=[[0,1],[−1,0]] give hj=[[0,2],[−3,0]] and jh=[[0,3],[−2,0]]; Δ(x₁₂)(h,j)=2, not 3 | Matrix-coaction multiplication order verified |
| Coordinate fibre/entries/counit;263–286 | x₁₁,x₂₂,x₁₂ at diag(2,3) are 2,3,0; s=1 at diag(2,1/2); counit at I gives diagonal 1/off-diagonal 0 and s=1 | Sp fibre and GL₂ comparison |
| Zero/nonreduced value algebra;266 | Zero A: unique matrix 0=I is invertible and both point sets are singletons. A=Q[ε]/ε², h=(1+ε)I has s=(1+ε)²=1+2ε | No reducedness or nonzero-A requirement missing |
| CG.0.2 central isogeny/reductivity;300–331 | ca=I implies a=c⁻¹I,c²=1, hence a=cI; c=−1,a=−I maps to I. For s=2, adjoining C²=2 gives inverse C/2 and symplectic C⁻¹h | Exact μ₂ kernel, fppf rather than Q-point surjectivity |
| Central-cover thickening;326 | (1+ε/2)²=1+ε; basis {1,C} of A[C]/(C²−s) has rank 2; C·(C/s)=1 | Finite free, faithfully flat even nonreduced A |
| Early reductivity route;303–310 | In rank one a nonzero invariant subspace containing e₁ contains f₁ via pair swap, hence dimension 2; at general rank root moves give all 2g basis vectors | Faithfulness and simplicity eliminate the unipotent radical; pinned supplier found |
| CG.0.3 lattice/cover image;335–384 | (m,u)=(−1,(2,−3)) gives d=−3 and (d−Σu)/2=−1; standard u=(1,0) with d=0 gives odd difference, no integer m; u=0,d=−2 gives m=−1 | Injectivity and both image directions |
| Roots/coroots/order;365–379 | g=2 roots (0,1,−1),(−1,0,2), degrees 0,0; pairings are u₁−u₂,u₂; at g=1, 0≤(−2,4) but (0,1) has degree 1 and is not comparable with 0 | Root order antisymmetry from independent simple roots; m not restricted |
| CG.0.4 torus immersion/root datum;388–416 | rank one diag(z,t/z) at (6,2) is diag(2,3); at t=1 determinant 1; scalar c has t=c²; conjugation scales E₁₂ by z²/t | Last root 2e₁−e_t, not 2e₁; centralizer diagonal |
| CG.0.5 Weyl/group algebra;420–479 | flip(−1,2)=(1,−2), square identity; g=2 flips commute; 3-cycle and transposition do not commute on e₁ (images e₁ versus e₃ in one ordering) | Nonabelian permutation control; native action formulas correct |
| Weyl invariant/full rank-zero boundary;444–475 | g=0 W trivial, invariants L₀=Z[t±1]; g=1 x fixed, z↦w≠z; g=2 x₁↦x₂ under swap | Both generator families necessary |
| CG.0.6 parity/descent;483–501 | standard u has sum 1: ε=−1 gives (−1)^(d+1), value −1 for d=0, +1 for d=1; u=0,d=±2 gives +1 | Scheme kernel-triviality, not assumed rational lifts |
| CG.1.1 category/ring/dimension;534–566 | dim0=0,dim1=1; g=1 dim(V⊕1)=3=2+1, dim(V⊗V)=4=2·2; trivial-group category also passes the three printed Checks | Mathematics correct; S03 replaces nondiscriminating tests |
| CG.1.2 standard coaction;570–620 | δ(e_b)=Σe_a⊗x_ab evaluates at diag(2,3) to 2e₁,3f₁; at 2I gives 2 rather than inverse action 1/2; top wedge scalar at 2I is 2^(2g)=(2²)^g | Column/right-comodule convention agrees |
| Point comparison/subspaces;593–606 | K e₁ fixed by torus but pair swap sends e₁ to −f₁, so not a GSp subcomodule; 0 and V give dimensions 0 and 2g on either side | Truth for characteristic-zero K; density proof input needs S02 |
| Exterior/tensor objects;590–591 | g=1 exterior dimensions k=0,1,2,3 are 1,2,1,0; tensor dimensions d=0,1,2 are 1,2,4; (1+ε)I on Λ² acts by 1+2ε | Zero/zeroth degree correctly distinguished |
| CG.1.3 multiplier line;624–649 | ν⁰=1; ν¹ν⁻¹ at 2I gives 4·1/4=1; ν² gives 16=4²; dual sends 4 to 1/4 | All integer exponents, no excluded negative twists |
| CG.1.4 twisted contraction/kernel;653–687 | κ₂(e₁∧f₁)=1, reversed wedge −1; κ₂(e₁∧e₂)=0; g=2 kernel dimension 6−1=5; scalar-2 image transforms by 4 | Nonzero normalization excludes zero/sign reversal; range insufficient for next proof (S01) |
| Higher contraction sign;657–660 | g=3, κ₃(e₁∧e₂∧f₁)=−e₂ since omission positions (1,3) give (−1)³; κ₃(e₁∧e₂∧f₂)=e₁ | Correct omission order |
| CG.1.5 decomposition/dimension/highest weights;691–709 | g=2,k=2:6=5+1; g=3,k=3:20=14+6; highest e₁∧e₂ has weight (0,1,1) and contraction 0; k=1:2g=2g+0 | Correct target; full Lefschetz families required by S01 |
| Raising/commutator;703 | g=2 L₀(1)=e₁f₁+e₂f₂, κ₂L₀=2; on e₁ degree1 bracket=1; on e₁f₁ degree2 bracket=Ω−Ω=0; on top degree4 bracket=−2 | Values g−k, correct sign/twist; some κ operators missing (S01) |
| Alternating splitting;705 | k=0 projector=1, k=1 identity; k=2 (1−swap)/2 has values 1 on alternating and 0 on symmetric tensors; denominators unavailable in characteristic2 | Every characteristic-zero K allowed |
| CG.1.6 Hom/weight extension;713–740 | unit Hom map K⊗F F→K: a⊗b↦ab; zero Hom gives 0→0; rank-one standard weight spaces remain dimensions 1,1 and zero weight 0 | Finite dimension/flatness valid; Q→C not full on unextended Hom |
| Isomorphism/zero reflection;720–729 | multiplication by 2 has determinant2 over F and K; zero has determinant0 over both. In finite Hom space a nonzero determinant polynomial has an F-point since F infinite | Quantifiers arbitrary K/F; no C embedding required |
| CG.1.7 Cartan model;744–774 | u=(3,1,0) gives a=(2,1,0), Σk a_k=4=Σu; u=0 gives empty tensor1; g=1 L(−1,2)=det⁻¹Sym²V, degree0, dimension3 | Specified rational top vector, not arbitrary complex form |
| Generated vector/base change;756 | v=0 generates0; tensor of top vectors is nonzero, its top space dimension1; extension sends v to1⊗v≠0 | Declared gap supplies generic least-subcomodule compatibility |
| Twist identification;764 | ν⁻¹⊗L(1,u)=L(0,u); for u=0 characters t⁻¹t=1 and dimensions1·1=1 | m ranges over all Z |
| CG.1.8 supplied classification;778–795 | rank one labels (−1,0),(0,1),(1,0) have dimensions1,2,1 and scalar degrees−2,1,2; End_Q(1)=Q, End_C(1)=C, each dimension1 | Consumes §10B, not a second classification |
| Zero/multiplicity classification;782–783 | zero has all multiplicities0; 1⊕1 has unit multiplicity2 and dimension2; 1 has multiplicity1 | Includes zero and repeated simples |
| CG.1.9 ring scalar extension;799–827 | K=Q fixes [V],[ν]; Q→C,Q→Q(t) preserve top multiplicity1; [ν⁻¹] maps to same exponent−1, dimension1 | Ring equivalence does not claim category equivalence |
| CG.2.1 character/trace/augmentation;882–918 | g=1 ch(V)=z+w; at t=6,z=2 gives5=trace diag(2,3); ch(V⊗V)=z²+2t+w²; augmentation4=dim V⊗V | Integer coefficients and weight multiplicities correct |
| Character on zero/virtuals/base change;887–914 | ch0=0,ch1=1,chν⁻¹=t⁻¹; ch(−[V])=−z−w gives augmentation−2; extension preserves coefficients1 | Ring lift, not actual-character positivity |
| CG.2.2 injectivity;922–938 | rank one ch(det^m Sym^u V) has highest t^m z^u coefficient1; coefficient−2 in a maximal-weight relation remains−2≠0 | Finite maximal-weight argument covers negative coefficients and incomparable central degrees |
| CG.2.3 exterior polynomials;942–981 | g=2 generating product gives E₂=x₁x₂+2t, E₄=t²; F₂=x₁x₂+t; g=3 E₃=e₃+2t e₁ and F₃=e₃+t e₁ | Each sign/binomial correction verified |
| CG.2.4 full invariant presentation;985–1019 | g=1 p₂=x²−2t,p₃=x³−3tx; g=2 e₂=F₂−t; g=0 no X variables, t remains invertible | Integral triangular inverse, not rational averaging |
| Orbit zero/multiple pairs;841–855 | single zero orbit=1 while p₀=2; g=2 orbit of z₁z₂ sums z₁z₂+w₁z₂+z₁w₂+w₁w₂=x₁x₂ with four coefficients1 | Stabilizers cause no division; independence by leading monomial |
| CG.2.5 primitive character;1023–1037 | g=2 ch(P₂)=E₂−tE₀=x₁x₂+t, augmentation5; g=1 ch(P₁)=x, chν=t; top wedge t^g | Actual modules supply fixed-ring generators |
| CG.2.6 rational character isomorphism;1041–1069 | g=1 Sym² character=z²+t+w²=x²−t; inverse sends x²−t to[V]²−[ν], dimension4−1=3; t⁻¹↦[ν⁻¹] | Exact canonical forward map specified |
| CG.3.1 support/cone;1125–1170 | (m,u)=(2,1,−2): subset sums2,3,0,1, min0=h, monomial z₁w₂²; (3,1,−2) adds factor t and h=1 | Both directions reconstruct exponent; no coefficient-sign restriction |
| Cone boundary/rank zero;1148–1166 | h(z)=h(w)=0; h(t⁻¹)=h(z⁻¹)=−1; B₀=Z while h(t)=1. −x∈B₁^W but z∉B₁^W | Repaired positive-rank hypotheses essential |
| CG.3.2 positive invariants/localization square;1174–1200 | g=1 inverse(z²+w²)=X²−2T; t⁻¹ no polynomial preimage; localizing Z[T,X] at T gives Z[T±1,X] with same X↦x | No hidden denominators; ring-map square commutes |
| CG.3.3 tensor-constituent ring;1204–1232 | g=1 V²=Sym²V⊕ν, dimensions4=3+1; degree0 unit included; t has x-degree0 and t-degree1 so t∉Z[x] | All constituents, not merely [V], generate |
| CG.3.4 exact occurrence iff;1236–1251 | rank one degree2 contains L(0,2) and L(1,0); L(−1,2) has degree0 but m<0 so absent. Unit only degree0: at 2I tensor degree2 scalar4≠1 | Both m≥0 and degree equality necessary |
| Occurrence sufficiency/tensor top degree;1246–1247 | u=(3,1) gives a=(2,1), degree2·1+1·2=4; one ν raises degree to6. P₂ is degree2 and ν is degree2, though dimensions5 versus1 at g=2 | Cartan factors and pairing supply exact degree |
| CG.3.5 tensor-character equivalence;1255–1283 | g=1 [Sym²V] maps to z²+t+w², coefficients1,1,1 and h-values0,1,0; ν⁻¹ has support h=−1 and cannot enter through virtual subtraction | Surjectivity via t,F_k and injectivity inherited |
| CG.3.6 generation/localization;1287–1304 | g=2 [P₂]=[Λ²V]−[ν], dimensions5=6−1; k=1 correction0; t⁻²x+t⁻¹ multiplied by t² becomes x+t∈B^W | Finite Laurent support gives one nonnegative denominator-clearing exponent |

### Locator, supplier and pin evidence

The source-locator count treats Complements 22.3–22.6 as one unit and Exercise 4-4(a,b) as one unit. All 16 cited units were resolved in the supplied legal extractions. Statements were checked at the cited versions; no text was fetched from an unapproved mirror. No additional source was required.

| Locator units | Source witness and mathematical scope |
|---|---|
| Yu §7.1; (7.1.1); Remark 7.1.1, p.64 | yu line 3730 fixes reciprocal substitutions; yu line 3736 gives the cone; yu line 3745 defines GSp over Q; yu line 3761 gives full characters; yu line 3766 gives primitive generators and tensor interpretation. The arbitrary-characteristic-zero extension is a roadmap consequence, not a quotation from Yu. |
| Milne Proposition 4.32, Corollary 4.34, Exercise 4-4(a,b), pp.96–97 | milne line 4245 requires density; milne line 4256 gives invariant extension; milne line 4281 gives Hom extension and infinite-base-field isomorphism descent. S02 concerns ownership of the density input. |
| Milne Corollary 19.18 and Example 19.19, p.401 | milne line 16492 requires geometric semisimplicity of a faithful representation; the roadmap proves simplicity after algebraic closure. milne line 16502 applies this to the standard Sp action. |
| Milne Summary 21.98, p.461 | milne line 19149: type-C roots, simple roots, full Sp weight lattice and μ₂ centre. Setting t=1 specializes the package's last root 2e_g−e_t to 2e_g. |
| Milne root order before Definition 22.1, p.464; Theorem 22.2 and Complements 22.3–22.6, pp.464–465 | milne line 19285 fixes nonnegative simple-root differences; milne line 19291 gives one-dimensional highest lines; milne lines 19304,19308,19313,19317 give uniqueness, End=K, absolute simplicity, extension/descent and product simples. Splitness is indispensable and retained. |
| Milne Complement 22.12, p.466 | milne line 19367 identifies the finite-index character lattice under a central isogeny; package parity is its explicit GSp instance. |
| Milne Lemma 22.39, Theorem 22.42, pp.477–479 | milne line 19813 gives descent of semisimplicity; milne line 19859 states characteristic-zero reductivity/complete reducibility, including the faithful-representation criterion. |
| Sternberg §7.9, pp.131–133 | sternberg line 5024: Cartan top vector; sternberg line 5043: contraction to degree k−2 and surjectivity for 2≤k≤g; sternberg line 5143: second fundamental dimension. The incorrect index at sternberg line 5054 is not copied into the package. |

Two adjacent source assertions were additionally tested. In Milne 22.8, take GL₂ with X=Z², Q=Z(1,−1), P=Z(1/2,−1/2), and X₀=Z(1,1). The weight (1,0) would require central coefficient 1/2, so it is not in X₀+P. The roadmap's parity lattice avoids this erroneous integral splitting. In Sternberg's dimension formula, n=j=2 gives the printed 6−6=0, while contraction has rank 1 and kernel dimension 5; the package correctly uses 6−1.

| Supplier/owner | Resolved contract and hypothesis check |
|---|---|
| TauCetiRoadmap/ReductiveGroups/README.md:145–174, Layer 0 | Hopf/represented-functor dictionary and base change; the GSp generators-and-relations specialization is local. |
| Same file:176–219, Layer 1 | Native right comodules, rational comparison, faithfulness and finite-dimensional coefficients; no claim of an already supplied generated-vector/base-change or category-glue theorem. |
| Same file:234–247, Layer 3 | Subgroup schemes and fppf quotients; quotient-representation descent is the declared gap, not rational-point surjectivity. |
| Same file:466–477, Layer 6 | Geometric reductivity, central isogenies and characteristic-zero complete reducibility. Native faithful normal-unipotent elimination supplies the early proof route without using root data. |
| Same file:627–658, Layer 7 | Split pairs, root data and actual root subgroup/Bruhat machinery. Positive and negative root orientations match the package. |
| Same file:1733–1782, §10A–10B | Integral torus labels, scalar extension, characters, split simple classification, End=K and absolute simplicity. Dominance uses B⁺ and actual X, not the unrestricted Lie weight lattice. |
| TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md:176–212, Layers 0–1 | Complex matrix-standard representation and abstract tensor/exterior/symmetric operations; cannot by themselves assert arbitrary-K algebraic point-density. |
| Same file:216–235, Layer 2 | Column Schur functor and alternating image for every k; not only the tensor-square splitting. |
| Same file:237–308, Layers 3–5 | Complex classical highest weights/characters and Sp Weyl dimension product. The binomial fundamental dimension is obtained by the package's specialized calculation, rather than a new general Weyl formula. |
| TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:537–567, Layer 4 | Finite-dimensional semisimple Lie highest-weight classification; not by itself classification of GSp, whose central degree is separate. |

The three gaps are precise and owned, and the README/plan slugs match. The least-generated-subcomodule gap asks for compatibility for every field extension, beyond the native finite coefficient subcoalgebra. The quotient gap is group-scheme kernel-triviality, beyond an abstract quotient of K-points. The category gap asks for the compatible small/linear/monoidal package while explicitly reusing finite comodules, tensor, braiding and preadditivity. No named native implementation of all remaining category compatibility was found. No part of the settled F06 is re-raised.

All **26 advertised native interfaces** (3 Mathlib, 23 Tau Ceti) were inspected at the actual pins; the material assumptions are recorded here. Additional native inputs were checked to resolve the new proof-route leads.

| Pinned file/declaration | Exact reusable interface |
|---|---|
| Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:42, Matrix.GeneralLinearGroup | Units of the matrix algebra, finite decidable index, semiring coefficients; it does not presume an orthogonal or similitude condition. |
| Mathlib/Algebra/MonoidAlgebra/Basic.lean:302, MonoidAlgebra.domCongr | Index-monoid equivalence gives algebra equivalence; coefficient transport is along the inverse equivalence. |
| Mathlib/RingTheory/MvPolynomial/Symmetric/FundamentalTheorem.lean:340, MvPolynomial.esymmAlgEquiv | CommRing coefficients and cardinality equality; no field or invertible symmetric-group order. |
| TauCeti/Algebra/Coalgebra/Comodule/Finite/Basic.lean:64,96 | isFG is exactly Module.Finite; FGComoduleCat is its full subcategory, not a category of semisimple or geometrically simple objects. |
| TauCeti/Algebra/Coalgebra/Comodule/Finite/Monoidal.lean:161; Finite/Symmetric.lean:81; Finite/Product.lean:158 | Monoidal, braided and binary-biproduct structures; tensor module universe matches the scalar universe, and braiding requires commutative coefficient bialgebra. |
| TauCeti/Algebra/Coalgebra/Comodule/Finite/Preadditive.lean:48–62 | Inherited preadditivity/additive forgetful functor; does not assert the whole category supplier gap. |
| TauCeti/CategoryTheory/GrothendieckGroup/Split.lean:108–124 | SplitK0 and of require essentially small category with zero morphisms and binary biproducts. |
| TauCeti/CategoryTheory/GrothendieckGroup/Monoidal/Basic.lean:114,179,263,324 | MonoidalPreadditive and EssentialSmallness for product/lift; mapRingHom uses an additive monoidal functor. Braiding makes the ring commutative. |
| TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Weight.lean:83,105,112 | weightSpace takes the module explicitly; internal weight direct sum; finite support requires Module.Finite. |
| TauCeti/Algebra/Coalgebra/Comodule/BaseChange.lean:166 | baseChange changes both module and coalgebra and is explicitly selected, not a global instance. |
| TauCeti/Algebra/Coalgebra/Comodule/MatrixCoefficient/Subcoalgebra.lean:53,92 | Coefficient subcoalgebra and finite instance require finite freeness, supplied by finite dimension over a field. |
| TauCeti/Algebra/Coalgebra/Subcomodule/Comap.lean:50–54,238,249 | ker assumes Module.Flat R C; ker_finite also IsNoetherian R M. Field and finite-dimensional source supply both. |
| TauCeti/Algebra/Coalgebra/Comodule/ExteriorAlgebra/Power.lean:40–44,73,110,166 | Exterior comodule, induced map, arbitrary-value-algebra pure-wedge action; no flatness/reducedness assumption on value algebra. |
| TauCeti/Algebra/AlgebraicGroup/Symplectic/Basic.lean:104; GeneralLinear/Coordinate/HopfAlgebra.lean:479 | Existing Sp Hopf quotient and GL determinant localization; neither alone is O(GSp). |
| TauCeti/RepresentationTheory/ClassicalGroups/ExteriorPower.lean:138 | char_extPowerRep_diagonal is an abstract GL trace identity over a field; the local GSp comparison is still needed. |
| TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/Basic.lean:243; Symplectic/Diagonal/Basic.lean:95 | JFin and the paired diagonal Sp inclusion, agreeing with t=1. |
| TauCeti/Algebra/AlgebraicGroup/Unipotent/Radical/Faithful.lean:94 | HopfIdeal.eq_augmentation_of_isNormal_of_smoothUnipotent_of_isFaithful eliminates a normal smooth unipotent subgroup using a faithful completely reducible finite comodule over an algebraically closed field; ambient Hopf algebra reduced/finite type. This discharges the early reductivity criterion lead. |
| TauCeti/Algebra/AlgebraicGroup/Symplectic/StandardComodule.lean:301 | instIsSimpleOrderSubcomodule proves standard Sp simplicity over a field in positive rank; no new proof of general Sp simplicity is necessary. |
| TauCeti/RingTheory/FiniteType/PointSeparation.lean:204 | eq_of_forall_algHom_apply_eq separates reduced finite-type algebra elements by points in an algebraically closed extension. It does not prove density of Q-points, the missing input in S02. |

Ownership by object found no other owner of the **integral reciprocal fixed-ring presentation or the explicit multiplier-twisted primitive-tensor GSp comparison**. These remain this Part II roadmap's work. Generic classification and formal-character constructions belong to ReductiveGroups and are now imported. The supplied OverconvergentAutomorphicForms head mentions the GSp torus as an arithmetic input, not these constructions. Other supplied siblings had no competing construction. No retained fully qualified name occurs in the searched main, completed, board or supplied sibling files. The indexed open-work search was used as discovery; revisions of existing roadmaps were not substituted for main. No ownership is moved upward or to a later roadmap.

The requested dependency command returned exit 0:

```text
depcheck: 28 roadmaps, 235 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. Current content main is 72d2b66f. The relevant suppliers are on main; ClassicalGroupsPartII is line 271 of the supplied merge order. There is no reverse citation from ReductiveGroups, ClassicalGroups or LieHighestWeight to ClassicalGroupsPartII. S01 is an internal construction-range problem and S02 an unstated mathematical input, neither detectable by the coarse roadmap graph.

The separate integer calculation, written during this review, tested: 780 cover/parity inputs; 780 subset-minimum identities; 2,150 flip/degree/cone inputs; 6,150 commuting-flip cases; 4,030 permutation cases; 406,900 superadditivity pairs; 229 support normal forms; 8 exterior boundaries; 4 top-exterior formulas; 10 triangular expansions; 6 primitive dimensions; 30 orbit recurrences; and 341 exterior-basis commutators. Every computed equality passed. The latter calculation explicitly uses κ₃ and κ₄ at g=2, exposing S01's missing range. These finite calculations are evidence, not proofs of the general assertions.

Policy inspection found one import, no options, no admitted data/examples, no process prose or pull-request numbers in the README/docstrings, no computational-algorithm targets, and all own Lean names registered in README. The head diff is seven files, all inside packages/ClassicalGroupsPartII. This pass changed only its requested report and scratch notes/scripts; no package source, Git state, dependency manifest, toolchain or external service was changed.

## Not verifiable

- No Lean process was run, as required by the read-only brief. The worker-supplied elaborated types for all 24 declarations were compared with the source and README; this pass does not claim a fresh elaboration or proof of the three admitted theorems.
- Supplier roadmap targets and the three declared gaps are contracts, not completed formal proofs. Acceptance remains conditional on those named gap contracts. Their absence from the supplier today is not a new finding.
- S02's arbitrary-K density prerequisite has no named owner at the cited supplier section. Its mathematical truth follows from the indicated big-cell route, but its current formal supply cannot be verified.
- Source errata below are based on the available cited editions. No published correction was identified in the inspected material. All three cited texts were legally available; no needs-references request is outstanding.

## Source issues

- **Misprint** in sternberg at §7.9, printed p.131 (sternberg line 5054): the source says the subtracted binomial coefficient has lower index 2j−2; it should be j−2, the contraction target's degree; affects nothing.
- **Misprint** in sternberg at §7.9, printed p.131 (sternberg line 5025): the source says the second highest weight is σ but then uses μ in the Cartan sum; it should be μ consistently, with σ reserved for the representation; affects nothing.
- **Error** in milne at Complement 22.8, printed pp.465–466 (milne lines 19330–19346): the source says every integral weight splits into integral central and fundamental-weight parts; it should be a rational central decomposition, requiring only the total weight to belong to X; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "9aa8ff19c24b6ee30fa183a866df6f7aa3fc3f0d", "job": "RT-ClassicalGroupsPartII~2a", "model": "gpt-6-astra", "worker": "chris-6"} -->
