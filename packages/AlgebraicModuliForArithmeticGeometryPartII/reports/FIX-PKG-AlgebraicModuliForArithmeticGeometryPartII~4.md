# Repair report

## F01 (P2) — applied

README §4.5: unqualified E² = −1 → E² = −[κ(x):k], with the real degree-two blow-up and full geometric pullback computed separately. Section 1.5 now specifies a rational centre; the Aₙ Check specifies an algebraically closed field. The arbitrary-field negativity theorem, §4.3's rational example and §5.7's residue-field degree 1 remain unchanged.

## F02 (P2) — applied

README §2.6: all étale group schemes → commutative étale group schemes and discrete abelian groups with continuous Galois action. Added SchemeAndStackFoundations §2.15 `etale_galois_comparison` to both the supplier contract and Needs. Added the constant C₃/S₃ comparison, including characteristic 3. No restriction on the acting Galois group and no second equivalence construction were introduced.

## F03 (P3) — applied

Deleted the redundant constants-algebra substitution in §2.2 and the general rational-point assertion from §2.6's Checks. Split §2.5 into separate projective-line, elliptic and classical Enriques Checks, retaining the ordinary characteristic-two example. Added precise Enriques locators using the existing SCH23 manifest key. Check counts are five, four and six respectively; §2.6 includes F02's additional comparison.

## Evidence and pattern search

The repaired package is `packages/AlgebraicModuliForArithmeticGeometryPartII/`. No Lean declaration changes are needed: the findings concern prose Checks and the application of an imported equivalence. `packages/AlgebraicModuliForArithmeticGeometryPartII/Suggested.lean` still has seven definitions with real bodies and seven admitted headline theorems.

- F01: LIP69 line 1113 defines intersection by degree on the curve; LIP69 line 1121 retains the constants-field divisibility. LIP69 line 1167 is the negative-definiteness theorem, which is unaffected by multiplying degree by a positive residue degree. At a regular closed point the associated graded ring of the maximal ideal is κ(x)[a,b]. Its Proj is E = P¹ over κ(x), and the tautological ideal of E restricts to O(1); hence O(E) restricts to O(−1). The two Euler characteristics over κ(x) are 0 and 1; over k they are 0 and [κ(x):k]. This proves the corrected formula without a separability assumption.
- The degree convention is the same in Conventions, §0.1, §0.2 and §4.3. The search for blow-ups, exceptional squares, negative-one curves and residue degrees also covered §§0.5–0.6, 1.5, 3.1, 3.3, 4.3–4.10, 5.7 and the worked examples. Section 1.5 had another unqualified value −1 and is repaired. The other negative-one values either specify rational centres or refer to individual geometric components. The Aₙ matrix Check is qualified to avoid the same implicit ground-field assumption. Section 5.7 computes over κ(x), so its value 1 is correct; over k that value would be [κ(x):k].
- F02: SCH23 lines 174–188 identify this particular quotient and its geometric free lattice. `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3872`–3877 explicitly treats abelian sheaves and discrete Galois modules. Its named target is a roadmap promise, not a pinned theorem. The revised application consumes that promise. Searching the package for étale-group equivalences and Galois modules found the categorical overstatement only in §2.6; the supplier contract and Needs now fix its domain everywhere it is consumed.
- The C₃ test uses the constant scheme, a disjoint union of three copies of Spec k, even in characteristic 3. It does not use μ₃, which is nonreduced in that characteristic. Composition of permutations is right to left; the two displayed S₃ products are different. An abelian coefficient group does not imply an abelian Galois group.
- F03: SCH23 line 313 supports the full constants algebra and its units; the remaining five §2.2 examples distinguish k, ℂ, a finite affine algebra, a product and a nonreduced algebra. KLE05 lines 2701–2753 support the torsion component and its proper extension. SCH23 lines 526–533 give the canonical class of order two away from characteristic 2, and SCH23 lines 543–551 give the ordinary μ₂ case. Only SCH23's locator list changed in `packages/AlgebraicModuliForArithmeticGeometryPartII/sources.toml`; its key and retrieval record are retained.
- The whole-package Check search covered the earlier affected §§0.4, 2.7 and 5.9 as well as §§2.2, 2.5 and 2.6. The three identified residual passages are corrected. No Check was turned into a Lean declaration. The projective-line class, the elliptic degree-zero component, canonical two-torsion and the nonreduced μ₂ component are now separate bullets rather than one combined bullet.

## Sources, suppliers and ownership

Read the main-branch `TauCetiRoadmap/JacobianChallenge/README.md` and `TauCetiRoadmap/StableReduction/README.md` for the upstream shape. Read SchemeAndStackFoundations on main, and the supplied roadmap service's heads of AlgebraicModuliForArithmeticGeometry, ComplexComparisonPartII, AbundanceStatement and ResolutionOfSingularitiesCharacteristicZero. Also checked the main-branch AlgebraicVectorBundles and EtaleCohomologyFoundations contracts.

The citation pass resolved the cross-roadmap references without a missing roadmap or section. The following table records the substantive domains, including the newly explicit input. Supplier extensions remain explicit gaps rather than assertions that another roadmap already states them.

| Supplier | Locations checked | Contract retained |
| --- | --- | --- |
| SchemeAndStackFoundations | §§0.9, 0.11, 0.23; Layer 1; §§2.1–2.2, 2.6, 2.10–2.11, 2.15, 2.22 | Limits, descent, spaces, cohomology, flat base change, small-étale abelian pushforward and field comparisons; §2.15's abelian domain is explicit. |
| SchemeAndStackFoundations | §3.5; §§4.9–4.10, 4.12; §§5.2–5.3, 5.9–5.10 | Norms, Stein factorization, formal existence, Chow covers, intersections with residue degrees and the smooth projective surface numerical quotient. |
| AlgebraicModuliForArithmeticGeometry | §§1.4–1.6, 2.1; Layer 3; §§7.3, 7.6.1–7.6.1a, 7.9 | Projective parameter spaces, bounded supports, Picard sheafification, rigidification, infinitesimal lifting and components; proper-Hilbert and nonflat-Picard extensions remain gaps. |
| ComplexComparisonPartII | §§C3.2d.2, C3.2d.4, C3.2e, C3.2f.1–C3.2f.2 | Universal-functions representability and obstruction; the projective flat geometrically integral torsion component; full identity-component structure. No arbitrary proper-field representability is inferred from the narrower statements. |
| JacobianChallenge | Layers A–D | Curve degrees, coherent finiteness and the projective geometrically integral Picard application. |
| StableReduction | Layers 1, 2 and 4, including J-A2 | Nodal graphs, degree, relative Proj, scheme ampleness openness, stronger universal contraction descent and regular-model intersections. |
| AlgebraicVectorBundles | L0A–L0C, L1A–L1B | Tensor and dual operations, finite locally free operations and relative Spec; no reconstruction here. |
| AbundanceStatement | Layers 4A–4D and 5 | Characteristic-zero projective degree, numerical spaces, cones, ampleness and semiampleness. |
| EtaleCohomologyFoundations | §F.3 | Proper finite-coefficient finiteness with invertible annihilator; no assertion at the residue characteristic. Its surface intersection example also gives a degree-d exceptional square −d. |
| ResolutionOfSingularitiesCharacteristicZero | §7.8 | Projective regular resolutions over characteristic-zero fields, with smooth source. Positive-characteristic resolution existence is not assumed. |

The citation lead `Num.free_finiteRank` is present in SchemeAndStackFoundations §5.10 at README lines 7206 and 7220; it is correctly cited as a supplier target, not a pinned declaration. The resolver's printed index identifies main as 20b02f6; direct main-file checks above used the supplied content checkout at 198a2803. No missing-citation conclusion rests on the index alone.

Ownership searches used `roadmaps grep` over the indexed main/open-head corpus and `rg` over board packages, by the objects (étale abelian groups, Galois modules and exceptional intersection degrees). The generic equivalence remains with SchemeAndStackFoundations. This package owns only its numerical-Picard application and the existing geometric descent targets. No generic construction, supplier target, downstream dependency or declaration name was added. The source texts needed for the repairs were already legally cached; no additional source request is needed.

Mathlib and Tau Ceti checkout revisions equal `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. At those pins:

- `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean:41` defines properness using separation, universal closedness and local finite type, without flatness or nonemptiness.
- `TauCeti/AlgebraicGeometry/LineBundle/Degree.lean:70` defines Euler degree by the degree-two truncated Euler characteristic difference. Proper coherent finiteness and curve dimension justify its use here; the definition alone asserts neither.
- `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/EulerCharacteristic.lean:343` gives tensor additivity in its proper integral-curve setting with local DVR and finite-dimensional H¹ hypotheses. It is not silently applied as a theorem on arbitrary singular curves.
- Object searches in the pinned algebraic-geometry trees do not supply the new categorical equivalence as a library declaration; the named supplier contract is required. Native line bundles, their pullbacks, fibres, quotients and simple graphs suffice for the unchanged acceptance signatures.

## Computed adversarial pass

These are calculations and separating instances, not proofs from a finite test set. Each row specifies a statement or defining law, its inputs, actual values, and the disposition. All changed statements and their consumers are included; the unchanged layers are recorded to expose normalization and boundary interactions. No computational algorithm is added to the roadmap.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: Euler degree sign | P¹, O(−1), O, O(1) | χ = 0, 1, 2; χ(L)−χ(O) = −1, 0, 1 | Positive and negative signs agree | None |
| Conventions: restriction of scalars | P¹_ℂ over ℝ | χ_ℝ(O(1))−χ_ℝ(O) = 4−2 = 2 = 2·1 | Constants degree retained | None |
| Conventions: full base change | Same curve extended to ℂ | Two degrees 1+1 = 2 | Full pullback preserves degree | None |
| Conventions: zero-dimensional components | Spec k and empty scheme | χ(L)−χ(O) = 1−1 = 0 and 0−0 = 0 | Rank zero allowed | None |
| Conventions: positive exponents | Swap action on ℤ² | 0·(1,0) = (0,0) is fixed; d·(1,0) = (d,0) is not fixed for d > 0 | Zero exponent would trivialize the criterion | None |
| §0.1 tensor additivity | P¹, O(2) and O(−3) | deg O(−1) = −1 = 2+(−3) | Additive | None |
| §0.1 inverse and powers | P¹, O(2) | deg O(−2) = −2; deg O(6) = 6 = 3·2 | Signs and power index agree | None |
| §0.1 generic-length law | Double line, O(1) | χ = 4 versus 2 for O; degree 2 = 2·1 | Reduction alone would give 1 | None |
| §0.1 finite pullback | Degree-two map P¹ → P¹ | deg f*O(1) = 2 = 2·deg O(1) | Positive field-degree factor | None |
| §0.2 geometric factor | P¹_ℂ/ℝ; purely inseparable constants of degree p | mr = 1·2 = 2 and p·1 = p; degrees 2 and p | Separability is unnecessary | None |
| §0.2 geometric versus arithmetic index | Pointless real conic | mr = 1, closed-point index 2, generator degree 2 | The two indices differ | None |
| §0.3 field-extension equivalence | P¹_ℝ, O(m), m = −1, 0, 1 | Degrees remain −1, 0, 1 on P¹_ℂ; zero iff m = 0 on both | Both directions survive | None |
| §0.3 inseparable field extension | P¹ over inseparable constants, p = 2, 3 | Full degree pm = sum of p reduced degrees m; pm = 0 iff m = 0 | Multiplicity does not hide nonzero degree | None |
| §0.4 absolute predicate | P¹, O(m) | Reduced test curve degree m; predicate holds exactly at m = 0 | Real-body definition identifies the kernel | None |
| §0.4 relative predicate | First projection P¹×P¹ → P¹, O(a,b) | Fibre degree b; absolute degrees a,b | Relative kernel ℤ×0 differs from absolute kernel 0 | None |
| §0.4 subgroup | Same projection, O(2,0), O(−3,0) | Degrees 0+0 = 0; inverse degree −0 = 0 | Kernel closed under the group laws | None |
| §0.4 pullback from base | O(a) on base P¹ | Fibre restriction O(a,0) has degree 0 | Pullback lies in kernel | None |
| §0.4 trivial versus numerically trivial | Elliptic curve, distinct P,Q | deg O(P−Q) = 1−1 = 0; Picard class P−Q ≠ 0 | Trivial sheaf is too restrictive a model | None |
| §0.5 closed-fibre test | P¹_R, O(m) | Generic and special degrees m = m | Correct specialization direction | None |
| §0.5 generic-only negative control | Blow-up of rational special point on P¹_R | O(E) generic degree 0, exceptional degree −1 | Generic-only condition fails | None |
| §0.6 proper-surjective detection | Bl_p P² → P², p rational | Pullback O(1) has degrees 0 on E and 1 on a line avoiding p | Contracted curve alone cannot detect the class | None |
| §1.1 quotient and its generated kernel | P¹; projection; identity | ℤ/0 = ℤ; ℤ²/(ℤ×0) = ℤ; Pic(S)/Pic(S) = 0 | Quotients name actual numerical groups | None |
| §1.1 torsion-freeness | Degree lattice ℤ and canonical Enriques class | nm = 0 implies m = 0 for n ≠ 0; canonical class has numerical value 0 | Picard torsion is removed by the kernel | None |
| §1.1 rational Cartier scaling | P¹, D with degrees 2 and 4 for 2D and 4D | 2/2 = 4/4 = 1 | Choice of positive Cartier multiple cancels | None |
| §1.1 pullback injectivity | Blow-up, base class O(1) | Image pairs 1 with a strict line | Nonzero base class remains nonzero | None |
| §1.2 finite-free headline | Empty, point, P¹, P¹×P¹ | Numerical ranks 0, 0, 1, 2 | No nonemptiness or positive-rank premise | None |
| §1.2 étale rank bound | Point and P¹ over algebraically closed k, ℓ invertible | 0 ≤ dim H² = 0; 1 ≤ dim H² = 1 | Coefficient domain retained | None |
| §1.2 elliptic-product ranks | End(E) of ℤ-rank 1, 2, 4 | ρ(E×E) = 2+1, 2+2, 2+4 = 3,4,6 | Supersingular value is retained | None |
| §1.3 relative finite-free headline | P¹×P¹ over k, over first P¹, over itself | Ranks 2,1,0 | Relative rank can vanish | None |
| §1.3 componentwise detection | Two disjoint lines, O(1) and O(−1) | Total Euler polynomial 2n+2 equals that of O; degree vector (1,−1) ≠ (0,0) | Existing supplier gap is essential | None |
| §1.3 Noetherian boundary | P¹ over Spec ∏k | Indicator degree sequences e₁,…,e_r give rank at least r for every r | Finite generation would fail without the hypothesis | None |
| §1.4 curve pairing | P¹×P¹, divisor (a,b), two rulings | Evaluations b and a; pairing matrix [[0,1],[1,0]] has determinant −1 | Map direction and duality agree | None |
| §1.4 curve cone | Same surface; first projection; identity | ℝ² nonnegative quadrant; ℝ nonnegative ray; {0} | Empty generator set yields zero cone | None |
| §1.4 pushforward | A ruling contracted by first projection and a horizontal ruling | Pushforwards 0 and [P¹]; pairings 0 and deg O(1) = 1 | Contracted curves push to zero | None |
| §1.4 closure | A = [[1,√2],[√2,2]], A+εI | det A = 0; det(A+I) = 4; det(A+I/2) = 7/4 | Irrational boundary is not a rational curve ray | None |
| §1.5 nefness | P¹, O(−1), O, O(1) | Degrees −1,0,1; inequalities false,true,true | Zero class included | None |
| §1.5 relative nefness | First projection, O(−1,0), O(0,−1) | Fibre degrees 0 and −1 | Horizontal negativity is permitted | None |
| §1.5 effective non-nef exceptional class | Rational blow-up; degree-two real blow-up | E² = −1 and −2; both < 0 | Example must specify rational centre for value −1 | Rational centre specified |
| §1.6 bigness | P⁰, P¹ and P² with O | h⁰ = 1 in all degrees; growth orders 0,0,0 versus dimensions 0,1,2 | Trivial sheaf big only in dimension zero | None |
| §1.6 top-intersection criterion | P² O(1); P¹×P¹ O(1,0) | h⁰ = (m+1)(m+2)/2 and m+1; squares 1 and 0 | Nef nonbig boundary distinguished | None |
| §1.6 birational comparison | Blow-up P² at rational point, pullback O(1) | Section dimensions equal (m+1)(m+2)/2; top squares 1 = 1 | Compatible with supplier extension | None |
| §2.1 represented Picard functor | P¹; nodal rational curve | Components ℤ; nodal Pic⁰ = G_m with tangent dimension 1 | Component gluing cannot be discarded | None |
| §2.1 constants and nilpotents | P¹_ℂ/ℝ; Spec k[ε]/ε² | Real/geometric Picard points ℤ and ℤ²; finite affine Picard sheaf 0 | Universal-functions hypothesis is unnecessary here | None |
| §2.2 affinization definition | P¹_k; P¹_ℂ/ℝ | Constants k and ℂ, hence Spec k and Spec ℂ | Distinct constants retained | Redundant substitution Check deleted |
| §2.2 finite affine identity | Spec B, B finite over k, including B = 0 | Affinization Spec B = X; B = 0 gives empty scheme | Empty input has real value | None |
| §2.2 product units | P¹ ⊔ P¹ | Constants k×k; units Aˣ×Aˣ | Single field is a wrong model | None |
| §2.2 nilpotent units | P¹ over k[ε]/ε² | (1+εa)(1+εb) = 1+ε(a+b) | Reduction loses this subgroup | None |
| §2.2 base change | Constants ℂ over ℝ, extended to ℂ | ℂ⊗ℝℂ = ℂ×ℂ | Base-change constants match geometric splitting | None |
| §2.3 Brauer comparison | ℂ/ℝ; ℝ×ℝ; ℝ[ε]/ε²; zero algebra | H² = 0, (ℤ/2)², ℤ/2, 0; Pic = 0 in each | Product and nilpotent boundaries agree | None |
| §2.3 Leray direction | Spec ℂ → Spec ℝ; identity Spec ℝ | Edge 0 → 0 and identity ℤ/2 → ℤ/2 | Source is base cohomology of direct image | None |
| §2.4 obstruction | Pointless real conic | Image 2ℤ inside ℤ; quotient ℤ/2; multiplying by 2 kills obstruction | Positive-power lifting is weaker than exact lifting | None |
| §2.4 affinization-valued Brauer group | P¹_ℂ/ℝ | Br(X^aff) = Br(ℂ) = 0; Br(ℝ) = ℤ/2 | Replacing X^aff by Spec k gives wrong group | None |
| §2.5 τ definition on P¹ | O(m), m = −1,0,1 | Positive multiple nm has degree nm; zero exactly for m = 0 | τ = 0 | Split into its own Check |
| §2.5 τ for elliptic curves | Degree map Pic(E) → ℤ | Kernel E, dimension 1; component degree n·d vanishes iff d = 0 | τ = Pic⁰ = E | Split into its own Check |
| §2.5 τ beyond identity component | Classical Enriques, characteristic ≠ 2 | Pic⁰ = 0; canonical class has order 2; τ = ℤ/2 | Identity component alone is too small | Split and add locator |
| §2.5 full nonreduced component | Ordinary Enriques, characteristic 2 | μ₂ has coordinate ring k[t]/((t−1)²), length 2, one geometric point | Reduced point has wrong length 1 | Retain and add locator |
| §2.6 abelian étale dictionary | Constant C₃, all characteristics including 3 | Three components; 1+2 = 2+1 = 0 mod 3; trivial Galois action | Valid discrete abelian coefficient group | New Check |
| §2.6 nonabelian exclusion | Constant S₃ | (12)(23) = (123) ≠ (132) = (23)(12) | Cannot be an abelian Galois module | Restrict equivalence |
| §2.6 Galois group need not be abelian | S₃ acting by permutation on ℤ³ | (12)(23)e₁ = e₂; (23)(12)e₁ = e₃ | Coefficient group abelian, action image nonabelian | Supplier contract explicit |
| §2.6 geometric lattice | P¹; P¹_ℂ/ℝ | Stalk ℤ with identity; stalk ℤ² with (1,0) ↦ (0,1) | Constant and nonconstant cases separate | None |
| §2.6 finite and mixed-dimensional schemes | Spec K; P¹_ℝ ⊔ Spec ℂ | Numerical lattices 0 and ℤ | Zero-dimensional components add no rank | None |
| §2.6 rational numerical points | Pointless real conic | Num-scheme rational points ℤ; line-bundle image 2ℤ | Surjectivity cannot replace injectivity | Abstract rational-point Check deleted |
| §2.6 functorial pullback | Constant map P¹ → P¹; identity | Pullbacks on numerical ℤ are 0 and id | Pullback direction is contravariant | None |
| §2.7 constancy predicate | P¹ and conjugate pair | σ fixes m; σ(1,0) = (0,1) | Actual semilinear maps distinguish the cases | None |
| §2.8 norm rank law | P¹_E → P¹_k, extension degree n | Nm O(d) = O(nd); n = 1 gives d; n = 2,d = 1 gives 2 ≠ 1 | Norm is not inverse to pullback | None |
| §2.8 norm composition | Tower degrees 2 and 3 on P¹ | O(d) ↦ O(3d) ↦ O(6d), equal to direct degree-six norm | Tower direction agrees | None |
| §2.9 torsor annihilation | τ = 0 on P¹; real conic Picard generator | Torsor class 0; n·0 = 0 for n = 1,2 | Picard-sheaf lift does not remove Brauer obstruction | None |
| §2.10 positive-power headline | P¹, O(−1), O, O(1) | d = 1 lifts degrees −1,0,1 | Uniform exponent works for all signs | None |
| §2.10 finite-index direction | Pointless real conic | Fixed lattice ℤ, image 2ℤ; index 2; d = 2 works and d = 1 fails on class 1 | Constancy does not mean integral surjectivity | None |
| §2.10 converse direction | P¹_ℂ/ℝ | Image diagonal in ℤ²; (d,0) is not diagonal for d > 0 | Both sides false | None |
| §2.10 rank-zero boundary | Empty or finite scheme, including dual numbers | Lattice 0, index 1; d = 1 works | No positive-rank requirement | None |
| §2.11 doubled lift | ℤ/4 → ℤ/2 | d(1) = 2; πd(1) = 0 = 2·1 | Factor is 2, not 1 | None |
| §2.11 uniqueness and kernel condition | ℤ/8 → ℤ/2 with kernel ℤ/4 | Representatives 1 and 3 have doubles 2 and 6; difference 4 ≠ 0 | Kernel not killed by 2, so no factorization | None |
| §2.11 zero kernel | Identity quotient on ℤ | d(1) = 2, πd(1) = 2 | d is doubling, not inverse quotient | None |
| §2.12 finite-field torsion headline | y²+y=x³ over 𝔽₂; y²=x³−x over 𝔽₃ | Affine counts 2 and 3; totals 3 and 4; positive orders divide 3 and 4 | Characteristics 2 and 3 retained | None |
| §2.12 finite-scheme boundary | Spec finite k-algebra | Numerical Picard group 0; identity has order 1 | Finiteness permits rank zero | None |
| §3.1 contraction definition | Identity and P¹×P¹ → P¹ | Functions map k → k is identity on affine base constants | Canonical sheaf map used | None |
| §3.1 connectedness is insufficient | P¹_ℂ → Spec ℝ | H⁰ = ℂ, map ℝ → ℂ has real dimensions 1 → 2 | Not a contraction | None |
| §3.1 finite birational negative control | Normalization of cusp | k[t²,t³] ⊊ k[t], with t outside the first ring | Proper birational alone is insufficient | None |
| §3.1 field-base-change stability | P¹_ℂ/ℝ affinization followed by extension | Contraction target Spec ℂ becomes two Spec ℂ points; source becomes two P¹s | Functions match componentwise | None |
| §3.2 rigidity | Blow-up f and g = id | g maps exceptional P¹ to a curve; any map factoring through f would map it to a point | Contracted-curve hypothesis is essential | None |
| §3.3 semiample definition | P¹ O(1), O, O(−1) | Evaluation ranks at points 1,1,0 in positive powers | Correct positive-power generation condition | None |
| §3.3 nef versus semiample | Elliptic non-torsion degree-zero L | deg L^n = 0, h⁰(L^n) = 0 for n > 0 | Nefness alone is insufficient | None |
| §3.3 section ring | P¹ O(1); Spec k O | Rings k[x,y] and k[t], Proj P¹ and Spec k | Degree-zero target boundary correct | None |
| §3.4 contraction dictionary | P¹×P¹ O(1,0) | Degree on vertical ruling 0, on horizontal ruling 1; target first P¹ | Correct projection and contracted curves | None |
| §3.4 trivial sheaf | P¹ over dual numbers | Section ring B[t], B = k[ε]/ε²; Proj = Spec B | Nilpotent target constants retained | None |
| §3.4 numerical uniqueness | P¹×E over ℂ; L pulled back from O(1), L′ = L tensor pullback of a nontrivial two-torsion T on E | Numerical difference 0; (L′)² = L² as sheaves; both contractions target P¹ | Nontrivial numerically equivalent twist gives the same contraction | None |
| §3.5 spreading | Identity on P¹ and first projection | Degree-one field of definition k; source equations are identities | Marking can be retained | None |
| §3.6 inseparable descent headline | Identity extension; trivial contraction on P¹ over inseparable degree p | Source square id = id; constants k → k′ give target Spec k′ as pullback of Spec k | Identity and constant target squares agree | None |
| §3.6 separable negative control | Conjugate pair over ℝ extended to ℂ | Contracted-component indicator (1,0) becomes (0,1) under conjugation | A one-component contraction cannot descend | None |
| §3.7 geometric projective descent | P¹×P¹ and conjugate pair | Trivial-action ruling (1,0) fixed in first case; swapped contraction in second | Numerical constancy is substantive | None |
| §3.8 ampleness openness | P¹_Y, O(1) and O | Fibre degrees 1 and 0; ample locus all of Y and empty | Nonample fibre cannot be repaired by shrinking | None |
| §4.1 graph definition | Empty, irreducible nodal curve, disjoint pair, crossing pair | Vertex/edge counts (0,0),(1,0),(2,0),(2,1) | Loops and multiplicities are absent | None |
| §4.1 component map | V(x²+y²) over ℝ extended to ℂ | Two intersecting geometric vertices map to one real vertex | Edge may collapse | None |
| §4.1 vertex bijection is insufficient | Normalization of two crossing projective lines | Counts (2,0) → (2,1) | Reflection requires extra hypotheses | None |
| §4.2 graph-descent headline | Conjugate P¹ pair; crossing rational lines | Vertex map 2 → 1 fails; rational crossing gives marked (2,1) → (2,1) identity | Both directions distinguished | None |
| §4.2 purity and empty input | P¹_ℝ ⊔ Spec ℂ; empty scheme | Vertices 3 → 2 despite constant numerical ℤ; empty has 0 → 0 and numerical 0 | Mixed dimension excluded, empty allowed | None |
| §4.2 nonreduced and inseparable curves | Double P¹; constants extension of degree p | Each graph (1,0); reduced degree 1 versus full degrees 2 and p | Graph ignores multiplicity, numerical testing uses reduced curves | None |
| §4.2 marking | Two disjoint rational P¹s | Projection sends first to first; swap sends first to second | Unmarked graph isomorphism is insufficient | None |
| §4.3 symmetry and adjacency | Two lines on P² | Matrix [[1,1],[1,1]]; mutual entries 1 = 1; one edge | Sign and adjacency agree | None |
| §4.3 multiplicities after extension | D₁ = V(x^p−a), D₂ = V(y^p−a) | Local k-length p²; full pullbacks pC₁,pC₂ give p²·1; reduced supports give 1 | Full divisors are essential | None |
| §4.3 restriction of scalars for a surface | P²_κ, [κ:k] = 2 | κ-lines intersect 1 over κ and 2 over k | Not a rescaling rule for fibre components in a fixed ambient k-surface | None |
| §4.4 contraction trichotomy | P² → point; rational blow-up; first projection | Target dimensions 0,2,1 respectively | Three distinct cases | None |
| §4.5 exceptional square | Rational closed point | E = P¹_k; χ O(−1) = 0, χ O = 1, square −1 | Matches degree normalization | General formula added |
| §4.5 exceptional square over arbitrary k | Residue extension degree d, including inseparable d = p | χ_k O(−1)−χ_k O = 0−d = −d < 0 | Negativity is unchanged | Residue factor restored |
| §4.5 real degree-two centre | x = V(u²+1,v) | κ(x) = ℂ; square 0−2 = −2, whereas old value −1 differs | Review counterexample confirmed | New negative control |
| §4.5 geometric pullback of real exceptional divisor | Two disjoint geometric exceptional curves | Squares −1,−1; mutual entry 0; sum square −1+0−1 = −2 | Full base-change equality restored | New Check |
| §4.5 Aₙ matrix | n = 1 and 2 over algebraically closed field | [−2]; [[−2,1],[1,−2]], determinant 3, value −2 on (1,1) | Negative definite; no hidden residue factor | Ground field specified |
| §4.6 semidefinite radical | I₂ matrix [[−2,2],[2,−2]] | q(a,b) = −2(a−b)²; kernel (a,a); singleton value −2 | Correct radical and strict submatrix sign | None |
| §4.6 irreducible fibre | One component, multiplicity m > 0 | N = [0], N(m) = 0; radical ℚ = ℚm | No strict negativity for full one-component fibre | None |
| §4.7 negative-curve rigidity | Geometric conjugate exceptional pair | E₁² = −1, E₁E₂ = 0; (E₁−E₂)E₁ = −1 | Distinct conjugates cannot share a numerical class | None |
| §4.7 zero-square negative control | Rulings of a real nonsplit quadric | Each ruling square 0; conjugation swaps classes | Strict negativity cannot be omitted | None |
| §4.8 fibre graph descent | Rational blow-up of smooth fibre | N = [[−1,1],[1,−1]], vertex/edge counts (2,1) before and after extension | Edge and components descend | None |
| §4.8 nonconstant negative control | Real conic-bundle fibre x²+y² = 0 | One schematic component, two geometric components; swapped numerical classes | Missing constancy would give wrong graph | None |
| §4.9 reducible-image rationality | Rational blown-up fibre; smooth fibre over degree-two point | First κ(a) = k; second degree 2 but chosen geometric fibre has one component | Reducibility is necessary | None |
| §4.10 labels | Rational blown-up fibre; irreducible fibre | Edge label 1 = 1; irreducible graph has zero edges | No residue rescaling inside fixed surface | None |
| §5.1 numerical restriction | P¹_R; identity family Spec R | Maps ℝ → ℝ and 0 → 0 are identities | Injectivity includes rank zero | None |
| §5.1 non-surjectivity | Quadric x²+y² = zw over ℤ_(5) | Generic rank 1; special rank 2 because −1 = 2² mod 5 | Complete-DVR conclusions cannot be asserted here | None |
| §5.2 numerical versus exact lifting | Elliptic model at 7 | Rational subgroup order 5; special group order 10; all degree-zero numerical classes 0 | Numerical lift O exists when exact lift fails | None |
| §5.2 elliptic count | y²+y=x³−x²−10x−20 over 𝔽₇ | Affine counts (0,1,2,0,2,2,2), sum 9, plus infinity = 10 | Worked example recomputed | None |
| §5.3 lifting headline | P¹_R over complete DVR, O(d), d = −1,0,1 | H²(O) = 0; restrictions have degrees −1,0,1 | Actual sheaf lifts, not just numerical multiples | None |
| §5.3 obstruction boundary | K3 surface and abelian surface fibres | h²(O) = 1 rather than 0 | Vanishing premise excludes Picard-rank-drop examples | None |
| §5.3 ampleness of lifts | P¹_R, lift O(d) | Special degree d > 0 exactly when relative O(d) ample | Same positive normalization | None |
| §5.4 cone identification | P¹_R and Spec R | Effective cones ℝ≥0 = ℝ≥0; rank-zero cones {0} = {0} | Empty/point boundary retained | None |
| §5.5 forward specialization | Pⁿ_R, O(1), n ≥ 1 | Top powers 1 = 1; all line degrees 1 | Correct direction | None |
| §5.5 converse negative control | Three sections becoming collinear | H² = 4−1−1−1 = 1 on both fibres; special H·ℓ = 2−1−1−1 = −1 | Constant top power does not force converse nefness | None |
| §5.6 semiample numerical descent | First projection, O(a,0) | Fibre degree 0; m = 1, target sheaf O(a) | Actual pullback identity holds | None |
| §5.6 numerical hypothesis | Same projection, O(0,1) | Fibre degree 1; every pullback from base has degree 0 | Not a descended sheaf | None |
| §5.6 semiampleness hypothesis | Elliptic non-torsion degree-zero L | All degrees 0; class nL ≠ 0 for n > 0, h⁰(nL) = 0 | Numerically trivial alone is insufficient | None |
| §5.7 codimension-one condition | Blow-up of any closed regular surface point | Relative degree of O(−E) on E is 1 over κ(x); pullback degree 0 | Fails the prime-divisor image hypothesis, so not a counterexample to theorem | Value 1 retained |
| §5.7 identity and projective bundle | Identity; P¹_S with generically trivial O(a) | Identity M = L; generic degree a = 0 forces a = 0 on projective bundle | Degenerate targets agree | None |
| §5.8 normalized minimal degree | Line on Pⁿ; P¹_ℂ/ℝ | 1/1 = 1 and 2/2 = 1 | Denominators positive, no zero ray allowed by premise | None |
| §5.8 ample independence and negative divisor sign | Normalized H-values 1,2; H′ = 3H; D = −2H | H′-values 3,6; D-values −2,−4 | Same minimum curves; minimum H gives maximum D | None |
| §5.9 resolution independence | P² and rational blow-up | ρ−e = 1−0 = 2−1 = 1 | Subtraction is integral | None |
| §5.9 rank-zero boundary | Spec ℂ | ρ−e = 0−0 = 0 | Positive-dimensional premise for positivity is necessary | None |
| §5.9 divisorial resolution | Quadric surface cone resolved by F₂ | ρ−e = 2−1 = 1 | Exceptional divisor counted once | None |
| §5.9 small resolution | Projective quadric threefold cone | P²-bundle resolution has rank 2, e = 0; ρ_AHK = 2 versus Cartier rank 1 | Cartier-rank substitution would fail | None |
| §5.9 common-resolution cut count | n = 2,e = 0; n = 4,e = 1 | Remaining dimensions 2−0−0 = 2 and 4−1−1 = 2 | Additional count n−e−2 is correct | None |

The normalizations shared with suppliers are compatible: StableReduction's two-component matrix has value −(a−b)², Tau Ceti's I₂ matrix has value −2(a−b)², and the nonreal blow-up has full exceptional square −2. Positive factors change magnitudes but never the definiteness assertion. Neither repair introduces a denominator, an unspecified operation, a new universe restriction or a hypothesis containing the conclusion.

## Elaborated signatures and checks

Ran the requested `lake env lean` elaboration of `packages/AlgebraicModuliForArithmeticGeometryPartII/Suggested.lean` from the supplied content checkout. Exit status **0**. Diagnostics: seven warnings that declarations use `sorry`, at lines **83, 94, 130, 153, 175, 213, 232**; no errors. No missing Tau Ceti object file occurred, so no module build was required. No Lean process remains running.

Generated one scratch file containing the unchanged acceptance declarations and `#check @name` for every declaration, then elaborated it once. Exit status **0**, the same seven admitted-theorem warnings, and all **14** elaborated types printed. Compared each printed signature with its README statement:

| Declaration | README | Binders and meaning observed |
| --- | --- | --- |
| `NumericallyTrivial` | §0.4 | Field k, scheme X, structure map x and properness remain explicit; integral closed dimension-one test curves. |
| `RelNumericallyTrivial` | §0.4 | Proper f and line bundle; every native κ(s)-fibre. No Noetherian binder is required for the definition. |
| `numericallyTrivialClasses` | §1.1 | Field k, X, x, properness; generated subgroup of actual line-bundle classes. |
| `relNumericallyTrivialClasses` | §1.1 | Proper f retained; generated relative numerical kernel. |
| `numericalClassGroup_free_finite` | §1.2 | Arbitrary field, proper X, conjunction of free and finite ℤ-module conclusions. |
| `relNumericalClassGroup_free_finite` | §1.3 | Proper f and Noetherian S both retained; same free/finite conjunction. |
| `HasTrivialNumericalGaloisAction` | §2.7 | Both fields, algebra structure, algebraic closure, X, x and properness retained. Actual semilinear maps are fixed by two projection equations. |
| `constantNumericalClasses_iff_positivePowerDescent` | §2.10 | Same field/closure/properness binders; positive d precedes every L; quotient equality is numerical equality. |
| `numericallyTrivial_torsion_of_algebraic_finiteField` | §2.12 | Primality, field, algebraic extension of ZMod p, properness and numerical triviality all retained; positive exponent. |
| `IsContraction` | §3.1 | Properness is part of the real predicate body; sections map is canonical and required to be an isomorphism on every open. |
| `contraction_descends_purelyInseparable` | §3.6 | Pure inseparability, proper source and target, contraction and base-compatibility equations retained. Target cartesian square and source equation both appear in the conclusion. |
| `componentGraph` | §4.1 | Native scheme carrier, all irreducible components, distinctness and nonempty intersection. No Noetherian assumption is silently added to the definition. |
| `constantNumericalClasses_iff_componentGraphDescent` | §4.2 | Algebraic closure, properness and componentwise dimension one retained; graph isomorphism marked by closure of actual projection images. |
| `lineBundle_lifts_completeDVR_of_h2_zero` | §5.3 | Domain, DVR, maximal-ideal adic completeness, properness, flatness and special-fibre H² vanishing all retained. Conclusion is an actual isomorphism of invertible sheaves. |

No dropped binder, changed Lean name or mismatch required an edit. Geometric intersection and Picard-sheaf headline carriers still lack pinned APIs as identified in the existing module docstring; the new Checks are not substitutes for those headlines.

Ran the specified dependency gate with `--depcheck`, the package name, the supplied order and `--movable`. Exit status **0**; its complete output was:

```text
depcheck: 52 roadmaps, 587 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line for this package.

Ran the roadmap citation resolver. Exit status **0**; no missing cross-roadmap citation or Lean name was listed. It reports that names outside TauCetiRoadmap were not checked because its host has no pinned Lake packages; the explicit checkout and signature checks above supply the pinned checks rather than treating that omission as a pass. The supplied pre-edit `Num.free_finiteRank` lead was settled against the actual supplier text as recorded above.

`git diff --check` exited **0**, with no output. Final edit-boundary and file-content checks passed: only the two permitted tracked files and the requested report changed; all 14 Lean declaration names occur in the README; the report has exactly the three required finding headings; and changed files contain no machine paths. TOML parsing passed, with 14 unique source keys and only SCH23's locator changed. The computed adversarial table contains 138 rows. No gate failures were listed in the brief; no tooling or merge-order repair was attempted.

## Maintainer notes

The edits are confined to `packages/AlgebraicModuliForArithmeticGeometryPartII/README.md`, SCH23's existing locator in `packages/AlgebraicModuliForArithmeticGeometryPartII/sources.toml`, and this report. `packages/AlgebraicModuliForArithmeticGeometryPartII/Suggested.lean`, `packages/AlgebraicModuliForArithmeticGeometryPartII/metadata.toml` and `packages/AlgebraicModuliForArithmeticGeometryPartII/design/plan.json` are unchanged. The general library scope and all supplier gaps are unchanged. No consumer-facing Lean name changed, and no other roadmap needs an API migration. A fresh independent review remains the acceptance decision.
