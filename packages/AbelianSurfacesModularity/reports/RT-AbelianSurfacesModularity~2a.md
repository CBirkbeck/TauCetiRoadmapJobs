<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1105#issuecomment-6448433296 -->
Red team round 2 pass a (codex) of 58242fd

Verdict: needs_changes

1. **F01** (P1) The unpolarized isogeny argument does not determine the symplectic class

   **Location:** packages/AbelianSurfacesModularity/README.md:657–675: “in the finite-field isogeny assertions (d)–(e) no principal polarization is imposed.”

   **Claim:** Every surface over 𝔽₂ with Q=X⁴−X²+4 has projective symplectic Frobenius class 6H, independently of polarization. Section 4.6 then asserts its toric conclusion without principal polarization.

   **Witness:** For A=Jac(C₃), put λ′=λ(4+π+V), with Frobenius π and Verschiebung V. Its degree is 121 and its Rosati eigenvalues are 4±√5>0. This changes class 6H to 6G without changing A[3].

   **Exact repair text:** “In (d), for an arbitrary surface A₀/𝔽₂ with Q=X⁴−X²+4, Frobenius on A₀[3] is nonsemisimple and its underlying Galois module is isomorphic to Jac(C₃)[3]. This unpolarized assertion does not determine its GSp₄ conjugacy class: with a specified prime-to-3 polarization, the class can be 6G or 6H.” Delete the inference from a prime-to-3 isogeny to equality of symplectic classes. Supply a separate polarized proof of the good-ordinary exclusion needed by the final consequence and §4.6; a possible route is the genus-two Jacobian/descended-product dichotomy, §4.4 for Jacobians, and an explicit pairing check for the quadratic Weil restriction. Any additional general polarized finite-field comparison used in that proof must have a named earlier owner or declared contract. Keep (e)'s unpolarized exclusion separately. In §4.6 replace the opening by “Let (A,λ)/ℚ₂ be a principally polarized abelian surface, using λ for both residual symplectic representations.”

   **Repair test:** λ′ still satisfies the retained module assertion, and its class 6G is now allowed in (d). Its degree 121 excludes it from the repaired principally polarized §4.6. The matrix verification below distinguishes the two classes even allowing scalar multipliers and F↦−F.

   **Further test of §4.6:** Take the ordinary canonical lift over ℤ₂ of Jac(C₃)/𝔽₂ and lift λ′ as well. The étale 2-torsion of C₃ has identity Frobenius (its characteristic-two branch points are 0,1,∞); the canonical lift splits the ordinary 2-divisible group. Thus its generic 2-torsion is trivial, hence contained in S₅(b). Its 3-torsion is unramified of class 6G for λ′; it is good ordinary and 2-distinguished. All four hypotheses of §4.6 hold, but its toric rank is 0, not 2. Principal polarization excludes λ′, and the original principal polarization gives class 6H instead.

2. **F02** (P3) A modularity Check repeats the defining convention

   **Location:** packages/AbelianSurfacesModularity/README.md:226: “A genus-two curve X is modular if and only if Jac(X) is, by definition”.

   **Claim:** This is presented as a Check of the modularity definition.

   **Witness:** Replace surface modularity by “admits a cuspidal GL₄ witness only.” Define curve modularity through its Jacobian as before. The displayed equivalence still holds, although the definition now wrongly excludes modular elliptic products.

   **Exact repair text:** Delete the Check bullet at line 226. The preceding API already records both its assertions, and the remaining Checks include the product, normalization and isobaric-support tests.

   **Repair test:** The wrong cuspidal-only model still passes the deleted equivalence; it fails the retained elliptic-product test, whose support has two rank-two constituents rather than one rank-four constituent.

3. **F03** (P2) The exterior-power consequence omits its degree range

   **Location:** packages/AbelianSurfacesModularity/README.md:219: “each L(s, H^i(A)) = L(s, ∧^i H¹(A)) is the L-function of an automorphic representation”.

   **Claim:** Every cohomological degree receives an automorphic witness from the cited positive-rank GLₙ interface, with no restriction on i.

   **Witness:** Take a modular elliptic product A=E×E and i=5. Then ∧⁵H¹(A)=0 and every Euler denominator is 1. At an unramified place every positive-rank GLₙ witness instead has a degree-n denominator with nonzero leading coefficient.

   **Exact repair text:** “If A is modular, then for 0≤i≤4, L(s,Hⁱ(A))=L(s,∧ⁱH¹(A)) is the L-function of an automorphic representation of GL_(binom(4,i)), by the all-place exterior-transfer contract. For i>4, Hⁱ(A)=0 and L(s,Hⁱ(A))=1.” Add a Check recording the ranks 1,4,6,4,1,0 at i=0,1,2,3,4,5.

   **Repair test:** i=5 now gives rank 0 and denominator 1 without invoking a nonexistent positive-rank witness; i=0 gives rank 1 and the trivial character. The zero exterior power is also witnessed by `exteriorPower.subsingleton_of_span_eq_top_of_card_lt` in `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean:418`. The cited AutomorphicLFunctionsAndLocalFactors AL.2 statement explicitly has n≥1 (README:1834).

4. **F04** (P3) The Asai proof step lacks its supplier locator and normalization

   **Location:** packages/AbelianSurfacesModularity/README.md:1066: “Then use the determinant and Asai argument”; the Needs line at 1084 cites ArithmeticGaloisRepresentations §§5.12 and 7.6.

   **Claim:** The b=2 proof uses tensor induction without identifying its existing owner or specifying which quadratic extension of V⊗V^σ is meant.

   **Witness:** ArithmeticGaloisRepresentations §7.1, Tensor induction (README:4117–4138), defines positive-flip Asai. Its trace on the nontrivial coset for trivial rank-two V is 2; the exterior-square cross-term has trace −2. Sections 5.12 and 7.6 do not fix this convention.

   **Exact repair text:** Add “ArithmeticGaloisRepresentations §7.1, Tensor induction” to the supplier contract and §8.2 Needs line. Replace the quoted phrase by: “For K/ℚ quadratic, write η for its quadratic character and use the positive-flip Asai construction of ArithmeticGaloisRepresentations §7.1. Decomposing the exterior square of an induction gives ∧²Ind_(G_K)^(G_ℚ)V₁ ≅ Ind_(G_K)^(G_ℚ)(det V₁) ⊕ (As⁺(V₁)⊗η). Apply the symplectic character line to these summands before the roots-of-characters and projective-lifting steps.” The exterior-square decomposition is the elementary specialized calculation in this proof; the tensor-induction construction is imported from its existing owner.

   **Repair test:** For the quotient C₂ and trivial rank-two V, Ind V=1²⊕η², so ∧²Ind V=1²⊕η⁴ has trace −2 at the nonidentity element. The corrected right side has trace 0+(−2)=−2; the untwisted positive-flip choice would give +2.

## Verification of the six earlier findings

The IDs below refer separately to the two first-round reports. None was marked “not actionable in this package.” All six original defects are repaired. No new defect was established in those replacement arguments; S01–S04 concern other assertions.

| Earlier finding | Status and repaired passage | Witness at this head |
| --- | --- | --- |
| Pass a F01: missing irreducibility and duplicated rank-two induction | **Repaired.** README:1064 says “continuous and irreducible”; README:1066 says “only its finite-up-to-twist branch occurs”. | ArithmeticGaloisRepresentations §5.12 (README:3464–3471) requires irreducibility. The previous counterexample 1⊕1⊕ε⁻¹⊕ε⁻¹ has two character orbits, not one, and is now expressly excluded at README:1077. The obsolete gap is absent. |
| Pass a F02: re-planning dyadic polarized lifting | **Repaired.** README:55 now requests “existence of a Cartier self-duality implies existence of a skew self-duality”. | AbelianSchemesAndArithmeticModuli A4.13 (README:2368 onward) supplies the lifting itself. The new gap only supplies its input; README:1179 and 1220 preserve the particular W. Order(W)=16 and order(W[2])=16 are retained. |
| Pass a F03: unsupported algebraicity/maximal-CM step | **Repaired.** README:1068 says “ψ_p is de Rham above p”; README:1070 says “2a_τ=wt(ψ) for every τ”. | AutomorphicGaloisRepresentations §3.13 (README:1730 onward) and AutomorphicGaloisRepresentationsPartII AG2.P/AG2.0 (README:320/733 onward) supply these statements. For a totally real quartic field all four exponents equal wt/2; quartic CM exponents (0,1),(0,1) have weight 1 and survive. |
| Pass b F01: duplicate rank-two modularity gap | **Repaired.** README:1112 invokes “ClassicalSerreModularity R27.6, Theorem 10.1(i), with weight-two newforms”. | That theorem occurs at ClassicalSerreModularity/README:883 onward. Two weights 0,1 are regular and give newform weight 2; README:146 supplies the comparison at q using a coefficient prime different from q. The obsolete gap is absent. |
| Pass b F02: duplicate finite-image projective lifting | **Repaired.** README:533 invokes “R17.5.4, Continuous finite-image arithmetic projective lifting”. | GL2AutomorphicRepresentationsAndTransfer/README:2356 and 2464 supply the lift and reduction comparison separately. A scalar residual twist of order 5 survives Sym³, whereas one of order 3 is killed; the text now removes the twist before taking Sym³. A dyadic root of unity reducing to 1 has 2-power order. |
| Pass b F03: wrong Weierstrass supplier | **Repaired.** README:184 now imports “Layer 5 for the gap sequence at a rational place, and Layer 11 for Weierstrass points”. | AlgebraicCurves on main, Layers 5,10,11 (README:571,918,1039 onward), separates the pole-number criterion from the characteristic-zero count. At characteristic 3, y²=x⁵−x has four rational branch points and six geometric branch points; the revised characteristic-≠2 pole-number argument applies. All five affected Needs lines now cite the three layers. |

Paths abbreviated as `Supplier/README:line` in this table mean `TauCetiRoadmap/Supplier/README.md:line`; target README references mean `packages/AbelianSurfacesModularity/README.md`.

## Declaration context table

| File | Declarations | Section variables / instances | Computable statement |
| --- | ---: | --- | --- |
| packages/AbelianSurfacesModularity/Suggested.lean | 0 | None | None: one import, module docstring and empty namespace. |

All 43 lines read. No Lean invocation is needed for a declaration-free file; the read-only review prohibits Lean builds.

## Verified sound

Read all 1,275 README lines and all 43 Suggested.lean lines. Inventory: **46 numbered target sections, 47 Check blocks, 206 Check bullets, zero Lean declarations, zero Lean definitions, zero instances, zero section variables**. The numbered headings are the target inventory in this README; there are no additional bold theorem headings. All 47 Check blocks were exercised by the values below; this means arithmetic, matrix, boundary and hypothesis tests, not independent proofs of all the cited deep theorems. S01–S04 are the exceptions found. The six earlier findings were rechecked individually above.

The declaration-context table is empty for mathematical reasons, not because declarations were sampled. A `#check @name` audit has no entries; no Lean command was run. The file has the required single import and namespace and contains no stand-in, sorry'd data, padding theorem or option override.

### Computed statement and Check ledger

Each row covers the named target, its definitions, API assertions and Checks. “Retain” means that the displayed tests found no further defect; the source and supplier limitations below still apply. All surfaces have dimension two and all numbered finite-field tests use actual fields of prime order 2 or 3. Rank zero, the zero ring, q=1 and inseparable characteristic-zero extensions fail the stated domains, rather than giving additional instances. No empty family is substituted for a nonempty local open. Point counts below include the projective chart at infinity. Write Q=X⁴+aX³+bX²+paX+p² and N₁,N₂ for curve counts over 𝔽_p,𝔽_(p²).

| Statement / context | Instances and computed values on the compared sides | Result / change |
| --- | --- | --- |
| Conventions, README:19–32 | Trace 1 at 3: Q=X²−X+3, T²Q(1/T)=1−T+3T²; inverse Frobenius has determinant 1/3 instead of 3. Pairings (e₁,e₄),(e₂,e₃),(e₁,e₂) are 1,1,0. Integral alternating block squares to −I; mod 2 this is I. Dual weights 0,0,−1,−1 become 3,3,2,2 under ε⁻³. | Retain; arithmetic/geometric conversion and Tate twist agree. |
| 0.1 modularity, README:204 | Two trace-one elliptic factors: degree-four denominator (1−T+3T²)²=1−2T+7T²−6T³+9T⁴; support ranks 2+2=4. A cuspidal witness has support length 1, versus 2 for the product. Identity isogeny changes no coefficient; an integral 3-isogeny need not preserve 3-torsion. Exterior ranks at i=0,…,5 are 1,4,6,4,1,0, with denominator 1 at i=5. | Retain the definition and support distinction; S02 deletes a vacuous Check and S03 bounds the positive-rank consequence. |
| 0.2 distinguishedness, README:235 | E₋₁×E₂ at 3 gives (a,b)=(−1,4), Q mod 3=X²(X+1)², but four distinct characteristic-zero roots. E×E has repeated roots, Q=Q_E². Y×Y′ at 2 gives Q=X⁴+3X²+4, unequal unit roots α,−α. | Both directions of good-ordinary equivalence pass; reduction can lose distinctness. |
| 0.3 analytic modularity, README:264 | (1−4)/2=−3/2; (1−2)/2=−1/2. Motivic involution 2−s sends 0→2 and 1→1, while unitary involution has fixed point 1/2. Product H¹ has two invariant rank-two subspaces and fails absolute irreducibility. | Retain conditional all-place comparison; no unramified-only substitution. |
| 1.1 outer classes, README:290 | Sum 36+540+540+1620+1440+1440+4320+6480+5184+4320=25920=51840/2. Lift squares: 2C gives −I, 2D gives I. Degree-40 common cycle types have sizes 4·10=40 and 2·2+6·6=40; degree-27 fixed counts distinguish 1/5 and 3/0. | Retain full class data; polynomial equality is weaker. |
| 1.2 unramified class, README:321 | ε⁻¹(Frob₂)=2=−1 mod 3; ±I have multiplier 1. (X²+X+2)²=X⁴+2X³+2X²+X+1; X↦−X switches both odd coefficients. C₁ gives (a,b)=(2,3), matching 10A's lift polynomial. | Both directions of the forbidden-polynomial test pass. |
| 1.3 regular semisimplicity, README:350 | Φ₅ mod 3 is irreducible because ord₅(3)=4, and gcd(Φ₅,Φ₅′)=1. A 4C lift has two roots each twice although its order is 8. The source's multiplier lists have 3 and 5 classes. | Retain; order alone does not imply regularity. |
| 1.4 allowed images, README:366 | Full GSp₄ has 103680 elements, kernel of multiplier has 51840, index 2. 103680/1620=64; corresponding symplectic subgroups have order 32. Source table: 15 accepted, 4+3+3=10 rejected, total 25. | Retain embedded-subgroup and cyclotomic distinctions. No independent subgroup-classification proof claimed. |
| 1.5 inadequate Sp₄, README:382 | In 𝔽₃[ε]/ε², ε≠0 and ε²=0. End dimension 4²=16 splits as dim Sym²=10 plus dim ∧²=6. The scalar first-order quotient ε=0 kills the deformation parameter. | Retain source's nonzero cohomology obstruction; its construction was source-checked. |
| 2.1 permutation realization, README:406 | Enumerated all 720 permutations on the four-dimensional even-subset quotient. Orders of the displayed generators: 2,2,5; involution ranks: 2,1. Centralizer sizes: transposition 48, double transposition 16, triple transposition 48; triple centralizer meets a letter stabilizer in order 8. Order-six matrices have different polynomials (X+1)²(X²+X+1) and (X²+X+1)². | Retain column convention and distinction between the two S₅ embeddings. |
| 2.2 rational Weierstrass points, README:437 | Trivial action fixes 6 branch points and 2⁴−1=15 nonzero torsion points. S₅(b) fixes 1 letter; S₅(a) fixes 0. A separable quintic has 5 finite branch points plus infinity=6. | Both fixed-point/containment directions pass; containment in the outer S₅ alone says nothing. |
| 2.3 strong oddness, README:453 | For I, transposition, double transposition, triple transposition, rank(g−I)=0,1,2,2 and diag(gJ)=0000,1000,1100,0000. Thus odd flags are false,true,true,false. For symplectic ranks n=0,1,2 the formula n+1+floor(n/2) gives 1,2,4 classes, with 0,1,2 odd classes. | Retain positive-rank polarized application and stated dyadic test. |
| 2.4 A₅ modules, README:469 | Dimensions 1,2,2,4; 2-part of 60 is 4. At a 3-cycle, V trace=2+ω+ω⁻¹=1, while U⊕U^σ gives −2. At a 5-cycle, four nontrivial fifth roots sum to −1 and are distinct. | Retain; traces distinguish the two candidate four-dimensional modules. |
| 2.5 near adequacy, README:485 | End dimension=16, socle dimension=1+4=5. Source cohomology dimensions for k,ad,ad/k are 0,0,1. For H=1 on k², semisimple span dimension=1<4 despite vanishing H¹. Over 𝔽₁₆ the same dimensions persist; 15 is divisible by 3 and 5. Hom(C₂,k⁺) has dimension 1 but Hom(C₂,kˣ) is trivial. | Retain near/ordinary adequacy and Schur-coefficient distinctions. |
| 2.6 CM restriction, README:503 | Index ≤2 in A₅ would give order 60 or 30; perfectness rules out the latter. Order-five element has four distinct eigenvalues; identity has one repeated four times. Nonidentity involutions in A₅(b) have rank 2 and nonzero diagonal. | Retain nontrivial complex conjugation and residual restriction hypotheses. |
| 3.1 residual automorphy, README:529 | S₅ sign kernel has 120/2=60 elements; A₅ sign kernel has 60. Complex eigenvalues 1,−1 give determinant −1. Sym³ weights of 0,1 are 0,1,2,3, whereas H¹ weights are 0,0,1,1. Scalar order 5 stays order 5 under cubing; scalar order 3 becomes 1. | Retain corrected lift/twist route; prior b F02 repaired. |
| 3.2 dyadic modularity, README:544 | Double transposition has order 2 and sign +1; a transposition has sign −1. An order-five residual element is regular. Polarization type (1,2) has degree (1·2)²=4 and degenerate mod-2 pairing. | Retain explicit symplectic realization; a polarization alone does not supply it. |
| 4.1 ordinary Weil quartics, README:570 | For Q=X⁴−X²+4, squared roots (1±√−15)/2 have absolute value 2, hence roots have absolute value √2; b=−1 is odd. (X²+2)² has b=4 even. Zero polynomial and constant term 1 fail p²=4. At x=1, Q(2)=16=4Q(1); at x=0 the uncancelled expression gives 0≠16 and is excluded. | Retain ordinary predicate, monicity and nonzero denominator. |
| 4.2 sixteen quartics, README:602 | Recomputed all 16 (a,b) pairs using t²+at+(b−2p), t∈[−2√p,2√p]. Row multiplicities 3+1+4+2+2+4=16. b=−3 and 3 both reduce to 0 mod 3. Q with (a,b)=(1,−1) is nonsquare over ℤ but has squared reduction mod 3. | Retain signs and integer/residual distinction. |
| 4.3 three dyadic Jacobians, README:616 | C₁: (N₁,N₂)=(5,7), (a,b)=(2,3), Q(1)=14. C₂: (3,7),(0,1),Q(1)=6. C₃: (3,3),(0,−1),Q(1)=4. Each two-chart smoothness test succeeds and each b is odd. | Retain count and ordinary data; source labels are 10A,6I,6H. |
| 4.4 all dyadic equations, README:630 | Of 2¹¹=2048 pairs, 768 pass both smoothness charts; 384 ordinary and 384 nonordinary. Ordinary counts by the source's classes total 32+16+48+96+192=384, with no square quartic. Unpointed example gives N₁=0,N₂=6,Q(1)=1; over 𝔽₄ it has points, unlike over 𝔽₂. | Retain section-acquiring unramified descent and two-chart criterion. |
| 4.5 good-ordinary exclusions, README:655 | (a,b)=(1,−1) gives Q(1)=7 odd and Q mod 2 at 1 equals 1. For α²+α+2=0, (−α)²−α+2=α≠0. Q₀(1)=4, comparison polynomial Q₁(1)=6. Changing λ to λ(4+π+V) changes symplectic class while Q₀ remains fixed. | **S01:** general module comparison survives; polarization-independent 6H claim fails. |
| 4.6 toric rank, README:673 | Good nonordinary Y gives (N₁,N₂)=(3,9), b=2 and Q(1)=7. X²+1 at 0,1,2 gives 1,2,2, so no invariant line. With t>0 and t+a=2, only t=2 remains. But the canonical-lift λ′ example has all four stated hypotheses and t=0. | **S01:** add principal polarization and preserve the pairing throughout the exclusion. |
| 4.7 products/coupled periods, README:689 | Product quartics reduce to 8A,4D,2D; (X²+X+2)(X²−X+2)=X⁴+3X²+4. R²=−I, det diag(−R,R)=1 and multiplier −1. Diagonal-period mod-2 seed fixes 0 odd refinements; coupled K seed fixes 2 of 6. For u²−u−1=0, N(u)=−1; t=u³ gives t²=8u+5. q=8000=20³=5·40² has v₂=6; valuation pairing is 6(m²+n²)>0 off zero. | Retain corrected coupled construction. q=5 gives valuation 0 and q⁻¹ negative, so both fail positivity. |
| 4.8 marked/unmarked Torelli, README:727 | Cover degrees 720/120=6 and 120/1=120; full subgroup gives degree 1, not a thin cover. Level 3 sends inversion to 2I≠I; level 2 sends it to I. Product locus dimension 1+1=2<3. The three quadratic differentials 1,x,x² times (dx/y)² are independent. y²=(x²+1)(x²+2)(x²+3) has 6 nonreal branch points and 0 real markings. | Retain fine-level, marking and local-density distinctions. |
| 4.9 explicit toric 6G seed, README:759 | Source bad seed has conductor exponent 2 and degree-two Euler polynomial X²+1, with quotient roots i,−i. Good reference Y has degree-four Q=X⁴+2X²+4, Q(1)=7 and b even. Both source labels are 6G, but toric ranks are 2 versus 0. | Count/degree/ordinary contrast passes; explicit ramified torsion computation remains source-certified only. |
| 4.10 local table, README:775 | Ten classes split into 8 permitted and 2 forbidden for distinguished semistable realization; 4 good-ordinary classes are 4D,6H,6I,10A. 2C seed fixes 2 odd theta characteristics, whereas the discarded product twist fixes 0. Both signs of a lift have the same projective class. | Retain marked principally polarized table; repair S01 in its proof input. |
| 5.1 triadic equations, README:813 | Of 3⁷=2187 polynomials, 1296 are smooth and 864 ordinary. Square quartic counts are 4+4+1+1=10, leaving 854 distinguished. There are 40 ordinary quartics; curves realize 36. Missing (a,b): (0,−5),(0,−4),(−3,8),(3,8). | Retain equation counts and product/isogeny distinctions. |
| 5.2 product special fibre, README:829 | E₋₁×E₂ gives Q=X⁴−X³+4X²−3X+9, Q(1)=10, and scalar étale action −I modulo 3. Its quadratic twist gives (a,b)=(1,4), Q(1)=18. Neither polynomial is a square. Product theta has 2 components, so the smooth-curve special fibre cannot have this principal polarization. | Retain good Jacobian/bad curve conclusion. |
| 5.3 all local modules, README:843 | Six degree-two invertible characteristic polynomials plus 2 extra scalar/Jordan choices give 8 GL₂(𝔽₃) classes. Four displayed curves give (N₁,N₂;a,b)=(7,15;3,7),(7,11;3,5),(3,13;−1,2),(5,11;1,1). The scalar case instead uses E₋₁×E₂; its mod-2 permutation has type (12)(345), 1 fixed letter. | Retain scalar/nonscalar separation and both signs. |
| 6.1 switch local condition, README:882 | Good marked class set has cardinality 4; semistable marked set has cardinality 8. Forbidden squared quadratics are the 4C/12C pair; class 2C requires the positive coupled toric datum, with 2 fixed odd refinements. | Both directions pass after S01's proof repair. |
| 6.2 2–3 switch, README:898 | x(x²+1)(x²+2) has one real finite root, two nonreal pairs and rational infinity: conjugation has type (2,2,1,1), sign +1. Full marked image is S₅ of order 120; each proper-subgroup index is ≥2. Local opens are at the finite set {2,3,∞}. | Retain rational approximation, nonempty opens and thin-set removal. |
| 6.3 infinitely many fixed-mod-3 curves, README:916 | The marked parameter space has dimension 3, whereas each finite collection of isomorphism classes gives finitely many framed points (finite level and 6 possible markings). Deleting k such points still leaves a dense open of dimension 3; k+1 choices result. | Retain induction on finite exclusions; no infinity claim from varying coordinates alone. |
| 7.1 odd-prime transfer, README:940 | At p=3, weights 0,0,1,1 are not regular but the ordinary component dimension supplied is 16. A repeated residual unit root can coexist with four distinct characteristic-zero roots, as (a,b)=(−1,4) shows. At A=B the residual comparison is the identity. p=2 fails the explicit p>2 premise. | Retain ordinary-component and seed hypotheses; dyadic case uses its own theorem. |
| 7.2 fifteen-image modularity, README:958 | Allowed images number 15; removing 4C and 12C leaves 8 local classes. The 3-isogeny integral obstruction does not affect equality of rational H¹ factors. The trivial image has order 1 and is outside the allowed list. | Retain End=ℤ, degree-prime-to-3 polarization and all supplier gates. |
| 7.3 Theorem A, README:974 | Full residual image order 103680 has symplectic subgroup 51840 and label 1.1.1, one of the 15. Polarization type (1,3) has degree 9 and fails prime-to-3; type (1,2) has degree 4 and passes. | Retain residual-endomorphism gap; no principal-polarization requirement is added to this global endpoint. |
| 7.4 good ordinary curves, README:990 | All 384 smooth ordinary dyadic equations are distinguished; their realized marked classes avoid the forbidden squared reductions. At 3 the 10 nondistinguished ordinary equations have no rational Weierstrass point; a supplied rational marking excludes them. | Retain curve, rather than merely Jacobian, good reduction in this corollary. |
| 7.5 Theorem B, README:1006 | Degree 5 gives a sixth branch point at infinity and at least 1 rational marking. Degree 6 need not: (x²+1)(x²+2)(x²+3) has 0 real branch points. Four rational branch points are possible over 𝔽₃, six are not. | Retain exact quintic and good-curve hypotheses. |
| 7.6 bad at 2, README:1022 | Unramified mod-3 plus bad reduction gives t>0; irreducible quadratic Frobenius excludes t=1, leaving t=2. Finite torus-character action can have orders 1,2,3,4,6; full Tate action still has cyclotomic determinant ε² and cannot factor through that finite group. | Retain corrected character-lattice use; do not apply finite-factor assertion to full Tate module. |
| 8.1 density, README:1048 | 624/2048=39/128; 854/2187; product=5551/46656. Conditional dyadic ratio 624/768=13/16 differs from 39/128. H^(10.5)log(H)/H¹¹=log(H)/√H→0. | Retain coefficient-box and joint-mod-6 qualifications. |
| 8.2 potentially abelian automorphy, README:1062 | ab=4 gives (a,b)=(4,1),(2,2),(1,4). b=1 has finite projective image. Reducible 1²⊕ε⁻¹² has 2 character orbits and fails irreducibility. A norm-pullback character induces ψ₀⊕ψ₀η, hence reducible; quartic CM exponents (0,1),(0,1) have weight 1, whereas totally real exponents are all wt/2. | Retain corrected rank-one/Clifford proof; S04 supplies the missing Asai locator and sign. On the C₂ control the cross-term trace is −2, not +2. |
| 8.3 endomorphism types, README:1086 | Product End⁰=ℚ×ℚ has rational idempotents (1,0),(0,1), giving 2+2. Under factor-swap C₂, fixed algebra is diagonal ℚ of dimension 1; trivial action has fixed dimension 2. Geometric End does not change under base extension. | Retain algebra-with-action definition and rank-two Hodge comparison. |
| 8.4 32 types, README:1106 | 34−2=32. H¹ has two distinct weight values 0,1; a character twist of a finite representation has one repeated value. Each rational rank-two factor has Hodge dimensions 1+1, determinant(c)=−1, and newform weight 1+(1−0)=2. | Retain regular rank-two supplier and all-place coefficient-prime change. |
| 8.5 fixed 2-torsion family, README:1123 | Split K=F⁶ has 6 choose 2=15 collision hyperplanes. θ=(0,1,2,3,4,5) has 15 nonzero differences; θ=0 gives χ=T⁶, discriminant 0, and is excluded. dim Z=6, dim Z⁺=7. c=0 is excluded; c=2 preserves 2-torsion but can make infinities nonrational. | Retain affine carrier, nonzero scalar and quadratic-twist parameter. |
| 8.6 identity at 3, README:1159 | Six rational branch points would inject into P¹(𝔽₃), which has 4 points: 6>4. Full rational elliptic 2-torsion gives 4 dividing #E(𝔽₃); Hasse interval [1,7] then forces #E=4, trace 0, nonordinary. | Retain obstruction; no missing identity seed is claimed. |
| 8.7 prescribed W realization, README:1175 | Weil-restriction E/𝔽₉ has #E=8, trace 2, Q=X⁴−2X²+9, Q(1)=8. Q′=4X(X²−1); values Q(0),Q(±1)=9,8 imply gcd 1. Swapping elliptic summands fixes 0 of 6 odd refinements, type [2,2,2]. Split W has order 4·4=16; dyadic étale possibilities have orders 1,2,3. | Retain replacement seed, specified integral model and declared duality/open-neighbourhood contracts. Detailed nine-seed values below. |
| 8.8 mod-2 residual modularity, README:1226 | S₆ and A₆ orders are 720 and 360. Neither order implies the integral model. Spherical at both 2 and 3 means conductor exponents 0,0. A dyadic order-five image acts irreducibly on 𝔽₂⁴ because ord₅(2)=4, so it has no invariant rank-two multiplicative part in a self-dual ordinary model. | Retain spherical-attachment gap and nonidentity triadic hypothesis. |

The two worked examples at README:1256–1260 combine the corresponding rows: eight allowed dyadic classes, triadic scalar and nonscalar seeds, real cycle type (2,2,1,1); and the replacement triadic quartic with discriminant −32 in X². They introduce no additional theorem or carrier.

### Independent finite seed calculations

For the nine triadic curve rows in §8.7, direct finite-field evaluation gives the following. Every polynomial is squarefree on its projective model, every b is prime to 3, and none of these nine quartics is a square. The factor degrees agree with the listed partitions, including infinity for degree-five equations.

| Partition | N₁ | N₂ | a | b | Q(1) |
| --- | ---: | ---: | ---: | ---: | ---: |
| 1,1,1,1,2 | 4 | 6 | 0 | −2 | 8 |
| 1,1,1,3 | 5 | 13 | 1 | 2 | 16 |
| 1,1,2,2 | 6 | 10 | 2 | 2 | 20 |
| 1,1,4 | 6 | 10 | 2 | 2 | 20 |
| 1,2,3 | 5 | 13 | 1 | 2 | 16 |
| 1,5 | 5 | 7 | 1 | −1 | 13 |
| 2,4 | 6 | 14 | 2 | 4 | 22 |
| 3,3 | 4 | 12 | 0 | 1 | 11 |
| 6 | 6 | 16 | 2 | 5 | 23 |
| Discarded source 2,2,2 curve | 8 | 14 | 4 | 10 | 36 |

The last row gives exactly (X²+2X+3)², confirming why it cannot supply distinguishedness. The replacement surface has (a,b)=(0,−2), Q(1)=8 and four distinct roots.

### Matrix certificate for S01

All entries in this paragraph are in 𝔽₃. A cyclic matrix for X⁴−X²+4 and one compatible form are

| Matrix | Rows |
| --- | --- |
| F | (0,0,0,2); (1,0,0,0); (0,1,0,1); (0,0,1,0) |
| B | (0,0,1,0); (0,0,0,2); (2,0,0,0); (0,1,0,0) |
| U=I+F−F⁻¹ | (1,2,0,2); (0,1,2,0); (0,1,1,0); (1,0,1,1) |
| BU | (0,1,1,0); (2,0,2,2); (2,1,0,1); (0,1,2,0) |

Here FᵀBF=2B; BU is alternating and nonsingular and Fᵀ(BU)F=2BU. Rank(F²+I)=2 and (F²+I)²=0, excluding 2C. There are 8 nonsingular alternating forms satisfying FᵀBF=2B and 72 invertible matrices commuting with F, all polynomials of degree at most 3 in F. Their action, allowing multiplication of the form by 1 or 2, has two orbits of size 4. Multiplication by U exchanges them for **every** compatible B. Including the 72 matrices anticommuting with F still leaves those two orbits.

There is also a short algebraic check: the residue field of 𝔽₃[F] is 𝔽₉ with i²=−1. The adjoint sends F to −F⁻¹ and induces the identity on this residue field. Thus a change of cyclic basis changes the residual pairing by a square. U reduces to 1−i, whose norm to 𝔽₃ is 2, hence it is a nonsquare. Scalars from 𝔽₃ are squares in 𝔽₉. The matrix D=diag(1,−1,1,−1) sends F to −F and preserves the displayed B, so projectivizing does not identify the two orbits. The two classes are precisely the 6G/6H pair of §1.1.

For the geometric witness, (π+V)²=5 follows from Q(π)=0 and πV=2. The endomorphism u=4+π+V is Rosati symmetric with positive real values 4±√5; deg u=(16−5)²=121. Therefore λu is an actual polarization, prime to both 2 and 3. On 3-torsion it changes B to BU. This verifies the counterexample without assuming that an unpolarized isogeny respects a Weil pairing.

### Headline and pinned-library audit

The headline inventory is §0.3; §§3.1–3.2; §4.10; §§6.2–6.3; all six Layer 7 endpoints; §§8.1–8.4; and §§8.7–8.8. The module docstring names these and the missing arithmetic/automorphic carriers. In particular, an arbitrary function ℂ→ℂ would not state the surface L-function theorem, and the coefficient-box rational number alone would not state the modularity-density theorem. No omitted headline was found to be statable using only a few simple definitions at these pins. Finite matrix identities and equation counts are subsidiary Checks, not replacements for those endpoints.

Checked **18 named supplier declarations at the pins**, plus the exterior-power vanishing declaration used in S03: Matrix.J, Matrix.symplecticGroup, Matrix.charpoly, Matrix.IsSymm, Equiv.Perm, alternatingGroup, MulAction.stabilizer, Representation, groupCohomology.H1, Polynomial.aroots, card_alternatingGroup, alternatingGroup.isSimpleGroup, TauCeti.AlgebraicGeometry.AbelianVariety, TauCeti.schurMultiplier, TauCeti.GlobalNumberFields.HeckeCharacter, its IsAlgebraic predicate and add_conjugate_eq_add_conjugate theorem, and Representation.exists_ne_zero_apply_eq_self_of_forall_pow_eq_one.

The relevant pin witnesses include `Mathlib/Logic/Equiv/Defs.lean:94` (Perm is a self-equivalence), `Mathlib/LinearAlgebra/SymplecticGroup.lean:58` and `:101` (fixed J and AJAᵀ=J), `Mathlib/RepresentationTheory/Basic.lean:48` (no topology or finite dimension), and `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` (proper geometrically integral group object). The last file does have dimension at line 118; it does **not** bundle a polarization, ordinary reduction or an automorphic realization. The README correctly says “a chosen dimension” is not bundled, rather than claiming dimension is absent. The Hecke-character purity theorem only equalizes conjugate sums; it does not replace the maximal-CM-subfield theorem. The fixed-vector theorem needs a nonzero module and a finite group, which the application satisfies.

Pins checked: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The main-roadmap copy was `d2e0f0d3`. No newer library declarations were substituted.

### Supplier, ownership and order audit

Checked **28 named roadmap supplier contract groups**, including their cited section/target locators, against main or the supplied/current indexed new-roadmap head. The two design-only suppliers below were read from the board and are conditional contracts, not library implementations. The following records the important hypothesis boundaries; it is not a claim that all planned supplier proofs already exist.

| Supplier | Resolved sections / boundary checked |
| --- | --- |
| AbelianSchemesAndArithmeticModuli | A3.7–A3.8, A3.11–A3.12; A4.8–A4.14; A5.7; A6.5, A6.7–A6.8, A6.12, A6.20, A6.32–A6.34. Pairing perfectness needs degree prime to torsion order; principal quotients may require extension. A4.13 receives an actual skew self-duality, not a free predicate. |
| AbelianSchemesAndArithmeticModuliPartII | B4.1 fine curve family/quasi-finite Torelli at g=2, level 3; F3.2 ordinary Honda–Tate, including products. The target adds open-complement/rationality statements rather than attributing them to quasi-finiteness. |
| ArithmeticGaloisRepresentations | §§5.12,6.3–6.4,7.3,7.6,7.9,7.11; §7.1 for S04. Clifford irreducibility, projective lifting and character roots are present; rank-one algebraicity is not assigned to Clifford theory. Residual and integral enormousness remain distinct. |
| FaltingsFinitenessAndIsogenyTheorems | R28.4.4–R28.4.7: semisimplicity, commutants and isogenies. The open-image and residual-endomorphism additions remain explicit gaps. |
| NeronModelsAndSemistableAbelianVarieties | §§3.5–3.6,3.11–3.14,5.0a–5.6,6.10–6.13: toric filtration, semistability, pairings, all-place local factors and ordinary/parabolic tests. Its §6.12 uses principal polarization in the relevant residual comparison; S01 prevents forgetting it. |
| ShimuraCompactifications | C4.4–C4.6: positive polarized degeneration data and effectivity. For §4.7 the actual valuation matrix is 6I, not zero; the base ℤ₂ is normal and complete. |
| LocalGaloisDeformationRings | §2.2 and §§6.27,6.29,6.31–6.35. An unramified deformation functor does not say all lifts are unramified; the separate rigidity gap covers that. The ordinary component used by §7.1 is the pure weight-two comparison in §6.35. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | R07.6.10 cyclotomic-image stability: good reduction at p≥3 retained. |
| PotentialAutomorphyInfrastructurePartII | PL.0 and PL.4 in `packages/PotentialAutomorphyInfrastructurePartII/design/README.md:440`, `:1793`, `:1877`. Soluble descent retains irreducibility, strong oddness retains the polarized pair, and relaxed adequacy includes the trace condition. |
| GSp4NonregularModularityLifting | NR2.5–NR2.6, NR10, NR11.2–NR11.6 in `packages/GSp4NonregularModularityLifting/design/README.md:377`, `:389`, `:1021`, `:1200`, `:1262`. Away-p semisimplified attachment is not an all-place monodromy theorem; the package declares the extensions. The five proof-gate groups at :1282 are retained in its conclusions. |
| OrdinaryAutomorphicFormsAndModularityLifting | §2.11 has a different prime/weight range; dyadic weight-one change is an explicit extension. |
| InverseGaloisAndArithmeticFundamentalGroups | IG.2.4–IG.2.7: thin sets, full-group specialization, integral-box bounds and weak approximation. Generic monodromy is separately supplied, not inferred from Hilbert irreducibility. |
| EndoscopicTransferAndUnitaryTraceComparison | §§8.3,11.1,13.3: finite-field Tate comparison, classification/transfer and quadratic character induction. Cuspidality retains ψ≠ψ^σ; singular forward transfer is a gap. |
| AutomorphicLFunctionsAndLocalFactors | AL.2 Global Godement–Jacquet and Centered entire functions; AL.3 isobaric strong multiplicity one; AL.4 local-factor normalization and exterior-power factors. Its existing partial exterior-factor statement does not itself prove every ramified factor. |
| ModularityAndLanglandsExtensions | §§1.9,1.11,1.13,3.26 and Automorphic induction and its cuspidality criterion. The odd Artin branch is totally real; both quadratic inductions retain the full Galois orbit. Classification premises are propagated. |
| ClassicalSerreModularity | R27.6, Theorem 10.1(i), at README:883 onward: odd irreducible regular rank-two compatible systems, not arbitrary irregular representations. |
| GL2AutomorphicRepresentationsAndTransfer | R17.5.1, R17.5.4–R17.5.7, R17.5.11: projective lift, solvable Artin branch and prime-regular reduction comparison. A₅ automorphy is sourced separately. |
| AutomorphicGaloisRepresentationsPartII | AG2.P, AG2.0, AG2.2, AG2.5: de Rham summands, algebraic characters and labelled exponents, twists/base change and RACSDC attachment. |
| AutomorphicGaloisRepresentations | §§3.7,3.11,3.13: newform comparison away from the coefficient prime and rank-one de Rham algebraicity with finite ramification. |
| AutomorphicFormsOnReductiveGroups | §§2.3–2.7: normalized induction and archimedean parameter dictionary; finite Euler-factor equality alone is not used to choose Γ factors. |
| EllipticCurveModularity | R29.6 over ℚ, supplying the product cases only over the stated base. |
| EllipticCurveModularityPartIIGL2TypeAbelianVarieties | GT.3, especially modularity-theorem at README:833: GL₂-type varieties over ℚ, not all quadratic fields. |
| ShimuraVarieties | §§1.2,5.0, especially README:1281 onward: principal full level N≥3 has a fine universal family; level 2 alone is coarse. Prime-to-level connectedness is separately declared. |
| AlgebraicModuliForArithmeticGeometry | §§3.5,5.2: polarized descent and level/inertia comparison, not odd-theta rationality. |
| AlgebraicCurves | Main Layers 5,10,11: gap sequence, hyperelliptic rational subfield and Weierstrass points. The algebraically closed characteristic-zero counting statement is not silently extended to characteristic 3. |
| RelativeJacobiansAndIntegralCurveModels | §§0.1–0.3,2.2,2.4: proper flat models and pointed smooth proper relative Jacobians. Section-acquiring unramified extension and descent in the target meet the pointed hypothesis. |
| PolynomialGaloisGroups | Main Layers 0,4: intrinsic root permutation actions and resolvents. The specialized 40- and 27-point actions remain targets here. |
| EllipticCurves | Main Layers 3,4: finite-field Hasse bounds and Tate/reduction dictionary. The bound used at 3 is the integer interval [1,7]. |

Repository-relative supplier citations in this table denote `TauCetiRoadmap/<Supplier>/README.md`, except the two explicitly named design files. Object searches used the roadmap index tool, main/Completed, board packages and the available open-head files. Matches for potentially abelian decomposition, finite-image projective lifting, rank-two modularity, hyperelliptic torsion, deformation and ordinary reduction resolve to the owners listed above. Matches for “odd theta” in QSeriesPartitionsAndMockModularForms concern theta functions, not the moduli construction here. No competing owner for the specialized two-prime switch, coupled local seed or endpoint type assembly was found. No fully qualified Lean-name collision is possible in this empty namespace.

All **16 gaps** have identical slugs and needs sentences in the README and the top-level plan list. Their boundaries were checked individually:

| Gap | What remains additional to the current supplier |
| --- | --- |
| surface-open-image | Surface End=ℤ ⇒ Sp₄ Zariski containment, including nonprincipal polarization and finite base change. |
| surface-residual-endomorphisms | Five-point module/Galois-stable algebra adapter for arbitrary surfaces; the Jacobian theorem alone is insufficient. |
| near-adequacy-reasonableness | Eventual cyclotomic H⁰/detection and conditional dual-adjoint H¹ conditions, with the Whitmore comparison. |
| integral-enormity | Integral condition and both alternatives of BCGP25 Corollary 7.1.4, not just residual enormousness. |
| dyadic-weight-one-change | p=2, weight-one to ordinary weight-two with determinant and solvable-base-change constraints. |
| local-neighbourhoods | Simultaneous finite-level/local-data persistence and the separately specified integral W isomorphism class; no full p-adic constancy. |
| unramified-lift-rigidity | Every lift, including nonreduced coefficient rings, under the Frobenius-ratio exclusion. |
| genus-two-level-three-monodromy | Actual full monodromy for the two specified families before invoking Hilbert irreducibility. |
| ordinary-spherical-attachment | Global member choice with compatible prescribed local members and ordinary attachment at the new prime. |
| forward-singular-spin-transfer | Singular weight-two forward transfer and exclusion of nongeneral types. |
| all-place-exterior-transfers | All finite factors for the assembled small-rank H¹ decompositions, beyond the supplier's conditional partial-factor formula. |
| dyadic-selfdual-polarized-lift | Existence of the skew input for the specified W; A4.13 still owns lifting it. |
| strong-odd-symplectic-criterion | Matrix translation and class count, beyond the supplier's symmetric-form dichotomy. |
| ordinary-polarized-three-model | Compatible polarized height-four BT₁ input for A4.12, beyond a bare finite-flat generic module. |
| all-place-surface-comparison | Ramified attaching-prime comparison, conductor and archimedean normalization. |
| siegel-prime-to-level-monodromy | Connected fixed-pairing level-ℓ cover for ℓ∤N, beyond fine representability. |

No gap has supplier `none`. No additional duplicate or vague gap was established. These are accepted as declared contracts, not raised as missing implementations.

The required dependency command returned, with exit status 0:

```text
depcheck: 149 roadmaps, 1024 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. The internal proof routes use the earlier finite/group/local layers before switching and lifting; §8.3 supplies the type dictionary before §8.4. Definitions and references to later corollaries in §0.1 do not create a dependency of the definition on those corollaries.

The head was confirmed as `58242fd`. The read-only diff against origin/main changes only `packages/AbelianSurfacesModularity/`. README and docstring contain no pull-request numbers, build commands, `set_option`, computational algorithm or suspicious instruction to the reviewer. The audit did not modify either target file, the design, manifest or merge order.

### Source-locator record

The following **88 distinct source anchors** were resolved in the five legal cached extractions, with their surrounding theorem/proof context. The anchors are counted once even when reused by several targets. Locator resolution does not certify a false source statement; those are separated below. Numbering follows the manifest versions (including BCGP21 arXiv v3 and WHITMORE22 v4).

| Source | Verified anchors | Count |
| --- | --- | ---: |
| BCGP25 | 100, 150, 343, 376, 499, 679, 704, 728, 750, 5348, 6750, 6764, 6778, 6838, 6927, 6973, 8274, 8299, 8356, 8391, 8404, 8443, 8508, 8546, 8625, 8635, 8646, 8676, 8715, 8746, 8856, 8872, 8895, 8933, 8939, 8943, 9001, 9051, 9057, 9083, 9102, 9177, 9214, 9226, 9253, 9305, 9362, 9385, 9448, 9489, 9553, 9564, 9596, 9642, 9656, 9671, 9714, 9785, 9790, 9839, 9896, 9959, 9981, 10159, 10182, 10213, 10273, 10292, 10302, 10313 | 70 |
| BCGP21 | 9681, 12056, 12064, 12166, 12966, 12991, 13038 | 7 |
| FKRS12 | 167, 183, 194, 987, 1002 | 5 |
| ZARHIN00 | 113, 186 | 2 |
| WHITMORE22 | 936, 1015, 1024, 1648 | 4 |

Each number denotes `<source id> line N`; no source text has been copied into the report. All 46 target sections have a source locator. The three remaining manifest entries are expressly uncertified, as recorded next.

## Not verifiable

- **KIS99**, Theorem 5.1, pp.569–593; **THORNE17**, Definition 2.20; and **FC90**, II Theorem 6.2/Remark 6.3 and III Theorem 7.1/Corollaries 7.2–7.4 remain settled `uncertified` citations. Their texts were not requested again. The local-neighbourhood, duality and toric-algebraization assertions were checked against their named contracts, not falsely certified from unavailable books or papers.
- The two design-only suppliers, PotentialAutomorphyInfrastructurePartII and GSp4NonregularModularityLifting, have readable target contracts but no completed package at the locations inspected. In particular the corrected characteristic-zero patching, regular ordinary support, classification and related proof gates are assumptions. This review is conditional on those gates and the 16 declared gaps; it does not assert their proofs.
- The complete 25-subgroup classification, modular projective-cover calculations and all degree-27 resolvent computations were compared with the cited source rather than independently reconstructed. The rank-four matrix, pairing, centralizer and finite-field curve computations recorded above were independently recomputed. The explicit bad-reduction 6G curve's 3-division splitting field and global conductor labels were not independently recomputed.
- WHITMORE22's extraction damages some superscripts/subscripts. Its definition/lemma locators, eventual tower condition and accompanying prose were checked; glyph-level fidelity of the damaged formulas cannot be certified from that extraction alone.
- Ownership was checked against main, Completed, board packages and the available indexed/specified open heads. No claim is made about unpublished work or open work for which the brief supplied no inspectable files. No web pull-request text was treated as authority or instruction.
- No Lean build or elaboration was run. There are no declarations whose signatures require elaboration, so the requested binder audit has zero entries rather than an untested nonempty signature list.

## Source issues

- **Misprint** in BCGP25 at §1.8.3, printed page 8, line 387: the source says a global representation satisfies an unfinished conditional; it should be called pure when every finite local restriction is pure; affects nothing.
- **Misprint** in BCGP25 at Definition 1.8.10, printed page 11, lines 523–533: the source says the residual multiplier is ε̄ while its diagonal has multiplier ε̄⁻¹; it should consistently use ε̄⁻¹; affects a stated result.
- **Misprint** in BCGP25 at Lemma 6.4.1(2), printed page 149, line 6759: the source says outer multiplier classes project into PSp₄; it should place them in PGSp₄ outside PSp₄; affects nothing.
- **Misprint** in BCGP25 at proof of Lemma 6.4.3, printed page 150, line 6822: the source says Γ is Γ′ intersected with GSp₄; it should be Γ′ intersected with Sp₄, of index two when the multiplier is nontrivial; affects the proof.
- **Gap** in BCGP25 at proof of Theorem 8.3.2, printed page 186, line 8572: the source says Zarhin's Jacobian theorem applies to an arbitrary surface; it should supply the five-point-module and stable-endomorphism-algebra argument for that broader input; affects the proof.
- **Misprint** in BCGP25 at proof of Lemma 9.1.6(2), printed page 190, lines 8754–8755: the source says lift squares for 2C and 2D are I and −I; it should give −I and I respectively; affects nothing.
- **Misprint** in BCGP25 at proof of Lemma 9.1.8, printed page 191, lines 8821–8822: the source says the full Tate module supplies the isotropic plane in the toric case; it should use the rank-two toric submodule; affects the proof.
- **Misprint** in BCGP25 at Definition 9.2.1 discussion, printed page 192, line 8869: the source says twisted rationality is BCGP21 Theorem 10.2.3; it should cite Lemma 10.2.4, using Proposition 10.2.3 for equivariance; affects nothing.
- **Gap** in BCGP25 at proof of Lemma 9.2.7, printed page 195, lines 8995–8996: the source says residual H² vanishing implies every lift is unramified; it should use the adjoint eigenvalue-ratio rigidity argument, including coefficient thickenings; affects the proof.
- **Error** in BCGP25 at Lemma 9.2.12 and proof, printed page 196, lines 9057–9082: the source says the isogeny-class argument determines symplectic class 6H; it should retain the unpolarized module conclusion and justify polarization-dependent refinements separately, as the degree-121 polarization switches the class; affects a stated result.
- **Error** in BCGP25 at Lemma 9.2.13, printed pages 196–197, line 9083: the source says its three residual hypotheses force purely toric reduction; it should exclude good nonordinary reduction and retain principal polarization in the good-ordinary exclusion; affects a stated result.
- **Error** in BCGP25 at proof of Lemma 9.2.14, printed page 197, lines 9110–9148: the source says cubic Tate periods give trivial 3-torsion and identical Frobenius blocks; it should use μ₃⊕ℤ/3 and the opposite blocks −R,R; affects the proof.
- **Error** in BCGP25 at proof of Lemma 9.2.14, printed page 198, lines 9152–9172: the source says diagonal periods give centralizer order 16 and an odd-theta marking; it should give order 48 and zero fixed odd characteristics, requiring a different seed; affects the proof.
- **Misprint** in BCGP25 at §9.2.16, printed page 198, line 9182: the source says the integral dyadic quartic has constant coefficient 1; it should have constant coefficient 4, with 1 only after reduction modulo 3; affects a stated result.
- **Misprint** in BCGP25 at proof of Lemma 9.2.19, printed page 199, line 9233: the source says the target already has the reference residual minimal polynomial; it should apply that assertion to the reference Jacobian before the isogeny-kernel reduction; affects the proof.
- **Error** in BCGP25 at proof of Lemma 9.3.7 and Remark 9.3.8, printed pages 203–204, lines 9413–9417 and 9448–9468: the source says elliptic traces −1,2 realize scalar +1 on étale 3-torsion; it should use scalar −1 there or twist to traces 1,−2, changing Q(1) from 10 to 18; affects the proof.
- **Misprint** in BCGP25 at proof of Lemma 9.3.7, printed page 203, lines 9424–9438: the source says the displayed matrices represent the named permutations under its column convention; it should label them by the inverse permutations; affects nothing.
- **Gap** in BCGP25 at Lemma 9.4.1, printed page 204, lines 9470–9479: the source says rational varieties suffice while the proof invokes smoothness; it should require smoothness or a suitable local-density hypothesis; affects a stated result.
- **Misprint** in BCGP25 at proof of Lemma 9.4.1, printed page 204, lines 9483–9486: the source says projective bounded-height counts have exponent n; it should use n+1, and shift the thin-set exponent accordingly; affects the proof.
- **Error** in BCGP25 at proof of Lemma 9.4.2, printed page 205, lines 9538–9540: the source says a neighbourhood of a possibly bad semistable seed has good ordinary reduction; it should preserve the seed's semistable ordinary local data; affects the proof.
- **Misprint** in BCGP25 at proof of Theorem 9.5.5, printed page 209, line 9687: the source says T₂(B) is the relevant ℤ₃-module; it should use T₃(A); affects nothing.
- **Error** in BCGP25 at proof of Theorem 9.5.5, printed page 209, line 9696: the source says the full 3-adic Tate action factors through a finite unramified extension; it should apply finite factorization to the torus-character lattice, not the cyclotomic and monodromy-bearing Tate module; affects the proof.
- **Misprint** in BCGP25 at §10.1, printed page 209, line 9721: the source says the forbidden quartic has matching cubic and linear signs; it should have opposite signs modulo 3; affects a stated result.
- **Gap** in BCGP25 at §10.1, printed pages 209–210, lines 9714–9729: the source says separate local equidistribution justifies multiplication and discarding the global exception; it should require joint mod-6 equidistribution and a full-monodromy thin-exception argument; affects the proof.
- **Error** in BCGP25 at Remark 10.3.2, printed page 216, lines 10021–10024: the source says ordinary Cartier self-duality automatically gives an alternating generic pairing; it should distinguish arbitrary self-duality from a suitable skew or alternating choice; affects the proof.
- **Error** in BCGP25 at proof of Lemma 10.3.1, printed page 216, lines 10046–10048: the source says absence of rational Frobenius eigenvalue 1 kills integral H²; it should only conclude rational vanishing, since integral H² can have finite 2-torsion; affects the proof.
- **Misprint** in BCGP25 at §10.3.5, printed page 219, line 10175: the source says the primitive-element open lies in P⁶; it should be the stated hyperplane complement in A⁶; affects a stated result.
- **Gap** in BCGP25 at §10.3.5 and Lemma 10.3.6, printed pages 219–220, lines 10159–10212: the source says the monic family provides the required local approximation; it should include a nonzero leading scalar to preserve arbitrary local quadratic twists; affects the proof.
- **Error** in BCGP25 at Lemma 10.3.6 table, printed page 220, line 10220: the source says the conductor-7165 curve is a distinguished [2,2,2] seed; it should use a different seed because its quartic is (X²+2X+3)²; affects the proof.
- **Misprint** in ZARHIN00 at proof of Theorem 4.1, printed page 5, line 197: the source says Aₙ has index two in G even when G=Aₙ; it should say index two in Sₙ; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "58242fda620190a3a01bbfe1282890f6aa68ed80", "job": "RT-AbelianSurfacesModularity~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
