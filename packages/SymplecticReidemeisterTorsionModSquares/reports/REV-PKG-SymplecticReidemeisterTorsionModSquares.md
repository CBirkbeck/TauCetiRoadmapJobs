<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1576#issuecomment-6397682724 -->
Review (codex) of b1efe60

Verdict: accepted
Conditional on the announced gaps: `smooth-cell-comparison`, `poincare-boundary-cone`, `normal-torsor-gluing`, `unstable-sl2-chern-lift`, `dyadic-number-field-chern-rank`, `witt-sylow-lift`, `real-chern-bockstein`, `symplectic-universal-cover-kernel`, `arithmetic-scheme-frobenius-detection`

1. **F01** (P3) Liftability needs a negative Check

   **Location:** `packages/SymplecticReidemeisterTorsionModSquares/README.md:898`, Checks in §5.2: “The trivial torsor is liftable by the zero cycle.”

   **Claim:** The three Checks distinguish the image predicate defining Chern-liftability.

   **Witness:** All three permit the wrong predicate “every class is liftable.” Over ℝ the image is {1}, whereas ℝˣ/ℝˣ²={1,[−1]}; §8.2 excludes [−1].

   **Repair:** Add the negative Check that [−1] over ℝ is not Chern-liftable, with its verification in §8.2. Keep this in the README, without adding a Lean declaration. The existing definition is correct.

   **Repair test:** AV-v1 line 233 and §8.2 give zero on full mod-two homology, hence on integral homology modulo two and after stabilization. The actual predicate rejects [−1]; the constant-true predicate accepts it. Thus the added Check separates them.

2. **F02** (P3) “Odd finite groups” names the wrong class

   **Location:** `packages/SymplecticReidemeisterTorsionModSquares/README.md:27`: “The two agree for the odd finite groups supplied below.”

   **Claim:** This describes the finite symplectic groups used to identify integral H₃ modulo two with full mod-two H₃.

   **Witness:** Sp₂(𝔽₃)=SL₂(𝔽₃) has order 3(3²−1)=24, not odd. The identification uses H₂[2]=0, supplied in KTheoryFiniteLocalFields §1.9.

   **Repair:** Replace “odd finite groups” with “finite symplectic groups over odd finite fields.” Retain the preceding universal-coefficient qualification.

   **Repair test:** Sp₂(𝔽₃) now belongs to the named class. At SL₂(𝔽₉), H₂=ℤ/3 still has H₂[2]=0, so the corrected terminology preserves the intended identification without asserting H₂=0.

Two P3 findings; no P1 or P2 findings. Acceptance is conditional on the nine declared supplier contracts listed below. This is the first review. No package mathematics, Lean declarations, metadata, design entries or source entries were changed.

## Verified sound

Read all four package inputs, all 60 numbered targets, their APIs, Checks, proof routes and 60 Needs lines. Checked the nine layer endings and the worked examples. Read the three cached legal sources, including every one of the 15 seeded locators; there were no author-flagged unverified locators. Reviewed the supplier contracts, design gap list, merge order and board package index. The computations below cover every numbered target, including all sampled targets and headline groups; they are mathematical checks, not claims that a sorried build proves the results.

The generality is appropriate: nonacyclic systems, finite projective coefficients where stated, all odd finite fields and then all characteristic-not-two fields. The density-one result is an intermediate theorem, not a restriction on the final theorem. The family invariant retains μ₂-torsors, including Picard 2-torsion. It distinguishes raw extension from normalized specialization. The real conclusion uses full mod-two homology separately. Rank zero, characteristic two, noncompact manifolds and nonnormal families are handled or excluded explicitly. No computational algorithm, copied source passage, replanning of an existing roadmap, sorry-defined data or option override was found.

**Adversarial computations.** In this table square classes are multiplicative, so [a²]=1; the pinned Lean wrapper uses additive identity 0. J is the matrix with rows (0,1),(−1,0), H is a hyperbolic plane, and N=[(−1)^(χ₁/₂/2)]RT. Each row gives actual values, including negative controls where applicable. “Retain” means the stated hypotheses and conventions passed these tests.

| Target | Instances and computed values on the two sides | Result / change |
|---|---|---|
| Conventions | Zero ring: only module is 0 and the empty determinant is 1=0; its spectrum has no points. Over ℚ[ε]/ε², d=εJ has residual H⁰ dimension 2 and parity 0. The latter ring is not a normal domain. | Ring linear algebra includes both; family theorem excludes both. Retain. |
| 0.1 Cochains, shifts, duals, cones | K—2→K shifts to differential −2. Dual-shift comparison has coefficients +1 in degree 0 and −1 in degree 1. Cone(id on K[0]) has H=0; Cone(0) has dimensions (1,1) in degrees (−1,0). | The unsigned shift and identity dual-shift comparison fail. Retain. |
| 0.2 Poincaré structure | Nonzero contractible K—1→K with zero pairing has zero cohomology on both sides of its adjoint, but component adjoint 0 is not invertible. Hyperbolic cross-pairing has unit determinant. Shift sends (ε,n)=(−1,3) to (+1,1). | Quasi-isomorphism is distinguished from strictness. Retain. |
| 0.3 Algebraic boundary | C=K[0], n=0, ε=1, f=a: cone terms are K in degrees −1,0, differential a; cross values are 1 in either order, for a=0 and a=2. Projection kernel is the dual K in degree 0. C=0 gives boundary 0. | Pairing remains strict independently of a. The Lagrangian is the dual summand. Retain. |
| 0.4 Semicharacteristic | Zero complex gives 0. Constant rank-two S³ gives 2−0=2. K in degree 1 at cutoff 1 gives −1, not +1; cutoff 0 gives 0. | Finite support and signed integer sum are necessary. Retain. |
| 0.5 Strictification | The contractible zero-pairing complex contracts to the strict zero model. For d=sJ over ℚ[s]_(s), cross matrix I₂ has determinant 1 at every fibre, while H⁰ dimensions change 0→2. | Strictness does not imply constant cohomology rank. Retain. |
| 0.6 Parity | Rank-one zero differential: lower term sum=1 and χ=1. Invertible J: lower sum=2 and χ=0, equal modulo two. Over 𝔽₂, rank-one d=1 has χ=0 versus lower sum=1. | Two invertible is essential; local constancy is only parity. Retain. |
| 0.7 Splitting | J gives Q=0 and acyclic middle rank 2; rank-one zero differential gives Q=K[0] and middle rank 0; zero complex gives both 0. | Degree placement and even middle rank agree. Retain. |
| 0.8 Cellular duality | Point pairing is its fibre pairing. Positive interval boundary coefficients are (−1,+1). Ordinary cohomology of ℝ has dimensions H⁰=1,H¹=0, so an ordinary closed-manifold perfect pairing would fail. | Compactness and outward-first orientation are explicit. Retain, conditional on the comparison gaps. |
| 1.1 Graded inverse | Odd double inverse has scalar −1; even double inverse +1. Interchanging two odd factors gives −1; grades 1 and 2 give +1. | Right evaluation and parity cannot be discarded. Retain. |
| 1.2 Line square classes | In a rational line, l and 2l have different classes; l and 9l have the same class since 9=3². Two odd roots acquire interchange −1. | A torsor has no chosen scalar origin; square rescaling is precisely the equivalence. Retain. |
| 1.3 Reverse wedge | At dimensions 0,1,2,3,4 the signs are +1,+1,−1,−1,+1. For two rank-one blocks the rank-two correction −1 equals the cross-factor sign (−1)^(1·1). | Ordinary unreversed dual wedge fails at rank 2. Retain. |
| 1.4 Strong evenness | K—id→K has cohomology dimensions 0,0 but term dimensions 1,1. K²—diag(1,0)→K² has even term dimensions 2,2 but cohomology 1,1. Zero complex satisfies both. | Neither parity condition implies the other. Retain. |
| 1.5 Termwise determinants | A rank-two term in degree −1 contributes the inverse determinant line; in degree 0 it contributes the line. At r=1, the quotient σ≥0C/σ≥1C is C⁰ in degree 0, not C¹ in degree 1. | The source's truncation index has been corrected. Retain. |
| 1.6 Cohomology comparison | For K—2→K in degrees 0,1, acyclic volume=1/2 times the based generator; based/acyclic=2. Shift gives the reciprocal scalar. At a=0, H⁰=H¹=K and no acyclic trivialization applies. | No division by zero; supplier shift conventions agree. Retain. |
| 1.7 Lagrangian subcomplex | Hyperbolic coordinate line has L=L⊥, rank 1, quotient dual rank 1. L=0 is Lagrangian only for C=0. In (ℚ²,I₂), the line generated by (1,1) has self-pairing 2, so is not isotropic. | Exact shifted-dual quotient excludes arbitrary isotropic or unmarked subspaces. Retain. |
| 1.8 Root class | Scaling a root by 3 multiplies its square by 9, leaving its class unchanged. Two odd roots produce the extra −1. Either coordinate Lagrangian of a symplectic plane gives the same e∧f class using reverse wedge. | Strong evenness removes the direct-sum correction; the unrestricted sign remains explicit. Retain. |
| 2.1 Symplectic volume | Rank 0 gives 1, rank 2 gives e∧f. In rank 6 over 𝔽₃ the symplectic-basis wedge is nonzero although 3!=0. | The definition uses basis transport, not division by r!. Retain. |
| 2.2 Cellular volume | Reversing a cell with rank-two fibre multiplies its wedge by det(−I₂)=1; rank one would give −1. On a point the volume is the fibre volume. | Even rank removes cell-orientation ambiguity. Retain. |
| 2.3 Simple invariance | A cancelling symplectic pair has attaching matrix ±I₂ and determinant 1. A based rank-one pair with attaching scalar 2 has torsion 2, so arbitrary basis changes cannot be silently called simple volume-preserving moves. | Exact geometric comparison is a declared gap. Retain. |
| 2.4 Duality volumes | Point with half-rank d=1, χ=1 gives (−1)^(dχ)=−1; d=2 gives +1. Closed 3-manifold has χ=0, hence scalar +1. | Half-rank and reverse-wedge sign agree. Retain. |
| 2.5 Torsion | Empty manifold gives 1. Constant plane on S³ gives RT=[−1], N=1. Circle with I₂ and quarter-turn monodromy gives RT=[2]. | Nonacyclic and acyclic cases coexist; replacing RT by N would fail S³. Retain. |
| 2.6 Orientation | Scaling the pairing by −1 changes a rank-one lower root by [−1]. Constant-plane S³ has χ₁/₂=2 and multiplier [(−1)²]=1. | The full semicharacteristic, not its half, belongs in orientation reversal. Retain. |
| 2.7 Three boundary volumes | With C=K² in degree 0 and its dimension-four adjoint zero, D has terms in degrees −1,4: χ(C)=2, χ₁/₂(D)=−2, r≡0, so a=b=c. The middle alternating rank-two block has det J=1 but b/c=−1 and r=1. C=0 gives all 1. | The degree-zero fibre may have a symplectic form; its degree-four pairing is necessarily zero. The parity formula and root sign are correct. Retain. |
| 2.8 Boundary theorem | ∂D⁴ with rank 2 has χ₁/₂=2, RT=[−1], N=1. Rank 4 gives χ₁/₂=4, RT=1. A cylinder boundary contributes N(M)²=1. | Normalization detects the half-sign. Retain. |
| 3.1 Low bordism | Over a point, positive/negative points map to ±1; degrees 1,2,3 have both oriented bordism and integral homology 0. Over Bℤ the labelled circle maps to 1∈H₁=ℤ. At degree 4 over a point Ω⁽SO⁾₄=ℤ but H₄=0. | The range ≤3 and preservation of labels are essential. Retain. |
| 3.2 Three-dimensional evenness | Constant plane on S³ gives χ₁/₂=2. On L(3,1), it gives 2 in characteristic zero and 2−2=0 over 𝔽₃. Degree-three field-extension multipliers at q=3,5 are q²+1=10,26, both 0 modulo 2. | Integer constancy is false; evenness and the finite-field route hold. Retain. |
| 3.3 Even strict models | Rank-one symmetric zero-differential model has χ=1, obstructing an even-term strict model. For sJ, term ranks stay 2,2 while H⁰ jumps 0→2; parity remains 0. | Evenness of the semicharacteristic is the relevant obstruction. Retain. |
| 3.4 Normal-ring extension | Over ℚ[s]_(s), with u=1+s and A=diag(u,u⁻¹)⊕I₂ on H⊕H, generic fixed dimension=2 and raw RT=[−u]; special fixed dimension=4 and raw RT=1. The generic raw class extends as the unit [−u], specializing to [−1]. | Raw extension is not raw specialization. Kummer line pairs retain Pic[2]. Retain. |
| 3.5 Normalized families | In the preceding example generic N=[u] and special N=1, and [u] specializes to 1. Lower term sum s₀=4; lower cohomology ranks are 2 and 4; middle ranks 2 and 0 give root signs −1 and +1, cancelled by the half-sign. | The corrected invariant specializes. Retain. |
| 3.6 Chern map | Finite-field source and target have 2 elements. At 𝔽₃ the nonzero value is [−1]; at 𝔽₅ it is [2], whereas [−1]=1. Zero cycle maps to 1. | A coefficient root of unity is not necessarily a nonsquare scalar. Retain. |
| 3.7 Torsion transformation | A boundary evaluates to 1; a doubled integral class evaluates to N²=1. The constant S³ label is zero in H₃(point), with N=1 despite raw RT=[−1]. | Normalization and integral quotient are indispensable. Retain. |
| 4.1 Zassenhaus | Zero space: D=1, θ=1. Rank-one B=(3), A=−1: D=3, θ=[3], whereas unrestricted plus-one formula gives [2]. Quarter-turn on I₂: D=1/2, θ=[2]. A=−1 on H: D=−1, θ=[−1]. S₃ commutator three-cycle has determinant factor 1/4 and θ=[2]²=1. Q₈ left-quaternion commutator −I₄ has disc(I₄)=1. | Full O formula, unsigned discriminant and reflection convention agree, including nonabelian controls. Retain. |
| 4.2 Circle complex | A=1: d=0, P=B, H⁰=H¹=V and strict. A=−1: d=2, P=0, H=0 and not strict for V≠0. Quarter-turn: det(1−A)=det(1+A)=2. | Both directions of the strictness criterion hold. Retain. |
| 4.3 Strict circle sign | Quarter-turn with x=e₁ gives P(x,dx)=0, but P(dx,x)=1. Here det P=1/2, n=2,h=0,r=1, and normalized class=[2]. For A=1 on I₂, n=h=2,r=0, RT=[−1], normalized class=1. | Differential must be in the stated argument. Retain. |
| 4.4 Odd-characteristic circle | Over 𝔽₃, on H⊕H take A=diag(U,U⁻ᵀ), U with rows (1,1),(0,1). Fixed dimension=2, θ=1, RT=[−1], so N=1. For A=−1 on an even square-discriminant space, h=0 and both sides=1. | Unipotence in positive characteristic is covered without logarithms. Retain. |
| 4.5 Surface cohomology | With H⁰=0, g=2,r=1 gives dim H¹=4 and square discriminant; g=1 gives dimension 0. For a constant plane at g=2, H⁰ dimension=2 and H¹ dimension=8, not 4. | H⁰=0 cannot be omitted. Retain. |
| 4.6 Mapping torus | T=1 on dimension 4: h=4 and RT=θ=1. Quotient polynomial x⁴+1: h=0, det(1−T)=2. Hyperbolic unipotent example has fixed-space restricted determinant 0 but generalized fixed-space determinant class 1. | Generalized eigenspace is necessary in the determinant formula. Retain. |
| 4.7 Genus-two model | With b₁=−I₂, the coefficient of the a₁ cocycle is 1−ρ(a₁b₁a₁⁻¹)=2I₂, determinant 4. Cocycle space dimension 6, principal space dimension 2, quotient dimension 4. Intertwining on the principal plane is T̃ι=ιM⁻¹. | Actual relator and coefficient intertwiner determine the quotient action. Retain. |
| 4.8 Gaussian witnesses | Exact arithmetic in ℚ(i): both relators=I₂; all four intertwining residuals and principal-plane residuals=0. First char polynomial=(x²+1)(x⁴+1), principal polynomial=x²+1, ratio at 1=4/2=2. Second polynomial=(x²+1)³, quotient=(x²+1)², ratio=8/2=4. Reversed twist composition makes the b₂ residual have rows (1−i,1−i),(−1−i,1+i), not zero. | First class [2]=[i] is nonsquare, second [4]=1. Solving (a+bi)²=i forces a²=±1/2 with a rational, impossible. Retain. |
| 5.1 Good fields | On two-element source and target, zero homomorphism has values (0,0), isomorphism (0,1). Constant plane on S³/𝔽₃ has raw [−1] but N=1, hence supplies no nonzero witness. | Goodness is about normalized N. Retain. |
| 5.2 Liftability | Over an odd finite field image has 2 elements, equal to all square classes. Over ℝ image={1}, while target={1,[−1]}. Products correspond to sums of representatives. | Correct predicate; add the negative control in R01. |
| 5.3 Transfer | In the independent quadratic quotient 𝔽₂² all four character pairs occur, including (a,b)=(0,1). This contradicts “a=0 implies b=0”; hence b∈{0,a}. A nonzero specialization excludes b=0, leaving b=a. | Requires independent-pair detection, explicitly contracted. Retain. |
| 5.4 Liftable rank | r₂(ℚ)=0 gives lower bound 2⁰=1 class; r₂(ℚ(i))=1 gives ≥2; a totally imaginary quartic gives ≥4. Stable integral map over ℚ has orders 48→24 and kernel {0,24}. | No false integral K₃ isomorphism; dyadic and unstable inputs are declared gaps. Retain. |
| 5.5 Density | Empty Frobenius set has size 0 and is not controlling. A finite exceptional set contributes C/X→0. Degree≥2 primes have normalized weight O(log X/√X)→0. Alternating dominating blocks give two lower-density-zero sets whose union has density 1. | Upper density zero is the correct exceptional-set condition. Retain. |
| 5.6 Witness extension | For α=[i] over ℚ(i), adjoining √i has degree 2 and nonidentity Frobenius proportion 1/2. For α=1 the extension has degree 1 and nonidentity set is empty. | Nontriviality hypothesis is essential. Retain. |
| 5.7 Composita | For E₁=E₂ quadratic, compositum Galois group has size 2 and maps diagonally into a product of size 4. Independent quadratic nonidentity preimages have union size 3/4 of the group. Two empty sets give size 0. | Only individual restriction maps are asserted surjective; empty union excluded. Retain. |
| 5.8 Intermediate fields | Identity intermediate extension has multiplicity 1. A split prime of ℚ(i)/ℚ has two primes of norm p; an inert prime has one of norm p². Inert rational proportion=1/2 but upstairs weighted proportion=0. | The argument uses bounded multiplicity and degree-one tails, not equality of densities across fields. Retain. |
| 6.1 Independent classes | Independent α,β produce the character pattern (0,1) with proportion 1/4. For β=α that pattern has proportion 0; β=1 has no nonsquare specialization. | The span exclusion is necessary. Retain. |
| 6.2 Multiquadratic extension | dim W=1 with W≠〈α〉: group size 2, nonidentity set size 1. dim W=2: sizes 4 and 3. W=0: sizes 1 and 0, violating controlling nonemptiness. | The explicit W≠0 repairs the source edge case. Retain. |
| 6.3 Imaginary cyclic field | h=4: primes 5 or 13 give odd (p−1)/h and nontrivial complex conjugation in the degree-four quotient. At p=17 that quotient kills conjugation since (p−1)/h=4. | The stronger congruence, not merely p≡1 mod h, enforces total imaginarity. Retain. |
| 6.4 Amplification | δ=1/2,h=8,N=4 gives (δ−2⁻ᴺ)/h=7/128, exceeding δ³/16=1/128. δ=1/4,h=12,N=6 gives 5/256, exceeding 1/1024. δ=0 is outside this positive-defect choice. | No unjustified product decomposition of the larger Galois group. Retain. |
| 6.5 Density one | Gaussian quadratic seed controls fraction 1/2. Any positive defect δ is reduced by a positive amount ≥δ³/16, so a limiting maximal defect must be 0. Omitting prime 2 changes normalized weight by log(2)/X→0. | Density one follows, without yet naming every individual finite field good. Retain. |
| 7.1 Characteristic zero | Spec ℤ[1/2] has normalized total 1. Spec ℤ[1/2,t], dimension 2, has degree-one count ∑p≤Q p log p∼Q²/2, normalized total 1/2. Bad prime contribution ≤Q^(d−1)o(Q)=o(Qᵈ); prime-power tail O(Q^(d−1/2)log²Q)=o(Qᵈ). | A positive cQᵈ nonsplit lower bound suffices; universal total limit 1 would be false. Retain. |
| 7.2 Witt lift | Sp₂(𝔽₃) has order 24, Sylow-2 order 8 and index 3. Inclusion after transfer multiplies by 3≡1 mod 2. Averaging uses 8⁻¹=2 in 𝔽₃; in characteristic 2 this denominator is 0. | Integral classes modulo two lift; no integral surjectivity claim is needed. Retain, conditional on Witt gap. |
| 7.3 All finite fields | For q=3 and q=9 the finite-rank integral quotient and Kummer group each have 2 elements; characteristic-zero lift identifies their nonzero evaluations. At q=9, H₂=ℤ/3 has 2-torsion 0. Rank 0 has degree-three source 0. | Covers every odd q, including the exceptional integral H₂ case. Retain; terminology R02. |
| 7.4 All fields | Algebraically closed K has square-class group {1}, so both values are 1. Finite data over 𝔽₃(t) descend to 𝔽₃[t,1/f]; characteristic remains 3. Identity base change is the identity; specialization ℚ[s]_(s)→ℚ cannot induce an embedding ℚ(s)→ℚ fixing ℚ and sending s to 0. | Uses finite data and torsor descent, not a characteristic-zero embedding or nonexistent fraction-field map. Retain. |
| 7.5 Topological theorem | Constant plane on S³: χ=2, raw RT=[−1], normalized N=1=Chern evaluation of zero label. Gaussian example: χ=0, N=[2]=Chern value. Two copies give [2]²=[4]=1. | The theorem names the actual normalized torsion and fundamental cycle. Retain. |
| 7.6 Mapping-class identity | Identity on four-dimensional surface cohomology gives h=4, χ₁/₂=−4 and θ=1=Chern value. Gaussian action has h=0 and θ=[2]=Chern value. | Wang-sequence and half-sign conventions agree. Retain. |
| 8.1 Metaplectic component | Positive-rank covering generator maps 1→1 mod 4→1 mod 2, so the coefficient Bockstein of its cover class is 0. Rank-zero fundamental group is 0, not ℤ. The nonzero integral H²(C₂;ℤ) class reduces to t² but β(t²)=0. | Integral lift, rather than vanishing of the cover class, is used. Retain. |
| 8.2 Full real vanishing | For Gal(ℂ/ℝ)=C₂, β(t)=t²≠0 between one-dimensional groups. Thus β(c₃₁)=0 forces c₃₁=0 on every full mod-two cycle; an integral-only argument would leave the H₂[2] cokernel uncontrolled. | Correct larger domain and separate Bockstein route. Retain; also supplies R01's negative control. |

The zero-ring and square-zero controls above belong only to the ring linear algebra. Rank and dimension formulas over fields use genuine finite dimension. The Lean determinant's fallback value outside finite-free modules is therefore never used. No natural-number subtraction, out-of-range index, zero-polynomial degree, q=1 “finite field,” or denominator at zero enters the retained signature. The general field argument includes inseparable positive-characteristic fields: it descends finite matrix and bar data, without assuming separability of the coefficient field.

**Seeded source verification.** Page numbers below are the printed pages of the manifest's exact versions. All listed extracts were readable. The source's original setting is distinguished from a derived extension or correction in this package.

| Seeded target | Text read at locator | Hypotheses and conclusion checked |
|---|---|---|
| 0.4 Semicharacteristic | AV-v1 lines 3047–3064, A.6.1 (A.10), pp.65–66; lines 578–584, §2.3.4, p.13 | Signed finite lower cohomology sum; arbitrary cutoff is the explicit finite-sum extension. The 3-manifold convention is dim H⁰−dim H¹. |
| 1.1 Graded lines | AV-v1 lines 3181–3195, B.1 (B.1)–(B.2), pp.68–69 | Parity, right evaluation, order reversal and the odd signed double inverse. |
| 1.4 Strong evenness | AV-v1 lines 3415–3442, B.4.1, pp.73–75 | Even term dimensions, not even cohomology. The finite-projective formulation uses fibre ranks; no quasi-isomorphism invariance is claimed. |
| 1.7 Lagrangians | AV-v1 lines 3570–3589, B.5 (B.18), pp.76–77 | Isotropic subcomplex with shifted-dual quotient; degreewise split projective extension is specified, not inferred from mere isotropy. |
| 1.8 Root class | AV-v1 lines 3587–3652, B.5 (B.19) and direct-sum comparison, pp.76–78 | Squared determinant root, strong-evenness qualification and the otherwise present (−1)^(d₁d₂). |
| 2.4 Duality volumes | AV-v1 lines 3783–3801, B.7.1 (B.24)–(B.27), pp.80–81 | Reverse-wedge sign (−1)^(dχ) uses half coefficient rank d. |
| 2.7 Boundary volumes | AV-v1 lines 3653–3749, B.6 (B.20)–(B.23), pp.78–80 | Strongly even input, dimension divisible by four, acyclic middle sign. Package corrects the Lagrangian, swapped block labels, degree count and parity-only interpretation. |
| 3.2 Three-dimensional evenness | AV-v1 lines 588–603, §2.3.4, p.14; lines 695–742, §2.7, pp.16–17 | Closed oriented 3-manifold, symplectic coefficients, two invertible; reduction uses degree-three finite-field restriction. H₂ odd order suffices. |
| 3.7 Normalized transformation | AV-v1 lines 618–682, §§2.4–2.6, pp.14–16 | The sign-normalized invariant descends through labelled bordism to integral H₃/2. Full mod-two homology is explicitly distinguished at AV-v1 line 690. |
| 4.2 Circle complex | AV-v1 lines 3003–3010, A.4 (A.8), p.64; B.9, pp.82–85 | Source presents oriented orthogonal monodromy. The displayed chain-pairing and quasi-isomorphism calculation also works for every isometry; determinant-one/even-rank hypotheses are imposed separately for topological torsion. |
| 4.8 Gaussian class | AV-v1 lines 4053–4070, C.1; lines 4196–4245 and 4246–4302, C.4, pp.89–90 | Generator words, coefficient intertwiner, action order, principal quotient and both characteristic polynomials were recomputed exactly. Nonsquareness is over ℚ(i), not merely over ℚ. |
| 5.1 Good fields | AV-v1 lines 743–749, Definition 2.7.1, pp.17–18 | Positive rank, odd q and equality/nonzero criterion on the two-element group. Package consistently uses normalized N. |
| 5.7 Composita | AV-v1 lines 903–912, Lemma 2.11.2, p.21 | Union of restriction preimages; no linear-disjointness assumption. Package removes the false surjectivity-to-product arrow and uses upper-density-zero exceptions. |
| 7.1 Characteristic zero | AV-v1 lines 1108–1131, §2.14, pp.25–26 | Normal integral finite-type base, quadratic detection and negligible bad-prime contribution. Package uses positive-order count rather than the source's erroneous universal limit 1. |
| 7.3 Every odd finite field | AV-v1 lines 1132–1151, §2.15, p.26 | Sylow transfer, Witt lifting, finite coefficient ring and normal closure. Package only lifts the required integral quotient modulo two, repairing the proof's integral-lift wording. |

Also checked JRV lines 782–810, Theorem 5.1 and (5.1), pp.16–17: the formula is for the full orthogonal group, with the generalized minus-one space and associated symmetric form. The stable exponent dim V in Lean realizes that decomposition, including dim V=0. The invariance witness for the stable image follows from t·tⁿ=tⁿ·t and is not a hidden spinor-norm hypothesis. AV-v1's circle proof at B.9 explicitly restricts its argument to characteristic zero; the package's alternating-form and primary-decomposition proof supplies the all-odd-characteristic extension and was checked on the unipotent 𝔽₃ example.

Thom lines 2523–2537, Chapter IV §8, Theorem IV.13, printed p.81, give the low oriented coefficient groups. The package correctly obtains the labelled-space comparison from the separately supplied filtration, rather than attributing labelled bordism to that coefficient theorem. AV-v1 lines 230–247 support the separate full-mod-two real conclusion, and lines 422–430 support the topological end theorem with its sign.

**Pinned library and duplication audit.** The content main revision inspected was `86e155ca`. The manifest pins were Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The paths in this table are relative to the respective pinned library repository.

| Declaration opened | File and line | What it supplies, and what it does not supply |
|---|---|---|
| HomologicalComplex; CochainComplex | `Mathlib/Algebra/Homology/HomologicalComplex.lean:59`, `:157` | Terms, differential, shape and d²=0. No boundedness, projectivity, pairing or chosen cellular volume is bundled. |
| HomologicalComplex.homology | `Mathlib/Algebra/Homology/ShortComplex/HomologicalComplex.lean:89` | Native homology under its HasHomology hypotheses. |
| groupHomology | `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:228` | Homology of a representation over a commutative ring; integral trivial coefficients are a specialization, not implicit full mod-two coefficients. |
| Sylow | `Mathlib/GroupTheory/Sylow.lean:54` | Maximal p-subgroup carrier. It does not itself impose a finite ambient group. The package's transfer application does. |
| SymplecticGroup.det_eq_one | `Mathlib/LinearAlgebra/SymplecticGroup.lean:385` | Finite matrix symplectic determinant 1 over a commutative ring. Imported for volume transport. |
| associatedHom; associated_apply; associated_isSymm | `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:853`, `:861`, `:875` | The half-polar associated bilinear form; its diagonal is Q, not 2Q. |
| Module.Basis | `Mathlib/LinearAlgebra/Basis/Defs.lean:89` | A basis as a linear equivalence to finitely supported coordinates. Finite index in the target is explicit. |
| LinearMap.ker; range; restrict | `Mathlib/Algebra/Module/Submodule/Ker.lean:59`; `Range.lean:57`; `LinearMap.lean:209` in that directory | Native submodules and restriction to a preserved submodule. The witness only asserts t(U)⊆U. |
| LinearMap.det | `Mathlib/LinearAlgebra/Determinant.lean:173` | Basis-independent determinant, with fallback 1 when no finite basis exists. All spaces in the acceptance theorem are finite-dimensional, so that fallback cannot mask a defect. |
| Matrix.det | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:63` | Finite square-matrix determinant from the alternating row map; the empty matrix has determinant 1. |
| SquareClassGroup; squareClassHom; squareClass_eq_zero_iff | `TauCeti/FieldTheory/SquareClassGroup/Basic.lean:45`, `:73`, `:83` | Units modulo squares, additive identity 0 and its multiplicative wrapper. No determinant-line torsor or chosen origin is supplied. |
| RingHom.squareClassMap | `TauCeti/FieldTheory/SquareClassGroup/Multiplicative.lean:149`, `:157` | Functoriality of scalar square classes, not generic extension of μ₂-torsors. |
| orthogonalGroup | `TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup/Basic.lean:180` | Linear automorphisms preserving Q. Finite dimension and nondegeneracy are additional explicit target hypotheses. |
| orthogonalSpinorNorm; reflectionOrthogonal value; spinorNorm; spinorNorm_apply | `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Basic.lean:96`, `:121`, `:143`, `:149` | The existing norm and SO restriction, reflection value [Q(v)]. Standing field, finite-dimension and invertible-two binders were read at lines 64–65. |
| IsLagrangian | `TauCeti/Geometry/Symplectic/Lagrangian/Basic.lean:99`, real-module context at `:59` | Symplectic complement equality for real vector subspaces. It is not the bounded projective cochain carrier or shifted-dual exact sequence needed here. |

Searches used the objects as well as names: determinant lines and triangle coherence, shifted duality, Lagrangian complexes, semicharacteristic, Reidemeister torsion, spinor norm and Zassenhaus, finite symplectic H₃, Kummer torsors, generic-fibre cover comparison, and the metaplectic cover. The roadmap service searched main and the indexed open heads; local searches covered both pinned libraries and the available board packages. No second declaration with the acceptance theorem's fully qualified name was found.

The generic determinant functor belongs to KTheoryLowDegrees and PadicMeasuresIwasawaAlgebras; this package's retained work is the explicit AV reverse-wedge/right-evaluation comparison, not another functor. OrthogonalSpinGroups on main supplies the norm API and reflection conventions; its README and Suggested.lean do not state this full Zassenhaus determinant formula. HermitianKTheoryOfPoincareCategories §4.7 uses homotopy-fixed-point symmetric Poincaré data and cobordism/L-groups; the present termwise signed pairings, strictness, determinant roots and torsion normalization are a distinct adapter, not a reconstruction of those L-groups. The open Morse/Novikov torsion work concerns completed Novikov coefficients and dynamical/Euler-structure comparisons, not this nonacyclic symplectic square-class invariant. Arithmetic central-value and Hurwitz/PEL conclusions remain with SymplecticLFunctionsModSquares.

**Cross-roadmap citations resolved.** Read the supplied sections on main, or their indexed open heads where they introduce a new roadmap. These are resolved section contracts, not recollections of similar titles.

| Supplier and location | Resolution and convention witness |
|---|---|
| KTheoryLowDegrees §§14.1–14.4 | Open-head `TauCetiRoadmap/KTheoryLowDegrees/README.md:1300` onward: integer-graded lines, parity, determinant and ordered triangle/shift/acyclic/cone coherence. Odd self-interchange=−1. |
| PadicMeasuresIwasawaAlgebras §5.1 | Main `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:3172` onward, cone comparisons at 3268 onward. Its degree-(−1,0) acyclic normalization shifts to the package's degree-(0,1) volume a⁻¹; a=2 gives ratio 2. |
| AlgebraicTopology Stages 2,4,5,6 | Main local coefficients and cellular comparison; Stage 5 Wang/transfer; Stage 6.3 relative fundamental class and local-system duality. The explicit interval check at `TauCetiRoadmap/AlgebraicTopology/README.md:1423` gives endpoint signs −1,+1; local-system duality at 1515 onward. Signed cone comparison remains a gap. |
| GeometricTopology Layers 1,11 and smoothing comparison | Main smooth manifold and PL/smoothing interfaces, including `TauCetiRoadmap/GeometricTopology/README.md:930` onward. General finite smooth-compatible volume-preserving cell comparisons are expressly contracted, not assumed from a triangulability assertion. |
| TangentialBordism B1–B2.5, B3.1 | Open-head fundamental-class/filtration interfaces and coefficient table, `TauCetiRoadmap/TangentialBordism/README.md:265` onward. Ω⁽SO⁾₀=ℤ, degrees 1–3 zero, degree 4=ℤ; the labelled circle over Bℤ maps to 1. |
| StableHomotopyKTheory §§1.17,1.30,1.32 | Open-head filtered-colimit homology, discrete-group classifier, bar/nerve comparison; `TauCetiRoadmap/StableHomotopyKTheory/README.md:288`, 440 and 465 onward. The bar comparison retains integral coefficients and its group-operation convention. |
| SchemeAndStackFoundations §§0.9,0.21,2.9,2.11 | Main approximation, excellence/Nagata finiteness, étale μ₂ and Kummer line pairs. §0.21 consumes §0.20's normalization result; it is not a missing-section citation. Kummer line pairs occur at `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3656` onward. Generic full faithfulness is the declared gap. |
| KTheoryFiniteLocalFields §§1.5,1.8,1.9 | Open-head restriction/transfer, universal Chern construction and finite-rank comparison, `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:253`, 302, 326 onward. Multipliers 10,26 and the q=9 odd H₂ exception agree. Witt and real comparisons are gaps. |
| K3BlochGroups §§2.4–2.5,4.20,6.7 | Open-head stable Hurewicz/rank, natural Suslin sequence and finite-coefficient comparison, `TauCetiRoadmap/K3BlochGroups/README.md:471`, 504, 1682, 2253 onward. The ℚ map 48→24 is not an integral isomorphism. Unstable and dyadic refinements remain explicit contracts. |
| Chebotarev Layers 7,11.3,13 | Main cyclotomic disjointness, degree tails and weighted natural density. `TauCetiRoadmap/Chebotarev/README.md:265` onward, 452 onward, and 610–625. Nonidentity C₂ proportion=1/2. Arithmetic-scheme detection and positive counting are separately contracted. |
| RepresentationTheory/LieGroups Layer 5 | Main `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:358` onward: connected Lie-group universal cover with discrete central fundamental-group kernel. It does not identify every such kernel with ℤ; the symplectic identification is a positive-rank gap. |
| MetaplecticAutomorphicForms §2.4b | Open-head `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:476` onward: topological double cover, central sign, real and zero-space cases. This does not by itself identify the universal covering kernel. |

The source resolver reported no unresolved cross-roadmap citations or Lean names against main `86e155c` and the 362-head index dated 2026-10-25T11:51:01Z. Library claims were additionally checked in the actual pins rather than inferred from that resolver.

The dependency command required by the brief completed successfully. Its complete output was:

```text
depcheck: 51 roadmaps, 586 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The 60 local Needs lists were also read for semantic dependencies; none consumes the later arithmetic consumer. The nine gap slugs occur in both the README's Exact supplier contracts and the top-level design gaps. Their named owners precede this package or are on main. Each requests a specific missing compatibility or extension; no identical complete contract was found already supplied in the inspected libraries and roadmaps:

| Conditional gap | Owner and section | Remaining contract checked |
|---|---|---|
| smooth-cell-comparison | GeometricTopology Layer 11 | Finite smooth-compatible triangulations, boundary dual cells and simple comparison maps preserving transported local-coefficient volumes in every finite dimension. |
| poincare-boundary-cone | AlgebraicTopology Stage 6.3 | Pairing-compatible boundary-cone identification with outward-first duality, finite projective self-dual coefficients and two invertible. |
| normal-torsor-gluing | SchemeAndStackFoundations §§2.9,2.11 | Generic full faithfulness for covers already defined on an arbitrary normal integral affine base; not extension of ramified covers. |
| unstable-sl2-chern-lift | K3BlochGroups §§2.4,4.20 | Natural integral H₃(SL₂) surjection to indecomposable K₃ for every infinite field, with stabilization compatibility. |
| dyadic-number-field-chern-rank | K3BlochGroups §§2.5,6.7 | The stated dyadic surjection, real-place-corrected rank bound and injective Kummer reduction with standard-representation normalization. |
| witt-sylow-lift | KTheoryFiniteLocalFields §1.9 | Compatible representation lifts through all truncated Witt rings in odd residue characteristic. |
| real-chern-bockstein | KTheoryFiniteLocalFields §1.8 | The real standard-representation Chern components, metaplectic identification and the two coefficient Bocksteins. |
| symplectic-universal-cover-kernel | RepresentationTheory/LieGroups Layer 5 | Positive-rank symplectic kernel ℤ and its quotient by 2ℤ, with the chosen central generator. |
| arithmetic-scheme-frobenius-detection | Chebotarev Layer 13 extension | Quadratic and independent-pair detection on normal integral affine finite-type ℤ[1/2]-schemes; characteristic-zero positive cQᵈ bound and uniform O(q^(d−1)) count. |

**Shape, headline coverage and Lean acceptance.** Main roadmaps AlgebraicTopology, GeometricTopology and PadicMeasuresIwasawaAlgebras were read for shape and ownership context. The package has the requested summary, scope, conventions, supplier contracts, build paragraph, nine ordered layers, examples/dependencies endings, consumers, worked examples and references. Definitions retain prose APIs and at least three Checks; R01 concerns discrimination, not the count. The README is mathematical prose with Unicode notation and source locators. Metadata's math.GT topic is appropriate.

The headline inventory is:

- §§0.5–0.7: strictification, parity and strict splitting.
- §2.8 and §§3.1–3.5: boundary torsion, low labelled bordism comparison, 3-dimensional evenness, even strict models, normal extension and normalized specialization.
- §§4.1,4.4,4.6,4.8: full Zassenhaus formula, all-odd-characteristic circle formula, mapping-torus formula and nonsquare Gaussian witness.
- §§5.3–5.4,6.4–6.5: transfer, liftable rank, quantitative amplification and density one.
- §§7.1–7.6: characteristic-zero comparison, every odd finite field, all-field transformation equality, topological theorem and mapping-class identity.
- §§8.1–8.2: real metaplectic component and full-mod-two Chern vanishing.

The one native signature is the genuinely deep full Zassenhaus formula. Suggested.lean lines 10–25 name the remaining headline families and their missing signed Poincaré, labelled smooth bordism, cellular torsion, determinant-root, equivariant étale slant or real Chern/Bockstein carriers. Native cochains and group homology alone do not supply those objects. Encoding them by free predicates or large replacement structures would be a stand-in. No statable headline was found omitted under the acceptance-test rules.

The package file was elaborated with the prescribed `lake env lean` command from the pinned content checkout. Exit status 0; the only warning was the expected declaration-uses-sorry warning at Suggested.lean line 40. The imported Tau Ceti object file was present, so no build was required. Imports are the single `import Mathlib` and the individually used spinor-norm module. No options, sorry-data declarations or auxiliary theorem catalogue occur.

A separate scratch copy added `#check @TauCetiRoadmap.SymplecticReidemeisterTorsionModSquares.zassenhaus_primary_formula` and elaborated successfully, again with only the sorry warning. All field, finite-dimensionality, invertible-two, nondegeneracy, basis and preserved-image binders occur in the elaborated type. This also agrees with the supplied signature extraction. No binders were lost and no signature change was needed.

The one-tactic probe replaced its sorry separately by `simp`, `rfl` and `infer_instance`. All failed: simp left the substantive determinant/spinor equality, rfl could not prove the existential goal, and infer_instance had no class goal. The pinned norm/reflection API and object searches expose no one-lemma exact replacement. The statement is neither a definition expansion nor a small-value/boundary Check. There is no padding to delete.

## Not verifiable

- Ownership against every separately hosted board branch cannot be certified from this checkout. The supplied package index was read before absence claims. In particular, the relevant `packages/SchemeAndStackFoundationsPartII/README.md` at indexed head `accb0a0` returned HTTP 404. No absence or duplication finding is based on that failure. Available board files, main and indexed open roadmap heads were searched; unreadable independent board branches are not represented as inspected.
- The nine declared supplier extensions are future contracts, not established implementations. Acceptance is conditional on their delivery. Their absence today was not counted as an unowned prerequisite.
- No cited source was unreadable. Thom's institutional scan was available through the supplied OCR extraction. No additional source request or manifest modification was needed.
- Elaboration establishes well-formed signatures, not the truth of the admitted theorem. The finite examples and source/proof-route checks above do not replace its eventual general formal proof.

## Source issues

These are issues in the cited versions, not additional package findings. The package already avoids the consequential errors.

- **Misprint** in AV-v1 at A.6.1 proof of (A.11), printed p.66, AV-v1 line 3076: the source says the alternating form is perfect on the cokernel of the middle differential; it should be perfect on C⁰/ker d⁰; affects the proof.
- **Misprint** in AV-v1 at B.4.1 (B.14), printed p.74, AV-v1 line 3450: the source says successive brutal truncations have quotient Cʳ[−r]; it should be Cʳ⁻¹[1−r]; affects the proof.
- **Misprint** in AV-v1 at B.6 item (a), printed p.78, AV-v1 line 3666: the source says the cone Lagrangian is C; it should be the embedded shifted dual C∨[−n]; affects the proof.
- **Misprint** in AV-v1 at B.6 block comparison, printed p.79, AV-v1 lines 3698–3715: the source says D₂ is acyclic after initially assigning acyclicity to D₁; it should be consistent about the labels, with sign (−1)ʳ on the acyclic block; affects the proof.
- **Misprint** in AV-v1 at B.6 following (B.21), printed p.80, AV-v1 lines 3735–3749: the source says the middle half-rank equals the displayed Euler expression as an integer; it should be congruent modulo two, as (B.23) states; affects the proof.
- **Misprint** in AV-v1 at B.6 dimension count before (B.23), printed p.80, AV-v1 line 3745: the source says the cone's degree-i dimension is cᵢ+cₙ₋₁₋ᵢ; it should be cₙ₋ᵢ+cᵢ₊₁ with its stated cone convention; affects the proof.
- **Error** in AV-v1 at Lemma 2.7.1, printed p.16, AV-v1 lines 698–699: the source says the finite classical groups all have vanishing integral H₂; it should be odd-order H₂, allowing H₂(SL₂(𝔽₉))=ℤ/3; affects a stated result.
- **Error** in AV-v1 at B.10 naturality assertion, printed p.86, AV-v1 lines 4023–4034: the source says raw cohomological torsion commutes with arbitrary normal-domain specialization; it should be the half-semicharacteristic-normalized class that has this naturality; affects a stated result.
- **Error** in AV-v1 at Lemma C.2.1 (C.2), printed p.87, AV-v1 lines 4081–4083: the source says the discriminant factor uses the ordinary fixed space; it should be the generalized +1 eigenspace, whose restricted form is nondegenerate; affects a stated result.
- **Gap** in AV-v1 at (2.15) and Lemma 2.11.2, printed pp.20–21, AV-v1 lines 868–873 and 910–912: the source says lower-density-zero exceptional sets can be united while retaining density zero; it should be upper-density-zero exceptional sets; affects the proof.
- **Misprint** in AV-v1 at Lemma 2.11.2, printed p.21, AV-v1 line 909: the source says the compositum group surjects onto the product of the two Galois groups; it should be a map to that product, with individually surjective projections; affects the proof.
- **Error** in AV-v1 at Lemma 2.12.2, printed pp.22–23, AV-v1 lines 973–979: the source says every W different from 〈α〉 gives a controlling nonidentity set; it should also require W≠0; affects a stated result.
- **Error** in AV-v1 at §2.14 density normalization, printed p.25, AV-v1 line 1122: the source says every affine base has normalized total closed-point count tending to one; it should use a positive order-Qᵈ bound, since the affine-line-over-integers example gives one half; affects a stated result.
- **Gap** in AV-v1 at §2.15 Sylow lifting proof, printed p.26, AV-v1 lines 1138–1140: the source says two-adic surjectivity lifts an arbitrary integral homology representative; it should lift its class modulo two, which is all the claim needs; affects the proof.
- **Misprint** in JRV at proof of Theorem 5.1, printed p.16, JRV line 793: the source says the stable image is formed with σ; it should use the theorem's isometry γ; affects nothing.

For reproducibility of the two source sign/index issues not requiring a long matrix calculation: in B.6 take C=K² in degree 3 with zero dimension-four pairing. Then the actual middle acyclic half-rank is 0, while (χ(C)+χ₁/₂(D))/2=(−2−2)/2=−2, equal only modulo two. For B.10 take the constant symplectic plane on L(3,1) over ℤ[1/2]: χ₁/₂ changes from 2 over ℚ to 0 over 𝔽₃, raw classes change from [−1] to 1, and normalized classes are both 1. For the §2.15 integral inference, a Sylow Q₈ in SL₂(𝔽₃) has H₃ of order 8, whereas the ambient H₃ has order 24; an integral generator cannot lie in that image, although the required mod-two class does.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "b1efe60c8970713a414677f16eae9fe1b2da99eb", "job": "REV-PKG-SymplecticReidemeisterTorsionModSquares", "model": "gpt-6-astra", "worker": "chris-13"} -->
