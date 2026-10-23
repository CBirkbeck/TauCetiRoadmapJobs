## H01 (CBirkbeck) — applied

The finite-level “inclusion” is now the coefficient-comparison map c_(n,r) induced by higher-level inclusion and reduction, and τ_r=(c_(n,r),p^r), with no general monicity assertion (`TauCetiRoadmap/CohomologyComparisonsPartII/README.md:392`, `TauCetiRoadmap/CohomologyComparisonsPartII/README.md:430`; EN line 165–168, EN line 193–195). Section 3.1 makes reduction by the submodule’s own p^n-multiple explicit and retains the small-weight isomorphism, while the new Check at line 444 computes nonzero kernel classes modulo 2 and 3; both scalar composite identities, all annihilator bounds and the multiplicativity distinction are retained (EN line 243–244).

### Build and gate

Commit: `8858e492` — `CohomologyComparisonsPartII: review repairs (correct finite-level coefficient comparison maps)`; only `TauCetiRoadmap/CohomologyComparisonsPartII/README.md` changed. No push was made.

`lake build TauCetiRoadmap.CohomologyComparisonsPartII.Suggested` exited 0:

```text
✔ [8976/8976] Built TauCetiRoadmap.CohomologyComparisonsPartII.Suggested (2.6s)
Build completed successfully (8976 jobs).
```

The final full gate exited 0:

```text
gate CohomologyComparisonsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The dependency check exited 0, with no UPWARD, CYCLE or moved line:

```text
depcheck: 26 roadmaps, 231 edges, 0 problem(s)
```

The precommit full gate exited 1 solely for `dirty=1` on the permitted README edit; all its other counters were zero. The clean committed tree produced the final successful gate above; `git diff --check` also passed.

### Source and ownership verification

EN line 162–168 distinguishes flat crystalline coefficients from the higher-level divisibility quotient; EN line 193–195 supplies the two coefficient maps and scalar composites without asserting injectivity. At a stalk where the divisibility submodule M⊂J is proper, choose x∉M and least a≥1 with p^a x∈M; for N≥r+1, flatness gives J[p]=p^(N−1)J⊂M, so [p^a x]≠0 in M/pM but its image in J/pJ is zero. Thus the correction addresses the crystalline construction itself; the finite module Checks are illustrations of reduction, not alleged crystalline examples in the small-weight range.

Ownership was searched by the divided Frobenius/coefficient objects in the roadmap index, content main `a07e2024`, board packages and all 25 supplied open-roadmap folders. CrystallineCohomology §§CR.5:log-algebra.1–CR.5:log-algebra.5, CR.5.2–CR.5.4 own the underlying log and PD coefficients; the existing `crystalline-inputs` boundary expressly leaves J^⟨r⟩ and divided Frobenius to this Part II §3.1, so their natural comparison map belongs here. ColemanIntegration §L3.Fb.1 owns the modified direct-limit construction, PrismaticCohomologyPartIII §§6.9,6.29–6.32 own prismatic syntomic theory, and HabiroCohomologyFoundations §§3.21–3.23 concern q-Witt/prismatic filtrations; none supplies this classical finite-level map. No supplier, ownership transfer, later-roadmap dependency or Lean declaration was added.

Every cross-roadmap section citation was resolved against main when the folder exists there, and otherwise against its new-roadmap head; the revision of GrothendieckEulerForms was not used as a supplier. The section inventory covered AdicSpacesPartIV §§F1.5,F1.7–F1.9,F1.12,F1.16; RigidAnalyticGeometry §§6.1–6.2,7.3–7.4,8.1,8.4; EnhancedDerivedSheaves §§0.1–0.4,E2:towers.1,E5:abstract; EtaleCohomologyFoundations §§F.0.3,F.1,F.3a,F.4.1–F.4.5; DerivedModuleAlgebra §0.K.1; AInfCohomology §AI.1.7; CohomologyComparisons §§1.11,2.14,3.7,4.2–4.5,4.8,6.3; the named CrystallineCohomology and rigid-cohomology sections in the supplier contracts; PadicPeriodRings §§3,4.1–4.3; PadicHodgeTheory §§1.1–1.5,2.1–2.4; GrothendieckEulerForms Layers 0,5; the Coleman and prismatic sections just listed; and ColemanIntegrationPartII §§3.0c,3.1a,7.0. Stronger supplier domains remain explicitly described as extension contracts.

The two supplied citation leads do not require edits: TsujiNearby §4 is a reference to the cited paper (TsujiNearby line 805–940), not a roadmap; `Decalage.koszulComplex` is the planned declaration explicitly present in AInfCohomology §AI.1.7, not a pinned-library assertion. The relevant Mathlib and Tau Ceti checkouts match the manifest revisions `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; object searches found the existing mapping-cone, isocrystal, exact-structure and period-ring carriers, not log-syntomic or FilFMIC realization carriers. In particular, `WittVector.Isocrystal` bundles a semilinear equivalence, without HK cohomology or its comparison (MathlibPin line 117); the syntomic algebra predicate is a flat presentation/fibre-dimension predicate (TauCetiSyntomic line 79–85), and abelian Ext retains its abelian hypothesis (MathlibExt line 53, TauCetiExtReview line 54).

### Elaborated-signature inventory

A mechanical declaration inventory of `TauCetiRoadmap/CohomologyComparisonsPartII/Suggested.lean` contains zero declarations. Consequently the scratch `#check @name` inventory is empty and there are no elaborated declaration types or dropped section hypotheses to compare; the requested build elaborated the unchanged module successfully. All its listed headlines still need the named geometric or coefficient carriers absent at the pins; a coefficient-reduction Check is not an additional headline theorem.

### Adversarial mathematics: the repaired statements

The finite models below test coefficient arithmetic, not the geometric realization theorems. In generator coordinates write μ for the source-coefficient map p^r, c for the comparison map, a for the map from the divided coefficient to O, and Φ_d for divided Frobenius; the divided differential is a−Φ_d and the undivided differential is p^r−φ.

| Statement | Instances tried | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| §3.1 reduction is M/p^nM | J=ℤ/8, M=2J, n=1 | M={0,2,4,6}; 2M={0,4}; M/2M has 2 classes, while its image in J/2J has 1 | Own-multiple quotient differs from image | Quotient made explicit |
| §3.1 c has source J^⟨r⟩ and target J^[r] | Same module model | c([0])=[0], c([2])=[0]; [2]≠[0] in M/2M | Natural map exists and is not injective | Inclusion replaced by comparison |
| Noninjectivity at an odd prime | J=ℤ/27, M=3J, n=1 | 3M={0,9,18}; M/3M has 3 classes; c([3])=[0] with [3]≠[0] | Kernel has 3 elements | Added Check |
| Empty/zero coefficient case | J=M=0 | M/p^nM=0=J/p^nJ; c=0:0→0 is an isomorphism | Does not claim failure in every case | Generality retained |
| Auxiliary-level compatibility of c and Φ_d | Module model M=2J, φ=id, n=1; levels N=2,3 | At both levels c([2])=0 and Φ_d([2])=1 | Reduction does not depend on choosing 4 or 8 as higher modulus | EN auxiliary-level statement retained |
| Reduction in n commutes with c | Same model, n=2→1 | c₂([2])=2 mod 4, then 0 mod 2; c₁([2])=0 | Both paths give 0 | c added to reduction API |
| Reduction in n commutes with Φ_d | Same model, n=2→1 | Φ_d([2])=1 mod 4→1 mod 2; other path gives 1 | Both paths give 1 | Divided-Frobenius API retained |
| Small-weight comparison is an isomorphism | r=0, and full-divisibility model M=J for p=2,r=1 | c([1])=[1]; c⁻¹([1])=[1]; at r=0 Φ₀=φ | Full divisibility gives the usual identification | Rephrased as isomorphism via c; range unchanged |
| Division must precede reduction | p=2 and 3, n=1 | p·0=0=p·1 although 0≠1 | Finite-level equation does not determine divided image | Higher-level definition retained |
| ω coefficient chain square | p=2,n=2,r=1, proper module model M=2ℤ₂ | μ=1, c=a=2, Φ_d=φ=1; (a−Φ_d)μ=1=p−φ | Both differentials give 1 | Source of μ made explicit |
| τ coefficient chain square | Same model | (p−φ)c=2=p(a−Φ_d) mod 4 | Both paths give 2 despite c not invertible | τ uses c |
| τω and ωτ on both coefficients | Same model | μc=cμ=2; target maps give 2·1=1·2=2 | Both composites equal p^r | Preserved |
| All scalar coefficient identities and chain squares | p=2,3; n=1,2,3; r=0,1,2,3,4; full and proper module models | 530 input elements; every chain-square difference, cμ−p^r, μc−p^r, φc−p^rΦ_d and Φ_dμ−φ evaluates to 0 | No modular counterexample; includes p^r=0 mod p^n | Preserved |
| Cohomology kernel/cokernel annihilator bound | Multiplication 2 on ℤ/4; multiplication 3 on ℤ/9 | Kernels {0,2} and {0,3,6}; cokernels ℤ/2 and ℤ/3; multiplying either kernel/cokernel by p gives 0 | Bound is not invertibility | Preserved |
| Weight-zero ω and τ | r=0 | p^0=1; c=μ=1; both composites and both maps are identity | Error exponent 0 means zero kernel/cokernel | Preserved |
| Products and ω, with reduction and PD realization | Weight-zero unit and two odd-degree factors | 1∪x=x; swap sign (−1)^(1·1)=−1; mod 2, −1=1, without dividing by 2 | Unit/sign witnesses unchanged; EN line 219–244 remains the product input | No multiplicativity assertion added for τ |
| Rational inverse uses a rescaling | p=2,r=2 | τω=4 id, so (τ/4)ω=id=ω(τ/4); τω≠id on ℚ₂ | Rational inverse is p^(−r)τ | §3.4 unchanged |

### Adversarial mathematics: remaining target and convention witnesses

These are boundary and sign computations, not proofs of the universal admitted targets. Each row identifies the statement being tested; all retain their existing hypotheses and scope.

| Statement | Instances tried | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: reduction modulo p^n | π²=p, n=1 | V/pV=V/(π²) has nonzero class π with π²=0; V/(π) has π=0 | Mod-p and residue fibres differ | None |
| Conventions and §1.1: AM Frobenius modulo p | π²=p, p=2,3 | v_π(F_Vπ)=1, v_π(π^p)=p, difference has valuation 1<2 | Excludes these AM bases; classical layers retain them | None |
| Conventions and §1.1: zero and horizontal coefficient data | H=0; rank-one Φ=σ; Φ(e)=te on G_m | Φ:0≃0; Φ(1)=1 and ∇1=0; ∇(te)=dt⊗e≠0 | Accepts first two, rejects last | None |
| §1.1: faithfulness boundary | S=Spec K, H_dR=K, H_rig=0 | id_dR=1, id_rig=0 | Only de Rham realization is faithful | None |
| §1.2: Tate twist and tensor/dual units | O(1), O(−1), zero factor | p⁻¹p=1; filtration jumps −1+1=0; H⊗0=0 | Tensor and inverse conventions agree | None |
| §1.2: identity pullback/lift change | Identity base and same lift | h↦h on both components, with scalar 1 | Excludes an unmarked scalar automorphism | None |
| §1.3: conflations and zero extensions | H⊕O; H=0 | F^j(H⊕O)=F^jH⊕F^jO; extension class 0; Ext¹(O,0)=0 | Strict exactness agrees with split case | None |
| §1.3: strictness is essential | Point B→A, underlying id, F⁰B=0,F⁰A=K | F⁰ map 0→K is not surjective; inverse sends K outside 0 | Underlying isomorphism is not filtered isomorphism | None |
| §1.4: fibre differential and shift sign | ℚ, (a,b)=(1,0),(0,1),(2,5), coordinate maps in its Checks | (0,2), (0,−1), (2,3·2−2·5)=(2,−4) | Both signs and first differential detected | None |
| §1.4: zero, point and acyclic fibres | H=0,O(0),O(1); multiplication 2 on ℚ | 0; (H⁰,H¹)=(ℚ_p,ℚ_p),(0,ℚ_p); ker 2=coker 2=0 | No replacement by ordinary kernel | None |
| §1.5: extension evaluation and its sign | Φe=e−h, Φh=h; split extension | (1−Φ)e=h, so u₁=(0,h)≠0; split gives 0 | Positive connecting representative | None |
| §1.5: filtration matters independently | Point T, Φ=1,F⁰T=0 | Filtered Hom(O,T)=0; unfiltered Frobenius Hom=ℚ_p | No extra morphisms admitted | None |
| §1.5: cup and degree-zero unit | Identity O→O and a split extension | u₀(id)=1; 1∪0=0=u₁(split) | Unit/evaluation naturality witness agrees | None |
| §1.6: unique lift, injectivity and projections | H=O(1), Φe=e+ah; split; H=O(0) | δ=0,R=−ah; split gives (0,0); in O(0), lifts e and e+ch differ | F⁰H=0 remains necessary for unique representatives | None |
| §2.1: specialization diagram | Spec V, empty, Spec K over V | sp=id_K, bc:K0→K; 0→0; K→0 | Does not assert sp invertible in general | None |
| §2.2: rigid double fibre | V=ℤ_p, point, r=0 and r>0 | f(a,b)=(0,a−b) gives dimensions (1,1); f(a)=((1−p^(−r))a,a) gives (0,1) | Both target components retained | None |
| §2.2: generic-only input | X_k empty | A=C=0, fibre equals F^rDR | Generic-only producer is not zero in weight 0 | None |
| §2.3: unramified single fibre | Point r=0; dlog t on G_m, r=1 | Differential 0 gives H⁰=H¹=ℚ_p; (1−φ/p)dlog t=(1−p/p)dlog t=0 | Twist exponent fixed | None |
| §2.3: descent/product degeneracy | Empty X; identity cover | Cohomology and products are 0; identity comparison sends x to x | No nonempty or nontrivial-cover requirement | None |
| §3.2: integral fibres and sites | r=0; zero map A→B; empty X | S=S′; H⁰=A,H¹=B; RΓ=0 | Kernel description needs its stated site-surjectivity input | None |
| §3.4: local differential/quotient conventions | r=0; form degree j≥r | DR/F⁰=0; J^[r−j]=O | Nonpositive PD index does not mean zero | None |
| §3.4: derived inverse limit | A_n=⊕_(j≥n)𝔽_p | lim A_n=0; lim¹=(∏𝔽_p)/(⊕𝔽_p), with [(1,1,…) ]≠0 | Ordinary limit loses degree 1 | None |
| §3.4: completed/rational point | Trivial-log Spec ℤ_p, r=0 | Towers [ℤ/p^n —0→ ℤ/p^n] give [ℤ_p —0→ ℤ_p], H⁰=H¹=ℚ_p after rationalization | No vertical log condition inserted | None |
| §4.1: ordinary and modified lattices | r=0; p=2,r=2; p=3,r=4 | Generators 1=1; EN=1/8,CN=1/4 with inclusion coordinate 2; 1/18 and 1/9 differ by unit 2 | Factorial and reduction effects distinguished | None |
| §4.1: product integrality | p=2, weights 1+1 | (1/2)(1/2)=1/4; 1/4∉(1/2)ℤ₂ | Floor-normalized target required | None |
| §4.1: composite error exponents | Module scalars p^A,p^B | Product scalar p^(A+B); for A=B=1,p=2 it is 4 | Errors add in the exponent | None |
| §4.2: period unit and actual generic open | r=0; trivial-log Spec ℤ_p | Unit maps to 1; p is nonunit in ℤ_p and unit in ℚ_p | U must intersect X[1/p] | None |
| §4.2: nearby-cycle target | Canonical-log point, geometric closed stalk | A nonzero ramified character has value 1 on a cyclic inertia quotient; constant stalk has H¹=0 | Nearby cycles are not a constant closed sheaf | None |
| §4.3: exact-weight endpoints | p=2,3 | p−2=0,1 respectively; coefficient small-weight endpoints p−1=1,2 differ | Exact comparison range unchanged | None |
| §4.3: inverse Cartier direction | G_m over 𝔽_p, t dlog t | [t dlog t]=[dt]=0; C⁻¹(t dlog t)=[t^p dlog t]≠0 | Identity coefficient rule fails | None |
| §4.3: degree-zero Cartier target/locality | A¹_𝔽_p, u−u^p=t | dt≠0, so t∉Z⁰; z=u^p has dz=0 and z−z^p=t^p | Target is closed forms, with étale-local surjectivity | None |
| §4.4: all-weight chart scope | xy=π²; p=2,r=1 | h=2 is admitted when e≥2; degrees q=0,1 admitted, q=2 excluded | No smooth-model or good-prime narrowing | None |
| §4.4: commuting Koszul signs | g₁=2,g₂=3 on ℤ and mod 2,3 | d⁰1=(2,3); d¹(1,0)=−3,d¹(0,1)=2; d¹d⁰1=6−6=0 | Supplier sign agrees | None |
| §4.4: arithmetic direction is twisted | γ₁=1+E₁₂,γ₀=diag(c,1) | Commutator (c−1)E₁₂ gives pE₁₂ for odd p and 4E₁₂ at p=2, both nonzero | Cannot use ordinary commuting differential here | None |
| §4.5: recollement and error support | No closed part; closed/open unit; open restriction of error | E=Rj′_*L; unit restrictions both 1; error restricts to 0 on the open | Closed error exponent remains A | None |
| §5.1: HK isocrystal and uniformizer sign | D=K0,N=0; rank-two φ=(1,p),Ne1=e0 | Nφe1=p e0=pφNe1; exp(log(u)N)e1=e1+log(u)e0 | Positive Taylor convention agrees | None |
| §5.1: Cartier-type boundary | k[t]/t^m, p∤m,m>1 | Nonzero nilpotent t is sent to t^p; iterated Frobenius sends it to 0 | Cannot have bijective Frobenius on the stated obstructed realization | None |
| §5.2: lower exponent and total differential | p=2,r=0, rank-two datum, ι=id | D0(e1)=(−e1,e1,e0); D1D0=−e0+e0=0 | Lower operator is 1−2φ | None |
| §5.2: normalization chain adapter | p=2,r=0,e=2; then e=0 | Third component e0↦−e0/2; D1(e1,0,0) changes e0↦−e0/2; at e=0 these components become 0 | Squares commute; equivalence excludes e=0 | None |
| §5.3: classical/h compatibility | Identity presentation; p=2,r=0 | Both realization maps send x↦x; τ≤0 retains degree 0 and removes degree 1 | No all-degree integral comparison inferred | None |
| §6.1: geometric realization data | u=id, empty U, P¹ | H⁰=O; all 0 for empty U; P¹ has ranks 1,0,1 with top Frobenius p | Actual geometric coefficient retained | None |
| §6.2: independent algebraic finiteness | U=D(pt−1)⊂Spec ℤ_p[t] | Rigid inverse is Σp^jt^j; algebraic (pt−1)^(−m) has pole order m→∞ | Rigid coherence does not imply finite algebraic module | None |
| §6.2: promotion boundary | c=0 between rank-one modules; zero datum | 0·1=0≠1 so c is not invertible; zero datum gives zero object | Formal tuple cannot bypass hypotheses | None |
| §6.3: good compactification | A¹×G_m; no horizontal boundary; sections x=0,x=t | Vertical boundary disappears on A¹; empty horizontal divisor gives proper fibre; at t=0 two sections coincide | Last example violates relative boundary condition | None |
| §6.4: finite filtered realization | Constant genus g=0,1 curves; product G_m | Ranks (1,0,1),(1,2,1); φ(dlog x)=p dlog x | Algebraic and rigid witnesses agree | None |
| §6.5: relative continuous forms | A¹,G_m; ramified base without AM lift | H⁰(A¹)=K,H¹(A¹)=0; H¹(G_m)=K dlog t; product affine line has H⁰=B†_K,H^i=0 for i>0 | Frobenius-free general comparison retained | None |
| §6.5: affine vanishing domain | Proper elliptic curve | H¹(E_K^an,O)=K≠0 | Affine argument cannot be extended to this case | None |
| §6.6: residue, twist and Gysin | P¹−{0,∞}; nonsplit quadratic boundary over ℤ₂ | Res dlog t=(1,−1), sum 0; nonsplit trace-zero line has Frobenius −2 | Twist −1 and trace descent agree | None |
| §6.6: empty boundary | U=X=P¹ | H²(X)=K0(−1), localization map H²(X)→H²(U) is id | Proper case excluded from affine short sequence | None |
| §6.7: shifted extension projections | G_m,n=1; point n=0; split extension | H¹(G_m)(2)=O(1), residue twist 1; n=0 gives O(1); split δ=R=0 | No extra degree/sign restriction | None |
| §7.1: compatible point lifts | σ(t)=t^p; lift t=p; σ(t)=t^p+p | P₀=0,P₁=1; p^p≠p; last compatible lift has t≡p mod p² | Arbitrary analytic lift is insufficient | None |
| §7.2: detection hypotheses | Zero module; x=1; k=𝔽_p,x=t^p−t | 0 evaluates to 0; 1 evaluates to 1; nonzero polynomial evaluates to 0 at every Teichmüller 𝔽_p-point | Algebraic closedness cannot be dropped | None |
| §7.3: specialization and connection pullback | Identity point; split extension; t=p with σ=t^p | R maps to itself; split gives 0; p^p−p≠0 | Compatibility is required for the Frobenius component | None |
| §7.4: horizontal log/rigid comparison | Point r=0; G_m; generic-only quadratic L/ℚ₃ | Same fibre of 1−φ; same dlog with φ=p; squares mod 3 are 0,1 so x²=2 has no root | Pair domain and periods retain restrictions | None |
| §7.4: horizontal versus vertical point | Spec ℤ_p,r=1 | Horizontal H¹=ℚ_p; vertical C_st has middle dimension 3, image dimension 1, hence H¹ dimension 2 | Log structures cannot be interchanged | None |
| §7.5: connecting sign and absolute value | Smooth curve,n=1,r=2; split extension | F²Ω•=0; b maps to (0,b) with +1 coefficient; split value 0 | Two vanishings give the stated isomorphism | None |
| §7.5: two vanishings are distinct | Algebraic fibre model with A concentrated in degree n+1 and B=0 | H^n(B)=0 while H^(n+1)Fib(A→0)=H^(n+1)A≠0 | Nonzero next filtered term prevents surjectivity | None |
