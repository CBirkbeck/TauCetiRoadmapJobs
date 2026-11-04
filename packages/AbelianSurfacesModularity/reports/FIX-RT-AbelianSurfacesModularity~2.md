# Repair report: AbelianSurfacesModularity

## RT-AbelianSurfacesModularity~2a/F01 (P1) — applied

Unpolarized module comparison → module comparison plus a separate principal-polarization theorem in §4.5. The polarized proof uses AbelianVarietiesOverFiniteFields §10.3, the Jacobian enumeration and an explicit paired Weil-restriction matrix. Section 4.6 now requires a specified principal polarization; §4.9 supplies it canonically. Added degree-121 and canonical-lift negative controls. Evidence: BCGP25 lines 9057–9082 prove only the underlying-module comparison; computations below distinguish its pairings.

## RT-AbelianSurfacesModularity~2a/F02 (P3) — applied

Deleted the definitional curve/Jacobian equivalence from the §0.1 Checks; its API assertion remains. A cuspidal-only surface definition would still pass that equivalence but fails the retained elliptic-product Check: two rank-two constituents have support length 2, versus 1 for a cuspidal rank-four witness. BCGP25 lines 750–764 distinguish those notions.

## RT-AbelianSurfacesModularity~2a/F03 (P2) — applied

Unrestricted positive-rank exterior transfer → transfer on GL_(binom(4,i)) for 0≤i≤4, and Hⁱ=0, L=1 for i>4. Added ranks 1,4,6,4,1,0 in §0.1. BCGP25 line 755 supplies the exterior-power consequence; the pinned exterior-power vanishing theorem and AL.2's n≥1 boundary require this explicit range. No boundary declaration was added to Suggested.lean.

## RT-AbelianSurfacesModularity~2a/F04 (P3) — applied

Unspecified Asai argument → positive-flip tensor induction from ArithmeticGaloisRepresentations §7.1 and the η-twisted cross-term in ∧²Ind V. Updated the exact supplier contract, §8.2 proof and Needs line. Added the C₂ trace witness: −2=0+(−2), whereas the untwisted formula gives +2. BCGP25 lines 9911–9917 specify the restriction only up to quadratic twist.

## RT-AbelianSurfacesModularity~2b/F01 (P2) — applied

Local type construction/classification → SatoTateGroups §8.7 and §§9.7–9.8, with §9.10 discharging their hypotheses in dimension two. Retained §8.3's compatible-system dictionary; updated scope, contracts, §§8.3–8.4 and Needs. The sibling supplies the equivariant pair and 34 rational types; FKRS12 lines 167–194 and 1002–1038 identify those objects.

## RT-AbelianSurfacesModularity~2b/F02 (P2) — applied

Independent smoothness target → genus-two chart specialization of HyperellipticCurves §0.3, with the model from §0.1. The gcd formula, negative controls and finite counts remain. Updated scope, supplier contracts and Needs in §§4.4, 5.1 and 8.1. The characteristic-two singularity equations square to the stated gcd condition, including the infinity chart; no new generic model is constructed.

## RT-AbelianSurfacesModularity~2b/F03 (P3) — applied

Generic Weil facts as local targets → supplied consequences in §4.1. Added CurvesOverFiniteFields §§4.1, 4.3, 4.6, 4.11 and AbelianVarietiesOverFiniteFields §§1.2, 6.1–6.3; retained the coordinate specialization and finite classifications. Corrected the suggested locators: coefficient bounds are §4.3, and geometric point counts require AbelianVarietiesOverFiniteFields §1.2 in addition to the polynomial formula.

## RT-AbelianSurfacesModularity~2b/F04 (P3) — applied

A single attaching-prime comparison → two coefficient primes and isobaric strong multiplicity one in §8.4. The §8.3 dictionary supplies prime independence of the relevant decomposition. Added AL.3 to Needs and a 5/7 coefficient-prime Check. Each omitted factor is computed with the other representation; uniqueness identifies the global witness, rather than supplying an omitted factor on its own.

## RT-AbelianSurfacesModularity~2b/F05 (P3) — applied

Unramified order-five representation called ordinary → finite flat with an étale model, without an ordinary filtration. Updated §8.7 and the corresponding §8.8 Check. Powers of 2 modulo 5 are 2,4,3,1, giving irreducible degree four and no rank-two quotient. BCGP25 lines 10319–10322 contain the erroneous adjective and the separate étale/multiplicative-model obstruction, respectively.

## Checks and declaration audit

- Elaborated `packages/AbelianSurfacesModularity/Suggested.lean` using the prescribed `lake env lean` command from the content checkout: exit 0, no output. No Tau Ceti object build was needed.
- Suggested.lean has 0 declarations, 0 definitions, 0 instances and 0 section variables. The requested `#check @name` comparison has an empty domain: there are no elaborated signatures to compare and no binder changes. Its single Mathlib import and missing-carrier inventory remain accurate; no theorem substitute or Check was added.
- The content checkout is c9940702. Its manifest and actual checkouts agree: Mathlib f6090c7095e1e56b3464c1daba5f24631f1290d2; Tau Ceti 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a. These are the pins inspected, rather than the older hashes in the reviews.
- The prescribed dependency check exited 0 with exactly:

    depcheck: 199 roadmaps, 1392 edges, 0 problem(s)

There was no UPWARD, CYCLE or moved line. No merge-order edit was made.

- `roadmaps resolve` exited 0: no cross-roadmap citation or Lean name found nowhere. Its service could not inspect local pinned packages; the local pin inspection below supplies that separate check.
- `git diff --check` passed. The 16 existing top-level gaps and their README contracts remain unchanged and agree. No additional gap is needed: the finite-field polarized trichotomy actually appears in the supplied AbelianVarietiesOverFiniteFields §10.3.
- The module-system warning was repaired by adding `module` before the single `import Mathlib` in Suggested.lean. The prescribed elaboration was rerun: exit 0, no output and no warning. The dependency check was rerun: exit 0 with exactly the output above, and no UPWARD, CYCLE or moved line. Mathematical statements and the empty declaration audit are unchanged. The final changes are confined to the README, Suggested.lean and this report. No commit, publication or external message was made.

## Polarized calculation and proof boundary

The isogeny descent at BCGP25 lines 9063–9082 produces an isomorphism of Galois modules. It supplies no compatibility with a prescribed Weil pairing. The same distinction applies to the φ±1 descent at BCGP25 lines 9226–9237; there nonsemisimplicity alone excludes 2D, so the unpolarized conclusion survives.

For the new principal clause, the supplied trichotomy retains the actual polarization. The irreducible polynomial X⁴−X²+4 excludes a split product. Its Jacobian equation locus has 16 elements, with canonical-polarization class 6H. The remaining case is a quadratic Weil restriction of an elliptic curve over 𝔽₄ with polynomial X²−X+4. Its point counts are 4 and 24 over 𝔽₄ and 𝔽₁₆. Scalar −I on its 3-torsion would make all 9 torsion points rational over 𝔽₁₆, contradicting 9∤24.

Thus M=((0,2),(1,1)) represents the elliptic action modulo 3. For F=((0,M),(I₂,0)) and B=diag(J₂,2J₂), direct multiplication gives FᵀBF=2B, rank(F²+I)=2 and (F²+I)²=0. On the primitive exterior square, q=z₁₂z₃₄−z₁₃z₂₄+z₁₄z₂₃ has 45 q-value-1 lines and 27 orthogonal five-line frames. The frame stabilizer has order 2⁴·5!=1920; the action realizes the 27 cosets of §1.1. The permutation 2∧²F has cycles 3,6,6,3,3,3,3: type 3⁵·6², hence class 6H. This is an explicit pairing computation, not an inference from a GL₄ conjugacy class.

The cyclic matrix in the new §4.5 Check admits 8 compatible nonsingular alternating forms. Its invertible centralizer has 72 elements and acts, allowing scalar similitudes, in two orbits of size 4. For the form with rows (0,0,1,0), (0,0,0,2), (2,0,0,0), (0,1,0,0), the 27-frame action has 0 fixed points. Multiplication by U=I+F−F⁻¹ gives the form with rows (0,1,1,0), (2,0,2,2), (2,1,0,1), (0,1,2,0), with 3 fixed points and type 1³·2³·3⁴·6. Multiplication by U exchanges the two orbits for every compatible form. The diagonal matrix (1,−1,1,−1) anticommutes with F and preserves the first form, so allowing F↦−F does not identify the two orbits.

Geometrically (π+V)²=5 and u=4+π+V has positive values 4−√5 and 4+√5 (approximately 1.764 and 6.236). Its degree is (16−5)²=121. Rosati positivity makes λu an actual polarization and its reduction is the displayed U. It changes 6H to 6G. In the ordinary canonical lift, the three characteristic-two branch points 0,1,∞ give trivial étale 2-torsion, and the split ordinary lift gives trivial generic 2-torsion. Its toric rank is 0, so it disproves the unpolarized version of §4.6 even with its bad-or-ordinary disjunction. The new degree-one hypothesis excludes it. The class table of §4.10 is already a table for principally polarized objects and needs no changed entries; §4.9 explicitly retains the canonical Jacobian polarization.

## Adversarial mathematics ledger

Rows cover all 46 numbered statements, their defining data, API assertions and Checks; split rows record the changed substatements individually. Finite arithmetic, matrix, equation and frame counts were recomputed in scratch. Values for deep cohomology/classification/automorphy inputs below are source-based hypothesis tests, not claims of independently proving those theorems by enumeration. The tested domains are prime p, finite fields of sizes 2,3,4,9 and dimension-two surfaces. Rank zero, q=1, the zero ring and inseparable characteristic-zero extensions fail those domains. Nonreduced coefficients are tested where the deformation contracts actually admit them.

| Statement | Instances and computed values on the compared sides | Result; change |
| --- | --- | --- |
| Conventions: Frobenius and Euler denominator | Trace 1 at 3 gives Q=X²−X+3 and T²Q(1/T)=1−T+3T²; inverse Frobenius has determinant 1/3 instead of 3. | Direction retained. |
| Conventions: pairing, twists and completion | J(e₁,e₄)=J(e₂,e₃)=1, J(e₁,e₂)=0; integral alternating block squared is −I. Dual weights 0,0,−1,−1 become 3,3,2,2 under ε⁻³; 2−0=2 and 2−1=1. | Sign and centre retained. |
| §0.1 modularity and isogeny invariance | Two trace-one factors give (1−T+3T²)²=1−2T+7T²−6T³+9T⁴. Support ranks 2+2=4, length 2 versus cuspidal length 1. The curve/Jacobian equivalence would have value true under either definition. | Deleted the nondiscriminating Check; retained product and support tests. |
| §0.1 exterior transfer | binom(4,i) at i=0,…,5 is 1,4,6,4,1,0; ∧⁰ has eigenvalue 1 and denominator 1−T, ∧⁵ has denominator 1. | Bounded the positive-rank statement. |
| §0.2 distinguishedness | Traces −1,2 at 3 give Q=X⁴−X³+4X²−3X+9, four distinct characteristic-zero roots but reduction X²(X+1)². For E×E, Q=Q_E²; for Y×Y′ unit roots are α,−α. | Both directions use good ordinarity; residual test is strictly stronger. |
| §0.3 transfer and analytic normalization | (1−4)/2=−3/2, (1−2)/2=−1/2; motivic centre 1 versus unitary centre 1/2. Elliptic-product rank decomposition is 2+2, failing irreducibility. | Retained all-place supplier premise. |
| §1.1 class partition | Class-size sum 36+540+540+1620+1440+1440+4320+6480+5184+4320=25920. Common 40-point cycles total 4·10=40 or 2·2+6·6=40; 27-point fixed counts are 1/5 and 3/0. | Polynomial equality remains weaker than symplectic class equality. |
| §1.2 projective unramified class | ε⁻¹(Frob₂)=−1 mod 3, whereas ν(±I)=1. (X²+X+2)²=X⁴+2X³+2X²+X+1; X↦−X reverses both odd coefficients. | The two-way squared-quadratic criterion retained. |
| §1.3 regular elements | ord₅(3)=4 and gcd(Φ₅,Φ₅′)=1 mod 3. A 4C lift has two roots of multiplicity 2 despite order 8. | Order alone is not used as regularity. |
| §1.4 fifteen images | 103680/51840=2; 103680/1620=64; symplectic subgroup order 32. Rejected counts 4+3+3=10, leaving 25−10=15. | Embedded subgroup and cyclotomic distinctions retained. |
| §1.5 inadequacy | End dimension 4²=16=10+6; in 𝔽₃[ε]/ε², ε≠0 but ε²=0, and ε maps to 0 in the constant quotient. | Nonreduced first-order obstruction retained. |
| §2.1 basis and permutation action | All 720 permutations preserve J in the even-subset quotient. The stated generator orders are 2,2,5; involution ranks are 2 and 1. Transposition/double/triple centralizer orders are 48,16,48. | Matrix and outer-S₅ distinctions retained. |
| §2.2 marked Weierstrass criterion | Trivial action fixes 6 letters and 2⁴−1=15 nonzero torsion points; full S₅(b) fixes 1, full S₅(a) fixes 0. Quintic has 5+1=6 branch points. | Both fixed-point/containment directions pass. |
| §2.3 strong oddness | Identity, transposition, double and triple transposition give ranks 0,1,2,2 and diagonals 0000,1000,1100,0000 for gJ. | Odd flags false,true,true,false. |
| §2.4 A₅ modules | Dimensions 1,2,2,4; 2-part of 60 is 4. Three-cycle traces: 2+ω+ω⁻¹=1 versus 2ω+2ω⁻¹=−2. Four nontrivial fifth roots sum to −1. | The two four-dimensional models are distinguished. |
| §2.5 near adequacy | dim End=16, dim socle=1+4=5; source cohomology dimensions for k,ad,ad/k are 0,0,1. For the trivial group on k², span dimension 1<4 although H¹=0. Hom(C₂,k⁺) has dimension 1 and Hom(C₂,kˣ)=0. | Quotient obstruction and coefficient convention retained. |
| §2.6 CM restriction | Index ≤2 would give image order 60 or 30; perfect A₅ has no order-2 quotient. Nonidentity A₅ involutions have diagonal 1100; identity has 0000. | Nontrivial conjugation remains necessary. |
| §3.1 residual seed | Sign-kernel orders 120/2=60 and 60. Sym³ of weights 0,1 gives 0,1,2,3, versus surface weights 0,0,1,1. Cubing order-five scalar keeps order 5; cubing order-three scalar gives 1. | Scalar removal and residual-only comparison retained. |
| §3.2 dyadic modularity | Double transposition has sign +1 and order 2; transposition has sign −1. Type-(1,2) polarization has degree 4 and degenerate mod-2 pairing. | Explicit symplectic framing retained. |
| §4.1 quartic specialization | X⁴−X²+4 has b=−1 odd and squared roots (1±√−15)/2 of absolute value 2. (X²+2)² has b=4 even. Q(2)=16=4Q(1); at x=0 total rational-expression evaluation gives 0 versus 16. | Generic facts imported; the x≠0 qualification retained. |
| §4.2 finite quartic list | Real-quadratic-root test gives 16 ordinary quartics at p=2 and 40 at p=3. Dyadic row sizes 3+1+4+2+2+4=16. Middle coefficients −3 and 3 both reduce to 0 mod 3. | Complete local lists retained. |
| §4.3 Jacobian seeds | (N₁,N₂)=(5,7),(3,7),(3,3) give (a,b)=(2,3),(0,1),(0,−1) and Q(1)=14,6,4. | Distinct quartics and source paired classes retained. |
| §4.4 smoothness specialization | At characteristic 2, h=1,f=x⁵ has affine gcd 1 and infinity value 1; f=x⁶ has affine gcd 1 but infinity value 0. h=f=0 gives gcd 0. At characteristic 3, f=x⁵−x has degree 5 and gcd 1; f=x⁴−1 has degree 4 and a double infinity root. | Imported criterion excludes singular and nonreduced controls. |
| §4.4 equation/class fibres | 2048 equations give 768 smooth, 384 ordinary and 384 nonordinary. Ordinary (a,b) fibres: (0,−1):16, (0,1):48, (±3,5):16 each, (±1,1):48 each, (±2,3),(±1,3):48 each. Class counts 32+16+48+96+192=384. | Counts unchanged, including all 16 Q=X⁴−X²+4 Jacobian equations. |
| §4.5(a)–(c) parity and rigidity | For a=±1,b=1, Q(1)=9 or 3, both odd; a=±3,b=5 gives 19 or 1. For X⁴+X³−X²+2X+4, Q(1)=7. Squared ordinary elliptic quartics have repeated unit roots. | S₅(b) and distinguished exclusions retained with the chosen principal pairing. |
| §4.5(d) unpolarized clause | For the cyclic F, N=F²+I has rank 2, N²=0. Compatible forms count 8, centralizer size 72, orbit sizes 4+4. | Module comparison no longer identifies symplectic classes. |
| §4.5(d) principal clause | Res E has #E(𝔽₁₆)=4·6=24, 9∤24; FᵀBF=2B. Its 27-frame cycles are 3⁵·6², with 0 fixed points. | Separate polarized proof yields 6H. |
| §4.5(d) polarization boundary | (π+V)²=5, positive values 4±√5, degree 121; multiplying the form by U changes fixed-frame counts 0→3. | Added actual 6G polarization with unchanged module. |
| §4.5(e) class 2D | Q=X⁴+X²+4 reduces to (X²−1)²; reference minimal polynomial is also (X²−1)², versus semisimple minimal polynomial X²−1. | Unpolarized nonsemisimplicity suffices. |
| §4.6 toric conclusion | X²+1 takes values 1,2,2 at 0,1,2 mod 3. t+a=2 and t>0, t≠1 give t=2,a=0. Good nonordinary Y has b=2, Q(1)=7,t=0; canonical lift with λu is ordinary with t=0 and degree 121. | Added principal polarization; both counterexamples are excluded for explicit different reasons. |
| §4.7 product seeds | (X²−1)(X²+X+2)=X⁴+X³+X²+2X+1 mod 3. (X²+X+2)(X²−X+2)=X⁴+3X²+4 over ℤ. Split/twisted Tate pair gives (X²−1)² with square I. q=64 has v₂=6 and is a square and cube. | Classes 8A,4D,2D retained. |
| §4.7 coupled toric seed | q=8000=20³=5·40², v₂=6; u²−u−1=0 gives N(u)=−1 and t=u³, t²=8u+5. Valuation form is 6I₂. For K there are 6 odd refinements and 2 fixed, versus 6 and 0 for the uncoupled product form. diag(−R,R)²=−I. | Coupled-period marking and class 2C retained. |
| §4.8 marked/unmarked moduli | 720/120=6 for P→B; trivial subgroup cover has degree 120 and full subgroup cover degree 1. Product dimension 1+1=2 versus dim B=3. Three canonical differential products have rank 3. Quadratic restriction has 2 geometric theta components. | Marked rationality, dense Torelli and unmarked distinction retained. |
| §4.9 bad 6G seed | Conductor exponent 2>0 versus reference Y exponent 0; toric ranks 2 versus 0, and unit values i,−i are distinct. | Canonical principal polarization made explicit for §4.6. |
| §4.10 realization iff | Good classes number 4: 4D,6H,6I,10A; semistable classes number 8: all except 4C,12C. Good nonordinary 6G has t=0 and bad ordinary 6G has t=2. | Both directions remain on principally polarized moduli; entries unchanged. |
| §5.1 triadic classification | 3⁷=2187 polynomials, 1296 smooth, 864 ordinary. Square-Q multiplicities 1+4+4+1=10; 864−10=854 distinguished. Scalar-+1 row sum 4+24+1+8+48+8+48=141, only 5 square-Q equations. | Supplied smoothness criterion; finite classification retained. |
| §5.2 scalar products | Traces −1,2 give Q(1)=10; traces 1,−2 give Q(1)=18. Only the latter can contain 9 rational points of order dividing 3. Both characteristic-zero quartics are nonsquares. | Scalar signs retained. |
| §5.3 all ordinary seeds | Six monic unit-constant quadratics give 8 GL₂(𝔽₃) classes. Scalar I has fixed dimension 2, Jordan block fixed dimension 1. Four rows reduce to X²q with q=X²+1,X²−1,X²+2X+2,(X−1)². | Scalar/Jordan and twists retained. |
| §6.1 local equivalence | Forbidden classes count 2, admissible count 8; 2D has 0 good seeds but 1 semistable construction. Product 4D has 2 theta components and is outside smooth Torelli. | Both directions use the polarized local table. |
| §6.2 switch | Real quintic x(x²+1)(x²+2) has 1 real finite root plus infinity and 2 nonreal pairs: [1,1,2,2], sign +1. Auxiliary group orders are 120 and 60; an anti-symplectic real involution has 2+2 eigenvalues. | Marked local and real conditions retained. |
| §6.3 infinitude | At most 6 marked Weierstrass choices and at most 103680 level framings give at most 622080 presentations per fixed curve at this level. Scalar local seeds still have counts 10 and 18. | Finite fibres cannot absorb infinitely many moduli points. |
| §7.1 transfer | Both weight multisets 0,0,1,1 have rank 4; normalization exponent −3/2. The nodal ring xy=0 has 2 components through its node, versus the required unique pure ordinary component of dimension 16. Trivial image has no regular rank-four element. | Component, image and supplier gates retained. |
| §7.2 fifteen-image endpoint | 15 admitted versus 10 rejected images; full group order 103680. Elliptic product has 2 nontrivial projection idempotents and End≠ℤ; Q_E² has repeated roots. | Neither product nor nondistinguished control satisfies the hypotheses. |
| §7.3 Theorem A | Forbidden lift polynomial coefficients mod 3 are 1,2,2,1,1; sign twist changes positions 3 and 1. Full residual index is 1, symplectic kernel index 2. | Surjectivity and ordinary nonsquare hypotheses retained. |
| §7.4 good curves | Dyadic ordinary Jacobian class set has size 5 and intersection of size 0 with {4C,12C}; 10 ordinary triadic equations have square Q. | Separate distinguished hypothesis retained. |
| §7.5 quintics | 5 finite branch points plus infinity give 6; a repeated finite root gives discriminant 0. All 10 ordinary nondistinguished triadic equations have 0 rational branch points. | Marked smooth reduction yields automatic distinguishedness. |
| §7.6 bad dyadic endpoint | Integral rank-two Frobenius orders 1,2,3,4,6, with order-two twist still no order 8; X²±X+2 roots in 𝔽₉ have order 8. Positive dyadic conductor is 2 versus good-reduction exponent 0. | Residual unramifiedness does not replace good reduction. |
| §8.1 density | (768−144)/2048=39/128, (864−10)/2187=854/2187; product 5551/46656. Conditional smooth proportion is 624/768=13/16. H^(10.5)log H/H¹¹=log H/√H→0. | Smoothness ownership updated; exact density unchanged. |
| §8.2 decomposition and finite twists | ab=4 gives (4,1),(2,2),(1,4). Finite Artin weights are 0,0,0,0; a scalar twist gives one value repeated 4 times. Reducible 1²⊕ε⁻¹² has 2 character orbits, failing the required single orbit. | Irreducibility and non-finite-up-to-twist boundaries retained. |
| §8.2 Asai summand | Trivial rank two on C₂ gives ∧²Ind V=1²⊕η⁴, trace 2−4=−2. Ind det trace 0; flip trace 2 and η-twist trace −2. Dimensions 6=2+4. | Inserted the required η. |
| §8.2 quartic-character branch | Totally real case: 2a_τ=wt at all 4 embeddings, hence parallel exponents. Quartic CM test gives conjugate sums 0+1=1 twice. A norm-pullback character gives induction ψ₀⊕ψ₀η of rank 1+1=2 instead of irreducible rank 2. | Algebraicity and cuspidality hypotheses retained. |
| §8.3 type dictionary | For nonisogenous elliptic product, End⁰=ℚ×ℚ and fixed dimension 2. Swapping the factors by C₂ gives diagonal fixed dimension 1. In both cases H¹ over the endomorphism field splits 2+2. | Type construction/classification imported; 2≤3 discharges the supplier's §9.10 dimension bound; compatible-system comparison remains. |
| §8.4 type modularity | 34−2=32; rank-two Hodge numbers 1,1 give weights 0,1, newform weight 2 and det(c)=−1. With coefficient primes 5,7, the omitted singleton sets {5},{7} have empty intersection; q=2,3 are covered twice. | Added all-place comparison through the second coefficient prime. |
| §8.5 fixed-mod-2 family | Split branch algebra with θ=(0,1,2,3,4,5) has 15 nonzero pair differences; θ=0 gives T⁶ and is excluded. Multiplying by c≠0 changes no branch point; c=0 destroys the cover. | Primitive open and twist parameter retained. |
| §8.6 trivial triadic obstruction | #ℙ¹(𝔽₃)=4<6; Hasse integer interval is [1,7], whose only positive multiple of 4 is 4, giving elliptic trace 0. | Nonidentity Frobenius hypothesis retained. |
| §8.7 triadic seeds | Nine branch partitions recomputed exactly as the table; (N₁,N₂) are (4,6),(5,13),(6,10),(6,10),(5,13),(5,7),(6,14),(4,12),(6,16). Corresponding (a,b): (0,−2),(1,2),(2,2),(2,2),(1,2),(1,−1),(2,4),(0,1),(2,5). | Good ordinary nonsquare seeds retained. |
| §8.7 dyadic and integral seeds | Three generalized smooth models give (N₁,N₂)=(3,3),(5,7),(6,6), hence (a,b)=(0,−1),(2,3),(3,5). Q(1)=4,14,19. Split W has order 4·4=16 and symmetric self-duality λ∨=λ=−λ since 2W=0. | Prescribed integral W remains additional data. |
| §8.7 order-five boundary | 2¹,2²,2³,2⁴ mod 5 are 2,4,3,1, so minimal polynomial has degree 4 and no rank-two quotient. Étale-model rank is 16, multiplicative-model rank 16, versus ordinary quotient rank 4 and kernel rank 4. | Erroneous ordinary adjective deleted. |
| §8.8 residual modularity | S₆ and A₆ orders 720 and 360; spherical at 2 and 3 means level prime to 2·3=6. Order-five control has stable-quotient dimensions 0 or 4 instead of the required 2. | Same corrected boundary propagated. |

## Ownership, citations and source status

Read the main AlgebraicCurves and EllipticCurves roadmaps for form, and used object searches on main, board packages and the indexed open-roadmap heads. The relevant supplied sibling files were read directly: SatoTateGroups §§8.7, 9.7–9.8, 9.10; HyperellipticCurves §§0.1, 0.3, 0.6; CurvesOverFiniteFields §§4.1–4.3, 4.6, 4.11; AbelianVarietiesOverFiniteFields §§1.2, 6.1–6.3, 10.3. These imports leave this package ownership of the endpoint two-prime switch, its finite local classifications, paired matrix computations and compatible-system type assembly. They do not extend or re-plan those suppliers. No fully qualified Lean declaration name was introduced.

The other supplier contracts were re-resolved against main or the indexed new-roadmap heads using `roadmaps show` and `roadmaps resolve`. The principal boundaries retained are: AbelianSchemesAndArithmeticModuli A3.7–A3.9 and A6.14 for actual pairings and positivity; A4.13 for the specified skew-self-dual integral model; A6.32–A6.34 for polarized restriction and twisting; PartII F3.2 for ordinary isogeny classes and B4.1 for the characteristic-zero fine curve family; ArithmeticGaloisRepresentations §§5.12, 7.1, 7.6, 7.9, 7.11 for irreducible Clifford theory, positive-flip tensor induction and the distinct image predicates; NeronModelsAndSemistableAbelianVarieties §§3.11–3.14, 5.0a–5.6, 6.10–6.13 for filtrations and local comparisons; LocalGaloisDeformationRings §§2.2, 6.27, 6.29, 6.31–6.35 for the stated prime ranges and component hypotheses. No unramified-functor theorem is promoted to rigidity of all lifts.

The automorphic locators resolve to the stated scopes: EndoscopicTransferAndUnitaryTraceComparison §§8.3, 11.1, 13.3; ModularityAndLanglandsExtensions §§1.9, 1.11, 1.13, 3.26 and its all-place induction target; AutomorphicLFunctionsAndLocalFactors AL.2–AL.4; ClassicalSerreModularity R27.6 Theorem 10.1(i), which is regular; GL2AutomorphicRepresentationsAndTransfer R17.5.1, R17.5.4–R17.5.7, R17.5.11; AutomorphicGaloisRepresentations §§3.7, 3.11, 3.13; PartII AG2.P, AG2.0, AG2.2, AG2.5. The last algebraic-character target compares away from its coefficient prime, explaining the new two-prime argument. The remaining geometric locators are ShimuraCompactifications C4.4–C4.6, ShimuraVarieties §§1.2, 5.0, AlgebraicModuliForArithmeticGeometry §§3.5, 5.2, RelativeJacobiansAndIntegralCurveModels §§0.1–0.3, 2.2, 2.4, AlgebraicCurves Layers 5,10,11, PolynomialGaloisGroups Layers 0,4, EllipticCurves Layers 3,4, InverseGaloisAndArithmeticFundamentalGroups IG.2.4–IG.2.7 and the elliptic/GL₂-type modularity sections. The two design suppliers remain the board's PotentialAutomorphyInfrastructurePartII PL.0/PL.4 and GSp4NonregularModularityLifting NR2.5–NR2.6/NR10/NR11.2–NR11.6, with their explicit proof gates and gaps; they are not claimed as implemented library results.

At the actual library pins, inspected the 18 named contracts in the README, including native `Representation` (no continuity or finite-dimensionality bundled), the alternating-group cardinality theorem (nontrivial finite carrier), its simplicity theorem (at least five letters), `Matrix.symplecticGroup` (AJAᵀ=J), roots (domain coefficients and multiplicities), and the nonzero fixed-vector theorem (finite group and nontrivial module). TauCeti's abelian-variety structure at `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` bundles the group scheme, properness and geometric integrality; dimension is defined at line 118, but polarization and ordinary/automorphic realizations are absent there. The Hecke algebraicity and purity declarations at their README locators do not supply maximal-CM-subfield factorization. The additional vanishing witness is `exteriorPower.subsingleton_of_span_eq_top_of_card_lt` at `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean:418`. Native tensor induction exists at `TauCeti/RepresentationTheory/Tensor/Induction.lean:208`; the continuous arithmetic construction is consumed from ArithmeticGaloisRepresentations §7.1. No pinned headline carrier was replaced by an invented predicate.

All newly used literature is already under the existing manifest keys. BCGP25 lines 750–769, 8703–8781, 8939–9100, 9226–9237, 9785–9958 and 10313–10325 were compared with the affected claims. FKRS12's type definition and classification, BCGP21's marked Torelli description, ZARHIN00's very-simple-module hypothesis and WHITMORE22's reasonableness conditions were also inspected at their recorded cache locators. KIS99, THORNE17 and FC90 remain settled as uncertified and are cited only by their recorded locators; none was requested again. No new source request or manifest key was necessary.

## Maintainer notes

All nine findings are applied separately; the common finite-field supplier needed by the polarization repair and the ownership repair is imported once. No finding requires a human scope or merge-order decision, and no supplier target was invented. No Lean names changed. Consumers of §4.6 must retain a specified principal polarization; this package's Jacobian consumer now states it explicitly. The good/semistable realization table and modularity endpoints retain their entries and conditional supplier premises. A fresh independent review remains required; these computations are the repair record, not acceptance.
