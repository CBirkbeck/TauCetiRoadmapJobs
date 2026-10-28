# GenericDoublePointInterpolation repair report

The two reviews contain eight new findings. Their earlier-finding verification tables do not re-raise the earlier findings. Each new finding is settled below; identifiers repeat because each review numbers its own findings.

## F01 (P2) — applied

Review r2a. Independent homogenization by basis transport → the one-block construction from DiophantineApproximationAndTranscendence §2.7, restricted and renamed into native submodules. Scope, supplier contract, §0.2 route and Layer 0 dependencies agree. At r=1,d=2, both constructions give X₀²+X₀X₁ for 1+x; at r=0 they give X₀^d.

## F02 (P2) — applied

Review r2a. Unqualified compound generic-contact request → a dominant morphism between smooth integral finite-type characteristic-zero schemes, with a dense smooth source open, relative dimension dim X−dim Y and surjective geometric differential. The absolute pinned theorem is imported separately. Layer 3 specifies the secant incidence and derives contact projections. Both gap entries agree. Evidence: VAK lines 28564–28578.

## F03 (P2) — applied

Review r2a. Combined pushforward/direction request → separate finite-flat-sections and tangent-direction-incidence gaps. The latter specifies smooth separated X/k, cotangent line quotients, the first diagonal neighborhood and square-zero algebra O⊕O(1). Layer 2 consumers and scope now use the correct owner. VAK lines 23885–23947 identify the diagonal conormal; the line quotient gives rank two.

## F04 (P2) — applied

Review r2a. Nonzero-minor endpoint before its prerequisites → selected determinant, degree bound, evaluation prime, principal-open criterion, arbitrary-minor integer specialization, nonzero maximal minor, generic affine interpolation, parameter pullback. The Lean headline order agrees; the generic affine target explicitly needs the nonzero maximal minor. At r=n=1,d=5, Δ=1, degree 0≤10 and the grid witness is P=0.

## F05 (P3) — applied

Review r2a. Extra-coordinate negative control asserted for every degree → negative control only for d>0, with d=0 explicitly a positive boundary Check. At d=0 both counts are 1; at d=2 the intended r=0 count is 1 and the extra-coordinate count is 3. No Lean padding was added.

## F06 (P2) — applied

Review r2a. Seven missing finite subspace bases → three native headline theorems, using rational submodules, homogeneous cubics, actual evaluations and partials. They include dimensions, incidences, projective distinctness and the transverse P⁵ value/directional conditions. README targets and Checks name them. Recomputed ranks are 56,84,120; 56,120; 56,120. The unbounded geometric recursions remain separately identified as unstatable.

## F01 (P2) — applied

Review r2b. Degree-at-least-five endpoint absent from Lean → genericDoublePointRank, with every support count and every characteristic-zero field. Its docstring and §4.8 distinguish this affine realization from missing geometric carriers. Rational polynomial nonvanishing supplies the field descent independently of Layer 5. For r=1,d=5,q=4 the rank is 6=min(6,8), covering injectivity rather than surjectivity.

## F02 (P3) — applied

Review r2b. IsOpen conjunct inside genericAffinePrincipalOpen → deleted; the nonzero minor, rational point of the basic open and full-jet conclusion remain. Openness stays in the README's native principal-open contract. At the pin, Mathlib/RingTheory/Spectrum/Prime/Topology.lean:504 defines basicOpen as TopologicalSpace.Opens; its openness projection proves that conjunct for every ring element.

## Required checks and signature audit

- Required elaboration of packages/GenericDoublePointInterpolation/Suggested.lean, from the pinned content checkout: exit 0, exactly 12 warnings saying a declaration uses sorry, no errors and no other warnings. No TauCeti module is imported, so no object-file build was needed.
- Scratch elaboration containing the same file and one `#check @name` for each of all 25 declarations: exit 0, the same 12 expected admission warnings. Every elaborated signature was compared with its README target. No needed binder disappeared. All ring constructors retain CommRing; quotient and rank statements retain Field; the three general characteristic-zero endpoints retain CharZero. The new subspace bases use ℚ explicitly, retain the space dimensions, distinctness, incidence and transverse conditions, and quantify over actual homogeneous cubics.
- A separate scratch file checked all 36 Mathlib names used in the supplier contracts or new arguments at the pin: exit 0, no warnings or errors. Tau Ceti's three total-degree declarations were read at the pinned source, lines 39, 52 and 72 of TauCeti/RingTheory/MvPolynomial/RestrictTotalDegree.lean.
- Required dependency check: exit 0; complete output:

```text
depcheck: 32 roadmaps, 286 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. No merge-order change is requested.

- Citation resolver: no unresolved cross-roadmap citation and no unresolved own Lean name. The resolver said it did not inspect external Lean names because it did not discover the pinned packages; the explicit pinned checks above cover those names.
- Whitespace validation with git diff --check: exit 0. Only the permitted README, Suggested.lean, sources.toml, top-level plan gaps and this report change. metadata.toml is unchanged. No commit or remote write was made.
- No separate gate failures were listed in the brief. The two initial resolver leads are supplier declarations, verified at AlgebraicModuliForArithmeticGeometry §§1.1–1.2, rather than declarations claimed to exist in Mathlib.

## Sources, ownership and supply direction

The main-branch shapes read were TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md, TauCetiRoadmap/SchemeAndStackFoundations/README.md and Completed/EffectiveBounds/README.md. Ownership searches used the roadmap index's grep/show tools, the board packages and all 31 specifically supplied sibling README/Suggested.lean pairs. No supplier was inferred from the older status of a review. The relevant object overlap is block homogenization on main, §2.7, lines 1740–1775. It is consumed from main, irrespective of another open revision of that roadmap.

The named sibling match concerning an infinitesimal neighborhood in AbelianSchemesAndArithmeticModuliPartII §P2.9 is a split neighborhood of a group identity used for Poincaré tensors; it does not supply the relative projective cotangent-direction incidence for an arbitrary smooth X. Habiro first-jet matches concern cyclotomic Taylor coefficients, not multivariate double-point interpolation. No alternate owner of the finite codimension-three cubic assertions was found. They belong here as the bases of the existing interpolation induction. No new declaration uses another roadmap's namespace.

Every cross-roadmap contract was resolved at main or its supplied open head:

| Contract | Locator verified | Consequence |
| --- | --- | --- |
| One-block homogenization | DiophantineApproximationAndTranscendence §2.7, main lines 1740–1775 | Imports linearity, coefficient/homogeneity formulas and both inverse identities; only the native-submodule adapter belongs here. |
| Quotient and sheaf comparisons | SchemeAndStackFoundations §0.28, main lines 1765–1815 | Retains the affine hypothesis for the unsheafified isomorphism. |
| Projective cohomology | SchemeAndStackFoundations §2.6, main line 3443 | Supplies projectiveSpace_cohomology. |
| Bézout | SchemeAndStackFoundations §5.12, main line 7338 | Proper-intersection condition is retained. |
| Projective quotients and twists | AlgebraicModuliForArithmeticGeometry §1.1, head lines 313–341 | Invertible-quotient convention, actual tautological quotient and arbitrary base change. |
| Coefficient/section comparison | AlgebraicModuliForArithmeticGeometry §1.2, head lines 517–537 | All commutative coefficient rings, q=0, nonnegative twist; dimension-zero case included. |
| Determinantal loci | AlgebraicModuliForArithmeticGeometry §1.7, head line 908 | Finite locally free maps, scheme-theoretic minors and arbitrary base change. |
| Hilbert families | AlgebraicModuliForArithmeticGeometry §2.1, head line 996 | Separated finite-presentation ambient morphisms and flat proper closed families; no direction family is inferred from this alone. |
| General lattice theory | IntegralLattices, main introduction and carrier layers | The elementary monomial metric here makes no new general lattice claim. |

The pins are exactly the revisions in lake-manifest.json: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The reducedness, perfect-field and locally-of-finite-presentation binders of Scheme.Hom.dense_smoothLocus_of_perfectField were read at Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:361 and checked by Lean. Its conclusion concerns the absolute structure morphism and does not replace the relative gap.

BO and COU were read from the supplied legal extractions. VAK was fetched through the sources service from the author's Stanford page. The final manifest has one VAK key, using the readable 18 November 2017 draft and its actual numbering. The earlier 2011 extraction had a broken font encoding and stops before the needed generic-smoothness section; it supplies no asserted locator. There is no missing legal reference request. No source passage was copied into the package or this report.

| Claim family | Legal locator checked |
| --- | --- |
| AH endpoint and exceptions | BO lines 22–40, Theorem 1.1, p.1 |
| Tangents, secant differential and contact fibers | BO lines 127–237, Proposition 2.1 and Lemmas 2.2–2.3, pp.3–5 |
| Plane reduction | BO lines 245–277, Theorem 2.4 and proof, p.6 |
| Quadric radical calculation | BO lines 279–318, §3, pp.6–7 |
| Ordinary Horace and residual sequence | BO lines 374–453, Theorem 4.1 and sequence at line 407, pp.7–8 |
| Cubic recursions and finite bases | BO lines 481–588, Theorem 5.1 and Propositions 5.2–5.4, pp.9–12 |
| Curvilinear criterion | BO lines 628–727, Lemma 6.1, pp.12–14 |
| Horace arithmetic | BO lines 765–797, Lemma 6.3, pp.15–16 |
| Differential step and exception schedule | BO lines 798–982, Theorem 6.4 and final induction, pp.16–19 |
| Matrix and section comparison | COU lines 179–204, §3, p.491 |
| Nonzero minors and integer box | COU lines 242–248, §3, p.492 |
| Coefficient metric | COU lines 255–268, §3, p.493 |
| Relative generic smoothness | VAK lines 28564–28578, Theorem 25.3.1, p.681 |
| Local smooth presentation and tangent surjectivity | VAK lines 14724–14744, Definition 12.6.2, p.355; solve the linearized equations using the invertible displayed Jacobian block |
| Diagonal cotangent algebra | VAK lines 23885–23947, §21.2.20 and Theorem 21.2.24, pp.572–573; the proof continues on p.574 |

The refined and new contracts remain supplier gaps, not claims that the suppliers already state them. The six slugs agree exactly between Exact supplier contracts and the plan's gaps list. The established mixed-bad-incidence gap and its extra domination requirement are unchanged. Its existence is not proved by a trait limit or by this repair. The owning suppliers' general extensions remain necessary for the geometric proof route.

## Adversarial mathematics pass

Computations below are checks of statements and models, not formal proofs of the general targets. All 12 headline proofs remain sorry. A fresh independent review is still necessary. Unless a field is specified, numerical examples use ℚ, or their integer models.

Finite matrices were recomputed from integer normal matrices, integer nullspace frames and support vectors. Incidence equations hold over ℤ, and nonzero rank minors modulo 101 imply the asserted rational ranks. Nonzero pair-support minors ensure projective distinctness over ℚ. Space dimensions, pairwise sums and triple intersections were checked separately. Exact matrices and selected row/column sets were saved in scratch for the worker; they are not library constructions or source copies.

| Finite base | Containment rank | Rank before remainder | Final rank / source dimension | Nonzero minor residue mod 101 |
| --- | ---: | ---: | ---: | ---: |
| Three spaces, r=5 | 30 | 56 | 56/56 | 20 |
| Three spaces, r=6 | 57 | 84 | 84/84 | 9 |
| Three spaces, r=7 | 93 | 120 | 120/120 | 58 |
| Two spaces, r=5 | 20 | 56 | 56/56 | 44 |
| Two spaces, r=7 | 66 | 120 | 120/120 | 20 |
| One space, r=5 | 10 | 55 | 56/56 | 27 |
| One space, r=7 | 35 | 120 | 120/120 | 29 |

The twelve near-exception ranks were recomputed in README order as 9,10,20,30,35,120,12,15,32,35,65,70, with nonzero minor residues 15,25,80,15,39,36,16,79,69,94,86,25 modulo 101. Sextic-plane residues were 30 and 95, with ranks 27 and 28. The quartic P⁵ residue was 89, with rank 126. Integer support vectors for these affine examples start with homogeneous coordinate 1, so distinct affine tuples give distinct projective supports.

### Conventions, simple definitions and supplier contracts

| Statement | Instances and computed values on the two models/sides | Result and change |
| --- | --- | --- |
| Bounded and Monomials | r=d=2: exponents 00,10,01,20,11,02, count 6=choose(4,2); x²y has total degree 3 and is excluded although its separate exponents are ≤2. | Native total degree, unchanged. |
| monomialsFintype | r=0,d=0 and r=0,d=2 each have 1 element; r=2,d=2 has 6. | Coordinate bounds ensure finiteness, unchanged. |
| JetRows and row order | n=2,r=2 gives 2·3=6 rows; at one univariate support columns 1,x give determinant 1, column transposition gives −1. | Value/derivative and determinant orientation agree. |
| Native derivatives | x² at 3 gives (9,6); x at 0 gives (0,1); x² over F₂ has derivative 0 and over F₃ at 1 has derivative 2. | Exponent coefficient retained; no factorial or coordinate division. |
| Square-zero algebra convention | (0,1)²=(0,0), whereas x² mod x³ is nonzero. | Order-one jets, unchanged. |
| Empty and dimension-zero conventions | n=0 gives ideal top, quotient dimension 0 and empty determinant 1; r=0,n=1 gives determinant 1; r=0,n=2 has no injective tuple. | No empty-infimum or rank-zero error. |
| Independence versus maximal rank | r=1,d=5,q=4 gives source 6, target 8, rank 6; surjectivity false and injectivity true. | New headline includes the overfilled range. |
| Critical counts and integer division | (r,d,q)=(3,6,21): 3·9+1=21·4−56=28; (7,4,42): 7·30+6=42·8−120=216. | Quotient/remainder convention fixed. |
| ProjectivelyDistinct | e₀,e₁: true; e₀,2e₀: false since e₀=(1/2)2e₀; empty: true; zero singleton: false; nonzero singleton: true. | New real-bodied predicate, excludes scalar duplicates and zero vectors. |
| Absolute smooth locus | Spec ℂ: tangent 0, dimension 0, smooth; Spec ℂ[ε]/ε²: tangent 1, dimension 0, empty smooth locus. | Reducedness retained in the imported theorem. |
| Relative generic-contact contract | Projection A²→A¹: differential [1,0], rank 1, kernel dimension 1=2−1; x↦x² at 1: rank 1, relative dimension 0; at 0: rank 0. | Precise source-open contract replaces the compound request. |
| Characteristic-zero boundary | Frobenius x↦x² over F₂ is dominant with differential 0 rather than rank 1. | Characteristic-zero binder essential for the relative conclusion. |
| Cartier-residual gap | Double origin in A³: length 4=1+3; transverse line length 2=1+1; tangent line 2=0+2. | Existing sheaf-level gap retained. |
| Plane-singular-incidence gap | F=(xy)² has degree 4, reduced C=(xy) degree 2 and 2C divisor degree 4; a line has parameter dimension 2 and contains two general points but not three. | Double containment and general-position bound are compatible. |
| finite-flat-sections gap | B=k×k, L=B: underlying k-module k²; after A=k[ε]/ε² base change: A²; after nonflat A→k: k². | Rank 2 preserved; arbitrary base change specified separately. |
| tangent-direction-incidence gap | A²: Ω has rank 2, direction fiber P¹, algebra k⊕kε; Spec k: Ω=0, parameter empty; A¹: one direction and length 2. | New gap excludes direction data without an ambient scheme. |
| Diagonal sign and quotient | d x=1⊗x−x⊗1; at first support 0, dx↦1 gives x↦ε; dx↦1,dy↦0 gives (y,x²), while dy↦1 gives (y−x,x²). | Positive derivative and cotangent quotient convention agree with jets. |
| Universal direction base change | k⊕kε with ε²=0 tensors to A⊕Aε, still ε²=0 and free of rank 2, even for a nonreduced A. | Base-change statement has the actual algebra and domain. |
| Mixed bad-incidence gap | e=0 gives rank<0, hence empty W; graph [s:t] has axis limits [0:1] and [1:0], two distinct exceptional points. | Existing domination requirement remains an explicit supplier obligation. |

### Every README target

The following table has one row for each of the 78 bold mathematical targets, in their final README order. The final column records any repair affecting that target; an unchanged target is marked by its actual computed instance rather than an unsupported assertion of correctness.

| Statement | Instances and computed values | Result / change |
| --- | --- | --- |
| Binomial count of bounded monomials | r=0,d=0: 1=1; extra variable also 1. r=0,d=2: 1 versus 3; r=d=2: 6 versus coordinate-box 9. | Corrected degree-zero negative control. |
| Dimension of bounded polynomials | r=2,d=2: six independent monomials, dimension 6=choose(4,2); d=0: dimension 1; r=0: dimension 1. | Values agree. |
| Coefficient coordinates | 2+3x² at d=3 ↔ (2,0,3,0); inverse sum 2+0x+3x²+0x³. | Both composites and zero coefficients agree. |
| Fixed-degree homogenization | H₂(1+x)=X₀²+X₀X₁; set X₀=1 gives 1+x; r=0 gives X₀^d; H₀(7)=7. | Uses existing supplier rather than reconstructing it. |
| Homogeneous forms and twisting sections | At d=2, x corresponds to X₀X₁ and its chart section is x; r=0 gives one section and polynomial coordinate. | Adapter preserves the trivialization. |
| Coefficient Gram form | G(x,y)=0, G(x,x)=1; G(2+x,2+x)=5; G(0,0)=0. | Positive on nonzero vectors, zero on zero. |
| First-jet algebra evaluation | At P=3, x² ↦ (9,6); at P=0, x ↦ (0,1), x² ↦ 0. | Scalar and infinitesimal parts agree with derivatives. |
| Kernel of one first jet | At P=0 in one variable, ax+b ↦ (b,a); x² ↦ 0. Kernel (x²), not (x), and every pair (b,a) is attained. | Both kernel inclusions and surjectivity tested. |
| Distinct point ideals and their powers | Over ℚ, x−(x−1)=1 and m₀²+m₁²=top; over ℤ, supports 0,2 give (x,2), quotient F₂. | Field hypothesis separates the negative model. |
| Squared union ideal | At 0,1 in A¹ the ideal is (x²(x−1)²); empty infimum squared is top; repeated 0,0 still gives (x²). | Distinctness is not silently assumed by the definition. |
| Double-point quotient comparison | x(x−1) at 0,1 has jets (0,−1),(0,1), is nonzero and squares to zero; both sides have dimension 4. | Multiplication and specified quotient map agree. |
| Length of distinct double points | One A² support: basis 1,x,y, dimension 3=1·3; no supports: dimension 0=0·3. | Length includes nilpotents. |
| Bounded first-jet evaluation | At origin in A²,d=1, 1,x,y give I₃; at d=0 gradients are 0. | Rank 3 versus rank 1 boundary. |
| Value projection | x at 0,1 gives (0,1); x at 0 gives value 0 and derivative 1; empty target has dimension 0. | Projection is the actual value map. |
| Derivatives of vanishing polynomials | At origin, x has derivative 1 and x² derivative 0; constant vanishing kernel is 0. | Kernel restriction does not force derivative zero. |
| Surjectivity through the value kernel | At one point,d=1: value rank 1 and derivative-on-kernel rank 1, total rank 2; d=0: ranks 1,0,total 1. | True↔true and false↔false. |
| Monomial first-jet matrix | At P=3, x² column (9,6); at P=0 columns 1,x give I₂; r=2,n=2,d=2 gives 6×6. | Native matrix dimensions and formulas agree. |
| Full row rank criterion | One A² origin,d=1: rank 3=target 3 and onto; d=0: rank 1<3 and not onto. | Both directions tested. |
| Well-poised double points | One support,d=1 true; d=0,r≥1 false; seven collinear plane supports,d=5 rank 11<21. | Generality is not every distinct tuple. |
| Restriction to projective double points | Homogenize x² to degree 2 and restrict at [1:3]: chart value 9, derivative 6 on both routes. | Homogenization supplier change preserves the square. |
| Restriction rank of a finite scheme | Double origin in A²: d=1 rank 3=3−0, d=0 rank 1=1−0; D=0 gives 0. | Kernel is inside D, not the ambient section space. |
| Restriction rank on disjoint unions | Simple supports 0,1 with constants: 1=1+0; with degree 1: 2=1+1. | Actual kernel of the first restriction is used. |
| Finite-scheme residual and trace | In A³: full double 4=1+3, transverse direction 2=1+1, tangent direction 2=0+2, empty 0=0+0. | Every listed length is recomputed. |
| Castelnuovo dimension bound | Double origin in A²,d=1: rank 3≥1+2=3; a transverse direction: 2≥1+1=2. | Mixed finite schemes fit the same sheaf sequence. |
| Ordinary Horace criterion | One double origin in P²,d=1,H through support: trace 2≤2, residual 1≤1, total rank 3=min(3,3). At d=0 the stated d≥1 excludes residual −1. | Matched inequality direction is used. |
| Independent subschemes | Double origin A²,d=1 rank 3; its x-direction rank 2 and simple support rank 1. Injective restriction on two simple A¹ supports for d=1 stays injective on three. | Both monotonicity directions tested. |
| Curvilinear criterion at one support | D=span(1,x) in an A² double has rank 2<3; its y-direction has rank 1<2. D=span(1,x,y) has ranks 3 and 2 on every direction. | True and false cases distinguish missing directions. |
| Curvilinear reduction | Two A¹ double supports at 0,1,d=3 give rank 4 and both length-two restrictions rank 2; d=0 gives rank 1<4 and rank 1<2 locally. | Both directions of the criterion agree. |
| Rank in flat point families | Matrix [t] has rank 1 at t=1 and rank 0 at t=0; matrix [0] has rank 0 at both. | Specialization decreases or preserves rank. |
| Proper limits of curvilinear failures | Moving (a,t), transverse vertical direction: length 2 at t=1 and t=0; special trace/residual 1,1. For A¹ direction parameter is P⁰, one point. | Direction gap now explicitly supplies this parameter. |
| Compatible bad-incidence specialization interface | e=0: rank<0 impossible. Two axes of graph [s:t] limit to [0:1] and [1:0], not one common direction. | Existing extra mixed-stratum hypothesis remains essential. |
| Exact integer rank witnesses | Det [[1,0],[0,101]]=101 has residue 0 and rational rank 2, so converse fails; nonzero residue 20 in the first new base gives rank 56. For F=X₀², ΣX∂F=2X₀². | Correct one-way lifting and Euler factor. |
| Quadrics with prescribed singular points | r=3,q=0,1,2,3,4 gives kernel dimensions 10,6,3,1,0=choose(5−q,2); q=5 remains 0. | Natural subtraction is used only within the stated range. |
| Low-degree near-exception ranks | Cubic ranks 9,10,20,30,35,120 and quartic ranks 12,15,32,35,65,70 from nonzero minors. | Every finite entry recomputed. |
| Veronese tangents and double-point conditions | At e₀,d=2 in P¹ the cone tangent is span(e₀²,e₀e₁), annihilator span(X₁²); for d=1 it is the full vector space and annihilator 0. | Nonzero degree and characteristic zero justify division by d. |
| Terracini span for the Veronese family | Rational normal conic,q=1: affine tangent rank 2; q=2: span rank 3 and projective secant dimension 2. Source dimensions 1,3; general fiber dimensions 0,1. | Incidence and affine/projective dimension shift specified. |
| Contact curve in the defective plane case | r=2,d=2,q=2: affine tangent-span rank 5<6; incidence dimension 5, secant dimension 4, fiber dimension 1. The line through supports has tangent containment and its double has degree 2. | Positive-dimensional projected contact, not nonreduced absolute smoothness. |
| Plane contact numerical reduction | d=5,…,12: floor(N/3)=7,9,12,15,18,22,26,30; maximal curve bounds 5,9,9,14,14,20,20,27. Only d=6 survives. | Source proof inequality recalculated. |
| Exact sextic plane critical ranks | q=9 gives 27=min(28,27); q=10 gives 28=min(28,30), residues 30,95. | Full-column and full-row cases both tested. |
| Plane interpolation input | Exceptional (d,q)=(2,2),(4,5) have ranks 5<6 and 14<15; degree-6 neighbors have ranks 27,28. | Exceptions excluded exactly. |
| Three-subspace cubic base rank witnesses | r=5,6,7: vector dimensions 3,4,5; pair intersections 0,1,2; triple intersections 0; ranks 56,84,120. | Added precise Lean headline and three Checks. |
| Three-subspace cubic recursion | At r=8 split ℚ⁹ into three 3-coordinate blocks and take the three codimension-three coordinate kernels: a containing cubic needs a factor from each block, dimension 3³=27; no degree-2 monomial can meet all three, dimension 0. | Residual quadric claim has an explicit witness; r=7 finite input rank 120. |
| Two-subspace cubic base rank witnesses | r=5: dimensions 3+3=6, containment kernel 36 and final kernel 0; r=7: 5+5−2=8, containment kernel 54 and final kernel 0. | Added precise Lean headline and three Checks. |
| Two-subspace cubic recursion | r=6: r−5=1 support from each list moves to the third space, leaving 3+3+3=9 kernel singularities; trace dimension r−3=3. r=8: r−5=3 and trace dimension 5. | Counting agrees with its two predecessor assertions. |
| One-subspace cubic base rank witnesses | r=5: ranks 10→55→56, transverse trace/residual 1,1; r=7: 35→120 with 7+8=15 supports. | Added exact value/derivative conditions and transversality. |
| One-subspace cubic recursion | r=8: on-space 9, outside 9, δ=3, trace η length 2; lower r=5 has 3 on-space, 6 outside, δ=2. Three on-space supports move to L∩M and six outside to M, leaving six supports on L and three outside; the kernel has six supports on each of L and M and three outside. | Remainder and count recursion agree. |
| Cubic critical-count remainder | r=3,5,7,8: q=5,9,15,18; δ=0,2,0,3; lengths 20,54+2=56,120,162+3=165 equal N(r,3). At P² the triangle cubic has value 1 at [1:1:1]. | Empty remainder is δ=0, not a point. |
| Cubic maximal-rank input | r=4,q=6,7,8: ranks 30,34,35 against bounds 30,35,35. | The seven-support exception stays excluded. |
| Quartic P⁵ critical rank | 21·6=126=choose(9,4); determinant residue 89 and rank 126. | Finite starting rank recomputed. |
| Horace trace-size inequality | (r,d,q)=(3,6,21): re+u=12≤21; (4,4,14): 20≤20; (10,4,91): 121≤220. | Includes the tight small case. |
| Horace residual-size inequality | Same triples: N(r,d−2)=35≤44,15≤15,66≤165 respectively. | No unsigned negative remainder is used. |
| Large-dimensional quartic residual bound | r=10,q=91,u=71,e=5 gives 15≥11; r=10,q=0 gives u=−29,e=4 and q−u−e=25≥11 as an integer numerical case. | Integer and critical-count scopes distinguished. |
| Nonnegative critical Horace data | (3,6,21): u=9≤21, Σ=11≥0; (7,4,42): u=30≤42,Σ=6≥0. | Finite support counts are nonnegative. |
| Mixed residual rank in degree d−1 | (3,6,21): rank 4·12−1=47, source 56, kernel dimension 9=u. | Rank/kernel identity agrees. |
| Injective residual restriction to H | Same data: eleven Σ doubles in degree 4 require 44 conditions on 35 coefficients, so the predecessor kernel is 0; multiplying by the hyperplane equation cannot give a nonzero restriction kernel. | Hypothesized maximal rank supplies injectivity. |
| Killing a residual system with simple points | Same residual: 9-dimensional kernel, 9 reduced Φ conditions; rank 47+9=56=N(3,5). A one-dimensional system span(1) is killed by one point, not zero points. | The support count equals the actual remaining dimension. |
| Underfilled trace with simple remainder | (3,6,21): ru+e=27+1=28=N(2,6); omit the simple remainder and rank is 27. | Selected subcollections retain independence. |
| Moving supports and hyperplanes | A²: at t=0 and 1, ideals (x−a,y−t)² give length 3; restricted ideals (y−t,(x−a)²) give length 2. | General pushforward and direction contracts separated. |
| Transverse curvilinear limit rank | Same critical data with f=1,g=0: residual 9+44+1=54, trace 27+1=28; total 82=4·20+2. | Subscheme independence, no extra rank beyond the filled residual. |
| Tangent directions in the moving residual | Same data,f=0,g=1: residual 9+44+2=55, trace 27; total 82. | Off-H direction contributes length 2, not 1. |
| Underfilled differential Horace contradiction | Both splittings above give rank ≥82; bad incidence requires rank ≤81. | Contradiction uses the existing mixed-incidence gap. |
| Overfilled partial-length reduction | r=7,d=4,q=42: u=30,e=6,ν=0 gives 36·8+6·7=330=N; r=8,d=6,q=334: u=214,e=7,ν=4 gives 327·9+4·9+3·8=3003=N. | Both zero and positive partial-trace remainders tested. |
| Overfilled differential Horace contradiction | First data: restricted directions force F empty, G size 6; residual 30+48+12=90, trace 210, sum 300; failure rank <288+12=300. | Uses selected trace, not full Γ. |
| Differential Horace induction step | r=3,d=6,q=21 has predecessor triples (2,6,9),(3,5,12),(3,4,11); expected ranks 27,48,35. Result has rank 84=21·4. | Predecessors are explicit and outside exceptions. |
| Univariate Hermite interpolation | F₂,F₃,F₅, all distinct tuples using 0,…,n−1 for n≤field size and d=0,…,11: every computed rank equals min(d+1,2n); n=0 gives 0. | No factorial invertibility assumption. |
| Quartic P⁷ ordinary Horace input | With u=30, trace 30·7=210=N(6,4); q=41 residual 328−210=118≤120; q=42 residual 336−210=126≥120. | Matched directions in both branches. |
| Quartic induction inputs | r=6: (q,u,e,Σ)=(30,21,0,9); r=8: (55,41,2,12); r=9: (71,54,4,13),(72,55,5,12). | Numerical schedule recomputed. |
| Exception-avoiding induction schedule | r=3,d=5,q=14: predecessors (2,5,7),(3,4,7),(3,3,7); r=4,d=5,q=25: (3,5,13),(4,4,12),(4,3,9). None is exceptional. All d=5,6 critical predecessors for r=3,…,13 were tested. | No quadratic or quartic exception enters these inputs. |
| Generic characteristic-zero double-point rank | r=1,d=5,q=0,1,2,3,4: ranks 0,2,4,6,6=min(6,2q); r=0,q=2 cannot be injective. | Added full affine headline, retaining r≥1. |
| Passing to the dense affine chart | Homogeneous support [1:a] gives x(P)=a; H₂(x)=X₀X₁ at [1:3] has chart jet (3,1), exactly the affine x jet. | Rank comparison uses the actual chart. |
| Universal first-jet matrix | r=n=d=1 gives [[1,T],[0,1]], det 1; x² column specialized at 3 is (9,6). | Universal and specialized entries coincide. |
| Degree of a first-jet minor | One-point linear minor: degree 0≤2d; two-support cubic minor (b−a)^4 has total degree 4≤12 and degree 4 in each variable; zero minor has totalDegree 0. | Degree bound established before its grid consumer. |
| Principal-open full-jet locus | Δ=1: all points and full linear jets; Δ=(b−a)^4: equal supports give 0 outside D, supports 0,1 give 1 inside D. | Native openness stays in README; redundant Lean conjunct deleted. |
| Bounded integer specialization | r=n=1,d=5: B=10 and Δ=1 at P=0; n=0,d=0: empty determinant 1 and empty grid assignment; r=0,n=1: one constant column gives 1. | Arbitrary-minor theorem precedes endpoint. |
| Nonzero maximal minor | At r=n=1,d=5 columns 1,x give integer Δ=1 and value 1 at 0 over every characteristic-zero field. | Correctly depends on the earlier grid theorem. |
| Generic affine Hermite interpolation | Same Δ=1: D(1)=whole affine line; at P=0 the bounded jet rank is 2 and arbitrary two-entry jets are attained. | Explicit nonzero-minor dependency added. |
| Polynomial parameter pullback | r=1,n=2,d=3, θ=(0,u): Δ∘θ=u⁴, degree 4, grid 0,…,4 has u=1 with value 1. Constant θ=(0,0) gives 0, excluded by nonvanishing. Empty parameter set and Δ=1 give value 1. | Nonzero-pullback hypothesis cannot be omitted. |
| Special collinear configurations fail | Seven (i,0),d=5: value/x slice rank 6, normal-derivative slice rank 5, total 11<21. | Recomputed, consistent with generic rather than universal claim. |

### Every API bullet

These rows follow the 45 API bullets in README order. Each equality or equivalence is tested on the stated object; no additional Lean API lemmas are introduced.

| API statement | Computed instance | Result / change |
| --- | --- | --- |
| Coefficient extraction | f=2+3x²,d=3: c(f)(2)=3=coeff₂(f). | Equality agrees. |
| Coordinate inverse | Tuple (2,0,3,0) sums to 2+3x². | Inverse has the actual coefficients. |
| Coordinate injectivity iff | f=2+x,g=2+x: equal tuples (2,1); f=2+x,g=2−x: tuples (2,1) and (2,−1) differ. | Both directions and a nonexample. |
| Homogenized monomial | x at degree 2 maps to X₀X₁, slack 2−1=1. | Supplier adapter preserves slack. |
| Dehomogenization inverse | X₀²+X₀X₁ at X₀=1 gives 1+x; rehomogenization gives the original form. | Both composites. |
| Multiplication across degrees | H₂((1+x)²)=X₀²+2X₀X₁+X₁²=H₁(1+x)²; H₂(x·x)=X₁². | Degree sum 1+1=2 matters. |
| Gram coefficient formula | G(2+x,3−x)=6−1=5. | Coefficient sum agrees. |
| Gram positivity | G(2+x,2+x)=5>0; G(0,0)=0. | Nonzero hypothesis matters. |
| Isometry and integer coordinates | c(2+x)=(2,1), norm √5 on both sides, both coordinates integral. | Transport agrees. |
| Jet value | x² at 3 has scalar part 9. | Equals evaluation. |
| Jet differential | x² at 3 has infinitesimal coefficient 6; constant 7 gives 0. | Native derivative normalization. |
| Jet variable | At P=3, x maps to (3,1). | Scalar-plus-basis-infinitesimal formula. |
| Squared union formula | P=(0,1) gives ((x(x−1)))²=(x²(x−1)²). | Uses square after intersection. |
| Intersection of squared point ideals | At 0,1 over ℚ, (x²)∩((x−1)²)=(x²(x−1)²). | Field CRT hypotheses hold. |
| Ideal permutation | P=(0,1) and (1,0) both give (x²(x−1)²). | Identical ideals. |
| Quotient-map formula | Class of x at 0,1 maps to (0,1),(1,1). | Specified jets, not an unmarked equivalence. |
| Quotient multiplication | At P=0, x·x has jet (0,1)²=(0,0), equal to jet(x²). | Nonreduced algebra law. |
| Quotient factor permutation | Swapping 0,1 sends ((0,1),(1,1)) to ((1,1),(0,1)). | Same as recomputing jets. |
| Bounded None coordinate | x² at 3 gives 9=3². | Value row agrees. |
| Bounded Some coordinate | x² at 3 gives 6=2·3. | Derivative row agrees. |
| Bounded monomial column | At 3, α=0 gives (1,0), α=1 gives (3,1), α=2 gives (9,6). | No division at α=0. |
| Value map evaluation | x at 0,1 gives (0,1). | Native evaluation. |
| Value as projection | Jets of x at 0,1 are ((0,1),(1,1)); None projection is (0,1). | Product projection agrees. |
| Value kernel iff | At 0, x has value 0 and is in kernel; 1 has value 1 and is outside. | Both directions/nonexample. |
| Derivative on value kernel | At 0, x has derivative 1, x² has derivative 0. | Value vanishing does not force singularity. |
| Derivative as projection | For x at 0 the Some projection of (0,1) is 1. | Restriction and projection commute. |
| Derivative permutation | f=x(x−1), supports 0,1: derivative vector (−1,1); swapped supports give (1,−1). | Same coordinate permutation. |
| Matrix value entry | x² column at 3 has None entry 9. | Monomial evaluation. |
| Matrix derivative entry | Same column has Some entry 6; constant column has 0 even at P=0. | Zero exponent branch tested. |
| Matrix-vector evaluation | At P=3,d=1, [[1,3],[0,1]]·(2,1)=(5,1)=J(2+x). | Representation equality. |
| Well-poised iff | One A¹ support,d=1: surjective and true; d=0: not surjective and false. | True↔true and false↔false. |
| Well-poised permutation | Supports 0,1,d=3: both orders give rank 4. | Invertible target permutation. |
| Well-poised degree monotonicity | Same supports,d=3 and d=4 give ranks 4 and 4, target dimension 4. | Larger degree preserves surjectivity. |
| Restriction rank-nullity | Double origin A²,d=1: rank 3=3−0; constants: 1=1−0. | Kernel is in the stated system. |
| Restriction rank bound | Same double point: constants give 1≤min(1,3)=1; D=0 gives 0≤min(0,3)=0. | Both dimension bounds. |
| Empty restriction rank | For constants and D=0 on the empty scheme, ranks are 0. | Empty target, not zero source. |
| Projective support nonzero | Singleton e₀: true with norm-coordinate 1; singleton 0: false. | New nonzero clause checked. |
| Projective rescaling | e₀,e₁ and 2e₀,3e₁ both have pair rank 2; a zero multiplier gives a zero vector and fails. | Nonzero multipliers are necessary. |
| Integral proportionality | Integral e₀,2e₀ become rationally proportional by 1/2 and fail distinctness; e₀,e₁ have rank 2 and pass. | Clarified the added API wording during its adversarial pass. |
| Family origin | δ(t)=(a,t),H_t=(y=t): at 0 both give γ=(a,0),H=(y=0). | Parameter direction agrees. |
| Constant family ranks | At t=0 and 1, basis 1,x−a,y−t has length 3; its hyperplane quotient has basis 1,x−a, length 2. | Nilpotents retained. |
| Family arbitrary base change | t=s² gives ideal (x−a,y−s²)² by substitution and by pullback, still length 3. | No parameter-flatness assumption. |
| Universal specialization | Universal x² column at T=3 is (9,6), the specialized firstJetMatrix column. | Exact agreement. |
| Universal value product | α=2,T=3 gives 9; α=0 gives empty product 1. | Includes the constant monomial. |
| Universal derivative product | α=2,T=3 gives 6; α=1,T=0 gives 1; α=0 gives 0. | Includes zero coordinates and zero exponents. |

### Every individual README Check

The Check numbers below mean the successive bullets inside Checks blocks in the final README, including the two supplier blocks. They are not roadmap target identifiers.

| Check | Values recomputed | Result / change |
| --- | --- | --- |
| 1 | Dual numbers: Krull dimension 0, tangent dimension 1; Spec ℂ: 0,0. | New nonreduced negative control. |
| 2 | A²→A¹: rank 1, kernel dimension 1=2−1. | New relative-dimension witness. |
| 3 | d(x²) at x=1 is 2, at 0 is 0; over F₂ it is 0 everywhere. | New characteristic-zero boundary. |
| 4 | Quotient dx↦1,dy↦0: x↦ε,y↦0, kernel (y,x²); dy↦1: kernel (y−x,x²). Both algebras have basis 1,ε. | New direction convention witness. |
| 5 | Rank Ω=0 gives no nonzero line quotient and empty parameter; rank 1 gives P⁰, one direction of length 2. | New zero-dimensional boundary. |
| 6 | k×k as k-module: dimension 2; after A=k[ε]/ε²: A² of rank 2; back to k: dimension 2. | New nonflat base-change witness. |
| 7 | d=0 counts 1 and 1; d=2 counts 1 and 3. | Repaired universal negative claim. |
| 8 | d=0: unique zero exponent, cardinality 1=choose(r,0). | Positive boundary only. |
| 9 | Six exponents have slack 2,1,1,0,0,0 and total 6, versus separate bounds giving 9. | Count convention discriminates. |
| 10 | 1,x,y,x²,xy,y²: six coefficient coordinates. | Basis size 6. |
| 11 | d=0,C7: unique coefficient 7. | Constant coefficient recovered. |
| 12 | 2+3x²,d=3: coefficients (2,0,3,0). | Internal/trailing zeros retained. |
| 13 | H₂(1+x)=X₀²+X₀X₁; coefficient of X₀² is 1, versus 0 in 1+X₁ over ℤ. Both become 0 in the zero ring. | Supplier adapter and nontriviality agree. |
| 14 | H₀(7)=7; r=0,H₂(1)=X₀²; H₀(1)=1. | Recomputed supplier boundary. |
| 15 | X₀X₁ at X₀=1 gives x, total degree 1≤2. | Degree may drop under dehomogenization. |
| 16 | G(x,y)=0 and G(x,x)=1. | Orthonormal convention. |
| 17 | G(C2,C3)=6. | No extra normalization. |
| 18 | 2+x: integer tuple (2,1), squared norm 4+1=5. | Lattice and metric agree. |
| 19 | Origin jet of x: (0,1), nonzero over ℚ; zero in the zero ring. | Nontriviality explicit. |
| 20 | Jet of C3: (3,0) at every P. | Infinitesimal part zero. |
| 21 | Origin jet of x²: 0; x² mod x³: nonzero. | Wrong jet order excluded. |
| 22 | Over ℚ, (x²) is properly contained in (x); over zero ring both are zero. | Correct ring boundary. |
| 23 | Empty infimum top, square top, quotient dimension 0. | No empty-union error. |
| 24 | x² mod (x²)=0; x² mod (x³)≠0 over a nontrivial ring. | Square is not cube. |
| 25 | (x)+(x−2)=(x,2) in ℤ[x], quotient F₂ and 1≠0. | Ring distinctness does not imply CRT. |
| 26 | At P=(a,b), quotient basis 1,x−a,y−b, dimension 3. | Full first jet retained. |
| 27 | Empty quotient and product each have vector dimension 0. | Zero-ring algebra case. |
| 28 | x(x−1) has jets (0,−1),(0,1), hence nonzero; squared jets are 0. | Reduced quotient is wrong. |
| 29 | At origin, 1,x,y give I₃ and rank 3. | Evaluation and two partials. |
| 30 | At d=0,r≥1,n=1, rank 1<r+1 over a field; derivative target coordinate 1 is unattainable over every nontrivial ring. | No false zero-ring negative. |
| 31 | x² at 3: (9,6). | Derivative factor 2 present. |
| 32 | x at 0,1: values (0,1). | Correct value order. |
| 33 | n=0: target dimension 0 and kernel equals the whole bounded source. | Empty-map convention. |
| 34 | x at 0: value 0, derivative 1. | Value kernel differs from jet kernel. |
| 35 | x in degree-1 value kernel maps to derivative 1. | Restricted map can be onto. |
| 36 | One support, constants: evaluation C a↦a injective, kernel 0. | No spurious vanishing constants. |
| 37 | x² is nonzero with value 0 and derivative 0 at origin. | Restricted map need not be injective. |
| 38 | Columns 1,x at origin give I₂, det 1. | Two jet rows, not one. |
| 39 | d=0: column entries 1 for values and 0 for partials. | Exponent-zero branch. |
| 40 | r=2,n=2,d=2: 2·3=6 rows and choose(4,2)=6 columns. | Shape 6×6. |
| 41 | One support,d=1: rank r+1=target dimension. | Well poised. |
| 42 | One support,d=0,r≥1: rank 1<r+1. | Not well poised. |
| 43 | Seven collinear plane supports,d=5: rank 11<21=choose(7,5). | Genericity boundary. |
| 44 | Simple point,constants: restriction rank 1. | Length one. |
| 45 | Zero subsystem: restriction rank 0 even for a length-three double point. | Source subsystem matters. |
| 46 | One double point,d=1: rank r+1; at r=2 this is 3. | Matrix/section rank agreement. |
| 47 | Double origin A³: basis 1,x,y,z has length 4; trace basis 1,x,y length 3; residual basis 1 length 1. | 4=1+3. |
| 48 | (x,y,z²): full basis 1,z length 2; trace/residual each basis 1 length 1. | 2=1+1. |
| 49 | (y,z,x²): trace basis 1,x length 2; residual empty length 0; empty scheme 0=0+0. | Residual and trace order fixed. |
| 50 | δ(t)=(a,t), vertical direction: length 2 at t=1 and 0; at 0 trace and residual lengths 1,1. | Flat limit retains length. |
| 51 | Mixed tuple ((a,0),(b,t)),t≠0: residual lengths 1,2 and trace lengths 1,0; total 4=3+1. | Mixed indices contribute differently. |
| 52 | s=0,t→0 gives [0:1]; t=0,s→0 gives [1:0]; the two projective points are distinct. | Properness does not identify limits. |
| 53 | e=0 gives inequality rank<0, with no solutions. | Empty W retained. |
| 54 | Pair e₀,e₁ has rank 2 and no scalar equality. | New projective-distinctness positive model. |
| 55 | e₀=(1/2)(2e₀), pair rank 1 despite vector inequality. | New scalar-duplicate negative model. |
| 56 | Empty family true; zero singleton false; e₀ singleton true. | New zero/nonempty boundaries. |
| 57 | r=5: dims 3, pair intersection 0, triple 0; ranks 30→56. | New finite-base Check. |
| 58 | r=6: dims 4, pair intersection 1, triple 0; ranks 57→84. | New finite-base Check. |
| 59 | r=7: dims 5, pair intersection 2, triple 0; ranks 93→120; pre-singularity kernel dimensions 26,27,27 for all three cases. | New omitted-condition negative control. |
| 60 | r=5 two spaces: containment rank 20, kernel dimension 36, final rank 56. | New finite-base Check. |
| 61 | r=7 two spaces: containment rank 66, kernel dimension 54, final rank 120. | New finite-base Check. |
| 62 | Without outside supports, at most 18 or 30 normal conditions leave kernels at least 36−18=18 or 54−30=24. | New omitted-support negative control. |
| 63 | r=5 one space: ranks 10→55→56; value at Q adds 0, transverse derivative adds 1. | New remainder Check. |
| 64 | Transverse η has algebra ℚ⊕ℚε and trace ℚ, giving length 2 and trace 1; tangent η has trace length 2 and derivative adds 0. | New transversality negative control. |
| 65 | r=7 one space: containment 35, final rank 120; counts 7=42/6 and 8=r+1. | New finite-base Check. |
| 66 | δ(0)=(a,0),H₀=(y=0); δ(1)=(a,1),H₁=(y=1). | Actual family fibers. |
| 67 | Double ideal at t=0 has basis 1,x−a,y and length 3, not 1. | Nonreduced special fiber. |
| 68 | Hyperplane restriction kills y−t and leaves basis 1,x−a, length 2. | Correct restricted double. |
| 69 | r=1,d=5,q=0,1: ranks 0,2 equal min(6,0),min(6,2). | New endpoint boundaries. |
| 70 | Supports 0,1,2,3,d=5: rank 6=min(6,8); no onto map from dimension 6 to 8. | New overfilled Check. |
| 71 | r=0,q=2: only the empty-coordinate point exists, so both supports equal; evaluation rank is 1. | New excluded-dimension Check. |
| 72 | [[1,T],[0,1]] has determinant 1. | Universal matrix convention. |
| 73 | d=0: derivative of constant monomial is 0. | Zero-degree boundary. |
| 74 | Universal x² column at 3: (9,6). | Specialization consistency. |
| 75 | Selected columns 1,x: determinant 1. | Positive determinant witness. |
| 76 | Swapped columns x,1: determinant −1. | Sign witness. |
| 77 | Two equal supports: determinant 0; ordered supports 0,1 and columns 1,x,x²,x³: determinant 1. | Repeated-support and sign checks agree. |
| 78 | At origin, eval(T)=0 and eval(1)=1, so T is in the prime and 1 is outside. | Proper prime kernel. |
| 79 | At supports 0 and 1, kernels (T),(T−1); eval₀(T)=0,eval₁(T)=1. | Evaluation points differ. |
| 80 | nr=0: polynomial algebra k, identity evaluation kernel 0, unique spectrum point. | No spurious coordinate. |

## Maintainer consequences

New headline names are threeSubspaceCubicBases, twoSubspaceCubicBases, oneSubspaceCubicBases and genericDoublePointRank. The only new supporting definition is ProjectivelyDistinct. No earlier declaration is deleted or renamed. genericAffinePrincipalOpen loses only its redundant IsOpen conjunct, so a consumer destructuring that conjunction must omit that field and use basicOpen.isOpen if needed.

The supplier additions are DiophantineApproximationAndTranscendence §2.7 and gap:tangent-direction-incidence, with narrower, explicit needs for generic-contact and finite-flat-sections. The new gap is not a proposed declaration asserted to exist in another package. Its source/target, quotient convention and base-change scope are recorded here; supplier delivery remains outside this package. The scope statement, §0.2, §2.4, §3.2, §3.3, §4.8, Layer 5 order, dependencies and module docstring were searched together so that the repaired patterns agree throughout.
