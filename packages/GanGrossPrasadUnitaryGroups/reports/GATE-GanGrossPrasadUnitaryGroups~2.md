## H01 (CBirkbeck) — applied

The arbitrary-odd-codimension global assertion is now described as proved in the literature, with the discrete Hermitian weak-base-change hypothesis and the fixed-pair deduction distinguished from the existential theorem in `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md:3`, `:942` and `:946`, and the same status in `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/Suggested.lean:46`. The evidence is bpc-bessel line 268–284 and line 352–379 (Theorems 1.3.3.1 and 1.3.6.1, Remark 1.3.6.2(3)); the general-r formal proof and additional Eisenstein-to-Bessel comparison belong to GanGrossPrasadUnitaryGroups, Part II, while the adjacent theorem targets retain their scope.

## H02 (CBirkbeck) — applied

The contracts now use EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4 as the shared carrier owner, compare ModularityAndLanglandsExtensions §§3.12/3.16 after both suppliers, and retain the CM boundary, UnitaryClassificationInputs, TWFL and Trace inputs until the stated extensions discharge them (`TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md:17`, `:137`, `:141`, `:143`, `:145`, `:149`). Section 3.1 (`:564`, with Checks at `:582`–`:584`) identifies the nonsplit refined group with A_φ and the quasi-split quotient with A_φ/⟨z_φ⟩, preserving Whittaker/inner-twist transport: in rank one their orders are 2 and 1, respectively, and χ(z_φ)=−1 cannot descend (kmsw line 1074–1113, line 2578–2619; bp-refined line 2224–2225).

## H03 (CBirkbeck) — applied

The nonexistent AL3 declaration names have been replaced throughout by the surviving whittaker-model, rs-local-factor and normalized-rs-period targets and their mathematical requirements (`TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md:179`, `:181`, `:842`, `:1014`, `:1070`). AutomorphicLFunctionsAndLocalFactors at 5d22a23, those anchors, supplies the realization, entire normalized quotient, nonzero tests and spherical value 1; the opposite characters, continuous realizations, tempered convergence region and differential-Haar conversion are retained.

## Validation

Committed as `db8ad41` — `GanGrossPrasadUnitaryGroups: review repairs (global status and shared supplier interfaces)`. Only `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md` and `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/Suggested.lean` changed; the worktree is clean and no push was made.

The targeted build exited 0 with this exact output:

```text
✔ [8976/8976] Built TauCetiRoadmap.GanGrossPrasadUnitaryGroups.Suggested (3.5s)
Build completed successfully (8976 jobs).
```

The final gate against origin/main exited 0 with this exact summary line:

```text
gate GanGrossPrasadUnitaryGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The separate dependency-direction check with the supplied merge order and `--movable` exited 0 with this complete output; there was no UPWARD, CYCLE or moved line:

```text
depcheck: 26 roadmaps, 230 edges, 0 problem(s)
```

The declaration-signature audit found zero declarations in the final acceptance module. The list of `#check @name` commands is therefore empty: there is no retained definition or admitted declaration that can lose a section hypothesis; the targeted build elaborated the final module, and README/Lean have the same missing-carrier inventory and status distinction.

Mathlib and Tau Ceti were checked at the manifest pins `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The decisive native definitions are `Representation := G →* V →ₗ[k] V` in `Mathlib/RepresentationTheory/Basic.lean:48`, the linear map with an intertwining equation in `Mathlib/RepresentationTheory/Intertwining.lean:36`, `Nondegenerate := SeparatingLeft B ∧ SeparatingRight B` in `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean:595`, the identity-form matrix group in `Mathlib/LinearAlgebra/UnitaryGroup.lean:58`, and the convolution points functor in `TauCeti/Algebra/AlgebraicGroup/PointsFunctor.lean:150`. These definitions do not supply a smooth admissible/Casselman–Wallach category, an enhanced unitary correspondence or an automorphic Bessel-period carrier. Searching these objects at both pins found no missing analytic carrier expressible by a few simple definitions that would make another headline statable.

## Ownership, citations and sources

The operative supplier sections were read at the indexed heads: EndoscopicTransferAndUnitaryTraceComparison 40d60b6, ModularityAndLanglandsExtensions 2d70821 and AutomorphicLFunctionsAndLocalFactors 5d22a23; main is a07e202. The general-category, form, tensor, theta and measure boundaries were checked against their cited supplier sections; the comparison here is necessary because it follows both classification suppliers and computes the relative epsilon normalization, while the parameter/inner-twist/Langlands-packet carriers remain shared. No supplier is required to depend on a later supplier, no general correspondence is planned a second time, no declaration name is duplicated, and no foundational ownership was moved down.

Object searches covered main, the indexed open roadmap heads, the board packages and all 25 explicitly supplied sibling roadmap folders. The SelmerIwasawaCohomologyPartII contracts corroborate the same unitary carrier owner; the board continuation EndoscopicTransferAndUnitaryTraceComparisonPartII concerns equal-rank Friedberg–Jacquet endoscopy, and ModularityAndLanglandsExtensionsPartII concerns symmetric-power functoriality, so neither is a second owner of this relative Bessel comparison. The period and arithmetic applications create no supplier edge here. Citation resolution against main and 330 indexed open roadmap heads reports no unresolved cross-roadmap citations or Lean names; the native-library checks above were made directly at the pins, since that resolver does not search those packages.

The new legal sources are bpc-bessel (the author manuscript linked in References, sha256 `82167fac311311f0f4dd624eb5143c8c2330004d5d79fc34e140ee47b137959b`) and kmsw (arXiv v1, sha256 `0084fd8b65f3b74d0053400f2254b3ff6a0e5a5c8d6debb511eb6fad65a6d5fe`). Locators refer to the exact versions read: bpc-bessel pp. 7, 9 and kmsw pp. 27–28, 62, 79–81; no source passages were copied. Their registration records are preserved in the scratch source manifest for the worker; the package manifest was left untouched under the two-file edit restriction. All source requests were resolved; the xue-bessel waiver remains settled.

## Adversarial mathematics pass

The table records recomputed values for the retained mathematical statements and their prose APIs; subsequent rows record the new comparisons and supplier-contract controls. Scalar, finite-group and zero-test controls check signs, maps, normalizations and quantifier boundaries, and are not proofs of the analytic theorems; those claims retain their cited sources and explicit supplier obligations.

| Statement | Instances tried | Computed values on both sides | Result | Change |
|---|---|---|---|---|
| Convention: quadratic étale coefficients | Split ℚ×ℚ, idempotents | (1,0)(0,1)=(0,0), although both factors are nonzero | Split algebra cannot be treated as a field | Preserved |
| Convention: linear-first Hermitian form | ℂ line, x=i,y=1 | h(i,1)=i; c(h(1,i))=c(-i)=i | Slots fixed | Preserved |
| Convention: hyperbolic plane | e=(1,0),f=(0,1), Gram [[0,1],[1,0]] | h(e,e)=h(f,f)=0; h(e,f)=h(f,e)=1 | Excludes diag(1,1) | Preserved |
| Convention: relevant dimension | (n,r)=(0,0),(0,1),(1,1) | n+2r+1=1,3,4 | No rank-zero exclusion | Preserved |
| Convention: Bessel character direction | ν(h)=i | ν(h)P=iP; inverse convention gives -iP | Covariance agrees with period | Preserved |
| Convention: normalized induction | diag(4,1) over ℝ | δ=4; δ^(1/2)=2; δ^(-1/2)=1/2 | Unnormalized/normalized distinction retained | Preserved |
| Convention: parameter signs | degrees 1,2,3 | (-1)^(m-1)=+1,-1,+1 | Conjugate-dual sign agrees with pole sign | Preserved |
| Convention: Asai adjoint sign | degrees 1,2 | pole signs +1,-1; adjoint signs -1,+1 | Opposite signs kept | Preserved |
| Convention: geometric Frobenius | q=2, eigenvalues 2,3, T=1/10 | Direct-sum factor 1/((1-2/10)(1-3/10))=25/14; inverse eigenvalues give 600/551 | Inversion distinguishable | Preserved |
| Convention: independent universes | V=W=ℂ; zero module | Tensor dimension 1×1=1; 0×1=0 | Algebraic dimension does not imply analytic structure | Preserved |
| §1.1 relevant-pair definition | W=0,V=H⊥<1>,r=1 | Complement rank 3=0+2+1; Witt index 1 | Positive-definite 3-space has Witt index 0 and fails | Preserved |
| §1.1 field-form forward formula | k(x,y)=conj(x)y | k(1,i)=i=h(i,1); k(i,1)=-i=h(1,i) | Correct slot exchange | Preserved |
| §1.1 field-form inverse formula | Same line, double exchange | k''(i,1)=-i=k(i,1) | Two exchanges give identity | Preserved |
| §1.1 field-form isometry comparison | g multiplication by i | k(ix,iy)=k(x,y); h(ix,iy)=h(x,y) | Both preservation equations agree | Preserved |
| §1.1 field-form orthogonal comparison | S=span(e1) in ℂ² | Both orthogonals are span(e2); h(e1,e2)=k(e1,e2)=0 | Same subspace | Preserved |
| §1.1 field-form adjoint comparison | T=2 and T=i on ℂ | Adjoints 2 and -i in both conventions; inverse would be 1/2 and -i | No inverse of the adjoint introduced | Preserved |
| §1.1 split-form forward formula | v=(1,0),w=(0,1) | k(v,w)=(0,1), h(v,w)=(1,0) | Swap required | Preserved |
| §1.1 split-form inverse formula | Same v,w | Second swap gives (0,1)=k(v,w) | Inverse works | Preserved |
| §1.1 split-form identity transport | A=ℚ, identity g | (x,l)↦(x,l); identity remains 1 | No dualization of vectors | Preserved |
| §1.1 split-form composition | g=2,g'=3 | Actions (2,1/2)(3,1/3)=(6,1/6) | Composite action agrees | Preserved |
| §1.1 split-form isometry group | A=ℚ,g=2 | h((2,0),(0,1/2))=(1,0); wrong scaling gives (4,0) | Inverse dual required | Preserved |
| §1.1 split-form orthogonal comparison | S=ℚ×{0} | Orthogonal S for each slot convention; self-pairing (0,0) | Ambient perfectness permits isotropic submodules | Preserved |
| §1.1 split-form zero specialization | A=0 | #GL(0)=1; unique vector 0↦0; 0⊥=0 | Zero module allowed | Preserved |
| §1.1 relevance constructor | W=0,V=<1>, complement identity | Inclusion rank 0, complement rank 1 | Constructor has witness | Preserved |
| §1.1 relevance rank | W=0,V=H⊥<1>,r=1 | 3=0+2×1+1 | Formula unchanged | Preserved |
| §1.1 relevance isometry transport | Line isometry multiplication by -1 | h(-x,-y)=h(x,y); two transports multiply to 1 | Identity/composition preserved | Preserved |
| §1.1 relevance base change | ℚ(i)/ℚ extended to ℂ | Complement rank 2r+1=3 before and after splitting at r=1 | Rank preserved | Preserved |
| §1.1 frame extensionality | Identical line generator e=1 | All data coincide; 1=1; generator -1 gives different chosen vector | Data, not proof choices, determine frame | Preserved |
| Split-frame multiplicativity API | e=(2,1),f=(3,2) over ℚ | ef=(6,2), norm 12=2×6 | Native unit law | Preserved |
| Split-frame inverse API | e=(2,1) | e⁻¹=(1/2,1), product (1,1), inverse norm 1/2 | Zero coordinates excluded | Preserved |
| §1.2 Bessel subgroup and b | r=0; split r=1 with x=2,y=3 | r=0: N=1,b=0,ν=1; r=1: b=(2,-3) | Both split coordinates needed | Preserved |
| §1.2 embedded subgroup | r=0, g=2 in split GL1 | Image (diag(2,1),2), identity image (1,1) | Source and target fixed | Preserved |
| §1.2 b additivity/invariance | Split simple coordinates (2,3),(5,7) | b(uu')=(7,-10)=(2,-3)+(5,-7) | Product cross terms killed | Preserved |
| §1.2 character multiplication | ψ(t)=exp(it), simple sums 1,2 | exp(3i)=exp(i)exp(2i) | Additive b gives multiplicative ν | Preserved |
| §1.2 r=0 specialization | Empty flag | N=1,b=0,ν=1; H=diagonal U(W) | Not whole product | Preserved |
| §1.2 character extensionality | (u,g)=(u,1)(1,g) | ν(u,g)=ψ(b(u))×1 | Specified values determine character | Preserved |
| §1.3 transport definition | h↦-h on diag(1,-1) | g*Jg=J iff g*(-J)g=-J | Same group, opposite line sign | Preserved |
| §1.3 identity transport | Unchanged line frame | 1↦1, ν'=ν | Identity | Preserved |
| §1.3 composite transport | Line scales 2,3 | Composite 6=3×2 | Composite | Preserved |
| §1.3 character transport | x↦2x, ψ'(x)=ψ(x/2) | ψ'(2x)=ψ(x) | Frozen ψ would give ψ(2x) | Preserved |
| §1.3 negated real forms | J and -J | Stabilizers equal; distinguished norm +1↦-1 | Sign transport kept | Preserved |
| §2.1 Bessel model definition | U1 weights (1,-1) and (1,1) | Tensor weights 0 and 2; dimensions 1 and 0 | Dual convention visible | Preserved |
| §2.1 constructor | Scalar product ℓ(x⊗y)=xy, opposite weights | ℓ(zx⊗z⁻¹y)=xy=ℓ(x⊗y) | Equivariance constructor works | Preserved |
| §2.1 extensionality | ℂ⊗ℂ, evaluation at 1⊗1 | Every value xyℓ(1⊗1); zero evaluation gives zero map | Pure tensors determine map | Preserved |
| §2.1 representation transport | Scalar changes 2 and 3 | Tensor scale 6; inverse transport 1/6 | Isomorphism, not mere map | Preserved |
| §2.1 currying | Circle weights (1,-1) | Target smooth dual has weight +1; Hom dim 1 | Un-dualized target weight -1 gives dim 0 | Preserved |
| §2.1 cardinal/finrank comparison | Scalar model and zero model | Cardinal dimensions 1,0 equal finite ranks 1,0 | Finite dimension retained | Preserved |
| Pairing scalar API | c=i,x=y=1 | B(i,1)=i=iB(1,1); B(1,i)=-i=conj(i)B(1,1) | Sesquilinearity | Preserved |
| Pairing symmetry/positivity API | x=i,y=1; x=2i | B(i,1)=conj(B(1,i))=i; B(2i,2i)=4>0 | Positive diagonal | Preserved |
| Pairing zero API | Zero space and ℂ | B(0,x)=B(x,0)=0 | Both slots | Preserved |
| Algebraic-model equivariance API | C4 generator acts by i on source and target | ℓ(i⊗1)=i=iℓ(1⊗1); inverse target would give -i | Correct target character | Preserved |
| Algebraic-model linearity API | ℓ1(1⊗1)=1,ℓ2(1⊗1)=i | (ℓ1+ℓ2)(1⊗1)=1+i; (2ℓ1)(1⊗1)=2 | Native linear structure | Preserved |
| Algebraic-model negative control | Fixed v,w; target -1 | ℓ(v⊗w)=-ℓ(v⊗w), hence 2ℓ(v⊗w)=0 and ℓ(v⊗w)=0 over ℂ | Wrong trivial target excluded | Preserved |
| §2.2 distribution symmetry | Rank-one U1, norm-one z=i | c(z⁻¹)=c(-i)=i=z; inversion alone -i | Correct anti-involution | Preserved |
| §2.2 involution/anti-product | A=[[1,1],[0,1]],B=[[1,0],[1,1]] | (AB)ᵗ=[[2,1],[1,1]]=BᵗAᵗ; AᵗBᵗ=[[1,1],[1,2]] | Noncommutative control | Preserved |
| §2.2 subgroup preservation | Embedded GL1 scalar t=2 | diag(2,1)ᵗ=diag(2,1) | Preserves smaller subgroup | Preserved |
| §2.3 adjacent bound | Compact U2 standard, U1 weights -1,0,1 | Multiplicities 1,1,0, all ≤1 | No existence assertion | Preserved |
| §2.4 reduction | r=1,W=H | Auxiliary GL rank 2; W' Witt index 3, Y rank 2 | Residual W need not be anisotropic | Preserved |
| §2.4 open orbit | r=0 adjacent control, ν=1 | ν⁻¹=1; inducing character trivial on U(W) | Twist agrees at boundary; r≥1 retained for theorem | Preserved |
| §2.4 naturality | Identity intertwiner | Ind(id)=id; induced Hom map on scalar 1 is 1 | No contravariance reversal | Preserved |
| §2.5 finite-subspace injection | S=0 or dim S=1 | Required image dimensions 0 or 1; dim S=2 would contradict adjacent bound 1 | Parameter depends on S | Preserved |
| §2.5 equivariance | Invariant adjacent form under identity h | I(π(1)v,w)=I(v,w) | Scalar 1, no inverse-character drift | Preserved |
| §2.5 common half-plane | Two vectors with convergence thresholds 2,3 | Re(s)>max(2,3)=3 suffices for both | Finite, not uniform infinite, bound | Preserved |
| §2.6 odd-codimension multiplicity | W=0,r=0 character; compact negative control | Model dimensions 1 and 0; neither exceeds 1 | No replacement by equality | Preserved |
| §2.7 adjacent integrability | Compact H mass a, inverse weights; non-tempered trivial split pair | Integral a; split ∫F×1=∞ | Temperedness used | Preserved |
| §3.1 epsilon-character definition | Zero W-parameter; repeated irreducible multiplicity 2 | Empty tensor ε=1; χ(generator)=-1, χ(z)=(-1)²=+1 | Generator ≠ central element | H02: shared carrier and central restriction |
| §3.1 generator values | Real χ1⊕χ-1 against 1 | ε(χ1)ε(χ-1)=χ1(-1)=-1 | Constant character excluded | H02: shared carrier and central restriction |
| §3.1 character law | Order-two sign generator e | χ(e+e)=χ(0)=1=χ(e)² | Multiplicative character | H02: shared carrier and central restriction |
| §3.1 character extensionality | A=(Z/2)², generators values -1,+1 | Values on 0,e1,e2,e1+e2 are 1,-1,1,-1 | Determines full character | H02: shared carrier and central restriction |
| §3.1 central evaluation | Singleton multiplicity 2 | χ(z)=χ(0)=1=(-1)² | Even multiplicity cancels | H02: shared carrier and central restriction |
| Central reindexing API | d=(2,3), coordinate transposition | z=(0,1)↦(1,0); χ=sum remains 1 | Reindexed evaluation same | Preserved |
| §3.2 enhancement transport | t=-1, dimV=2,dimW=1, then repeat | Even-side generator multiplier -1, odd-side +1; two changes multiply to +1 | Labels must move | H02: shared carrier and central restriction |
| §3.3 regularized form | Trivial H mass1; compact Circle weight0,weight1 | Diagonals 1; averages ∫1=1,∫z=0 | Form nonzero iff corresponding model exists in controls | Preserved |
| §3.3 equivariance | ν(h)=i | L(π(h)v,w)=iL(v,w); second slot -iL(v,w) | Pairing convention kept | Preserved |
| §3.3 isometry transport | Unitary line map i | B(ix,iy)=B(x,y) | No scale change under unitary transport | Preserved |
| §3.3 rank assertion | Scalar invariant line, incompatible weight line | Ranks 1 and 0, equal multiplicities 1 and 0 | Nonzero not automatic | Preserved |
| §3.3 adjacent specialization | Circle mass1, weights k,-k | Ordinary integral 1; form value 1 | Regularization not used at r=0 | Preserved |
| §3.4 geometric multiplicity definition | Zero quasi-character; compact centralizer with no regular nilpotent orbit | c0=0, integral0=0; empty germ coefficient 0 | No 0/0 average | Preserved |
| §3.4 linearity | θ=0, scalars 2,3 | mgeom(2×0+3×0)=0=2×0+3×0 | Zero witness | Preserved |
| §3.4 discriminant ratio | W=ℂ,x=-1; x=1 | Moving determinant norms 4 and empty determinant1; inverse 1/4 wrong | Discriminant direction kept | Preserved |
| §3.4 semisimple descent | Identity on zero residual space | Empty Jacobian determinant1; torus mass1 | Normalization has unit base case | Preserved |
| §3.4 induction | Scalar germ factor1 | 1×mgeom(θ)=mgeom(θ); θ=0 gives0=0 | No extra factor at identity | Preserved |
| §3.5 local trace formula | f=0, hence θf=0 | J(0)=0=mgeom(0); Lie side also0 | Linear boundary consistent | Preserved |
| §3.6 packet Fourier identity | μ=ε and μ=-ε; A=Z/2 values(1,-1) | Prefactor (1+με)/2=1 or0; inverse Fourier mass(0,1) | Correct inner form and enhancement | H02: shared carrier and central restriction |
| §3.7 nonarchimedean packet uniqueness | W=0; Fourier A=Z/2 with nontrivial character | Distinguished generic multiplicity1; delta masses0,1 sum1 | Wrong enhancement gives0 | H02: shared carrier and central restriction |
| §3.8 theta reduction definition | Counts (a,b)=(2,1) | Intermediate (1,1), lower (1,0); sum3→1 | Conditional companion lifts kept | Preserved |
| §3.8 oscillator conventions | z=i in ψC(z)=exp(2π(z-conj(z))) | ψC(i)=exp(4πi)=1; z=i/4 gives exp(πi)=-1 | Sign/two-term normalization | Preserved |
| §3.8 integrated seesaw form | U0 mass1; U1 weights k and k+1 against oscillator k | Form values1; averages1 and0 | Conjugate oscillator essential | Preserved |
| §3.8 seesaw sesquilinearity | Scalar i in first/second argument | i×1=i; conj(i)×1=-i | Pairing convention | Preserved |
| §3.8 seesaw continuity | U0 scalar form | F(x,y)=x conj(y), bound absF=absx absy; x=2,y=3 gives6=6 | Complete finite-dimensional control | Preserved |
| §3.8 first seesaw | Compact pair V=<-1,-1>,W=<-1>, standard⊗weight1 | Weights2,1 give m=0; equivalence requires companion-zero or F=0 | No unconditional nonzero conclusion | Preserved |
| §3.8 second seesaw | Counts (2,1) to (1,0) | Lower sum1; zero companion gives lower form0 | Nonzero-lift conjunct retained | Preserved |
| §3.8 equal-rank epsilon criterion | U0 | Empty generator list, epsilon product1, form1 | Base criterion true | Preserved |
| §3.9 real tempered theorem | Compact highest weight(1,0), paired weights -1,1 | Dual weights1,-1: interlacing T,F; multiplicities1,0 | Both directions discriminate | H02: shared carrier and central restriction |
| §3.10 split prediction | GL1×GL0; trivial GL2 at infinity | Scalar model dim1; trivial GL2 Whittaker dim0 | Temperedness cannot become unitarity | H02: shared carrier and central restriction |
| §3.10 prediction unfolding | Rank-zero smaller factor | finrank1=1 | Same proposition | H02: shared carrier and central restriction |
| §3.10 prediction transport | Identity representation and frame | m unchanged1=1 | No new labeling | H02: shared carrier and central restriction |
| §3.10 singleton packet | GL1 character | Packet cardinal1; no nontrivial component coordinate | No enhancement choice | H02: shared carrier and central restriction |
| §3.11 split proved range | n=0,r=0; GL3 generic principal series vs trivial N-character | Scalar dimension1; generic quotient1 versus ordinary Jacquet dimension3!=6 | Higher archimedean gap not turned into theorem | H03: supplier references |
| §4.1 global period definition | ν(h)=i; r=0 | Translation iP; r=0 unipotent factor1 | Character and empty factor consistent | Preserved |
| §4.1 linearity | f=0; scalars2,3 | P(2×0+3×0)=0=2P(0)+3P(0) | Linear functional | Preserved |
| §4.1 right translation | ν(h)=i | P(R(h)f)=iP(f) | Inverse weighting retained | Preserved |
| §4.1 adjacent period | r=0 | ν=1,N=1, integrand fV(t)fW(t) | Bilinear product, not conjugate pairing | Preserved |
| §4.1 rational isometry transport | Identity rational isometry | Quotient identity, measure factor1, period factor1 | Domain specified | Preserved |
| §4.2 local obstruction/factorization | ℓv(fv)=2,ℓw(fw)=3; one zero functional | P/P(f0)=6; zero local functional gives0 | No division by zero period | Preserved |
| §4.3 tensor L-representation | (a,b)=(2,1),(1,0) | Dimensions2ab=4,0; zero factor L=1 | Index-two induction retained | Preserved |
| §4.3 restriction | (a,b)=(2,1) | Two summands dimensions2+2=4 | Not connected tensor alone | Preserved |
| §4.3 inner-form transport | Form h↦-h, same(a,b) | dimR=4 before/after; parameter formula unchanged | Representation independent of form | Preserved |
| §4.3 local factor comparison | Split unramified tensor with scalar eigenvalue -1,q=2,T=1/2 | Two factors(1+1/2)⁻¹ each, product4/9 on both induced and E-local sides | Both split factors present | Preserved |
| §4.4 fixed-pair proposition | W=0; local failure | L-factor1; with local failure RHS false and independent obstruction gives P=0 | Literature theorem; formal proof assigned to Part II | H01: status and source comparison |
| §4.4 unfolding | Local models all present, central value0 | RHS=T∧F=F; proposition predicts P=0 | L-value condition not dropped | H01: status and source comparison |
| §4.4 transport | Identity isometry | P≠0 and same local/L conditions identical | Fixed pair retained | H01: status and source comparison |
| §4.4 failure consequence | One absent local model | RHS=F; P∣π=0 independently by §4.2 | No converse from local data alone | H01: status and source comparison |
| §5.1 normalizers | Split q=2,n=1; GL1 Satake 1 and GL2 Satake (1,-1) | Δ2=8/3, central E-factor4, adjoint32/9, quotient3 | Nonzero local denominator | Preserved |
| §5.1 local formula | Same data | C=(8/3)×4/(32/9)=3 | Formula consistent | Preserved |
| §5.1 local nonvanishing | Same data | C=3≠0 | No global central nonzero assumption | Preserved |
| §5.1 central-zero iff | Symbolic nonzero denominator D and nonzero Δ; central value0 | C=Δ×0/D=0; nonzero L has nonzero product | Both directions use proved Δ,D≠0 | Preserved |
| §5.1 adjoint/Asai comparison | m=1 | Adjoint sign -1, opposite pole sign+1 | Conventions agree | Preserved |
| §5.1a split Whittaker identity | λ(W)=1,a=2,b=3 | Raw diagonal ab absλ²=6 | Haar and pairing scalings explicit | H03: supplier references |
| §5.1a positive test | λ/L=1,L=2,a=2,b=3 | Raw diagonal ab absL²=24>0 | Nonzero local L required | H03: supplier references |
| §5.1a rescaling | Same λ=1 | Reference1→scaled6; λ fixed1 | No unrecorded change of reference measure | H03: supplier references |
| §5.2 normalized local form | Compact massa=2,C=3,B(1,1)=1 | α=2/3,q=2/3; α(0,0)=0 | q only on nonzero vectors | Preserved |
| §5.2 sesquilinearity/invariance | α(1,1)=2/3,c=i | α(i,1)=2i/3; α(1,i)=-2i/3 | Conjugation correct | Preserved |
| §5.2 extensionality | Infinite completed tensor X, A proper dense, algebraic ℓ killing A | β(A,A)=0 but β(x,x)=1 for ℓ(x)=1 | Continuity indispensable at infinity | Preserved |
| §5.2 nonzero iff model | Circle inverse weights vs incompatible weights | Integral1 vs0, model dimensions1 vs0 | Split/non-split routes remain distinct | Preserved |
| §5.2 source comparison | Same C=3,raw2 | α=raw/C=2/3=P-natural | Measures/pairing fixed | Preserved |
| §5.3 spherical identity | Split dyadic q=2 and nonsplit dyadic compactH | Split raw3=C×1×1, q=1; nonsplit raw1=C×1×1, C=1,q=1 | No good-prime restriction | H03: supplier references |
| §5.3 almost-everywhere corollary | Good place volume2 | q=volK=2; volume-one reference gives1 | No unconditional q=1 | H03: supplier references |
| §5.4 rescaling | Pairing×2, vector×2,Haar×2; two Haar scales2,1/2 | q unchanged; α/norm both×4; q×2; product multiplier1 | Global H scale2 gives squared period×4 | Preserved |
| §5.5 all-place product definition | Exceptional values2,3 and volume-one tail | Product6; introduce zero gives0 | Finite zero retained | Preserved |
| §5.5 finite expression | S={v,w},qv=2,qw=3,tail1 | 2×3×1=6 | Tail independent | Preserved |
| §5.5 enlarge S | Good place volume2 | 3×(2×1)=(3×2)×1=6 | Same value | Preserved |
| §5.5 local zero | One qv=0, other3 | 0×3=0 | No reciprocal of period | Preserved |
| §5.5 pairing scales | Pairing multiplier2 | α/norm becomes2α/(2norm)=α/norm | Product invariant | Preserved |
| §6.1 Whittaker relative periods | n=1; leading-pole orders r=1 and r=2 | Asai signs+,-; pole removal exponents1,2 | Actual constituent counts kept | Preserved |
| §6.1 lambda central shift | s=0 | s+1/2=1/2 | Central argument correct | Preserved |
| §6.1 beta formula | n=1 and η(detg1)=η(detg2)=-1 | η(detg1)²η(detg2)=-1 | Degree-dependent character | Preserved |
| §6.1 norm formula | W=0 | Integral absW²=0; norm0 | No norm quotient on basis zero vectors | Preserved |
| §6.1 eta formula | n=2, determinant signs -1,-1 | (-1)³(-1)²=-1 | Opposite exponents discriminate | Preserved |
| §6.1 enlarge S | One nonzero local factorc=2 | Leading coefficient divided2 and local integral multiplied2: total multiplier1 | No extra factor | Preserved |
| §6.2 global relative characters | One-dimensional toy smooth basis e,Pe=2,σ(f)e=3e | J=3×2×2=12 | Basis normalization visible | Preserved |
| §6.2 basis independence | e↦2e with norm quotient | Numerator×4, denominator×4; value12 | Nonzero basis vectors required | Preserved |
| §6.2 positivity | σ(f)=3 on e,Pe=2 | J(f*f*)=abs3² abs2²=36≥0 | Convolution adjoint used | Preserved |
| §6.2 local trace realization | H trivial, rank-one x=2,y=3,linear-firstB | TrT=6; ∫B(x,y)=6=Cα(x,y) | Order and pairing fixed | Preserved |
| §6.2 realization transport | Unitary scalar i | Pe and its conjugate pick i,-i; product multiplier1 | Relative character invariant | Preserved |
| §6.3 star-generic contribution | Counts(1,1),(2,1) | Coefficients2⁻²=1/4,2⁻³=1/8 | Full split centre counted | Preserved |
| Constituent coordinate law/reindex API | (1,0)+(0,1) in(Z/2)²; swap | Sum(1,1); swap fixes cardinal4 | Native group structure | Preserved |
| Constituent order API | Empty and one coordinate | 2⁰=1>0,2¹=2>0 | No division by zero | Preserved |
| Constituent coefficient reindex API | Counts(2,1)↔(1,2) | 2³=8 both, inverse1/8 both | Order independent of indexing | Preserved |
| §6.4 isolated comparison | Three constituents,IΠ=8 in scalar coefficient control | Right coefficient gives1; fixed1/4 gives2 | Sum over actual realizations retained | Preserved |
| §6.4 measure factors | ΔH'=2,ΔGR=3,ΔHh=5 | GL test multiplier6; unitary test multiplier25 | Factors not conflated | Preserved |
| §6.4 enlarge S | Good spherical transfer | Local unit1 maps to unit1 with its volume; total factor1 | Normalized transfer retained | Preserved |
| §6.5 Euler identity | Counts(2,1); one missing local model | Coefficient1/8; missing model gives Jglobal=0 and RHS0 | Never divide by relative character | Preserved |
| §7.1 adjacent global nonvanishing | n=1; central value0 in implication control | 0≠0 is F; theorem permits no period witness; wrong-inner-form period can remain0 when existential true elsewhere | Existential form retained | Preserved |
| §7.2 stable specialization | Single constituent each, n=2 | rtotal=2,group order4,coefficient1/4 | Source n>1 retained | Preserved |
| §7.3 refined proposition | Counts(1,1),(2,1); zero vector | Coefficients1/4,1/8; zero vector norm0 and quotient excluded | Defined proposition not a premise | Preserved |
| §7.3 unfolding | Pure f with zero period and central value0 | Left0/positive=0; RHS0 | Zero period permitted | Preserved |
| §7.3 polarization | P(x)=1,P(y)=i | Mixed value P(x)conjP(y)=-i; absP(x+y)²=2 | Pairing linear first; no mixed denominator | Preserved |
| §7.3 rescaling | Vector×2,local pairing×2 | Left4/4=1 times old; local ratio2/2=1 times old | Fixed measure identity retained | Preserved |
| §7.4 GGP.8 | Constituent counts(1,1),(2,1),Lcentral=0 | Coefficients1/4,1/8; central0 makes RHS0 and squared period0 | All-place target unchanged | Preserved |
| §7.4 proves refined proposition | Same nonzero vector and factors | Displayed sides literally identical; coefficient2⁻rtotal=1/absS | No assumption containing conclusion | Preserved |
| §7.4 stable coefficient | Single constituent per degree | absS=4, inverse1/4 | Agrees with stable source | Preserved |
| §7.4 downstream export | Scale f by2,Haar factors2 and1/2 | Vector quotient multiplier4/4=1; local product multiplier1 | Complete normalization exported | Preserved |

| §3.1 refined/unquotiented comparison | Nonsplit degree 1 over ℚ₂ and ℚ₃ | C={±1}, C°=1, C∩SL1=1; both S♮ and A have order 2 | Refined group retains the central element | H02 added |
| §3.1 quasi-split quotient map | d=(1), z=(1) | A has 2 elements; A/⟨z⟩ has 1; image of z is 0 | Quotient is not A | H02 added |
| §3.1 character descent iff | Rank-one characters with χ(z)=+1 and −1 | First gives 1 on the kernel; second gives −1≠1; descending-character counts 1 and 0 | Both directions tested | H02 added |
| §3.1 pure-inner central restriction | Same U1 group with twist invariants +1 and −1 | Permitted rank-one enhancement values are respectively +1 and −1; quotient allows only +1 | Isomorphic groups do not erase the chosen twist | H02 added |
| §3.1 central multiplicity and quotient | d=(2) | det(−I2)=+1, z=0; orders of A and A/⟨z⟩ are both 2 | Wrong z=generator would give quotient order 1 | H02 added |
| §3.1 two-coordinate quotient | d=(1,1) and d=(2,3) | z=(1,1),(0,1); A order 4; quotient orders 2,2; descending characters 2,2 | Central coordinates depend on multiplicities | H02 added |
| §3.1 split refined boundary | Split GL1 | C=ℂ×, C∩SL1=1, S♮=ℂ×; π0(C)=1 | Refined group is not always a finite component group | H02 added |
| §3.1 zero parameter comparison | Degree 0 | C=S♮=A=1, z=0, quotient order 1 | Empty parameter remains allowed | H02 added |
| §3.1 normalization transport | Change datum twice with multiplier −1 on one generator | η↦−η↦η; (−1)²=1 | Transported pairing, not a frozen label | H02 explicit |
| §3.1 real pairing scope | Compact U2 standard restricted to U1 | Weights 1,0: dual test weights −1,0 give multiplicity 1; +1 gives 0 | A single form does not acquire all enhancements | H02 explicit |
| §4.4 source rank correspondence | Roadmap (n,r)=(1,1),(0,1) | Source m=n and larger dimension m+2r+1 give 4,3 | Odd codimension and rank zero agree | H01 added |
| §4.4 fixed pair versus existence | Central value nonzero; a specified local model absent | Existential inner-form assertion can be true; this pair has P=0 by §4.2 | Local distinction is necessary to select the given pair | H01 added |
| §4.4 rank-zero literature boundary | n=0,r=0 and r=1 | Tensor dimension 0, completed tensor L-factor 1; larger ranks 1 and 3 | Whittaker coefficient remains a real period condition | H01 source update |
| §4.4 line normalization | Complement norm a=2, scale a⁻¹=1/2 | (1/2)·2=1; g*hg=h iff g*(h/2)g=h/2 | Underlying unitary groups unchanged | H01 added |
| §4.4 source period character | ν(h)=i, ψ_B(h)=ν(h)⁻¹ | Both integrands use −i; translated periods acquire (−i)⁻¹=i | Source convention comparison agrees | H01 added |
| AL.3 realization/right action | GL1 character χ with χ(h)=i, λ(v)=v, v=1 | W1(h)=i; W_(π(h)1)(1)=i=W1(h) | Orbit-function realization uses right translation | H03 references repaired |
| AL.3 opposite characters | First unipotent phase i, second −i | Product i(−i)=1; same phases instead give i²=−1 | Quotient integral has the required invariance | H03 hypotheses retained |
| AL.3 central shift and convergence | s=0 and s=−1/2 | Shifted arguments 1/2 and 0; 0>−1/2 true, −1/2>−1/2 false | Boundary is excluded | H03 hypotheses retained |
| AL.3 normalized test rescaling | A normalized test has value 2 | Scaling by 1/2 gives 1; multiplying Haar by 1/2 changes it to 1/2 | Nonzero normalization and measure comparison are distinct | H03 references repaired |
| AL.3 spherical comparison | q=2, n=1,2, conductor zero | Supplier normalized value 1 becomes 1/2,3/8 in differential Haar | No normalization constant lost | H03 all occurrences repaired |
| gap hermitian-unitary | W=0, V=<1>; zero module | Complement rank 1; U(0) order 1; zero form has both separation implications 0=0 | Zero rank admitted | Preserved |
| gap local-categories | GL2 diag(4,1), inducing scalar 1 | δ=4, δ⁻¹/²=1/2, normalized multiplier 2·1/2=1 | Unnormalized comparison has inverse half modulus | Preserved |
| gap local-bernstein | Fixed support containing two inertial classes; choose a third | Occurrences of chosen class in fixed support 0 versus 1 if an excluded class is chosen | Avoidance is relative to the actual support | Preserved |
| gap local-mirabolic | k=1 | P1=N1={1}; compact induction and restriction both have dimension 1 | Rank-one boundary consistent | Preserved |
| gap gl-tempered-genericity | GL1 unitary character | N1=1, evaluation at 1 is 1≠0 | No positive unipotent rank required | Preserved |
| gap local-jacquet-filtration | k=1,2,3 regular unitary principal series | Ordinary dimensions 1!,2!,3!=1,2,6; Whittaker dimensions 1,1,1 | Ordinary and generic quotients differ | Preserved |
| gap local-spherical | q=2, GL1 and GL2 | Differential unit volumes 1−1/2=1/2 and (1−1/2)(1−1/4)=3/8 | Dyadic volume retained | Preserved |
| gap archimedean-globalization | U1 opposite characters, scalar tensor | Tensor weight 1+(−1)=0; currying gives Hom(weight1, dual(weight−1)) of dimension 1 | Smooth dual has correct sign | Preserved |
| gap archimedean-generic-induction | A unit square in a right half-plane; null exceptional set | Area of square 1, exceptional area 0, remaining area 1 | Null reducibility locus cannot exhaust a half-plane | Preserved |
| gap archimedean-seminorms | Zero Whittaker vector; adjacent torus ratio 1 and 2, N=2 | LHS=RHS=0 for the zero vector; ξ=2,3 gives coefficients 1/4,1/9 | Bounds respect zero vector and the specified ratios | Preserved |
| gap automorphic-realization | One-dimensional completed tensor, unit vectors | ℂ⊗̂ℂ=ℂ, 1⊗1 maps to 1, squared norm 1 | Positive pairing and factorization agree in scalar control | Preserved |
| gap distribution-gk | Finite-group control S3, H=1, standard representation | Hom dimensions 2,2 give product 4>1; inversion sends δ_(123) to distinct δ_(132) | Symmetry hypothesis fails, so no false bound follows | Preserved |
| gap local-schwartz-germs | Empty regular-nilpotent index set; zero quasi-character | Assigned coefficient 0; zero germ and its integral 0 | No division by an empty orbit count | Preserved |
| gap local-tempered-bounds | Compact scalar unitary representation, unit vectors | Coefficient absolute value 1; Ξ=1, σ=0 gives upper bound 1 | Compact control is exact | Preserved |
| gap local-plancherel | Compact C2 quotient, f=δ1 | Two Fourier coefficients 1,1; inversion at identity (1+1)/2=1=f(1) | Plancherel mass is visible | Preserved |
| gap local-fourier-extension | Additive H, λ=id, dilation by 2, h=3 | λ(a(2)ha(2)⁻¹)=6=2λ(h); Jacobian 2 | Direction and Jacobian agree | Preserved |
| gap local-smoothing-trace | Scalar rank-one T_(2,3) | T(z)=6z; trace 6=B(2,3) | Linear-first trace formula | Preserved |
| gap automorphic-spectrum | Zero Schwartz test | Kernel 0, truncated integral 0, every spectral term 0 | Linear boundary agrees before isolation | Preserved |
| gap spectral-isolation | Two spectral values 0,1; interpolation value m(z)=1−z | m(0)=1,m(1)=0; constant multiplier 1 gives 1,1 | Isolation requires both conditions | Preserved |
| gap enhanced-packets | Nonsplit rank one and split GL1 | Nonsplit enhancement central values +1,−1; split ordinary pure-inner underlying group GL1 and singleton size 1 | Carrier and twist restriction remain visible | H02 rerouted |
| gap global-parameters | Constituent counts (1,1),(2,1) | Sign-group orders 4,8; generic multiplicity is 1 on allowed members | No diagonal quotient or automatic occurrence imposed | H02 rerouted |
| gap ordinary-endoscopy | Zero matching tests | All orbital integrals and transferred character values 0=0 | Geometric transfer gives no relative epsilon formula by itself | H02 scope clarified |
| gap relative-geometric-comparison | Zero adelic tests | Truncated kernels 0; constant terms 0 on both groups | Comparison precedes isolation | Preserved |
| gap relative-finite-transfer | Zero test and zero family | Every matching orbital value 0=0 in both directions | Zero case consistent; theorem still requires arbitrary tests | Preserved |
| gap relative-archimedean-transfer | Zero test in each dense test subspace | Relative orbital values 0=0; zero character values 0 | No inference of transfer for every Schwartz test | Preserved |
| gap relative-fundamental-lemma | Split convolution of volume-one subgroup units | 1_K*1_K=vol(K)1_K=1_K; zero component remains 0 | Unit and Haar normalization agree | Preserved |
| gap relative-character-comparison | Scalar normalization control κ=2,J=3 | I=κJ=6; change J by 2 requires κ/2=1 to keep I=6 | Explicit constants cannot be discarded | Preserved |
| gap real-oscillator-model | Gaussian mixed overlap, dilation λ=1,2 | Integrals 1/√2,1/√5; bounds min(1,λ⁻¹)=1,1/2 | Decay direction holds in two distinct dilations | Preserved |
| gap real-small-theta | Rank-zero source and equal-rank target | Empty epsilon product 1; unique signature (0,0), form value 1 | Base signature and enhancement agree | Preserved |
| gap adelic-measures | Haar factors 2,1/2 at two places; rational unipotent quotient | Product multiplier 1; quotient mass 1 | Product normalization retained | Preserved |
| gap factor-epsilon-identities | Zero parameter; χ1⊕χ−1 real pair | Empty factor 1; epsilon product χ1(−1)=−1 | Duality sign survives empty-parameter rule | Preserved |
| gap tempered-local-regularity | Split q=2, GL1 eigenvalue 1, GL2 eigenvalues (1,−1) | Δ=8/3, central factor 4, adjoint 32/9, all finite and nonzero | Quotient C=3 is defined | Preserved |
| gap hermitian-global-values | Smaller rank 0; central value allowed to be zero | Tensor L-function 1; for central value 0, Δ·0/D=0 when D≠0 | No central-value inversion | Preserved |
| gap local-rankin-selberg | q=2,n=1,2; GL measure×2 or N measure×2 | c1=1/2,c2=3/8; quotient multipliers 2 and 1/2 | Ratio a/b, not ab | Preserved |
| gap whittaker-pairing-fourier | k=1, W(1)=2,W′(1)=3 | GL0 quotient integral 6; trivial-unipotent Fourier value 6; δ=1 | Pairing and Fourier scalar boundary agree | Preserved |
| gap global-mirabolic-norms | Pole-order control (s−1)⁻r, r=1,2 | (s−1)^r(s−1)⁻r→1 for each r; exponent 1 with r=2 diverges | Constituent count fixes residue order | Preserved |
