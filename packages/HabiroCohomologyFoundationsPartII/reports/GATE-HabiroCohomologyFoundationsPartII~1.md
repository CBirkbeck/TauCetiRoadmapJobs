## H01 (CBirkbeck) — applied

The unavailable RefinedTraceMethods contracts are replaced by local proof stages in `TauCetiRoadmap/HabiroCohomologyFoundationsPartII/README.md`: spherical lifting and local trace comparisons at line 120, global existence at line 244, the cyclonic comparison in §1.3, finite coefficients at line 420, the full framed comparison at line 462 and the number-field ring realisation at line 536. In particular, §3.0 makes polynomial/perfect-root resolution agreement at 2, agreement over qdR, all four pair clauses and higher coherences explicit proof obligations with a common-refinement route; KU line 1117 only suggests the alternative resolution, while KU line 1123 proves the polynomial-resolution theorem, so neither is treated as the stronger comparison already available.

## H02 (CBirkbeck) — applied differently

`TauCetiRoadmap/HabiroCohomologyFoundationsPartII/README.md` line 36 records HabiroNumberFields §§2.1–2.4 → HabiroRings §§5.2, 5.9 → §4.2, and line 95 adds the exact transitive arithmetic contract, preserving the arithmetic/relative/trace ownership split and importing no K₃ module. The worker's PR-description dependency and merge-order lists still need #1469 before #1425; PR text and metadata outside the two authorized files were not edited.

**Validation.** Commit `bbf9527` changes only `TauCetiRoadmap/HabiroCohomologyFoundationsPartII/README.md` and `TauCetiRoadmap/HabiroCohomologyFoundationsPartII/Suggested.lean`; the worktree is clean and no push was made.

The exact outcome of `lake build TauCetiRoadmap.HabiroCohomologyFoundationsPartII.Suggested` was exit 0:

```text
✔ [8976/8976] Built TauCetiRoadmap.HabiroCohomologyFoundationsPartII.Suggested (2.2s)
Build completed successfully (8976 jobs).
```

The final gate outcome was exit 0:

```text
gate HabiroCohomologyFoundationsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The required movable dependency-direction check returned exit 0, with no UPWARD, CYCLE or moved line:

```text
depcheck: 33 roadmaps, 308 edges, 0 problem(s)
```

**Signatures and pins.** The mechanical declaration inventory of `TauCetiRoadmap/HabiroCohomologyFoundationsPartII/Suggested.lean` is empty: there are no theorem, definition, instance, structure or variable declarations. Consequently the required list of `#check @name` entries is empty, there are no elaborated declaration types or dropped binders to compare, and the actual acceptance module was elaborated by the successful build; its docstring now accounts for all twelve headline results and each missing carrier without substitutes.

The searched libraries are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, matching the supplied manifest. Object searches found no spectral THH, spherical-lift, cyclonic, Habiro or enhanced q-Hodge carriers. The existing Mathlib notions used by the arithmetic Checks were checked directly: `Mathlib/RingTheory/Etale/Basic.lean` line 205 and `Mathlib/RingTheory/Smooth/Basic.lean` line 539 require formal étaleness/smoothness and algebra finite presentation, not module finiteness; `Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean` line 75 gives the rational discriminant; the localization and unit laws are at the exact files and lines retained in the README supplier contract.

**Ownership and citations.** Main was `fe5400174e8f9e8ce96423e5122b6dc4c5acf632`; ownership was checked by object against main, the board packages and the supplied inventory of 338 open roadmap pull requests at their heads. RefinedTraceMethods has no submitted roadmap in that inventory or main; its board reports do not supply a roadmap contract. This Part II therefore owns precisely the trace prerequisites it already consumed. Generic spectra and operadic algebras remain StableHomotopyKTheory's; genuine fixed-point and cyclic operations remain KTheoryFiniteLocalFields §4.0's; solid spectral carriers remain SolidAnalyticRings §§1–2, 6.4's; algebraic q-PD/Jackson/Čech theory remains PrismaticCohomologyPartII §§5.7–5.8, 5.14–5.18's; q-Hodge pairs and algebraic Habiro descent remain HabiroCohomologyFoundations' constructions. No declaration was added under another roadmap's fully qualified name, and no supplier was moved above its consumer.

Cross-roadmap section citations were resolved at those copies and the consumed clauses were compared with their texts. The reported unresolved trace supplier is absent; the three apparent missing `Prismatic.Trace.gradedTCMinus`, `gradedTP` and `gradedTC` identifiers are actual planned exports of PrismaticCohomologyPartIII §7.0, rather than pinned declarations. HabiroRings §5.2 imports HabiroNumberFields §2.1's roots, and §5.9 imports §§2.1–2.4's arithmetic ring/Taylor data, establishing H02 even without higher modules. No open-roadmap ownership check was omitted for a source supplied in the brief.

**Source verification.** All works used in the repairs retain their existing source keys; no new work or missing-reference request was introduced. Relevant legal cached passages were read: KU line 973 (local input), KU line 1117 (alternative resolution), KU line 1598 and KU line 1796 (local comparisons and prime-two restriction), KU line 1908 (identity cover), KU line 1949 and KU line 2143 (global gluing and multiplicativity), KU line 3142 (A₂), KU line 3292 and KU line 3556 (twisted and periodic comparisons), KU line 3726 through KU line 3873 (framed theorem, diagonal proof and refinement), KU line 3880 (number fields), KU line 3902 (perfection), and KU line 3927 (the relative q-prism extension). The general δ-base relative trace comparison is an explicit local target; the narrower DVR comparison is not imported as a general theorem.

The remaining mathematical boundaries were checked at QH line 2860, QH line 2983 and QH line 3026 (perfected-lift criterion, completed flat base change and arithmetic gluing), QH line 3514 (uncompleted global q-de Rham), TC line 1304 and TC line 1370 (finite-coefficient reduction and completed comparisons), Bu line 57 and Bu line 474 (compatible quotient towers and squares at 2), HA line 52724 (étale spectral lifting), GSWZ line 273 and GSWZ line 311 (Frobenius gluing and components), BS line 3898 and BS line 3960 (Nygaard and the relative DVR domain), and BMS2 line 252 (quasisyntomic filtrations with twists). The source sign and rational-corner corrections are retained, with direct numerical controls below.

**Adversarial mathematics record.** Each row records evaluations, not a proof of the general theorem. Locations below are sections of `TauCetiRoadmap/HabiroCohomologyFoundationsPartII/README.md`; “retained” means the mathematical statement is unchanged, including when its unavailable supplier citation became a local proof obligation.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Universe and index conventions | Empty diagram; indices 0,1,2 | C₁ has 1 element; C₂ has 2; no finite group has 0 elements | Positive-order index excludes C₀ | Retained |
| q-integers and constants | n=0,1,2; q=1 | [0]=0, [1]=1, [2]=1+q; at 1: 0,1,2; D_q(1)=0 | No negative exponent at n=0 | Retained |
| Rees/Bott normalization | Filtration weights 1,−1; homotopy degrees 2,−2 | βt=h has weight 0 and homotopy degree 0; shearing Σ⁻²Σ²Hℤ=Hℤ | Sign and degree agree | Retained |
| Filtered β-quotient | Unit, steps i=0,1,2 | i=0: cofib(h:A[[h]]→A[[h]])=A; i=1,2: cofib(h:h^{i−1}→h^i)=0; degreewise quotient instead A | Wrong degreewise quotient excluded | Retained |
| Chosen pair, all four corners | R=0 over ℤ; rationalization | F⁰=ℚ[[h]], F/β=ℚ constant; all p-complete corners=0; rational corner=ℚ[[h]] | Pair cannot be the zero filtration | Retained |
| Filtration completion and pullback | Constant ℚ[[h]]; ℚ→ℚ² | Completion of constant filtration=0; pullback step 1 has kernel hℚ[[h]], cokernel ℚ | Completion changes the object | Retained |
| q-Hodge modification | Constant filtration on ℚ[[h]]; coordinate line | Constant: colim_hF=ℚ((h)), h-completion=0; line differential h[r]_q becomes q^r−1 | Correct completed modification | Retained |
| Nygaard versus trace filtrations | Perfectoid coefficients, weights 0,1 | Weight 0 gives Δ̂; weight 1 gives N^{≥1}Δ̂{1}[2]; TP gives Δ̂{1}[2] | Twist and completion retained | Retained supplier boundary |
| Arithmetic root contract | m=1,2,3,6 | ζ₁=1, ζ₂=−1, ζ₃=e^{2πi/3}, ζ₆=e^{5πi/3}=ζ₂ζ₃, different from e^{πi/3} | Coherent root convention needed before the relative comparison | Added transitive ownership contract |
| Cyclotomic spherical base definition (§0.1) | A=ℤ_p at p=2,3; A=0 | Reductions of S_p are ℤ_p; φ on π₀ is identity; zero base reduces to 0 | Requires the Tate-valued equivariant map, not only its π₀ value | Local construction |
| Maps of base data and lifts | Identity of S_p; zero map of zero algebra | Reduction of id sends 1→1, composite id∘id sends 1→1; unique zero map sends 0→0 | Reduction and coherent maps retained | Local API |
| Arithmetic gluing of spherical lifts | A=ℚ; A=ℤ | ℚ: local corners=0, rational corner Hℚ, pullback Hℚ; ℤ: π₀S=ℤ, π₁S=ℤ/2 | Rational corner cannot be omitted | Local theorem |
| Étale spherical lifting | S→S[1/6]; S₂→S₂; zero algebra | π₀=ℤ[1/6], π₁=(ℤ/2)[1/6]=0; identity S₂ retains π₁=ℤ/2; zero gives 0 | Hℤ₂ would be a wrong lift | Local theorem |
| Perfect δ-ring spherical lifting | B=ℤ₂,ℤ₃,0 | π₀ of lifts: ℤ₂,ℤ₃,0; reduction along S→Hℤ: same rings | Includes p=2 and zero ring | Local construction |
| Perfect-base map x↦p | Free perfect δ-ring, x↦p and x↦0 | x² maps to p² and 0; spectral cofibres have π₀=ℤ/p² and ℤ_p respectively | Distinct reduction laws exclude wrong specialization | Local API |
| sphericalPerfection | A=ℤ_p; toric A=ℤ_p⟨x⟩ | Identity base: A∞=A and map=id; toric: x↦x, x^{1/p^{N+1}} is outside roots through N | Étale finite-presentation lifting does not prove this theorem | Local headline |
| Perfect-even site (§0.2) | T=Hℚ; zero and split covers | Fibre of id is 0; fibre of T⊕Σ²T→T is Σ²T, both perfect even | Covers include required split extensions | Local definition |
| Solid even filtration | Hℤ, Σ²Hℤ,0 | Steps 0,1 of Hℤ: Hℤ,0; steps 0,1,2 of Σ²Hℤ: Σ²Hℤ,Σ²Hℤ,0; zero: 0 | Double-speed index pinned | Local definition |
| Homological evenness | Over Hℚ: 0,Hℚ,ΣHℚ | Odd weight-1/2 sheaves: 0,0,ℚ respectively | Odd object is a negative control | Local definition |
| Filtered maps, identity and monoidal unit | Even modules Hℤ and Σ²Hℤ | id(1)=1; 1⊗1↦1; Σ²Hℤ⊗Hℤ=Σ²Hℤ in weight 1 | Unit and shifts agree | Local API |
| Even polynomial resolutions and E₂ cells | Empty variables; one variable; degree-two bar class | Empty polynomial=S; π₀S[x]=ℤ[x]; double bar weight n has suspension 2n | Monoid polynomial distinguished from free E∞ algebra | Local proof input |
| Trace-class classifier | Finite ℚ^r, r=0,1,2; infinite direct sum | Σe_j^∨⊗e_j evaluates to id of rank r; r=0 gives 0; any classifier on ⊕ℕℚ has finite rank, unlike id | Does not identify every map with a trace-class map | Local definition |
| Nuclear modules | ℚ^r and ⊕ℕℚ in ordinary Hℚ-modules | Map from a finite-dimensional compact source has rank ≤dim(source); identity on ℚ^r has rank r | Nuclear does not mean its own identity is trace-class | Local definition |
| Nuclear scalar/tensor–Hom laws | Compact P=ℚ², M=ℚ³ | Hom(P,ℚ)⊗M and Hom(P,M) both have dimension 6; evaluation sends e₁^∨⊗e₁ to the same rank-one map | Retains compact-source hypotheses | Local theorem |
| Relative E₁ THH | R=A; R=0 | THH(S_A/S_A)=S_A; THH(0/S_A)=0 | Relative unit and zero fixed | Local extension of generic supplier |
| Solid p-complete embedding | p=2; unit and ambient sphere | Completed unit π₀=ℤ₂, π₁=ℤ/2; ambient unit π₀=ℤ | Completed unit is not the ambient unit or Hℤ₂ | Local use of supplier |
| E₁ even Čech descent | Framed line; zero cover datum | Step 1 form coefficient=1, not h; zero datum totalises to 0 | Not Postnikov truncation of arbitrary global THH | Local construction |
| localTraceComparison (§0.3), unit | R=A=ℤ₂ and ℤ₃ | Completed steps 0,1: A[[h]],hA[[h]]; β-quotient: A,0 | p=2 and p=3 both included with proper branch | Local headline |
| Local comparison at 2 | R=ℤ₂⟨x⟩ | Step 1=(hR[[h]]→R[[h]]dx); D_q(x²)=(1+q)x dx, q=1 gives 2x dx | Uses E₁ perfect-root cover | Local theorem |
| Local rational clause | Unit R=ℤ_p | (h^iℤ_p[[h]][1/p])^∧_h=h^iℚ_p[[h]]; combined Hodge/h step is the same | Completion follows rationalisation as stated | Local theorem |
| Local multiplicative level | E₂ and E∞ lifts | n=2 gives n−1=1; ∞ gives ∞ | No promotion E₂→E∞ | Local theorem |
| Identity-cover preimage theorem | Unit and exponent-one quotient | Unit preimage of h^iℚ_p[[h]]=h^iℤ_p[[h]]; exponent-one quotient has failure of mod-β surjectivity | Spherical lift cannot be inferred from a ku-lift | Local theorem |
| Relative q-prism trace proof input | Unit and perfect base, p=2,3 | uv=[p]_q: at q=1, uv=p; at p=2, [2]=1+q; p=3, [3]=1+q+q² | General δ-base comparison is proved locally, not inferred from DVR-only supplier | Explicit local proof obligation |
| Cyclonic spectrum (§0.4) | Weight-one representation sphere | Φ^{C₁}S^ℂ=S², Φ^{C₂}S^ℂ=S⁰ | No root equivalence imposed | Local definition |
| Cyclonic (A₂) datum | Sphere base ℤ; identity operation | ψ¹=id; on π₀ each ψ^m on ℤ sends 1→1 | Chosen coherent base map retained | Local definition |
| TC^{−(m)} | m=1; X=0 | TC^{−(1)}(X)=X^{hS¹}; every TC^{−(m)}(0)=0 | Correct order of fixed points | Local definition |
| Cyclonic even equalizer | m=1,2 | m=1 has divisor 1 and no pd dividing 1; m=2 has divisors 1,2 and one (p,d)=(2,1) overlap | Overlap cannot be omitted | Local construction |
| Divisibility maps and their coherences | 6→2→1 and 6→3→1 | Both maps send 1 to 1; each identity sends 1 to 1 | Diagram coherence remains an explicit proof target beyond values | Local API |
| Bott inversion and t-completion | Unit over ℤ[1/2] | ββ⁻¹=1, βt=h; mod h remains ℤ[1/2][β^{±1}]≠0 | Inverting h would instead give zero quotient | Local construction |
| TraceInput definition (§1.1) | ℤ[1/2][x]; ℚ[u,v]/(u,v)² | First has zero 2-completion and cotangent rank 1; second has local completions 0 but ideal height 2 and 3 generators | Global amplitude condition is independent | Retained |
| TraceInput morphisms | Identity, same/mixed branches | Same branch gives id on R and lift; E₂→E₁ mixed branch supplies no branch-preserving morphism | No arbitrary ring-map functor asserted | Retained |
| TraceInput.forget | Unit, zero, identity | (A,L)↦A, (0,L)↦0; id_A↦id_A | Source and target fixed | Retained |
| TraceInput.lifts | p=2 and odd p on line | p=2: perfect-root E₁ Čech diagram; p=3: E₂ lift; reductions both R̂_p | Branch is returned as data | Retained |
| TraceInput.ofSpherical | ℤ[1/2][x] versus ℤ[x] | 2 is a unit in first; 2 is not a unit in second; first has R̂₂=0 | Constructor not used outside its domain | Retained |
| TraceInput.ofEtale | R=A; R=ℚ(i) over ℚ | Relative Frobenius is id for unit and iso for étale extension; local completions of ℚ(i) vanish | Étale lifting ownership moved to §0.1 | Retained target |
| TraceInput.ofFramed | ℤ[x] and empty frame | At 2 cover adjoins x^{1/2^∞}; empty frame's cover is identity | Includes no-coordinate frame | Retained |
| TraceInput.ofIdentityCover | R=A=ℤ; ℤ[x] over ℤ | Unit R/p=𝔽_p is relatively perfect; line has Ω¹/p=𝔽_p[x]dx≠0 | Polynomial line not silently an identity-cover input | Retained |
| TraceInput.unit | A=ℤ; A=0 | S_A⊗Hℤ=A; zero reduces to zero | Unit/zero data exist | Retained |
| tracePair global existence (§1.2) | R=ℤ,0,ℚ(i) | Unit F⁰=ℤ[[h]]; zero F⁰=ℚ[[h]] with F̂=0; ℚ(i) completion F̂⁰=ℚ(i)[[h]] | Arithmetic pullback retains all corners | Local headline with full gluing proof |
| tracePair_map | Identity of unit; zero object | On degree zero 1↦1; zero map 0↦0 | Map preserves comparisons | Retained API |
| tracePair_map_id | Unit and zero | id(1)=1; id(0)=0 | Correct identities | Retained |
| tracePair_map_comp | Unit identity composed twice | (id∘id)(1)=1=id(1) | Composition retained with coherence | Retained |
| tracePair_completion | R=0; R=ℤ[x] | Constant ℚ[[h]] completes to 0; line step 1 is hS→Sdx | Completion, not F itself, identified with trace | Retained |
| tracePair_modBeta | Unit i=0,1 | ℤ and 0, respectively; line i=1 gives ℤ[x]dx[−1] | Filtered quotient convention agrees | Retained |
| tracePair_rational | Unit, zero | Unit combined step 1=hℚ[[h]]; zero is constant ℚ[[h]] | Rational corner retained | Retained |
| tracePair_pRational | Unit p=2,3 | (ℤ_p[[h]][1/p])^∧_h=ℚ_p[[h]], not zero | Separate p-adic rational datum | Retained |
| tracePair_multiplicative | n=2,∞ | Output levels E₁,E∞; E₁ cover term gives E∞ by preimage theorem | Correct level loss | Retained |
| tracePair_etale | ℚ→ℚ(i), k=1 | Pullback kernel hℚ[[h]], cokernel (ℚ(i)/ℚ); completed step hℚ(i)[[h]] | Nonstatic uncompleted step remains | Retained |
| traceHabiro (§1.3) | R=0 and unit ℤ | H(0,F)=0; H(ℤ,F)/(q−1)=ℤ | Uses algebraic H functor, no second completion | Retained headline |
| traceHabiro_map | Unit identity; zero input | 1↦1 and 0↦0, composition id∘id=id | Maps are induced by input morphisms | Retained |
| traceHabiro_hCompletion | Polynomial line, r=1,2 | Differential coefficients h and q²−1; at q=1 both 0, versus Jackson coefficients 1,2 | qHdg, not qdR | Retained |
| traceHabiro_partialCompletion | n=m=1; n=1,m=2 | h-completion is T₁; completing T₂ at h gives T₁; both projections send 1→1 | Correct divisor direction | Retained |
| traceHabiro_qWittGraded | m=1 on line | gr₀=ℤ[x], gr₁=ℤ[x]dx[−1]; higher forms 0 | Ascending conjugate filtration | Retained |
| traceHabiro_smooth | m=1 on line | H⁰=ℤ[x], H¹=ℤ[x]dx; Bockstein(x)=dx | Differential recovered on cohomology | Retained |
| traceHabiro_multiplicative | E₂ and E∞ input data | E₁ and E∞ output, respectively | No stronger multiplicativity inferred | Retained |
| traceHabiro_pairEquiv | Identity of unit pair | H(id)(1)=1; h-completion id(1)=1 | Requires a specified pair equivalence | Retained |
| traceHabiro_periodic | Unit, β and β⁻¹ | ββ⁻¹=1, h remains h | Bott variable, not h, is inverted | Retained |
| traceHabiro_cyclonic and twisted comparison | m=1; unit over ℤ[1/2] | h-completed periodic side ℤ[1/2][β^{±1}][[h]] on both sides; q−1 quotient nonzero | Includes 2-unit and (A₂) hypotheses | Explicit local comparison and limit proof |
| Ordinary/derived completion boundary | M=𝔽₂; first two factorial quotients | Dimensions 1 and 3; multiplication by monic q^m−1 has kernel 0 | No flatness over ℤ required | Retained supplier use |
| E1QuotientExponent | p=0,1,2,3; α=0…7 | At 2: false at 0,1,2,3,5,7 and true at 4,6; at 3: false at 1, true at 2; p=0,α=2 true | Nonprime values defined but no lift theorem there | Retained |
| E2QuotientExponent | p=2,3; α=2,3,4,6,7 | At 2 only 6 among these holds; at 3,2 fails and 3 holds | E₂ threshold stronger than E₁ | Retained |
| E2⇒E1 arithmetic law | (2,6),(3,3),(0,3) | (true,true) in each implication; bounds 6≥4,3≥2 | Both prime and junk inputs valid | Retained |
| quotientLift (§2.1) | Empty sequence; p=3,α=2; p=2,α=4,6 | Empty tensor=T; relative tower exponent 2 gives E₁; at 2 exponents α/2=2,3 give E₁,E₂ | Sufficient even-exponent bounds retained | Retained headline |
| quotientLift_framed | Regular y=x in ℤ_p[x], α=3; α=4 at 2 | Odd p E₂ exponent 3; at 2 E₁ exponent 4 gives basis 1,x,x²,x³ and p-torsion 0 | E₁ branch retains p-torsion-freeness | Retained |
| quotientLift_identityCover | Perfect toric B, R=B/x⁴; R=B/x² | α=4 meets E₁ at all primes; α=2 meets only odd primes | All-prime input not claimed for second until 2 inverted | Retained |
| quotientLift_perfected | ℤ₃/(3²); perfect base | π₀ quotient=ℤ/9 and 3·3=0 with 3≠0; a lift exists | Lift theorem does not imply torsion-free coefficients | Retained |
| Moore tower specialization | m=9,16,64,8 | Chosen exponents: 2,4,6; structures E₁,E₁,E₂; 8 has α=3 and fails chosen predicate | Separate S/8 theorem is not a necessary-bound counterexample | Retained |
| High-powered definition | m=1,9,16,64,8,32,12 | Values true,true,true,true,false,false,false; m=1 has empty prime-divisor set | Vacuous m=1 is intentional | Ownership now local §2.1 |
| perfectedLiftNaive (§2.2) | Toric x−1, p=2,3; exponent-one quotient | δ_q²(x,1) specializes at q=1 to (x−1)²/2; exponent-one filtration fails q-deformation | Spherical condition excludes ku-only lift | Retained headline |
| Completed flat base change in criterion | Toric roots through N; perfect base | Mod p, new root x^{1/p^{N+1}} not in old ring; perfect base map=id | Completion and faithful-flat descent retained | Retained route |
| perfectedLiftNaive_qReg | Any rational R; R=0 | All local completions=0; rational pair remains on dR[[h]]; zero pair has ℚ[[h]] | Empty local conditions do not erase rational gluing | Retained |
| perfectedLiftNaive_higherPowers | p=2,α=2,4; p=3,α=2 | Spherical predicate false,true,true; algebraic higher-power criterion also works at (2,2) | Routes distinguished | Retained |
| tracePair_quasiRegular membership (§2.3) | A=R=ℤ_p; perfect toric quotient x⁴ | Perfection map is id in first; x⁴ lifts at every prime in second | Extending lift to perfection precedes membership | Retained headline |
| tracePair_quasiRegular equivalence | Unit; R=0 | Both unit steps h^iℤ[[h]]; both zero pairs constant ℚ[[h]] with completion 0 | Gluing data and uncompleted pullback match | Retained |
| tracePair_quasiRegular Habiro consequence | Unit; R=0 | Descent/(q−1)=ℤ; zero descent=0 | Algebraic H transports the comparison | Retained |
| finiteCoefficientTrace ku (§2.4) | m=1,9,16 | m=1: TC⁻=0=F̂₁, despite F₁=ℚ[[h]]; modulo β,t at 9,16: π₀=ℤ/9,ℤ/16 | No assertion that π₀TC⁻ is just ℤ/m | Local headline |
| finiteCoefficientTrace KU | m=1,16 | First gives 0; second has ββ⁻¹=1 and the same coefficient mod h | Bott inversion followed by t-completion retained | Local headline |
| Finite-coefficient tower maps | Identity m=9; excluded m=8,12 | id sends 1→1 in ℤ/9; exponents 3 at 2 and 1 at 3 fail predicate | Specified tower, not arbitrary Moore structure | Local API |
| Jackson operator (§3 conventions) | 1,x,x²; q=1; x=0 | 0,dx,(1+q)x dx; at q=1: 0,dx,2x dx; last at x=0:0 | Integral operator has no division-by-zero defect | Retained |
| Coordinate filtration | d=2; (i,j)=(1,2),(3,2) | h^max(−1,0)=1; h^max(1,0)=h | Form-degree shift correct | Retained |
| Normalized q-PD generators (§3.0) | r=0,1,2; x=3,y=1,q=2 | 1,2,2/3; at q=1 degree two gives 2 | Degree-two normalization recomputed | Local definition |
| x-Jackson q-PD derivative | r=1,2; x=3,y=1,q=2 | r=1:1=δ⁰; r=2: (20/3−2/3)/3=2=δ¹ | Correct normalization | Local law |
| y-Jackson q-PD derivative | r=1,2; x=3,y=1,q=2 | r=1:−1; r=2: (−1/3−2/3)/1=−1=−(3−2) | Shift qy and minus sign required | Local law |
| q-PD denominators | Formal h; r=2; q=−1 | Constant [2]_q!=2, invertible over ℚ[[h]]; at q=−1 it is 0 | Specialization uses integral envelope, never ordinary 0-division | Added negative control |
| Full-diagonal framed Čech model | ℚ→ℚ×ℚ; empty coordinate set | S⊗S=ℚ⁴; diagonal completion=ℚ², coordinate-only completion=ℚ⁴ | Idempotent diagonal part retained | Local construction |
| Framed Čech maps and totalisation | Empty frame S=A; identity coface | Constant diagram totalises to A[[h]]; coface sends 1→1 and h→h | Maps and augmentation fixed | Local API |
| Polynomial/perfect-root resolution comparison | Line at p=2, steps 1,2 | Both give hS→Sdx and h²S→hSdx; mod β step 1 gives Sdx[−1] | Does not assert general E₂ comparison at 2 | Explicit local theorem |
| All framed pair clauses | ℚ→ℚ²; p-adic line | Step 1 kernel hℚ[[h]], cokernel ℚ; local/rational D_q(x²) coefficient 1+q on both resolutions | Coherences are proof obligations over the maps, not a uniqueness claim about arbitrary filtrations | Local theorem |
| framedTraceComparison | d=0,1,2 | Empty frame h^iA[[h]]; line form-degree-one h^{max(i−1,0)}; surface (i,j)=(3,2) gives h | No dimension-prime inversion in framed theorem | Local headline |
| Framed E∞ and derived commutative refinements | Line x²; empty frame | D_q(x²)=(1+q)x versus ordinary Leibniz 2x; empty frame product 1·1=1 | Enhanced product transported from static Čech model | Local theorem |
| canonicalFramedTrace (§3.1) | d=0,1,2 | n=max(d,1)=1,1,2; no prime ≤1; d=2 requires 2 unit | Full common domain, including dimension 1 over ℤ | Retained headline |
| canonicalFramedTrace_pair | Specific comparison, line dx | Mod β comparison sends dx→dx; zero map sends dx→0 | Specified map, not completeness alone | Retained |
| canonicalFramedTrace_habiro | Line at m=1; étale input | H⁰=ℤ[x], H¹=ℤ[x]dx; étale H=H_{S/A} | Descent preserves chosen equivalence | Retained |
| canonicalFramedTrace_einfty | Line x² | Enhanced D_q(x²)=(1+q)x; central untwisted product would require 2x | Multiplicative structure not silently changed | Retained |
| Derived reduction/Bockstein Check | Line class x and x² | H⁰(M/^Lh)=ℤ[x], H⁰(M)/h=ℤ; Bockstein x=dx and x²=(1+q)x dx | Reduction of cohomology is insufficient | Retained |
| Laurent framed comparison | ℚ[x^{±1}] over ℚ | H¹(qΩ)=ℚ·dx/x[[h]], H¹(qdR)=0 | Completed framed complex not identified with uncompleted qdR | Retained |
| TraceInversion (§4.1) | ℚ; Δ=0,−6,1,6 | Values false,false,false,true; disc ℚ=1; localization at 0=0 | Positivity and 6-divisibility independent | Retained |
| TraceInversion.isUnit_two_three | ℚ,Δ=6 | 2·(3/6)=1, 3·(2/6)=1 | Both units, not merely their product named | Retained |
| TraceInversion.finiteEtale | ℚ,Δ=6; ℚ(i),Δ=12; Δ=1 Gaussian | Ranks 1,2; Gaussian discriminant −4 becomes unit; at Δ=1 mod 2 Ω¹=𝔽₂[i]di≠0 | Finite étale over localized base has correct hypotheses | Retained |
| Nonintrinsic integer condition | ℚ(i); Δ=6,12 | 4∤6, 4∣12; both localizations ℤ[i][1/6] | Predicate is on integer presentation | Retained |
| Cubic discriminant | ℚ(∛2),Δ=108 | disc=−108; −108 divides 108; 6 divides 108 | General non-Galois field allowed | Retained |
| genuineRealisation | R=0; m=1 term | P₀=0; term 1=THH(KU⊗S_R/KU)^{hS¹} | Genuine fixed points, residual fixed points, limit, π₀ retained | Definition now supported locally |
| numberFieldTraceRealisation | ℚ,Δ=6; zero coefficient control | h-completion on both sides ℤ[1/6][[h]], 1↦1; zero objects both 0 | Ring comparison with unit/multiplication is explicit | Local headline |
| numberFieldTraceExports (§4.2) | m=1; ℚ,Δ=6 | ρ₁(q)=1; τ₁(q)=1+h; reducing modulo h gives 1 | Transport along inverse ε has correct direction | Retained headline |
| Cyclotomic export law | m=1 and identity divisor | qW₁(R/ℤ)=R; reduction and identity send 1→1 | Quotient, not completion, gives q-Witt ring | Retained |
| Taylor export law | m=1,4 | τ₁(q)=1+h; τ₄(q)=ζ₄+(q−ζ₄) | Root marking retained | Retained |
| Prime-edge transition | p=2,m=1 before localization | q+1=(q−1)+2; both sides give 2 at q=1 | Sign of re-expansion fixed | Retained |
| Taylor equalizer law | Rational family (1,0,…) at p=5 | Edge gives 1 on order-one side and 0 on order-five side | Product of unrestricted series is too large | Retained |
| h-completion export | ℚ,Δ=6; τ₁ | P_R^∧_h=ℤ[1/6][[h]]; h↦h; mod h=ℤ[1/6] | Does not identify uncompleted P_R with R | Retained |
| Noninjectivity of τ₁ | Rational coefficients inverting 6 | Factor supported on orders with v₂=1 has component 1 at order 2 and component 0 at order 1 | Kernel nonzero | Retained |
| Full Taylor coefficients | ℚ(i),Δ=12,m=4 | (1−i⊗i)/2 has evaluations (1,0); rank over R is 2 | One compositum factor is insufficient | Retained |
| Twisted Gaussian coefficients | p=7; a=i | Constant sides i,−i; inverse-twisted family has φ₇(−i)=i | Frobenius twisting necessary | Retained |
| Inverse Frobenius direction | ℚ(ζ₇),p=11 | 4²=2,4³=1 mod 7; φ(a²)=a⁸=a, φ(a⁴)=a¹⁶=a²≠a | Order-three control separates inverse from forward | Retained |
| Nonabelian-field example | Cubic mod 5 | Roots tested 0…4: cubic values 3,4,1,0,2; quadratic values 4,3,4,2,2; factorization degrees 1+2 | Local Frobenius order 2, no nontrivial global cubic automorphism | Retained |
| numberFieldTraceExports_naturality | Identity field embedding; two successive coefficient maps | Identity sends q→q,1→1; composite sends q→q,1→1 and retains the specified full coefficient maps | Naturality is a target, not inferred from an objectwise isomorphism | Retained |
| Source q-Pochhammer normalization | r=1; x=3,y=1,q=2 | λ¹((x−y)/(q−1))=2; γ̃¹=(x−y)/(1−q)=−2; δ¹=2 | Sign and derivative correction retained | Retained |
| Source finite rational corner | m=1 | Product of local completed factors=0; uncompleted rational corner=ℚ[[h]]; filtration completion=0 | Completed TC comparison unaffected | Retained |
