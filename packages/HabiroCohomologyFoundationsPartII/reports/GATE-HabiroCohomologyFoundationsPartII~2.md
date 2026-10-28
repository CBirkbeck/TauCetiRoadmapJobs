## H01 (CBirkbeck) — applied

“Unique étale lift of the completed algebra” → ordinary marked étale lift followed by p-completion in `TauCetiRoadmap/HabiroCohomologyFoundationsPartII/README.md:139` and `TauCetiRoadmap/HabiroCohomologyFoundationsPartII/README.md:245`, with uniqueness and functoriality in the completed category. The localization Checks at lines 158 and 258 retain ℤ[x]→ℤ[x,x⁻¹] at p=2,3, and verify why its completed map is only p-completely étale; the ordinary lifting theorem is HA line 52724.

## H02 (CBirkbeck) — applied differently

Implicit relative lifting → relativeFormalEtaleLift with explicit completed-cotangent hypothesis, reduction marking, mapping-space uniqueness, completed base-change coherences and square-zero/Postnikov inverse-limit construction in `TauCetiRoadmap/HabiroCohomologyFoundationsPartII/README.md:142`, consumed by quotientLift_identityCover at line 369 (KU line 3715; HA line 51577). Base change is qualified by ordinary reduction: the nonflat Check at line 161 computes π₀=π₁=ℤ_p, so an unconditional ordinary-output claim would be false; `TauCetiRoadmap/HabiroCohomologyFoundationsPartII/Suggested.lean:10` records the absent spectral carriers instead of introducing stand-ins.

## H03 (CBirkbeck) — applied

The bounded-below solid tensor contract now explicitly carries gap:cardinal-interchange through SolidAnalyticRings §4.1, in `TauCetiRoadmap/HabiroCohomologyFoundationsPartII/README.md:23`, line 93 and §0.2 Needs at line 183. Generic ownership stays in EnhancedDerivedSheaves, and the wording preserves the prerequisite identified by `TauCetiRoadmap/SolidAnalyticRings/README.md:71` and its §6.4, rather than claiming its existing cardinal and stabilization sections already prove it.

## H04 (CBirkbeck) — applied

The same supplier contract and §0.2 Needs now carry gap:light-countable-ab6 through SolidAnalyticRings §4.2, with light abelian ownership retained in the continuation of VStackSheavesAndLisseCategories VS2.1 (`TauCetiRoadmap/HabiroCohomologyFoundationsPartII/README.md:23`, line 93 and line 183). This preserves the independent-directed-bound requirement of `TauCetiRoadmap/SolidAnalyticRings/README.md:79`; exact countable products are not substituted for it.

**Finding order.** H01–H02 are the completed-étale and relative-formal-lifting points of the first numbered review finding; H03–H04 are the two separate inherited obligations of its second finding. No question required a separate answer.

**Ownership and citations.** Supplier locators were resolved against main 82e5289 and the supplied open heads, with object searches over the main/open-roadmap inventory and board packages. QWittVectors §2.5 owns relative perfection, EnhancedDerivedSheaves E5:cotangent-export.1 owns animated cotangents and their square-zero mapping property, and StableHomotopyKTheory owns the generic spectral/algebra carriers; the marked spherical lifting and spectral deformation comparison specialized to these trace inputs are owned by §0.1 here, with no earlier owner found. The inherited interchange obligations stay with their existing categorical and light abelian directions; no supplying continuation section for either missing contract was identified in the inspected inventory, and none was invented. The three citation leads Prismatic.Trace.gradedTCMinus, gradedTP and gradedTC are intended supplier API in PrismaticCohomologyPartIII §7.0, explicitly listed at `TauCetiRoadmap/PrismaticCohomologyPartIII/README.md:879`; they are not claims about declarations at the library pins.

**Pinned interfaces and acceptance file.** The library copies match Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Mathlib/RingTheory/Etale/Basic.lean:46 defines Algebra.FormallyEtale by vanishing Kähler differentials and H1Cotangent; line 205 additionally requires finite presentation for Algebra.Etale, with no module-finiteness field, while Mathlib/RingTheory/Smooth/Basic.lean:539 also includes finite presentation. The arithmetic declarations and source locations in the supplier contract were checked at these pins, and searches found no spherical lifting, THH, q-Hodge or completed spectral-cotangent carrier on which to state the added headline. The mechanical declaration inventory of Suggested.lean is empty, so the required #check @name list is empty and there are no elaborated declaration binders to lose; the target build elaborates this file, and the only Lean change is the new unavailable-headline entry. No source work was added: the existing certified KU and HA entries supply the locators above, and all eight recorded source extractions are available; no missing text was encountered.

**Adversarial mathematics record.** Values below are instance calculations, not proofs of the general targets. The added relative lifting theorem has explicit prime, completeness, connectivity, reduction-marking and cotangent hypotheses; static completed base change is a separate condition, not an inferred flatness assertion.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Universe and small-diagram conventions | Empty diagram and empty variable set in the fixed universe | Empty product is the unit; polynomial algebra on no variables is A | Compatible | None |
| Positive monomial exponent convention | r = 0,1,2 | d(1)=0; d(x)=dx; d(x²)=2x dx at q=1 | No negative exponent needed at r=0 | None |
| q-integers | n=0,1,2; q=1 | [0]=0; [1]=1; [2]=1+q, specializing to 0,1,2 | Compatible | None |
| Descending filtration and nonpositive steps | Unit input; i=-1,0,1 | F⁻¹=F⁰=ℤ[[h]]; F¹=hℤ[[h]] | Compatible | None |
| Rees and Bott normalization | βt=h; weight-one trace class | β of degree 2 becomes degree 0 after Σ⁻²; βt has degree 0 and value h | Compatible | None |
| Filtered quotient by β | Unit input, i=0,1 | F/β has values ℤ,0; degreewise h quotient would give ℤ,ℤ | Wrong quotient excluded | None |
| Derived quotient convention | Zero scalar on a nonzero module M | cofib(0:M→M)=M⊕ΣM; static quotient is M | Higher term retained | None |
| Completion before rationalization | ℤ at p=2; ℚ at p=2 | ℤ₂[1/2]=ℚ₂; ℚ completed at 2 is 0 | Order matters | None |
| Chosen pair with all four clauses | Unit and zero ring | Unit has F⁰=ℤ[[h]], F/β at 0=ℤ; zero ring has uncompleted F⁰=ℚ[[h]] and completed F=0 | Pair differs from completion | None |
| q-Hodge complex | Framed line, x² | q-Hodge differential coefficient q²−1; q-de Rham coefficient 1+q; at q=1 these are 0,2 | Objects distinguished | None |
| Habiro factorial indexing | k=1,2,3 | Orders 1,2,6; 1 divides 2 divides 6; transitions 6→2→1 | Direction fixed | None |
| Ordinary étale convention | A→A and A→A[x] | Identity cotangent=0 and finite presentation; polynomial cotangent=A[x]dx≠0 | Positive and negative models separated | Made explicit |
| p-completely étale convention | ℤ[x]→ℤ[x,x⁻¹], p=2,3 | Modulo p: 𝔽_p[x]→𝔽_p[x,x⁻¹] is étale; completed cotangent=0 | Completion need not be ordinary étale | Added |
| Completed localization counterexample | p=2, radii 2⁻²,2⁻⁴,2⁻⁶ | Norm of Σ2^(n²)x⁻ⁿ is 2,16,512; unique maximum occurs at n=1,2,3 | Infinite negative series belongs to completed target | Added |
| Transcendence argument for localization | Leading coefficient a₂=x, radius 2⁻⁶ | Norm of x f²=4096; lower terms with integral coefficients have norm at most 512 | Leading term cannot cancel; generic fibre is not étale | Added |
| p-completely formally étale convention | Relative root tower; polynomial extension | Completed cotangent is 0 for root tower; for A⟨z⟩ it is A⟨z⟩dz≠0 | Definition excludes a free variable | Added |
| Spectral formal étale lift convention | T=S_p; C=ℤ_p and 0 | L completed=0 for T→T and T→0; reductions are ℤ_p and 0 | Marked source and target determined | Added |
| Cyclotomic spherical base data | Toric x at p=2,3 | Frobenius reduces to x²,x³; the identity sends x to x | Wrong Frobenius excluded | None |
| Local spherical lift | ℤ₂ and 0 | S₂ has π₀=ℤ₂, π₁=ℤ/2; zero has π₀=π₁=0; Hℤ₂ has π₁=0 | Eilenberg–Mac Lane substitution excluded | None |
| Maps of marked lifts | Perfect generator sent to p or 0 | Reductions of x are p and 0; at p=2 these are 2≠0 | Marking distinguishes maps | None |
| Arithmetic fracture of lifts | ℚ and ℤ | For ℚ all p-corners=0 and pullback=Hℚ; for ℤ π₀=ℤ, π₁=ℤ/2 | Rational corner retained | None |
| Ordinary spectral étale lifting | T=S, B=ℤ[1/6] | π₀=ℤ[1/6]; π₁=(ℤ/2)[1/6]=0; zero algebra lifts to 0 | Matches homotopy base-change formula | None |
| Ordinary lift followed by completion | A=ℤ[x], R=A[1/x]; p=2,3 | Reductions of completed S[x,x⁻¹] are ℤ₂⟨x,x⁻¹⟩ and ℤ₃⟨x,x⁻¹⟩ | Correct constructor available | Added |
| Completed étale marked uniqueness | C=A₀² with A₀=ℤ_p⟨x⟩ | Unmarked automorphisms: identity,swap (2 components); automorphisms over the fixed marking: identity (1 component) | Unmarked uniqueness would be false | Added |
| Perfect δ-ring spherical lift | B=ℤ₂,ℤ₃,0 | Lifts S₂,S₃,0 have reductions ℤ₂,ℤ₃,0 | Compatible | None |
| Spherical perfection map | A=ℤ_p⟨x⟩; root stages N=0,1 | x^(1/p) is absent from 𝔽_p[x]; x^(1/p²) is absent from 𝔽_p[x^(1/p)] | Ordinary finite presentation cannot supply perfection | None |
| Relative formal lifting existence | A₀=ℤ_p⟨x⟩, C=A₀⟨t^(1/n):n≥1⟩ | Relative cotangent modulo p=0; x has no p-th root; reduction of U_C is C | Absolute perfection unnecessary | Added |
| Relative root tower cotangent calculation | p=2,3; r=1 | d(t) maps to 2t^(1/2)d(t^(1/2))=0 mod 2 and 3t^(2/3)d(t^(1/3))=0 mod 3 | Completed cotangent vanishes by derived Nakayama | Added |
| Relative root tower finite-presentation control | Root stages 1! and 2! | t^(1/2) absent from 𝔽_p[x,t]; t^(1/6) absent from 𝔽_p[x,t^(1/2)] | No finite stage generates the tower | Added |
| Relative lift identity and zero cases | C=A₀ and C=0 | U_C=T and 0; reductions A₀ and 0 | Zero replacement fails on C=A₀ | Added |
| Relative lift mapping-space theorem | C=D=A₀² over connected A₀ | Algebra endomorphisms correspond to the 4 functions on a 2-element set; automorphisms are the 2 permutations | Equivalence retains all maps | Added |
| Relative lift marked uniqueness | Same doubled algebra | Fibre over its specified reduction marking is contractible; π₀=1 and positive π_i=0 | Correct uniqueness statement | Added |
| Relative lift completed base change | C=A₀², x→0, A₀′=ℤ_p | C⊗ᴸA₀′=ℤ_p² in degree 0; (T×T)⊗_T S_p=S_p² | Static case agrees | Added |
| Relative lift identity coherence | C=A₀², identity base map | Both reductions send (a,b) to (a,b); x maps to x | Unit comparison fixed | Added |
| Relative lift composition coherence | x→y→0 | Composite sends x to 0; direct evaluation sends x to 0; double algebra remains ℤ_p² | Same marked comparison | Added |
| Relative lift nonflat base-change limit | A₀=ℤ_p⟨t^(1/p∞)⟩, C=ℤ_p, A₀′=A₀/(t) | Resolution becomes [ℤ_p→₀ℤ_p]; π₀=ℤ_p, π₁=ℤ_p before and after completion | Ordinary output cannot be promised | Added staticity hypothesis |
| Nonreduced scalar extension | Same A₀′; p=2,3 | u=t^(1/p) is nonzero but u²=0 at p=2, u³=0 at p=3 | Reduced-input shortcut fails | Added negative control |
| Square-zero obstruction step | Completed L=0 and any connective coefficient module M | Mapping spectrum from 0 to M is 0; all obstruction groups=0 and choice spaces have π₀=1, π_i=0 | No obstruction or choice ambiguity | Added proof stage |
| Postnikov effectivity | Identity C=A₀; truncation levels 0,1 | Reductions at both levels=A₀; compatible inverse limit recovers T, not τ≤0T | Must retain higher homotopy | Added proof stage |
| Cardinal-interchange prerequisite | κ=ω₁, countable coordinate family with supports s_n | Union of the countably many countable supports is countable and contains every coordinate | Inherited size hypothesis used | Carried marker forward |
| Cardinal-interchange negative control | Merely filtered finite subsets of ℕ | Identity tuple has coordinate N+1 outside {0,…,N} for each N; right product contains it, finite-stage colimit does not | Countable limit is not finite limit | Carried marker forward |
| Independent-bound prerequisite | B_j=ℤ[1/2], subobjects 2⁻ᵃℤ; tuple 2⁻ʲ | Independent choice a_j=j contains every coordinate; uniform a=N misses coordinate N+1 | Countable exact products alone insufficient | Carried marker forward |
| Perfect-even site | Identity cover and zero fibre | fib(id)=0, in extension/retract closure; zero object has zero shifts | Compatible degenerate cover | None |
| Solid even filtration | Hℤ,Σ²Hℤ,0 at steps 0,1,2 | Hℤ gives Hℤ,0,0; Σ²Hℤ gives Σ²Hℤ,Σ²Hℤ,0; zero gives 0,0,0 | Double-speed index fixed | None |
| Homological evenness | Hℚ,0,ΣHℚ | Odd-weight sheaf is 0,0,ℚ respectively | Odd suspension excluded | None |
| Even filtration base change | Identity and zero module map | F(id) is id at every step; F(0)=0 at every step | Functorial zero and identity values | None |
| Trace-class definition | Identity on ℚ⁰,ℚ,ℚ² | Classifiers 0,e∨⊗e,e₁∨⊗e₁+e₂∨⊗e₂; evaluations identities of ranks 0,1,2 | Zero classifier cannot represent a nonzero identity | None |
| Trace-class negative model | Identity on ⊕ℕℚ | Every tensor classifier evaluates to finite rank; identity has infinite rank | Arbitrary-map interpretation excluded | None |
| Nuclearity | Rational vector spaces 0,ℚ,⊕ℕℚ | Every compact-source map has finite-dimensional image and a finite classifier; infinite identity still not trace-class | Nuclear object differs from trace-class identity | None |
| Nuclear colimits and scalar extension | Finite sums ℚⁿ with colimit ⊕ℕℚ | Each compact-source map factors through ℚⁿ for some n; scalar extension ℚ→ℚ is identity | Compatible | None |
| Compact-source tensor–Hom | Source ℚ and target N=ℚ² | ℚ∨⊗N=N=Hom(ℚ,N), both dimension 2 | Compact-source input retained | None |
| Nuclear even-flat descent | Constant identity Čech diagram on Hℚ | Each term=Hℚ; totalization=Hℚ; step 1=0 | Zero augmentation would not recover the unit | None |
| Relative THH construction | Unit algebra and zero algebra | THH(T/T)=T; THH(0/T)=0 | Cyclic-bar unit and zero fixed | None |
| Solid completed unit | p=2 | π₀ ambient unit=ℤ; π₀ completed unit=ℤ₂; π₁ completed unit=ℤ/2 | Completed tensor has its own unit | None |
| Even polynomial E₂ cells | Empty variable set and one monomial generator | Empty algebra=T; one variable gives monomials 1,x,x² in degree 0 | Monoid-polynomial source fixed | None |
| E₁ Čech construction | Identity cover | Constant Čech terms=R; totalization=R; zero cover terms=0 | Totalization is required before global comparison | None |
| Local q-Hodge completed comparison | A=R=ℤ_p, i=0,1 | Both completed sides are ℤ_p[[h]],hℤ_p[[h]] | Compatible | None |
| Local q-Hodge β reduction | Unit, i=0,1 | Both sides ℤ_p,0; degreewise quotient gives extra ℤ_p at i=1 | Filtered quotient essential | None |
| Local rational comparison | Unit and framed line | Unit step 1=hℚ_p[[h]]; line form-degree-one coefficient=1 | Combined filtration, not just h-adic | None |
| Prime-two local branch | p=2, R=ℤ₂⟨x⟩ | ∇q(x²)=(1+q)x dx, specializing to 2x dx; perfect-root cover exists | E₁ branch retained | None |
| Local identity-cover preimage theorem | R=A=ℤ_p | Preimage of hⁱℚ_p[[h]] is hⁱℤ_p[[h]] for i≥0 | Zero map would give all ℤ_p[[h]] instead | None |
| Cyclonic object | Weight-one complex representation sphere | Geometric C₁-fixed sphere=S²; C₂-fixed sphere=S⁰ | Root equivalence is additional data | None |
| Cyclonic base datum A₂ | Toric x and geometric p-fixed coefficients | Geometric coefficient map sends x to x^p; underlying equivariant comparison is identity | Λ-structure alone does not specify coherence | None |
| Modified TC term | m=1 and X=0 | TC−(1)(X)=X^hS¹; every term for X=0 is 0; no C₀ | Positive domain fixed | None |
| Fixed-point divisor equalizer | m=1,2 | Divisors {1} and {1,2}; edge 2→1 targets X^hS¹ | Genuine points precede residual homotopy points | None |
| Cyclonic map functoriality | Identity and zero spectrum | Every identity diagram map is identity; all zero-spectrum maps are 0 | Compatible | None |
| Divisibility coherence | 1 divides 2 divides 6 | Composite 6→2→1 and direct 6→1 have order-one target | Direction fixed at all stages | None |
| Bott inversion and t-completion | β invertible, βt=h | t=β⁻¹h; ideals (t) and (h) coincide after β inversion | Order and completion ideal agree | None |
| TraceInput object | ℤ[1/2][x] and ℤ[x] | Completion at 2 is 0 for first, ℤ₂⟨x⟩ for second | E₂-only constructor excludes second | None |
| TraceInput morphism | Identity ring map with different branches at odd p | Underlying ring map=id; branch labels E₁ and E₂ are unequal, so no morphism of these inputs | Arbitrary ring map insufficient | None |
| TraceInput.forget | Unit and zero input | Outputs A and 0 | Compatible | None |
| TraceInput.lifts | Unit at p=2 and zero input | Local datum S₂ and 0 respectively | Not an unmarked ring property | None |
| TraceInput.ofSpherical | ℤ[1/2][x] with sphere-polynomial lift | Odd completions give S_p[x] completed; 2-completion=0 | Full global quasi-lci hypothesis retained | None |
| TraceInput.ofEtale | A=ℤ[x], R=A[1/x] | At p=2,3 the output has π₀=ℤ_p⟨x,x⁻¹⟩ and identity cover | Old ordinary-completed claim replaced | Lift before completion |
| TraceInput.ofEtale identity and zero | R=A and R=0 | Output lifts (S_A)^∧p and 0 | Degenerate cases preserved | Added Check |
| TraceInput.ofFramed | ℤ[x], empty frame | Line uses root cover at 2; empty frame yields identity cover | No exclusion of dimension zero | None |
| TraceInput.ofIdentityCover | Relative root quotient and rational non-lci algebra | Root quotient has surjective relative Frobenius; ℚ[u,v]/(u²,uv,v²) has ideal height 2 and 3 generators despite all local completions=0 | Global amplitude is essential | None |
| TraceInput.unit | A=ℤ and A=0 | Lift S and 0; identity relative Frobenius is an isomorphism in both | Compatible | None |
| tracePair definition and existence | Unit and zero ring | F⁰=ℤ[[h]] for unit; zero-ring F⁰=ℚ[[h]] despite completed trace=0 | Uncompleted pullback retained | None |
| tracePair_map | Identity input morphism | Induced map sends 1→1 and x→x in polynomial model | Zero map excluded | None |
| tracePair_map_id | Unit input | Identity on ℤ[[h]] | Compatible | None |
| tracePair_map_comp | Polynomial substitutions x→y→0 | Both composites send x to 0 | Compatible | None |
| tracePair_completion | A=ℚ, R=ℚ(i) | Uncompleted F⁰=ℚ[[h]]; completed F⁰=ℚ(i)[[h]] | Completion does change the zeroth carrier | None |
| tracePair_modBeta | Unit and framed line | Unit step 1=0; line Hodge step 1=ℤ[x]dx[−1] | Compatible | None |
| tracePair_rational | R=ℚ(i), step k=1 | H⁰=hℚ[[h]], H¹=ℚ(i)/ℚ; completed H⁰=hℚ(i)[[h]] | Rational corner not discarded | None |
| tracePair_pRational | Unit, p=2,3 | Step 1 maps hℤ_p[[h]] to hℚ_p[[h]] | Completion precedes inversion | None |
| tracePair_multiplicative | E₂ versus E∞ lift at odd p | Output levels E₁ versus E∞ | Degree shift retained | None |
| traceHabiro definition | Unit and zero input | Unit gives Habiro ring with order-one quotient ℤ; zero gives 0 | Distinguishes descent from uncompleted pair | None |
| traceHabiro_map | Identity unit input | Order-one scalar 1 maps to 1 | Compatible | None |
| traceHabiro_hCompletion | Framed line, x² | Differential q²−1, which specializes to 0, rather than 1+q specializing to 2 | q-Hodge complex recovered | None |
| traceHabiro_partialCompletion | m=2 and divisor n=1 | Completion of T₂ at q−1 is T₁; quotient at q=1 has coefficients R | Direction correct | None |
| traceHabiro_qWittGraded | m=1, framed line, i=0,1 | Graded pieces ℤ[x] and ℤ[x]dx[−1] | Ascending conjugate filtration retained | None |
| traceHabiro_smooth | Framed line, m=1 | H⁰=ℤ[x], H¹=ℤ[x]dx before Bockstein; Bockstein d(x²)=2x dx | Ordinary cohomology reduction alone insufficient | None |
| traceHabiro_multiplicative | E₂ lift at an odd prime | Output is E₁, agreeing with tracePair level 2−1=1 | No E∞ inferred | None |
| traceHabiro_pairEquiv | Identity equivalence of unit pairs | Induced equivalence sends 1→1 and h→h | Compatible | None |
| traceHabiro_periodic | Degree-one β and t generators | βt=h and t=β⁻¹h after inversion | Degreewise h-completion fixed | None |
| traceHabiro_cyclonic | R=ℤ[1/6], m=1 | Order-one term is THH(KU_R/KU)^hS¹; 2 is invertible | Module comparison used on valid domain | None |
| Derived completion boundary | M=𝔽₂, quotient stages 1 and 2 | Polynomial quotients have dimensions 1 and 3; Laurent multiplication by q^m−1 has kernel 0 | Staticity does not require ℤ-flat coefficients | None |
| E1QuotientExponent | p=2, α=0,1,2,3,4,5,6 | False,false,false,false,true,false,true | Both parity and lower bound needed | None |
| E2QuotientExponent | p=2, α=4,5,6,7 | False,false,true,false | Stronger range retained | None |
| Odd-prime exponents | p=3, α=1,2,3 | E₁=false,true,true; E₂=false,false,true | Prime-two bounds not imposed at 3 | None |
| Total exponent predicates | p=0,1 and α=2,3 | Non-2 branch: E₁ true at 2, E₂ true only at 3 | Total functions specified without nonprime application | None |
| E₂ implies E₁ | (p,α)=(2,6),(3,3) | Both give true→true; lower bounds 6≥4 and 3≥2 | Compatible | None |
| quotientLift E₁ | p=3, y=3, α=2; p=2, y=2, α=4 | Underlying reductions ℤ/9,ℤ/16; tower exponents 2 and 2 relative to y and y² | Sufficient ranges correct | None |
| quotientLift E₂ | p=3,α=3; p=2,α=6 | Quotient reductions ℤ/27,ℤ/64; tower exponents 3,3 | Compatible | None |
| Quotient zero and empty sequence | y=0, y=1, r=0 | Cofib(0)=T⊕ΣT; cofib(1)=0; empty tensor=T | No regularity falsely required for algebra-structure theorem | None |
| quotientLift_framed | ℤ[x]/(x⁴), p=2 | Exponent relative to x² is 2; quotient remains ℤ-torsion-free | E₁ root-cover branch applies | None |
| quotientLift_identityCover | A=ℤ[x], B=A[t^(1/n)], R=B/(t⁴) | ℤ-basis x^a t^r, 0≤r<4; multiplication by every p injective; t^r has relative Frobenius preimage t^(r/p) | Relative lift supplies identity-cover datum | Explicitly uses §0.1 |
| Relative quotient nilpotents | Same R, p=2,3 | t≠0 and t⁴=0; exponent bound at 2 is 4/2=2; at 3 it is 4 | Nonreduced algebra remains in scope | Added Check |
| quotientLift_perfected | A=B=ℤ₃, x=3, α=2 | R=ℤ/9 has spherical E₁ lift, but 3·3=0 with 3≠0 | Lift theorem does not imply torsion-free criterion | None |
| Moore tower specialization | Perfect generator x→p or 0 | Quotients reduce to ℤ/p^α versus ℤ_p⊕ℤ_p[1]; p=3,α=2 gives ℤ/9 | Correct specialization marked | None |
| High-powered integer predicate | m=1,8,9,12,16,32,64 | True,false,true,false,true,false,true | Empty prime-divisor set at 1 handled | None |
| Sufficient not necessary at 2 | α=3 and α=5 | Both chosen-tower predicates fail; S/8 nevertheless admits a separately supplied E₁ structure | No necessity claimed | None |
| perfectedLiftNaive | A=ℤ_p[x], R=A/(x−1) | Reduction x−1=0 gives ℤ_p; second divided power specializes to (x−1)²/2 | Integral q-PD element retained | None |
| perfectedLiftNaive_qReg | Rational algebra R | All p-corners=0; rational combined corner survives | Global arithmetic pullback not empty product | None |
| perfectedLiftNaive_higherPowers | p=2, exponent 2 versus 4 | Chosen spherical route gives no exponent-2 input; exponent 4 has quotient exponent 2 relative to x² | Algebraic square theorem not narrowed | None |
| Exponent-one obstruction | Perfect free δ-quotient by x | E₁ ku lift exists; spherical lift would force the failed naive β comparison | Wrong lift base excluded | None |
| tracePair_quasiRegular membership | A=R=ℤ_p | Perfection and its base-change map are identities; completed relative cotangent=0 | Hypotheses tied to actual lift | None |
| tracePair_quasiRegular pair comparison | Identity-cover unit | Both filtrations have Fⁱ=h^max(i,0)ℤ_p[[h]] and β quotient ℤ_p at i=0,0 at i=1 | Compatible | None |
| tracePair_quasiRegular multiplicative refinement | Same unit | Unit multiplication 1·1=1 on both filtered objects | Zero multiplication excluded | None |
| tracePair_quasiRegular Habiro comparison | Global A=R=ℤ | Both descents have order-one quotient ℤ and h-completion ℤ[[h]] | Compatible | None |
| finiteCoefficientTrace ku comparison | m=1,9,16 | Completed objects: 0, and reductions by (β,t) equal ℤ/9,ℤ/16; uncompleted F₁=ℚ[[h]] | Completion boundary preserved | None |
| finiteCoefficientTrace KU comparison | m=1 and m=9 | First output=0; at 9 β is invertible and t=β⁻¹h | Bott inversion followed by completion | None |
| Finite trace evenness | m=9,16 | Odd homotopy groups=0; degree-zero (β,t)-reduction ℤ/9,ℤ/16 | Evenness not inferred for arbitrary global THH | None |
| Finite trace tower naturality | Identity m=9 | Reduction sends 1 mod 9 to 1 mod 9 | Unit fixed | None |
| Jackson operator definition | f=1,x,x²; q=1 and x=0 | Values 0,dx,(1+q)x dx; at q=1:0,dx,2x dx; quadratic at x=0:0 | No literal division by zero | None |
| Coordinate filtration | Form degree j=1,2; i=1,3 | Coefficients at (i,j)=(1,1),(1,2),(3,2) are 1,1,h | Form degree differs from filtration degree | None |
| framedTraceComparison | Line, steps 1 and 2 | Both models give (hR→R dx) and (h²R→hR dx) | No inversion of 2 required | None |
| Framed pair comparison at 2 | Polynomial and perfect-root resolutions of ℤ[x] | β-quotient step 1 is ℤ[x]dx[−1] for both; ∇q(x²) coefficient 1+q on both | Zero comparison excluded | None |
| Framed E∞ refinement | Empty frame and framed line | Empty frame unit product 1·1=1; line has ∇q(x²)=(1+q)x, not 2x | Structure transported from Čech model | None |
| Framed derived commutative refinement | Empty frame | Constant commutative Čech algebra totalizes to A[[h]] with 1·1=1 | Compatible | None |
| Normalized q-PD generators | r=0,1,2; (x,y,q)=(3,1,2) | Values 1,2,2/3; at q=1 degree 2 is (x−y)²/2 | Normalization fixed | None |
| q-PD x-Jackson derivative | r=2 at (3,1,2) | (20/3−2/3)/3=2; δ¹(3,1)=2 | Identity holds | None |
| q-PD y-Jackson derivative | r=2 at (3,1,2) | (−1/3−2/3)/1=−1; −δ¹(3,2)=−1 | Sign and q-shift hold | None |
| q-PD denominators | r=2, q=1 and q=−1 | [2]q=2 and 0; rational formal h-series constant term 2 is invertible over ℚ | Integral envelope used at bad specialization | None |
| q-PD generation/base change | Empty generator and first difference | δ⁰=1, δ¹=x−y; specializing y=x gives δ¹=0 | Zero family would lose unit or diagonal generator | None |
| Full framed diagonal | A=ℚ, S=ℚ×ℚ, d=0 | Tensor has 4 components; full diagonal completion has 2; coordinate-only completion leaves 4 | Idempotent part retained | None |
| Filtered framed Čech model | Empty frame | All Čech terms=A; totalization=A[[h]]; filtration step 1=hA[[h]] | Wrong full product model excluded | None |
| Resolution agreement | S=ℤ[x,y], i=1,3 | Form-degree-two coefficient=1,h in both resolutions | No dimension-dependent 2 inversion | None |
| Čech contraction route | Empty frame | Positive normalized Čech degrees=0; degree zero=A | Degenerate route computes expected totalization | None |
| canonicalFramedTrace | d=0,1,2 | n=1,1,2; required prime sets empty,empty,{2} | Domain agrees with canonical supplier | None |
| canonicalFramedTrace_pair | Line, i=1,2 | Both canonical and coordinate coefficients are hⁱ in degree 0, h^(i−1) in degree 1 | Specific comparison fixed | None |
| canonicalFramedTrace_habiro | d=0, S finite étale | Both descents are H_(S/A); h-completions S[[h]] | Compatible | None |
| canonicalFramedTrace_einfty | Fixed framed unit | Transported multiplication sends (1,1) to 1 | Arbitrary module equivalence insufficient | None |
| Canonical tensor-domain boundary | ℤ[x] tensor ℤ[x] | Dimensions 1+1=2; 2 is not a unit over ℤ but is over ℤ[1/2] | No false closure of canonical domain | None |
| Derived h-reduction and Bockstein | Framed line, monomial x² | d_qHdg(x²)=(q²−1)x dx; dividing by h gives (1+q)x dx and value 2x dx | Cohomology-before-reduction loses classes | None |
| Laurent framed comparison | S=ℚ[x,x⁻¹] | Uncompleted dR≃ℚ; coordinate H¹ contains ℚ·dx/x | Pullback to qdR remains necessary | None |
| TraceInversion | F=ℚ, Δ=0,−6,1,6 | False,false,false,true; disc(ℚ)=1 | Positivity and 6-divisibility both effective | None |
| TraceInversion Gaussian coefficients | disc(ℚ(i))=−4; Δ=6,12 | 4 does not divide 6, does divide 12; both localizations equal ℤ[i][1/6] | Condition is on chosen Δ | None |
| TraceInversion.isUnit_two_three | R=ℤ[1/6] | 2·(1/2)=1 and 3·(1/3)=1 | Correct units | None |
| TraceInversion.finiteEtale | ℚ and ℚ(i), admissible Δ | Ranks 1 and 2; Gaussian discriminant −4 invertible; modulo 2 without inversion Ω¹=𝔽₂[i]di≠0 | Discriminant hypothesis necessary for stated route | None |
| Cubic trace inversion | F=ℚ(∛2), Δ=108 | Disc=−108; 6 divides 108 and −108 divides 108; localization inverts 2,3 | Non-Galois input retained | None |
| genuineRealisation carrier | m=1,2; zero coefficients | C₁={1}; edge 2→1 targets circle homotopy fixed points; zero spectrum limit=0 | Correct order of operations | None |
| genuineRealisation.epsilon | Rational field and Δ=6 | Unit maps 1→1; order-one completion is ℤ[1/6][[h]] on both sides | Ring marking fixed | None |
| numberFieldTraceRealisation | R=0 and R=ℤ[1/6] | First ring=0; second has τ₁(1)=1 | Zero equivalence excluded for nonzero coefficients | None |
| Number-field coefficient base change | Δ=6 | 6·(1/6)=1 in every surviving Taylor factor; completions at 2 and 3 are 0 | Scalar localization compatible | None |
| numberFieldTraceExports family | m=1 | ζ₁=1; qW₁(R/ℤ)=R; τ₁ modulo h=ρ₁ | Family tied to ε⁻¹ | None |
| numberFieldTraceExports_cyclotomic | m=1,2 | ρ₁(q)=1; ρ₂(q)²=1 | Correct finite quotient | None |
| numberFieldTraceExports_taylor | m=1 | τ₁(q)=1+h and τ₁(h)=h | Wrong centre excluded | None |
| numberFieldTraceExports_transition | p=2, m=1 before localization | q+1=(q−1)+2; reversed root difference gives q−3 | Re-expansion sign fixed | None |
| numberFieldTraceExports_equalizer | R=ℤ[1/6], family (1,0,0,…) | At edge p=5,m=1, left coefficient=1, right=0 | Unrestricted product excluded | None |
| numberFieldTraceExports_hCompletion | m=1 | Completed P_R=R[[h]]; reduction of h=0 and of 1=1 | Uncompleted P_R not collapsed to R | None |
| numberFieldTraceExports_naturality | Identity and ℚ→ℚ(i) with Δ=12 | Scalars 1→1; Gaussian coefficient embeddings square to i²=−1 | Source and coefficient map agree | None |
| Full tensor coefficient algebra | Gaussian field, m=4 | R⊗ℤ[i]≃R²; (1⊗1−i⊗i)/2 has images 1,0 | One-factor shortcut excluded | None |
| Gaussian constant-family obstruction | p=7, coefficient i | can(i)=i; φ₇(i)=i⁷=−i≠i; twisted f₇=−i gives φ₇(f₇)=i | Frobenius twisting required | None |
| Frobenius direction | ζ₇, p=11 | 4²=2 mod 7, 4³=1; φ(ζ₇²)=ζ₇, while φ(ζ₇⁴)=ζ₇²≠ζ₇ | Inverse convention pinned | None |
| Nonabelian coefficient obstruction | x³−2 mod 5 | (x−3)(x²+3x+4); discriminant of quadratic=3, nonsquare mod 5 | Completed Frobenius is not a global automorphism | None |
| Order-one Taylor noninjectivity | R=ℤ[1/6], component at order 2 | The component idempotent maps to 0 under τ₁ but is nonzero in its order-2 factor | No global Taylor injection claimed | None |

**Commit.** ea49660 — HabiroCohomologyFoundationsPartII: review repairs (distinguish completed lifting and retain solid prerequisites). Only the two permitted roadmap files changed; the worktree is clean and nothing was pushed.

**Build outcome.** `lake build TauCetiRoadmap.HabiroCohomologyFoundationsPartII.Suggested` exited 0:

```text
✔ [8976/8976] Built TauCetiRoadmap.HabiroCohomologyFoundationsPartII.Suggested (2.7s)
Build completed successfully (8976 jobs).
```

**Dependency direction.** The prescribed movable dependency check exited 0, with no UPWARD, CYCLE or moved line:

```text
depcheck: 33 roadmaps, 311 edges, 0 problem(s)
```

**Gate summary.** The prescribed gate against origin/main exited 0:

```text
gate HabiroCohomologyFoundationsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
