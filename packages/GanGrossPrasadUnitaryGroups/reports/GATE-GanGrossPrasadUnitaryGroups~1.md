The supplied head `d603998` already contains the three requested repairs. Revalidation required no additional repository edit or commit.

## H01 (CBirkbeck) — applied

The auxiliary signatures have been replaced by a headline inventory and an explicit missing-carrier account in `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/Suggested.lean:6`; `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md:205` lists the same endpoints. None is statable with only a few simple definitions at the pins: algebraic `Representation` and `Representation.IntertwiningMap` provide neither the analytic categories required by multiplicity one (agrs line 59; sun-zhu line 55) nor the actual automorphic, base-change and completed-factor carriers required by the global endpoints (bpcz line 124; bpcz line 179).

## H02 (CBirkbeck) — applied

The seven auxiliary declarations, including `algebraicBesselModel`, `componentCentralElement_character` and `unitaryConstituentCoefficient`, and all twelve computing examples were removed in `d603998`; the final `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/Suggested.lean:1` contains one import, one module docstring and an empty namespace. The model API, central-parity calculation and coefficient values remain prose specifications and Checks in `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md:354`, `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md:558` and `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md:1200`.

## H03 (CBirkbeck) — applied

Own declaration labels have become mathematical prose throughout `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md`, including the split-line condition at line 270, scalar model at line 398, central element at line 558 and constituent group at line 1220. The remaining backticked identifiers denote pinned library declarations, explicitly attributed supplier targets, file paths or the stable `GGP.8` export label; none promises an undeclared acceptance-file definition or theorem.

## Validation

Mathlib is pinned to `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti to `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; both checked-out libraries match those pins. The decisive native definitions are `Mathlib/RepresentationTheory/Basic.lean:48` (algebraic action), `Mathlib/RepresentationTheory/Intertwining.lean:36` (linear equivariance), `Mathlib/LinearAlgebra/UnitaryGroup.lean:58` (identity-form matrix group) and `TauCeti/Algebra/AlgebraicGroup/PointsFunctor.lean:58` (points of an already supplied Hopf algebra). Searching the pinned objects and their hypotheses supplies no analytic Bessel, enhanced-packet or automorphic-period carrier that would invalidate the docstring's account.

The final declaration inventory is empty: there is no `@name` for a scratch `#check` signature audit, and no retained declaration can silently lose a section hypothesis. The final module was elaborated by the build below; no mathematical hypothesis, endpoint or generality was changed in this revalidation.

Ownership was searched by object on main, in board packages, at the supplied twelve sibling heads and through the open-roadmap index. General categories, forms, theta theory, factors and spectral analysis retain their named suppliers; the relative Bessel constructions and period comparisons remain this roadmap's responsibility, consistent with TwistedAutomorphicDescents' ownership boundary and SelmerIwasawaCohomologyPartII §8.1's independent definite-period premise. No construction, supplier or dependency direction was added or moved. Cross-roadmap resolution against main `0ed4485` and the indexed open heads reports no unresolved citations or Lean names; library references were inspected directly at the pins because the resolver did not inspect pinned packages. Existing `gap:` contracts remain explicit requested extensions, rather than claims that those entire interfaces are already supplied.

The sources used for the acceptance-boundary verification are the provided legal cached versions; no additional work or source-manifest edit was required. The settled `xue-bessel` waiver remains settled.

Build command: `lake build TauCetiRoadmap.GanGrossPrasadUnitaryGroups.Suggested`; exit status 0, exact output:

```text
✔ [8976/8976] Built TauCetiRoadmap.GanGrossPrasadUnitaryGroups.Suggested (2.5s)
Build completed successfully (8976 jobs).
```

Gate exit status 0, exact summary line:

```text
gate GanGrossPrasadUnitaryGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The separate dependency-direction check exited 0 with this complete output; no UPWARD, CYCLE or moved line appeared:

```text
depcheck: 13 roadmaps, 99 edges, 0 problem(s)
```

## Adversarial mathematics pass

The following 170 statement rows record recomputed controls for the preserved definitions, conventions, targets and prose APIs, including the declarations removed by the supplied repair. These computations discriminate signs, duals, zero denominators and component counts; they do not prove the analytic headline theorems. The change column describes `d603998` relative to its parent, with no additional change in this revalidation.

| Statement | Instances tried | Computed values on both sides | Result | Change |
|---|---|---|---|---|
| Convention: quadratic étale coefficients | Split ℚ×ℚ, idempotents | (1,0)(0,1)=(0,0), although both factors are nonzero | Split algebra cannot be treated as a field | None |
| Convention: linear-first Hermitian form | ℂ line, x=i,y=1 | h(i,1)=i; c(h(1,i))=c(-i)=i | Slots fixed | Prose names |
| Convention: hyperbolic plane | e=(1,0),f=(0,1), Gram [[0,1],[1,0]] | h(e,e)=h(f,f)=0; h(e,f)=h(f,e)=1 | Excludes diag(1,1) | None |
| Convention: relevant dimension | (n,r)=(0,0),(0,1),(1,1) | n+2r+1=1,3,4 | No rank-zero exclusion | None |
| Convention: Bessel character direction | ν(h)=i | ν(h)P=iP; inverse convention gives -iP | Covariance agrees with period | None |
| Convention: normalized induction | diag(4,1) over ℝ | δ=4; δ^(1/2)=2; δ^(-1/2)=1/2 | Unnormalized/normalized distinction retained | None |
| Convention: parameter signs | degrees 1,2,3 | (-1)^(m-1)=+1,-1,+1 | Conjugate-dual sign agrees with pole sign | None |
| Convention: Asai adjoint sign | degrees 1,2 | pole signs +1,-1; adjoint signs -1,+1 | Opposite signs kept | None |
| Convention: geometric Frobenius | q=2, eigenvalues 2,3, T=1/10 | Direct-sum factor 1/((1-2/10)(1-3/10))=25/14; inverse eigenvalues give 600/551 | Inversion distinguishable | None |
| Convention: independent universes | V=W=ℂ; zero module | Tensor dimension 1×1=1; 0×1=0 | Algebraic dimension does not imply analytic structure | No carrier surrogate |
| §1.1 relevant-pair definition | W=0,V=H⊥<1>,r=1 | Complement rank 3=0+2+1; Witt index 1 | Positive-definite 3-space has Witt index 0 and fails | Prose |
| §1.1 field-form forward formula | k(x,y)=conj(x)y | k(1,i)=i=h(i,1); k(i,1)=-i=h(1,i) | Correct slot exchange | Names → prose |
| §1.1 field-form inverse formula | Same line, double exchange | k''(i,1)=-i=k(i,1) | Two exchanges give identity | Names → prose |
| §1.1 field-form isometry comparison | g multiplication by i | k(ix,iy)=k(x,y); h(ix,iy)=h(x,y) | Both preservation equations agree | Prose API |
| §1.1 field-form orthogonal comparison | S=span(e1) in ℂ² | Both orthogonals are span(e2); h(e1,e2)=k(e1,e2)=0 | Same subspace | Prose API |
| §1.1 field-form adjoint comparison | T=2 and T=i on ℂ | Adjoints 2 and -i in both conventions; inverse would be 1/2 and -i | No inverse of the adjoint introduced | Prose API |
| §1.1 split-form forward formula | v=(1,0),w=(0,1) | k(v,w)=(0,1), h(v,w)=(1,0) | Swap required | Prose API |
| §1.1 split-form inverse formula | Same v,w | Second swap gives (0,1)=k(v,w) | Inverse works | Prose API |
| §1.1 split-form identity transport | A=ℚ, identity g | (x,l)↦(x,l); identity remains 1 | No dualization of vectors | Prose API |
| §1.1 split-form composition | g=2,g'=3 | Actions (2,1/2)(3,1/3)=(6,1/6) | Composite action agrees | Prose API |
| §1.1 split-form isometry group | A=ℚ,g=2 | h((2,0),(0,1/2))=(1,0); wrong scaling gives (4,0) | Inverse dual required | Prose API |
| §1.1 split-form orthogonal comparison | S=ℚ×{0} | Orthogonal S for each slot convention; self-pairing (0,0) | Ambient perfectness permits isotropic submodules | Prose API |
| §1.1 split-form zero specialization | A=0 | #GL(0)=1; unique vector 0↦0; 0⊥=0 | Zero module allowed | Prose API |
| §1.1 relevance constructor | W=0,V=<1>, complement identity | Inclusion rank 0, complement rank 1 | Constructor has witness | Prose API |
| §1.1 relevance rank | W=0,V=H⊥<1>,r=1 | 3=0+2×1+1 | Formula unchanged | Prose API |
| §1.1 relevance isometry transport | Line isometry multiplication by -1 | h(-x,-y)=h(x,y); two transports multiply to 1 | Identity/composition preserved | Prose API |
| §1.1 relevance base change | ℚ(i)/ℚ extended to ℂ | Complement rank 2r+1=3 before and after splitting at r=1 | Rank preserved | Prose API |
| §1.1 frame extensionality | Identical line generator e=1 | All data coincide; 1=1; generator -1 gives different chosen vector | Data, not proof choices, determine frame | Prose API |
| Former splitLineFrame | ℚ: (1,1),(1,0),(2,1); 𝔽₂ and 𝔽₃ | Units T,F,T with norms 1,0,2; over 𝔽₂ only (1,1) is a unit; over 𝔽₃ (2,1) has norm 2≠0 | Both directions of nonzero norm criterion tested | Definition removed; condition retained |
| Split-frame multiplicativity API | e=(2,1),f=(3,2) over ℚ | ef=(6,2), norm 12=2×6 | Native unit law | Prose API |
| Split-frame inverse API | e=(2,1) | e⁻¹=(1/2,1), product (1,1), inverse norm 1/2 | Zero coordinates excluded | Prose API |
| §1.2 Bessel subgroup and b | r=0; split r=1 with x=2,y=3 | r=0: N=1,b=0,ν=1; r=1: b=(2,-3) | Both split coordinates needed | Prose |
| §1.2 embedded subgroup | r=0, g=2 in split GL1 | Image (diag(2,1),2), identity image (1,1) | Source and target fixed | Prose API |
| §1.2 b additivity/invariance | Split simple coordinates (2,3),(5,7) | b(uu')=(7,-10)=(2,-3)+(5,-7) | Product cross terms killed | Prose API |
| §1.2 character multiplication | ψ(t)=exp(it), simple sums 1,2 | exp(3i)=exp(i)exp(2i) | Additive b gives multiplicative ν | Prose API |
| §1.2 r=0 specialization | Empty flag | N=1,b=0,ν=1; H=diagonal U(W) | Not whole product | Prose API |
| §1.2 character extensionality | (u,g)=(u,1)(1,g) | ν(u,g)=ψ(b(u))×1 | Specified values determine character | Prose API |
| §1.3 transport definition | h↦-h on diag(1,-1) | g*Jg=J iff g*(-J)g=-J | Same group, opposite line sign | Prose |
| §1.3 identity transport | Unchanged line frame | 1↦1, ν'=ν | Identity | Prose API |
| §1.3 composite transport | Line scales 2,3 | Composite 6=3×2 | Composite | Prose API |
| §1.3 character transport | x↦2x, ψ'(x)=ψ(x/2) | ψ'(2x)=ψ(x) | Frozen ψ would give ψ(2x) | Prose API |
| §1.3 negated real forms | J and -J | Stabilizers equal; distinguished norm +1↦-1 | Sign transport kept | Prose API |
| §2.1 Bessel model definition | U1 weights (1,-1) and (1,1) | Tensor weights 0 and 2; dimensions 1 and 0 | Dual convention visible | Prose |
| §2.1 constructor | Scalar product ℓ(x⊗y)=xy, opposite weights | ℓ(zx⊗z⁻¹y)=xy=ℓ(x⊗y) | Equivariance constructor works | Prose API |
| §2.1 extensionality | ℂ⊗ℂ, evaluation at 1⊗1 | Every value xyℓ(1⊗1); zero evaluation gives zero map | Pure tensors determine map | Prose API |
| §2.1 representation transport | Scalar changes 2 and 3 | Tensor scale 6; inverse transport 1/6 | Isomorphism, not mere map | Prose API |
| §2.1 currying | Circle weights (1,-1) | Target smooth dual has weight +1; Hom dim 1 | Un-dualized target weight -1 gives dim 0 | Prose API |
| §2.1 cardinal/finrank comparison | Scalar model and zero model | Cardinal dimensions 1,0 equal finite ranks 1,0 | Finite dimension retained | Prose API |
| Former linearFirstPairing | B(i,1),B(1,i),B(0,i) | i,-i,0; native unswapped first value -i | Slots fixed; zero included | Definition removed |
| Pairing scalar API | c=i,x=y=1 | B(i,1)=i=iB(1,1); B(1,i)=-i=conj(i)B(1,1) | Sesquilinearity | Prose API |
| Pairing symmetry/positivity API | x=i,y=1; x=2i | B(i,1)=conj(B(1,i))=i; B(2i,2i)=4>0 | Positive diagonal | Prose API |
| Pairing zero API | Zero space and ℂ | B(0,x)=B(x,0)=0 | Both slots | Prose API |
| Former algebraicBesselModel | H=1,C3,S3 with scalar ν; Circle weights | ν⊗1→ν has dimension 1 for each H; Circle (1,1)→1 has dimension 0 | Algebraic model not analytic category | Abbreviation removed |
| Algebraic-model equivariance API | C4 generator acts by i on source and target | ℓ(i⊗1)=i=iℓ(1⊗1); inverse target would give -i | Correct target character | Prose API |
| Algebraic-model linearity API | ℓ1(1⊗1)=1,ℓ2(1⊗1)=i | (ℓ1+ℓ2)(1⊗1)=1+i; (2ℓ1)(1⊗1)=2 | Native linear structure | Prose API |
| Algebraic-model negative control | Fixed v,w; target -1 | ℓ(v⊗w)=-ℓ(v⊗w), hence 2ℓ(v⊗w)=0 and ℓ(v⊗w)=0 over ℂ | Wrong trivial target excluded | Prose Check |
| §2.2 distribution symmetry | Rank-one U1, norm-one z=i | c(z⁻¹)=c(-i)=i=z; inversion alone -i | Correct anti-involution | Prose label |
| §2.2 involution/anti-product | A=[[1,1],[0,1]],B=[[1,0],[1,1]] | (AB)ᵗ=[[2,1],[1,1]]=BᵗAᵗ; AᵗBᵗ=[[1,1],[1,2]] | Noncommutative control | Prose API |
| §2.2 subgroup preservation | Embedded GL1 scalar t=2 | diag(2,1)ᵗ=diag(2,1) | Preserves smaller subgroup | Prose API |
| §2.3 adjacent bound | Compact U2 standard, U1 weights -1,0,1 | Multiplicities 1,1,0, all ≤1 | No existence assertion | Prose label |
| §2.4 reduction | r=1,W=H | Auxiliary GL rank 2; W' Witt index 3, Y rank 2 | Residual W need not be anisotropic | Prose label |
| §2.4 open orbit | r=0 adjacent control, ν=1 | ν⁻¹=1; inducing character trivial on U(W) | Twist agrees at boundary; r≥1 retained for theorem | Prose API |
| §2.4 naturality | Identity intertwiner | Ind(id)=id; induced Hom map on scalar 1 is 1 | No contravariance reversal | Prose API |
| §2.5 finite-subspace injection | S=0 or dim S=1 | Required image dimensions 0 or 1; dim S=2 would contradict adjacent bound 1 | Parameter depends on S | Prose label |
| §2.5 equivariance | Invariant adjacent form under identity h | I(π(1)v,w)=I(v,w) | Scalar 1, no inverse-character drift | Prose API |
| §2.5 common half-plane | Two vectors with convergence thresholds 2,3 | Re(s)>max(2,3)=3 suffices for both | Finite, not uniform infinite, bound | Prose API |
| §2.6 odd-codimension multiplicity | W=0,r=0 character; compact negative control | Model dimensions 1 and 0; neither exceeds 1 | No replacement by equality | Prose label |
| §2.7 adjacent integrability | Compact H mass a, inverse weights; non-tempered trivial split pair | Integral a; split ∫F×1=∞ | Temperedness used | Prose label |
| §3.1 epsilon-character definition | Zero W-parameter; repeated irreducible multiplicity 2 | Empty tensor ε=1; χ(generator)=-1, χ(z)=(-1)²=+1 | Generator ≠ central element | Prose |
| §3.1 generator values | Real χ1⊕χ-1 against 1 | ε(χ1)ε(χ-1)=χ1(-1)=-1 | Constant character excluded | Prose API |
| §3.1 character law | Order-two sign generator e | χ(e+e)=χ(0)=1=χ(e)² | Multiplicative character | Prose API |
| §3.1 character extensionality | A=(Z/2)², generators values -1,+1 | Values on 0,e1,e2,e1+e2 are 1,-1,1,-1 | Determines full character | Prose API |
| §3.1 central evaluation | Singleton multiplicity 2 | χ(z)=χ(0)=1=(-1)² | Even multiplicity cancels | Prose API |
| Former componentCentralElement | Multiplicities empty,(2),(1,1),(2,3) | Coordinates empty,(0),(1,1),(0,1) | Modulo two | Definition removed |
| Former componentCentralElement_character | χ(x)=x0+x1, d=(1,1),(2,3), empty I | LHS 0,1,0; RHS 1+1=0,0+1=1,empty sum 0 | Elementary identity, not GGP headline | Theorem removed |
| Central reindexing API | d=(2,3), coordinate transposition | z=(0,1)↦(1,0); χ=sum remains 1 | Reindexed evaluation same | Prose API |
| §3.2 enhancement transport | t=-1, dimV=2,dimW=1, then repeat | Even-side generator multiplier -1, odd-side +1; two changes multiply to +1 | Labels must move | Prose label |
| §3.3 regularized form | Trivial H mass1; compact Circle weight0,weight1 | Diagonals 1; averages ∫1=1,∫z=0 | Form nonzero iff corresponding model exists in controls | Prose |
| §3.3 equivariance | ν(h)=i | L(π(h)v,w)=iL(v,w); second slot -iL(v,w) | Pairing convention kept | Prose API |
| §3.3 isometry transport | Unitary line map i | B(ix,iy)=B(x,y) | No scale change under unitary transport | Prose API |
| §3.3 rank assertion | Scalar invariant line, incompatible weight line | Ranks 1 and 0, equal multiplicities 1 and 0 | Nonzero not automatic | Prose API |
| §3.3 adjacent specialization | Circle mass1, weights k,-k | Ordinary integral 1; form value 1 | Regularization not used at r=0 | Prose API |
| §3.4 geometric multiplicity definition | Zero quasi-character; compact centralizer with no regular nilpotent orbit | c0=0, integral0=0; empty germ coefficient 0 | No 0/0 average | Prose |
| §3.4 linearity | θ=0, scalars 2,3 | mgeom(2×0+3×0)=0=2×0+3×0 | Zero witness | Prose API |
| §3.4 discriminant ratio | W=ℂ,x=-1; x=1 | Moving determinant norms 4 and empty determinant1; inverse 1/4 wrong | Discriminant direction kept | Prose API |
| §3.4 semisimple descent | Identity on zero residual space | Empty Jacobian determinant1; torus mass1 | Normalization has unit base case | Prose API |
| §3.4 induction | Scalar germ factor1 | 1×mgeom(θ)=mgeom(θ); θ=0 gives0=0 | No extra factor at identity | Prose API |
| §3.5 local trace formula | f=0, hence θf=0 | J(0)=0=mgeom(0); Lie side also0 | Linear boundary consistent | Prose label |
| §3.6 packet Fourier identity | μ=ε and μ=-ε; A=Z/2 values(1,-1) | Prefactor (1+με)/2=1 or0; inverse Fourier mass(0,1) | Correct inner form and enhancement | Prose label |
| §3.7 nonarchimedean packet uniqueness | W=0; Fourier A=Z/2 with nontrivial character | Distinguished generic multiplicity1; delta masses0,1 sum1 | Wrong enhancement gives0 | Prose label |
| §3.8 theta reduction definition | Counts (a,b)=(2,1) | Intermediate (1,1), lower (1,0); sum3→1 | Conditional companion lifts kept | Prose |
| §3.8 oscillator conventions | z=i in ψC(z)=exp(2π(z-conj(z))) | ψC(i)=exp(4πi)=1; z=i/4 gives exp(πi)=-1 | Sign/two-term normalization | None |
| §3.8 integrated seesaw form | U0 mass1; U1 weights k and k+1 against oscillator k | Form values1; averages1 and0 | Conjugate oscillator essential | Prose |
| §3.8 seesaw sesquilinearity | Scalar i in first/second argument | i×1=i; conj(i)×1=-i | Pairing convention | Prose API |
| §3.8 seesaw continuity | U0 scalar form | F(x,y)=x conj(y), bound absF=absx absy; x=2,y=3 gives6=6 | Complete finite-dimensional control | Prose API |
| §3.8 first seesaw | Compact pair V=<-1,-1>,W=<-1>, standard⊗weight1 | Weights2,1 give m=0; equivalence requires companion-zero or F=0 | No unconditional nonzero conclusion | Prose API |
| §3.8 second seesaw | Counts (2,1) to (1,0) | Lower sum1; zero companion gives lower form0 | Nonzero-lift conjunct retained | Prose API |
| §3.8 equal-rank epsilon criterion | U0 | Empty generator list, epsilon product1, form1 | Base criterion true | Prose API |
| §3.9 real tempered theorem | Compact highest weight(1,0), paired weights -1,1 | Dual weights1,-1: interlacing T,F; multiplicities1,0 | Both directions discriminate | Prose label |
| §3.10 split prediction | GL1×GL0; trivial GL2 at infinity | Scalar model dim1; trivial GL2 Whittaker dim0 | Temperedness cannot become unitarity | Prose |
| §3.10 prediction unfolding | Rank-zero smaller factor | finrank1=1 | Same proposition | Prose API |
| §3.10 prediction transport | Identity representation and frame | m unchanged1=1 | No new labeling | Prose API |
| §3.10 singleton packet | GL1 character | Packet cardinal1; no nontrivial component coordinate | No enhancement choice | Prose API |
| §3.11 split proved range | n=0,r=0; GL3 generic principal series vs trivial N-character | Scalar dimension1; generic quotient1 versus ordinary Jacquet dimension3!=6 | Higher archimedean gap not turned into theorem | Prose label |
| §4.1 global period definition | ν(h)=i; r=0 | Translation iP; r=0 unipotent factor1 | Character and empty factor consistent | Prose |
| §4.1 linearity | f=0; scalars2,3 | P(2×0+3×0)=0=2P(0)+3P(0) | Linear functional | Prose API |
| §4.1 right translation | ν(h)=i | P(R(h)f)=iP(f) | Inverse weighting retained | Prose API |
| §4.1 adjacent period | r=0 | ν=1,N=1, integrand fV(t)fW(t) | Bilinear product, not conjugate pairing | Prose API |
| §4.1 rational isometry transport | Identity rational isometry | Quotient identity, measure factor1, period factor1 | Domain specified | Prose API |
| §4.2 local obstruction/factorization | ℓv(fv)=2,ℓw(fw)=3; one zero functional | P/P(f0)=6; zero local functional gives0 | No division by zero period | Prose label |
| §4.3 tensor L-representation | (a,b)=(2,1),(1,0) | Dimensions2ab=4,0; zero factor L=1 | Index-two induction retained | Prose |
| §4.3 restriction | (a,b)=(2,1) | Two summands dimensions2+2=4 | Not connected tensor alone | Prose API |
| §4.3 inner-form transport | Form h↦-h, same(a,b) | dimR=4 before/after; parameter formula unchanged | Representation independent of form | Prose API |
| §4.3 local factor comparison | Split unramified tensor with scalar eigenvalue -1,q=2,T=1/2 | Two factors(1+1/2)⁻¹ each, product4/9 on both induced and E-local sides | Both split factors present | Prose API |
| §4.4 fixed-pair conjecture | W=0; local failure | L-factor1; with local failure RHS false and independent obstruction gives P=0 | Conjectural equivalence retained as proposition | Prose |
| §4.4 unfolding | Local models all present, central value0 | RHS=T∧F=F; proposition predicts P=0 | L-value condition not dropped | Prose API |
| §4.4 transport | Identity isometry | P≠0 and same local/L conditions identical | Fixed pair retained | Prose API |
| §4.4 failure consequence | One absent local model | RHS=F; P∣π=0 independently by §4.2 | No converse from local data alone | Prose API |
| §5.1 normalizers | Split q=2,n=1, Satake1,-1 | Δ2=8/3, central E-factor4, adjoint32/9, quotient3 | Nonzero local denominator | Prose |
| §5.1 local formula | Same data | C=(8/3)×4/(32/9)=3 | Formula consistent | Prose API |
| §5.1 local nonvanishing | Same data | C=3≠0 | No global central nonzero assumption | Prose API |
| §5.1 central-zero iff | Symbolic nonzero denominator D and nonzero Δ; central value0 | C=Δ×0/D=0; nonzero L has nonzero product | Both directions use proved Δ,D≠0 | Prose API |
| §5.1 adjoint/Asai comparison | m=1 | Adjoint sign -1, opposite pole sign+1 | Conventions agree | Prose API |
| §5.1a split Whittaker identity | λ(W)=1,a=2,b=3 | Raw diagonal ab absλ²=6 | Haar and pairing scalings explicit | Prose label |
| §5.1a positive test | λ/L=1,L=2,a=2,b=3 | Raw diagonal ab absL²=24>0 | Nonzero local L required | Prose API |
| §5.1a rescaling | Same λ=1 | Reference1→scaled6; λ fixed1 | No unrecorded change of reference measure | Prose API |
| §5.2 normalized local form | Compact massa=2,C=3,B(1,1)=1 | α=2/3,q=2/3; α(0,0)=0 | q only on nonzero vectors | Prose |
| §5.2 sesquilinearity/invariance | α(1,1)=2/3,c=i | α(i,1)=2i/3; α(1,i)=-2i/3 | Conjugation correct | Prose API |
| §5.2 extensionality | Infinite completed tensor X, A proper dense, algebraic ℓ killing A | β(A,A)=0 but β(x,x)=1 for ℓ(x)=1 | Continuity indispensable at infinity | Prose API |
| §5.2 nonzero iff model | Circle inverse weights vs incompatible weights | Integral1 vs0, model dimensions1 vs0 | Split/non-split routes remain distinct | Prose API |
| §5.2 source comparison | Same C=3,raw2 | α=raw/C=2/3=P-natural | Measures/pairing fixed | Prose API |
| §5.3 spherical identity | Split dyadic q=2 and nonsplit dyadic compactH | Split raw3=C×1×1, q=1; nonsplit raw1=C×1×1, C=1,q=1 | No good-prime restriction | Prose label |
| §5.3 almost-everywhere corollary | Good place volume2 | q=volK=2; volume-one reference gives1 | No unconditional q=1 | Prose API |
| §5.4 rescaling | Pairing×2, vector×2,Haar×2; two Haar scales2,1/2 | q unchanged; α/norm both×4; q×2; product multiplier1 | Global H scale2 gives squared period×4 | Prose label |
| §5.5 all-place product definition | Exceptional values2,3 and volume-one tail | Product6; introduce zero gives0 | Finite zero retained | Prose |
| §5.5 finite expression | S={v,w},qv=2,qw=3,tail1 | 2×3×1=6 | Tail independent | Prose API |
| §5.5 enlarge S | Good place volume2 | 3×(2×1)=(3×2)×1=6 | Same value | Prose API |
| §5.5 local zero | One qv=0, other3 | 0×3=0 | No reciprocal of period | Prose API |
| §5.5 pairing scales | Pairing multiplier2 | α/norm becomes2α/(2norm)=α/norm | Product invariant | Prose API |
| §6.1 Whittaker relative periods | n=1; leading-pole orders r=1 and r=2 | Asai signs+,-; pole removal exponents1,2 | Actual constituent counts kept | Prose |
| §6.1 lambda central shift | s=0 | s+1/2=1/2 | Central argument correct | Prose API |
| §6.1 beta formula | n=1 and η(detg1)=η(detg2)=-1 | η(detg1)²η(detg2)=-1 | Degree-dependent character | Prose API |
| §6.1 norm formula | W=0 | Integral absW²=0; norm0 | No norm quotient on basis zero vectors | Prose API |
| §6.1 eta formula | n=2, determinant signs -1,-1 | (-1)³(-1)²=-1 | Opposite exponents discriminate | Prose API |
| §6.1 enlarge S | One nonzero local factorc=2 | Leading coefficient divided2 and local integral multiplied2: total multiplier1 | No extra factor | Prose API |
| §6.2 global relative characters | One-dimensional toy smooth basis e,Pe=2,σ(f)e=3e | J=3×2×2=12 | Basis normalization visible | Prose |
| §6.2 basis independence | e↦2e with norm quotient | Numerator×4, denominator×4; value12 | Nonzero basis vectors required | Prose API |
| §6.2 positivity | σ(f)=3 on e,Pe=2 | J(f*f*)=abs3² abs2²=36≥0 | Convolution adjoint used | Prose API |
| §6.2 local trace realization | H trivial, rank-one x=2,y=3,linear-firstB | TrT=6; ∫B(x,y)=6=Cα(x,y) | Order and pairing fixed | Prose API |
| §6.2 realization transport | Unitary scalar i | Pe and its conjugate pick i,-i; product multiplier1 | Relative character invariant | Prose API |
| §6.3 star-generic contribution | Counts(1,1),(2,1) | Coefficients2⁻²=1/4,2⁻³=1/8 | Full split centre counted | Prose label |
| Former unitaryConstituentSigns | Counts(1,1),(2,1),(0,0) | Orders4,8,1=2²,2³,2⁰ | No diagonal quotient | Abbreviation removed |
| Former unitaryConstituentCoefficient | Same finite counts | Coefficients1/4,1/8,1; order×coefficient=1 in each case | Denominators4,8,1≠0 | Definition removed |
| Constituent coordinate law/reindex API | (1,0)+(0,1) in(Z/2)²; swap | Sum(1,1); swap fixes cardinal4 | Native group structure | Prose API |
| Constituent order API | Empty and one coordinate | 2⁰=1>0,2¹=2>0 | No division by zero | Prose API |
| Constituent coefficient reindex API | Counts(2,1)↔(1,2) | 2³=8 both, inverse1/8 both | Order independent of indexing | Prose API |
| §6.4 isolated comparison | Three constituents,IΠ=8 in scalar coefficient control | Right coefficient gives1; fixed1/4 gives2 | Sum over actual realizations retained | Prose label |
| §6.4 measure factors | ΔH'=2,ΔGR=3,ΔHh=5 | GL test multiplier6; unitary test multiplier25 | Factors not conflated | Prose API |
| §6.4 enlarge S | Good spherical transfer | Local unit1 maps to unit1 with its volume; total factor1 | Normalized transfer retained | Prose API |
| §6.5 Euler identity | Counts(2,1); one missing local model | Coefficient1/8; missing model gives Jglobal=0 and RHS0 | Never divide by relative character | Prose label |
| §7.1 adjacent global nonvanishing | n=1; central value0 in implication control | 0≠0 is F; theorem permits no period witness; wrong-inner-form period can remain0 when existential true elsewhere | Existential form retained | Prose label |
| §7.2 stable specialization | Single constituent each, n=2 | rtotal=2,group order4,coefficient1/4 | Source n>1 retained | Prose label |
| §7.3 refined proposition | Counts(1,1),(2,1); zero vector | Coefficients1/4,1/8; zero vector norm0 and quotient excluded | Defined proposition not a premise | Prose |
| §7.3 unfolding | Pure f with zero period and central value0 | Left0/positive=0; RHS0 | Zero period permitted | Prose API |
| §7.3 polarization | P(x)=1,P(y)=i | Mixed value P(x)conjP(y)=-i; absP(x+y)²=2 | Pairing linear first; no mixed denominator | Prose API |
| §7.3 rescaling | Vector×2,local pairing×2 | Left4/4=1 times old; local ratio2/2=1 times old | Fixed measure identity retained | Prose API |
| §7.4 GGP.8 | Constituent counts(1,1),(2,1),Lcentral=0 | Coefficients1/4,1/8; central0 makes RHS0 and squared period0 | All-place target unchanged | Prose label |
| §7.4 proves refined proposition | Same nonzero vector and factors | Displayed sides literally identical; coefficient2⁻rtotal=1/absS | No assumption containing conclusion | Prose API |
| §7.4 stable coefficient | Single constituent per degree | absS=4, inverse1/4 | Agrees with stable source | Prose API |
| §7.4 downstream export | Scale f by2,Haar factors2 and1/2 | Vector quotient multiplier4/4=1; local product multiplier1 | Complete normalization exported | Prose API |
