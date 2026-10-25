# Human review response: RefinedTraceMethods

The review's numbered finding 2 contains two independent points, recorded as H02 and H03; findings 3–6 consequently correspond to H04–H07. All line references below are to the repaired files.

## H01 (CBirkbeck) — applied

In `TauCetiRoadmap/RefinedTraceMethods/README.md:3567`, the unconditional output Whitehead filtration becomes the complete exhaustive filtration induced from the input Whitehead towers, with output identification explicitly conditional on homological amplitude [0,1]; the Koszul example computes induced gr¹=0 against output Whitehead gr¹=Σ²Hℤ_p. The ku/KU consumers now establish amplitude before that identification, and the dual classifier uses the shifted tower τ≥(2n−1) (`TauCetiRoadmap/RefinedTraceMethods/README.md:3587`, `TauCetiRoadmap/RefinedTraceMethods/README.md:3597`; mw line 1464, mw line 1502, mw line 1527).

## H02 (CBirkbeck) — applied

In `TauCetiRoadmap/RefinedTraceMethods/README.md:2233`, fib(K⊗ℚ→HN_ℚ) becomes fib(IK⊗ℚ→HN_ℚ), and nilpotent relative connective/nonconnective agreement is explicit; the suspension example retains its nonzero rational negative K-group (lt line 1262, lt line 1272; kb line 12195). The excision proof uses this localizing fibre, periodic cyclic excision and nonpositive birelative K-excision (`TauCetiRoadmap/RefinedTraceMethods/README.md:2301`; lt line 1287, co line 47, co line 57), and `TauCetiRoadmap/RefinedTraceMethods/Suggested.lean:14` identifies the missing carriers for the rational headline.

## H03 (CBirkbeck) — applied

The continuity proof uses Fconn=fib(K→TC) in place of Kinv and reduces both R and R⊗ᴸ_HℤH(ℤ/pᶦ) to their zeroth homotopy rings by DGM before invoking discrete henselian rigidity (`TauCetiRoadmap/RefinedTraceMethods/README.md:2289`; cmm line 1790, cmm line 1870, cmm line 1879). The same unsupported use of the nonconnective fibre is repaired in the connective K-theoretic Beilinson proof at `TauCetiRoadmap/RefinedTraceMethods/README.md:4006`.

## H04 (CBirkbeck) — applied

The Frobenius extension datum is now A→(A⊗ᵖ)ᵗᶜᵖ→THH(A)ᵗᶜᵖ, using the Tate diagonal and the equivariant p-fold translate map; postcomposition with the equivariant augmentation is a separate assertion (`TauCetiRoadmap/RefinedTraceMethods/README.md:826`, `TauCetiRoadmap/RefinedTraceMethods/README.md:832`; ns line 5505, ns line 5524, ns line 5533). The checks include x↦x³ over 𝔽₃[x], which differs from x↦x, and the unit at p=2.

## H05 (CBirkbeck) — applied differently

Scope and supplier contracts acknowledge NoncommutativeGeometry N1's mixed chains, and the duplicate ordinary B target becomes an unbounded DG enhancement plus explicit complex chain, normalization, SBI and cochain-duality comparisons (`TauCetiRoadmap/RefinedTraceMethods/README.md:9`, `TauCetiRoadmap/RefinedTraceMethods/README.md:59`, `TauCetiRoadmap/RefinedTraceMethods/README.md:144`, `TauCetiRoadmap/RefinedTraceMethods/README.md:166`). The arbitrary-base ordinary core remains with its existing supplier KTheoryFiniteLocalFields §4.0, rather than replanning NoncommutativeGeometry's complex-scalar scope; its N1 on main already specifies the normalized B formula and full cyclic-cochain comparison (`TauCetiRoadmap/NoncommutativeGeometry/README.md:146`, `TauCetiRoadmap/NoncommutativeGeometry/README.md:154`), while `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:616` at head afe02e8 specifies the arbitrary-base core (h line 141 and h line 195 supply the DG extension).

## H06 (CBirkbeck) — applied

The proof replaces fib(t:M→M[2])≃X with cofib(t:M[−2]→M)≃X, equivalently fib(t:M→M[2])≃X[1], and adds Hℤ and ΣHℤ witnesses giving fibre homotopy in degrees 1 and 2 respectively (`TauCetiRoadmap/RefinedTraceMethods/README.md:785`; ns line 6235). The unbounded base-change theorem and n=1 zero-Tate case retain their full generality.

## H07 (CBirkbeck) — applied

Both occurrences of TP(R⊗Hℤ) in β's construction become the explicitly p-completed Tate construction on THH(R;ℤ_p)⊗_𝕊Hℤᵗʳⁱᵛ, followed by Tate of the circle-equivariant linearization into HH(R/ℤ;ℤ_p) (`TauCetiRoadmap/RefinedTraceMethods/README.md:3947`, `TauCetiRoadmap/RefinedTraceMethods/README.md:3953`; ammn line 432, ammn line 466). The added p=2 control distinguishes the trivial Hℤ factor, with π₃=0, from THH(Hℤ), with π₃=ℤ/2.

## Ownership, citations and pinned signatures

Ownership was checked by object on main, across the board packages, through the open-roadmap index and in all 44 supplied sibling roadmap folders. NoncommutativeGeometry is consumed as it stands on main, KTheoryFiniteLocalFields as a new earlier roadmap at afe02e8, and DGAInfinity Layer 8 for the underlying DG Hochschild object; this roadmap owns the unbounded mixed/circle enhancements and their specialization comparisons, not another ordinary cyclic carrier. No later supplier was introduced and no ownership had to move down the merge order. The similarly named mixed complex in MotivicEtaleKTheory §1.2 is cubical/simplicial cycle theory, and HabiroNumberFields §1.8 concerns cyclic-group bar chains, so neither owns the Connes mixed object.

Cross-roadmap resolution reports no unresolved roadmap citations. Its indexed main ae2562c and actual main b41e47b differ only in GeometricCurrents progress/status files. The four initial citation leads are supplier target names, not claimed pinned implementations: AInfCohomology §AI.7.2 lists tateFinite, tateOrbit and completedTateComparison (`TauCetiRoadmap/AInfCohomology/README.md:3833`), and PrismaticCohomologyPartIII §7.0 lists rationalBeilinson (`TauCetiRoadmap/PrismaticCohomologyPartIII/README.md:919`). All references used for the repairs were available in the certified cache; no new source key or missing-text request was needed.

The manifest pins were confirmed as Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The spectral and higher-category carriers needed for these headlines remain absent. Mathlib's `NormalizedMooreComplex.objX` in `Mathlib/AlgebraicTopology/MooreComplex.lean:66` is top in degree zero and the intersection of the positive face kernels in higher degree; it carries no Connes operator, so the quotient/kernel comparison must transport B. The declaration/signature audit finds zero definitions, instances or theorems in Suggested.lean: the per-declaration `#check @name` and retained-binder comparison are therefore empty, and the successful module elaboration confirms that boundary. No signature or hypothesis disappeared; only the missing-carrier explanation for Goodwillie's rational theorem was added.

## Computed adversarial pass

The table covers every changed mathematical target, its added definitions and conventions, and the affected consumers. Values are mathematical computations; the module build checks the unavailable-carrier boundary, not these identities.

| Statement | Instances tried | Values computed on both sides | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 underlying enhanced DG Hochschild chains | A=k; ordinary A=k[x]; k=ℤ, A=𝔽_p | HH(k/k)=k in degree 0; HH(k[x]/k)=k[x]⊕k[x]dx; derived HH₂(𝔽_p/ℤ)=𝔽_p, HH₁=0, while the underived bar has HH₂=0 | DG enhancement must retain the supplied derived underlying object | Made DG domain explicit; ordinary restriction is a comparison |
| §1.1 maps and relative DG fibres | Identity of k; zero differential ideal; square-zero ideal (ε) in ℚ[ε]/ε² | Identity sends a to a and its relative fibre is 0; HH₀(ℚ[ε]/ε²,(ε))=εℚ, mapping to 0 in HH₀(ℚ) | Domain and ideal must carry differentials | Required differential two-sided ideal; preserved supplied relative object |
| §1.1 degree-zero and product specialization | Ordinary M₂(k); ordinary commutative k[x]; zero algebra | HH₀(M₂(k))=k by matrix trace; HH₀(k[x])=k[x] with x·x=x²; HH(0/k)=0 | Quotient formula belongs to ordinary specialization | Restricted HH₀ clauses to ordinary A |
| §1.2 DG total differential and B | Cyclic bar of ℤ[x] tensored with L=(ℤe₁→ℤe₀), de₁=e₀; element x⊗e₁ | Internal contributions to bB+Bb are −(1⊗bar x)⊗e₀ and +(1⊗bar x)⊗e₀, sum 0; fixed positive sign gives 2(1⊗bar x)⊗e₀≠0; total homology is 0 since L is contractible | Sign depends on cyclic degree | Added explicit unbounded direct-sum construction and witness |
| §1.2 ordinary B restriction | A=k; A=k[x], x² and x; k=𝔽₂ | B(1)=0 after normalization; B[x²]=2x dx, hence 0 over 𝔽₂; B[x]=dx≠0 | Same B and characteristic-2 coefficients as supplied core | Replaced ordinary construction by DG extension/comparison |
| §1.2 mixed relations and normalization | Constant cyclic complex k; two-term module with b=B=id | Normalized degree 0 is k, higher degrees 0, B=0; in the false two-term mixed model bB+Bb=id in both degrees, not 0 | Extension by zero agrees exactly; square-zero laws alone are insufficient | Retained mixed relations; ordinary normalized carrier imported |
| §1.2 complex cyclic-chain comparison and naturality | Identity and map ℂ[x]→ℂ[y], x↦y²; A=M₂(ℂ) | Tensor-word comparison fixes each word; B[y²]=2y dy equals image of dx under x↦y²; b(e₁₂⊗e₂₁)=e₁₁−e₂₂ in both models | Tensor-word identification preserves operators and maps | Added natural comparison with N1 |
| §1.2 algebraic cochain duality | ψ(a₀,a₁)=a₀(0)a₁′(0) on ℂ[x]; trace on M₂(ℂ) | ψ(B[x])=1=(B*ψ)(x); ψ(B[1])=0; tr(b(e₁₂⊗e₂₁))=1−1=0=(b*tr)(e₁₂,e₂₁) | Both transposed differentials agree, including noncommutative case | Added evaluation comparison and sign witness |
| §1.2 normalized/full cyclic and SBI comparison | A=ℂ, degrees 0,1,2 | Normalized C₀=ℂ, C₁=C₂=0; HC₀=HC₂=ℂ, HC₁=0; S:HC₂→HC₀ is identity, hence dual S:HC⁰→HC² is identity | Full cochains require whole bicomplex | Preserved scalar even classes, rather than equating raw normalized cochains with full cyclic cochains |
| §1.2 continuous evaluation domain | A=ℂ with usual topology; A=ℂ[x] with coefficientwise locally convex topology | On ℂ, every linear functional is continuous and both evaluations send 1 to its scalar; on ℂ[x], λ(Σa_jx^j)=Σa_j has λ(xⁿ)=1 although xⁿ→0, so λ is algebraic but not continuous | Two duals cannot generally be identified | Kept completed-tensor continuous comparison on its own domain |
| §2.7 cofiber/fibre and shift convention | X=Hℤ and X=ΣHℤ, trivial action | For Hℤ: cofiber of t:M[−2]→M has (π₀,π₁)=(ℤ,0); fibre of t:M→M[2] has (0,ℤ); for ΣHℤ these shift to cofiber π₁=ℤ, fibre π₂=ℤ | Fibre is ΣX | Restored suspension and added consecutive-degree witness |
| §2.7 finite Tate base change | X=Hℤ; n=1,2,3; X=0 | Tate homotopy is 0 for n=1; ℤ/2[t±¹] and ℤ/3[t±¹] for n=2,3; every construction on 0 is 0 | Unbounded theorem needs no stronger hypothesis | Kept n≥1, including zero Tate at n=1 |
| §2.8 Frobenius extension datum | A=𝕊; A=H𝔽₂; A=H(𝔽₃[x]) | For 𝕊, jₚ identifies with id and Δₚ gives the canonical Tate map; augmented π₀ maps send 1↦1 at p=2 and x↦x³ at p=3; coefficient identity gives x, difference x³−x≠0 | Restriction must land in THH(A)ᵗᶜᵖ | Prescribed jₚᵗᶜᵖΔₚ and kept augmentation separate |
| §2.8 augmentation and residual action | Two factors at p=2, a⊗b; scalar unit | a∘j₂(a⊗b)=ab; after swapping factors it is ba=ab; unit 1⊗1↦1 on both sides | Multiplication is equivariant for trivial action on the augmented A, whereas i has no such general equivariance | Typed the augmentation identity and retained T/Cₚ convention |
| §4.17 KQinf definition/localization | Zero category; Perf(R) with R=k[x,y]/(xy(1−x−y)); its suspension sequence | KQinf(0)=fib(0→0)=0; IK₋₁(R)⊗ℚ=ℚ and IK₀(ΣPerf(R))⊗ℚ=ℚ, while connective K₋₁=0 and cone K₀=0 | Connective rational K fails the localizing suspension test | KQinf now uses IK; added this negative control |
| §4.17 relative connective/nonconnective comparison | I=0; R=ℚ[ε]/ε², I=(ε) | Identity relative terms are 0; for dual numbers, relative groups in degrees ≤0 are 0 on both K theories, K₁⊗ℚ=ℚ=HC₀ via 1+aε↦a; K₂⊗ℚ=0=HC₁; K₃⊗ℚ=ℚ=HC₂ | Relative connective theorem survives absolute repair | Stated the comparison and its nilpotence hypothesis |
| §4.18 truncating excision and rational obstruction | Identity Milnor square; node square ℚ[x,y]/xy→ℚ[x]×ℚ[y] over ℚ | Identity square has birelative IK=HN=HC=0; node degree-1 obstruction is 0=HC₀,birel: relative HC₁ of the two polynomial branches is 0 and the relative HC₀ map is the identity on (x)⊕(y); nonpositive birelative IK=0 | General-square comparison uses nonpositive excision; nilpotence is unavailable for (x,y) | Made KQinf and HP excision and the separate connective comparison explicit |
| §4.18 discrete continuity via Fconn | R=ℤ₃, I=(3), s=1,2,3; R=ℤ₂ | π₀K(ℤ₃)/3=𝔽₃, all quotient π₀=𝔽₃; π₁K(ℤ₃)/3=ℤ₃×/(ℤ₃×)³≅𝔽₃, quotient values 0,𝔽₃,𝔽₃ with limit 𝔽₃; at p=2, stable unit quotient is (ℤ/2)² on both sides | Correct connective continuity and prime-2 behavior | Used Fconn in the henselian proof |
| §4.18 derived-to-discrete step | R=Hℤ_p⊕ΣHℤ_p, square-zero extension; Rᵢ=R⊗ᴸ_HℤH(ℤ/pᶦ) | π₀R=ℤ_p, π₁R=ℤ_p; π₀Rᵢ=ℤ/pᶦ and π₁Rᵢ=ℤ/pᶦ; the truncation maps have identity π₀, kernel 0; discrete quotient kernel is pᶦℤ_p | DGM applies before discrete henselian rigidity | Added both Postnikov reductions and their compatibility |
| §7.7 generic tensor-induced filtration | k=M=N=Hℤ_p; M=N=0; t=p | Free case D₀=ℤ_p in homological degree 0, other weights 0; gr⁰=Hℤ_p, gr¹=0 in both induced and Whitehead towers; zero module gives 0 in all steps | General construction has correct free and zero values | Named induced filtration, retaining completeness/exhaustiveness |
| §7.7 amplitude hypothesis | k=H(ℤ_p[[x,y]]), M=N=Hℤ_p, x=y=0; p=2,3 | Koszul tensor has H₀=ℤ_p, H₁=ℤ_p², H₂=ℤ_p; all internal weight 0; induced gr¹=0, output Whitehead gr¹=Σ²Hℤ_p≠0 for either prime | Original unconditional identification is false | Added counterexample and amplitude [0,1] condition |
| §7.7 conditional Whitehead comparison | k=Hℤ_p, M=N=H𝔽_p | Derived tensor has H₀=H₁=𝔽_p, H₂=0; both filtrations have gr⁰=H𝔽_p⊕ΣH𝔽_p and gr¹=0 | Tor₁ fits within one double-speed graded piece | Retained derived tensor, not ordinary tensor |
| §7.7 multiplicative graded comparison | M=N=k=Hℤ_p; elements 2,3 | Product in gr⁰ is 2·3=6 in ℤ_p, equal to product in the tensor output; at p=2, residues multiply 0·1=0 on both sides | Units and products agree | Preserved multiplicativity for even commutative input algebras |
| §7.8 finite-coefficient amplitude/pro comparison | (m₁,m₂)=(9,27),(9,16),(1,1) | H₀=H₁=ℤ/9 for (9,27), all higher 0; for coprime (9,16) and unit (1,1), all groups 0; finite ℤ/9 self-tensor retains nonzero Tor₁ | Bound [0,1] supports Whitehead comparison but not termwise idempotence | Proved amplitude first for ku and KU routes |
| §7.8 dual-tensor classifier filtration | RHom_ℤ(ℤ/9,ℤ)⊗ᴸ_ℤℤ/9 | RHom=Σ⁻¹H(ℤ/9); tensor has H₋₁=H₀=ℤ/9 and H₁=0; gr⁰ lies in degrees −1,0, while τ≥0 would discard H₋₁ | Correct tower is τ≥(2n−1) | Suspended odd dual for lemma, then shifted back |
| §9.3 β and linearization | R=0, R=ℤ_p; p=2 extra factor test | Zero input gives β:0→0; for ℤ_p, π₀β:ℚ_p→ℚ_p is identity, but degree −2 is 0→ℚ_p; Hℤᵗʳⁱᵛ has π₃=0 and THH(Hℤ) has π₃=ℤ/2 | β is a typed map, not an unfiltered equivalence or TP of R⊗Hℤ | Replaced both shorthands by Tate of X⊗Hℤ and added p=2 control |
| §9.4 connective K-theoretic Beilinson argument | R=ℤ_p and nonhenselian R=ℤ | For ℤ_p, relative rational π₁K=ℚ_p=π₁ΣHC; for ℤ, relative rational π₁K=0 but π₁ΣHC=ℚ_p | Finite-coefficient henselian theorem is the needed connective input | Replaced Kinv by Fconn here too |

## Build, gate and dependency outcome

Committed as `9dd2691` with message `RefinedTraceMethods: review repairs (filtrations, trace fibres, Frobenius, and cyclic ownership)`. Only `TauCetiRoadmap/RefinedTraceMethods/README.md` and `TauCetiRoadmap/RefinedTraceMethods/Suggested.lean` changed; the worktree is clean and nothing was pushed.

The required movable dependency check returned exit 0, with no UPWARD or CYCLE line:

```text
depcheck: 45 roadmaps, 487 edges, 0 problem(s)
```

The final `lake build TauCetiRoadmap.RefinedTraceMethods.Suggested` returned exit 0:

```text
✔ [8976/8976] Built TauCetiRoadmap.RefinedTraceMethods.Suggested (2.0s)
Build completed successfully (8976 jobs).
```

The required gate against origin/main returned exit 0:

```text
gate RefinedTraceMethods: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
