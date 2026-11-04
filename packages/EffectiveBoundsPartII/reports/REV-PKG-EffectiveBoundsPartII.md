<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1411#issuecomment-6394373243 -->
Review (codex) of 06884a9

Verdict: accepted
Conditional on the announced gaps: `isolated-affine-bezout`

1. **F01** (P3) Restore ordinary spelling in morphism terminology

   **Location:** `packages/EffectiveBoundsPartII/README.md:3`, and the same pattern throughout the file: “ℚ-isomorφsm classes”.

   **Claim:** The README uses standard mathematical vocabulary, but a Greek letter has replaced part of several ordinary words.

   **Witness:** The README contains 29 occurrences of `morφ`, including `isomorφsm` at line 3, `automorφsm` at line 40, `morφsm` at line 282 and `isomorφc` at line 578. These are spelling corruptions, not mathematical notation.

   **Exact repair:** Replace the substring `morφ` by `morphi` throughout this README. Preserve the standalone mathematical symbol φ. Tested on the text in memory: the 29 malformed substrings become zero; the resulting words include “isomorphism”, “automorphism”, “morphism” and “isomorphic”. No mathematical statement or Lean declaration changes.

Acceptance is conditional on the declared supplier contract `gap:isolated-affine-bezout`. There is one P3 finding and no P1 or P2 findings. There was no previous package review to reconcile. The authored README, Suggested.lean, metadata and sources manifest were not changed.

## Verified sound

The review covered all 26 numbered targets, their APIs, all 98 target Check bullets, the conventions, six layer dependency lists, all 26 `*Needs:*` lines, and the four worked examples. All 15 seeded source targets were read at their locators. There are no author-marked unverified locators and only one cited source, COU20. All nine Lean declarations were inspected and mechanically checked; all four admitted theorems underwent the one-tactic probe. The checks below record computed values, including the negative controls, rather than treating the successful elaboration as evidence of mathematical truth.

The general library contract is respected. This is an extension of `Completed/EffectiveBounds/README.md`, whose Layer 2 counts primitive-polynomial models in a fixed ambient field. It does not repeat that roadmap's effective Hermite theorem, class-number bounds or unit bounds. The new arithmetic specialization retains arbitrary number fields, degree one where appropriate, nonnormal fields, nonmonogenic orders, and an index that can exceed one. The product-span target even permits inseparable field extensions. No good-prime restriction, computational algorithm, sorry'd data, `set_option`, extra import, copied source passage, arbitrary placeholder predicate or circular hypothesis was found.

### Source verification

COU20 is the published Annals version, printed pp.487–497, as recorded in `packages/EffectiveBoundsPartII/sources.toml`. Its cached text was read through the end of the proof of Theorem 2. Printed pages 488, 489, 491, 493 and 495 were also rendered and inspected. This matters: the extraction renders some ≥ signs as >, including the house lower bound and the hypotheses d≥5 and r≥1. The printed pages have ≥; these are extraction artifacts, not errors in the package or paper. No additional source needed fetching, and no source-manifest entry was changed.

| Seeded target | Locator actually inspected | Support and hypothesis comparison |
| --- | --- | --- |
| 0.2 Canonical discriminant covolume | COU20 lines 127–140, §2, p.490 | An actual integral basis gives Gram determinant equal to absolute discriminant and canonical covolume its square root. The package correctly transposes the paper's basis-row convention. |
| 0.3 More than half a degree of short integers | COU20 lines 140–159, §2, p.490 | Independent ordered witnesses, product bound and m=ceil((n+1)/2)=floor(n/2)+1 agree. No integral-basis conclusion is imported. |
| 0.4 Products span the field | COU20 lines 150–157, §2, p.490 | The multiplication-functional argument is present. The package's general finite-field-extension version is justified by its explicit proof: multiplication by a nonzero element is invertible, without using a trace or separability. |
| 0.5 Independent delta-squared-short integers | COU20 lines 161–164 and preceding proof, Proposition 1, p.490 | n independent integers, all conjugate moduli ≤δ²; finite-dimensionality converts them to a rational basis. |
| 1.1 Integral generators from a short rational basis | COU20 lines 207–241 and 291–295, §3, pp.492–493 | The integer linear combinations and embedding-coordinate substitution are present. The house estimate is the triangle inequality; the source's displayed parameter bound supplies its specialization. The stated pp.491–492 locator covers the construction. |
| 1.2 Bounded arithmetic first-jet parameters | COU20 lines 172–204 and 242–248, §3, pp.491–492 | d≥5, r≥1, M≥n(r+1), generic first jets and the inclusive integer parameter box agree. The total-degree refinement is supplied explicitly by GenericDoublePointInterpolation §5.2. The package applies the grid theorem over ℂ, as required for the embedding substitution. |
| 2.2 Transpose image and its integral index | COU20 lines 266–277, §3, p.493 | The transpose image lies in the integral orthogonal and bounds its covolume from above. The explicit equality of the two indices is an additional justified refinement: restricting the dual of the maximal order to a full sublattice has that sublattice's index. It is not a quoted theorem of COU20. |
| 2.4 Height of monomial values | COU20 lines 291–308, §3, pp.493–494 | H₀=[n²d(r+1)]ᵈδ²ᵈ and G=M H₀² agree. The package explicitly handles the constant monomial with C₀≥1. |
| 2.5 Covolume of arithmetic relations | COU20 lines 278–290 and 309–315, §3, pp.493–494 | The paper first retains the discriminant denominator, then drops it in the final upper bound. The package's stronger first inequality follows from the same displayed determinant computation and Hadamard. |
| 3.4 A retained family spans one gradient block | COU20 lines 342–348, §3, p.494 | Codimension n−1<n gives a full block. The package supplies the missing linear-algebra explanation using n independent block-supported functionals. |
| 3.5 One minor at every conjugate | COU20 lines 349–351, §3, p.494 | One choice of integer rows gives a minor nonzero at every embedding. The package's injection argument correctly replaces a potentially misleading appeal to automorphisms of a nonnormal field. |
| 4.1 The arithmetic component map | COU20 lines 214–226, 249–250, 349–380, §3, pp.492,494–495 | Proposition 2 supplies the field component. The quotient/localization map and its compatibility follow from the actual evaluation, vanishing equations and nonzero Jacobian; generic étaleness is explicitly supplied elsewhere. |
| 4.2 Explicit small field models | COU20 lines 354–380, Proposition 2, p.495 | The printed hypotheses are d≥5 and r≥1. Every coefficient factor, including ℓ's exponent and δ²ᵈ, agrees. Only the Jacobian-open locus is asserted finite étale. |
| 5.4 The coefficient-box cardinality | COU20 lines 425–430, §4, p.496 | The paper counts r choose(2r,r) coefficients in the selected d=r case. The package's general r,d formula is the explicitly proved native-coordinate product count; it does not attribute that entire generalization to a separately numbered source theorem. |
| 5.5 From finite models to field classes | COU20 lines 35–38 and 425–430, Theorem 2 p.488 and §4 p.496 | The paper allows several fields per system and bounds isolated points. The package explicitly supplies the quotient convention and declares the missing general isolated-multiplicity contract. |

The remaining locators were also read: §0.1 at COU20 lines 104–124; §1.3 at 249–250; §§2.1 and 2.3 at 255–290; §§3.1–3.3 at 323–348; §5.1 at 385–418; §5.2 at 20–28 and 420–425; §5.3 at 425; §5.6 at 35–38 and 420–430. Theorem 1 is on p.487, Theorem 2 on p.488, Proposition 1 on p.490 and Proposition 2 on p.495. The source's Theorem 2 states H≥1 in print; the H=1 extension is also independently justified by the package's proof without division by log H.

### Adversarial table: conventions and targets

“Keep” means that the stated hypothesis excludes the computed countermodel or the computed values agree. It is not a claim that finitely many examples prove a universal theorem. Universal steps were checked by reading the proof routes and the cited inputs. Low-degree tests outside d≥5 check the indicated expression or conditional algebraic step only.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Degree, discriminant, δ and nonzero denominators (conventions, lines 19–21) | ℚ; ℚ(i); ℚ(√5); zero ring | (n,disc,δ)=(1,1,1),(2,−4,2),(2,5,√5); n and absolute disc are positive. Zero ring is not a field. | Hypotheses exclude division by zero. | Keep. |
| Mixed pairing versus house (§23) | 1 in a complex coordinate; ℚ(i) | g(1,1)=2, norm=√2, house=1; product/canonical covolumes 1/2. | Two norms and measures remain distinct. | Keep. |
| Monomial count and coefficient norm (§25) | r=d=2; X²−2 | M=6 versus 9 for a coordinatewise box; squared norm=5, max coefficient=2, value at √2=0. | Correct carrier and metric. | Keep. |
| Row-Hermitian versus native Gram convention (§27) | Rows (1),(i) | VV*=[[1,−i],[i,1]]; native Gram=[[1,i],[−i,1]]; determinants 0=0, diagonals (1,1)=(1,1). | Correct transpose convention. | Keep. |
| Explicit-range quantities (§29–36) | n=2,r=1,d=5 | M=6, ℓ=4≥nr=2; D=20, C₀=40δ², H₀=40⁵δ¹⁰, G=6·40¹⁰δ²⁰. | Powers and positivity agree. | Keep. |
| Total-function boundary conventions (§36) | Zero polynomial; absent monomial; n=0 bound input | totalDegree(0)=0; off-support coefficient=0; B(0,1,5,1)=0, outside theorem range. | No junk value used as a theorem instance. | Keep. |
| Rational versus integral image (§40) | κ=√5, d=1 | Rational rank=2=[K:ℚ]; integral index=2, not 1. | Correct distinction. | Keep. |
| Class versus embedded count (§40) | Nonnormal cubic; Galois quadratic | 3/1=3 embedded copies versus 1 class; 2/2=1 embedded copy versus 1 class. | No automorphism weight in Nₙ(H). | Keep. |
| 0.1 Weighted canonical measure | ℚ; ℚ(i); real quadratic; z=1 | Body volumes 2=2¹; 2π=2·π≥4; real quadratic volume 4=2²; complex squared norm 2 versus house²=1. Scaling determinant for ℚ(i) is (√2)²=2. | Correct measure and body. | Keep. |
| 0.2 Canonical discriminant covolume | ℚ; ℚ(i); ℚ(√5) with two bases | Gram/covolume² 1=1; 4=2²; integral basis determinant 5, rational integral family determinant 20=2²·5. | Actual integral basis is necessary and present. | Keep. |
| 0.3 Ordered minima and first m houses | n=1,4,5 | m=1,3,3; 2m−n=1,2,1; last retained exponents n/(2(n+1−m))=1/2,1,5/6. For ℚ, product=δ^(n/2)=1. | Strict half-degree and tail length correct. | Keep. |
| 0.4 Product span | V=K=k; V=ℚ⊂quadratic; inseparable degree-two field; k³×0⊂k⁴ | Product-span dimensions 1=1; 1<2 at 2dim V=n; 2=2 in characteristic 2; 3<4 despite 6>4 in the nonfield algebra. | Field and strict inequality essential; separability unnecessary. | Keep. |
| 0.5 Short integral rational basis | ℚ; ℚ(i); ℚ(√5) | Houses (1)≤1; (1,1)≤4; (1,√5)≤5, with integral index 2 in the last case. | Statement does not require an integral basis. | Keep. |
| 1.1 Parameter family and equivalence | α=(1),u=3; zero matrix in quadratic field; (1,√5); repeated (1,1) | κ=3; repeated value rows have rank 1<2; embedding determinant −2√5≠0; repeated basis determinant 0. For D=0, house(κ)=0=nDδ². | Source/target and basis condition correct. | Keep. |
| 1.2 Bounded first jets | ℚ,r=1,d=5,u=0; repeated quadratic point; falling factorial; seven collinear plane points | M=6≥2,D=10 and selected determinant 1; repeated-point jet rank 2<4; at D=3 grid values 0,0,0,6, and D=0 value 1; collinear rank 11<21=M. | Inclusive grid and actual nonzero minor essential. | Keep. |
| 1.3 Value descent | κ=√2; √5; zero in a quadratic field | Rational value ranks 2,2,1; target ranks 2,2,2; integral indices 1,2 for first two. | No false integral-surjectivity conclusion. | Keep. |
| 2.1 Relation kernel | κ=0 in ℚ,d=2; constants; √2,d=3; κ=1/2; κ=0 in quadratic field | Kernel ranks 2=3−1; 0 for constants; 2=4−2 with generator norms² 5,5; X(1/2)=1/2∉ℤ; quadratic zero tuple gives 2≠3−2. | Integrality and full value rank are retained. | Keep. |
| 2.2 Transpose image and index | √5,d=2; √2,d=1; multiplication by 2 on ℤ | B=[[1,−1,5],[0,2,0]], maximal minors 2,0,−10 have gcd 2; covol(S)/covol(L⊥)=2; second index 1; abstract covolumes 2/1=2 and covol(ker)=1≤2. | Index equality and inequality direction correct. | Keep. |
| 2.3 Gram/discriminant identity | ℚ(i),d=1; ℚ(√5),d=2; nonintegral-basis coordinates | det(BBᵗ)=1=4/4 while det(VVᵗ)=−4; for √5 det(BBᵗ)=104=520/5; rational basis gives 26=520/20, not 520/5. | Conjugation and basis discriminant essential. | Keep. |
| 2.4 Monomial values and diagonal bound | r=d=2,C₀=1; κ=0; n=2,r=1,d=5 | Six values bounded by 1, diagonal≤6; at zero diagonal=1 and an attempted H₀=0 fails; C₀=40δ²,H₀=40⁵δ¹⁰,G=6·40¹⁰δ²⁰. | Constant monomial and powers correct. | Keep. |
| 2.5 Relation covolume | √5,d=2; zero in ℚ,d=2 | covol(L)=√26≤√104=2√26=√(520/5); using exact diagonal bound 31 gives √104≤31/√5≤31. Zero tuple gives 1=√(1/1). | Intrinsic volume and discriminant factor agree. | Keep. |
| 3.1 Short relation witnesses | √2,d=3; rational coefficient 1/2; index-two vectors; intrinsic dimensions 1,2 | Product of relation norms=5≤2·5=ℓ^(ℓ/2)covol(L); rational norm 1/2<1; determinant of (2,0),(0,1)=2; ball lower volumes 2=2, 2≤π, while ambient line area=0. | Lattice integrality, independence and intrinsic measure correct. | Keep. |
| 3.2 Retained relations | n=2,ℓ=4; n=1; norms (1,2,4,8),G=4 | k=3,codim=1,tail=2; n=1 gives k=ℓ,codim=0; product 64=4²·4 and retained largest 4≤4¹√4=8. | Discarding n−1 is correct. | Keep. |
| 3.3 Joint derivative map | Point 0,d=1; d=0; points 0,1,d=3 | X↦1 gives rank 1; constant kernel gives rank 0; derivative matrix [[−1,0],[1,1]] has determinant −1 and rank 2. | Value surjectivity alone is insufficient and not used. | Keep. |
| 3.4 Full retained block | Diagonal in ℂ²; first-coordinate hyperplane in ℂ⁴; zero in ℂ² | Codimensions 1,1,2; block ranks (1,1),(1,2),(0,0); failure occurs exactly at allowed negative-control threshold n=2. | Strict codimension argument correct. | Keep. |
| 3.5 Common arithmetic minor | X³−2; X²−2; X² | Norm(3θ²)=27·4=108, each conjugate modulus 3·2^(2/3)>0; derivatives ±2√2; derivative at zero 0. | Injection of each embedding suffices. | Keep. |
| 4.1 Component map | X²−2; (X²−2)(X²−3); X²; X(X−1),XY | A=ℚ(√2), inverse image √2/4 and product with 2√2 equals 1; second A has two factors of total degree 4; X² localizes to zero; last system J=X(2X−1), J(1,0)=1 and A=ℚ. | Evaluation, localization and factor direction agree. | Keep. |
| 4.2 Explicit model theorem | ℚ,r=1,d=5,E=X; ℚ(√2),E=X²−2; line-plus-point system | First height 1≤5^(5/2)√6·10⁵≈13693063.94; second height 2≤B(2,1,5,√8)=4√6·40⁵·8⁵; last full locus contains a line but Jacobian-open part has one point. | No claim that full zero locus is finite. | Keep. |
| 5.1 Least central-binomial rank | n=0,1,2,14,15,100 | r=1,1,2,4,5,6; M=2,2,6,70,252,924. For n=15,90≤252≤360; for n=100,700≤924≤2800. At n=1,1>3log1=0; at n=0 upper estimate 2≤0 is excluded. | Least positive convention and eventual bound correct. | Keep. |
| 5.2 Uniform logarithmic models | n=14,15; expression n=1000,δ=1 | r=4,5 and M=70,252; n=1000 gives r=8,M=12870 and log B≈205.149542≤100(log1000)²≈4771.708299; r≤100log1000 and M≤100000log1000. | Arithmetic bound has correct growth and uniform parameter choice. Numerical constant 100 here is a test, not a claimed universal threshold. | Keep. |
| 5.3 Ordered coefficient box | r=0; d=0; C=0; r=d=2 | Slot counts 0,r,rM,12; corresponding cardinalities 1,(2C+1)^r,1,(2C+1)^12. X²Y² has degree 4>2 and is excluded. | Ordered native carrier correct. | Keep. |
| 5.4 Box cardinality and floor | (r,d,C)=(1,2,1),(2,0,1),(0,0,0); B=3.7 | Counts 3³=27,3²=9,1⁰=1; integers satisfying absolute value≤3.7 are −3,…,3, seven values, versus nine for ceiling 4. | Both floor-equivalence directions hold. | Keep. |
| 5.5 Models to field classes | Two quadratic factors; X(X−1); X²; line-plus-point; r=d=C=1 | (points,factors,classes)=(4,2,2),(2,2,1),(0,0,0); isolated count 1≤2²=4; linear coefficient box has 9 systems, 6 nonempty factors and one class, so 1≤9·1. | Image count, not injection; conditional on declared Bézout contract. | Keep. |
| 5.6 Discriminant-class bound | H=1,n>1; n=1,H=1; nonnormal cubic contribution | Nₙ(1)=0≤n^(Qn(log n)³) and H factor=1; degree-one actual count=1 but Qlog1=0; cubic contributes 1 class versus 3 embedded fields. | Inclusive cutoff and quantifier order correct. | Keep. |

### Adversarial table: individual definition APIs and proof identities

The following rows check the individual API claims that are not exhausted by a target's headline. They also test the five real-body definitions in Suggested.lean. Repeated expressions in the summary, layer examples and worked examples were compared with these same values.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 Haar scaling | ℚ(i), unit square and empty set | μ_can(square)=2=2·1; μ_can(∅)=0=2·0. Translation by 1 preserves square area 1 and weighted area 2. | Correct. | Keep. |
| 0.1 Pairing contributions | Complex 1,i; real 1,2 | g(1,i)=0=2Re(−i); g(i,i)=2=2Re(1); real pairing 2=1·2. | Correct. | Keep. |
| 0.1 Gauge on embedded elements | ℚ(i): 1+i and 0 | Gauge=√2=max of both conjugate moduli; zero gauge=0=house(0). Wrong Euclidean g-norm at 1+i is 2. | Correct and discriminating. | Keep. |
| 0.3 Product and independent prefix | ℚ(i), (1,i) | Product=1≤δ^(n/2)=2; m=2, prefix rank 2=m; each conjugate modulus 1≤δ=2. | All API clauses consistent. | Keep. |
| 0.4 Nondegenerate multiplication-functional route | Inseparable k(t)/k(t²), f(a+bt)=b | Pairing matrix on (1,t) is [[0,1],[1,0]], determinant −1=1 in characteristic 2. Trace pairing would be zero. | Proof truly avoids separability. | Keep. |
| 1.1 Evaluation coordinate formula | α=(1,√5), u=(2,3) | κ=2+3√5; conjugates 2±3√5 equal the corresponding embedding-matrix products. | Correct. | Keep. |
| 1.1 Parameter bound | ℚ, α=1,D=3,u=3; D=0 | house=3≤1·3·1=3; zero case 0=1·0·1. | Correct. | Keep. |
| 1.1 Reindexing/basis change | Swap (1,√5) and coefficients (2,3); change basis to (1,1+√5) | New coefficients (3,2) give 3√5+2; shear coefficients (−1,3) give −1+3(1+√5)=2+3√5. | Inverse coefficient direction correct. | Keep. |
| 2.1 Kernel-membership iff | √2,d=2: X²−2,1,X³−2X | First has (degree,value)=(2,0), hence in; second (0,1), out; third (3,0), out at d=2. | Both vanishing and degree required. | Keep. |
| 2.1 Saturation | √2,d=2, multiply X²−2 and 1 by 2 | Values 0→0 and 1→2; only the vanishing vector qualifies. Multiplier 0 would send 1 to 0 and is explicitly excluded. | Correct nonzero scalar hypothesis. | Keep. |
| 2.1 Complex span of integral kernel | √2,d=3 | Integral generators (−2,0,1,0),(0,−2,0,1) have rank 2; two conjugate value equations have rank 2 in dimension 4, kernel dimension 2. | Correct extension of scalars. | Keep. |
| 2.1 Degree inclusion | √2,d=2→3 | (−2,0,1) maps to (−2,0,1,0), value 0 at both degrees; X³−2X appears only at degree 3. | Correct inclusion, not equality. | Keep. |
| 2.2 Transpose coordinate definition | √5,d=2, integral-basis dual vectors | Images (1,−1,5),(0,2,0); pairing with relation (−5,0,1) gives 0,0. | Correct source and target. | Keep. |
| 2.2 Injectivity and equal rank | Same B; rank-deficient zero tuple in quadratic field | B has rank 2; zero tuple's B=[[1,0,0],[0,0,0]] has rank 1 and kills the second dual vector. | Full value rank is necessary. | Keep. |
| 2.2 Index and covolume comparison | √5,d=1 and d=2 | At d=1 L=0,covol=1,S has determinant 2 and covol=2; at d=2 covolumes √26 and 2√26, ratio 2 again. | Rank-zero convention agrees with positive-rank case. | Keep. |
| 2.2 Integral basis invariance | β=(1,(1+√5)/2)→(1,(3+√5)/2) | New B rows (1,−3,5),(0,2,0); Gram [[35,−6],[−6,4]] has determinant 104=old determinant. | Unimodular basis change preserves S and its volume. | Keep. |
| 2.3 Matrix factorization | √5,d=2 | A=[[1,(1+√5)/2],[1,(1−√5)/2]] times B equals [[1,√5,5],[1,−√5,5]]=V. | Correct row/column direction. | Keep. |
| 2.4 Constant monomial and power monotonicity | C₀=1 and degree 0 or 2; C₀=0 negative control | 1≤1²=1; 1≤0²=0 is false. | C₀≥1 excludes wrong model. | Keep. |
| 3.1 Equation membership and scalar-extension basis | √2,d=3 | E₁(√2)=E₂(√2)=0; degrees 2,3≤3; two independent vectors span the dimension-two real and complex kernels. | Correct. | Keep. |
| 3.1 Absolute coefficient bound by norm | X²−2; zero polynomial | Coefficients 2,1≤√5; all zero coefficients 0≤0. | Correct; lower norm≥1 is only for nonzero witnesses. | Keep. |
| 3.2 Codimension and positivity formulas | n=2,r=1,d=5; n=2,r=2,M=6 as size-only test | ℓ=4,k=3,codim=1; second ℓ=4,k=3≥2(2−1)+1=3. | Positive natural subtraction justified. | Keep. |
| 3.4 Codimension cannot increase under surjection | ℂ⁴→ℂ², projection; W first-coordinate-zero hyperplane | codim W=1 and image codim=1; imposing only fourth-coordinate zero gives image codim=0≤1. | Correct inequality direction. | Keep. |
| 3.4 Independent block annihilators | Zero subspace in ℂ² | Two coordinate functionals are independent, annihilator dimension 2=n; impossible if image codim≤1. | Correct contradiction. | Keep. |
| 3.5 Same selected integer rows | X²−2 at ±√2 | One determinant polynomial 2X gives values ±2√2, product −8≠0. Selecting arbitrary complex functions would not produce this shared field element. | Arithmetic compatibility excludes wrong model. | Keep. |
| `jacobianPolynomial` body (§4.1) | E=(X,Y), swapped equations; one variable at 3; r=0 | Determinants 1,−1; for X²−2 at 3 determinant 6≠value 7; empty determinant 1. | Correct ordinary derivatives and determinant parity. | Keep. |
| Evaluated integer Jacobian under ring maps | X²−X mod 2; X³−X mod 3; zero ring | Derivatives 2x−1 map to 1; 3x²−1 map to 2; empty determinant maps 1 to 0=1 in zero ring. | Base-change compatibility valid without factorial division. | Keep. |
| `JacobianOpenAlgebra` body (§4.1) | X²−2; X²; empty system | Quotient/localization gives ℚ(√2), zero ring, and ℚ respectively. Localization at nilpotent 2X kills 1 in ℚ[X]/X². | Body determines intended principal open. | Keep. |
| 4.1 Quotient and localization universal maps | X²−2 at √2 | Class of X²−2=0; image of 2X is 2√2; image of its inverse √2/4; their product 1. | Maps have actual specified domains. | Keep. |
| 4.1 Unit versus nonzero | R=ℚ[ε]/ε²,E=X²,κ=ε | E(κ)=0, J=2ε≠0, J²=0; no inverse can have product 1. | General-ring API requires a unit, field theorem requires nonzero. | Keep. |
| 4.1 Agreement on rational polynomials | E=X²−2, f=1+X | Both φ([f]) and f(κ) equal 1+√2; replacing κ by −√2 gives 1−√2. | Compatibility excludes an unmarked conjugate map. | Keep. |
| 4.1 Uniqueness | Same system, forced image of inverse | If (2√2)y=1 then y=√2/4. Images of constants, X and J⁻¹ determine every element. | No free choice of map remains. | Keep. |
| 4.1 Surjection as component projection | (X²−2)(X²−3) | Algebra dimension 4, projections onto fields of dimension 2; projection kernel is the other dimension-two factor, not zero. | Onto does not imply whole-algebra isomorphism. | Keep. |
| 4.1 Equation permutation | E=(X,Y), swap | J changes 1→−1; ideals (X,Y)=(Y,X), both localized algebras ℚ. | Unit rescaling has correct effect. | Keep. |
| `HasBoundedModel` body (§4.2) | ℚ,E=X,κ=0,H=1; fake zero map; X² at zero | Valid tuple: height 1≤1,J=1; fake map sends 1 to 0≠1; singular tuple has J=0. | No free Prop or arbitrary-data escape. | Keep. |
| 4.2 Monotonicity in d,H | E=X²−2,d=2,H=2→d=5,H=3 | 2≤2→2≤5; coefficient bound 2≤2→2≤3; maps and Jacobian unchanged. | Correct. | Keep. |
| 4.2 Transport by field equivalence | Quadratic conjugation √2↦−√2 | Polynomial values 0→0, Jacobian 2√2→−2√2≠0, integral point remains integral, height 2=2. | Actual compatible map transports. | Keep. |
| `explicitCoefficientBound` positivity and expansion (§4.2) | n=1,r=1,d=5,δ=1 | ℓ=5; √G=√6·10⁵; B=5^(5/2)√G>0. | Expansion matches the target. | Keep. |
| `explicitCoefficientBound` δ exponent and junk input | Double δ at n=1,r=1,d=5; n=0 | Ratio B(…,2)/B(…,1)=2¹⁰=1024; n=0 gives exponent 6/0=0, leading power 6⁰=1, and remaining factor 0⁵=0. | Total definition, restricted theorem. | Keep. |
| `centralBinomialRank` body (§5.1) | n=0,1,2,14,15 | Least positive admissible indices 1,1,2,4,5; at n=15 preceding Catalan=14<15≤42. | Positivity and minimality correct. | Keep. |
| 5.1 Catalan identity and ratio | r=0,1,2,4 | Catalan=1,1,2,14; (r+1)Fᵣ=1,2,6,70 equals central binomial. Ratios F₁/F₀=1,F₂/F₁=2,F₅/F₄=3; formula gives 1,2,3, all <4. | Native sequence reused correctly. | Keep. |
| 5.1 Central lower growth bound | r=0,1,2 | 1≤1; 4≤3·2=6; 16≤5·6=30. | Base case r=0 retained by supplier. | Keep. |
| 5.1 Rank monotonicity | n=1≤2≤14≤15 | 1≤2≤4≤5; admissibility threshold values 1,2,14,42. | Correct direction. | Keep. |
| 5.2 Log-height expansion | n=1000,r=8,δ=1 and δ=2 | log B increases by 2r log2=16log2≈11.090355; proposed log-height increases by Qlog1000 log2. | δ dependence linear in logδ with correct factor. | Keep. |
| 5.3 Box membership iff | r=d=2,C=1 | X²+Y has degree 2 and coefficients 1, hence qualifies; 2X fails coefficient bound 2≤1; X²Y² fails degree bound 4≤2; zero satisfies both. | Both defining conditions discriminate. | Keep. |
| 5.3 Coordinates, finiteness, projection | r=d=2,C=1 | Six bounded monomials per equation, two equations, 12 slots; 3¹²=531441 finite tuples; each equation has total degree≤2. | Correct native-coordinate adapter. | Keep. |
| 5.3 Inclusion of boxes | r=1,(d,C)=(1,1)→(2,2) | 3²=9 old systems, 5³=125 new; 1+X remains in, X² newly qualifies. | Correct direction. | Keep. |
| 5.4 Real floor equivalence | B=0,0.7,3.7; coefficients 0,1,3,4 | At 0.7, 0 qualifies and 1 fails on both sides of floor=0; at 3.7,3 qualifies and 4 fails on both sides of floor=3. | Both directions checked. | Keep. |
| 5.5 Geometric points versus factor degrees | Quadratic product; split rational product; zero algebra | Geometric counts 4=2+2,2=1+1,0=empty sum; factor counts 2≤4,2≤2,0≤0. | Empty and repeated-isomorphism factors handled. | Keep. |
| 5.5 Exact-degree and height restriction | Product of fields of discriminants 8 and 12 | Degree-two class set has size 2; H=8 leaves size 1; degree-three restriction leaves size 0, each ≤2. | Restrictions cannot increase count. | Keep. |
| 5.6 Root discriminant from cutoff | ℚ(i),H=4; ℚ(√2),H=8 | δ=2=4^(1/2); δ=√8=8^(1/2); both meet inclusive cutoff. | Correct 1/n exponent. | Keep. |
| 5.6 Floor and three-times-height bound | B=1 and 3.7 | 2floor(B)+1=3≤3; 7≤11.1. | B≥1 supplies stated estimate. | Keep. |
| 5.6 Logarithm of counting expression | n=1000,r=8,M=12870, model constant Q₀=100 | rM=102960; coefficient of log H is (rM/n)Q₀log n≈71122.25; 3^box contributes 102960log3 and factor term rlogr=8log8. These are the displayed n(log n)^4 and (log n)^3log H terms. | Exponents have required growth; H=1 sets the H term to zero. | Keep. |
| Declared isolated-point contract | X²−2; X²; X(X−1),XY over algebraic closure | Multiplicity sums 1+1=2≤2; 2≤2; isolated-point sum 1≤4 despite a line. Jacobian at (1,0)=1 gives multiplicity 1. | Precise contract has the right negative control. | Keep conditional gap. |

The noncompact, infinite-rank, non-Hausdorff and non-finite-type countermodels from the review checklist cannot satisfy the finite-dimensional lattice or étale-presentation hypotheses used here. The number-field carrier supplies characteristic zero and finite dimension, not an arbitrary field or DVR. General-ring and characteristic-2/3 claims are confined to polynomial determinant naturality and the separate field product-span statement. No theorem about a nonabelian group, q, a prime-dependent denominator, a cover, or a fan is asserted. The relevant characteristic-2 inseparability and nonreduced-ring tests are explicitly included above.

### Pinned library audit

The content main commit is `bfaaff10`. The manifest pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following declarations were opened at those pins; paths in this table are relative to the named library repository.

| Pinned declaration(s) and file | Lines opened | What the declaration actually supplies |
| --- | --- | --- |
| `NumberField` — `Mathlib/NumberTheory/NumberField/Basic.lean` | 41–44 | Characteristic zero and finite-dimensional ℚ-vector space, under `[Field K]`. Thus n=0 and the zero ring are excluded. |
| `NumberField.discr`, `discr_ne_zero`, `discr_eq_discr_of_algEquiv` — `Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean` | 36,41,50 | Integer discriminant from the ring-of-integers basis, nonvanishing, invariance under ℚ-algebra equivalence. It does not identify arbitrary integral rational-basis discriminants with the field discriminant. |
| `NumberField.rootDiscr`, `rootDiscr_def` — `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean` | 77–81 | Absolute discriminant to the real inverse-degree power. |
| `NumberField.mixedEmbedding.covolume_integerLattice` — same file | 124–131 | Product-volume covolume `(2⁻¹)^r₂ * √abs(discr)`, not the weighted measure used in §0.1. |
| `NumberField.abs_discr_gt_two`, `NumberField.finite_of_discr_bdd` — same file | 273,494–500 | Degree>1 excludes discriminant cutoff 1; finiteness concerns finite-dimensional intermediate fields of a fixed ambient characteristic-zero field. |
| `NumberField.mixedEmbedding.finrank`, `latticeBasis` — `Mathlib/NumberTheory/NumberField/CanonicalEmbedding/Basic.lean` | 212–215,637–655 | Dimension n; real lattice basis built from an actual integral basis. |
| `NumberField.canonicalEmbedding.norm_le_iff` — same file | 79–86 | Supremum norm bound iff every complex embedding modulus is bounded. |
| `NumberField.mixedEmbedding.euclidean.mixedSpace`, `toMixed`, `volumePreserving_toMixed` — same file | 815–861 | Existing unweighted Euclidean mixed space; the complex coordinate 1 has squared norm 1 here, not 2. This does not duplicate the new weighted canonical metric. |
| `NumberField.house`, `house_eq_sup'`, `house_sum_le_sum_house`, `house_mul_le`, `house_intCast`, `one_le_house_of_isIntegral` — `Mathlib/NumberTheory/NumberField/House.lean` | 38,41,45,51,74,93 | Native house, sum/product bounds, integer normalization; the last requires both integrality and nonzero element. |
| `MvPolynomial.basisRestrictSupport`, `restrictTotalDegree`, `mem_restrictTotalDegree` — `Mathlib/RingTheory/MvPolynomial/Basic.lean` | 95–96,164–175 | Support basis; bounded total exponent sum; membership iff native total degree≤d. No separate coordinate degree restriction or field condition is built in. |
| `MvPolynomial.aeval` — `Mathlib/Algebra/MvPolynomial/Eval.lean` | 566–573 | Actual algebra evaluation on native multivariate polynomials. |
| `MvPolynomial.pderiv` — `Mathlib/Algebra/MvPolynomial/PDeriv.lean` | 54–69 | Ordinary derivation, including exponent factors. No factorial normalization. |
| `MvPolynomial.eq_zero_of_eval_zero_at_prod_finset` — `Mathlib/Combinatorics/Nullstellensatz.lean` | 62–66 | Finite variables, integral domain, and strict coordinate-degree/grid-cardinality inequalities. Complex coefficients are permitted. |
| `Algebra.discr_not_zero_of_basis`, `discr_eq_det_embeddingsMatrixReindex_pow_two` — `Mathlib/RingTheory/Discriminant.lean` | 122–145 | Finite field extension, separability, and an algebraically closed embedding target for the determinant comparison. Native embedding-matrix rows index basis vectors, so the package's A is transposed. |
| `ZLattice.covolume_eq_det_mul_measureReal`, `covolume_div_covolume_eq_relIndex'` — `Mathlib/Algebra/Module/ZLattice/Covolume.lean` | 115–117,170–174 | Lattice determinant with explicit Haar measure; quotient of intrinsic full-lattice covolumes equals relative index. The latter requires finite-dimensional real inner-product/Borel structure and discrete full lattices. |
| `AddSubmonoid.ker_saturated` — `Mathlib/GroupTheory/Subgroup/Saturated.lean` | 62–63 | Saturation of additive kernels with torsion-free target; integer negatives are handled by additive inverses. |
| `Ideal.Quotient.mk` — `Mathlib/RingTheory/Ideal/Quotient/Defs.lean` | 83–89 | Actual unital quotient homomorphism; a zero function into a field cannot replace it. |
| `Localization.Away` — `Mathlib/GroupTheory/MonoidLocalization/Away.lean`; `Localization.awayLift` — `Mathlib/RingTheory/Localization/Away/Basic.lean` | 140–141;484–487 | Native localization at the powers of the chosen element; extending evaluation requires its image to be a unit. |
| `Algebra.Etale.iff_exists_algEquiv_prod` — `Mathlib/RingTheory/Etale/Field.lean` | 271–286 | Étale algebra over a field iff finite product of finite separable field extensions; the finite index type can be empty. |
| `Algebra.FormallyEtale.iff_exists_algEquiv_prod` — same file | 194–198 | Its separate essential-finite-type hypothesis was checked; the package does not omit it or replace étaleness by unrestricted formal étaleness. |
| `Nat.centralBinom`, `Nat.succ_mul_centralBinom_succ`, `Nat.four_pow_le_two_mul_add_one_mul_centralBinom` — `Mathlib/Data/Nat/Choose/Central.lean` | 36–37,78–80,123–128 | Native central binomial, exact recurrence, and exponential lower bound including zero. |
| `catalan`, `succ_mul_catalan_eq_centralBinom` — `Mathlib/Combinatorics/Enumerative/Catalan/Basic.lean` | 52–56,126–127 | Native Catalan numbers and `(n+1)catalan(n)=centralBinom(n)`. |
| `Matrix.gram` — `Mathlib/Analysis/InnerProductSpace/GramMatrix.lean` | 39–43 | Entries are the native inner products, conjugate-linear in the first variable; the package's VV* is their transpose. |
| `Submodule.span`; `Module.finrank` — `Mathlib/LinearAlgebra/Span/Defs.lean`; `Mathlib/LinearAlgebra/Dimension/Finrank.lean` | 46–47;61–62 | Native span and natural cardinal rank. Finite dimension is a hypothesis, not encoded by arbitrary use of finrank. |
| `NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le`, `hermiteCountBound` — `TauCeti/NumberTheory/EffectiveBounds/HermiteCount/Basic.lean` | 172–176,202–203 | Existing fixed-ambient count and `(2C+1)^(D+1)D`; neither is the new degree-sensitive class bound. |
| `ZLattice.covolume_sq_eq_det_gram` — `TauCeti/Algebra/Module/ZLattice/Covolume.lean` | 37–45 | Squared canonical covolume equals Gram determinant for an integral basis of a discrete full lattice in a finite-dimensional real inner-product/Borel space. Applying it intrinsically permits rank zero. |

### Ownership and supplier resolution

The main-branch READMEs read for shape and baseline context were `Completed/EffectiveBounds/README.md`, `TauCetiRoadmap/SchemeAndStackFoundations/README.md` and `TauCetiRoadmap/ComplexTori/README.md`. The new README follows the required summary/scope/conventions/contracts/layers/examples/dependencies/references form; its metadata is `topic = "math.NT"`. Every definition has an API and at least three relevant discriminating Checks, sometimes shared within the subsection's Check list. The five Lean definitions are needed to state the model headlines and have real bodies. Every own backticked declaration name resolves to one of the nine declarations; no foreign roadmap module is imported.

Ownership searches used `roadmaps grep` over main and the indexed open heads, native `rg` over both pinned libraries and board packages, and the supplied board package index before assessing absent files. Searches were by house/root discriminant, short integral bases, product span, weighted canonical metric, evaluation/transpose relation lattices, Jacobian localization, generic first jets, coefficient boxes and field counts. No duplicate fully qualified declaration in `TauCetiRoadmap.EffectiveBoundsPartII` was found. In particular:

| Object/citation | Resolved owner and passage | Comparison and witness |
| --- | --- | --- |
| Existing effective Hermite theory | `Completed/EffectiveBounds/README.md:123`, Layer 2; pinned Tau Ceti count above | Old primitive-polynomial count `(2C+1)^(D+1)D` differs from ordered square-system count `(2C+1)^(rM)d^r`. The new roadmap extends the completed one. |
| Gram–Hadamard | `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md`, §0.1.2, target at line 251 of the open head | Finite Gram family in an RCLike inner-product space; zero determinant for dependent rows is allowed. Test (1),(i) has determinant 0 and diagonal product 1. |
| Saturated basis/orthogonal intersections | Same roadmap §§0.2.1,0.2.6, targets at lines 282,332 | Full discrete ambient lattice; intersection spans W; self-duality used for full orthogonal lattice. Standard ℤ² with W=ℝ(1,1) gives both intrinsic covolumes √2. |
| Primitive orthogonal covolumes | Same roadmap §0.3.3, line 382 | Self-dual lattice, not just covolume one. ℤ(2,2) would have covolume 2√2 and is not the primitive intersection. |
| Ordered-product bound and ball volume | Same roadmap §§1.1.2–1.1.5, lines 416–447 | Zero-based tail n−i corresponds to one-based n+1−i. At (2,2),V=4 the first bound is 2=√4; dimension-two inscribed square area 2≤π. |
| Attaining witnesses | Same roadmap §1.2.7, line 531 | One real independent family, not necessarily an integral basis. Unit-square diagonal pair has determinant absolute value 2 while both gauges equal 1. |
| Second Minkowski | Same roadmap §1.5.21, line 885 | Explicit common additive Haar measure and a centrally symmetric convex body containing zero in its interior. L=2ℤ, body [−3,3]: (2/3)·6=2·2=4. |
| Monomial coordinates and real coefficient metric | `TauCetiRoadmap/GenericDoublePointInterpolation/README.md`, §§0.1,0.3, lines 241–345 of the open head | Native bounded-support adapter and metric are supplied, not rebuilt. Six degree-two plane monomials; squared coefficient norm of 2+X is 5. |
| First jets, value kernel, matrix conventions | Same roadmap §§1.3–1.4, lines 447–548 | `Option (Fin r)` indexes value plus ordinary partials; derivative-on-value-kernel surjectivity follows from joint jet surjectivity. At 0, 1 and X give the identity matrix. |
| Universal minor and bounded specialization | Same roadmap §§5.1–5.3, lines 1505–1626 | r,n≥1,d≥5,M≥n(r+1); nonzero integer minor of total degree≤dn(r+1). Its integer-polynomial parameter-pullback export does not cover the complex embedding substitution, so the consumer correctly applies Mathlib over ℂ. |
| Jacobian-open étaleness | Main `TauCetiRoadmap/SchemeAndStackFoundations/README.md:900`, §0.10 | Arbitrary commutative base, étale finite presentation. Over A[t], tx−1 produces A[t,t⁻¹], generally not finite; over ℚ the pinned field theorem supplies finiteness. No assertion is imported from the roadmap's revision head. |
| Bézout | Main `TauCetiRoadmap/SchemeAndStackFoundations/README.md:7338`, §5.12 | The named projective binary-intersection inequality exists. The isolated affine system/multiplicity consequence is the declared gap, not falsely claimed as already exported. |
| Field-class quotient, degree, height | `TauCetiRoadmap/ArithmeticStatisticsPartI/README.md`, §0.7, “Number fields ordered by discriminant”, lines 1302–1322 of the open head | `NumberFieldFamily.Embedded`, `isoSetoid`, `isoFamily`, `isoDegree` all occur there. The two resolver warnings concerned names absent from pinned libraries, but they are explicit supplier targets. Nonnormal cubic multiplicity 3 versus class count 1 agrees with the adjacent count target at line 1338. |
| Generic coefficient-vector box | Same roadmap, “Coefficient box”, lines 1561–1585 | Counts native integer vectors. This package's §5.3 is the bounded-multivariate-polynomial tuple adapter using GenericDoublePointInterpolation's coordinates; it creates no generic height carrier. The specialization r=d=2 has twelve slots and 531441 systems at C=1. |
| Class-group relation lattices | Main `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:11158`, §5.2; open ComputationalNumberTheory scope | Their target map is ℤᴺ→Cl(K). Here it is bounded additive evaluation into 𝓞_K; the √5 relation (−5,0,1) has evaluated value 0. These are different objects. |
| Board arithmetic-statistics package | `packages/ArithmeticStatistics/README.md` at supplied head `357e723`, lines 3–9 | The package is an index of eight parts, with no targets of its own; it directs Layer 0 to ArithmeticStatisticsPartI. It does not introduce a competing compact-model theorem. |

The helper display from `roadmaps show` prepends one comment line; open-head line numbers above subtract that comment and refer to the actual README. No later roadmap is newly cited as a supplier. The elementary multiplication-functional and block-codimension arguments are owned here because the searched owners supply the general duality/rank APIs, not these arithmetic proof steps. Native quotient/localization specialization does not reconstruct the generic Jacobian étaleness theorem.

The single gap appears with exactly the same slug, supplier, section and needs sentence in `packages/EffectiveBoundsPartII/design/plan.json` and README line 82. It is precise: r,d≥1, algebraically closed field, r equations in r variables, total degree≤d, isolated-point local multiplicities, and invertible square Jacobian. It is one coherent missing consequence, not an unowned or vague prerequisite. Main SchemeAndStackFoundations §5.12 does not already state that exact consequence; the additional mixed-component witness is 1 isolated simple point ≤4 alongside a line. No supplied object was found that makes the contract redundant.

The dependency check, run with the requested movable option, returned exactly:

```text
moved: EffectiveBoundsPartII moved in the merge order from #99 to #123, right after its last supplier ArithmeticStatisticsPartI; checked as moved (the worker moves it there when it submits)
depcheck: 49 roadmaps, 556 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The move is permitted by the brief and was not applied by this reviewer. All internal `*Needs:*` references resolve to earlier targets. Layer 5's parameter selection and box construction can be built independently of the geometric component construction, as the README explicitly states.

### Headline coverage, elaboration and padding

The six advertised headlines are:

1. §0.5: a δ²-short integral rational basis.
2. §1.2: bounded integer parameters giving surjective conjugate first jets.
3. §4.2: the explicit bounded field-component model.
4. §5.2: degree-uniform logarithmic models with one absolute constant.
5. §5.5: the coefficient-box/field-component bound on represented field classes.
6. §5.6: the cubic-logarithmic discriminant exponent for exact-degree class counts.

The first four appear as the four admitted theorems. The latter two are named in the module docstring with the absent supplier-owned number-field isomorphism-family quotient, degree and height; they are not replaced by an embedded-field count. Searches at the pins found the fixed-ambient intermediate-field count, not the specified quotient carrier. Defining a second quotient here would duplicate ArithmeticStatisticsPartI's object.

`lake env lean` was run from the content checkout on the unchanged `packages/EffectiveBoundsPartII/Suggested.lean`. It exited 0, with exactly four warnings that declarations use `sorry`, at lines 26,37,110,130. There were no other warnings or errors. The file has only `import Mathlib`, so no Tau Ceti object build was required.

A scratch copy added `#check @...` for each of the nine declarations and, at each of the four admitted proofs, independently tested closure by `simp`, `rfl` and `infer_instance` under `fail_if_success`. The copy also exited 0 with only the same four intended `sorry` warnings: none of those one-tactic probes closed a headline. The object searches above found no matching pinned theorem that would supply a one-lemma `exact` proof. No declaration mirrors a Check or merely unfolds a definition.

| Declaration | Elaborated signature compared to README | Outcome |
| --- | --- | --- |
| `exists_short_integral_basis` | K in arbitrary universe, `[Field K] [NumberField K]`, actual `Module.Basis (Fin (finrank ℚ K)) ℚ K`, integrality and house bounds | Correct; no lost binder. |
| `exists_bounded_first_jet_generators` | Explicit r,d and three numerical hypotheses; actual basis, integer parameter matrix, integral tuple and complex polynomial jet map indexed by all embeddings | Correct; no arbitrary configuration substituted, no lost binder. |
| `jacobianPolynomial` | Ordered integer equations, `Fin r` variables, rational polynomial result | Correct specialization; r=0 allowed by body. |
| `JacobianOpenAlgebra` | Native localization of actual quotient by the same mapped equations | Correct carrier; no sorry'd data. |
| `HasBoundedModel` | Explicit field and number-field instances; κ in native integers; E in native polynomials; shared actual evaluation, Jacobian and compatible surjection | Correct; no lost section hypothesis or free condition. |
| `explicitCoefficientBound` | ℕ→ℕ→ℕ→ℝ→ℝ with natural ℓ subtraction and real exponent division | Correct; theorem hypotheses exclude its junk inputs. |
| `exists_explicit_small_model` | Same r,d range and degree inequality as §4.2, native root discriminant, full model predicate | Correct; no weakened stand-in. |
| `centralBinomialRank` | ℕ→ℕ, infimum of the explicit positive admissible set | Correct; nonemptiness proved in §5.1, not smuggled into an instance. |
| `exists_logarithmic_small_models` | ∃Q≥3 before ∀K; n>Q; r is the fixed function of n; all three size conclusions and full model predicate | Correct uniformity and universes. |

No signature changed because no authored file was edited.

## Not verifiable

- The board package index names `packages/SchemeAndStackFoundationsPartII/README.md` at head `accb0a0`, but reading that exact file at that head returned HTTP 404. This checkout contains only that package's reports directory. Ownership against that particular board package could not be checked. This is not a claim that the roadmap exists nowhere, and it is not the cited supplier: the cited main-branch SchemeAndStackFoundations §§0.10 and 5.12 were read successfully.
- No cited source was unreadable. The supplier gap is a declared contract, not an inaccessible source and not a finding. Acceptance remains conditional on its delivery.

## Source issues

- **Misprint** in COU20 at §3, printed p.493, COU20 line 266: the source says the integral relation lattice is tensored over ℚ with ℝ; it should be tensored over ℤ with ℝ, or rationalized before tensoring over ℚ; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "06884a94331b1a80f42bf83fd1df828e001f63e0", "job": "REV-PKG-EffectiveBoundsPartII", "model": "gpt-6-astra", "worker": "chris-8"} -->
