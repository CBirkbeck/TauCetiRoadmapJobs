<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1067#issuecomment-6397869495 -->
Review (codex) of 7e4f54f

Verdict: accepted
Conditional on the announced gaps: `toric-field-fibres`, `perfected-cone-algebras`, `homogeneous-cone-approximation`, `operational-chow-finite-orbits`, `ample-generic-cuts`, `geometric-morphism-cup-pullback`, `split-torus-divisors`

No package findings: 0 P1, 0 P2 and 0 P3. Acceptance is conditional on the seven declared supplier contracts listed below. None of the four authored package files was changed.

## Verified sound

### Previous findings, checked first

All four findings in the previous review are repaired. None was marked not actionable. Locations in this table refer to `packages/AnalyticToricGeometryPartII/README.md`, except the manifest row.

| Previous finding | Status | Repaired passage and verification |
| --- | --- | --- |
| F01, redundant positivity gap | Repaired | Line 13: “AbelianSchemesAndArithmeticModuli §A2.7 owns `ampleIntersectionPositive`”. Line 89 states its arbitrary-field hypotheses and component sum. Lines 706, 715, 732 and 740 consume that owner. Its actual statement is at `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:1230`, head `71ecc01`. The obsolete slug occurs neither in the README nor in `design/plan.json`; seven matching gaps remain. On two ruling fibres, the sum is 1+1=2; an inseparable degree-p point contributes p, not 1. |
| F02, repeated convolution bullets | Repaired | Line 412: “The named convolution operation has coefficient (f*g)_z=Σ_(x+y=z) f_x g_y, with the sum converging by the c₀ condition.” Construction and norm bound occupy that same bullet; line 413 is the distinct singleton law. The previously duplicated bullets are absent. For 2χ^(0,1) and 3χ^(0,−1), convolution gives 6χ^(0,0), while pointwise multiplication gives 0. |
| F03, fibre class wording | Repaired | Line 710: “the total class is (2,0) and its degree against H=O(1,1) is 2: each fibre has class (1,0) and degree 1.” Thus the union has degree 2 and two components. Two separate class-(2,0) inputs would instead have degree 4. Lines 694, 727, 736 and 752 agree with the repaired calculation. |
| F04, missing manifest page | Repaired | `packages/AnalyticToricGeometryPartII/sources.toml:10` now includes “249–251”. SCH12 line 237 starts printed p. 251; Lemma 1.16 is at SCH12 line 271, before p. 252 at SCH12 line 284. Both Theorem 1.13 on p. 249 and Lemma 1.16 on p. 251 are covered. |

The adversarial table of the previous review contains 117 rows with actual computed values. I read those rows and use them only for unchanged assertions, not its unsubstantiated summaries. Every changed passage, the new inseparable-point Check, all fifteen newly sampled targets, and the headline results were examined again. Searches for the repaired patterns found no remaining positivity-gap duplication, fibre-class confusion or repeated trailing Checks. The separate §2.2 coefficient, summability, singleton and norm statements express distinct properties.

### Principles, structure and Lean

The roadmap extends AnalyticToricGeometry's finite-fan algebraic and complex programme. Arbitrary coefficient rings, nilpotents, singular fans where stated, rank zero, p=2 and complete nonprojective fans remain admitted. Projectivity is introduced for the positive-intersection endpoint, with complete regular fans retained for hypersurface approximation. The general constructions belong to named suppliers; their toric specializations and fixed-fan comparisons belong here. I found no route-specific shortcut, computational-algorithm target, source-copy passage, upward dependency, hidden cycle, sorried data or option override.

I read the main-branch shape examples `TauCetiRoadmap/AnalyticToricGeometry/README.md`, `TauCetiRoadmap/AdicSpaces/README.md` and `TauCetiRoadmap/AdicSpacesPartIII/README.md`. The package has seven layers, each with Examples and Dependencies, 29 numbered targets and 29 Needs lines. Its twelve principal definition/construction subsections have prose API lists; every target has at least three Checks, 102 Check bullets in total. All Needs lines, proof routes, coefficient conventions, references and the one-line metadata file were read. The source manifest parses and has four distinct work keys. No author-marked unverified locator, waiver or uncertified entry remains.

The content main snapshot is `35c9f96d09370061f84422fd640552aaf1609e8d`. The pins in `lake-manifest.json` are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

The required `lake env lean` command was run from the content checkout on `packages/AnalyticToricGeometryPartII/Suggested.lean`, passing its absolute filename as required: exit 0, no output, no warnings. It contains exactly one `import Mathlib`, zero declarations and zero admitted proofs. The mechanical declaration inventory was empty; the resulting scratch signature probe containing just the import also elaborated, exit 0 without warnings. There are no missing binders, theorem bodies for a one-tactic probe, padding declarations or fully qualified name collisions. No Tau Ceti module build was necessary. Both Lean processes finished.

### Headline inventory

The following are the README's geometric headline results. Each is explicitly named, with its missing carrier, in `packages/AnalyticToricGeometryPartII/Suggested.lean:8`. Inspection at the pins, detailed below, confirms that none can be stated at this generality using only a few simple definitions.

| Headline | Missing construction at the pins |
| --- | --- |
| §§0.3–0.6: integral monomial sections, tensor base change, invariant representatives and field-independent divisor classes | Arbitrary-coefficient fan realization, its ray divisors and associated Cartier/divisorial modules. The existing complex realization and generic Weil sheaf do not construct these. |
| §1.2: unit-model/full-analytification comparison | Toric formal completion, generic fibre and its comparison with analytification. |
| §§2.1, 2.4: perfected toric spaces and homogeneous divisor algebra | Completed perfected cone algebras, their plus rings, perfectoid structure and tilt. |
| §§3.1–3.7: the five toric comparisons, sharp projection and full affine line | Those toric spaces, the power tower, tilting functor and actual adic étale topoi and morphisms. |
| §§4.1–4.2: power-pullback automorphism and torsion comparison | Cohomology of those sites and their constructed pullback maps. |
| §§5.1–5.3: cofinal tubes, nonzero dense-field homogeneous approximation and hypersurfaces | Integral toric section domains, the homogeneous cone algebra and its sharp map. |
| §§6.1–6.2: operational Chow/Minkowski weights and fan displacement | Operational Chow groups of the toric scheme and evaluation on orbit closures. |
| §§6.3–6.4: positive refined degree and complete-intersection approximation | The preceding intersection theory, algebraic zero loci, analytification and π. |

A Finsupp tensor identity, arbitrary matrix kernel or abstract homeomorphism would replace these headlines by different statements. The empty Lean file avoids those stand-ins and satisfies the acceptance-file rule; no statable headline was omitted.

### Seeded source verification

All fifteen targets were checked against the legal line-numbered caches, including their hypotheses and proof-internal steps. No additional source fetch or manifest mutation was needed. SCH12 uses the published IHÉS pagination; FS94 explicitly uses arXiv v1 pagination; FS25 uses author version 0.27. Source errors are listed separately at the end and are not copied into the package.

| Target | Source opened, theorem and printed page | Support and scope checked |
| --- | --- | --- |
| 0.1 Invariant toric divisors | SCH12 line 2381, Definition/Proposition 8.4, p. 304 | Primitive ray boundary divisors and invariant coefficients. The package uses rank(N)−1 in the ray chart and confines prime Weil divisors to field fibres. Normality and the distinct codimension-one points are explicitly contracted. |
| 0.2 Divisor character weights | SCH12 line 2386, Definition/Proposition 8.4, p. 304; SCH12 line 2477, proof of Proposition 8.7, p. 306 | The inequality is pairing ≥−a_i. Cartier section frames have the negative coefficient pairing; local translation, principal translation and products agree with it. |
| 0.5 Integral toric line bundles | SCH12 line 2477, proof of Proposition 8.7, p. 306 | The tautological integral model and framewise section bounds are present. The package correctly uses integral sheaf units, not only scalar units, and supplies arbitrary-ring frames through its monomial modules and formal-geometry supplier. |
| 1.1 Unit toric adic spaces | SCH12 line 2391, paragraph after Definition/Proposition 8.4, p. 304 | The affinoid pair and integral formal generic fibre match. Ordinary algebraic face localization is completed to a rational unit locus, rather than replaced by all of D(χ^m) analytified. |
| 1.2 Toric analytification comparison | SCH12 line 2395, p. 304; FS25 line 299 and FS25 line 318, Example 4.1, pp. 7–8 | Source distinguishes the unit ball from full affine space and identifies the proper case. The formal supplier provides the open comparison. The seven-ray nonprojective example really is complete and regular; projectivity is not added. |
| 2.2 Perfected divisor sections | SCH12 line 2405, p. 304 | p-local divisors and their free Banach monomial sections. The completion is c₀; unrestricted coefficient families are excluded. Singular cones are not claimed to make every such module invertible. |
| 2.3 Graded divisor cones | SCH12 line 2463, proof of Proposition 8.7, p. 306 | j ranges over all ℤ[1/p], and the inequality contains j a_i. Negative degrees, character coordinates and degree coordinates are retained. Completeness is used for degree-zero K. |
| 2.4 Graded divisor algebras | SCH12 line 2471, p. 306; SCH12 line 1344, Proposition 5.20, p. 280 | Completion, perfectoidness and the corresponding tilt occur in the proof. Proposition 5.20 itself is a polydisc theorem: the general cone extension remains an explicit supplier gap. |
| 3.1 Toric tilting comparison | SCH12 line 2414 and SCH12 line 2437, Theorem 8.5(i), pp. 304–305 | The perfected K-space tilts to the perfected K♭-space; monomials and integral charts agree. No ringed-space isomorphism between the unperfected spaces is claimed. |
| 3.6 Open toric topos restrictions | SCH12 line 2433, Theorem 8.5(v), p. 305; SCH12 line 2324, Proposition 7.16, p. 302 | Any open U is permitted. The arrow is V-étale to U-étale; inverse-image opens at finite levels are φ_p⁻ⁿ(U). Arbitrary opens are handled by rational covers, retaining the qcqs hypotheses where the finite-level theorem is applied. |
| 4.1 Power-map cohomology invariance | SCH12 line 2450, proof of Proposition 8.6, pp. 305–306 | Smooth proper toric variety, algebraically closed perfectoid K and ℓ≠p. The proof-internal special-fibre argument is supplied at the required nonnoetherian valuation-ring generality, with relative Frobenius and its coefficient twist kept distinct. |
| 4.2 Toric torsion cohomology comparison | SCH12 line 2446, Proposition 8.6, p. 305; SCH12 line 2344, Corollary 7.18, p. 303 | Finite prime-to-p torsion, all cohomological degrees. Continuity and invertible transitions give the stated level-zero map. Cup and field coherence have their separate declared contract. |
| 5.1 Toric section neighbourhoods | SCH12 line 2475, proof of Proposition 8.7, p. 306; SCH12 line 2496, Corollary 8.8, p. 307 | Integral section inequalities give the neighbourhoods. The finite-family extension explicitly uses constructible compactness, finite chart covers and continuity of all-rank valuations; the source's informal small-neighbourhood step is not used as a substitute for that argument. |
| 5.2 Dense-field section approximation | SCH12 line 1752, Lemma 6.5/Remark 6.6, p. 288, proof pp. 289–290; SCH12 line 2482, p. 306 | Homogeneous estimate, integral f, rational threshold and strict error factor. The cone extension is declared. The additional Gauss-point refinement ensures nonzero g; finite coefficient approximation and p-powering work over the specified possibly imperfect dense field. |
| 6.2 Toric fan displacement products | FS94 line 373, Proposition 3.1, p. 10; FS94 line 393, Theorem 3.2, p. 11; FS94 line 505, proof, p. 13 | Complete fan, complementary codimensions, generic displacement and lattice multiplicity. The proof uses N/N_γ; the package corrects the printed N_γ misprint. The indices and resulting degrees are integers independent of the coefficient field. |

I also reopened SCH12 line 91 (Theorem 1.5), SCH12 line 186 (Theorem 1.13), SCH12 line 271 (Lemma 1.16), SCH12 line 2317 (Definition 7.14), SCH12 line 2335 (Theorem 7.17), SCH12 line 2349 (Corollary 7.19), and SCH12 line 2496 (Corollary 8.8). For the divisor and intersection interfaces I read FS94 line 117 (Proposition 1.1), FS94 line 176 (Proposition 1.4), FS94 line 198 (Theorem 2.1), and FS94 line 222 through FS94 line 240 (Corollary 2.4 and the wall formula). STACKS line 223 and STACKS line 229 confirm the perfect/imperfect-field distinction; STACKS line 4827, Lemma 33.45.9, tag 0BEV, printed p. 104, confirms the repaired arbitrary-field positivity citation, including d=0.

### Computed adversarial pass

These rows cover the seeded targets, headlines and repaired statements. Identical formulas repeated in prose and API lists share their computation. Untouched subsidiary assertions retain only the previous review's computed evidence described above. Here r=∣ϖ∣∈(0,1), F and G are the two ruling classes, and h is the hyperplane class. Finite computations test the statements; they do not replace the general source and proof-route checks.

| Statement | Instances tried | Values computed on each side / wrong-model value | Result | Change |
| --- | --- | --- | --- | --- |
| Nonempty salient finite-fan convention | Rank zero, empty fan, rank-one line and ray | Rank-zero realization is Spec A; empty realization is ∅. A line intersects its negative in ℝ; a ray does so in {0}. Primitive 1 has lattice index 1; rescaling to 2 gives index 2. | Correct exclusions | None |
| p-local coefficients and fractional bounds | p=2,3; r=1/4, c=1/2 | 1/2 belongs only to ℤ[1/2], 1/3 only to ℤ[1/3]. The threshold is 1/2 and its square is 1/4. ε=1/2 gives factor 1/2<1; ε=1 gives 1 and is excluded. | Correct carriers and denominator conditions | None |
| 0.1 invariant coefficient injection | ℙ¹, coefficients 1 and 2; torus fan | D₊ and 2D₊ have coefficients 1 and 2 at zero, and 0 at an interior point. No rays gives 0→0. | Multiplicity retained | None |
| 0.1 character divisor sign | t and t² on ℙ¹; χ^(1,0) on ℙ² | Orders are (1,−1), (2,−2), and (1,0,−1), exactly the primitive-ray pairings. The negative convention gives their negatives. | Signs agree | None |
| 0.1 face maps | k[t], zero-cone face | Closed projection t↦0 gives k; open localization t↦t gives k[t,t⁻¹], with t·t⁻¹=1. | Distinct maps and targets | None |
| 0.2 global and local weight sets | D=dD₋ on ℙ¹, d=−1,0,1,2; zero cone | Global sets are ∅,{0},{0,1},{0,1,2}; zero-cone set is ℤ. For d=2 the local sets are ℤ≥0 and 2+ℤ≤0. Adding 3 preserves the first local set but not global {0,1,2}. | Both directions and local scope agree | None |
| 0.2 principal translation | D=D₋, m=1 | D+div(t)=D₊; W(D)−1={−1,0}=W(D₊), with inverse translation +1. Wrong +m gives {1,2}. | Correct sign | None |
| 0.2 addition | D=E=D₋, weights 0,1 | 0+1=1 and 1+1=2 both satisfy 0≤u≤2 for D+E. | Correct target | None |
| 0.3 sections and arbitrary base change | ℙ¹, D=2D₋; A=k[ε]/ε² and A=0 | Chart support intersection is {0,1,2}; both glued sections and S_A(D) are A³. B⊗_A A³=B³. At D=0, ε stays nonzero before reduction; over A=0 the module is 0. | No reducedness or flatness added | None |
| 0.3 multiplication | O(1) on ℙ¹; characteristic 2 and ℤ/4 | Tensor source dimension 4, target dimension 3. (1+t)² is 1+t² in characteristic 2 and 1+2t+t² over ℤ/4. Both bracketings of χ⁰χ¹χ¹ give χ². | Convolution; no false tensor-product isomorphism | None |
| 0.4 invariant representatives | x² on A¹; t on G_m; t−a on ℙ¹, a≠0 | Vanishing order 2; torus divisor 0; divisor [a]−D₋. The last two points have the same class 1, not class 0. | Multiplicity and class retained | None |
| 0.5 frames and cocycle | O(2D₋) on ℙ¹; O(D₃) on ℙ² | ℙ¹ weights 0,2 give ratio t⁻². ℙ² frame weights (0,0),(0,1),(1,0) give differences (0,−1)+(−1,1)=(−1,0), equal to the direct difference. | Transition products agree | None |
| 0.5 integral model and coefficient change | Unit torus frame change t; scalar ϖ; D=0 | ∣t∣=∣t⁻¹∣=1 preserves bounds. ∣ϖf∣=r∣f∣ changes them. D=0 has transition 1; coefficient extension leaves t⁻² and the cocycle exponents unchanged. | Integral-frame hypothesis discriminates | None |
| 0.6 class presentation | ℙ¹; zero-cone fan; incomplete regular rays (1,0),(1,2) | ℙ¹: u↦(u,−u), quotient (a,b)↦a+b. Zero cone: kernel ℤ for ℤ→0. Two-ray matrix determinant 2 gives cokernel ℤ/2. | Completeness needed for asserted free quotient | None |
| 0.6 field independence and power | ℙ¹ over characteristic 0,2,3 and inseparable extension | Same quotient ℤ; class d becomes pᴺd. For d=2,p=3,N=1 both methods give 6≠0. | Nonzero effective classes survive powering | None |
| 1.1 chart algebras and face overlap | Ray, zero cone, rank zero, ℙ¹ | Algebras K⟨t⟩, K⟨t,t⁻¹⟩, K; t inverse exists only in the second positive-rank chart. ℙ¹ overlap has ∣t∣=1. | Unit model determined | None |
| 1.1 Gauss norm and plus ring | (1+ϖt)(1−ϖt), t, ϖ⁻¹; characteristic 2 too | Product 1−ϖ²t² has norm 1=1·1. Norms of t and ϖ⁻¹ are 1 and r⁻¹>1. Isometric coefficient change keeps each singleton coefficient norm. | Multiplicativity and integral bound agree | None |
| 1.2 open comparison | t=ϖ⁻¹ on A¹ and ℙ¹ | Norm r⁻¹>1 excludes the unit disc; reciprocal norm r<1 puts the same point in the second ℙ¹ chart. Rank-zero comparison is identity. | Complete and incomplete cases differ | None |
| 1.2 nonprojective fixture | FS25 seven rays and ten maximal cones | Cone determinants: 1,−1,1,1,−1,−1,1,−1,1,−1. f-vector (7,15,10) has Euler value 2; every edge has two adjacent cones with determinant product −1. Three primitive-relation sums are respectively (0,0,−1),(−1,0,0),(0,−1,0) on both sides; ample inequalities sum to 0>0. | Complete regular fixture is not projective | None |
| 1.3 power maps | q=1,2,3,0; a∈𝔽₄ with a²=a+1 | t maps to t,t²,t³; φ₂φ₃ gives t⁶. q=0 sends t to 1 and loses the origin stratum. Coefficient-linear φ₂ fixes a; absolute Frobenius sends it to a+1. | Exponent direction and coefficient twist agree | None |
| 2.1 perfected charts and tower | Ray, torus, rank zero; p=2,3 | Exponent sets are ℤ[1/p]≥0, ℤ[1/p], {0}. At level n, prₙ₊₁*φ*(χᵘ)=χ^(pu/pⁿ⁺¹)=χ^(u/pⁿ). Rank-zero projections are identities. | Correct monoids and transition | None |
| 2.2 perfected weights | ℙ¹, D=D₋ and D=0 | First set is [0,1]∩ℤ[1/p], containing 1/p but excluding 2; second set is {0}. Without completeness the zero-cone set is M[1/p]. | Correct completed index sets | None |
| 2.2 c₀, equality and extension | Coefficients ϖⁿ at distinct 1/pⁿ; coefficient-one family | Truncation tail norm r^(N+1)→0; coefficient-one tail norm 1. The first has an infinite-support limit, the second is excluded. Coordinate evaluation is 1 on its singleton and 0 on other singletons; the identity into finite support cannot contain the first limit. | Completeness and decay are necessary | None |
| 2.2 convolution and summability | δ₀,δ₁ in O(D₋); decaying pairs | Product is δ₁ in O(2D₋), norm 1=1·1; pointwise product is 0. For input norms rⁿ,rᵐ, products ≥rᴺ require n+m≤N, at most (N+1)(N+2)/2 pairs. | Correct sum, target and bound | None |
| 2.2 denominator clearing | p=2, D=(1/4)D₋, weight zero | One square gives divisor (1/2)D₋; two give D₋. Clearing only weight denominators leaves a fractional divisor. | Both denominators accounted for | None |
| 2.3 cone, grading and negative degrees | ℙ¹ D=D₋, j=1,0,−1; complete D=0 | Fibres are [0,1]∩ℤ[1/p], {0}, ∅. For D=0 every j-fibre is {0}, so (0,−1) remains. The ray fan has degree-zero weights ℤ[1/p]≥0. | Completeness and negative degrees retained | None |
| 2.3 monoid and principal reindexing | (0,1),(1,1), p=2; D₋→D₊ | Sum (1,2) satisfies 0≤1≤2; division gives (1/2,1/2). (u,j)↦(u−j,j) sends [0,j] to [−j,0], with inverse adding j; (1,2) maps to (−1,2). | Laws and inverse agree | None |
| 2.4 graded algebra and tilt | ℙ¹ D=D₋; D=0 | (u,j)↦(u,j−u) has inverse (a,b)↦(a,a+b); (1/2,1) maps to (1/2,1/2), norm 1 on both sides. D=0 gives z,z⁻¹ with product 1; only degree zero is K. The tilt retains these exponents. | Algebra and grading determined | None |
| 2.4 repaired convolution API | f=2χ^(0,1), g=3χ^(0,−1) in characteristic zero | Coefficient at (0,0) is 6 and elsewhere 0; norm ∣6∣=∣2∣∣3∣. Pointwise coefficient product is 0. | Repair retains every distinct conclusion | None |
| 2.4 infinite convolution and completed grading | f_(0,n)=ϖⁿ, g_(0,−n)=ϖⁿ, n≥1 | Coefficient at 0 is Σϖ²ⁿ=ϖ²/(1−ϖ²), norm r² since denominator norm is 1. A coefficient-one family over infinitely many degrees has tail norm 1 and is excluded. Zero input gives coefficient and norm 0. | Convergence and c₀ completion hold | None |
| 3.1 tilt and p-local divisor models | Perfected ray, torus, rank zero; D=(1/p)D₋ | Exponents are unchanged; t is noninvertible on the ray, t^(1/p)t^(−1/p)=1 on the torus. Frames 1,t^(1/p) retain ratio t^(−1/p); plus coefficients have norm ≤1 on both sides. Equal-characteristic rank-zero tilt is identity. | Correct space and integral models | None |
| 3.2 completed colimit | Disc tower; coefficient ϖ² | Level n contributes t^(a/pⁿ); all allowed finite monomials occur. Norm of ϖ² is r² at source and target, detecting membership in ϖ²A° and nonmembership in ϖ³A°. At exponent 0 the lattice condition is unrestricted. | Density and finite-stage detection agree | None |
| 3.3 inverse-limit homeomorphism | Classical x; 0,1,∞ | xₙ=(x^(1/pⁿ))♯ satisfies xₙ₊₁ᵖ=xₙ. Boundary towers are constantly 0,1,∞. In characteristic p, level-zero x uniquely determines its roots. | Direction and strata agree | None |
| 3.4 projection, scaling and naturality | [1:x], scalar λ≠0; exponent p; field embedding ι | [λ♯:λ♯x♯]=[1:x♯]; λ♯(λ⁻¹)♯=1. π(xᵖ)=(x♯)ᵖ and ι(x♯)=(ι♭x)♯. | Well-defined source and target | None |
| 3.4 nonadditivity | Mixed characteristic p=2, [1:1:0]; equal characteristic control | Tilted sum is 0, untilted sum 2≠0. In characteristic 2 both are 0. | Wrong additive map excluded | None |
| 3.5 étale-topos comparison | Algebraically closed rank-zero chart; pth-root torus tower | K^a corresponds to (K♭)^a for a=0,1,2, with 0,1,2 geometric points. k(t^(1/p))/k(t) has separable degree 1 and inseparable degree p, not p étale branches. | Site and constants agree | None |
| 3.6 restriction extremes and direction | U=∅ and U=A | Preimages are ∅ and A♭; the two square composites have the same empty or global domain and target. | Correct geometric-morphism direction | None |
| 3.6 nonstable open | U={∣t−ϖ∣≤r²}, t=ϖ, p=2,3 | At t, value 0≤r²; at φₚ(t), value r>r². Thus U≠φₚ⁻¹(U), as permitted. | Tower must use inverse-image opens | None |
| 3.6 arbitrary-open and field compatibility | Union of rational opens; complement of infinity | π⁻¹(∪Uᵢ)=∪π⁻¹(Uᵢ); φₚ⁻¹({∞})={∞}. Isometric field extension keeps the two thresholds r and r². | No stability or compactness imposed on U | None |
| 3.7 full affine line | ϖ⁻¹,0,1,∞ | Finite norm r⁻¹>1 survives deletion of ∞; constant 0 and 1 towers survive, constant ∞ tower is deleted. | Full line, not unit disc | None |
| 4.1 power cohomology | ℙ¹, p=2, Λ=ℤ/3; nondiscrete valuation model | Both fibres have (Λ,0,Λ(−1)); maps are 1, the zero-group identity, and ×2. On the top generator 1→2→1. | Automorphism, not identity | None |
| 4.1 coefficient and dimension controls | Mixed characteristic ℓ=p=2; ℙ² with Λ=ℤ/5; rank zero | Top map mod 2 is 0, noninvertible. On ℙ² for p=2, even-degree multipliers are 1,2,4, all units mod 5. Rank-zero H⁰ map is 1 and positive groups are 0. | Hypotheses discriminate | None |
| 4.2 colimit comparison | ℙ¹, p=2, Λ=ℤ/3 | Transition 1→2→1→2; stage-n identification ×2^(−n) gives colimit Λ. Quotient by p−1 instead gives 0. | Level-zero map is an isomorphism | None |
| 4.2 products and equivariance | 1,h and φ₂ | 1∪h=h on each side; both naturality composites give 2π*h. A field automorphism fixes h in twisted degree 2. Negative groups are 0 on both sides. | Cup, twist and direction agree | None |
| 5.1 rational section tubes | f=t, r=1/4, c=1 | At norms 0,1/4,1/2,1, membership is true,true,false,false. N₂ has radius 1/16<1/4 and lies in ∣t∣<1/4. | Bounds and cofinal direction agree | None |
| 5.1 powers, frames and empty family | f=t², exponent 2c; scaling by ϖ; no equations | Radius remains rᶜ with exponent 2c; unchanged exponent c gives r^(c/2). Scaling gives bound r^(c−1); integral unit gives the original bound. Empty intersection and its zero locus are X. | Model and scale necessary | None |
| 5.1 all-rank continuity | Lexicographic additive values v(ϖ)=(1,0), v(f)=(0,1) | Bound c=1 asks (0,1)≥(1,0), false; f=0 has value ∞ and passes every bound. More generally continuity gives n with ∣ϖ∣ⁿ<∣f(x)∣ for f(x)≠0. | Intersection of all tubes is exactly the zero locus | None |
| 5.2 estimate and equal maxima | Exact monomial; r=1/4,c=1,ε=1/2 | Monomial error 0. If ∣f∣=1/2, error≤1/4 forces both maxima 1/2; if ∣f∣=1/16, error≤1/8 gives both truncated maxima 1/4. | Strict factor has the claimed effect | None |
| 5.2 nonzero refinement | f=ϖ²χᵘ, p=2, ε=1/2 | At c=0, g=0 passes r²≤r^(1/2). At c′>2 it would require r²≤r^(5/2), false. For r=1/4 these are 1/16≤1/2 and 1/16≤1/32. | Nonzero approximant enforced | None |
| 5.2 chart map and dense perturbation | ℙ¹ D=D₋, (u,j)=(1/2,1); coefficient b≠0 | Chart exponents u−jmσ are 1/2 and −1/2, both admissible, with norm 1. Error ∣b′−b∣<∣b∣ gives ∣b′∣=∣b∣>0; tail/coefficient errors below rᶜ keep the truncated domain. | Bounded map and nonzero retention hold | None |
| 5.2 denominator clearing | g₀=a+bt^(1/p), b≠0, p=2,3 | g₀ᵖ=aᵖ+bᵖt in O(pD₋), with bᵖ≠0 and coefficients still in k₀. h(x)=0 iff g₀(x)=0. | No roots required in k₀; section not global scalar function | None |
| 5.3 hypersurface endpoint | Line/double line in ℙ²; rank zero; FS25 fixture | Classes 1 and 2 become pᴺ and 2pᴺ, not 0. Rank zero has no nonempty Cartier input. FS25's identity minor leaves ray-4 class (1,0,0,0), whose multiple is (pᴺ,0,0,0)≠0. | Nonempty proper output without projectivity | None |
| 6.1 balancing and sign | ℙ¹; ℙ¹×ℙ¹ | [1,−1](1,1)=0, [1,−1](1,0)=1. Surface rows send (1,0,1,0) to (0,0) and (1,0,0,0) to (1,0). For O(D₋), m₋−m₊=1=1·b₊; reversing both cone order and b gives −1=1·(−1). | Correct weights and positive degree | None |
| 6.1 singular and nonsplit controls | Rays (1,0),(0,1),(−1,−2); Spec ℂ/ℝ versus Spec k/k | Weight (1,2,1) balances to (0,0), while (1,1,1) gives (0,−1). Nonsplit point degree evaluation is ×2 on ℤ, whereas the split point gives ×1. | Singular fans allowed; split orbit hypothesis needed | None |
| 6.2 smooth displacement product | ℙ¹×ℙ¹, v=(1,1); ℙ², v=(1,2) | Product-fan contributing pairs are (+e₁,−e₂) and (+e₂,−e₁), both index 1. Weights (0,2,0,2) and (1,1,1,1) give 0+2=2=H·2F. ℙ² has one contributing pair (e₂,−e₁−e₂), giving 1. | Formula agrees with intersection degrees | None |
| 6.2 singular index and displacement independence | Complete fan rays (1,0),(1,2),(−1,0),(0,−1), balanced c=d=(1,1,2,2) | At v=(1,−1), pair (1,2) intersects with parameters (3/2,1/2) and index 2; weighted terms 2+4=6. At v=(−1,1), terms 2+4=6; at v=(1,3), terms 2+2+2=6. | Multiplicity 2 is essential; three generic displacements agree | None |
| 6.2 quotient, field and rank-zero conventions | Rank-two ray γ; characteristics 0,2,3; rank zero | N/Nγ has rank 1; Nγ projects to 0. Degree 2 stays the integer 2 even in characteristic 2. Empty rank-zero product has degree 1. | No wrong lattice or mod-p reduction | None |
| 6.3 repaired fibre Check and positivity | F₁∪F₂, H=F+G; nonample H=F | Classes sum (1,0)+(1,0)=(2,0); H-degree 1+1=2. Supports are disjoint. With H=F, degree F·2F=0. Two class-(2,0) divisors would give degree 4 against F+G. | Repair and ample hypothesis hold | None |
| 6.3 zero-dimensional positivity | Rational, inseparable degree-p, doubled rational point; zero cycle | Degrees 1,p,2,0 respectively. For p=2,3 the inseparable values are 2,3. Sum Σmᵢ[Vᵢ] has degree Σmᵢ[k(Vᵢ):k], positive for a nonzero effective cycle. | New Check uses full arbitrary-field supplier | None |
| 6.3 proper, excess and powered degrees | Two lines on ℙ²; s=(ℓ,ℓ); p=2 or3 | Proper intersection degree 1. Excess locus L has localized class c₁(O(1)∣L)∩[L], degree 1, matching h²∩[ℙ²]; CH₀(∅)=0. N₁=N₂=1 gives powered degrees 4 or9. c=0 gives deg(Hⁿ), rank-zero value 1. | Refined support forces nonemptiness | None |
| 6.4 dimension and extra cuts | Distinct/identical lines; two fibres; excess line L | Distinct lines: c=2, dimension 0. Identical lines have codimension 1 and fail the two-equation input. Two fibres: c=1, dimension 1. Cutting excess L by an independent line gives a point of degree 1, dimension 0. | Correct equation count and cut endpoint | None |
| 6.4 field-of-definition and reduction | k₀=𝔽ₚ(t), xᵖ−t; perfect-field and c=0 controls | Before extension: reduced field of degree p. After adjoining t^(1/p): length p; reduction length 1. Dimensions remain 0 and supports coincide. Perfect-field reduced schemes remain reduced after extension; c=0 gives Z₀=X of dimension n. | Geometric reduction is not falsely descended | None |

For the infinite convolution, the denominator is nonzero because its norm is 1. In general, nonzero c₀ factors with bounds M,N>0 have a product term of norm ≥η only when the input norms are ≥η/N and ≥η/M; both sets are finite. The zero-factor cases are handled separately without division. The continuity argument for higher-rank valuations excludes a nonzero element smaller than every pseudouniformizer power; such an element cannot occur at a continuous analytic valuation.

All sixteen defect classes were considered. The objects here are finite free lattices, commutative rings and split tori, so arbitrary nonabelian groups such as S₃ and Q₈ do not inhabit these target carriers. Non-split orbit behaviour is tested by the degree-two point. No compactness is inferred from an arbitrary topology, no denominator is allowed to vanish, and no uniform bound is allowed to depend on a point after that point has been universally quantified.

### Pinned-library audit by object

These are declarations I opened at the recorded pins, rather than relying on the roadmap's descriptions. Library paths below are relative to the respective pinned library root.

| Pinned location | Definition or result read; boundary relevant here |
| --- | --- |
| `Mathlib/Algebra/MonoidAlgebra/Defs.lean:64` | `AddMonoidAlgebra` uses finitely supported coefficients and convolution. It supplies the algebraic monomials, not a completed c₀ algebra or toric sheaf. |
| `Mathlib/Algebra/MonoidAlgebra/MapDomain.lean:285` | `MonoidAlgebra.mapDomainRingHom` transports exponents and fixes coefficients. Its additive counterpart supports the same convention; it is not absolute Frobenius on the coefficient field. |
| `Mathlib/Topology/ContinuousMap/ZeroAtInfty.lean:45` | `ZeroAtInftyContinuousMap` extends continuous maps with convergence to zero along the cocompact filter. Discreteness, a normed coefficient structure and convolution are additional choices, not fields of this definition. |
| `Mathlib/Geometry/Convex/Cone/Pointed.lean:33` | `PointedCone` is expressed using a submodule over nonnegative scalars. The name does not assert absence of a line. |
| `Mathlib/Geometry/Convex/Cone/Basic.lean:298` | `ConvexCone.Salient` excludes simultaneous membership of a nonzero vector and its negative. This is the no-line condition used here. |
| `TauCeti/Geometry/Toric/Algebraic/Fan/Basic.lean:83` | `TauCeti.Toric.Fan` supplies a finite family with face and intersection conditions, but does not force nonemptiness. The package adds that standing hypothesis. |
| `TauCeti/Geometry/Toric/Algebraic/Cone/Basic.lean:147` | `IsToricCone` includes rationality and salience. Arbitrary convex cones are not silently admitted as toric cones. |
| `TauCeti/Geometry/Toric/Algebraic/Ray/Primitive.lean:167` | `primitiveGenerator` uses the integral lattice and the toric hypotheses; it is not an arbitrarily rescaled ray vector. |
| `TauCeti/Geometry/Toric/Algebraic/DualSemigroup/Basic.lean:53` | `dualSemigroup` consists of additive characters nonnegative on the cone. This fixes the inequality direction. |
| `TauCeti/Geometry/Toric/Algebraic/DualSemigroup/Finiteness.lean:76` | `IsToricCone.fg_dualSemigroup` supplies finite generation on the integral lattice. It does not identify the perfected completion. |
| `TauCeti/Geometry/Toric/Algebraic/AffineScheme.lean:60` | `affineCoordinateRing` is the monoid algebra over ℂ of the multiplicative form of the dual semigroup. It is not the arbitrary-coefficient fan model. |
| `TauCeti/Geometry/Toric/Algebraic/Fan/Scheme.lean:136` | `Fan.algebraicRealization` glues those complex charts by a colimit. It does not itself supply coefficient change or the contracted field-fibre theorems. |
| `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Basic.lean:46` | `SchemeWeilDivisor` is finitely supported on codimension-one points. It is not an indexed toric ray divisor family without the missing geometric identification. |
| `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Principal.lean:126` | `WeilDivisor.OrderSystem.ofScheme` carries the integral and noetherian scheme assumptions. These are retained when the field-fibre construction consumes it. |
| `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Sheaf.lean:75`, `:82`, `:250`, `:565`, `:642` | The generic divisorial sheaf and `nonempty_iso_sheaf_of_linearlyEquivalent` use the stated integrality, local/noetherian and codimension-one DVR hypotheses. This is an imported interface, not a replacement for arbitrary-ring toric Cartier modules. |
| `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean:206`, `:231`, `:243` | `isAdic`, restriction and `AdicSpace` provide the sheafy locally affinoid category. They do not construct toric formal models, tilting or adic étale topoi. |
| `Mathlib/RingTheory/Perfectoid/Untilt.lean:49` | `PreTilt.untilt` is a multiplicative map under prime, nonunit and adic-completeness hypotheses on the coefficient ring. It is not a geometric tilting functor or the toric projection. |

Object searches across both pinned trees covered finite-fan realizations, dual monoids, ray divisors, divisorial sheaves, c₀ functions, completed/perfected cone algebras, analytic toric spaces, operational Chow groups, Minkowski weights, tilting and étale sites. Existing algebraic ingredients are imported; the missing geometric constructions are neither redeclared as data axioms nor approximated by unconstrained predicates in Suggested.lean.

### Supplier citations resolved this round

I checked every cross-roadmap supplier against main or its supplied open head. Paths are `TauCetiRoadmap/<name>/README.md`; line numbers in this table refer to that file. Main copies were used for revisions of existing roadmaps. Open-head copies were used for new roadmaps. The automated resolver reported no unresolved cross-roadmap or Lean-name citation; its host-side library check did not inspect the Lake pins, so the direct pin audit above supplies that evidence.

| Roadmap and location opened | Consumed statement and scope |
| --- | --- |
| AnalyticToricGeometry, lines 166–248, main | Layer 0's lattice, cone and finite-fan programme. Part II takes those carriers as inputs and extends the coefficient, analytic and perfectoid directions; it does not re-plan that layer. |
| ShimuraCompactifications, head `63e3f03`, C0.6 line 498, C0.7 line 513, C0.9 line 568, C0.16 line 747, C0.17 line 775, C0.18 line 798 | Algebraic face/chart maps, arbitrary-ring fan gluing, completeness/properness and integral boundary charts. The general normal field-fibre/ray/smoothness export is the separately declared gap. Algebraic localization and the analytic unit overlap remain distinct. |
| AdicSpaces, main, Layers 2–5 at lines 354, 450, 547, 624 | Native adic foundations, the affinoid/category interfaces and gluing consumed by the unit model. |
| AdicSpacesPartII, main, R0.19.1–R0.19.3 at lines 7466, 7522, 7577; R0.20.1 at 8136–8171; R1.3 at 8968; R1.6 at 9660, 9718 | Constructible compactness, finite-stage detection, analytification and properness. The general locally finite-type properness comparison is explicitly present at line 9718, not merely projective-space properness. |
| AdicSpacesPartIII, main, R2.2 line 4356; R2.3 lines 4615, 4746; R2.4 line 4986; R2.8 line 7480; R2.10 lines 8158, 8270–8318 | Formal models over nondiscrete rank-one valuation rings, generic fibres, specialization, proper-model comparison and fractional section inequalities. Integral changes of frame and all-rank valuation loci are part of the consumed interface. |
| PerfectoidSpaces, main, P1.30 line 5423; P2.1 lines 6105–6134; P2.2 line 6136; P2.3 line 6235; P2.9 line 6923; P2.10 line 7061; P2.11 line 7163; P2.12 line 7322 | Perfected polydiscs/Laurent charts, homogeneous estimates, rational localization and tilting. A general rational-cone completion and its homogeneous estimate are not asserted to follow from the polydisc statement; both are declared gaps. |
| PerfectoidSpaces, main, P3.18 line 9657; P3.20 line 9976; P7.1 line 15443; P7.2 line 15571; P7.3 line 15707; P7.4 line 15770 | Étale sites, tilting equivalence and the finite-level/perfectoid inverse-limit framework. The package retains the hypotheses of the affinoid statements before gluing. |
| PerfectoidSpaces, main, P7.11 lines 16687, 16717; P7.12 line 16796; P7.13 lines 16893, 16991–17012; P7.15 lines 17059, 17140, 17271 | Finite-stage detection, restrictions to open subspaces, characteristic-p perfection, cohomology continuity and purely inseparable invariance. These supply the direction from the perfectoid tower and its opens to the level-zero sites. |
| AdicEtaleGeometry, main, A1.6 lines 3259–3290 | Actual adic étale sites and covers, compatible with the native/Yoneda comparison. Covers are jointly surjective at all points, not only classical points. |
| SchemeAndStackFoundations, main, §0.7 line 755; §0.17 line 1138; §0.18 line 1254; §0.23a line 1508; §0.29 lines 1825, 1872–1889 | Dimension, Cohen–Macaulay interfaces, universal-homeomorphism invariance and relative Frobenius with its base twist. The coefficient-linear power map is not identified with absolute Frobenius on arbitrary coefficients. |
| SchemeAndStackFoundations, main, §§2.1–2.2 lines 3265, 3309; §3.4 lines 4789, 4820–4826 | Derived/site cohomology, Cartier–Weil–Picard interfaces and divisor excision. The Laurent-ring units/UFD/class-group export is explicit as a gap rather than attributed to the generic divisor section. |
| SchemeAndStackFoundations, main, §4.13 lines 5643, 5680–5685 | Regular-sequence and smooth Bertini interfaces. The arbitrary projective, possibly nonreduced hypersurface cut is a separate declared contract. |
| SchemeAndStackFoundations, main, §§5.1–5.6 lines 6567, 6653, 6701, 6721, 6768, 6921; zero-section/Gysin/excess lines 6813, 6818, 6823 | Cycle Chow groups, residue-degree pushforward, Chern classes, refined Gysin and excess intersection, and smooth intersection products. `Chow.gysin` is an actual named supplier target at line 6818; the resolver lead is not a missing pinned declaration. Operational groups/Kronecker duality remain the declared gap. |
| AbelianSchemesAndArithmeticModuli, head `71ecc01`, A2.7 lines 1228–1237 | `ampleIntersectionPositive` over any field, with dimensions, positive powers and effective component sums. This is the unique owner now cited for positivity, including inseparable closed points. |
| EtaleCohomologyFoundations, main, F.2.3 lines 540–553 | Smooth universal local acyclicity for finite invertible coefficients and compatible specialization; a noetherian valuation-ring restriction is not imposed. |
| ClassicalAdicEtaleCohomology, head `dfcb6b7`, §1.1 lines 91–118; §6.2 lines 3143, 3159–3172; §8.2 line 3600 | Ordinary cohomology for actual adic morphisms, proper comparison over the required strictly henselian valuation base and algebraic/adic proper comparison. Abstract geometric-morphism cup pullback is the separately named gap. |
| WeilConjectures, head `d90e186`, WC.6 lines 1071–1129 | The fixed complete nonprojective smooth threefold and its toric calculation. This is consumed as a fixture, not replanned as an owned general toric library. |

The board index was read before ownership conclusions. All twenty indexed sibling heads were inspected through their available package README (five heads) or design README (fifteen heads). The latter include SchemeAndStackFoundationsPartII, ShimuraVarietiesPartII and PELModuliPartII. Searches for these toric, cone, operational-Chow and approximation objects found no competing ownership there. Matches for finite orbital sums or root-data orbit averages were different objects.

The roadmap tool searched main and the 362 indexed open heads, including the named open work in the brief, by object as well as name. In particular:

- `TauCetiRoadmap/TropicalAndBerkovichArithmetic/README.md:159`, head `44a1641`, imports the same ShimuraCompactifications C0.16 geometry for tropicalization. Its scope does not own the global perfectoid divisor or approximation targets here.
- `TauCetiRoadmap/AInfCohomology/README.md:2131` concerns root covers of small framed formally étale rings and their period/cochain constructions. It does not construct arbitrary finite-fan spaces or global toric divisor algebras.
- The general completed-cone and homogeneous-estimate prerequisites were traced to PerfectoidSpaces and declared there as contracts; the positivity prerequisite was traced to A2.7. No second owner is created here.
- The general toric integral section modules, fixed-fan comparison maps, fan-specialized intersection description and dense-field approximation endpoint extend the base AnalyticToricGeometry programme. Those are the reasons this Part II roadmap owns its retained targets.

There are no local declarations in Suggested.lean, so an identical fully qualified declaration in another roadmap cannot occur. No target was moved to avoid an upward dependency: all consumed roadmap owners are earlier or on main.

### Declared contracts and dependency direction

The following seven slugs occur, with matching named supplier and needs sentence, in `packages/AnalyticToricGeometryPartII/design/plan.json` and the README's Exact supplier contracts. Each describes a single coherent missing interface with its related compatibility laws. None has supplier `none`, none asks for the repaired ample-degree positivity theorem, and none was found already supplied at the pins or the cited earlier roadmap section.

| Gap slug | Supplier | Precision and minimality checked |
| --- | --- | --- |
| `toric-field-fibres` | ShimuraCompactifications C0.16–C0.18 | Normal geometrically integral field fibres, distinct codimension-one ray closures and regular-fan smoothness, compatible with arbitrary-ring gluing and coefficient change. Generic gluing/properness alone does not supply these exports. |
| `perfected-cone-algebras` | PerfectoidSpaces P1.30; P2.1 | Coefficient-Gauss completions of rational polyhedral cone monoids in p-local lattices, including lineality, with the plus ring, perfectoidness and monomial tilt. Polydisc and Laurent special cases do not cover a singular rational cone. |
| `homogeneous-cone-approximation` | PerfectoidSpaces P2.1 | Linear p-local grading, degree-zero K, integral homogeneous input, rational c≥0, 0<ε<1, compatible ϖ and the stated sharp-error bound. This extends the estimate to the preceding cone algebra without demanding the toric descent proved here. |
| `operational-chow-finite-orbits` | SchemeAndStackFoundations §§5.1–5.6 | Integral operational product/evaluation and Kronecker duality for complete schemes with the stipulated split solvable action and affine-times-split-torus orbits. Existing cycle Chow and smooth products do not supply this singular operational interface. |
| `ample-generic-cuts` | SchemeAndStackFoundations §4.13 | Infinite coefficient field, projective W of dimension d>0 with a fixed embedding, some positive-degree hypersurface avoiding every top-dimensional geometric component, nonempty cut of dimension d−1. Smooth Bertini does not provide the stated possibly nonreduced case. |
| `geometric-morphism-cup-pullback` | ClassicalAdicEtaleCohomology §1.1 | Ordinary constant-torsion cohomology and coefficient-forgetting pullback for geometric morphisms of the actual adic étale topoi, with cup, identity, composition and field compatibility. Existing pullback for adic-space morphisms is narrower than the toric projection's topos arrow. |
| `split-torus-divisors` | SchemeAndStackFoundations §3.4 | For every field and finite free lattice: Laurent UFD, units exactly aχᵘ and zero native Weil class group, tied to excision and Picard interfaces. Generic monoid algebras and generic divisor excision do not export that combined split-torus theorem. |

I read all 29 Needs lines and the layer Dependencies lists. The mechanical dependency command, with `--name AnalyticToricGeometryPartII --movable` and the supplied order, exited 0 and printed exactly:

```text
depcheck: 51 roadmaps, 590 edges, 0 problem(s)
```

It emitted no UPWARD, CYCLE or moved line. The target is at position 180; its last named supplier ShimuraCompactifications is at 178. Other checked supplier positions include SchemeAndStackFoundations 2, AdicSpacesPartII 8, AdicSpacesPartIII 11, AdicEtaleGeometry 12, PerfectoidSpaces 13, EtaleCohomologyFoundations 20, AbelianSchemesAndArithmeticModuli 49, ClassicalAdicEtaleCohomology 65 and WeilConjectures 146. The explicit gap contracts account for their presently missing prerequisites; they are not hidden ownership defects.

## Not verifiable

- No cited source text was inaccessible. All four recorded works and every selected locator were readable in the legal caches; no missing-reference request is needed.
- Fifteen sibling board heads expose design READMEs rather than package READMEs. Ownership was checked against those available designs; nonexistent later package statements cannot be checked.
- The seven contracted supplier extensions are future mathematical interfaces, not implemented results verified by this package review. Acceptance is conditional on their delivery. No package theorem is claimed proved by the empty acceptance file or its successful elaboration.
- No published correction for the source issues below was verified. The entries report what the cited versions actually say and the independently checked correction.

## Source issues

- **Misprint** in SCH12 at Definition/Proposition 8.4, printed p. 304 (SCH12 line 2382): the source says the transverse torus exponent is k−1 although k denotes the coefficient field; it should be rank(N)−1; affects nothing.
- **Misprint** in SCH12 at proof of Proposition 8.7, printed p. 306 (SCH12 line 2481): the source says integral trivializations differ by a scalar integral unit; it should be a unit of the integral structure sheaf on the overlap, with valuation one; affects nothing.
- **Misprint** in SCH12 at proof of Proposition 8.7, printed p. 306 (SCH12 line 2489): the source says the finite degree-one approximant satisfies an inequality containing an unbound degree variable j; it should be the degree-one inequality, with j=1; affects nothing.
- **Error** in SCH12 at proof of Proposition 8.7, printed p. 306 (SCH12 line 2491): the source says the powered approximant is a global regular function; it should be a global section of O(pᴺD), whose zero locus defines the hypersurface; affects the proof.
- **Gap** in SCH12 at proof of Corollary 8.8, printed p. 307 (SCH12 line 2501): the source says positive intersection degree ensures a nonempty approximating common zero locus without an excess-intersection justification; it should be justified by the localized top Chern class supported on that locus and its positive ample degree; affects the proof.
- **Misprint** in FS94 at Theorem 3.2, printed p. 11 (FS94 line 400): the source says the generic displacement vector lies in N_γ; it should be chosen in N, with its image used in N/N_γ; affects nothing.
- **Misprint** in FS94 at proof of Lemma 3.4, printed p. 12 (FS94 line 442): the source says the argument proves Lemma 3.3, which is numbered as an example; it should be Lemma 3.4; affects nothing.
- **Error** in FS94 at paragraph after Corollary 1.2, printed p. 4 (FS94 line 132): the source says smooth toric varieties have free Chow groups without requiring completeness; it should be restricted to complete smooth toric varieties: the incomplete regular two-ray fan (1,0),(1,2) has CH¹=ℤ/2; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "7e4f54f033282df2f8c15c24b71439cbc6ef3d63", "job": "REV-PKG-AnalyticToricGeometryPartII~3", "model": "gpt-6-astra", "worker": "chris-7"} -->
