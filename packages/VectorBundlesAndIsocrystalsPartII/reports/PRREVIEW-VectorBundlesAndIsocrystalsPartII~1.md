# Review of VectorBundlesAndIsocrystalsPartII (pull request #2264 at 7d58029)

**Verdict:** needs changes

## R01 (P2) — Restore the general period-model class

**Location:** `TauCetiRoadmap/VectorBundlesAndIsocrystalsPartII/README.md:769`: “the condition on the graded pieces is what that route needs”; the excluded example is at line 787.
**Claim:** Restricting reasonable Fréchet period models to graded pieces with countable-type or c₀ presentations narrows CN25's class to accommodate a proof route. The restriction propagates to the period comparisons and qBC full faithfulness.
**Witness:** CN25 line 1259 includes every B₁-Banach model. The spherical completion Ĉ is such a model, but README line 787 excludes it because its continuous C-dual is zero. Thus the two classes differ already at m=1.
**Repair:** Define reasonable models using the general Fréchet/compact-type condition, without the added graded-piece restriction. Keep countable-type and c₀ comparisons as intermediate results; own the remaining general comparison and its prerequisites here. Include Ĉ among the models requiring comparison, rather than excluding it because the selected proof fails.

## Verified sound

Headline coverage: C and finite-length B⁺ full faithfulness; the almost-C structure theorem; the fundamental extension theorem; Euler–Poincaré duality; the disc Ext isomorphism; reasonable qBC full faithfulness; the height–rank formula. The table records computed tests, not proofs of the general targets.

| Statement | Instances | Computed value | Comparison value | Result | Change |
| --- | --- | --- | --- | --- | --- |
| Conventions; `SemilinearRep` | p=2; σ(i)=−i; trivial action candidate | Semilinearity at (i,1) requires i=−i | i≠−i in C; candidate excluded | Discriminates | — |
| Conventions: signed height | Qp, C, C/Qp | Almost-presentation heights: 1,0,−1 | Parent BC-presentation heights: 1,0,−1 | Agree | — |
| Conventions: period pushout | B₂, framed kernel c↦tc | (tc,−c) maps to tc−tc=0 | Middle-object map (b,c)↦b+tc | Agree; opposite sign changes class | — |
| §0.1; CN25 line 369 | D:c₀(Qp)→c₀(Qp), D(x)ₙ=pⁿxₙ | Kernel 0; image dense, proper | Cokernel after closure 0; inverse unbounded | D is not strict | — |
| §0.2: C full faithfulness [headline] | W₁=W₂=C; f(x)=ax, a∈K; C→C(1) | f(cw)=acw; equivariant Hom(C,C(1))=0 | cf(w)=caw; C-linear equivariant Hom=0 | Agree | — |
| §0.2: finite-length full faithfulness [headline] | B₁→B₂; B₂→B₂ | Equivariant continuous Hom: 0; K | Equivariant B-linear Hom: 0; K | Agree | — |
| §0.3: analyticity | E=Qpʰ⊕C; η(v,c)=c; η=0 | Image/kernel of projection: C,Qpʰ | Analytic projection; zero map has image 0 | Agree | — |
| §0.4: almost presentations | Qp; C; C/Qp | (d,h)=(0,1),(1,0),(1,−1) | dim V₂−dim V₁=1,0,−1 | Agree | — |
| §0.5: abelian category and Dimension [headline] | 0→Qp→C→C/Qp→0 | Dimension(C)=(1,0) | (0,1)+(1,−1)=(1,0) | Agree | — |
| §0.6; CN25 line 407 | 0; B₂; C(1) | Dimensions: (0,0),(2,0),(1,0) | Lengths/heights: (0,0),(2,0),(1,0) | Agree | — |
| §0.7; Fontaine04 line 4267 | Scalar a∈K; a∉K with σ(a)≠a | fₐ(σ1)=a; σ(fₐ1)=σ(a) | Equality iff a fixed; fixed field K | Agree at general base | — |
| §0.8; Colmez12 lines 103,294 | Algebraic roots ±√p; reduction θ; t-adic closure | θ(±lift(√p))=±√p; closure(K̄)=B⁺ | Distinct residues select roots; K alone misses C modulo t | Density and lift distinguished | — |
| §0.9: truncated Hom | N=k=1 | Hom_G(B⁺,t⁻¹B⁺/tB⁺)=K | Scalar multiples of projection: K, not K² | Agree | — |
| §0.10 [headline]; Fontaine03 line 1816 | E=Qpʰ⊕C; η(v,c)=g(v)+c | Image C; kernel {(v,−g(v))}, dimension h | Surjective; predicted kernel dimension dim V=h | Agree; η=g(v) fails image hypothesis | — |
| §1.1: almost-split extensions | 0→C(1)→B₂→C→0 | Original extension class 1≠0 | Quotient by Qp·t admits almost-splitting | Finite correction is necessary | — |
| §1.2: Yoneda comparison | X=Qp, Y=Qp(1), degree 2 | Arithmetic representation Ext²=Qp | Almost-C Ext²=Qp; trace class 1↦1 | Agree | — |
| §1.3: generalized invariants | W=C, C(1), B₂ | (W₀,W₁)=(K,0),(0,Kt′),(K,Kt′) | t′ acts as 0,0,isomorphism respectively | Twist is not inverse multiplication | — |
| §1.4; Fontaine03 line 1014 | W=B₂; z=1; a=χ⁽¹⁾(γ) | d₁d₀(1)=0; wrong twist gives (1−a²)t′ | γ(t′)=at′; a≠±1 | Inverse character required | — |
| §1.4: Ext cohomology | W=C; W=C(1) | H⁰,H¹,H²=(K,K,0); (0,K,K) | Ext table: (K,K,0); (0,K,K) | Agree | — |
| §1.5: Euler characteristic [headline] | X=Y=Qp; n=[K:Qp] | 1−(n+1)+0=−n | −n·ht(Qp)²=−n | Unsigned sum n+2 fails | — |
| §1.5: duality [headline] | X=Y=Qp; degrees 0 and 2 | Hom(Qp,Qp)=Qp; Ext²(Qp,Qp(1))=Qp | Trace pairing (a,b)↦ab; rank 1 | Perfect in test case | — |
| §1.6: truncated Ext table | (k,j)=(1,0),(1,1),(2,1) | K-dimensions (1,1,0),(0,1,1),(0,0,0) | Complex endpoint dimensions give same triples | k=0 excluded | — |
| §1.7: longer-target vanishing | N=0, i=1, j=2; i=j=1 | Hom/Ext¹(C,B₂)=(0,0) | At i=j, Hom(C,C)=K≠0 | Strict inequality necessary | — |
| §1.8: equivariant realization | C with standard Galois action | Equivariant scalar endomorphisms K | Underlying BC scalar endomorphisms C | Equivariance retains correct Hom | — |
| §2.1: presentation independence | Diagonal pⁿ injection on c₀(Qp) | Algebraic cokernel contains [(pⁿ)]≠0 | Hausdorff quotient 0; left-heart cokernel nonzero | Closure quotient excluded | — |
| §2.2: pointwise exactness | V₁⊕V₁→V₁, projection | Kernel V₁; cokernel 0 at every Λ | Evaluated kernel Λ; cokernel 0 | Agree | — |
| §2.3: TVS boundedness | V₁; unit balls; identity | Identity sends O_Λ to O_Λ | Bounded set remains bounded; bound 1 | Agree | — |
| §2.4; CN25 line 968 | Classical BC C/Qp and Qp | C/Qp has Banach quotient; Qp constant Banach | TVS values have those topologies; heights −1,1 | Realization preserves topology | — |
| §2.5: completion; CN25 line 992 | M=c₀₀(N,C), sup norm; M=0 | Completed evaluation c₀(N,C); 0 | Completion M̂=c₀(N,C); 0 | Completeness cannot be omitted | — |
| §2.5: compact type; CN25 line 2922 | colim Cⁿ; set {eₙ}; c₀ identity | {eₙ} unbounded in colimit; c₀ identity not compactoid | Lattice ⊕pⁿO_Ceₙ requires \|λ\|≤\|p\|ⁿ for all n | Only λ=0 works | — |
| §2.5: relative compactoidness | Identity of B₂; F={1} | B₂°⊆B₂°·1 | Finite generating set has size 1 | Relative definition includes finite free models | — |
| §2.6: tensor exactness | Split sequence 0→C→C²→C→0 | At C: kernel C, cokernel 0 | At Λ: kernel Λ, cokernel 0 | Agree | — |
| §2.7; CN25 lines 992,1013 | Regular B_m model; M=0; evaluation Λ=C | B_m⊗̂_B_m B_m=B_m; zero tensor=0 | Module values B_m; 0 | Unbounded direct sum of exponents excluded | — |
| §2.8: Pairs | [M→M]; [0→B_m]; dense diagonal | Quotients 0; B_m; nonzero | Left-heart values 0; B_m; nonzero | Hausdorff quotient would lose third object | — |
| §3.1: characters | α=0,1; p=3,2 | ψ₀=0; ψ₁ image (1/3)Z₃,(1/4)Z₂ | κ=3ψ₁ or 4ψ₁ has image Z_p | Normalization agrees | — |
| §3.2: perfectoid disc | First equation at p=3 and p=2 | Y₀³=X modulo 3^(1/3); Y₀²+Y₀=X modulo 2 | Odd-prime Frobenius; dyadic Artin–Schreier equation | Uniform odd-prime formula fails at 2 | — |
| §3.3: dyadic rational character | ψ₁(σ)=1; n=2ʳ | ψ₂(σ)=2; v₂(2ⁿ/n!)=1 | ψ₂/2=1; v₂(4ⁿ/n!)=n+1→∞ | exp(2X) fails closed-disc convergence | — |
| §3.4: descent and degrees | First tower level; p=3 and 2 | Constant/geometric/total degrees (6,3,18); (2,2,4) | 6·3=18; 2·2=4; coefficient ψ₁/ψ₁(γ)=1 | Base change requires all constant components | — |
| §3.4: norm bound | γ−1 on C{X}E₁ (p=3), C{X}E₂ (p=2) | Inverse norms √3; 2 | Both ≤p, with equality at p=2 | Bound includes dyadic prime | — |
| §3.5: additive cocycles | f=c; f=YZ at p=2; k=pʳ | u=−c; u=X²/2; v_p binom(k,p^(r−1))=1 | δu=c; δ(X²/2)=YZ; denominator valuation −1 | Signs and denominator verified | — |
| §3.6; CN25 lines 1169,1175 | Split extension; normalized B₂; v=0 | λ_v=0; λ_v=v; λ₀=0 in both | Rank 0; rank 1 if v≠0; v=0 distinguishes nothing | Nonzero v needed for splitting converse | — |
| §3.7: disc Ext [headline] | B₂ with kernel tc; pushout by c | λ(B₂)=1; λ(pushout)=c | Ext¹_TVS(V₁,V₁)=C with classes 1,c | Framing retained | — |
| §3.8: pro-étale interpretation | Completed versus uncompleted structure sheaf | H¹(Ô)=C{X}ψ₁; translation invariants Cψ₁ | H¹(O)=0 for the affinoid disc | Completion is essential | — |
| §4.1: reasonable C-spaces | 0; C; c₀(N,C) | 0,C have both types; c₀ is separable Banach | Infinite c₀ unit ball fails compactoidness | Infinite Banach example not compact type | — |
| §4.2 (R01); CN25 line 1259 | m=1; spherical completion Ĉ of C | Source class: Ĉ included; continuous C-dual=0 | Roadmap class: Ĉ excluded; c₀(I,C) included | Proof-route restriction | Restore general carrier and targets |
| §4.3: same-type Pairs | [0→B₁], [0→B₂]; dense diagonal | Common Banach branch and exponent 2; dense quotient nonzero | Same type true; strictness of Pair injection unnecessary | Agree | — |
| §4.4: pushout Ext | W=B₂,d=1,w=t; W=C,d=1,w=1 | Classes [t]=0 in B₂/t; [1]≠0 in C | Split first extension; second middle term B₂ | Sign and quotient agree | — |
| §4.5: cocycle boundedness | W=colim Cⁿ; c:Z_p→W, c(x)=xe_N | Image contained in step N; not in step N−1 | One uniform step N for all x | Pointwise choice is weaker | — |
| §4.6: extensions and biduality | 0→C→C²→C→0 | Section c↦(0,c); bidual C² | Continuous splitting; evaluation bidual is identity | Agree | — |
| §4.7: separable comparison | W=c₀(N,C); parameter (pⁿ) | Hom and Ext¹ parameters are null sequences | (pⁿ) admitted; (1,1,…) excluded | Banach coefficient bound respected | — |
| §4.8: general separable Fréchet comparison | W=C^N with product topology | Parameter (1,1,…) belongs to Hom/Ext¹≅C^N | Same parameter absent from c₀(N,C) | Fréchet extension goes beyond Banach case | — |
| §4.9: nonseparable c₀ comparison | Uncountable I; parameter e_j | Hom/Ext¹ parameter e_j; support {j} | e_j has norm 1; outside any prescribed countable span | Does not recover Ĉ of R01 | R01 |
| §4.10: truncated source | W=B₃; d=2,5 | Lengths of W[tᵈ] and W/tᵈW: (2,2),(3,3) | Hom/Ext¹ lengths: (2,2),(3,3) | Natural subtraction truncates correctly | — |
| §4.11: constant source | W=C; dense diagonal Pair P | Hom(Qp,C)=C; Ext¹(Qp,C)=0 | Hom(Qp,P)=P(C)≠0 | Algebraic quotient retained | — |
| §4.12: torsion source into Pairs | P=[tB₂→B₂]; d=1 | (B₂/tB₂)[t]=C | Hom(B₁,P)=C | Agree | — |
| §4.13: U_d | d=1,W=C; d=0 | Boundary C→C is identity; Ext¹(U₁,C)=0 | U₀=Qp; Ext¹(Qp,C)=0 | Source displayed value C is wrong | — |
| §4.14; CN25 line 1500 | Split E=C²; c=0,p,−1 | ℓ_v(cx)=0,pℓ_v(x),−ℓ_v(x) | ℓ_(cv)(x)=0,pℓ_v(x),−ℓ_v(x) | Nonunits included; evaluation plane C²→C² is identity | — |
| §4.15; CN25 line 1449 | Ext¹(B₂,C), allowing exponent increase | Topological B-module Ext¹=C; period Module Ext¹=C | TVS Ext¹=C; fixed-exponent-2 Ext¹=0 | Nontrivial middle term B₃ requires exponent 3 | — |
| §4.16: Pair full faithfulness | [0→B₁]→[0→B₂] | Period-linear Hom=tB₂≅C | TVS Hom=tB₂≅C | Agree without Galois equivariance | — |
| §5.1: qBC | Qp; C/Qp; pure period Pair | Heights 1,−1,0 | Constant, positive-curvature, rank-zero examples | Height sign distinguishes them | — |
| §5.2: positive-curvature vanishing | C/Qp→C | Any induced C→C is multiplication by a | Vanishing on Qp forces a=0 | Hom=0 | — |
| §5.3: curvature filtration | Qp⊕B₁⊕(U₁/Qp·tx) | Successive positive/zero/negative pieces: U₁/Qp·tx, B₁, Qp | Period piece B₁; finite negative piece Qp | Order and ownership agree | — |
| §5.4 [headline]; CN25 line 1585 | Multiplication by p on C/Qp | qBC map invertible, inverse p⁻¹ | TVS map invertible, inverse p⁻¹ | Hom comparison preserves height −1 object | — |
| §5.5: locally analytic quotient | X=[LA(Z_p,Qp)→C⁰(Z_p,Qp)] | Dense proper inclusion: X≠0; Hom(X,Qp)=0 | Ext¹(X,Qp)=D/Mes; measure class maps to 0 | Left heart retains quotient | — |
| §6.1; CN25 line 912 | Qpʳ; B_m; C/Qp | h=B_dRʳ; 0; 0 | Ranks r,0,0; heights r,0,−1 | Last case needs Ext correction; G-HOM declared | — |
| §6.2; LeBras18 line 1176; TVS25 line 1165 | (Qp,V₁); (V₁,V₁); normalized B₂ | VS Ext¹: 0; C; boundary class 1 | v-sheaf Ext¹: 0; C; boundary class 1 | Basic comparisons agree; general bridge is a target | — |
| §6.3: projective constant source | F=V₁,B_dR; source Qp | Hom=F(C)=C,B_dR; Ext¹=0,0 | Evaluation at initial algebra C is exact | V₁ has Ext¹(V₁,B⁺)=C≠0 | — |
| §6.4: localization | W=V₁; W=Qp | System C→C→… with zero maps; system 0 | Colimits 0;0; corresponding B_dR Ext¹=0 | Zero transitions are essential | — |
| §6.5: lattice Ext | W=V₁,k=0 | Hom(V₁,B⁺)=0; Hom(V₁,t⁻¹V₁)=C | Boundary C→Ext¹(V₁,B⁺)=C sends 1↦1 | Following transition is 0 | — |
| §6.6: nonpositive exactness | 0→Qp→Qp⊕C→C→0 | h(C)=0; h(Qp⊕C)=B_dR; h(Qp)=B_dR | Contravariant sequence 0→0→B_dR→B_dR→0 | Last arrow identity; Ext¹=0 | — |
| §6.7: height–rank [headline] | W=Qp²⊕(C/Qp)³ | rank h=2; rank Ext¹=3; height=−1 | ht+rank Ext¹=−1+3=2 | Opposite sign gives −4 | — |

- Source sample: all 15 seeded targets located and compared with the cached texts; 11 additional passages compared for wording; all 11 cited works legally readable.
- Pinned Mathlib: 21 declarations opened — `Mathlib/CategoryTheory/Functor/Basic.lean:40`; `Mathlib/Algebra/Category/ModuleCat/Topology/Basic.lean:41`; `Mathlib/Analysis/Normed/Operator/Banach.lean:162` and `:229`; `Mathlib/Algebra/Module/Torsion/Basic.lean:177`; `Mathlib/Algebra/Module/LinearMap/Defs.lean:84`; `Mathlib/RingTheory/Perfectoid/BDeRham.lean:75` and `:88`; `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118`; `Mathlib/Algebra/Homology/DerivedCategory/Ext/Map.lean:126`; `Mathlib/NumberTheory/Padics/Complex.lean:54` and `:137`; `Mathlib/FieldTheory/KrullTopology.lean:134`; `Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean:451`; `Mathlib/Topology/UniformSpace/Completion.lean:477` and `:488`; `Mathlib/Topology/Algebra/Module/ModuleTopology.lean:133`; `Mathlib/Algebra/Group/Hom/Defs.lean:975`; `Mathlib/Analysis/LocallyConvex/Barrelled.lean:122` and `:164`; `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:166`.
- Pinned Tau Ceti: 2 declarations opened — `TauCeti/CategoryTheory/Exact/ExactStructure.lean:241` and `TauCeti/CategoryTheory/Exact/Functor.lean:74`; no abelian-Ext equivalence is supplied by these exact-structure definitions.
- Supplier citations: 11 named roadmaps resolved at main or their supplied open heads; 1 precise declared gap, `G-HOM`, matches `packages/VectorBundlesAndIsocrystalsPartII/design/plan.json` and README line 100; 0 duplicated owners or dropped-id conflicts found.
- Gate: every worker check passed, including the targeted build; independent dependency output: `depcheck: 218 roadmaps, 1938 edges, 0 problem(s)`; independent Lean elaboration succeeded with exactly 2 `sorry` warnings.
- Signature/padding probes: all 3 declarations checked with `#check @name`; 0 missing binders; neither of the 2 theorems closed with `rfl`, `simp` or `infer_instance`; pinned near-matches supplied no single-lemma proof.
- Lean coverage: 2 statable headline theorems present; the remaining 6 headline statements and their missing carriers named in the module docstring; 0 sorry'd data, option overrides or added API padding.
- PR text: addition of 1 roadmap, 1338 inserted lines, 0 removed headings/declarations and 0 outside-folder paths agrees with the head; 0 contradictory description claims found.

Overlap check: read CstConjectureForDaggerVarieties (#1759), VectorBundlesAndIsocrystals (#1205), PadicHodgeTheory (#1062), PadicPeriodRings (#940), LocallyAnalyticDistributions (#854), and main's CompactOperators and PerfectoidSpaces. Classical BC, sympathetic VS and the curve equivalence belong to VectorBundlesAndIsocrystals; periods and Galois actions to PadicPeriodRings; Sen theory to PadicHodgeTheory; generic locally convex/left-heart theory to LocallyAnalyticDistributions; Banach compactoidness to CompactOperators; perfectoid/pro-étale foundations to PerfectoidSpaces. Arithmetic almost-C theory, sympathetic TVS, period comparisons, qBC and period-valued height belong here; CstConjectureForDaggerVarieties consumes them. The closest-on-main list is empty; the headings/results list adds only VectorBundlesAndIsocrystals.

Source independence: 26 passages compared with 10 sources, no copied non-forced wording or reused tables found; largest share CN25, 81 of 134 source-labelled citations before References. Contents compared with CN25 lines 21–39: independent dependency arrangement. Layer 4 combines CN25 §§4.3 and 4.5 before Layer 5's filtration/full faithfulness; §4.15 needs §4.14 and §5.4 needs §4.16. Height is separated into Layer 6, rather than preceding the TVS development as in CN25 §3.3.

## Not verifiable

- None: all cited texts and the dominant source's contents were legally readable. `G-HOM` is an explicit supplier contract, not an unavailable-source exception.

## Source issues

- **Misprint** in Fontaine03 at Théorème 6.1, printed p. 355 (line 2882): the source says the Ext dimensions have an unsigned negative sum and inserts a universal vanishing equality; it should be the alternating sum, indexed by i, with vanishing only above degree two; affects a stated result.
- **Misprint** in FF18 at Preface, Proposition 2.28(i), printed p. 23 (line 1012): the source says the unsigned sum of Ext dimensions equals the negative height product; it should be the alternating sum; affects a stated result.
- **Misprint** in CN25 at proof of Lemma 2.10, printed p. 11 (line 479): the source says the second generalized-invariant term occurs when 0≤j≤j−1; it should be 0≤j≤k−1; affects the proof.
- **Error** in CN25 at Lemma 4.9, printed p. 23 (line 1077): the source says the exp(pX) calculation applies without a prime restriction; it should be exp(pX) for odd p and an exp(4X) tower at p=2, since exp(2X) does not converge on the closed disc; affects the proof.
- **Misprint** in CN25 at proof of Lemma 4.9, printed p. 23 (line 1080): the source says the next normalized root satisfies a relation omitting the additive unit inside the p-th power; it should be (1+p^(1/p^(n+2))Y_(n+1))^p=1+p^(1/p^(n+1))Y_n; affects the proof.
- **Misprint** in CN25 at proof of Proposition 4.10, printed p. 23 (line 1102): the source says the normalized lift uses the logarithm of compatible roots of X; it should be compatible roots of E₁, whose logarithm reduces to X; affects the proof.
- **Misprint** in CN25 at proof of Lemma 4.13, printed p. 24 (line 1157): the source says to add the removed constant to the primitive; it should be subtract it, since the additive coboundary of the constant −c is c; affects the proof.
- **Misprint** in CN25 at proof of Lemma 4.13, printed p. 24 (line 1167): the source says choose i=p^r for r=v_p(k), then use coefficient b_(i,k−1); it should be i=p^(r−1) for r≥1 and b_(i,k−i), ensuring 1≤i<k and binomial valuation one; affects the proof.
- **Gap** in CN25 at proof of Proposition 4.18, printed p. 26 (line 1243): the source says the Fréchet case follows by a nuclear Fréchet inverse-limit argument; it should be justify the inverse-limit comparison for all separable Fréchet spaces admitted by the statement; affects the proof.
- **Error** in CN25 at proof of Lemma 4.19, printed p. 26 (line 1252): the source says the closed step unit ball is c-compact; it should be use compactoidness and justify the required closedness and boundedness without spherical completeness; O_C itself is not c-compact; affects the proof.
- **Misprint** in CN25 at Remark 4.20, printed p. 26 (line 1269): the source says the tensor sequence ends with the middle model followed by W₂; it should be the sequence on W₁,W₂,W₃, as in the preceding strict sequence; affects the proof.
- **Misprint** in CN25 at Remarks 4.17 and 4.21, printed pp. 25, 27 (lines 1215, 1282): the source says the pushout relation is (t^d c,cw) for the displayed map c↦cw; it should be (t^d c,−cw) with the displayed inclusions; affects a stated result.
- **Gap** in CN25 at proof of Proposition 4.22, printed p. 27 (line 1298): the source says its unrestricted m=d=1 case follows from Proposition 4.18; it should be supply the nonseparable Banach/Fréchet case, since Proposition 4.18 assumes separability; affects the proof.
- **Misprint** in CN25 at Lemma 4.24(i), printed p. 28 (line 1378): the source says Ext¹_TVS(U_d,W) is W; it should be zero, as its proof concludes at line 1415; affects a stated result.

## For the human reviewers

- none
