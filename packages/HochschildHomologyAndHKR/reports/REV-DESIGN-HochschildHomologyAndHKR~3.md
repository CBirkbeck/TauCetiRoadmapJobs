# Review of HochschildHomologyAndHKR (design, round 3)

**Verdict:** needs changes

Three findings: two P2 and one P3. The scope is repairable. The general mathematical targets survive the tests below, but §7.2 duplicates a theorem at the actual Tau Ceti pin, the general Ext supplier contract overstates a specialized equivalence, and two plan Checks still omit qualifications present in the README. This is a design review, not a package elaboration certificate.

## Verification of the previous repairs

I first checked each finding of `packages/HochschildHomologyAndHKR/reports/REV-DESIGN-HochschildHomologyAndHKR~2.md` against the design and `packages/HochschildHomologyAndHKR/reports/FIX-DESIGN-HochschildHomologyAndHKR~3.md`. I then checked the changed passages and searched for the same defects elsewhere. Eight findings are repaired, one is partly repaired, and the remaining disputed style finding needs no change.

| Previous finding | Repaired passage in packages/HochschildHomologyAndHKR/design/README.md | Assessment and computed witness |
| --- | --- | --- |
| R01: native bimodule primitives | Lines 326–351 import the cofaces, coboundary and derivations; line 766 says “the transport of `TauCeti.hochschildBimoduleCoboundary_ofSubsingleton_eq_zero_iff`”. | Repaired. Native δm(a)=am−ma and δf(a,b)=af(b)−f(ab)+f(a)b agree. δE₁₁(E₁₂)=−E₁₂. Cosimplicial packaging and the inner quotient remain distinct work. Baseline hashes now equal the manifest pins. New R01 below is another native duplication, found by object. |
| R02: exterior-power ownership | Lines 1374–1378 say “Prove the comparison needed by §7.4” and identify it with evaluation at the dual module, followed by dual reflexivity. | Repaired. Both maps evaluate to det(f_j(v_i)); the intermediate matrix is its transpose. On R² in degree 2, both give 1; on the swapped basis, both give −1. Native projectivity and the supplier's generic finite-projective theorem are imported. |
| R03: invalid cochain in sign Check | Lines 1188–1191 use “`f(a,b) = a ∂_x b` on `ℤ[x]`”. | Repaired in both files. It is bilinear; at (1,x,1), δf=0 and the wrong brace expression is 2. |
| R04: arity-zero homotopy sign | Lines 1227–1231 say “both sides equal `a ↦ g(a) x − x g(a)`”. | Repaired in both files. For x=E₁₁, g=id, a=E₁₂, both sides are −E₁₂; the discarded sign gives +E₁₂. |
| R05: zero-variable top degree | Lines 1625–1648 use “`g · ⟨∂₁, …, ∂_m⟩`” and put the scalar outside the wedge as well. | Repaired in both files. At m=0, k=Z, g=2, cocycle, class and normalized value are all 2, not 1. |
| R06: dropped coface and empty comparison | Lines 582–585 give “kernel `0`”; lines 1599–1603 give “`ι₀ = id_k`”. | Repaired. Dropping the first coface gives m↦(a↦−ma), so evaluation at 1 forces m=0. At m=0, the positive-degree comparison is 0→B_n(k), not id_k. |
| R07: matrix size zero | Lines 739–742 and 889–890 restrict the trace comparison to “`n ≥ 1`”. | Repaired. At n=1, trace is id_k. At n=0, HH₀=0 and trace is 0→k, not an isomorphism for k=Z. |
| R08: nonzero controls | Lines 1294–1296 specify “`k` a nonzero field”; line 1340 specifies “for `m ≠ 0`”. | Partly repaired. These README statements are correct, but their plan copies omit those qualifications. New R03 records the two remaining witnesses. The zero-ring convention and the characteristic-two qualifications elsewhere are correct. |
| R09: unnecessary flatness in evaluation | Lines 1443–1450 say “for every commutative `k`-algebra `R`, flat or not”. | Repaired, including prerequisites and plan. For Z→F₂[x,y], cup evaluation on ε₂(dx∧dy) is 1; determinant evaluation is 2=0. The factorial identity still holds. |
| R10: capitalization of proper names | Line 1 retains “Hochschild” and “Hochschild–Kostant–Rosenberg”. | Not changed; repair report's dispute upheld. Main's ChevalleyGroups, KacMoody and GrothendieckEulerForms headings preserve mathematical proper names. This is ordinary title text, not process residue. No re-raised finding. |

## R01 (P2) — Import the projective-homology Kronecker theorem already at the pin

**Location.** `packages/HochschildHomologyAndHKR/design/README.md:1348`: “Prove that for every `R`-module `M` and every `i ≤ n`, the Kronecker map … is bijective”. Scope line 51 claims ownership; `packages/HochschildHomologyAndHKR/design/plan.json:1358` names the generic target.

**Claim.** §7.2 plans the general universal-coefficient consequence for a nonnegative complex of projectives with projective homology below the requested degree, including the all-degrees corollary.

**Witness.** `TauCeti/Algebra/Homology/UniversalCoefficient/Basic.lean:212,234` already proves `TauCeti.ChainComplex.kronecker_bijective_of_projective_homology_lt` and `TauCeti.ChainComplex.kronecker_bijective_of_projective_homology`, with exactly these hypotheses, in any linear abelian category.

This is the actual manifest pin `2fd255d997f47c0b5d834ee416c7015d55444ce5`; the file is unmodified. At degree i≤n, j<i implies j<n, so the native theorem applies directly to the README's slightly bundled statement. Its map is the very `TauCeti.ChainComplex.kronecker` already used by §7.1. No new mathematical comparison is concealed in §7.2.

**Exact repair.** Remove the generic owned theorem and its inductive proof route from the targets and scope. Record the two native declarations in scope and exact supplier contracts, and make §7.6 consume them after §7.1's Hochschild identification. Update the plan and local Needs consistently. Do not recreate the generic theorem under a new namespace. Keep subsequent target IDs stable, or give an explicit old-to-new map if renumbering is necessary.

**Repair test.** In `ModuleCat R`, X concentrated in degree zero at R gives M→M, the identity. For R→R with differential id, both sides are 0. For Z→Z with differential 2, H¹(Hom(X,Z))=Z/2 while Hom(H₁(X),Z)=0; the native degree-one hypothesis correctly fails because H₀=Z/2 is not projective. Thus importing the native result preserves exactly the intended boundary and negative controls.

## R02 (P2) — The general Ext contract includes an equivalence requiring zero differentials

**Location.** `packages/HochschildHomologyAndHKR/design/README.md:403` groups `CategoryTheory.ProjectiveResolution.extLinearEquiv` with the description “computing `Ext` from two resolutions related by a chain map over the identity”. §4.4 lists it at line 977; `packages/HochschildHomologyAndHKR/design/plan.json:860` repeats that prerequisite.

**Claim.** The exact contract presents this equivalence as an input to the general bar-resolution comparison HHⁿ(A,M)≅Extⁿ(A,M).

**Witness.** `TauCeti/Algebra/Homology/Ext/ProjectiveResolution.lean:107` requires both adjacent Hom differentials to vanish. For A=k=M=Z, bar d₁=0 and d₂=id; at n=0 its first hypothesis demands id∘id=0, hence 1=0.

The theorem HHⁿ≅Extⁿ is correct. The supplier description is not: this particular equivalence identifies a whole Hom term with positive-degree Ext only after imposing the two zero-differential hypotheses. It does not identify general Hom cohomology with Ext. Nor is the neighboring resolution-change lemma the same construction: `isoExt_hom_comp_homologyMap` concerns the functor-valued Ext API, while §4.4 explicitly chooses `CategoryTheory.Abelian.Ext`.

**Exact repair.** Remove `extLinearEquiv` from the general §4.4 prerequisite and correct its supplier description wherever retained. Use the already named `extMk`, `extMk_surjective`, and `extMk_eq_zero_iff`, with `add_extMk` and `smul_extMk`, to descend from cocycles modulo coboundaries. Alternatively use `CategoryTheory.ProjectiveResolution.extLinearEquivCohomologyClass` from `Mathlib/CategoryTheory/Abelian/Projective/Ext.lean:286`, supplying the identification with this Hom-complex cohomology. A separate invocation of `extLinearEquiv` after §8.2's zero-differential Koszul calculation may keep its actual hypotheses. Do not add zero-differential hypotheses to the general Hochschild theorem.

**Repair test.** For the Z bar resolution, C¹=Z but δ¹=id, so H¹=0=Ext¹_Z(Z,Z); quotienting cocycles gives the correct result. In degree zero both sides are M. For the polynomial Koszul resolution after Hom into R, the adjacent differentials are 0, so the specialized equivalence becomes applicable there.

## R03 (P3) — Propagate two repaired qualifications into the plan Checks

**Location.** `packages/HochschildHomologyAndHKR/design/plan.json:1277`: “For R=k[x]/(x²), flat not smooth … HH₂(R,R)≠0”; line 1341: “δm(x)=m≠0”. README lines 1294 and 1340 already contain the missing qualifications.

**Claim.** These are unconditional negative controls for targets 6.4 and 7.1.

**Witness.** For k=0, R=0 is smooth, HH₂=0, and ε₂:0→0 is surjective. For the stated asymmetric Z[x]-bimodule Z with m=0, both δm(x) and the transposed boundary are 0.

**Exact repair.** Copy the README's nonzero-field condition into target 6.4's dual-number Check. For target 7.1's distinguishing Check, specify m≠0, or fix k=Z and m=1. Preserve the general statements and retain zero values as positive controls. This completes the previous R08 repair rather than narrowing the library.

**Repair test.** At k=Q, R=Q[x]/(x²), Ω²=0 and HH₂ is Q·x≠0, so ε₂ is not onto. At k=Z,m=1 with x acting on the left by 1 and on the right by 0, δm(x)=1 while the transpose of b₁ is 0. At k=0 or m=0 the respective negative distinction disappears, exactly as the amended hypotheses predict.

## Verified sound

### Coverage and principles

Read all 37 numbered targets in all eight layers, their API bullets, Checks and Needs, the complete plan, manifest, previous review and repair report. No maintainer notes were supplied. The adversarial table below covers all targets, combining only the two Yoneda-comparison targets. Repaired passages were recomputed rather than accepted on the repair report's authority. For untouched statements, the previous round's computed rows were used only after comparing their formulas with this head; summary-only claims were not treated as evidence.

The design builds a general arbitrary-base theory, distinguishing classical from derived Hochschild homology, symmetric from arbitrary bimodules, and k-projective from merely smooth algebras. It does not introduce a good-characteristic restriction to avoid the factorial: characteristic two is explicitly retained. It imports DG/A∞ brackets, derived homology and the smooth homological comparison from named owners. R01 is an additional duplicated generic theorem, not grounds to reject the entire roadmap as a re-plan.

No computational algorithm, copied source passage, sorry'd data, `set_option`, local machine path, pull-request narrative or HTML anchor occurs in the design text. Mathematical formulas and small computations are appropriate Checks. The eight layers have Examples and Dependencies. Every definition/construction target has an API and at least three Checks; theorem-only targets need not have three. Each target has a locator and a Needs line. The two false plan Checks are isolated in R03. Proper-name capitalization is not a style defect.

The organization follows the required mathematical dependencies: complexes before normalization and low degrees; bar resolutions before Ext/Tor and Yoneda comparison; sign transport before the cup-class comparison; projective duality and the supplied homological HKR before cohomological HKR; polynomial diagonal and Koszul computations before explicit top degree. No layer is named for a source chapter, and the README does not say it follows a source's exposition. The polynomial calculation does not depend on the smooth-HKR gap.

### Computed adversarial table

Here Z denotes the integers, E_ij the matrix units, and all tensor products use the design's ordered factors. Zero rings and zero coefficient modules give zero maps and zero homology; empty exterior products instead mean the degree-zero scalar module, with determinant and 0! equal to 1. “Retain” below means no repair to that formula, not a claim that finite examples prove the theorem.

| Statement | Instances tried; computed values on each side | Result; change |
| --- | --- | --- |
| 1.1 chains, faces and boundary | A=M=k: b₁=0,b₂=id,b₃=0, hence HH₀=k and HH_{>0}=0. In Mat₂(Z), b(E₁₂⊗E₂₁)=E₁₁−E₂₂; the wrong wrap action gives 0. | Retain. End face and degree-zero convention distinguish the wrong model. |
| 1.2 cofaces and cochains | A=M=k: δ⁰=0,δ¹=id,δ²=0. On Mat₂(Z), δE₁₁(E₁₂)=−E₁₂ and δ²=0; the wrong terminal sign gives 2E₁₂ in degree two. Omitting the first coface gives value −m at 1 and kernel 0, versus central Z for A=M=Z. | Native imports and repaired Check agree. |
| 1.3 functoriality | Z[x]→Z[y]→Z[z], x↦y²,y↦z+1: successive and composite chain maps both send 1⊗x to 1⊗(z+1)². Pullback of ∂_y sends x to 2y. Identity pullback returns the same cochain. | Retain variance and restricted coefficient bimodule. |
| 1.4 exact sequences | A=k, split sequence k→k²→k: HH₀ maps u↦(u,0), (u,v)↦v, connecting maps 0. For A=Z⊕F₂ with square-zero second summand, tensoring multiplication by 2 kills that summand; Hom_Z(A,Z)→Hom_Z(A,F₂) has image dimension 1 in dimension 2. | Retain flat/projective-or-split conditions; they exclude the failures. |
| 1.5 coefficient R-action | On k[x], b(1⊗x⊗1)=x⊗1, equal to coefficient multiplication by x after b(1⊗1⊗1). Multiplying the algebra slot instead gives 1⊗x. For Mat₂(Z), the attempted E₁₁-action gives E₁₁−E₂₂ on one side and E₁₁ on the other. | Correct action retained; commutativity of acting R matters. |
| 2.1 normalized chains | b(m⊗1⊗1)=m⊗1. For A=k all positive reduced terms are 0, matching positive HH=0. For Z[x], b(1⊗x⊗x)=2x⊗x−1⊗x². | Degenerate quotient retains the required relations; no flatness needed. |
| 2.2 normalized cochains | D(1)=2D(1), hence 0; δm(1)=0. For g projecting to constants on Z[x], δg(1,1)=1−1+1=1, while its class is 0 represented by the normalized zero cocycle. A=k leaves only N⁰=M. | Retain; not every cocycle itself is normalized. |
| 3.1 HH₀ | Mat₂(k): off-diagonal units and E₁₁−E₂₂ span the trace kernel, giving k on both quotient and trace sides, also in F₂. At matrix size 0, quotient=0 and claimed comparison target=k. | Repaired n≥1 restriction is necessary. |
| 3.2 HH⁰ | In Mat₂(Z), δ(cI)=0 while δE₁₁(E₁₂)=−E₁₂. Thus HH⁰ consists of scalar matrices; for commutative A it is A. | Native central-cocycle characterization supplies this. |
| 3.3 Der/Inn and section criterion | Z[x]: Der=Z[x]∂, Inn=0. Mat₂(Q): Der and Inn both dimension 3, quotient 0. Inner Lie ad(E₁₁)(E₁₂)=+E₁₂ versus δE₁₁(E₁₂)=−E₁₂. A section a↦(a,D(a)) multiplies correctly iff D(ab)=aD(b)+D(a)b. | Retain adapter and sign; no new derivation carrier. |
| 3.4 HH₁ and differentials | b(1⊗a⊗c)=a⊗c−1⊗ac+c⊗a, exactly the Leibniz relation. Both composites [a⊗b]↔a db are identity. For dual numbers, both modules are R dx/(2x dx): dimension 2 over F₂, 1 over Q. For F_p/Z both are 0. | Retain full generality, including nonflat bases. |
| 3.5 twisted extensions | Dual numbers, f(x,x)=1: t²=(0,1),t³=0. On Z[x] with f supported at (x,x²), δf(x,x,x)=1; triple products are (x³,0) and (x³,1). Gauge m↦m+g(a) into f−δg gives second component f(a,b)+g(ab) on both sides. | Retain associativity iff and minus sign. |
| 3.6 extension classification | A=F₂ over Z: δ¹=id and HH²=0; Z/4→F₂ has no additive section, since every possible lift of 1 has additive order 4. For A=k, HH²=0 and the trivial square-zero extension splits. | Retain the k-split hypothesis and fixed ideal/quotient markings. |
| 4.1 enveloping actions | (E₁₂⊗op E₂₁)E₂₂=E₁₁; reversed action gives 0. For the right tensor action, 1·(E₁₂⊗op E₂₁)=E₂₂; using amb gives E₁₁. | Retain both action conventions. |
| 4.2 bar resolution | At two tensor factors, b′h+hμ gives a₀⊗a₁−1⊗a₀a₁+1⊗a₀a₁=a₀⊗a₁. For Z[x], h(x⊗1)=1⊗x⊗1 versus xh(1⊗1)=x⊗1⊗1. | k-linear contraction; no false Aᵉ-linear contraction. |
| 4.3 Hom from bar | Evaluating φb′ at 1⊗a⊗b⊗1 gives af(b)−f(ab)+f(a)b on both sides. At degree zero it gives am−ma. | Retain unsigned precomposition. |
| 4.4 Ext comparison | A=k=M=Z: Hom terms are Z, δ¹=id; H¹=0=Ext¹. But the extra equivalence's h₁ at n=0 would require id∘id=0, evaluated as 1=0. | Main comparison true; R02 repairs the contract. |
| 4.5 Tor comparison | m⊗(a₀,…,a_{n+1}) maps to a_{n+1}ma₀⊗(a₁,…,a_n); the two end faces are m′a₁ and (−1)^n a_nm′, as in b. A=k gives Tor₀=M and Tor_{>0}=0, matching HH. | Retain the right module action and k-projective resolution hypothesis. |
| 5.1 cup product | On Z[x,y], (∂_x∪∂_y)(x,y)=1, reverse=0. Wrong multiplication order in Mat₂(Z) gives Leibniz defect E₁₁−E₂₂. Degree-zero multiplication gives E₁₂E₂₁=E₁₁, not E₂₂. | Retain ordered multiplication; cochains need not commute. |
| 5.2 Leibniz and cohomology algebra | For p=q=1, both sides expand to af(b)g(c)−f(ab)g(c)+f(a)g(bc)−f(a)g(b)c. For two derivations the expansion is 0. Unit cochain multiplies to f on both sides. | Retain. |
| 5.3–5.4 Yoneda and strict lifts | At p=q=1, f=∂_x,g=∂_y on (1,x,y,1), strict lifted composition=−1 and cup=1; factor (−1)^{pq}=−1 reconciles them. At q=0 the pinned `extMk_comp_mk₀` gives sign 1; degree (0,0) gives multiplication xy. | Strict-lift factor verified; unrestricted shift sign s(p,q) is still a target, not a computed closed formula. |
| 6.1 suspension dictionary | Arity 0: bracket on E₁₁,E₁₂ is +E₁₂ versus δ=−E₁₂. Arity 1: [m,Θf]=Θδf. Arity 2: [m,Θf]=−Θδf; for f(a,b)=a∂b at (1,x,1), correct value=0, wrong brace value=2. Positive suspended cohomology in degree 0 has dimension 3 for Mat₂(Q), whereas HH¹=0. | Retain arity restrictions and signs; full arity-zero carrier belongs to DGAInfinity. |
| 6.2 homotopy and graded commutativity | f=g=∂ at (x,x): cup sum=2 and −δ(∂²)=2; printed source alternative gives −2. At p=0,q=1 with matrix witness, both sides=−E₁₂. The Hasse derivative gives −δ(∂^{[2]})(x,x)=1=(∂∪∂)(x,x), even in F₂. | Repaired Check correct; square-zero class does not require dividing by 2. |
| 6.3 flat classical/derived comparison | A=k: HH₀=k and higher groups 0 on both sides. F_p/Z: classical b₂=id and HH₂=0, whereas supplied derived HH₂=F_p. | Retain flatness exactly on derived comparison. |
| 6.4 antisymmetrization and projection | ε₂(dx∧dy)=[1⊗x⊗y−1⊗y⊗x]; πε₂=2dx∧dy, which is 0 in F₂, while cup evaluation is 1. For k=0 dual numbers give HH₂=Ω²=0 and ε₂ onto. | Classical identity retained; R03 fixes negative control; smooth isomorphism is a declared gap. |
| 7.1 cochain-chain duality | Symmetric coefficients: h₁(∂)([1⊗x])=1. For Z[x] acting on Z with left x=1,right x=0, δm(x)=m versus transpose b₁=0. At m=1 these are 1 and 0; at m=0 both 0. | Symmetry is correctly assumed; R03 qualifies the Check. |
| 7.2 projective-homology Kronecker map | Z --2--> Z: H¹(Hom)=Z/2 versus Hom(H₁,Z)=0. For R --id--> R both sides=0; X=R in degree 0 gives M on both sides with identity map. | True and already native; R01 imports it. |
| 7.3 exterior duality adapter | P=R²,n=2: identity matrix gives 1 on both maps; swapping basis gives −1 on both. P=0,n=0 gives id_R; P=0,n>0 gives 0→0. A sum of s decomposable 2-forms has rank ≤2s, unlike the infinite block symplectic form. | Retain transpose/reflexivity adapter and finite-projective hypothesis. |
| 7.4 polyvectors | R=k[x,y]: ranks T⁰,T¹,T²,T³ are 1,2,1,0, equal to dual differential ranks. Purely inseparable F₂(u)[a]/(a²−u): Der has rank 1, hence T²=0. | Retain; latter distinguishes later HH² without smoothness. |
| 7.5 determinant and factorial | On (x,y), cup ε₂=1−0=1 and determinant ε₂=1−(−1)=2. For Z→F₂[x,y] these are 1 and 0, still 2·1=0. At n=0 both evaluations return r₀; at n=1 both return r₀D(r₁). | Retain without flatness; normalization only when n! is a unit. |
| 7.6 cohomological HKR | For F₂[x,y], Ψ₂ pairs to 1, whereas determinant class=2Ψ₂=0. For inseparable F₂(u)[a]/(a²−u), HH²=R/(2a)=R while T²=0. For Z[1/2]/Z, positive HH and Der are both 0 although the algebra is not Z-projective. | Retain arbitrary characteristic and the stated proof hypotheses; no invalid converse claimed. Redirect native input by R01. |
| 8.1 polynomial diagonal | m=0: diagonal kernel=0. For one variable, X−Y is monic, so (X−Y)f=0 forces all coefficients of f to be 0 even over Z/4. For Q[x]/(x²), (x−y)(x+y)=0 with x+y≠0. | Retain general-base regular sequence, exclude the nonpolynomial control. |
| 8.2 Koszul bimodule resolution | d(e₁∧e₂)=t₁e₂−t₂e₁, so d²=t₁t₂−t₂t₁=0. Tensoring or Hom into the diagonal sets all t_i=0, leaving differential 0. m=0 leaves just k. | Retain imported Koszul construction. |
| 8.3 signed comparison | Degree 2 sends e₁∧e₂ to the difference of the two bar tensors; applying b′ gives t₁ι(e₂)−t₂ι(e₁). The unsigned variant has a defect with coefficient 2 over Z, zero in F₂. At m=0, ι₀=id_k, higher maps 0→B_n(k). | Repaired empty case and characteristic qualification correct. |
| 8.4 polynomial bases | Pairing ordered coordinate wedges with derivation wedges gives δ_{IJ}. For m=1, HH₀=HH₁=R and higher groups=0, likewise cohomology; for m=0 only degree zero k remains. | Retain basis and degree bounds. |
| 8.5 Jacobian/top degree | m=0,k=Z,g=2: all three values=2. For m=2 on (X₁²,X₂), determinant=2X₁ and normalized representative=gX₁ when 2 is a unit. In F₃ with m=3, determinant class has factor 6=0 while the coordinate cup class pairs to 1. | Repaired scalar placement; factorial restriction genuine. |

Additional sign check: direct formal expansion of §6.2 for all 25 pairs 0≤p,q≤4 leaves the same two cup terms on each side and difference 0 in every case. This uses noncommuting words and formal multilinear cochains, not numerical commutativity. It supplements the explicit matrix and derivative witnesses; it is not an elaboration or a proof of all arities. At p=q=0, insertion is zero and the degree −1 term is interpreted as zero.

### Source sample and locator checks

All nine cited works have one manifest entry. Read AV20, Ginz05, HKR62 and StacksSmooth from the supplied legal cached extractions. Loday98, Ger63, Weibel94, CE56 and Mat86 remain settled uncertified, and were not requested again. No new source or manifest edit was necessary. There are no additional author-flagged unverified locators requiring a new fetch. A readable alternative below does not certify the unread books' theorem numbers.

| Seeded target | Text opened and locator assessment |
| --- | --- |
| 1.1 simplicial chains | Ginz05 §5.1, printed p.20, lines 973–976 gives the Hochschild boundary with the correct two end actions. The source's field setting is not a proof of arbitrary-base simplicial packaging; that extension follows from the explicitly stated face identities and native alternating-face construction. Loday98 §1.1, Weibel94 §9.1 and CE56 IX remain uncertified. |
| 1.3 functoriality | Cited Loday98 §1.1 and Weibel94 §9.1 cannot be read under the settled statuses. Variance and maps were checked directly in the table. No source theorem-number certification is claimed. |
| 1.5 commutative action | Ginz05 printed p.45, lines 2161–2166 gives the central coefficient action on chains/homology. It supports the chosen action. Cochain linearity is checked by the same commuting actions, not falsely attributed to an explicit theorem in this paragraph. |
| 2.2 normalized cochains | Ginz05 §5.7, printed p.24, lines 1120–1128 gives the reduced cochains in its field setting. The README expressly says “over a field”; arbitrary-ring homotopy equivalence uses Dold–Kan in the opposite abelian category. Loday98 §§1.1,1.5 uncertified. |
| 3.2 HH⁰ | Ginz05 printed p.22, lines 1066–1069 identifies degree-zero cohomology with central elements. Native cocycle characterization confirms the arbitrary-ring formula. |
| 3.3 derivations and HH¹ | Ginz05 §3.1, printed pp.8–9, lines 398–411 and §5.4, printed p.23, lines 1075–1085 give derivations, inner quotient and the exact sequence. Its inner derivation convention has the opposite sign but the same image; the README explicitly distinguishes it from the pinned Lie convention. A source-domain misprint is recorded below. |
| 3.4 HH₁ | Ginz05 §8.1, printed pp.40–41, lines 1914–1926 gives the quotient presentation by differential relations. No smoothness is used in this presentation. The direct inverse construction supports the README's nonflat version. |
| 4.2 bar resolution | Ginz05 §4.2, printed pp.16–17, lines 747–782 gives the bar boundary and inserting-unit contraction over a field. HKR62 printed pp.392–393, lines 414–447 gives projectivity under base-projectivity and the right-linear contraction for commutative algebras. The stated noncommutative arbitrary-base version combines these algebraic formulas with native tensor projectivity; no field-only freeness is silently imported. |
| 4.3 Hom(bar,M) | Ginz05 §5.2, printed p.22, lines 1033–1062 gives evaluation on the unit outer factors and the coboundary; HKR62 printed p.389, lines 284–298 gives the same presentation in its commutative setting. The extracted middle-sign display is defective; the subsequent explicit coboundary and pinned declaration fix the convention. |
| 4.4 Ext | Ginz05 §5.2, printed p.21, lines 984–988 identifies Ext as Hochschild cohomology in the field setting. HKR62 printed pp.390–391, lines 337–351 identifies the degree-one derivation class in its setting; it is not by itself the general all-degree arbitrary-bimodule theorem. The bar projectivity route supports that generalization. R02 concerns the native contract, not these mathematical conclusions. |
| 5.1 cup | Ginz05 §6.6, printed p.29, lines 1335–1350 gives ordered cup multiplication and descent; HKR62 printed p.394, lines 479–484 gives the product induced by the bar diagonal. Both support the formula. Loday98 §1.5 and Ger63 §7 uncertified. |
| 6.1 degree-zero-algebra dictionary | Ginz05 §6.6, Theorem 6.6.1 and construction, printed pp.29–30, lines 1351–1375 supports insertion and bracket. The suspension dictionary is a calculation against DGAInfinity and the pinned Koszul convention, not a quoted theorem in Ginz05. The extraction's index/regrading slips are recorded below. |
| 6.2 homotopy | Ginz05 equation (6.6.3), printed p.29, line 1368 has the sign defect explicitly rejected by the README. Proposition 6.6.4, printed p.30, lines 1379–1380 asserts the cohomological Gerstenhaber conclusion. The repaired formula was independently expanded as above; Ger63 §7 remains uncertified. |
| 7.2 projective homology | HKR62 Lemma 4.1, printed pp.389–390, lines 301–330 uses projective homology and splittings in its special resolution setting. AV20 Proposition 1.2, printed p.2, lines 70–74 gives formality for complexes with projective homology, not the exact truncated Kronecker statement. The desired general statement is already native: R01. |
| 7.3 exterior duality | HKR62 printed p.395, lines 531–535 invokes the finite-projective retract argument for exterior duality. The algebraic argument is applicable beyond the paper's perfect-field smooth application. Here the generic comparison is now imported from the named supplier, and only the transpose/reflexivity identification is owned. |

Also checked the headline route: HKR62 Theorem 5.1 at line 522 and Theorem 5.2 at line 548, printed p.395, are distinguished from the arbitrary-base target; the latter uses regular affine algebras over a perfect field. The Koszul calculation inside its Theorem 3.1 proof, lines 268–279, supports the polynomial resolution route without importing the narrower theorem as an arbitrary-base assertion. AV20 lines 237–243, printed p.5, supports the factorial composite. StacksSmooth Definition 137.1 (Tag 00T2), line 16920, and Proposition 138.13 (Tag 00TN), line 17399, support the smoothness/formal-smoothness background. None replaces the declared contract identifying the integral smooth HKR map itself.

### Pinned declarations and ownership evidence

Manifest pins read: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The plan now records these hashes. Searches were by objects and operations, not just proposed names, over both libraries, main roadmaps, board packages and the supplied open-head inventory. The board package index was read before excluding other owners. The `roadmaps grep`, `roadmaps show`, supplied citation resolution and overlap results were used as leads and checked in the cited text.

The following are representative opened declarations that determine the mathematical contracts, with exact pin-relative locations. Namespace matches were distinguished from unrelated declarations having the same final component.

| Object | Pinned evidence and actual scope |
| --- | --- |
| Bimodule coboundary | `TauCeti/RingTheory/HochschildCohomology/Coboundary.lean:226,282,303,318,329,345,351,359,371,382,396`: cofaces, commuting-coface identity, differential, square zero, degrees zero and one, derivation cocycles. The commuting left/right action is required where used. |
| Bimodule derivations | `TauCeti/RingTheory/Derivation/Bimodule.lean:41,84,89,101`: linear map with D(1)=0 and Leibniz, including scalar vanishing; no module structure on the carrier is supplied. The submodule/quotient adapters are new. |
| Existing different-coefficient complex | `TauCeti/RingTheory/HochschildCohomology/Complex.lean:137` and `Dual.lean:138`: existing complex corresponds to coefficients Hom_k(A,M), through curry-first, not arbitrary bimodule M. It does not erase the need for §1.2. |
| Existing normalized chains | `TauCeti/RingTheory/CyclicCohomology/Normalized/Chains.lean:53,69`: quotient of tensors of A by a unit in a noninitial slot. Coefficients are A; §2.1 retains arbitrary M and states the overlap. |
| Dold–Kan | `Mathlib/AlgebraicTopology/DoldKan/HomotopyEquivalence.lean:81` is the homotopy equivalence from normalized Moore to alternating faces in any abelian category. `Degeneracies.lean:148,180` identifies maps killing degeneracies; `AlternatingFaceMapComplex.lean:305` uses the same alternating coface signs. No field hypothesis. |
| Balanced tensors | `TauCeti/LinearAlgebra/TensorProduct/Balanced/Basic.lean:55,92,147`, `Unit.lean:48,122`, `OuterFactors.lean:88`: underived quotient, generators, induction, unit equivalences and outer-factor rearrangement. The underived construction is not Tor. |
| Ext computation | `Mathlib/CategoryTheory/Abelian/Projective/Ext.lean:139,154,188,209,224,234,286`: extMk, additivity, scalar compatibility, coboundary kernel, surjectivity, composition with degree zero, and linear cohomology-class equivalence. `TauCeti/Algebra/Homology/Ext/ProjectiveResolution.lean:107` has the extra hypotheses of R02. |
| Ext carriers and composition | `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118,128` defines `CategoryTheory.Abelian.Ext` and composition by shifted morphisms. `Mathlib/CategoryTheory/Abelian/Ext.lean:41` defines the different functor-valued Ext; its projective-resolution isomorphism must not be silently substituted for the former API. |
| Hom and derived functors | `Mathlib/CategoryTheory/Abelian/Ext.lean:56` uses precomposition in `ChainComplex.linearYonedaObj`; `Mathlib/CategoryTheory/Abelian/LeftDerived.lean:105` supplies `Functor.leftDerived`. |
| Kronecker | `TauCeti/Algebra/Homology/Kronecker.lean:106,113,124,274`: map, evaluation, naturality and split-cycle surjectivity. `UniversalCoefficient/Basic.lean:121,180,212,234`: Ext term, exactness and both generic bijectivity theorems. The last two are the duplicate in R01. |
| Exterior powers | `Mathlib/LinearAlgebra/ExteriorPower/Pairing.lean:64,71` defines pairingDual and its determinant value; `Basis.lean:29,182` gives finiteness and the finite-free comparison. `TauCeti/LinearAlgebra/ExteriorPower/Basic.lean:145` supplies projectivity without finiteness. |
| Dual reflexivity | `Mathlib/LinearAlgebra/Dual/Lemmas.lean:141,145,262` supplies dual projectivity, finiteness and reflexivity for finite projectives; `Dual/Defs.lean:216` supplies evalEquiv. This supports the repaired §7.3 adapter. |
| Smoothness | `Mathlib/RingTheory/Smooth/Basic.lean:70,71,539`: formal smoothness, its projective differential field, and Smooth; `Smooth/Flat.lean:57`: smooth implies flat. Smooth does not supply projectivity of the algebra over its base. |
| Suspended positive arities | `TauCeti/LinearAlgebra/TensorCoalgebra/Basic.lean:65` uses positive-length words. `Brace.lean:94,160,330,340,354` defines braces/bracket and their identities. `TauCeti/Algebra/Homology/AInfinity/Algebra/Hochschild/Basic.lean:75,86,166,183` gives differential and sign identities. |
| Positive cochain objects | In that Hochschild directory, `Complex.lean:49,87,103`, `Cohomology.lean:80,197,213,228`, `Normalized.lean:311`: homogeneous positive-arity cochains, complex, bracket, cohomology, induced bracket and normalized submodule. No arity-zero cochains or cup product are supplied by these objects. |
| Suspension | `TauCeti/Algebra/Homology/AInfinity/Coderivation.lean:74` and `TauCeti/LinearAlgebra/Graded/Shift.lean:299,369` fix IsSuspension/suspend/suspExp; `TauCeti/Algebra/Homology/AInfinity/Algebra/DG.lean:143` supplies the DG conversion. On degree-zero inputs suspExp=0; a length-n input on sA has degree −n, so output degree −1 requires map degree n−1. |

No backticked identifier presented in this README as an already declared local Lean API was found: symbols such as C, HH and Ψ denote mathematical targets; concrete backticked library/supplier identifiers were resolved as such. The plan's proposed `HochschildHKR.*` names are design metadata, not declarations in a nonexistent acceptance file. The citation tool's single unresolved lead, `TauCeti.StarkSystems.toExteriorBidual`, resolves to the explicitly named IntegralIwasawaTheory §12.6 supplier, not to a pinned-library claim.

### Cross-roadmap citations, overlaps and supplier order

Resolved all named suppliers at main or the supplied open heads. Main suppliers are not replaced by proposed revisions. Open PR numbers appear here solely to identify independently reviewed ownership evidence, not in the design.

| Citation | Resolved text and ownership |
| --- | --- |
| DGAInfinity conventions and Layers 0,1,8 | `TauCetiRoadmap/DGAInfinity/README.md:70,263,293,520`: cohomological suspension/tensor signs; graded calculus and braces; DG algebras; full Hochschild chains/cochains, normalization, cup and bracket. The positive native part is distinguished from its planned arity-zero extension. |
| DerivedModuleAlgebra §0.K.1 | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:649` and the construction at 661–672: finite-sequence Koszul complex, differential and regular-sequence resolution. §8.2 specializes it to the polynomial diagonal, rather than owning a second general Koszul complex. |
| EulerSystemsAndKolyvaginSystems §6.1 | Open #1272, `TauCetiRoadmap/EulerSystemsAndKolyvaginSystems/README.md:3942,3954`: exterior-bidual evaluation is an isomorphism for every finite projective X. The generic quantifier, not only the Selmer application, is used. |
| IntegralIwasawaTheory §12.6 | Open #1306, `TauCetiRoadmap/IntegralIwasawaTheory/README.md:1845`: shared exterior-bidual core with evaluation by the determinant. The identifier absent from the libraries is defined in this planned supplier. |
| KTheoryFiniteLocalFields §4.0 | Open #1281, `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:638,650`: derived Hochschild/cyclic foundations and smooth homological HKR; the latter does not specify the integral map ε. |
| RefinedTraceMethods §§1.1,1.9,1.10 | Open #1493, `TauCetiRoadmap/RefinedTraceMethods/README.md:83,110,403,444`: flat cyclic-bar/derived comparison, antisymmetrization with factorial projection, degree-one inverse and nonflat derived filtration. The F_p/Z example has derived HH_{2n}=F_p. These are earlier supplier objects, not targets owned here. |
| DerivedDeRhamCohomology Layer 2 | Open #868, `TauCetiRoadmap/DerivedDeRhamCohomology/README.md:3039`: forms, wedge, differential and their construction. This roadmap uses forms/exterior powers but does not promise to reconstruct the de Rham differential. |
| Other scope boundaries | `TauCetiRoadmap/BanachAlgebras/README.md:1379,1381` owns bounded cochains and boundedly split extensions; `TauCetiRoadmap/NoncommutativeGeometry/README.md:479,582` owns its scalar/continuous cyclic theory; `TauCetiRoadmap/ZigzagPreprojective/README.md:1047` owns the specialized bigraded comparisons; open #1202, `TauCetiRoadmap/LanglandsParameterStacks/README.md:524` owns Hochschild operators on syntomic charts. None is a second owner of the arbitrary-bimodule algebraic construction here. |
| Closest open roadmap | Open #2037, `TauCetiRoadmap/CyclicHomologyLieHomologyAndQuasiFreeAlgebras/README.md:33` scope and §4.1 at 630: quasi-free algebras/noncommutative forms and associated cyclic theory. Its ownership differs from this roadmap's general bimodule cohomology and cohomological HKR. RefinedTraceMethods is the other closest head and is resolved above. |

The supplied overlaps report lists no conflicting head changing this roadmap, no dropped cited IDs, and no IDs defined only by an open revision. The head texts above support the stated ownership split. No relevant duplicate owner was found in the board package index. R01 concerns a library theorem; it requires no new roadmap edge. R02 concerns a library hypothesis, not an upward citation.

The declared `smooth-hkr-antisymmetrisation` gap is precise and minimal: every commutative k, smooth commutative k-algebra A, every n, and specifically ε_n being an isomorphism identified with the existing smooth comparison. README lines 474–479 and the plan's top-level gap use the same slug and RefinedTraceMethods §1.9 owner. The factorial identity or an unnamed isomorphism does not supply this integral identification. It is not an unowned prerequisite or a finding. This needs-changes verdict does not yet register conditional acceptance.

Latest dependency check output:

```text
candidate: HochschildHomologyAndHKR is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
depcheck: 229 roadmaps, 2060 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Read every Needs line as well as the mechanical result. Local dependencies proceed from definitions to comparisons; the gap feeds §§6.4 and 7.6, not the independent polynomial resolution. No prohibited supplier is consumed.

### Headline inventory and Lean preflight

The README's headline results are: normalization over arbitrary k; HH₀, HH⁰, HH¹ and commutative HH₁ identifications; HH² classification of k-split square-zero extensions; bar-resolution Ext/Tor comparisons for k-projective algebras; cup/Yoneda comparison; the suspension dictionary and Gerstenhaber homotopy/graded commutativity; classical antisymmetrization and its supplied smooth comparison; smooth k-projective cohomological HKR as a graded algebra isomorphism, its determinant-factorial identity and normalized form; polynomial bases and the top-degree Jacobian formula.

There is no `Suggested.lean` at this design stage. Thus there are zero sorried declarations to probe, zero declaration binders to audit, and no import/header or sorry-warning outcome to certify. Elaboration: **not available (this lane does not elaborate; say so in the report)**. No Lean command was run. No accepted-package claim is made.

At package time the ordinary cochain carrier, native coboundary, module homology, derivations and exterior powers permit small real definitions for cohomological headline statements; their absence cannot be justified merely by saying “HH is not yet named”. The full arity-zero suspended comparison and the derived supplier comparisons require their missing constructions to be identified individually in the module docstring if they remain unstatable. The general theorem of §7.2 would be one-native-lemma padding and must not become a new sorried acceptance theorem. No blanket “nothing is statable” conclusion is supported by these pins.

## Not verifiable

- Loday98, Ger63, Weibel94, CE56 and Mat86: settled uncertified texts. Their theorem/page locators cannot be certified from unread text. They were not refetched or added to a missing-source request.
- Lean elaboration, `#check` binder inspection and executable one-tactic probes: not available in this lane; no `Suggested.lean` exists in this design. Source inspection is not substituted for a successful build.
- The unrestricted closed shift-sign formula s(p,q) for the derived-category Yoneda composition is not given by the design and was not certified here. The q=0 native case and the strict-lift factor were checked; determining s(p,q) is explicitly target 5.3, so this is not an unowned unnamed promise.
- Ginz05's extracted §5.2 middle-term display omits signs. The following coboundary formula and the native differential settle the mathematics, but the typeset display was not compared with the extraction, so no new print erratum is asserted for that display.
- The declared integral smooth ε-isomorphism is a future supplier contract, not an existing proved declaration checked in this review.

## Source issues

- **Misprint** in Ginz05 at §3.1, printed p.9, line 404: the source says an inner derivation attached to a bimodule element has domain and codomain M; it should be a map A→M; affects a stated result.
- **Misprint** in Ginz05 at equation (6.6.2), printed p.29, line 1363: the source says the inserted q-cochain receives arguments through index i+q; it should end at i+q−1, giving exactly q arguments; affects a stated result.
- **Misprint** in Ginz05 at §6.6 after equation (6.6.2), printed p.29, line 1364: the source says the shifted degree-p component is C^{p−1}; it should be C^{p+1}, so arity n has degree n−1; affects a stated result.
- **Error** in Ginz05 at equation (6.6.3), printed p.29, line 1368: the source says its displayed coboundary expression equals the graded cup commutator; it should use signs compatible with the stated Hochschild differential, as in design §6.2; affects a stated result.
- **Misprint** in Ginz05 at §9.2, printed p.45, lines 2147–2148: the source says antisymmetrization vanishes for commutative algebras with symmetric coefficients; it should say the Lie boundary vanishes; affects the proof.
- **Error** in Ginz05 at §9.2, printed p.45, lines 2148–2150: the source says antisymmetrization sends all Lie chains to Hochschild cycles in general; it should restrict to Lie cycles, or to the commutative symmetric case; affects the proof.
