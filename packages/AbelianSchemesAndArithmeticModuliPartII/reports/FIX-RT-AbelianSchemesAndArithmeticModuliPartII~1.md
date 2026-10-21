# Repair findings

Finding headings use the IDs from the supplied reviews. Each body identifies review a or b; overlapping findings share one section. Changes concern `packages/AbelianSchemesAndArithmeticModuliPartII/README.md`, `Suggested.lean`, `sources.toml` and only the top-level `gaps` list of `design/plan.json`. The latter file was absent; it now contains that list alone. Mathematical checks below are not an independent acceptance review.

## F01 (P1) — applied differently

Applies to review a F01; review b F05.
Admitted tensor operations, instances, equivalences and multigrading data → README construction targets. `tensorSymmetricPower` now has its intersection-of-equalizers body; degree completion is a native product, evaluated by function application. Torus characters and annihilators have real bodies. Removed signatures depending on deleted data. Pinned `PiTensorProduct.reindex` and `LinearMap.eqLocus` supply the actual operations.

## F02 (P3) — applied

Applies to review a F02; review b F11.
Submodule Mathlib imports, options, `lemma`, old namespace and process docstrings → one `import Mathlib`, the required namespace, mathematical docstrings and `theorem`. Layer comments follow README order. No `set_option` remains.

## F03 (P3) — applied differently

Applies to review a F03; review b F10; review b F21.
Twelve admitted examples → seven proved examples of retained definitions, at most two per definition. Nonfixed tensors and harder annihilator boundaries are named theorem targets. Deleted the product-alias equality, redundant subtype/evaluation API and shuffle-equivalence restatement. Completion tests now distinguish a supported coefficient and loss under truncation. No example contains `sorry`.

## F04 (P1) — applied

Applies to review a F04.
Torsion union over O_Cp equals unit completion → cofinality modulo each p^r, compatible finite-level trivializations, then the p-adic inverse limit and coefficient-sheaf comparison. Added the negative control `(1+ε)^{p^n}=1+p^nε≠1` over O_Cp[ε]/ε² and the two cofinality directions modulo p^r. KS line 2783 is shorthand requiring this topology specification.

## F05 (P2) — applied

Applies to review a F05.
Omitted compact-lattice headline → `compactLatticeImageLimit` on matrices over `PadicInt ℓ`, with explicit primality, matrix convergence and antitone image sets. Its Tate application remains separate. Added rank-zero, constant and ℓ-power boundary targets. Compactness is supplied by pinned `PadicInt.compactSpace` in `Mathlib/NumberTheory/Padics/ProperSpace.lean`.

## F06 (P3) — applied

Applies to review a F06; review b F12; review b F13.
Unmatched native signatures and the commented omitted-signature catalogue → every retained declaration named at its README target, and catalogue deleted. Removed data-dependent signatures remain mathematical construction obligations solely in the README. Inventory check finds no retained Lean declaration missing from the README.

## F07 (P1) — applied

Applies to review a F07; review b F03; review b F20.
New construction of E(A∨), connection moduli and Hodge comparisons → imports from AbelianSchemesAndArithmeticModuli A4.2–A4.3. P1 keeps only `completedPoincare_connectionNotation` and its variance/base-change comparison. Updated all internal consumers. The vector-group convention is AlgebraicVectorBundles L2B. Evidence: `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md`, A4.2 lines 1789–1836 and A4.3.

## F08 (P1) — not actionable in this package: the local-bound supplier must be extended

Applies to review a F08; review b F04.
GN §2.5 invariant factors do not supply semisimple stable-lattice orbit or stabilizer bounds. Registered `gap:local-semisimple-lattice-bounds` on GeometryOfNumbersAndQuadraticArithmetic §2.5 in both required locations, with the exact Δ_ℓ, both bounds and projected-lattice requirement. F4 consumes that gap. LT line 268 and LT line 421 locate the distinct local arguments; their stronger adaptation is required, not asserted supplied.

## F09 (P1) — not actionable in this package: the unitary-mass supplier must be extended

Applies to review a F09; review b F16.
Orthogonal mass at GN §3.3 cannot supply the CM unitary count. Registered `gap:cm-hermitian-mass-asymptotic`, specifying measures, ramified/dyadic factors, genera, automorphisms and weighted-to-unweighted comparison. F5 explicitly derives 1/2 from the factorial product, correcting LT (51),(56). Evidence: LT line 1067, LT line 1243, LT line 1418. New supplier mathematics requires a separate owner change.

## F10 (P1) — not actionable in this package: fine curve-level moduli need a supplier extension

Applies to review a F10; review b F18.
A universal curve attributed to JacobianChallengePartII → its actual §2.6 and §7.2 morphisms for a given family, plus `gap:fine-curve-level-moduli` on earlier PELModuli M6. B4 now uses ℓ≥3 fine spaces and a named level-descent target. JacobianChallengePartII §7 explicitly excludes constructing curve moduli. No dependency on a later curve-moduli roadmap was introduced.

## F11 (P1) — not actionable in this package: fixed-part and mixed Kuga inputs need supplier extensions

Applies to review a F11; review b F01; review b F02.
Nonexistent H.2/LD.6 suppliers → Completed/HodgeStructures L0–L3, actual ShimuraVarieties §§3.5a–3.5d foundations, and two explicit gaps on that earlier supplier: `fixed-part-theorem` and `kuga-definable-inputs`. Contracts retain base, polarization, integral flat Hodge morphisms, finite covers, definable rational-coordinate counting, and Kuga/monodromy hypotheses. Deligne line 1377 and Deligne line 1698 distinguish fixed-part and Hom algebraization.

## F12 (P2) — applied

Applies to review a F12; review b F06; review b F19.
Pseudo-slugs and wrong section owners → parent A3.9, A4.2 and exact A6 numbers/names; ComplexComparisonPartII C0 for carriers and C1.1 `localDolbeault` for the bundle resolution. B0 retains C0. Evidence: parent A3.9 `Polarization.rosati`, A4.2 `AbelianVectorExtension`; ComplexComparisonPartII C1.1. FiniteFlat locators are settled separately below.

## F13 (P2) — applied

Applies to review a F13; review b F22.
Finite-stabilizer, generically-finite t=0 headline → both full t≥0 rank inequalities in terms of modular-image dimensions, allowing isotrivial stabilizers. The former assertions remain corollaries. Added the constant-family example with positive-dimensional stabilizer. Evidence: Gao-Betti line 1276–1284. No generic-finiteness hypothesis enters the general inequalities.

## F14 (P3) — applied

Applies to review a F14; review b F14.
Absent source manifest and stale API commits → legal-fetch manifest, exact versioned locators, corrected pinned links, and the pinned tensor/discriminant/abelian-variety interfaces. `weilGeneratorDiscriminantBound` now uses `Polynomial.discr`; its order-index comparison is distinguished from `Algebra.discr_powerBasis_eq_minpoly_discr`. Every retained name is in the README. Source-access outcomes are recorded below.

## F15 (P3) — applied

Applies to review a F15.
Missing logarithm and Ax-type tests → three Checks for each: zero dimension, identity class and split negative control for Log^(1); singleton, subtorus coset and the short parabola arc for Ax-type. The arc is nonconstant and has nonzero curvature, so no positive-dimensional coset lies inside it. Heavy geometric carriers remain README definitions.

## F16 (P1) — applied differently

Applies to review a F16; review b F08.
Owned point-count determinant identity → imported DeligneWeightsAndPurity DWP.1 target 1.5. Deleted `frobeniusPolynomial_points`; retained only `pointCount_isogeny` and `pointCount_product` corollaries via the parent's Tate maps. The elliptic extension-field application explicitly consumes DWP.1.5. Evidence: `TauCetiRoadmap/DeligneWeightsAndPurity/README.md`, §1.5 lines 1205–1222.

## F17 (P3) — applied

Applies to review a F17.
“Lemmas 2.3–2.6” → “Lemmas 2.3, 2.4 and 2.6, Corollary 2.5”, with Proposition 2.7 cited for the kernel/rank conclusion. Evidence: DGH line 382, DGH line 450, DGH line 489 and DGH line 504.

## F18 (P2) — applied

Applies to review a F18.
Uncited nine class-number-one assertions → explicit ImaginaryQuadraticClassNumber H3.6 maximal-order certificates in Scope, supplier contracts and the density target's Needs. This package proves square-class independence and applies Chebotarev. Evidence: `TauCetiRoadmap/ImaginaryQuadraticClassNumber/README.md`, H3.6 lines 142–146.

## F07 (P2) — applied

Applies to review b F07.
Nonexistent FiniteFlat slugs → R07.1.2 `etaleGroupEquivContAction`, R07.2.10 `dieudonnePDivisible`. F1 consumes R07.2.19 `exists_padic_charpoly` for Witt-Frobenius-conjugation descent of C(u)'s polynomial; its own work is comparison with the parent's integer polynomial. This uses C(u) commuting with invertible semilinear F and works over every perfect characteristic-p field.

## F09 (P2) — applied

Applies to review b F09.
New semisimplicity theorem for C(π_A) → application of parent A6.21 `frobeniusSemisimple` to the faithful opposite-endomorphism action, followed by `isocrystalFrobenius_charpoly`. Updated F1 and F3 consumers to the renamed adapter. Parent A6.21 explicitly covers faithful characteristic-zero realizations, so a second semisimplicity development is unnecessary.

## F15 (P3) — applied

Applies to review b F15.
KS Definition 1.6 as the invariant/shuffle source → Roby Chapter III §§5–6, Proposition III.1, and Proposition IV.5 for the free comparison. KS Definition 1.6 remains only for multigrading. Kings §2.2 (2.2.2) supplies the arithmetic divided-tensor normalization. Evidence: KS line 367, Roby line 1464, Roby line 1476, Roby line 1526, Roby line 2226.

## F17 (P3) — applied

Applies to review b F17.
PEL M5–M6 as the uniformization owner → M3.5–M3.6, with M5 for the Siegel family and M6 retained for arithmetic moduli/finite-field finiteness. Corrected both scope and B0's Needs/construction text. Evidence: `TauCetiRoadmap/PELModuli/README.md`, M3.5 and M3.6.

## F23 (P3) — applied

Applies to review b F23.
Uncited Smith reference → deleted. Waterhouse Porism 4.3 printed page 540 → 541, retaining the separate Chapter 2 and Theorem 6.1 locators. Evidence: Waterhouse line 786 on PDF page 21, printed 541.

## Adversarial mathematical pass

The table groups identities belonging to the same construction; named APIs are included in their construction's row. “Retain” means the indicated instances support the stated claim, not that the general target is proved. Supplier gaps remain unmet external contracts. No computations below are formal Lean execution.

| Statement | Instances tried | Result | Change |
|---|---|---|---|
| Base, completion and variance conventions | Zero-dimensional A; nonreduced base; O_Cp; identity map | Unit and p-adic completions must be distinguished; E(A∨) has quotient A∨ and kernel ω_A | P1 import; P4 topology repair |
| TSym, membership and diagonal | n=0,1,2; zero ring; ℤ² off-diagonal e₀⊗e₁ | First two invariance conditions empty; swap changes the off-diagonal tensor | Real equalizers, two proved examples, negative boundary theorem |
| Tensor functoriality and subtype equality | Zero map; identity; composition; zero module | Tensor map preserves invariance; equality is native subtype equality | Delete redundant extensionality target |
| Degree completion and evaluation | One supported coefficient; truncation through N; degree N+1 nonzero; empty unit tensor over ℤ | Product retains coefficient; finite truncation can lose it | Real product, native evaluation, discriminating tests |
| Shuffle algebra and unit | m or n=0; m=n=1; 𝔽₂ diagonal; mixed basis vectors | Unit coefficient 1; square coefficient 2; mixed divided-square coefficient 1 | README construction, no admitted operations |
| Degree-two flip comparison | e₀⊗e₁ and e₀⊗e₁+e₁⊗e₀ | First fails flip invariance; second satisfies it without dividing by 2 | Retain README comparison |
| Divided-power comparison | Free rank one; characteristic 2; arbitrary module vs free module | Integral divided powers differ from the symmetric quotient; free hypothesis needed for equivalence | Roby locators; no admitted equivalence |
| Multigrading | Empty family in degrees 0 and >0; one summand; two projective lines in degree 2 | Empty product gives R only in degree zero; degree-two summands have indices (2,0),(1,1),(0,2) | Retain finite-projective hypotheses |
| P1 connection/cotangent comparison | A=0; elliptic A; square-zero k⊕M | H=0; ranks 1 and 2; tangent domain Hom(H,M) | Import universal extension and Hodge duality |
| Formal smooth-group moments | n=0,1; G_a over ℚ and 𝔽_p | x^n has degree-n coefficient n!, zero at n=p in 𝔽_p | Retain Q-algebra isomorphism hypothesis |
| Finite/completed Poincaré sheaves | n=0,1; A=0; identity base change | P(0)=O_A; first kernel π*ω_A∨; connection version uses H | Retain finite pushforward system |
| Fourier–Mukai, formal functions and top cohomology | d=0; elliptic fibre; nonreduced noetherian base | Shift is −d; Ω^d cancels the determinant line; formal limit comparison required | Retain noetherian and completion hypotheses |
| Isogeny and torsion functoriality | Identity; [N] with N invertible; connected p-kernel | Pullback directions agree; formal inverse needs étale dual | Retain dual-étaleness restriction |
| Automorphism equivariance | Identity and two composable automorphisms | Inverse γ_# has the stated pullback direction | Retain |
| Comultiplication and symmetric levels | n=0,1,2; characteristic 2 | First level unchanged; second symmetrization cannot be inverted when 2=0 | Retain n!-invertibility condition |
| Square-zero logarithm class | H=0; H≠0, identity and zero classes | Identity and split class agree only when H=0 | Add three Checks |
| Smooth d+ν and logarithm comparison | First level; zero dimension; characteristic-zero factorials | First extension has id_H; tangent and cotangent bases remain dual | Retain characteristic-zero scope |
| Bundle Dolbeault model | Point; trivial line on a polydisc; change of holomorphic frame | ∂̄ kernel is the holomorphic bundle; gluing requires the bundle-valued resolution | C1.1 locator |
| Ordinary CM setup and completed base change | p=2; p nonunit; ordinary multiplicative formal chart | CM ordinary kernels are connected; O_Cp need not be noetherian | Retain noetherian model then completed base change |
| Ordinary infinitesimal trivialization | 1+ε over O_Cp[ε]/ε² and modulo p^r | No p-power kills the former; p^r kills the latter | Mod-p^r cofinality and inverse limit |
| Ordinary moments, Hodge retraction and connection | Degree p; generic Cp fibre; [p] | Factorials cause integral non-surjectivity; generic-fibre retraction is legitimate | Retain injection/isomorphism distinction |
| Torsion translation diagrams | y=0; connected torsion s; torsion y with étale-dual annihilator | Unit and translation diagrams agree under precisely the torsion hypotheses | Retain restriction to torsion y |
| Betti chart and transitions | Base point; constant family over a curve; type diag(1,2) | b forgets base; combined (b,π) is invertible; D changes lattice periods | Correct uniformization supplier only |
| Birational generic rank | Identity and blow-up at a point | Rank agrees on the common dense open, not on the exceptional locus | Retain generic qualifier |
| Betti-form normalization and scaling | Elliptic chart; [0],[−1],[2]; type diag(1,2) | Periods 2 and 4; [2]*ω=4ω | Retain factor-two convention |
| Kernel, rank and wedge criteria | Point; vertical subvariety; base directions in constant family | Base directions lie in the kernel; maximal rank compares with total dimension | Retain |
| Non-degeneracy and nonvanishing point | Single fibre; torsion section; diagonal elliptic family; smooth-base locus | Single fibre full rank, section and diagonal rank deficient | Retain regular-base restriction; correct DGH locator |
| Curve degeneracy | Torsion section; vertical subvariety; whole constant family | Section and whole family degenerate; vertical Betti fibres isolated | Retain |
| Actual/geometric trace and complement | Zero; constant B; non-isotrivial elliptic family; finite cover | Traces can differ after cover; trace of genuinely varying elliptic family zero | Retain separate trace objects |
| BettiTorus and torusCharacter | n=0,1,2; zero weight; (1,−1) on (a,b) | Empty sum zero; signed pair gives a−b | Real character and proved examples |
| Annihilator, separation and countability | Trivial subgroup; whole torus; order-two subgroup | Annihilators ℤⁿ,{0},2ℤ; last is not saturated | Real definition; two named boundary targets |
| Free word growth | k=0,1,2; c>1; nonnegative submultiplicative height | Distinct positive words give 1,2,4 elements; C=1/2 works asymptotically | Retain all explicit height assumptions |
| Tits and curve-monodromy freeness | Trivial group; rank-zero GL; nontrivial connected semisimple Zariski closure | Solvable cases fail the hypothesis; finite-index condition retained | Settled Tits locator; monodromy supplier gap |
| Invariance of domain | m=0; identity; lower-dimensional inclusion | Equal dimensions give openness; the last is outside the statement | Retain equal dimensions |
| Constant-rank coordinates | Zero map; identity; projection of rank r; r=0 | Fibres have dimension m−r; local coordinates have the stated form | Explicit k≥1, open set and rank hypotheses retained |
| Good-cover refinement | Empty surface; coordinate disc; overlapping relatively compact discs | Empty members allowed; nonempty finite intersections contractible | Retain Hausdorff and second countability |
| Fixed homology and equivariant Hom | Constant family; trace-free family; special fibre with extra endomorphisms | Fixed Hodge subvariation gives constant factor; arbitrary single-fibre Hom does not extend | Precise fixed-part supplier gap |
| GH generic specialness | Constant genus≥2 curve; torsion multisection; constant trace | Constant subvariety need not be a torsion coset | Retain GH/Gao distinction |
| Ax-type and invariant definable set alternative | Singleton; subtorus coset; short parabola | First two satisfy arc implication; curvature rules out the last | Three new Checks and counting gap |
| Transport along nonisolated Betti fibres | Torsion section; isolated vertical point; identity loop | Nonisolated leaf continues; vertical isolated point does not meet hypothesis | Retain hypotheses |
| Monodromy-invariant fibre subvariety | Trace-free situation; torsion point; positive-dimensional stabilizer | Torsion-coset/stabilizer alternative accounts for both cases | Retain no-fixed-vector and extendability conditions |
| Invariant homology gives trace | Constant abelian scheme; non-isotrivial elliptic family | Fixed lattice nonzero only in first case here | Fixed-part gap |
| Virtually invariant kernels | Finite étale cover; trace-free fibres; total vs relative dimensions | Kernel total dimension includes the curve | Retain all-finite-cover trace hypothesis |
| Curve degeneracy implies generic specialness | Torsion section; constant closed curve; vertical fibre | First two special; vertical fibre is not curve-degenerate | Retain |
| Full-rank algebraic point | Single nonempty Betti domain; smooth locus; generic special countercase | Algebraic points meet nonempty full-rank locus; special case excluded | Retain |
| Horizontal/vertical mixed growth | Zero-dimensional projection; Hodge-generic positive-dimensional projection | Positive projection dimension required for growth branch | Kuga/counting gap |
| Rational stabilizer alternative | Trivial stabilizer; positive-dimensional normal stabilizer | Dimension inequality handles first branch | Retain |
| Normality and quotient induction | Original pair vs very general Hilbert pair; H=1 | Normality is not asserted for each original pair | Retain very-general replacement |
| Finite weakly optimal data | Point; constant fibre; moving orbit point | Finite subdata do not imply finite orbit points | Retain moving points and normal quotient infrastructure gap |
| t-degeneracy definition and closedness | t<0, t=0; exceptional fibre of a blow-up graph | Exceptional loci must be included, not only a generic dimension formula | Retain global formulation |
| Quotient criterion | Zero quotient; full quotient; smallest torsion-coset family | Strict inequality matches rank threshold; finite covers retained | Correct fixed-part contract |
| Dominant fibre product | Product with point fibres; constant families; dominating components | Kernel intersection gives product non-degeneracy | Retain dominance/component conditions |
| Fibre powers and differences | Constant B×S with stabilizer B; t=0; t≥dim S; multisection | Modular dimension is m dim B; multisection fails positive relative dimension | Restore both full t-parametrized inequalities |
| Universal curve differences and level descent | g=2; ℓ=3; level refinement; coarse-moduli map alone | Fine family required; étale base change preserves rank | Fine-curve supplier gap and level-change target |
| Finite-stabilizer full-rank corollary | Generically finite modular map vs constant base variation | Total dimension valid only in the first situation | Retain as corollary |
| Difference-product preservation | Identity differences; independent first factor; dominating components | Product lemma suffices; generic injectivity unnecessary | Retain |
| Compact-lattice image limit | d=0; zero/constant maps; multiplication by ℓ^n | Images singleton/fixed/{0} respectively | Add native headline and boundaries |
| Frobenius polynomial, reciprocity and product | g=0; elliptic X²−tX+q; product of two elliptic curves | Constants 1,q,q² and descending reciprocity agree | Remove owned point-count identity |
| Weil q-numbers | q>1 and π=1; ±√p; conjugates and positive powers | 1 fails; real Weil roots allowed; integrality retained | Retain DWP predicate specialization |
| Isotropic-image lemma and split-prime Tate | W=0; maximal isotropic W; ℓ=p | Finite-model hypothesis essential; ℓ=p excluded | Retain |
| Prime-to-p Tate full faithfulness | A=0; elliptic ordinary/supersingular; product | Integral saturation separates from rational surjectivity | Retain |
| Point-count corollaries | A=0; elliptic curve; product; isogeny | Counts 1,q+1−t and products | Import DWP.1.5 |
| Monic lifts | Zero ring; unit ideal; arbitrary nonprincipal ideal; constant polynomial 1 | Lifts preserve degree with no DVR requirement | Align README with arbitrary-ideal Lean signature |
| Fixed-size resultant congruence | m,n=0; degree drop; unit ideal | Fixed Sylvester determinant descends modulo I | Retain degree bounds |
| Shifted-factor slope | e=0; S=1; repeated R; inseparable factor over an equal-characteristic DVR | Quotient determinant gives nde, with eventual nonvanishing | Retain positive degree, monicity and coprimality |
| DVR/p-adic recognition | P=1; repeated factors; no finite residue field; zero resultant test | Dense monic tests with both resultants nonzero detect multiplicities | Retain full DVR generality |
| Dieudonné length and integral saturation | Identity isogeny; [p]; connected kernel | Length gives v_p degree; geometric points miss connected kernels | Retain finite flat quotient argument |
| Characteristic-polynomial comparison | u=0,1,[p]; ordinary/supersingular; arbitrary perfect k | Witt descent uses semilinear conjugation, no semisimplicity of u | Import R07.2.19, keep integer-polynomial adapter |
| Frobenius block algebra and central simplicity | a=1; split and nonsplit L⊗K; matrix splitting | K-dimension a²; every idempotent needed | Retain full étale tensor |
| Frobenius adapter | a=1; repeated Frobenius factors | Faithful opposite realization carries parent semisimplicity | Import A6.21 |
| Semilinear commutant dimension | One degree-d factor of multiplicity e; multiple blocks | Dimension de²; add over distinct blocks | Retain |
| Rational/integral p-Tate and characteristic-prime invariant | Zero A; prime field a=1; ramified/unramified K; nontrivial residue degree | Saturation needed integrally; f_v ord_v(π)/a equals degree-normalized slope | Retain opposite algebra and valuation conventions |
| Restricted lattice spaces and marking action | Identity marking; zero A; infinitely many modified primes; composition αβ | Finite support essential; C(αβ) inverse restores left action | Retain |
| Honda–Tate existence and dimension | Real π=√p; nonreal elliptic π; prime-power q | Real case can have division index >1; reciprocal polynomial alone insufficient | Retain all Weil classes |
| Polynomial/isogeny classification | Equal polynomials; nonisogenous elliptic curves; A=0 | Integral multiplicities agree exactly in the first case | Retain |
| Nonreal prime-field commutativity and order realization | No real place; real √p factor; nonmaximal orders containing π,p/π | Real factor excluded from CM assertion; required orders retained | Retain |
| Prime-field p polynomial and dual transport | a=1; identity; [p]; transpose | Linear dual preserves polynomial but is not Cartier duality | Use renamed F1 adapter |
| Marked lattice realization and unmarked orbits | One-prime modification; finite support; two markings differing by rational unit | Finite flat quotient realizes tuple; rational units forget marking | Retain integral Hom conditions |
| Adelic class set | Rational unit; compact conjugation; nonprojective lattice over a nonmaximal order | Class monoid not automatically Picard group | Retain |
| Prime-field p-component reduction | F scalar; p=2; simultaneous F,V-stability | Centralizers agree, integral lattice subsets need both conditions | Retain prime-field scope |
| Weil-generator discriminant bound | d=1; quadratic minpoly; nonmaximal generated order | Field discriminant differs by a square index | Use Polynomial.discr and pinned comparison |
| Ordered-root product | m=0,1; all equal roots; two unequal repeated values; q=1 | Empty product 1; unequal occurrences retain multiplicity and nonvanishing | Retain |
| Local orbit/stabilizer input | Scalar operator; distinct unramified blocks; repeated and ramified factors; ℓ=2 | Δ=0 gives one orbit/maximal stabilizer; general bounds need supplier proof | Explicit local-bound gap |
| Finite-support adelic assembly | Δ=0 almost everywhere; finitely many nontrivial conjugators | Product of local bounds gives D_*² and D_* only with local contract | Consume gap explicitly |
| Reduced-norm class set | Quaternion matrix degree d=0,1,2; CM GL₁ | d=1 not replaced by narrow class group; d≥2 uses it | Retain separate cases |
| rationalOrbitCount | X empty; trivial group; D=0; one orbit; nontrivial finite-index stabilizer | Fibre size ≤D h, at most D² orbits; finiteness prevents zero-cardinality loophole | Retain explicit finiteness/index binders |
| Fixed-level coarse isomorphism count | g=1; repeated roots; zero discriminant of full polynomial | D_* remains positive; class-set h must be controlled separately | Retain conditional fixed-level estimate |
| Lang and line-bundle descent | Zero variety; ordinary elliptic; characteristic 2; symmetric nonpositive isogeny | Frob−1 has invertible differential; symmetry need not imply ampleness | Retain distinction |
| Ambiguous class exact sequence | Class number 1; trivial unit-norm quotient; nontrivial ambiguous classes | Quotient is subquotient of Cl(L), not only of the real field class group | Retain |
| Nine splitting fields | Square classes −1,−2,−3,…,−163; ramified primes omitted | Independent sign/prime coordinates; all nonsplit density 2^−9 | Import H3.6 certificates |
| CM elliptic existence | Split prime including p=2 when it splits; norm-p generator | Norm p gives a p-Weil integer; order realization supplies actual E | Retain |
| Odd-characteristic elliptic p-group test | p=2, traces ±1; p=3; odd p with trace 1 or p+1−p^r | p=2 gives counts 2 and 8; odd-characteristic exception excluded | Retain explicit counterexample |
| CM Hermitian polarization count | g=0,1,2; K=ℚ(i); ramified prime 2 | H(0)=1; rank-one mass 1/4 vs class count 1; factorial sum has coefficient 1/2 | Explicit unitary gap and misprint correction |
| Squarefree nonreal polarization bound | No principal polarization; repeated simple factor; real X²−p factor | Count 0 allowed; latter cases outside this bound | Retain exclusions |
| powerSumReconstruction | g=0,1; q=0,1; equal first g sums | Monicity handles g=0; Newton plus reciprocity recovers coefficients | Retain explicit root factorizations and reciprocity |
| weilPolynomialCount | q=2,g=1; repeated roots; boundary roots ±√q | Integer traces lie in intervals of length 4gq^(j/2); enlarged constant suffices | Retain (4g+1)^g |
| Isogeny-class upper asymptotic | g=1; fixed q; logarithm of polynomial prefactor | Leading exponent g² log(q)/4 | Retain |
| DPH lower bound | q=2,n=1; small n with negative RHS; large n | Negative RHS is harmless; log only after positivity | Retain finite-n formula |
| Coarse isomorphism count and 69/4 assembly | Fixed p; class-dependent errors; uniform ε_g→0 | Uniformity required; 17+1/4=69/4 | Retain conditional sharp exponent |
| Squarefree nonreal ppav exclusion | CM split prime; g→∞; no repeated factors and no real factor | exp(O_p(g²)) divided by exp(½g²log g+O_p(g²)) tends to zero | Retain both exclusions and unitary prerequisite |

## Check outcomes

- **Suggested.lean elaboration:** unavailable, as specified in the job. No Lean command was run. In particular no claim is made that the new proof scripts elaborate, and no scratch `#check @name` elaboration was possible. All required hypotheses of retained admitted theorems were inspected directly in their explicit signatures; the only section-variable theorem signatures involve the ring/module carriers they visibly mention.
- **Dependency check:** exit 0. Exact output:

    depcheck: 6 roadmaps, 45 edges, 0 problem(s)

  There is no UPWARD or CYCLE line. The specified check was run against the package README and the supplied merge-order file. A pre-existing merge-order working-tree insertion for this package was observed; it was not edited by this repair.
- **Static consistency:** `Suggested.lean` is under 5000 lines; every retained named declaration occurs in the README; no admitted data or examples, `lemma`, `set_option`, omitted-signature catalogue or stale supplier slug remains. Both manifests parse, and all five gap slugs occur once as “What … must provide” contracts and once in the plan's top-level list. `git diff --check` passes.
- **Deliverable validation:** the report parser recognizes 23 merged finding sections, each retaining its review mapping in the body. README scans report `latex=0`, `tex=0` and `readme-ids-missing=0`. All source entries have `authors`, `title` and `year`. Four unnamed proved examples now have descriptive Check labels; the induced tensor map and finite truncation retain their names in explicit README construction signatures. `Suggested.lean` is unchanged by these validation repairs.
- **Sources:** 19 sources were legally fetched with provenance; Tits is explicitly `uncertified` because the DOI resolves to a paywalled publisher and is cited solely by locator. No missing legal text remains requested. The published GGK extraction resolves the former uncertainty about Proposition 5.2 and equation (5.4); see GGK line 1017 and GGK line 1053. Roby and Deligne are Numdam copies. WM and Milne are operator-cache OCR; no source text was copied into the package.

## Maintainer consequences

The five supplier gaps require independent supplier/human resolution; editing this package cannot discharge them. They are extension requests on existing earlier roadmaps, not invented supplier targets and not a new assertion that those sections already contain the requested mathematics. F4–F6 counting and B2–B4 geometry retain these prerequisites. No merge-order placement, external roadmap, tooling, issue or pull request was edited; no commit or push was made.

All retained Lean declarations moved from `AbelianArithmetic` to `TauCetiRoadmap.AbelianSchemesAndArithmeticModuliPartII`. Deleted Lean data/maps include `tensorSymmetricPower_map`, `dividedTensor`, shuffle/algebra instances and inclusion, divided-power comparisons, `tensorSquareEquiv`, `degreeTwoInvariant` and `invariantTensorMultigrading`; their genuine construction targets stay in the README. Deleted redundant projection/equality names include `degreeCompletion_component`, `degreeCompletion_component_apply`, `degreeCompletion_ext`, `degreeCompletion_zero`, `tensorSymmetricPower_ext`, `torusCharacter_apply` and `torusAnnihilator_mem`. Use function application, the equalizer definition and native subgroup/subtype APIs instead.

The README no longer owns `universalVectorExtension_*`, the standalone Lie/cotangent reconstruction or `frobeniusPolynomial_points`. Consumers use parent A4.2–A4.3 and DWP.1.5, respectively. P1's retained adapter is `completedPoincare_connectionNotation`; F1's renamed adapter is `isocrystalFrobenius_charpoly`. F0's new native headline is `compactLatticeImageLimit`. The full fibre-power targets are `fibrePowerBettiRank` and `differencePowerBettiRank`; level descent is `universalCurveDifference_levelChange`. These geometric targets remain README statements until their actual carriers exist.
