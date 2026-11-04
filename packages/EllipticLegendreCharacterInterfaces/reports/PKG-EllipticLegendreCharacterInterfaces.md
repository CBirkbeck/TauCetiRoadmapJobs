# Package report: EllipticLegendreCharacterInterfaces

The deliverables are packages/EllipticLegendreCharacterInterfaces/README.md, Suggested.lean, metadata.toml and sources.toml. The README contains all 37 accepted targets, all 33 original API items, all 27 original definition Checks, the promoted evaluation, unit-reading, doubling, order and descent conclusions, and every acceptance example. Additional negative controls distinguish the conventions. The only edit to design/plan.json is its top-level gaps value: two exact, actionable supplier gaps replace the design-era operational and ownership notes.

The separate design/review.json named in the brief does not exist in this checkout. The accepted review is embedded in design/plan.json under review, with per-node verdicts. Its notes were applied: use the native affine conversion, explicit unit-quotient membership for squares, the direct three-branch product argument, a real native point type for each witness and invertible 2 for completing the square over rings. There were no other input reports in reports/. The original gaps contained the instruction-like sentence “Do not build libraries or download caches.” This suspicious operational text was treated as untrusted historical data, not as authority overriding the brief; the actual reason no targeted build was needed is that the imported object is present.

## Headline inventory, chosen before the Lean file

The initial list was saved before writing Suggested.lean. The minus-one explicit half is included as a separate deep input to the two-primary theorem. There are twelve stated headline signatures and one unstatable conductor headline. The two auxiliary definitions are legendre and scaledLegendre, with actual five-coefficient bodies over arbitrary commutative rings; there are no data admissions, auxiliary instances, artificial predicates or admitted examples.

| Headline | Outcome |
| --- | --- |
| Full rational two-torsion normalization by an admissible change | Stated: `exists_scaledLegendre_of_full_two_torsion` |
| Good odd reduction forces both parameter factors to be units | Stated: `legendre_units_of_good_reduction` |
| Unit parameters give a minimal good Legendre equation over ℚ_p | Stated: `legendre_good_reduction_of_units` |
| The associated primitive character has odd support only at bad primes | Stated: `legendre_character_odd_support` |
| Odd primitive character conductor divides the actual elliptic conductor | Not statable at the pins: the native elliptic conductor of a rational curve, with its reduction comparison, is absent; its owner is NeronModelsAndSemistableAbelianVarieties §§5.3a, 5.3g. Nothing weaker replaces this signature. |
| Halving iff the three root differences are field squares, including root points | Stated: `scaledLegendre_halving_iff_squares` |
| A two-by-four subgroup for square parameters at p≡3 mod4 | Stated: `legendre_two_by_four_subgroup` |
| Explicit minus-one half, its double and exact order four | Stated: `minus_one_half_order_four` |
| No order-eight point at p≡5 mod8 | Stated: `legendre_minus_one_no_order_eight` |
| Exact two-adic valuation three of the minus-one point count | Stated: `legendre_minus_one_point_count_v_two` |
| Corrected conic witness, its native double and exact order four | Stated: `twist_halving_point_order_four` |
| Symmetric cubic point count p+1 and trace zero | Stated: `scaledLegendre_minus_one_trace_zero` |
| Quadratic-character twist trace, hence the good Euler polynomial | Stated: `scaledLegendre_frobeniusTrace` |

The character-support statement is statable without inventing a rational-character carrier: it quantifies over a native primitive DirichletCharacter ℤ N, N≠0, tied to ωλ by its exact prime-value characterization. The supplier constructs and identifies that character. The hypothesis neither contains the support conclusion nor permits an unrelated character. Its prime-value condition allows the trivial squareclass and conductor 1. No CRT construction or split-coordinate API lemma is padded into Suggested.lean; the halving theorem is the end theorem those interfaces support.

## Corrections and unsupported interfaces

- The input baseline records Mathlib 082e2d37 and Tau Ceti f790474. The supplied lake-manifest.json instead pins Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. All declarations and elaboration use these supplied pins. The immutable baseline in the accepted plan is untouched.
- The published Lemma 6.6 witness remains corrected to y=8itv(t+iv), on the actual twist-by-two curve. At p=5,t=v=2,i=3 the printed y gives (4,4), with y²=1 and cubic value 4. The corrected (4,3) has y²=4, doubles to (1,0) and has order 4. This reproduces the accepted source correction, attributed in the design to PAPER-BENNETT-SIKSEK-20/E14; it is a local identity check, not a claim that this tuple satisfies the lemma's progression hypotheses.
- The native point transport at the supplied pin is `Point.addEquivVariableChange`; `Point.equivVariableChange` is only the underlying bijection. The README's transport contract uses the additive declaration. The quadratic-twist source is QuadraticTwist/Basic.lean, not the design-era QuadraticTwist.lean path. The root-point lemma is in NormalForms.lean.
- ArithmeticGaloisRepresentations R01.3 is not the owner of the actual elliptic conductor comparison at the readable head. That roadmap's ownership table assigns it to NeronModelsAndSemistableAbelianVarieties §§5.3a–5.3i. The exact statements needed here are explicitly in §§5.3a and 5.3g, so no conductor supplier gap is needed.
- ClassicalArithmeticCompletion on main has §§1.7–1.8, not the old CA.1/quadratic-character-of-a-squareclass node. Its §1.7 starts from a fundamental discriminant. The rational-squareclass construction and conductor parity specialization are therefore an exact supplier gap, rather than a claim that the old node exists.
- RankZeroOneBSD is absent from main and the open-head index; roadmaps show returned: `no roadmap RankZeroOneBSD on main or in an open roadmap pull request`. It cannot be a supplier. Layer 5 retains the accepted equation-specific trace theorem and proves it directly by the finite quadratic-character sum. No generic rational Euler-factor or L-function target is added. The later merge-order name RankZeroOneBSDPartII is not used as a dependency.
- The good-parameter and character-support signatures omit semistability: the invariant proof establishes them for every rational scaled-Legendre presentation. For λ=3,p=3, j=21952/9 has valuation −2; at λ=−1,p=3, j=1728 has valuation 3. These calculations distinguish j-integrality from unit j. The source's semistable-away-from-2 conductor application is retained explicitly.
- Checked consumer citations refer to ErdosProgressionPowers Layer 2, rather than the design's EP.4, and to EllipticCurveModularityPartII §5.1, rather than §5.2, for its rational two-torsion predicates. ArithmeticDynamics' Legendre/Lattès and torsion bounds are §§6.35, 6.111–6.112 at its readable head.
- In the draft's added examples, (5,1) on L_4/𝔽₇ failed membership: y²=1 but the cubic value is 6. It was replaced by P=(3,1), with cubic value 1 and double (1,0). The proposed p=17 order-eight negative control was also rejected: its count is 16 but all orders divide 4. The replacement p=41 point (6,13) has order 8 and the full count is 32. These were example corrections, not changes to the accepted theorems.
- The README's within-layer exposition is topologically ordered: twist identification before normalization; CRT evaluation before unit reading and descent; minus-one doubling, order and first class before no-order-eight and exact count. Every accepted node remains.

What the README cannot claim as supplied is stated in the two supplier contracts and the two gaps: rational local/unit transport from EllipticCurves Layer 4, and the rational-squareclass specialization from ClassicalArithmeticCompletion §§1.7–1.8. No missing source prevents any target statement. The absent elliptic-conductor carrier affects only the ability to state that headline in Lean.

## Ownership sweep and removals

The sweep used roadmaps grep over main and all indexed open heads, with object searches for split cubics, Legendre equations, ordered roots, full two-torsion, halving, unit squareclasses, descent kernels, conductor support, quadratic twists and trace comparison. Suggested.lean was searched separately. Board packages were also searched by these objects. The readable supplier and consumer heads were opened individually; an update of an existing roadmap was compared with main for the consumed claim. No ownership assertion relies on an unread issue or a newer library pin. The index is the brief's 351-head index; no additional open work was sought outside it.

The following generic objects were excluded from this package's own declarations and target inventory. They appear only as exact imports; no accepted equation-specific node was deleted, because its ordered coefficient or coordinate specialization differs from the general supplied theorem.

| Excluded construction or theorem | Exact owner consumed |
| --- | --- |
| A new Weierstrass carrier, point group, invariant package or admissible coordinate-change structure | Mathlib elliptic-curve modules, as listed below |
| A new cubic étale algebra or general x−T descent homomorphism | Tau Ceti XSubT: Affine.A, Affine.M, Affine.μ |
| A second descent kernel or general norm-one theorem | XSubT: Affine.ker_μ_eq, Affine.normM_μ₀_eq_one |
| Generic two-torsion root counting or generic point transport | TwoTorsion: Affine.card_ker_nsmul_two; Point/VariableChange: Point.addEquivVariableChange |
| A new quotient-group or polynomial CRT theory | Mathlib QuotientGroup.map, QuotientGroup.eq_one_iff, Ideal.quotientMulEquivQuotientProd, Polynomial.quotientSpanXSubCAlgEquiv |
| General quadratic twisting and its invariant powers | Tau Ceti QuadraticTwist/Basic |
| Primitive quadratic character construction and general uniqueness | ClassicalArithmeticCompletion §§1.7–1.8 and its exact rational-squareclass gap |
| A new actual conductor, conductor/Ogg identification or reduction trichotomy | NeronModelsAndSemistableAbelianVarieties §§5.3a, 5.3g; Mathlib Reduction |
| A moduli S₃ action or Legendre invariant ring | ModularCurves §9E |
| A general full-rational-two-torsion predicate | EllipticCurveModularityPartII §5.1; the signature uses the native kernel cardinality directly |
| Lattès maps, heights or uniform common torsion-image theorems | ArithmeticDynamics §§6.35, 6.111–6.112 |
| Progression-dependent parameter cases, nontriviality and character sums | ErdosProgressionPowers Layer 2 |

Notions moved down from later work: ArithmeticDynamics §6.35 repeats the basic field Legendre coefficient equation and invariants as part of its Lattès family; MordellLawrenceVenkatesh §6.4 also proposes the coefficient equation over every commutative ring, as well as its ordinary/cyclic Legendre family, with the universal smooth family imported from ModularCurves Layer 4C. Both roadmaps occur after this one in ORDER.txt. The shared coefficient equation and invariant specialization are moved down to this earlier roadmap over all commutative rings, including boundary and nonreduced models; neither later roadmap is a supplier. Their dynamical, cyclic-cover and Gauss–Manin content stays with them. The family-specific finite-field twist trace is likewise retained here without depending on a later BSD roadmap. This does not move any global BSD theory.

No declaration in Suggested.lean uses another readable roadmap's fully qualified name; all fourteen declarations are under TauCetiRoadmap.EllipticLegendreCharacterInterfaces.

## Pinned declaration audit

The following are direct readings of source at the supplied pins, not claims based on the design's earlier baseline. Paths below are module-source paths.

| Module | Declaration and lines | Native content and boundary |
| --- | --- | --- |
| Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean | WeierstrassCurve 76; c₄ 120; Δ 131; IsElliptic 366; j 388 | Five coefficients only; ellipticity is a separate unit-discriminant class. No smoothness condition is hidden in the model. |
| Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Basic.lean | Equation 149; equation_iff 156 | Evaluated affine equation; no nonsingularity in Equation alone. |
| Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean | Point 477; add_self_of_Y_ne 701; Point.map 823 | Point constructors are zero and some x y h with h a nonsingularity proof; the tangent branch requires y≠negY. |
| Mathlib/AlgebraicGeometry/EllipticCurve/VariableChange.lean | VariableChange 57; variableChange_j 246 | The scale u is a unit; its action preserves j on elliptic models. |
| Mathlib/AlgebraicGeometry/EllipticCurve/NormalForms.lean | toCharNeTwoNF 166; standing invertibility 161 | Ring-level completion of the square requires invertible 2. |
| Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean | IsIntegral 57; IsMinimal 274; minimal 299; HasGoodReduction 323; hasGoodReduction_iff_isElliptic_reduction 328 | Integral coefficients are existence of a ring model. Good reduction extends minimality, then asserts multiplicative Δ-valuation 1. No curve-level invariance is built into the predicate's name. |
| Mathlib/NumberTheory/Padics/PadicVal/Basic.lean | padicValRat 126; mul 223; div 261; add_eq_min 319 | Total valuation at zero is 0; product/division need nonzero operands, and the sum lemma needs nonzero summands and sum with unequal valuations. |
| Mathlib/NumberTheory/LegendreSymbol/Basic.lean | euler_criterion 62; eq_neg_one_iff 190; at_neg_one 274; exists_sq_eq_neg_one_iff 285 | Prime instances are required; Euler's native exponent p/2 equals (p−1)/2 at odd p. |
| Mathlib/NumberTheory/LegendreSymbol/QuadraticReciprocity.lean | legendreSym.at_two 60 | The χ₈ supplementary law requires p≠2. |
| Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean | quadraticChar 119; quadraticChar_card_sqrts 213 | Integer-valued multiplicative character extended by zero; root counting assumes characteristic≠2. |
| Mathlib/RingTheory/Ideal/Quotient/Operations.lean | quotientMulEquivQuotientProd 325 | Quotient by the product of coprime ideals is the product of quotients. |
| Mathlib/RingTheory/Polynomial/Quotient.lean | quotientSpanXSubCAlgEquiv 29 | Linear quotient is evaluation at the specified scalar. |
| Mathlib/GroupTheory/QuotientGroup/Defs.lean | map 309; eq_one_iff 120 | Quotient map needs subgroup containment; trivial quotient class is subgroup membership. |
| Mathlib/GroupTheory/FiniteAbelian/Basic.lean | equiv_directSum_zmod_of_finite 134 | Finite abelian group structure, not arbitrary finite groups. |
| TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/XSubT.lean | f 164; separable_f 255; A 276; equivProdA' 283; equivProdA'_apply 297 | Native body `A := AdjoinRoot W.f`; it does not itself assume ellipticity. Separability and the one-root CRT carry their hypotheses. |
| Same XSubT module | M 505; μX 548; root formula 558; nonroot formula 566 | Native M is the quotient of Aˣ by the range of squaring, without a norm-one condition in its definition. μX chooses x−θ plus the cofactor at a root. |
| Same XSubT module | μ₀ 584; μ₀_zero 590; μ₀_some 595; μ 794; μ_apply 803; ker_μ_eq 961; normM_μ₀_eq_one 1023 | Native homomorphism on Multiplicative Point; its kernel is the doubling image. The norm theorem alone does not name three split coordinates. |
| TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/TwoTorsion.lean | card_ker_nsmul_two 57 | Native doubling-kernel cardinality equals root cardinality plus one, with normal-form, ellipticity and decidable-equality hypotheses. |
| TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/VariableChange.lean | equivVariableChange 132; addEquivVariableChange 177 | First declaration is a bijection; second is the additive equivalence with source (C•W).Point and target W.Point. |
| TauCeti/AlgebraicGeometry/EllipticCurve/NormalForms.lean | y_eq_zero_of_order_two 157 | The affine point is nonsingular, the model is in normal form, and 2≠0; ellipticity is not additionally required for this lemma. |
| TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FinitePoint.lean | finite_point 53 | Finite coefficients give finite native nonsingular points. |
| TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean | pointCount 73; comparison 86; frobeniusTrace 101; defining equation 109 | Count is Nat.card of all equation solutions plus one; finite solution set and ellipticity justify its interpretation as Nat.card Point. Trace is integer-valued and assumes a finite field. |
| TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean | quadraticTwistOf 169; c₄ formula 229; Δ formula 239; ellipticity iff 299; j formula 306 | General ring coefficient twist; twisting discriminant must be a unit for ellipticity, nonzero over a field. |

The absence claim for the actual elliptic conductor was checked by object searches throughout both pinned libraries, including conductor/Weierstrass combinations and ellipticConductor. The only native nearby objects are equation reduction and the existing general representation infrastructure; no rational elliptic-conductor construction is imported by the signature file. Searches throughout both pins found no Legendre Weierstrass coefficient definition; shifted Legendre polynomials and Legendre residue symbols are different objects.

## Sources

BS20 was fetched through the sources service from the publisher's open archive, explicitly classified publisher-open. The fetched SHA-256 is 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf, identical to the accepted design's source hash. The manifest has one key, BS20, with authors, title, year, DOI, theorem/page locators and the service provenance. Numbering and printed pages are those of the publisher version. No preprint numbering is silently substituted.

Read passages: BS20 line 462 (symmetric cubic, printed p.366), line 513 (equation (17), p.367), lines 526–546 (Lemma 6.2, pp.367–368), lines 547–557 (Lemma 6.3, p.368), lines 655–672 (descent display and Lemma 6.5, p.370), and lines 697–727 (local portion of Lemma 6.6, p.371). Formulas derived by substitution are marked as derivations rather than attributed to an unstated source theorem. The initial licence-class discovery failure was settled by the successful publisher-open fetch; there is no outstanding missing text. No source text was copied into the package.

## Adversarial pass: conventions and supplier boundaries

Every value below was calculated directly; finite computations are regression evidence, not proofs of universal theorems. Exact rational arithmetic, finite-field group addition and a separate polynomial expansion were used. A row's “pass” means the stated hypotheses survive the listed instances and its proof inputs have been traced; it does not claim the admitted theorem is proved.

| Statement or convention | Instances and values computed on both sides | Result | Change |
| --- | --- | --- | --- |
| Ring identities and field ellipticity | ℚ: λ=0 gives Δ=0, not a unit; zero ring: Δ=0=1 is a unit; 𝔽₃: λ=2 gives Δ=1; 𝔽₂: every Δ=0 | Pass with domains distinguished | Keep ring identities and field nonzero criterion separate |
| Nonreduced coefficients | 𝔽₅[ε]/ε², λ=2+ε: Δ=4+2ε; (4+2ε)(4+3ε)=1 | Pass | Added nilpotent-ring Check |
| Coordinate direction | Roots 3,5,9: old x=new x+3 gives roots 0,2,6, coefficients (a₂,a₄,a₆)=(−8,12,0); opposite translation gives roots 6,8,12 | Pass | Fixed explicit direction witness |
| Twist scalar | Native discriminant of (0,−1/2)=2; of (0,−2)=8; at d=2,λ=1/2 coefficients are (0,−3,0,2,0) | Pass | Scalar is d, not 4d |
| Valuation normalization and zero junk | v₃(3)=1; v₃(1/3)=−1; total v₃(0)=0; λ=0 would falsely look integral if the nonzero condition were dropped | Pass | Explicit exclusions retained |
| Good minimal model versus displayed model | Good model Δ-valuation 0; scaling by a uniformizer changes displayed valuation to 12 while the curve's minimal valuation stays 0 | Pass | Use minimal after base change |
| Squareclass domain | Over 𝔽₅, squares 0,1,4; unit squares 1,4; [2]²=[4]=1, while [0] is undefined | Pass | Halving uses field squares at roots |
| Trace and O | λ=3,p=5: affine counts 3 and 7, full counts 4 and 8, traces 6−4=2 and 6−8=−2 | Pass | Include O and integer subtraction |
| Primitive conductor includes identity | Radicands 1,−1,2,−2 give N=1,4,8,8; all odd parts 1 | Pass | No nontriviality hypothesis |
| Néron conductor comparison | Good primes have exponent 0; multiplicative primes exponent 1; y²=x³−x has M=32, odd part 1 | Pass | Cite §§5.3a, 5.3g, not R01.3 |
| Character squareclass specialization | 3,−3,6,−6 give D=12,−3,24,−24 and conductors 12,3,24,24; at odd p=3 valuation parity is 1 in every case | Pass | Exact rational-character supplier gap |
| Native norm versus three coordinates | At d=2,λ=3 the representative products are 144=12²,64=8²,576=24²; every product class is 1 | Pass | Derive coordinate products by cases |
| Finite abelian input | ℤ/1,ℤ/2,ℤ/4,ℤ/8 have doubling kernels of sizes 1,2,2,2; ℤ/2×ℤ/4 and ℤ/4×ℤ/4 have kernel size 4 and orders 8,16 | Pass | Exclude order-16 case by divisible-root data |
| Nonabelian negative control | In S₃, (12)²=(23)²=1 but ((12)(23))² is a nonidentity 3-cycle; four elements square to 1 and do not form a subgroup. Q₈ has only two elements squaring to 1. | Pass | Never apply abelian structure or a doubling homomorphism outside native abelian point groups |
| Empty parameter domain and q=1 | 𝔽₃ has no η outside 0,±1; a field of cardinality 1 does not exist; neither gives a singular substitute group | Pass | Prime and field hypotheses explicit |

## Adversarial pass: every target

| Statement | Instances and values computed on both sides | Result | Change |
| --- | --- | --- | --- |
| §0.1 Legendre definition | λ=−1: a₂=0,a₄=−1; λ=2: Δ=64; λ=1/2: Δ=1; λ=0: Δ=0 | Pass | Real five-coefficient body |
| §0.2 Scaled definition | d=1 agrees coefficientwise; d=2,λ=1/2 gives (a₂,a₄,Δ)=(−3,2,64); d=0 gives all zero coefficients | Pass | Distinguish model from coordinate scaling |
| §0.3 Labelled tuple | λ=−1: (−1,−1,2,1/2,1/2,2); 2: (2,1/2,−1,−1,2,1/2); 1/2: (1/2,2,1/2,2,−1,−1); 3: (3,1/3,−2,−1/2,3/2,2/3); 0: (0,0,1,1,0,0); 1: (1,1,0,0,0,0) | Pass | Keep labels, exclude degenerate parameters |
| §0.4 Invariants | λ=−1: (Δ,c₄,j)=(64,48,1728); λ=1/2: (1,12,1728); λ=2 over 𝔽₃: (1,0,0); char2: Δ=0 | Pass | No j≠0 or j≠1728 assumption |
| §0.5 Scaled invariants | d=2,λ=3: Δ=36864,c₄=448,j=21952/9, matching d⁶=64 and d²=4 scalings; d=0: Δ=0 | Pass | Ring unit versus field nonzero distinguished |
| §0.6 Root ratios | Roots (3,5,9) give (3,1/3,−2,−1/2,3/2,2/3); roots (0,1,−1) give the exceptional tuple; roots (0,0,1) give a zero denominator | Pass | Distinctness retained |
| §0.7 Native twist identity | d=2,λ=1/2 with (t,n)=(0,−1/2) gives a₂=−3,a₄=2 on both sides; d=0 gives the zero model on both sides | Pass | Correct native twist parameter |
| §0.8 Split normalization | (X−3)(X−5)(X−9) has coefficients −17,87,−135; after x→x+3 coefficients are −8,12,0, equal to d=2,λ=3 | Pass | Translation is +e₀ |
| §0.9 Full-two normalization | E=y²=x³−x has rational doubling kernel O,(0,0),(1,0),(−1,0), cardinality 4; C=1,d=1,λ=−1 gives E itself | Pass | Native kernel condition; no surrogate predicate |
| §0.10 Labelled root points | (d,λ)=(1,−1): x=0,1,−1; (2,1/2): x=0,2,1; all doubles O; on L_3 the three root points sum to O | Pass | O is distinct from each affine point |
| §0.11 Two-torsion exhaustion | Over 𝔽₅ on L_{−1}, exactly four points double to O: O and roots 0,1,4; no nonroot point is in the kernel | Pass | Both directions tested |
| §1.1 j valuations | λ=3,p=3: (a,b,vj)=(1,0,−2); λ=1/3: (−1,−1,−2); λ=−1: (0,0,3); λ=2,p=2: (1,0,6) | Pass | Odd-prime exclusion and integral/unit distinction |
| §1.2 Good-prime units | E=L_{−1},p=3: parameter-factor valuations for λ=−1,2,1/2 are (0,0) in every case, while v₃(j)=3 | Pass | Semistability not needed |
| §1.3 Unit good model | λ=3,p=5: Δ=576≡1, λ̄=3 and 1−λ̄=3; p=3: v₃(Δ)=2, λ̄=0; p=2: no two unit factors exist | Pass | Prove minimality of this equation |
| §1.4 Odd support | λ=3 gives odd conductors 3 for all four ω; λ=−1,2,1/2 gives odd conductor 1 for all four ω | Pass | Native character tied to prime values |
| §1.5 Conductor divisibility | E=L_{−1},M=32: N=4,1,8,8 has odd part 1 and 1 divides 32; λ=3 has odd character part 3, matching its bad odd prime support | Pass | Actual conductor remains supplied, not a discriminant |
| §2.1 CRT definition | Roots 0,2,6: X maps to (0,2,6), 1 to (1,1,1), X is not a unit; roots 0,1,−1 give (0,1,−1) | Pass | Only equation-specific adapter |
| §2.2 CRT evaluation | Roots 0,2,6: X+1 maps to (1,3,7), X² to (0,4,36), 1 to (1,1,1) | Pass | Evaluation order fixed |
| §2.3 Squareclass equivalence | Constants 1 and 4 map to (1,1,1); over ℚ constant 2 maps to ([2],[2],[2]) with each [2]≠1 | Pass | Zero excluded from units |
| §2.4 Unit-class reading | Constant 4=2²: all three quotient classes 1; constant 2: all three classes [2]; constant 0 has no unit class | Pass | Use native quotient maps |
| §2.5 Nonroot descent | L_{−1}/𝔽₅, (2,4): representatives (2,1,3), product 6≡1=y²; O maps to (1,1,1); at x=0 raw first representative is 0 | Pass | Separate root branch |
| §2.6 Root descent | d=2,λ=3: (12,−2,−6),(2,−8,−4),(6,4,24); at p=5,d=1,λ=−1 raw tuples (4,4,1),(1,2,2),(4,3,2) give (1,1,1),(1,[2],[2]),(1,[2],[2]) | Pass | Use derivative/cofactor at own root |
| §2.7 Product | Above rational products 144,64,576 are 12²,8²,24²; O has product 1; nonroot product is 1 over 𝔽₅ | Pass | Direct case proof, no unstated norm adapter |
| §2.8 Halving iff | ℚ at (0,0) on L_{−1}: differences 0,−1,1, not all squares and no half; 𝔽₅: 0,4,1, all squares and half (2,4); at (1,0): 1,0,2, no half | Pass | Both directions, including zero difference |
| §3.1 Two-by-four subgroup | p=7,η=2: #E=8; P=(3,1) has order 4 and 2P=(1,0), T=(0,0) independent of P; p=3 has empty η domain | Pass | Corrected added witness |
| §3.2 Minus-one half | p=5,i=2: P=(2,4), y²=cubic=1; i=3: P=(3,3), y²=cubic=4; both have order 4 | Pass | Chosen i retained |
| §3.3 Minus-one double | 𝔽₅: denominators 2y are 3 and 1; both native doubles are (0,0); next doubles O | Pass | Nonzero denominator explicit |
| §3.4 Minus-one order | For both F₅ witnesses: P≠O,2P=(0,0)≠O,4P=O, so exact order 4 | Pass | No merely-divides-four substitute |
| §3.5 First class | Over 𝔽₅, first representatives 2 and 3 both have character −1; over 𝔽₁₇, i=4 has character 1 | Pass | Nonsquareness only at p≡5 mod8 |
| §3.6 No order eight | p=5,13 orders are 1,2,4; p=29 orders are 1,2,4,5,10,20, never 8; p=41 control P=(6,13) has order 8 | Pass | Replaced false p=17 control |
| §3.7 Exact two-part | p=5,13,29 counts 8,8,40 give v₂=3,3,3 and odd quotients 1,1,5; ℤ/4×ℤ/4 has count 16 and all its two-torsion divisible | Pass | Keep unique-divisible-root input |
| §4.1 Corrected witness | 𝔽₅,t=v=2: i=3 gives (4,3), i=2 gives (3,4); y²=cubic are 4 and 1; printed (4,4) gives 1≠4. In 𝔽₉,t=v=1, P=(1+i,1−i), y²=cubic=i. | Pass | Published y correction reproduced |
| §4.2 Corrected double | The two F₅ slopes are 1 and 2, both doubles (1,0). Polynomial residuals for membership, tangent numerator, doubled x and doubled y are all 0. | Pass | Denominator-checked symbolic calculation |
| §4.3 Corrected order | Both F₅ points and the F₉ point have nonzero double (1,0) and fourth multiple O | Pass | Exact order 4 |
| §4.4 Third coordinate | F₅ i=3: representatives (4,2,3), third 3 nonsquare; i=2: (3,1,2), third 2 nonsquare; products 4 and 1 are squares | Pass | No trivial-third-class assumption |
| §5.1 Symmetric trace | p=3,u=1 square-root counts 1,1,1 yield full count4 and trace0; p=7,u=2 character values (0,1,0,1,−1,0,−1) sum0, count8; p=5,u=1 count8, trace−2 | Pass | Congruence and O both matter |
| §5.2 Twist trace | p=5,λ=3: d=1,2,4 counts 4,8,4 and traces 2,−2,2; characters of d are 1,−1,1, so both sides are 2,−2,2; Euler polynomials 1−2T+5T² and 1+2T+5T² | Pass | Direct family-specific comparison |

## Adversarial pass: definition APIs

These rows cover the individual laws in the eight definition/construction API lists, including the additional explicit field-map law for the minus-one half. They are separate from the target rows above, so none of the lists is treated as one unchecked bundle.

| API statement | Instances and values computed on both sides | Result | Change |
| --- | --- | --- | --- |
| Legendre affine equation | λ=−1,x=2,y=√6 over ℝ gives y²=6 and x(x−1)(x+1)=6; x=2,y=0 gives 0≠6 | Pass | Equation is a condition, not arbitrary coordinates |
| Legendre ring-map law | ℤ→𝔽₅, λ=3: mapped coefficients (0,1,0,3,0) equal coefficients at residue 3 | Pass | Any ring homomorphism |
| Legendre parameter extensionality | Over ℚ λ=2,μ=3 have different a₄, 2≠3; λ=μ=2 has identical tuple (0,−3,0,2,0) | Pass both ways | Compare a₄, not j=1728 |
| Legendre normal form | λ=−1 and λ=3 both give a₁=a₃=0; long equation with a₁=1 fails that normal form | Pass | No characteristic assumption hidden in the coefficients |
| Scaled affine equation | d=2,λ=1/2,x=3: RHS=3·1·2=6; model coefficients give 27−27+6=6 | Pass | Root ordering fixed |
| Scaled d=1 agreement | λ=1/2 gives (0,−3/2,0,1/2,0) on both sides | Pass | Exact coefficients, not merely j |
| Scaled ring-map law | ℤ→𝔽₅,d=2,λ=3: coefficients (0,2,0,2,0) on both sides | Pass | Map both parameters |
| Scaled/native twist identity | t=0,n=−1/2,d=2,λ=1/2 gives (0,−3,0,2,0) on both sides; n=−2 instead gives a₂=−12,a₄=32 | Pass | Incorrect 4d model excluded |
| Labelled tuple evaluation | λ=3 gives 3,1/3,−2,−1/2,3/2,2/3 in labels 0–5 | Pass | Preserve label order |
| Tuple parameter validity | λ=3: all six differ from 0,1; λ=0 gives entries 0 and 1 | Pass | λ≠0,1 required |
| Reciprocal pairs | λ=3: 3·1/3=1, (−2)(−1/2)=1, (3/2)(2/3)=1; λ=0 first pair product 0 | Pass | Nonzero denominator hypotheses retained |
| Tuple field-map law | ℚ→ℝ at λ=−1 maps (−1,−1,2,1/2,1/2,2) to the identical real tuple | Pass | Field map preserves reciprocal values |
| Root-point coordinates | d=2,λ=1/2 gives (0,0),(2,0),(1,0), each cubic value 0 | Pass | Native nonsingularity accompanies the pairs |
| Root-point doubles | L_{−1}/𝔽₅: 2(0,0)=2(1,0)=2(4,0)=O | Pass | Characteristic two excluded |
| Root-point injectivity/nonzero | Roots 0,1,4 are pairwise distinct; all are some-constructors and none is O | Pass | d=0 would identify all three |
| Root-point exhaustion | L_{−1}/𝔽₅: doubling kernel has exactly O,(0,0),(1,0),(4,0); (2,4) doubles to (0,0)≠O | Pass both ways | Nonroot counterexample included |
| CRT polynomial evaluations | Roots 0,2,6: X²+1 gives (1,5,37), equal to evaluating its class | Pass | Exact evaluation formula |
| CRT equality detected by coordinates | X and X+X(X−2)(X−6) both evaluate (0,2,6) and give the same quotient class; X and X+1 give different triples | Pass both ways | Equality is modulo the cubic |
| CRT root element | d=1,λ=−1 gives (0,1,−1); d=2,λ=1/2 gives (0,2,1) | Pass | No permutation allowed |
| CRT unit iff | At roots 0,2,6, X+1 has nonzero values 1,3,7 and is a unit; X has first value 0 and is not a unit | Pass both ways | Zero evaluations cannot enter a unit quotient |
| Squareclass unit evaluations | Constant 2 over ℚ gives ([2],[2],[2]); constant 4 gives ([4],[4],[4])=(1,1,1) | Pass | Map unit evaluations before quotienting |
| Squareclass identity | Unit 1 gives classes (1,1,1); unit 2 has three nontrivial classes over ℚ | Pass | Trivial equivalence excluded |
| Squareclass trivial iff all coordinates trivial | Over ℚ, unit 4 is a square and has three trivial classes; constant 2 is not and has nontrivial coordinates | Pass both ways | Genuine equivalence required |
| Squareclass multiplication | Constants 2·2=4: ([2],[2],[2])²=(1,1,1), agreeing with the class of 4 | Pass | Multiplicative law, not a set bijection |
| Minus-one coordinates | i=2 over 𝔽₅ gives (2,4), i=3 gives (3,3); each differs from the zero-root point | Pass | Preserve the selected root i |
| Minus-one double | Both displayed F₅ halves double to (0,0) | Pass | Native addition used |
| Minus-one exact order | Both have 2P≠O and 4P=O; additive order is 4 | Pass | Rule out orders 1 and 2 |
| Minus-one first descent class | First representatives 2 and 3 over 𝔽₅ both have character −1; their third representatives have character −1 too, product class 1 | Pass | First coordinate fixed at root 0 |
| Minus-one field-map law | Identity on 𝔽₅ maps i=2 and P=(2,4) to themselves; inclusion 𝔽₅→𝔽₂₅ preserves the same coordinate pair and double | Pass | Map source curve to its base change |
| Conic coordinates | 𝔽₅,t=v=2,i=3 gives x=4,y=3; i=2 gives x=3,y=4 | Pass | Corrected sign and y expression |
| Conic double | Both F₅ witnesses double to (1,0)=2λ-root, not the root (2,0) | Pass | Correct target root |
| Conic exact order | Each double has order 2 and each fourth multiple is O, so order is 4 | Pass | Nonzero labelled double required |
| Conic third descent | 4itv=3 for i=3 and 2 for i=2 over 𝔽₅, both nonsquares | Pass | No accidental square assumption |
| Conic field-map law | Identity on 𝔽₅ preserves both tuples; in 𝔽₅→𝔽₂₅ all conic relations, coordinates and double (1,0) remain the same | Pass | Source and target specified |

All Checks and worked examples were evaluated against the formulas in their own section and the formulas they consume. The complete finite regression range is odd primes 3≤p<44. It covers 7,442 pairs (d,λ) of nonsingular models and 257,022 affine native-point candidates for the two directions of halving; all 7,442 trace-twist comparisons; 130 symmetric models at p≡3 mod4; four minus-one prime cases at p≡5 mod8; and 256 admissible nonzero conic tuples with both choices of i where present. The group computations used the displayed a₂,a₄ in the ordinary chord/tangent law and checked actual membership. This is mathematical regression work only; no algorithm is part of the roadmap.

The independent symbolic calculation treats r,s as indeterminates, sets e=r²−s², a₂=−(2r²−s²), a₄=r²e, x=r²+rs, y=rs(r+s), and expands integer polynomials. The four residuals are:

| Identity | Residual |
| --- | --- |
| y²=x(x−e)(x−r²) | 0 |
| 3x²+2a₂x+a₄=2rs(r+s)² | 0 |
| (r+s)²−a₂−2x=r² | 0 |
| −y+(r+s)(x−r²)=0 | 0 |

The hypotheses t,v≠0 and i²=−1 give r,s≠0; r+s=0 would give e=0, contrary to e=2≠0. Thus 2y=2rs(r+s) is nonzero and the slope division is justified over every stated field, including characteristic three. The nonreduced ring test concerns polynomial coefficient identities only; no field-square or point-group theorem is extended to a nonreduced coefficient ring. Infinite fields are allowed in the halving and witness statements; finiteness is used only for point-count and finite-group statements. Equal-characteristic extensions and inseparable field inclusions are permitted by the coefficient and coordinate identities; no separable-extension hypothesis is used for field-map compatibility.

## Elaboration, binders and structural checks

Suggested.lean was elaborated with `lake env lean` on packages/EllipticLegendreCharacterInterfaces/Suggested.lean, run from the supplied content checkout. Its only Tau Ceti import is TauCeti.AlgebraicGeometry.EllipticCurve.PointCount, whose object file is present at the supplied pin. No library build, cache fetch, pin change, root TauCeti import or roadmap import was needed.

Final elaboration: exit code 0, exactly **12** warnings, all with the verbatim message ``warning: declaration uses `sorry` ``. There are no other messages. The warnings are at Suggested.lean lines 28,38,50,60,78,90,98,108,114,122,136,143. The 150-line file has two definitions and twelve theorems, each theorem admitted honestly; no set_option, lemma declaration, admitted data, additional API lemma, admitted example or executable computation occurs.

One scratch file contained `#check @name` for every one of the fourteen declarations, together with the actual module contents, and was elaborated once. Every resulting type was read against the corresponding README statement. The two definition signatures retain exactly Type-universe and CommRing binders. Every field theorem retains Field, DecidableEq where native point addition needs it, 2≠0, distinct-root hypotheses and the equations tying the parameters to the model. Both local statements retain Fact p.Prime and p≠2, and the good-curve statement minimizes the base change while the unit-equation statement asserts good reduction directly on the displayed equation. Character support retains N≠0, IsPrimitive, all four ω values and the prime-value relation. The finite-field signatures retain Fact p.Prime, the required congruences, and nonzero parameters. No needed binder disappeared and no binder-audit correction was necessary.

During initial signature development, the reserved token λ was replaced with lam, the prime-value condition installed its quantified prime's Fact instance explicitly, and quadraticChar was given its explicit field argument. These were elaboration corrections, not mathematical restrictions. A first invocation outside the content checkout did not run the project elaboration; all reported project checks above were run from the required checkout.

The README identifier audit finds all fourteen own declaration names and no own API name missing from Suggested.lean. The file has the single Mathlib import and the one individual Tau Ceti module actually used. All 37 target subsections have a locator, Checks and Needs; all eight definition/construction subsections retain their complete API list and at least three discriminating Checks. All six layers have Examples and Dependencies. Cross-reference resolution reports no missing cross-roadmap citation and no missing roadmap Lean name. Its generic host warning that it did not check pinned libraries was not used as evidence: the direct pin reads and Lean elaboration above supply that check.

The dependency checker returned exactly:

```text
depcheck: 48 roadmaps, 530 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line for this roadmap. The internal target Needs graph also has no cycle; all own-section inputs precede their consumers after within-layer ordering. The supplier gaps are exact sentences in the README and match the gaps list. The plan JSON was compared with its original version after deleting gaps from both objects; the remaining objects are equal, and a byte comparison outside the gaps span is unchanged. Only the six authorized deliverable paths were edited. No manual edits were made to the source cache or content checkout, and no Lean or regression process is left running.
