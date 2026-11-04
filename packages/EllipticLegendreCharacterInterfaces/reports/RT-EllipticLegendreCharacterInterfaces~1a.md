<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1373#issuecomment-6398107942 -->
Red team round 1 pass a (codex) of a5ea30c

Verdict: needs_changes

1. **F01** (P3) Squareclass Checks cannot detect a permuted root order

   **Location:** packages/EllipticLegendreCharacterInterfaces/README.md:390–393, “the class of 1 maps to (1,1,1)” and the constant-4, constant-2 and excluded-zero Checks.

   **Claim:** These supply discriminating Checks for the ordered split squareclass equivalence of §2.3.

   **Witness:** All three valid inputs have diagonal outputs: (1,1,1), (1,1,1), ([2],[2],[2]). Composing the equivalence with any nonidentity coordinate permutation passes every Check; excluding zero also cannot distinguish the permutation.

   **Exact repair text:** Replace the three constant-input bullets with:

   - Over ℚ with d=2, λ=3, the unit represented by X+1 has ordered reading (1,[3],[7]); interchanging the last two roots gives the different reading (1,[7],[3]).
   - Over the same model, X+2 has evaluations (2,4,8) and reading ([2],1,[2]); the middle coordinate is trivial and the outer coordinates are not.
   - Over the same model, X−1 has evaluations (−1,1,5) and reading ([−1],1,[5]); neither the first nor third coordinate is trivial, and their classes are distinct.

   Keep the excluded-zero negative control. The evaluations at roots (0,2,6) give precisely the displayed values; all nine representatives are nonzero. The first new Check rejects the exhibited permutation.

2. **F02** (P3) The extension is not identified as a Part II roadmap

   **Location:** packages/EllipticLegendreCharacterInterfaces/README.md:1, “Roadmap: legendre models, descent and character interfaces”; README.md:7 explicitly says “It extends EllipticCurves”.

   **Claim:** This is a new extension of the existing EllipticCurves roadmap, whose existing constructions it imports.

   **Witness:** The binding planning contract requires extensions to be identified as “Part II”. The title omits this identification even though README.md:7 names the base roadmap and its boundary.

   **Exact repair text:** Use the title `# Roadmap: elliptic curves, Part II — Legendre models, descent and character interfaces`. In Suggested.lean use `# Elliptic curves, Part II — Legendre models, descent and character interfaces: target signatures`. Retain the package identifier and the existing introduction identifying the base roadmap and the new scope. This repairs the advertised extension relationship without changing any mathematical statement or dependency.

3. **F03** (P3) The downstream paragraph contains merge-process narrative

   **Location:** packages/EllipticLegendreCharacterInterfaces/README.md:638, “These supply directions follow the merge order.”

   **Claim:** The finished roadmap describes the job board's merge-order status.

   **Witness:** The sentence states a submission-process property, not a mathematical supplier contract. The brief explicitly excludes process narrative from the README.

   **Exact repair text:** Delete only “These supply directions follow the merge order.” Keep the preceding mathematical supplier/consumer descriptions. The dependency graph is unchanged; the read-only gate returned `depcheck: 51 roadmaps, 583 edges, 0 problem(s)`.

4. **F04** (P3) Three Checks restate API identities

   **Location:** packages/EllipticLegendreCharacterInterfaces/README.md:109, “L(1,1/2)=L(1/2)”; README.md:407, “For a nonroot point the product class is [y²]=1”; README.md:439, “At T₀ the product of the representatives is d⁴λ²”.

   **Claim:** These are discriminating Checks of root scaling and descent conventions.

   **Witness:** Scaling by d and the incorrect scaling by d² agree at d=1. The two descent bullets repeat the symbolic identities proved at README.md:435, without evaluating an instance or distinguishing a competing convention.

   **Exact repair text:** Replace those bullets, respectively, with:

   - Over ℚ, d=4 and λ=3 give a₂=−16 and a₄=48. Using coordinate scale 4 instead would give a₂=−64 and a₄=768; root scaling and coordinate scaling differ.
   - On L(4) over F₇, P=(3,1) has nonroot representatives (3,2,6), with product 36=1=y² and squareclass signs (−1,+1,−1). Replacing the differences by root-minus-x changes the product sign to −1, a nonsquare.
   - At T₀ on L(2,3) over ℚ, the corrected representatives are (12,−2,−6), with product 144=12². Using the uncorrected first representative 0 instead gives product 0 and no unit squareclass.

   The displayed products and coefficients compute as written; each replacement rejects the indicated wrong construction. Keep these as README Checks, not Suggested.lean declarations.

## Verified sound

Read all 648 README lines and all 98 Suggested.lean lines, both repository rule documents, the source manifest and the previous repair dispositions. Audited all 9 Lean declarations (2 definitions, 7 theorems), all 27 numbered README targets, all 34 supporting API bullets and all 100 Check bullets. The two bullets using conductor32 are qualified below. No false headline, lost binder, unsupported supplier contract, upward dependency, cycle, missing statable advertised headline, sorry'd data or retained padding was found. The findings above are four P3 contract defects.

Resolved all 73 distinct backticked pinned-library references, including their domains and required instances, against Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Main-roadmap citations were read at content revision `c57bdc02fc2a4b1643df71b4a3a14b20fdad247f`. The package head is `a5ea30cb8a2d09bfe7516b014eebf2780e49e3f4`.

Verified BS20 citations in 24 numbered target sections, covering 18 distinct cited line anchors, against the provided publisher extraction. The two CRT/quotient target locators were checked against the pinned constructions. S09 and K84 remain uncertified as instructed. Checked 18 distinct cross-roadmap section/layer citations in 10 roadmaps, including all six named ClassicalArithmeticCompletion squareclass declarations. Ownership searches used the roadmap service, main and Completed, the board packages, and the 100 README/Lean files in the 50 specifically supplied open-roadmap folders. No duplicate fully qualified name of a retained declaration was found.

The tracked change set contains seven files, all under packages/EllipticLegendreCharacterInterfaces. Suggested.lean has one `import Mathlib`, exactly two used Tau Ceti imports, one module docstring, the required namespace, theorem declarations with sorry, and no set_option, lemma, admitted data, placeholders or executable algorithms. Both coefficient definitions have real bodies and are used by headlines.

Dependency command result, exit status 0:

```text
depcheck: 51 roadmaps, 583 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The internal target edges also run forward: coefficient equations → invariants/root orderings → normalization and root points; valuations → unit parameters → character support → conductor divisibility; CRT → unit squareclasses → two descent branches → halving; explicit half → exclusion of order8 → exact two-part. Layer5 uses only Layer0 and native finite-field counting. No supplier gap is declared or required by the contracts checked here.

### Exact supplier and ownership evidence

| Citation | Verified location and supplied content | Result |
|---|---|---|
| EllipticCurves Layer4 | TauCetiRoadmap/EllipticCurves/README.md:793, especially805–828: minimal-equation reduction predicates, complete-DVR potential good reduction, integral-j criterion | Sufficient; only the good-reduction consequence is consumed. |
| EllipticCurves Layer5 | TauCetiRoadmap/EllipticCurves/README.md:1154,1188: native twists with discriminant t²−4n, invariant powers and point isomorphisms | Consumed as existing theory; no second twist carrier. |
| ModularCurves4C,9E | TauCetiRoadmap/ModularCurves/README.md:1100,1105–1109,2008,2029–2033: universal family and six Möbius substitutions/invariant ring | Coefficient-level specializations here have distinct ownership; moduli theory stays there. |
| ClassicalArithmeticCompletion1.7,1.8 | TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:501,545: integral-valued fundamental-discriminant characters; uniqueness at almost all primes with nonzero levels and finite exceptional set | Hypotheses match: ℤ is nontrivial; the rational parameter has finitely many nonunit primes. |
| ClassicalArithmeticCompletion1.51 | TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:1789–1808: squareclassDiscr, squareclassCharacter, primitivity, prime values, discriminant of1, odd support parity and squarefree odd part | All six quoted names exist in the current main README; no drift. |
| NeronModelsAndSemistableAbelianVarieties5.3a,5.3g | TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:3209–3233,3356–3368: genuine elliptic Artin conductor; good iff exponent0, multiplicative iff exponent1; global bad-prime support | Exact contracts present at the service's current head. ℚ_p satisfies the perfect/finite residue hypotheses. |
| ArithmeticGaloisRepresentations Layer3 | TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md, Layer3 introduction and3.1: finite-dimensional representations, finite wild inertia image, Artin/Swan theory; elliptic comparisons explicitly assigned to the Néron roadmap | Compatible ownership; no extra conductor construction here. |
| EllipticCurveModularityPartII5.1 | TauCetiRoadmap/EllipticCurveModularityPartII/README.md:550,568 and Suggested.lean:196: FullRationalTwo is cardinality4 of rational doubling kernel | Compatible with this package's unbundled, general-field hypothesis. |
| ErdosProgressionPowers Layer2,2.1 | TauCetiRoadmap/ErdosProgressionPowers/README.md:1034–1048 and its following descent contracts: arbitrary scalar native twist and progression-specific uses | Same twist discriminant d and scaled coefficients. External repointing is settled, as below. |
| ComputationalNumberTheory3.17 | TauCetiRoadmap/ComputationalNumberTheory/README.md:1681–1688: same singular-inclusive normal-form character count and trace | Later consumer; moving this input to this earlier package is already recorded in the previous repair. |
| ArithmeticDynamics6.35,6.111,6.112 | TauCetiRoadmap/ArithmeticDynamics/README.md:9096–9102,10362–10385,10391–10401: same coefficient curve and invariants; dynamical torsion-image theorems | This package owns the earlier coefficient interfaces; dynamics remains downstream. |
| MordellLawrenceVenkatesh6.4 | TauCetiRoadmap/MordellLawrenceVenkatesh/README.md:2084–2097: same coefficient model, then universal-family specialization and cyclic family | Existing external repointing disposition retained. |

The duplicate coefficient/count statements in later consumer files still require their maintainers' repointing. This is the disposition already marked outside the package's edit allowance in packages/EllipticLegendreCharacterInterfaces/reports/FIX-PKG-EllipticLegendreCharacterInterfaces~2.md:37,196–201. Its reason is correct: these consumers occur later, and editing them is prohibited in this package. No finding re-raises that settled issue. The current README's consumer language is read as the intended supply contract, not a claim that those external edits have already landed.

The pin's critical definitions were checked by their bodies: Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:76 has only five coefficients; its IsElliptic at366 is unit discriminant. Mathlib/AlgebraicGeometry/EllipticCurve/NormalForms.lean:107 requires only a₁=a₃=0, with no hidden characteristic condition. Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean:477 adjoins O to actual nonsingular affine coordinates, while TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean:73 counts all affine solutions plus1. Its comparison at86 requires ellipticity and finite solution type. The raw reduction class at Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean:323 includes minimality; the headline correctly applies it to a minimal local equation. TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/XSubT.lean:505 takes units modulo the image of squaring, and μ at794 has domain Multiplicative of the native point group; the root correction at558 and nonroot branch at566 match the README.

### Source locator evidence

| Locator(s) | What was read and compared |
|---|---|
| BS20 lines462,464; printed366 | Symmetric cubic and the reference to K84 p.41. The package supplies its own character-cancellation proof, including u=0. |
| BS20 lines513–516; printed367 | Legendre equation and rational full-two-torsion normalization. General-field normalization in the package comes from the pinned root-count and normal-form APIs. |
| BS20 lines526–546; printed367–368 | Lemma6.2 under semistability away from2, plus the six ratios at544–545. The stronger unit/support statements are justified separately by j-integrality and the character supplier. |
| BS20 lines547–557, including554; printed368 | Lemma6.3 for p≡3 mod4 and the halving-square implication. The package adds the square-minus-one branch and works over every odd finite field. |
| BS20 lines568–569; printed368 | Unit parameters imply good reduction of the unscaled Legendre equation. |
| BS20 lines657–662, including659,661; printed370 | Split descent, kernel, coordinate formulas and product1. The package explicitly handles O, repairing the omitted affine restriction in the source. |
| BS20 lines663–672, including666–667,668–671; printed370 | Lemma6.5, the two-torsion class triples, the explicit half and the nonsquare first coordinate. |
| BS20 lines703–705; printed371 | Scale-two twist and negative trace at p≡5 mod8. |
| BS20 lines710,715; printed371 | The conic-specialized root class triples, matching the general formulas here. |
| BS20 line718; printed371 | The erroneous printed y-coordinate. Direct membership and tangent calculations validate the package's replacement without invoking progression hypotheses. |
| Mathlib/ RingTheory CRT and quotient locators | Ideal.quotientMulEquivQuotientProd at Mathlib/RingTheory/Ideal/Quotient/Operations.lean:325; Polynomial.quotientSpanXSubCAlgEquiv at Mathlib/RingTheory/Polynomial/Quotient.lean:29; QuotientGroup.map and eq_one_iff at Mathlib/GroupTheory/QuotientGroup/Defs.lean:309,120. |
### Elaborated declaration audit

All locations in this table are in packages/EllipticLegendreCharacterInterfaces/Suggested.lean. Compared each declaration with the supplied elaborated signature; no Lean command was run. There are no section variables: every required type, instance and hypothesis occurs explicitly in the declaration. The two definitions are needed by the seven headline theorems. Each theorem needs a genuine argument beyond unfolding or one pinned library lemma; no retained declaration meets the padding probe.

| Declaration; layer; line | Effective variables and instances | Instances and computed sides | Result; change |
|---|---|---|---|
| legendre; 0; 23 | R : Type u, CommRing R, λ:R | ℚ, λ=2: five coefficients (0,−3,0,2,0); cubic at x=2 is 0 and at −2 is −24. Zero ring: all coefficients 0=1. | Matches §0.1; none. |
| scaledLegendre; 0; 27 | R : Type u, CommRing R, d,λ:R | ℚ, d=2,λ=1/2: (0,−3,0,2,0) on both coefficient descriptions; d=0 gives (0,0,0,0,0). | Matches §0.2; none. |
| exists_scaledLegendre_of_full_two_torsion; 0; 31 | Field K, DecidableEq K, 2≠0, elliptic E, Nat.card doubling kernel=4 | E:y²=x³−x over ℚ: kernel size 4 and C=id,d=1,λ=−1 give identical coefficients. Over F₃: size 4,λ=2,Δ=1. y²=x³−2x over ℚ: kernel size 2≠4. | Matches §0.9; no dropped ellipticity or field hypothesis. |
| legendre_units_of_good_reduction; 1; 42 | prime p≠2, E/ℚ elliptic, C,d,λ, actual model equality, HasGoodReduction on minimal base change over ℤ_p | E=L(−1), p=3: v₃(λ)=v₃(1−λ)=0; v₃(j)=3. Negative control p=2,λ=2: v₂(λ)=1 although v₂(j)=6; p=2 excluded. | Matches §1.2; d≠0 and λ≠0,1 follow from ellipticity. |
| scaledLegendre_halving_iff_squares; 2; 55 | Field K, DecidableEq K, 2≠0, d≠0,λ≠0,1, x,y and actual Nonsingular proof | L(−1), P=(0,0): over ℚ halves absent and (0,−1,1) not all squares; over F₅ four halves and (0,4,1) all squares. At (1,0)/F₅ both predicates false: differences (1,0,2). | Both directions match §2.8; zero allowed only as field square. |
| legendre_two_by_four_subgroup; 3; 67 | Field F, Finite F, DecidableEq F, 2≠0, η≠0,η²≠1 | F₅,η=2: P=(2,1),2P=(0,0),T=(1,0), image size 8=2·4. F₇: P=(3,1),2P=(1,0),T=(0,0), size 8. F₉,η=i: size 8 inside group size 16. | Matches §3.1; F₃ has 0 admissible η. |
| legendre_minus_one_point_count_v_two; 3; 75 | prime p, p mod8=5 | p=5,13,29: counts 8,8,40, valuations 3,3,3. p=41 excluded: count32, valuation5. | Matches §3.7; positive projective count makes the zero junk value irrelevant. |
| scaledLegendre_minus_one_trace_zero; 5; 83 | prime p, p mod4=3, arbitrary u:ZMod p | (p,u)=(3,1),(7,2),(3,0): counts4,8,4 equal p+1; traces0. (5,1) excluded: count8≠6,trace−2. | Matches §5.1, including singular u=0. |
| quadraticTwistOf_frobeniusTrace; 5; 91 | Field F, Fintype F, DecidableEq F, 2≠0, W.IsCharNeTwoNF, arbitrary d | F₅,L(3),d=2: −2=(−1)·2; d=4:2=1·2; d=0:0=0·2. Singular λ=0,d=2:−1=(−1)·1. F₉,W:y²=x³+x+1,d=1+i:6=(−1)(−6). | Matches §5.2; singular inputs and zero scalar are retained. |

Headline inventory: full-two-torsion normalization; good-prime parameter units; odd character-conductor divisibility; split-cubic halving; the two-by-four subgroup; exact two-part eight; symmetric-cubic trace zero; normal-form quadratic-twist trace. Seven are stated. The eighth, actual elliptic-conductor divisibility (§1.5), is named in the module docstring with the missing genuine-conductor carrier. The general character-count identity (§5.1), explicit points (§§3.2,4.1), root readings and support theorem are supporting inputs, not weakened replacements for a missing headline. No statable advertised headline is absent.

### README target and API audit

Locations are in packages/EllipticLegendreCharacterInterfaces/README.md. Every numbered target is covered below, followed by each of the 34 supporting API bullets. These are composite statements exactly where the README groups several conclusions. In characteristic different from two the common split-field context is d≠0, λ≠0,1; group assertions also require decidable equality. The finite enumerations independently checked 232 split models and 2,496 affine points over F₃,F₅,F₇,F₁₃,F₉, all their labelled doubling kernels and both directions of halving. They also checked 22 square-parameter subgroup instances and 38,229 normal-form twist identities over those fields, including every zero scalar.

| Statement; location | Instances and computed values on both sides | Result; change |
|---|---|---|
| §0.1 definition; 67 | λ=2/ℚ: y²=x³−3x²+2x=x(x−1)(x−2); x=2 gives 0=0, x=−2 gives 0≠−24. λ=0,1: Δ=0. | Correct; none. |
| §0.2 definition and twist; 94 | d=2,λ=1/2 gives a₂=−3,a₄=2; native t=0,n=−1/2 gives D=0−4(−1/2)=2, same coefficients. d=0 gives zero coefficients on both sides. | Correct; none. |
| §0.3 six-label definition; 118 | λ=3 gives (3,1/3,−2,−1/2,3/2,2/3); λ=−1 gives (−1,−1,2,1/2,1/2,2); λ=0 gives (0,0,1,1,0,0). | Correct total division and repeated labels; none. |
| §0.4 Δ,c₄,ellipticity,j; 144 | λ=−1/ℚ gives Δ=64,c₄=48,c₄³/Δ=1728; λ=1/2 gives Δ=1,c₄=12,j=1728. F₃,λ=2: Δ=1,c₄=0,j=0. F₂: Δ=0. | Both directions of the field criterion valid; zero ring not treated as a field. |
| §0.5 scaled invariants; 160 | d=2,λ=3: Δ=36864=2⁶·576,c₄=448=2²·112; j=21952/9 on both models. d=0:Δ=0. | Correct d⁶/d² powers; none. |
| §0.6 root ratios; 176 | Roots(3,5,9), orders012,021,102,120,210,201: (6/2,2/6,−2/4,4/−2,−6/−4,−4/−6), giving the six displayed values at3. Roots(0,0,1):1/0=0, excluded. | Correct ordering and denominators; none. |
| §0.8 split normalization; 192 | Roots(3,5,9): original(a₂,a₄,a₆)=(−17,87,−135); x_old=x_new+3 gives(−8,12,0)=L(2,3). | Correct action direction; no unnecessary square root of2. |
| §0.9 full-two normalization; 208 | ℚ and F₃, y²=x³−x: four killed points, d=1 and λ=−1. ℚ,y²=x³−2x: only2 killed points. | Correct; arbitrary characteristic≠2 and universe retained. |
| §0.10 labelled points; 224 | d=2,λ=1/2: roots0,2,1, all y=0; each is distinct from O. Their derivative products are2,2,−1, all nonzero. | Correct native nonsingular constructors; none. |
| §1.1 valuations; 258 | At p=3, λ=3: (a,b,vj)=(1,0,−2); λ=1/3:(−1,−1,−2); λ=−2:(0,1,−2); λ=−1:(0,0,3). | All three bad cases and integral nonunit j tested; none. |
| §1.2 good-prime units; 275 | L(−1) at p=3: Δ=64 unit, parameter valuations(0,0). Uniformizer scaling by3 changes Δ to3¹²·64 and displayed valuation to12; minimal-curve parameter conclusions remain(0,0). | Correct curve-level hypothesis; none. |
| §1.3 unit good model; 291 | λ=3,p=5: Δ576≡1, λ̄=3,1−λ̄=3; p=3: v₃Δ=2, λ̄=0, unit hypothesis false. | Unit discriminant gives native minimality; none. |
| §1.4 odd support; 307 | λ=3, ω=1,−1,2,−2: conductors12,3,24,24, all odd support{3}; v₃Δ(L(3))=2 and v₃j=−2 imply bad reduction. λ=−1:4,1,8,8, empty odd support. | Correct including conductor1; none. |
| §1.5 conductor divisibility; 323 | L(−1), M=32: four odd conductors1, and1 divides32. λ=3: odd character conductor3, bad prime3 supplies positive conductor exponent. | General argument uses actual conductor supplier; explicit M=32 remains source-dependent. |
| §2.1 CRT equivalence; 351 | Roots0,2,6: X+1↦(1,3,7); inverse interpolation sends(1,3,7) back to X+1 modulo X(X−2)(X−6). At repeated roots(0,0,1) no inverse exists. | Correct canonical map with ordered roots; none. |
| §2.3 squareclass equivalence; 375 | At roots0,2,6, X+1↦(1,[3],[7]); constant2↦([2],[2],[2]); constant4↦(1,1,1). | Mathematical equivalence correct; R01 repairs nondiscriminating Checks. |
| §2.5 nonroot descent and O; 399 | L(−1)/F₅,P=(2,4): raw(2,1,3), product6=1=y²; O↦(1,1,1). Root x=0 would have a zero nonunit in the raw formula. | Correct branch separation; none. |
| §2.6 root descent; 415 | d=2,λ=3/ℚ: tuples(12,−2,−6),(2,−8,−4),(6,4,24); products144,64,576. F₅,L(−1): classes(1,1,1),(1,[2],[2]),(1,[2],[2]). | Correct derivative entry and signs; none. |
| §2.7 coordinate product; 431 | Nonroot: product=y²; roots at d=2,λ=3:144=12²,64=8²,576=24²; O product1. | All branches give squareclass1; no unstated norm comparison. |
| §2.8 halving; 446 | P=(0,0),L(−1)/ℚ: false↔false from(0,−1,1). Over F₅: true↔true from(0,4,1). P=(1,0)/F₅:false↔false from(1,0,2). | Both implications and root case correct; none. |
| §3.1 subgroup and divisibility; 472 | F₅,η=2: order4 P=(2,1), independent T=(1,0), eight sums. F₇,η=2: P=(3,1),2P=(1,0),T=(0,0), eight sums. F₉,η=i:count16. | Square/nonsquare minus-one branches valid; none. |
| §3.2 chosen half; 490 | F₅,i=2:P=(2,4),y²=cubic=1,2P=(0,0); i=3:P=(3,3),y²=cubic=4,2P=(0,0). | Correct membership and exact order4; none. |
| §3.6 no order8; 514 | p=5,13: counts8,8, orders{1,2,4}; nonzero divisible two-root only0. p=41: P=(6,13),2P=(9,33),4P=(0,0),8P=O. | Congruence essential and retained; none. |
| §3.7 exact two-part; 530 | p=5,13,29: counts8,8,40, v₂=3 each; C₄×C₄: cardinality16, doubling-kernel cardinality4 and all3 nonzero two-points divisible. | Proof's final exclusion of order16 is necessary and present. |
| §4.1 conic witness; 558 | F₅,t=v=2,i=3: P=(4,3),y²=cubic=4,2P=(1,0). i=2:P=(3,4),y²=cubic=1. F₉,t=v=1:P=(1+i,1−i),y²=cubic=i,2P=(1,0). | Correct source repair and characteristic3 case; none. |
| §5.1 normal-form count/trace; 594 | F₅,L(3): Σχ=−2, count4=6−2,trace2. Singular L(0):Σχ=−1,count5,trace1. F₂,y²=x³+1: actual3 vs proposed4, excluded. | Correct all odd finite fields, singular solutions included. |
| §5.1 symmetric cubic; 596 | F₇,u=2: χ vector(0,1,0,1,−1,0,−1),sum0,count8,trace0. F₃,u=0: root counts(1,2,0),count4,trace0. | Correct cancellation at fixed point0 and singular parameter. |
| §5.2 arbitrary scalar trace; 612 | F₅,L(3),d=2: traces2→−2; d=4:2→2; d=0:2→0. F₉,x³+x+1,d=1+i:−6→6. | Correct multiplicativity and zero branch; none. |
| §5.2 good Euler consequence; 616 | F₅,λ=3: before1−2T+5T², after d=2:1+2T+5T². λ=0 or d=0 fails ellipticity and is excluded from this consequence. | Correct signs and scope; none. |
| §0.1 API equation; 73 | λ=2,x=2,y=0: both equations0=0; x=−2,y=0: both equations0=−24 false. | Equivalent; none. |
| §0.1 API coefficient map; 74 | ℤ→F₅, λ=3: a₂=−4↦1,a₄=3↦3; same coefficients as L(3)/F₅. | Correct; none. |
| §0.1 API injectivity; 75 | λ=2,μ=3 overℚ: a₄ values2≠3, models unequal; λ=μ=2: identical. Zero ring: one input and one model. | Both directions correct; none. |
| §0.1 API normal form; 76 | λ=0,2 and zero ring: a₁=a₃=0; λ=0 still Δ=0. | Correct; normal form imposes no ellipticity. |
| §0.2 API equation; 100 | d=2,λ=1/2: expanded x³−3x²+2x equals x(x−2)(x−1); x=3 yields6 on both. | Correct; none. |
| §0.2 API d=1; 101 | λ=3: both coefficient lists(0,−4,0,3,0). | Correct identity; existing first Check only restates it. |
| §0.2 API coefficient map; 102 | ℤ→F₅,d=2,λ=3: a₂=−8↦2,a₄=12↦2 on both sides. | Correct; none. |
| §0.2 API twist ellipticity; 103 | ℚ,d=2,λ=3: D=2,Δ36864≠0; d=0: D=0,Δ=0; λ=0 with d=2:Δ=0. | Both directions correct; none. |
| §0.3 API evaluations; 124 | λ=3: (3,1/3,−2,−1/2,3/2,2/3); same six direct quotients. | Correct; none. |
| §0.3 API admissibility; 125 | λ=3: all six ≠0,1. λ=0: entries0,0,1,1,0,0; excluded. | Correct; none. |
| §0.3 API inverse pairs; 126 | λ=3:3·1/3=(−2)(−1/2)=(3/2)(2/3)=1; λ=0 first product0≠1. | Nonzero exclusions essential; none. |
| §0.3 API field transport; 127 | F₃→F₉,λ=2: tuple(2,2,2,2,2,2) before and after; identity ℚ→ℚ,λ=3 fixes the generic tuple. | Correct including extension; none. |
| §0.10 API coordinates; 230 | d=2,λ=1/2: (0,0),(2,0),(1,0) in that order. | Correct; none. |
| §0.10 API doubling; 231 | L(−1)/F₃: 2(0,0)=2(1,0)=2(2,0)=O. | Correct; none. |
| §0.10 API injective/nonzero; 232 | d=2,λ=1/2: x-coordinates0,2,1 distinct, three affine constructors distinct from O. d=0 makes roots collide and is excluded. | Correct; none. |
| §0.10 API exhaustion; 233 | L(−1)/F₅: exact kernel{O,(0,0),(1,0),(4,0)}; (2,4) doubles to(0,0)≠O. | Both inclusions correct; none. |
| §2.1 API polynomial reading; 357 | d=2,λ=3: X+1→(1,3,7), X²→(0,4,36),1→(1,1,1). | Correct; none. |
| §2.1 API equality detection; 358 | f=X(X−2)(X−6): h=X+1 and h+f have identical evaluations(1,3,7) and identical quotient class; h+1 has(2,4,8), distinct. | Both directions correct; none. |
| §2.1 API root; 359 | d=2,λ=3: θ→(0,2,6); swapping labels yields(0,6,2)≠(0,2,6). | Correct orientation; none. |
| §2.1 API units; 360 | X+1 has all evaluations1,3,7 nonzero and is a unit; X has evaluation0 at first root and is not a unit. | Both directions correct; none. |
| §2.3 API unit reading; 381 | X+1 at roots0,2,6 gives(1,[3],[7]); constant2 gives diagonal[2]. | Correct statement; R01 for Checks. |
| §2.3 API identity; 382 | Constant1→(1,1,1); constant4 gives the same quotient element and image. | True; these are not two discriminating tests. |
| §2.3 API detection of triviality; 383 | Constant4: trivial↔all three trivial. Constant2: nontrivial↔not all trivial. X+1 has two nontrivial coordinates. | Both directions correct; none. |
| §2.3 API multiplication/equivalence; 384 | (X+1)² evaluates(1,9,49), classes all1=(1,[3],[7])². Interpolation supplies inverse on any unit triple, e.g.(2,1,1). | Correct bijective multiplicative transport; none. |
| §3.2 API coordinates; 496 | i=2/F₅ gives(2,4); i=3 gives(3,3), not their negatives(2,1),(3,2). | Correct selected signs; none. |
| §3.2 API double; 497 | Both F₅ points double to(0,0); tangent denominators3 and1 are nonzero. | Correct; none. |
| §3.2 API order; 498 | For both points:2P=(0,0)≠O,4P=O, order4. | Correct; none. |
| §3.2 API first descent; 499 | F₅,i=2 or3: first class nonsquare, χ=−1; F₁₇,i=4: χ=+1. | General squareclass claim correct; nonsquareness not overclaimed. |
| §3.2 API field map; 500 | F₃[i] identity carries(i,1−i) to itself; Frobenius i↦−i gives(−i,1+i), exactly the chosen point for−i. | Correct map on coordinates; none. |
| §4.1 API coordinates; 564 | t=v=2/F₅,i=3 gives(4,3); i=2 gives(3,4). | Correct signs; none. |
| §4.1 API double; 565 | Both F₅ choices give(2λ,0)=(1,0); F₉,t=v=1 gives(1,0) too. | Correct; none. |
| §4.1 API order; 566 | For these instances 2P=(1,0)≠O,4P=O,order4. | Correct; none. |
| §4.1 API third descent; 567 | F₅,i=3: x−2λ=3=4itv; i=2:x−2λ=2=4itv. | Correct, both nonsquare; none. |
| §4.1 API field map; 568 | F₉ Frobenius i↦−i sends(1+i,1−i) to(1−i,1+i), which is exactly the construction at−i,t=v=1. | Correct parameter transport; none. |

### Every README Check

Each row is one bullet, identified by section and its ordinal, with its original line. Repeated bullets are recorded separately, not silently counted as new mathematical coverage. “True” records the displayed computation; it does not certify that a repeated or structural statement is discriminating. The generic assertions at lines109,407,439 merely repeat API/proof identities; the R04 replacement computations below make them actual tests. The conductor value32 is separately limited under Not verifiable.

| Check; line | Computed values and comparison | Result; change |
|---|---|---|
| 0.1.1;82 | λ2:a₂=−3; f(2)=0, f(−2)=−24. Wrong sign gives f_wrong(2)=24,f_wrong(−2)=0. | True; none. |
| 0.1.2;83 | λ−1:a₂=0,a₄=−1, cubic=x³−x. | True; none. |
| 0.1.3;84 | Δ(2)=16·4·1=64; Δ(1/2)=16·(1/4)·(1/4)=1. | True; none. |
| 0.1.4;85 | λ0:cubic=x²(x−1), Δ=0; (0,0) has both partial derivatives0. | True overℚ; none. |
| 0.1.5;86 | F₃,λ2:Δ=64=1,c₄=48=0,j=0. | True; none. |
| 0.1.6;87 | Zero ring:Δ=0=1, inverse0, Δ·0=1. | True; no field criterion applied. |
| 0.1.7;88 | F₅[ε]/ε²:λ2+ε,Δ=4+2ε; (4+2ε)(4+3ε)=16+20ε=1. | True; none. |
| 0.2.1;109 | L(1,1/2)=L(1/2), both(0,−3/2,0,1/2,0). Coordinate scaling by1 gives the same list. | True but nondiscriminating; R04. |
| 0.2.2;110 | d2,λ1/2:a₂=−3,a₄=2,Δ64. Coordinate scaling by2 would give a₂=−6,a₄=8. | True; none. |
| 0.2.3;111 | d0:five coefficients0,Δ0 for λ0,1,3 alike. | True; boundary model admitted only as equation. |
| 0.2.4;112 | t0,n−1/2:D2; t0,n−2:D8. | True; none. |
| 0.3.1;133 | λ−1: (−1,−1,2,1/2,1/2,2), image size3, labels6. | True; none. |
| 0.3.2;134 | λ2:(2,1/2,−1,−1,2,1/2), image size3. | True; none. |
| 0.3.3;135 | λ1/2:(1/2,2,1/2,2,−1,−1), image size3. | True; none. |
| 0.3.4;136 | λ3:(3,1/3,−2,−1/2,3/2,2/3), image size6. | True; none. |
| 0.3.5;137 | λ3:image6; λ−1:image{−1,2,1/2}, size3. | True; repeats earlier data. |
| 0.3.6;138 | λ0:(0,0,1,1,0,0); λ1:(1,1,0,0,0,0). | True with inverse0=0; none. |
| 0.4.1;152 | λ−1,2,1/2:j1728 each; characteristic2:16=0 soΔ0. | True on elliptic domains; none. |
| 0.4.2;153 | λ−1:(Δ,c₄,j)=(64,48,1728),48³/64=1728. | True; repeats first value. |
| 0.4.3;154 | F₂:Δ0; F₃,λ2:Δ1,j0. | True; none. |
| 0.5.1;168 | d2,λ1/2:Δ64,c₄48,j1728; d0:Δ0. | True; none. |
| 0.5.2;169 | Same tuple(64,48,1728),d0:Δ0. | True; same instance as previous bullet. |
| 0.5.3;170 | d2,λ3:Δ16·64·9·4=36864,c₄16·4·7=448. | True; none. |
| 0.6.1;184 | Roots(0,1,−1): exceptional tuple at−1; roots(0,1,3): generic tuple at3. | True; none. |
| 0.6.2;185 | Roots(3,5,9): six fractions6/2,2/6,−2/4,4/−2,−6/−4,−4/−6. | True; none. |
| 0.6.3;186 | Roots(0,0,1): first ratio1/0=0, invalid parameter. | True; none. |
| 0.8.1;200 | e=(3,5,9):d=5−3=2,λ=(9−3)/2=3; translated roots0,2,6. | True; none. |
| 0.8.2;201 | a₂−17+3·3=−8;a₄87+2(−17)3+3·9=12;a₆−135+87·3−17·9+27=0. | True; none. |
| 0.8.3;202 | d2∉ℚ²: a rational square has even v₂, while v₂2=1. | True for the stated unscaled coordinate normalization. |
| 0.9.1;216 | ℚ,x³−x roots−1,0,1; with O, kernel cardinality4; d1,λ−1. | True; none. |
| 0.9.2;217 | F₃:all three x are roots, exactly3 affine points plusO, Δ1. | True; none. |
| 0.9.3;218 | ℚ,x³−2x=x(x²−2):only rational root0; kernel cardinality2. | True; none. |
| 0.10.1;239 | d1,λ−1:labelled points(0,0),(1,0),(−1,0), none isO. | True; none. |
| 0.10.2;240 | d2,λ1/2:points(0,0),(2,0),(1,0), none isO. | True; none. |
| 0.10.3;241 | d1,λ3:horizontal line has roots0,1,3; T₀+T₁=T₃, then sumO; every doubleO. | True; none. |
| 0.10.4;242 | F₃,L(−1):{O,(0,0),(1,0),(2,0)}, all four doubleO. | True; none. |
| 1.1.1;266 | p3,λ3:(1,0,−2); λ1/3:(−1,−1,−2); λ−1:(0,0,3). | True; none. |
| 1.1.2;267 | p2,λ2:j1728=2⁶·27,v₂j6,v₂λ1. | True negative control; none. |
| 1.1.3;268 | j(3)=j(1/3)=21952/9; numerator not divisible3, valuation−2. | True; repeats1.1.1. |
| 1.1.4;269 | λ−1:j1728=3³·64; valuations(0,0,3). | True; repeats1.1.1. |
| 1.2.1;283 | Parameters−1,2,1/2 and complements2,−1,1/2 have numerators/denominators supported only at2; all odd valuations0. | True; none. |
| 1.2.2;284 | p3:λ−1 unit, complement2 unit, v₃j3. | True; none. |
| 1.2.3;285 | Scaling L(−1) by3 gives y²=x³−81x,Δ=64·3¹²; displayed v₃Δ12 vs minimal0. | True; same curve, different equation. |
| 1.3.1;299 | λ3:Δ576, v₅Δ0, v₃Δ2; v₅λ0 vs v₃λ1. | True; none. |
| 1.3.2;300 | p5:576≡1,λ̄3,1−λ̄3; p3:λ̄0,v₃Δ2. | True; repeated unit test. |
| 1.3.3;301 | Only nonzero F₂ element1;1−1=0. There are0 admissible residue parameters. | True negative control; none. |
| 1.4.1;315 | λ3:odd support{3}; λ−1,2,1/2:classes among±1,±2, conductors1,4,8 only. | True; none. |
| 1.4.2;316 | Fundamental discriminants for3,−3,6,−6 are12,−3,24,−24; absolute conductors12,3,24,24; odd parts3. | True; none. |
| 1.4.3;317 | For−1,1,−2,2:discriminants−4,1,−8,8; conductor4,1,8,8; odd parts1. | True; none. |
| 1.5.1;331 | Given M32, all four odd conductors1 and32=1·32. Value M32 requires the actual conductor comparison. | Divisibility true; numerical M limited below. |
| 1.5.2;332 | Same M32 and odd conductors1,1,1,1. | True conditional on M; duplicate instance. |
| 1.5.3;333 | λ3,ω1:D12,N12,odd part3;Δ576=2⁶·3², a different construction. | True; no false identification with conductor. |
| 2.1.1;366 | d1,λ−1:θ evaluates(0,1,−1). | True; none. |
| 2.1.2;367 | d2,λ1/2:θ evaluates(0,2,1). | True; none. |
| 2.1.3;368 | θ first component0, so no inverse; inverse equation0·a=1 impossible inK. | True; none. |
| 2.1.4;369 | Roots0,2,6:X+1→(1,3,7),X²→(0,4,36),1→(1,1,1). | True; none. |
| 2.3.1;390 | [1]→(1,1,1), unchanged by all6 coordinate permutations. | True but not discriminating; R01. |
| 2.3.2;391 | [4]=[1], output(1,1,1), unchanged by all6 permutations. | Same input as preceding quotient Check; R01. |
| 2.3.3;392 | [2]≠1 overℚ, output([2],[2],[2]), unchanged by all6 permutations. | Does not test root order; R01. |
| 2.3.4;393 | Constant0 gives(0,0,0), not in unit triple; every permutation still gives(0,0,0). | Valid domain control; keep with R01. |
| 2.5.1;407 | Formal product=x(x−d)(x−dλ)=y², hence class1; no concrete instance supplied. | Restates product target; R04 supplies36=1/F₇. |
| 2.5.2;408 | F₅,(2,4):representatives(2,1,3),product6≡1=y²,characters(−1,1,−1). | True; none. |
| 2.5.3;409 | x0 raw first entry0, whereas corrected entry at d1,λ−1/F₅ is4. | True; nonunit branch excluded. |
| 2.6.1;423 | F₅ classes at0,1,4:(1,1,1),(1,[2],[2]),(1,[2],[2]); conic d2,t=v2,λ3 at root1 gives raw(1,4,4), all squares. | True; none. |
| 2.6.2;424 | Raw(4,4,1),(1,2,2),(4,3,2); class3=class2 since3/2=4 square. | True; none. |
| 2.6.3;425 | d2,λ3/ℚ:products12(−2)(−6)=144,2(−8)(−4)=64,6·4·24=576. | True; none. |
| 2.7.1;439 | Formal root product=d⁴λ²=(d²λ)²; no instantiated value. | Restates preceding proof; R04 supplies144=12². |
| 2.7.2;440 | O product1; F₅,P(2,4):[2·1·3]=[6]=[1]. | True; none. |
| 2.8.1;454 | Overℚ,−1 not square, no half of(0,0); F₅:(2,4) doubles to(0,0). | True; none. |
| 2.8.2;455 | ℚ differences0,−1,1:not all squares; F₅:0,4,1 all squares. | True both directions; repeated instance. |
| 2.8.3;456 | F₅,(1,0):differences1,0,2;2 nonsquare, no half. | True; none. |
| 3.1.1;480 | F₇,η2:λ4,count8. η0,1,−1 give λ0,1,1,Δ0. | True; none. |
| 3.1.2;481 | F₅,P(2,1):cubic1=y²,2P(0,0); T(1,0)≠2P and order2. | True; independent subgroup size8. |
| 3.1.3;482 | F₉,i²2:P(i,1−i),y²=i=cubic,2P(0,0);count16. | True; none. |
| 3.1.4;483 | F₃:nonzero squares both1, so0 admissibleη. | True exclusion; no conclusion asserted on empty parameter set. |
| 3.1.5;484 | F₇,P(3,1):2P(1,0),order4;T(0,0),order2; eight distinct sums. | True; none. |
| 3.2.1;506 | F₅,i2:P(2,4),2P(0,0)≠O,4P=O. | True; none. |
| 3.2.2;507 | i2:y²1=cubic1,2y3; i3:y²4=cubic4,2y1. | True nonzero denominators; none. |
| 3.2.3;508 | F₅ squares{0,1,4}:i2,3 nonsquare; F₁₇:i4=2² square. | True; nonsquareness congruence retained. |
| 3.6.1;522 | p5:count8,point orders1,2,4; exponent4. | True; none. |
| 3.6.2;523 | p13:count8,point orders1,2,4. | True; none. |
| 3.6.3;524 | p41:P(6,13),2P(9,33),4P(0,0),8P=O,count32. | True negative control; none. |
| 3.7.1;538 | Counts8,8,40=2³·1,2³·1,2³·5 at5,13,29. | True; none. |
| 3.7.2;539 | Same counts:quotients1,1,5,each odd; all remainders mod16 are8. | True; repeats3.7.1. |
| 3.7.3;540 | C₄²:four elements killed by2,16 total,exponent4; all3 nonzero two-points are doubles. | True; supplies missing group-theoretic distinction. |
| 4.1.1;574 | F₅,i3:corrected(4,3),y²4=cubic4; printed(4,4),y²1≠4. | True source negative control. |
| 4.1.2;575 | F₅,i2:corrected(3,4),negative(3,1);both y²1=cubic1. | True; membership alone cannot select sign. |
| 4.1.3;576 | i3:r4,s2,r²−s²2,r+s1,double(1,0);i2:s3,r+s2,double(1,0). | True; both order4. |
| 4.1.4;577 | i3:differences4,2,3,product24≡4; i2:3,1,2,product6≡1; thirdχ−1 both. | True; none. |
| 4.1.5;578 | F₉,t=v1,λ2:P(1+i,1−i);square i=cubic i;double(1,0). | True; none. |
| 5.1.1;602 | F₃,u1:f values0,0,0; root counts1,1,1; plusO gives4,trace0. | True; none. |
| 5.1.2;603 | F₇,u2:χ=(0,1,0,1,−1,0,−1);sum0,count8,trace0. | True; none. |
| 5.1.3;604 | F₃,u0:x³ values0,1,2;root counts1,2,0;count4,trace0. | True; singular point included. |
| 5.1.4;605 | F₅,u1:count8,trace6−8=−2,not0. | True excluded congruence. |
| 5.1.5;606 | F₂,x³+1:f values1,0;one root each,count3;χ values1,0 give proposed4. | True excluded characteristic. |
| 5.2.1;620 | F₅,λ3,d2:counts4→8,traces2→−2,χ2=−1. | True; none. |
| 5.2.2;621 | F₅,λ3,d4:counts4→4,traces2→2,χ4=1. | True; none. |
| 5.2.3;622 | F₅,λ0,d2:singular counts5→7,traces1→−1. | True; none. |
| 5.2.4;623 | F₅,d0:cuspcount6,trace0=χ0·trace(original). | True; no good Euler polynomial. |
| 5.2.5;624 | F₉,W:x³+x+1:count16,trace−6; d1+i,χ−1,twistcount4,trace6. | True; nonsquare finite-extension case. |


### Boundary and convention coverage

The common field assumptions exclude the zero ring; the two coefficient definitions deliberately admit it. The generic field statements do not assume perfection. The finite-field statements explicitly require finiteness, and the reduction statement uses ℚ_p and its valuation ring, not an arbitrary DVR. No target quantifies over a scheme, cover, fan, topological group, coefficient representation or arbitrary module: non-quasi-separated schemes, noncompact groups, rank-zero modules and ramified coefficient towers cannot be substituted into these signatures.

| Boundary or convention | Computed witness | Consequence |
|---|---|---|
| Empty affine solution set versus the point at infinity | Every pointCount adds1: even an empty affine set would give1, not0; the zero polynomial over F₅ gives5 affine solutions and projective count6. | The infinity term and nonzero cardinality are retained. |
| Trivial versus nontrivial character | Radicand1 has discriminant1, conductor1 and value1 at every prime. Radicand−1 has conductor4 and value−1 at3. | Character nontriviality is not silently assumed. |
| Characteristic2 and3 | F₂ has no λ≠0,1; F₃ has λ2 with Δ1 and all four rational points killed by2. | Characteristic2 excluded where needed; characteristic3 retained. |
| Natural-number and valuation junk values | padicValNat2(0)=0, whereas all point counts are at least1; padicValRat3(0)=0 although0 is not a unit; inverse0=0 gives the boundary six-tuples above. | Each unit inference has nonzero operands; no zero-valuation inference is applied to0. |
| Purely inseparable transport | F₃(t)→F₃(s), t↦s³: L(t) maps to coefficients(0,−1−s³,0,s³,0), exactly L(s³); Δ maps to16s⁶(1−s³)²≠0. | No separability hypothesis is needed for coefficient transport or distinctness of these three roots. |
| Nonreduced base and zero ring | F₅[ε]/ε²: Δ(2+ε)=4+2ε with inverse4+3ε; zero ring: Δ=0=1 is a unit. | Ring definitions and unit-discriminant ellipticity agree; the field iff is not extended to arbitrary rings. |
| Identity and direction of coordinate change | Identity fixes L(−1); translation x_old=x_new+3 sends roots(3,5,9) to(0,2,6). | The action in the normalization headline has the correct direction. |
| Nonabelian and cyclic group controls | S₃ has4 elements killed by2 but is not commutative; C₄ has2, C₂² has4, and C₄² has4 with order16. | S₃ and Q₈ cannot inhabit the native elliptic AddCommGroup; the proof does not infer order8 from kernel size4 alone. |
| Trace and Euler signs | Over F₅, counts4 and8 give traces2 and−2; Euler polynomials1−2T+5T² and1+2T+5T². | The scalar twist sign is consistent in both layers. |
| Ordered unit squareclasses | At roots(0,2,6), X+1 gives(1,[3],[7]); X gives a zero component and is not a unit; constants cannot detect a permutation. | The construction is sound; R01 repairs its Checks. |

## Not verifiable

- S09, Chapters III.1–III.2, V.1 and X.1 Proposition1.4, and K84 p.41 are settled uncertified references. Their texts were not supplied legally; their contents and exact locator support were not certified in this pass. Their manifest keys and status were retained, with no renewed source request.
- The numerical assertion that y²=x³−x has actual conductor32, used in README Checks1.5.1–1.5.2, was not independently derived from a legally available primary source. The supplied conductor contract and all four character conductors were checked; the arithmetic conclusions1∣32 were tested conditionally on that value. This is a verification limit, not evidence that the value is wrong.
- No Lean elaboration or build was run, as required by the read-only brief. All9 supplied elaborated signatures were compared with the source and README; none lost a binder. The report does not claim a fresh build.
- The supplier contracts were checked as roadmap statements, not as completed implementations. Finite enumeration supplies counterexample searches, not proofs of the general admitted theorems.
- Ownership against the50 explicitly supplied open-roadmap folders and the named suppliers was checked. Exhaustive ownership verification against every other open pull request was not performed; service-wide object searches were used as additional leads, not treated as complete inspection of unspecified heads.

## Source issues

- **Misprint** in BS20 at §6, two-descent coordinate formulas, printed p.370 (BS20 lines659–661): the source says the coordinate formulas apply whenever the point differs from the corresponding two-torsion point; it should be restricted also to affine points, with the identity assigned the trivial triple; affects nothing.
- **Error** in BS20 at §6, proof of Lemma6.6, printed p.371 (BS20 line718): the source says the displayed pair is an order-four point on the scale-two twist; it should be the point with y-coordinate8itv(t+iv), whose double is(2λ,0); affects the proof.
- **Misprint** in BS20 at §6, proof of Lemma6.6, printed p.371 (BS20 line718): the source says the displayed point belongs to E(F_p); it should be a point of F′_λ(F_p), the scale-two twist used there; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "a5ea30cb8a2d09bfe7516b014eebf2780e49e3f4", "job": "RT-EllipticLegendreCharacterInterfaces~1a", "model": "gpt-6-astra", "worker": "chris-16"} -->
