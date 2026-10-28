<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1396#issuecomment-6400624273 -->
Red team round 2 pass a (codex) of 4a93d8c

Verdict: needs_changes

1. **F01** (P3) The new representative is consumed before its construction

   **Location:** `packages/EllAdicHomotopyTypesAndWeights/README.md:498`: “§4.1a for the finite-component representative.”

   **Claim:** Layer 4 is in build order: §4.1 realizes the localized algebra using the representative that §4.1a subsequently constructs.

   **Witness:** README:486 uses A_ℓ,fin from §4.1a. The latter starts at :507 and refers back to “the countable field-of-definition model X₁ of §4.1” at :509. The new construction therefore introduces a forward prerequisite.

   **Exact repair text:** In §4.1 replace “Use the finite-component representative A_ℓ,fin(X) of §4.1a to represent the same localized object A_ℓ(X)” by “Let A_ℓ(X) be the image of A_ℓ,rig(X) in the localization of commutative DG algebras at quasi-isomorphisms.” Delete “§4.1a for the finite-component representative” from its Needs line. In §4.1a retain the comparison and append: “Consequently A_ℓ,fin(X) is another representative of the localized object constructed in §4.1.” All later uses of the finite representative remain after §4.1a.

   **Repair test:** For a point both representatives have H⁰=ℚ_ℓ and [γ₂]=1/2. For two points both have H⁰=ℚ_ℓ². The raw construction establishes those values using §3.5 before the finite comparison is invoked; the repaired dependency chain is §3.5→§4.1→§4.1a→§4.2. No supplier or merge-order change is needed.

2. **F02** (P3) Two pro-form Checks repeat the asserted functor laws

   **Location:** `packages/EllAdicHomotopyTypesAndWeights/README.md:387–388`: “For X_α=X with identity transitions …”; “Replacing a tower by its even-indexed cofinal subtower preserves the output.”

   **Claim:** These provide discriminating tests for the pro-form construction.

   **Witness:** README:375 already asserts invariance under cofinal reindexing. The constant and even-subtower assertions supply no specified nonzero object, transition or value; both also hold for the constant-zero construction. README:389 supplies the actual point computation.

   **Exact repair text:** Replace these two bullets by: “For the map from two discrete points to one point, pullback on Ω_n⁰ is Rγ_n→R²γ_n, a↦(a,a); for R=𝔽₃ it sends 1 to (1,1), not to (0,0).” Keep the point and noncommuting-limit bullets. This gives three discriminating Checks for the definition.

   **Repair test:** The correct pullback preserves the unit and takes 1 to (1,1). A zero map takes it to (0,0), and the covariant summation map has the opposite domain. The existing point calculation remains Rγ_n≠0 for R=𝔽₃; the existing limit calculation distinguishes infinite from finite support.

3. **F03** (P3) Finite-dimensional H² unnecessarily restricts the general Lie-tower construction

   **Location:** `packages/EllAdicHomotopyTypesAndWeights/README.md:846`: “with finite-dimensional H¹ and H²”.

   **Claim:** The general finite-stage 1-minimal/Lie construction is stated only for algebras with finite-dimensional H², although its source and proof need only finite-dimensional H¹.

   **Witness:** Morgan's finite degree-one Hirsch series requires finite-dimensional H¹ (morgan line 1175). For A=K⊕⊕_(j≥0)Ke_j, |e_j|=2, d=0, and all positive products zero, H² is infinite-dimensional but M^(1)=K and every Lie stage is zero.

   **Exact repair text:** Replace “with finite-dimensional H¹ and H²” by “with finite-dimensional H¹”, and “H¹,H² finite-dimensional” by “H¹ finite-dimensional”. Add to the proof: “Each finite degree-one stage has finite-dimensional H², so the kernel of its map to H²(A) is finite-dimensional regardless of the dimension of H²(A). Adjoining generators for this kernel therefore preserves finite stages.” Add the square-zero algebra in the witness as a Check. Keep finite-dimensional H²(X) where it is used for the geometric relation-space theorem.

   **Repair test:** On the displayed algebra, H⁰=K, H¹=0 and H²=K^(ℕ). The map K→A is an H¹ isomorphism 0→0 and an H² injection 0→K^(ℕ); the dual Lie tower is identically 0. More generally, the induction uses a subspace of each finite stage's H², so the same construction works without a dimension bound on its codomain. This is a demonstrated unnecessary hypothesis, not a search for weaker geometric hypotheses.

## Round-one finding verification

The two reviews reuse F01–F03; the prefixes below identify the review. All quotes in this section are from the reviewed package, not source text. A repaired supplier contract remains conditional on delivery; its present absence is not re-raised.

| Earlier finding | Status and repaired passage | Recomputed witness |
|---|---|---|
| r1a/F01: raw rigid discrete continuity | Repaired. README:529: “On Ω(Et_rig,ℤ/ℓʳ) and A_ℓ,rig(X) assert the induced algebraic action … without discrete continuity.” README:509 supplies A_ℓ,fin→A_ℓ,rig; README:91 and the plan declare finite-component-etale-presentation. | Raw indicators on Frobenius orbits of lengths 2ʲ still have stabilizer contained in ⋂2ʲℤ̂, containing no open Nℤ̂. The finite 2-cycle/3-cycle control gives 6ℤ̂, index 6. A finite-component stage and finite skeletal width provide finitely many data. The new order dependency is examined separately below. |
| r1a/F02: unowned ordinary weight bounds | Repaired as a declared contract. README:123: “Gr_w^W Hⁱ=0 for w<0 or w>2i, including when X is neither smooth nor proper”. The same slug and needs sentence occur in the plan. README:582,886 consume it explicitly. | For nodal proper rational C times 𝔾_m over 𝔽̄₂, H¹ weights are 0,2; H² has two weight-2 lines. Thus 0≤2≤4; the example is neither smooth nor proper. The repair report's supplier-delivery reservation remains settled. |
| r1a/F03: localization owner | Repaired. README:155: “apply Mathlib’s localization to the morphism property of inducing cohomology isomorphisms in every degree”. README:41,157 give the pinned names and file. | Identity on K induces 1; a↦2a on Λ_K(a₁) induces 2, invertible with inverse 1/2. The generic localization has no finite-dimensionality condition. |
| r1a/F04: redundant and zero controls | Repaired for all six cited locations. README:32: “[A,B]=−C of weight −4”; :202: “Over 𝔽₃, tγ₂=0 although γ₃≠0”; :472: “10/120=1/12”; :763: “b∉M₀”. The old repeated limit-order and unqualified nonzero-Tor bullets are absent. | dc(A,B)=1=−c(−C); −2−2=−4. 3γ₃=0 mod 3 while γ₃ is a nonzero basis vector. 10/120=(1/2!)(1/3!). The swap sends a outside Λ(a). The retained two-term complex has Tor₁(ℤ/ℓ,𝔽_ℓ)=𝔽_ℓ, whereas the zero complex has Tor₁(0,𝔽_ℓ)=0. |
| r1b/F01: unsupported Sullivan interface | Repaired as declared contracts. README:59: “Use §AT2.4’s rational-minimal-model direction G3 only through the following five contracts.” README:61,63,67 now specify simplex forms, Hirsch maps, indecomposables, interval homotopies and lifts. | The ordered algebra K[v₂]⊗Λ(u₁), du=v, is Sullivan but not minimal: d[u]=[v]≠0. Λ(a,b,c), dc=ab is minimal: d[c]=0 modulo decomposables. Endpoint dt values are both 0; e↦a and e↦2a induce unequal H¹ maps 1 and 2. The repair correctly avoids requiring decomposable differentials for every Sullivan algebra. Supplier delivery remains settled. |
| r1b/F02: weakened Frobenius quantifiers | Repaired. README:597: “for every closed point s … and every geometric Frobenius lift σ … are algebraic integers”. | ℙ¹ spectra (1,2) and (1,3) are integral; both yield total W₀ rank 1 and W₂ rank 2. Inverse spectra contain 1/2 or 1/3 and weight −2. Poids Théorème 14, poids line 198, supports the stronger quantifiers. |
| r1b/F03: alleged global isomorphism misprint | Repaired. README:344: “an isomorphism onto this bounded-degree subalgebra in each t-degree n”; :353 ends after “image”. | On Δ¹ the degree-zero image is K·1; x₁ has barycentric degree 1 and is absent. This agrees with the bounded-image identification at weil-II line 3691. No global-surjectivity error is attributed to that passage in this review. |

## Verified sound

Read all 1,010 README lines and all 53 Suggested.lean lines. The following table records all 37 numbered targets and all 128 target Check bullets, plus the five convention Checks and six bold worked-example blocks. “Retain” means these computed instances do not refute the statement; it does not claim a proof of a future theorem. Findings concern build order, Check discrimination and the unnecessary hypothesis, rather than a refuted headline theorem.

### Declarations, context, headline coverage and padding

| File / context | Declaration inventory | Computed or structural result |
|---|---|---|
| packages/EllAdicHomotopyTypesAndWeights/Suggested.lean:1–53 | 0 declarations; 0 variables; 0 instances; 0 local universe declarations. One import Mathlib and namespace TauCetiRoadmap.EllAdicHomotopyTypesAndWeights. | There are no elaborated binders to compare, admitted data, stand-ins, one-tactic padding, duplicated fully qualified names or missing declaration docstrings. The required list of package #check signatures is empty. No Lean was run. |

The headline inventory is: coefficient homotopy (2.2); triangular integral comparison (2.3); rational stabilized comparison (2.5); pro-simplicial universal coefficients (3.3); completed comparison (3.4); homotopy-algebra cohomology (3.5); étale realization (4.1); finite/raw comparison (4.1a); complex comparison (4.4); geometric and Frobenius–Hodge comparison (5.1–5.2); stable representatives (6.2); eigenvalue products (6.4); common filtration (6.6); pro-unipotent splitting (7.2); rational grading (7.3); conjugacy (7.4); arbitrary-base ℓ-adic grading (8.1); proper smooth formality (8.2); 1-minimal/Tannakian comparison (8.4); and normal presentation (8.5).

All 20 headline groups are named in the module docstring, together with their missing carriers. Native divided-power algebras do not include the relative simplex differential or compatible-family form construction. Native DG algebras do not include Sullivan minimality and Hirsch extensions. Native mixed Hodge structures do not include geometric realization. Mathlib's integral additive pro-étale cohomology does not supply the geometric rational cohomology ring and its model. The universal-coefficient headline additionally needs the coherent pro-simplicial coefficient system and its limit comparisons. No statable headline omitted at these pins was identified. A generic primary-decomposition theorem on an arbitrary vector space would not replace the geometric headlines.

### Computed target table

Here R is any commutative ring; K is a characteristic-zero field; Λ means the alternating graded algebra, also at 2. The target column includes the number of its Check bullets.

| Statement / context | Instances and values on both sides | Result / change |
|---|---|---|
| Conventions, README:19–25; 5 Checks | Empty X has H*=0; two points have dim H⁰=2, not connected value 1. At r=0, ℤ/ℓ⁰=0; at r=1 cardinality is ℓ. Exterior e²=0 over ℤ and 𝔽₂, but e²≠0 in 𝔽₂[e]. For dy=x², weights (2,4) give 4=2+2, (2,3) give 3≠4. Geometric spectrum (1,2) has weights (0,2), inverse spectrum (1,1/2) has (0,−2). Elliptic bracket is 0; dc=ab gives [A,B]=−C and −4=−2−2. At q=1 every q^(w/2)=1; zero-dimensional spectrum is empty for every w. | Retain invertibility, connectedness, r≥1, odd-square convention and q>1. Empty/square-zero cases do not force a connected model. |
| 0.1, README:143; 5 | Λ(e) has e²=0; 𝔽₂[e] has e²≠0. Λ(a₁,b₁), d=0 has H dimensions (1,2,1), and ab↦[ab]≠0. Zero algebra gives d²0=0 and H⁰=0≠K. Identity and a↦2a induce scalars 1 and 2, with inverses 1 and 1/2 in localization. | Retain; corrected localization owner verified. |
| 1.1, README:179; 6 | Over ℤ, γ₁²=2γ₂; mod 2 this is 0 with γ₂≠0. Over ℚ, γ₂↦t²/2 and γ₀↦1. Two maps to 𝔽₂[ε]/ε² have γ₁↦0 but γ₂↦0 or ε. At 3, tγ₂=3γ₃ becomes 0 with γ₃≠0. Over R=0 all γ_n=0. | Retain all divided-power generators and normalized rank-one lattice. |
| 1.2, README:205; 3 | x_i has (p,n)=(0,1), dx_i has (1,1); d fixes n. On an integral edge Ω₀¹=0 and Ω₁¹=ℤ dx₀. γ₀+γ₂ has finite support {0,2}; Σγ_n has infinite support and is absent. | Retain bidegree and direct-sum convention. |
| 1.3, README:227; 5 | One vertex: dx₀=0, x₀=t, γ₂≠0 and Ω=R{t}; imposing t=1 instead forces 2γ₂=1 over ℤ. Edge: dx₀=−dx₁, dγ₂(x₀)=x₀dx₀, dx₀²=0 also mod 2. Zero ring gives the zero module throughout. | Retain relative quotient and alternating factor; σ nonempty permits splitting the diagonal. |
| 1.4, README:252; 3 | A face omitting vertex 1 sends x₁ and dx₁ to 0. Collapse pulls γ₂ back to γ₂(x₀)+x₀x₁+γ₂(x₁). Three-vertex collapse in either order gives Σγ₂(x_i)+x₀x₁+x₀x₂+x₁x₂. Identity gives γ₂↦γ₂. | Retain contravariance; the mixed coefficient is 1, not 0. |
| 2.1, README:276; 5 | Δ⁰ gives R{t}; ∅ gives 0. Degenerate edge pulls γ₂ to γ₂(x₀+x₁). Identity-simplex evaluation gives x₀+x₁=t and dx₀=−dx₁. At a shared vertex the values (0,γ₁) disagree and (γ₁,γ₁) agree. | Retain compatible families with coefficients inside the simplex object. |
| 2.2, README:300; 3 | (p,n,i)=(0,0,0) gives R; (p,n)=(0,1) has normalized R→R by a unit, hence homology 0; (1,1) has H₁=R. For R=0 both exceptional groups are 0. At n=2 over 𝔽₂, Γ²(R) has dimension 1 despite 2=0. | Retain simplicial/cochain distinction and divided-power décalage. |
| 2.3, README:314; 3 | Circle has H¹Ω₀=0, H¹Ω_n=R for n≥1. Torus: (aγ₁)(bγ₁)=2abγ₂; mod 2 the product is 0 although ordinary ab≠0. For ∅ both sides are 0 in every bidegree. | Retain triangular ring, not the untapered tensor ring. |
| 2.4, README:328; 3 | Point at (0,1): 3γ₁ mod 4 maps to γ₁ mod 2. Point diagonal Ω₀⁰=R, but RP² has H¹(−,ℤ)=0 versus H¹(−,𝔽₂)=𝔽₂. For a principal ideal, ker(∏R→∏R/(a))=a∏R. At p=0 preceding degree is −1 with term 0, not Ω₀⁰. For a unit a both quotient modules are 0. | Retain principal-quotient scope and negative-degree convention. |
| 2.5, README:342; 3 | Point γ_n↦t^n/n! is a line isomorphism. On an edge, image in t-degree 0 is K·1 and excludes x₁. On disjoint edges, polynomial degrees of x₁ᴺ are unbounded, so stabilization omits that family. Yet dx₁=d(x₁) and H¹(edge)=0. | Retain quasi-isomorphism without cochain surjectivity. |
| 3.1, README:368; 4 | Constant point and even subsequence give Rγ_n. In lim_r colim_N(ℤ/ℓʳ)^N, (ℓⁱ)_i has finite support mod each ℓʳ but infinite support in ℤ_ℓ; colim_N lim_r has finite support only. Two-point collapse pulls scalars back by a↦(a,a). | Construction retained; repeated-law Checks: S02. |
| 3.2, README:392; 4 | Point mod-ℓ cardinalities are (ℓ,1,1,…). CP∞ has cardinality ℓ in every even degree and 1 in odd degrees. Infinite wedge of circles has H¹=∏ℕ𝔽_ℓ, infinite. Circle ranks are (1,1,0,…), hence cardinalities (ℓ,ℓ,1,…). | Retain degreewise, not total, finiteness. |
| 3.3, README:415; 2 | CP∞ has integral even rank 1, odd rank 0 in all degrees. Complex ℤ_ℓ→ℤ_ℓ by ℓ in degrees 1,2 has H¹=0, H²=ℤ/ℓ; mod ℓ H¹=𝔽_ℓ=Tor₁(H²,𝔽_ℓ). For the zero complex both tensor and Tor terms vanish. | Retain degree i+1 in Tor and no bounded-total-degree hypothesis. This target is a theorem, not a new definition requiring three Checks. |
| 3.4, README:428; 3 | Point completed piece is ℤ_ℓγ_n, not ℤ/ℓʳ. Σγ_n remains excluded by infinite t-support. Circle at (p,n)=(1,1), coefficients 𝔽₂, has coker d=𝔽₂ of size 2, not 0. | Retain bidegreewise completion and cycle/boundary ML proof obligation. |
| 3.5, README:451; 3 | Point [γ₀]=1, [γ₂]=1/2. At n=ℓ−1 the transition coefficient is ℓ, nonunit in ℤ_ℓ but invertible in ℚ_ℓ. Product (n,m)=(2,3) gives 10/120=1/12=(1/2!)(1/3!). | Retain all four operations in their stated order and the ring normalization. |
| 4.1, README:484; 4 | Geometric point: H⁰=ℚ_ℓ,Hⁱ=0 for i>0. Two points: H⁰=ℚ_ℓ². X=𝔸¹ over uncountable k descends to countable algebraically closed k₁. At ℓ=p, the classes t^m, p∤m, give infinitely many independent Artin–Schreier H¹ classes, contradicting (F). | Generality retained; local ordering corrected by S01. |
| 4.1a, README:507; 3 | Both point presentations give ℤ_ℓγ_n and normalized 1/2 at n=2; comparison scalar on H⁰ is 1. Two-point H⁰ has two idempotents in each presentation. 𝔾_m comparison has H¹ rank 1 on both sides. Pro-map Et_rig→E_fin gives algebra map A_fin→A_rig. | Mathematical comparison retained; no continuity transferred to raw cochains. |
| 4.2, README:527; 4 | Point stabilizer index 1. Two-point swap has stabilizer index 2. Raw 𝔸¹ indicators on 2ʲ-orbits have stabilizer contained in ⋂2ʲℤ̂, with no open subgroup; for any N choose j>v₂(N), giving indicator values 1 and 0. Finite cycles of lengths 2,3 have common stabilizer 6ℤ̂ of index 6. | Repaired finite-component continuity retained; finite width and finite components are both needed. |
| 4.3, README:542; 3 | 𝔾_m(ℂ) has H¹ rank 1 despite noncompactness. Two arcs with disconnected overlap give ordinary nerve H¹=0 but component Čech nerve H¹=K. Two singleton opens give H⁰=(ℤ/ℓʳ)², whereas collapsing them gives rank 1. | Retain supplied good covers and correct pro-map direction. |
| 4.4, README:556; 3 | 𝔾_m model Λ(a₁) has H¹ rank 1; elliptic Λ(a₁,b₁) has H¹ rank 2 and H² rank 1 with ab≠0. Two points have H⁰ rank 2, so no connected model. | Retain comparison up to homotopy and noncanonical actual isomorphisms. |
| 5.1, README:580; 4 | 𝔾_m H¹ weight 2; elliptic H¹ weight 1; proper nodal rational H¹ weight 0. C_nodal×𝔾_m has H¹ weights 0,2 and H² weights 2,2 in [0,4]. Dual-number point has H⁰=ℚ_ℓ,Hⁱ=0 for i>0; W₋₁H⁰=0,W₀H⁰=H⁰. On ℙ¹, W₂H² comes from complex index 0=2−2. | Retain normality and weight-filtration shift; general numerical bounds are a declared gap. |
| 5.2, README:595; 3 | Geometric H²(ℙ¹) eigenvalue q has weight 2. Its inverse q⁻¹ has weight −2. Spectra (1,2),(1,3) are integral and both give W₀,W₂ ranks (1,2); inverse eigenvalues 1/2,1/3 are nonintegral. | Repaired universal closed-point/lift quantifiers match source. |
| 6.1, README:619; 3 | Constant filtration of Λ(a₁,b₁) is finite and exhaustive, degree dimensions (1,2,1). Span{1,x₂} is not a subalgebra: x²≠0 in degree 4. Algebra Λ(y₃) is not d-stable when dy=x²; adjoining x fixes it. | Retain finite generators per stage, without finite dimension of each union degree. |
| 6.2, README:642; 3 | Even-sphere block {x,y} contains dy=x²; {y} does not. Three-punctured line has dim H¹=2,H²=0 but free Lie ranks 2,1,2,3,…, requiring indefinitely many degree-one stages. Two shears on Λ(a,b) preserve its finite block but AB≠BA. | Retain finite cohomology and actual-versus-homotopy representative distinction. |
| 6.3, README:656; 3 | Invertibility gives generalized 0-space 0. Jordan J₂(1) has ker(J−1) dimension 1 and ker((J−1)²) dimension 2. Closed generators of eigenvalues 2,3 have product eigenvalue 6≠5. | Retain generalized eigenvalues and multiplicative spectrum. |
| 6.4, README:679; 3 | For dy=x² and σx=ax, σy=a²y; source degree sum 2+2=4≥3. Nonminimal du₁=v₂ can have arbitrary eigenvalue β but zero positive cohomology. Unit has eigenvalue 1 and empty-product degree sum 0. | Retain minimality and inequality direction. |
| 6.5, README:693; 5 | Whole J₂(a) receives one weight v(a), dimension 2, not eigenspace dimension 1. dy=x² allows weights (2,4), rejects (2,3). 𝔾_m degree 1 weight 2 satisfies 2≥1. Even-sphere y has 4≥3. On Λ(a,b), σa=2a,σb=a+2b has H¹ Weil 2-weight 2 and H² eigenvalue 4 of weight 4. | Retain nonsemisimplicity, lower bound and Galois-invariant descent. |
| 6.6, README:718; 3 | A=((1,1),(0,1)), B=((1,0),(1,1)) give AB=((2,1),(1,1)), BA=((1,1),(1,2)). Aⁿ=((1,n),(0,1)), A⁻¹=((1,−1),(0,1)). diag(2,4)(a+b)=2a+4b is outside K(a+b); the full plane is graded. | Retain common stability without assuming a finite group. Source states the general finite-set lemma. |
| 7.1, README:742; 5 | Λ(a₁), weight 1, has section a↦λa and U=1. On weights 1,2 the shear b↦b+a is Gr-identity but sends [b] to [b]+[a]. Swap a↔b does not preserve M₀=Λ(a). At λ=2 scalar factors are 2,4, not 1/2,1/4. | Retain filtered automorphism groups and associated-graded kernel. |
| 7.2, README:767; 3 | In 𝔾_a⋊𝔾_m, s_c(2)s_c(3) has additive coordinate −c+2(−2c)=−5c=s_c(6). Conjugating s₀ by (c,1) gives c−λc. The shear in U acts nontrivially on H¹, so cannot be homotopic to identity. At U=1 the section is unique. | Retain algebraic sections and compatible tower lifting as substantive local obligations. |
| 7.3, README:781; 3 | Elliptic a,b have weights 1,1 and ab weight 2. 𝔾_m has degree-one weight 2, W₁H¹=0,W₂H¹=K. Elliptic W₀H¹=0,W₁H¹=K². | Retain rational grading and filtration index m. |
| 7.4, README:795; 1 | g(a)=a,g(b)=b+a carries (Ka,Kb) to (Ka,K(b+a)), fixes Gr^W, but H¹(b) changes by nonzero [a]. Identity conjugates a splitting to itself. | Retain Gr-identity conjugacy; no identity-on-H or chosen-filtration requirement. No definition introduced here. |
| 8.1, README:817; 2 | Three-punctured line H¹=ℚ_ℓ(−1)² has two weight-2 generators. At q=2, ℓ=3, eigenvalues (2,2) have absolute-value weight 2, giving ℚ₃ weights without a Betti Q-model. | Retain arbitrary algebraically closed base and declared spread-independent filtration. No new definition. |
| 8.2, README:830; 3 | Elliptic d=0 model is formal. 𝔾_m weight-2 degree-one class maps to 0 under degree-diagonal projection, so that map fails H¹. On ℙ¹, x↦[x],y↦0,dy=x²↦[x²]=0; H*=K[x]/x². | Retain proper smooth purity and nonzero minimal differential. |
| 8.3, README:844; 6 | Λ(a) yields one-dimensional abelian Lie algebra; Λ(a,b),d=0 yields abelian dimension 2, not free rank-two Lie algebra. Three punctures give free pronilpotent ranks 2,1,2,3,… with generator weight −2. dc=ab gives [A,B]=−C, dc(A,B)=1=−c(−C); weights dualize (2,2,4)→(−2,−2,−4). ℙ¹ 1-model K gives H² map 0→K, versus full-model H² map K→K. Infinite square-zero degree-two A gives 0→K^(ℕ) injective. | Lie/sign construction retained; remove unnecessary H² finiteness: S03. |
| 8.4, README:869; 2 | Free rank-two depth-one Lie quotient has dimension 2; depth two has dimension 3. C₂ and S₃ have group orders 2,6 but characteristic-zero unipotent completion 1, since a finite-order unipotent has zero logarithm. | Retain pointed normal-variety comparison, not an identification with full profinite π₁. |
| 8.5, README:882; 4 | Three punctures: dim V=2, both weights −2, R=0. Elliptic: dim V=2, weights −1, relation [a,b] weight −2, quotient dimension 2. Nodal proper rational curve has weight-0 H¹ and fails normality. Genus g≥1: dim V=2g, one weight−2 symplectic relation; at g=0 both dimensions are 0. Relation range [−4,0]∩(−∞,−2]={−4,−3,−2}. | Retain finite homogeneous relation space and completion; finite quotients additionally impose their nilpotence cutoff. |

### Bold worked examples

| Bold statement | Computed values / comparison | Result |
|---|---|---|
| Summary, README:3 | Point A_ℓ has H⁰=ℚ_ℓ; ℙ¹ has H⁰,H² rank 1 and model dy=x²; normal curve generator/relations have the ranges computed above. | Matches the headline inventory; no extra functorial splitting asserted. |
| Circle and two-torus, README:911 | Circle model has Betti ranks (1,1); elliptic torus (1,2,1) with weights (0,1,2), algebraic torus same ranks with weights (0,2,4). Integral product coefficient 2 becomes 0 mod 2, rational normalization gives 2/2!=1. | Arithmetic weights depend on geometry; cohomology normalization agrees across layers. |
| Three punctures, README:932 | H¹ rank 2,H²=0, but Λ(a,b) has H² rank 1. Adjoining c with dc=ab kills that class; dual [A,B]=−C is nonzero and weight −4. Geometric relation space is 0. | Finite first stage is not the full minimal model. |
| Proper smooth curves, README:944 | At g=2, Λ²K⁴ has dimension 6 while actual H² has dimension 1, so five degree-two classes must be killed. Lie presentation has 4 generators and 1 relation, different from those five model generators. At g=1, 2 generators and 1 commutator relation give abelian dimension 2. | Distinction between full minimal differential and formality retained. |
| Projective line, README:957 | dy=x² gives cohomology K in degrees 0,2 and 0 otherwise. Model weights are 2,4; d preserves weight 4. Projection sends x² to [x²]=0 and y to 0. | Sign, degree sum and formality map agree. |
| Why normality matters, README:964 | Normalization ℙ¹ has H¹=0; the nodal curve has one graph H¹ class of weight 0. Its dual also has weight 0, outside {−1,−2}. | Substantive negative control. |
| Infinite discrete coefficients, README:974 | For R=ℚ[x₁,x₂,…], I=(x_i), sequence (x_i) maps to 0 in ∏R/I but is nonzero modulo I∏R: finitely many ideal coefficients cannot generate every variable. For principal (a), kernel=a∏R. | Refutes arbitrary quotient base change; does not refute §2.4. |

### Supplier resolution, ownership and conventions

The 16 roadmap supplier subsections were resolved individually, together with the additional MixedHodgeModulesAndIrregularHodgeTheory scope citation. The supplied main checkout was at 64932739 when the audit ended; the pins agree with the README. For indexed suppliers, their current text was read through `roadmaps show`; main and the expressly supplied open heads were read directly. The resolver's three unresolved names are present as board designs, as recorded below, and are not missing suppliers.

| Supplier citation | Current location and verified boundary |
|---|---|
| DGAInfinity Layers 1, 3, 8 | TauCetiRoadmap/DGAInfinity/README.md:293,353,520. DG algebra and cohomology, A∞ transfer, and formality/Massey theory exist; A∞ minimality is not Sullivan minimality. Generic localization is imported from Mathlib instead. |
| AlgebraicTopology Stages 4–6 | TauCetiRoadmap/AlgebraicTopology/README.md:817,849,946. Item 4.7 realizes native simplicial sets with +1 orientation. Stage 6 supplies ordinary cochains, coefficients and products. Its finite-cover descent does not supply contractible intersections. |
| AlgebraicTopologyPartII AT2.4/G3 | packages/AlgebraicTopologyPartII/design/README.md:356,2167. The rational-model direction exists; the five precise Sullivan contracts extend it. The design is absent from the resolver's published-folder index, not from the board. |
| DerivedDeRhamCohomology 2.21 | TauCetiRoadmap/DerivedDeRhamCohomology/README.md:3248. Strict commutativity includes odd squares zero. Over 𝔽₂, the alternating algebra has e²=0, unlike 𝔽₂[e]. |
| DerivedModuleAlgebra 0.DP.2–3, 0.14–17, 1.T.1, 1.1 | TauCetiRoadmap/DerivedModuleAlgebra/README.md:105,172,1171,1268,1403,1573. Homogeneous divided powers, base change, décalage and module limit machinery are supplied. At n=2 over 𝔽₂, Γ²(𝔽₂) has dimension 1. Milnor's correction is lim¹H^(j−1), not lim¹H^(j+1). |
| DiamondsAndVStacks D0.13 | TauCetiRoadmap/DiamondsAndVStacks/README.md:1256. Imports the ordinary pro-category from AdicSpacesPartII and supplies the size interface; it does not own a second pro-category. |
| AdicSpacesPartII R0.19.9 | TauCetiRoadmap/AdicSpacesPartII/README.md:7793. Opposite-Ind construction, small cofiltered diagrams, stage representatives and Hom(lim X_i,lim Y_j)=lim_j colim_i Hom(X_i,Y_j). Constant diagrams recover Hom(X,Y). |
| EtaleHomotopyTypes EH.0, EH.3, EH.6 | packages/EtaleHomotopyTypes/design/README.md:201,768,805,842,1374. EH.0 explicitly uses filtered-colimit cohomology. EH.3 supplies rigid hypercovers and raw comparison. Its rigid objects do not imply finite components. EH.6's completed quasi-projective comparison is distinguished from this package's form-algebra comparison. |
| EtaleCohomologyFoundations G.1–3, F.0.3, F.2.2–3, F.4, F.10 | TauCetiRoadmap/EtaleCohomologyFoundations/README.md:57,231,522,695,730,917,940,961,1113. Ordinary nonproper finite-coefficient finiteness is explicitly included at :734. The ℓ-invertibility, finite-type and ctf restrictions are retained. On 𝔸¹, H⁰=Λ versus H⁰_c=0; on ℙ¹, geometric eigenvalues are 1,q. |
| ComplexComparisonPartII C5.3, C5.5, C6.0–1, C6.3, C6.6 | TauCetiRoadmap/ComplexComparisonPartII/README.md:2975,3402,3991,4048,4169,4335. Pure Hodge realization includes nonprojective smooth proper schemes; finite CW and Artin comparison include singular/noncompact separated finite-type schemes. Good-cover refinement is separately declared. The finite CW type of 𝔾_m has ranks (1,1), not compact-support ranks (0,1,1). |
| MotivicEtaleKTheory 3.1–2, 3.4 | TauCetiRoadmap/MotivicEtaleKTheory/README.md:11,354,375,420, at the supplied open head. Smooth logarithmic forms and filtered realization are present; singular hyperresolution theory is explicitly outside its current construction. On 𝔾_m, dlog z lies in complex W₁ and cohomological W₂; 1+1=2. The declared extension preserves that shift. |
| SchemeAndStackFoundations 0.9, Layer 2, 4.17, 4.19 | TauCetiRoadmap/SchemeAndStackFoundations/README.md:848,3232,6075,6372. Finite-presentation descent, sites, SNC divisors and alterations are present with their field hypotheses. Reduced V(xy) is SNC; a doubled component is not. A separated finite-type scheme over a field is quasi-compact and quasi-separated, so the descent hypotheses apply. |
| ResolutionOfSingularitiesCharacteristicZero 5.1–6, 6.1–4 | TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md:673,719,759,771,803. Resolution preserves the specified open/boundary; projective SNC compactification retains quasi-projectivity. The package obtains general proper compactifications from the separate supplier. |
| DeligneWeightsAndPurity 0.1–3, 0.7–15, 7.12, 7.14–15, 8.20–24 | TauCetiRoadmap/DeligneWeightsAndPurity/README.md:753,879,941,975,995,2619,2667,2679,3116,3234,3264. All-embeddings and generalized-eigenspace conventions agree. J₂(q) has a two-dimensional generalized space, dual weight −2; exterior degree zero has eigenvalue 1. The current smooth/proper bounds do not already supply the three declared arbitrary-base contracts. |
| ReductiveGroups Layers 5, 6, 6A | TauCetiRoadmap/ReductiveGroups/README.md:443,460,479,520. Characteristic-zero unipotent/Lie theory and finite algebraic Levi splitting exist, including rational cohomology and torsor inputs. They do not assert compatible sections of this infinite automorphism tower: that remains §7.2. The semidirect-product sign is c−λc, giving −c at λ=2. |
| AnabelianGeometryAndNonabelianChabauty 2.1–3 | TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:3913,3963,3991,4062,4093. The geometric category is currently smooth characteristic-zero curves. Tensor length and lower-central depth are distinct. Depth zero gives 1; depth one has Lie dimension dim H¹. The all-normal-variety category is requested without assuming the model comparison. |
| MixedHodgeModulesAndIrregularHodgeTheory H.1/operations, H.1/weight-bounds | packages/MixedHodgeModulesAndIrregularHodgeTheory/design/README.md:683,717. Operations are on its quasi-projective supported categories; this scope citation does not supply the requested all-separated hyperresolution realization. |

Ownership searches used `roadmaps grep`, direct object searches in main and Completed, the board packages, and all 53 explicitly provided open roadmap folders at their supplied heads. Searches covered Sullivan/Hirsch models, polynomial forms, divided-power forms, hyperresolutions, pro-categories, finite-component hypercovers, unipotent models and weight presentations. The relevant overlap is imported through the table above. PeriodsAndSpecialValues' polynomial differential forms and QWittVectors' crystalline PD forms are different objects; neither is the compatible-family relative simplex algebra. No second owner of the package's integral relative-form construction, completed form comparison, or minimal-model weight extension was found. No fully qualified name can collide in the empty Suggested.lean.

### Declared gaps

All 12 slugs occur once in the plan's top-level gaps list and once under the README's named supplier contracts. Each needs sentence matches verbatim. Every supplier is named, its direction is earlier, and the hypotheses and intended outputs are explicit. The clauses giving operations and comparison laws specify one coherent interface per contract rather than unrelated prerequisites. None was treated as a delivered theorem. No additional missing contract was established.

| Contract | Discriminating instance and boundary checked |
|---|---|
| polynomial-forms-de-rham | On Δ¹, d(x₁)=dx₁ and H⁰=K,H¹=0. Across disjoint simplices, degrees N are unbounded; a uniform-degree restriction would exclude these compatible families. |
| sullivan-minimal-models | du=v is a Sullivan extension with indecomposable differential [u]↦[v]≠0; dc=ab is minimal with [c]↦0. Full models require all cohomology; 1-models require only H¹ isomorphism/H² injection. |
| sullivan-quasi-isomorphism-rigidity | Λ(a₁) map a↦2a has inverse a↦a/2 over K; a↦0 is not a quasi-isomorphism. This is not the A∞ condition m₁=0. |
| sullivan-homotopy-lifting | Endpoint maps send dt to 0 at both 0 and 1. Maps a↦a and a↦2a induce unequal H¹ scalars 1,2 and cannot be homotopic. Homotopy-class lifts do not select multiplicatively compatible actual lifts. |
| sullivan-scalar-extension | ℚ→ℚ_ℓ preserves ranks (1,1) of Λ(a₁); an H² injection 0→K becomes 0→ℚ_ℓ. Extension is flat, with no characteristic-p claim. |
| compatible-good-cover-refinement | Two arcs with disconnected intersection have an ordinary two-vertex nerve with H¹=0, whereas the component nerve has H¹=K. The requested refinement must preserve the latter comparison. |
| geometric-mixed-hodge-realization | Proper nodal rational curve H¹ has weight 0; its normalization ℙ¹ has H¹=0. Smooth-stratum realization alone misses that class. Complex W_(m−i) gives cohomological W_m. |
| arbitrary-base-weight-filtration | ℙ¹ has W₁H²=0,W₂H²=H² over either a countable or uncountable algebraically closed extension. The contract includes independence of the spread. |
| ordinary-cohomology-weight-bounds | C_nodal×𝔾_m is neither smooth nor proper: H¹ weights 0,2 and H² weights 2,2 satisfy [0,2] and [0,4]. Existing proper/smooth results alone do not cover it. |
| normal-h1-weights | Normal 𝔾_m has weight 2, elliptic curve weight 1; nonnormal nodal rational curve has weight 0. The normality clause is substantive. |
| normal-variety-unipotent-category | ℙ¹ gives U=1; the three-punctured line gives free rank-two pronilpotent Lie algebra. Finite groups C₂ and S₃ both have trivial characteristic-zero unipotent completion. The extension of the category does not assume the new model comparison. |
| finite-component-etale-presentation | A finite 2-cycle and 3-cycle give common stabilizer 6ℤ̂. Infinitely many 2ʲ-cycles have no open common stabilizer. The contract supplies finite components per degree and finite-extension descent, not merely a small index set. |

### Pinned API audit

The manifest revisions are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Twenty-two expressly named API entries were read at these pins, with the additional integral étale cohomology carrier checked for headline statability:

| Pinned file | Entries and actual scope |
|---|---|
| Mathlib/RingTheory/DividedPowerAlgebra/Init.lean:99,127,171,235,346,418 | DividedPowerAlgebra, dp, dp_mul, algHom_ext, lift, map. Universal algebra and functoriality, not the relative simplex differential or the concrete normalized lattice. The span statement at :252 is not the missing full relative-form construction. |
| Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean:90 | ExteriorAlgebra imposes alternating products, including in characteristic 2. |
| Mathlib/AlgebraicTopology/SimplicialSet/Basic.lean:33; Homology/Basic.lean:75 | SSet is a simplicial object in Type; chainComplex uses the coefficient object. In ModuleCat R, choose R for free chains. |
| Mathlib/CategoryTheory/Abelian/Ext.lean:56 | ChainComplex.linearYonedaObj takes Hom into an object of the same linear category. Applying it to free R-chains yields ordinary R-module cochains. |
| Mathlib/AlgebraicTopology/DoldKan/Equivalence.lean:167 | CategoryTheory.Abelian.DoldKan.equivalence assumes an abelian category and supplies simplicial normalization, not nonlinear homotopy invariance. |
| Mathlib/CategoryTheory/CofilteredSystem.lean:137 | Functor.IsMittagLeffler is eventual stabilization of images in Type; no module exactness theorem is contained in the definition. |
| Mathlib/CategoryTheory/Localization/Construction.lean:106,111 | MorphismProperty.Localization and Q accept the selected category and morphism property. The quasi-isomorphism specialization belongs to the application. |
| TauCeti/Algebra/Homology/DG/Algebra/Defs.lean:182; Hom/Basic.lean:50; Cohomology.lean:182,257 | IsDGAlgebra, DGAlgHom, Cohomology and algEquivCohomologyOfZero. Degree +1 and Leibniz are native; nonnegativity, commutativity and Sullivan minimality are additional conditions. |
| TauCeti/AlgebraicTopology/Cohomology/Basic.lean:60,94; Cup.lean:203 | singularCochainComplex, singularCohomology and singularCup. The cochain composite and contravariance are explicit; cup needs its coefficient pairing and Alexander–Whitney diagonal. |
| TauCeti/Geometry/Hodge/Mixed/Basic.lean:72 | MixedHodgeStructure carries filtrations and pure graded pieces; it does not itself construct geometric cohomology or assert finite dimension. |
| Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:75 | Scheme.EllAdicCohomology is additive sheaf cohomology of the integral ℤ_ℓ sheaf on the pro-étale site. It is not the required rational geometric cohomology ring/model comparison. |

### Sources and dependency check

There are nine source keys, with no duplicate work under another key. Seven legal cached texts support the inspected target locators; two are settled uncertified references. All 98 explicit source-line citation occurrences were resolved, comprising 63 distinct anchors. The target locator groups were checked against their surrounding arguments, not merely against headings. Broad bibliography ranges are background, not additional certified theorems.

| Source | Locator coverage and boundary |
|---|---|
| weil-II | §5.1.1–5.1.10, pp.234–236; §5.2.1–5.2.4, pp.237–239; §5.3.1–5.3.10, pp.239–242; anchors weil-II line 3650 through weil-II line 3960. Integral binomial products, bounded-image rational forms, limit order, finite-component descent, eigenvalue product inequality, grading, splitting and normal presentation agree with the repaired scope. The arbitrary-quotient assertion needs the correction recorded below. |
| sullivan | §6, Appendix, §7 and Theorem 8.1; sullivan line 912, sullivan line 1042, sullivan line 1121, sullivan line 1289. Polynomial forms, minimality, finite filtration arguments and formality are used with characteristic-zero coefficients and the ordered model hypotheses. |
| morgan | Definitions 5.1–5.3, Proposition 5.5, Theorems 5.6–5.7, Proposition 5.9, degree-one canonical series and Theorem 9.4; morgan line 1017 through morgan line 1190 and morgan line 2245. The unnecessary H² finiteness is S03. The original rigidity claim is not imported. |
| morgan-correction | Entire correction, p.185; morgan-correction line 29. The associated graded is rigid; full degree-one indecomposables are not asserted rigid. The package retains conjugacy rather than canonical actual choices. |
| dgms | Theorem 1.2 and Corollaries 1.3–1.6, pp.252–253; Theorem 2.1, pp.254–255; §6 Main Theorem/proof, pp.270–271; dgms line 331, dgms line 448, dgms line 1060. These support the characteristic-zero supplier contracts and formality route; a Kähler theorem is not used to call every proper smooth analytification Kähler. |
| poids | §§7.1,8.3,10,12–14, pp.82–84; poids line 127, poids line 152, poids line 164, poids line 198. Ordinary weight bounds, normal H¹, Lie duality and the universal closed-point/Frobenius-lift statement are present. |
| hodge-III | §§6.2.4–6.2.8, 8.1.19–8.2.4, 8.2.10–8.2.11, pp.19–21,34–40; hodge-III line 582, hodge-III line 1213, hodge-III line 1279. Proper smooth descent and the degree shift in mixed cohomology are respected by the declared realization contract. |

The required dependency command, with the supplied configuration, package README, name, ORDER.txt and `--movable`, exited 0 and printed:

```text
depcheck: 55 roadmaps, 626 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. S01 is an internal target-order defect, not an upward roadmap edge. No ownership move is proposed.

The reviewed diff contains eight files, all under packages/EllAdicHomotopyTypesAndWeights: 2,052 insertions and 66 deletions. README/Suggested contain no pull-request numbers, procedural repair history, computational algorithm, `lemma` declaration, `set_option`, admitted data, or forbidden import. The mathematical construction steps are proof plans. All 37 numbered targets have source locators. The sole output inside the checkout from this review is this report; the roadmap, plan, manifest and merge order were not edited.

Final counts: 0 Lean declarations read; 37 numbered targets, the bold summary and six bold worked examples read; 128 target Checks and five convention Checks evaluated in the tables; 63 distinct source anchors resolved across seven available works; 16 supplier subsections and one additional sibling scope citation checked; 12 gap contracts matched; 53 supplied open folders searched by object. Findings S01–S03 are new; all seven round-one findings are repaired at the reviewed head, conditional on the declared supplier contracts where applicable.

## Not verifiable

- `miller`, *De Rham cohomology with arbitrary coefficients*, pp.193–203: settled uncertified. Its proof text was not inspected. Weil II's explicit coefficient-homotopy and triangular statements were inspected, and their low-degree and characteristic-2/3 cases computed independently.
- `sga5`, Exposé V, §5.3.1: settled uncertified. Its proof text was not inspected. The universal-coefficient statement actually cited in Weil II was inspected, including its finiteness assumptions and Tor degree. Neither settled source was requested again.
- No Lean elaboration or build was run, as required. Suggested.lean has no named declarations, so the signature inventory and required package-declaration #check list are empty. Static statability checks do not prove the future theorems.
- The 12 supplier gaps remain future delivery contracts. Their precise declarations and ownership were verified, not their future implementations. Acceptance of the mathematics is conditional on those contracts.
- Open work outside the 53 supplied folders was not independently inspected at its head. Indexed `roadmaps grep` was used as an ownership lead, not as evidence of exhaustive review of every open pull request. No inaccessible source or new missing-reference request remains.

## Source issues

- **Error** in weil-II at §5.1.5, printed p.235, weil-II line 3694: the source says quotient-coefficient base change works off the diagonal for every quotient ring; it should be restricted to suitable quotients, including principal quotients, unless additional finite-presentation hypotheses control infinite products; affects a stated result.
- **Misprint** in weil-II at §5.2.2, printed p.238, weil-II line 3804: the source says the ambient algebraically closed field k is countable; it should be the chosen algebraically closed field of definition k₁ is countable; affects the proof.
- **Error** in morgan at §9 preceding Theorem 9.2, printed p.195, morgan line 2123: the source says indecomposables of a general minimal algebra are rigid under homotopy; it should be their canonical-filtration associated graded is rigid, with unrestricted indecomposables rigid in the simply connected case; affects the proof; corrected in print at morgan-correction, p.185, morgan-correction line 29.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "4a93d8c3a2b03d490ddb95351e20e97fe3eae3e5", "job": "RT-EllAdicHomotopyTypesAndWeights~2a", "model": "gpt-6-astra", "worker": "chris-38"} -->
