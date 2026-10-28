<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1467#issuecomment-6425477809 -->
Red team round 2 pass a (codex) of 95bc923

Verdict: needs_changes

1. **F01** (P1) Hadamard supplier sections have moved to SuccessiveMinima

   **Location:** packages/DiophantineApproximationAndTranscendencePartII/README.md:63: “Consume §0.1.1, ‘Gram determinants and the Hadamard inequality’”. Also :9, :61, :547, :559 and :633.

   **Claim:** GeometryOfNumbersAndQuadraticArithmetic §§0.1.1–0.1.2 supply the coordinate and Hermitian Gram bounds used by §3.6.

   **Witness:** TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:104–106 at its open head imports those results from SuccessiveMinima; its Layer 0 starts at §0.2. Main TauCetiRoadmap/SuccessiveMinima/README.md:173 and :188, and TauCetiRoadmap/SuccessiveMinima/Suggested.lean:187 and :192, contain the matching targets.

   **Exact repair text:** Replace the supplier heading with “### From TauCetiRoadmap.SuccessiveMinima”. Replace its contract's first two sentences with: “Consume SuccessiveMinima §0.1.1, orthonormal_coordinate_hadamard, for the coordinate determinant bound ‖det_b(v)‖≤∏‖v_i‖ in a normed RCLike inner-product space with a full orthonormal basis, allowing dependent and empty families. Consume SuccessiveMinima §0.1.2, hermitian_gram_hadamard, for nonnegative Hermitian Gram determinants in arbitrary ambient dimension.” Replace the GeometryOfNumbersAndQuadraticArithmetic §0.1 citations in Scope, §3.6 and Layer 3 Dependencies by the corresponding SuccessiveMinima citations. Preserve the circle equality target and native Gram–Schmidt input.

   **Repair test:** In ℂ² the Vandermonde rows for (1,−1) have norms √2,√2 and determinant −2: the imported inequality gives 2≤2. Coincident rows give 0≤2; the empty family gives 1≤1. SuccessiveMinima is on main, so this introduces no later supplier. This is supplier drift, not a re-raised settled finding.

2. **F02** (P3) The variation repair adds a forward dependency

   **Location:** packages/DiophantineApproximationAndTranscendencePartII/README.md:505: “§3.5 for the C¹ specialization.”

   **Claim:** The stated section order supplies §3.3's C¹ specialization before it is used.

   **Witness:** §3.3 now explicitly needs the later §3.5. TauCeti/Analysis/Calculus/MetricVariation.lean:276 already provides the required C¹ identity, and packages/DiophantineApproximationAndTranscendencePartII/README.md:45 already imports it. No intervening circle theorem is needed.

   **Exact repair text:** Replace “§3.5 for the C¹ specialization” by “Tau Ceti `TauCeti.eVariationOn_eq_lintegral_enorm_derivWithin` for the C¹ specialization”. Apply it to the real angular pullback, replacing the within derivative away from the null endpoints, as already explained in §3.5.

   **Repair test:** For g(z)=Re z, both the angular variation and ∫₀¹2π|sin(2πt)|dt are 4; for constants both are 0. The source requires a complete real normed target, satisfied by ℝ. This removes the forward edge without changing the general BV Koksma theorem.

## Previous findings: verification at this head

| Earlier finding | Status | Repaired passage and witness |
|---|---|---|
| Pass a F01: native C¹ variation duplication | Repaired; see S02 for a new dependency defect | packages/DiophantineApproximationAndTranscendencePartII/README.md:527 now says “apply `TauCeti.eVariationOn_eq_lintegral_enorm_derivWithin` to its real angular pullback on [0,1]”; packages/DiophantineApproximationAndTranscendencePartII/README.md:45 and :541 name the supplier. For cos(2πt), both sides are 4; constants give 0. |
| Pass b F01: process narrative | Repaired | packages/DiophantineApproximationAndTranscendencePartII/README.md:73: “The generalization problem DiophantineApproximationAndTranscendencePartII/G1 asks for exact base-point-sensitive geometric hypotheses and a rank theorem under them.” The previous obligation/maintainer-decision prose is absent. No theorem is asserted for arbitrary compacta. |
| Pass b F02: differential-module supplier overclaim | Repaired | packages/DiophantineApproximationAndTranscendencePartII/README.md:687: “Part I §5.1 supplies finite-dimensional derivative spans” and “Tracking full meromorphic local bases through these constructions is part of this closure target.” For f=1,g=−1 the sum has order 0 while their cyclic direct-sum vector has order 1, correctly distinguished by packages/DiophantineApproximationAndTranscendencePartII/README.md:697. |
| Pass b F03: Lemma 2.3.1 locator | Repaired | packages/DiophantineApproximationAndTranscendencePartII/README.md:339 now gives “§2.3, Lemma 2.3.1, pp.639–641, CDT25 line 711”; packages/DiophantineApproximationAndTranscendencePartII/sources.toml:12 agrees. CDT25 line 711 precedes the page-640 marker at line 714, confirming the statement begins on printed p.639. |

## Verified sound

Read every line of packages/DiophantineApproximationAndTranscendencePartII/README.md (887 lines), Suggested.lean (85 lines), both earlier passes and their repair report, and the repository README/CONTRIBUTING rules. Counts: **6 Lean declarations** (4 definitions, 2 theorems), **35 numbered README targets**, the separate order-preserving descent assertion in §4.1, **40 supporting API bullets**, and **107 numbered-section Checks**. The targets are plain paragraphs under numbered headings, not bold theorem blocks. All are represented in the computed tables below. **40 distinct explicit source-line locators** in the README were resolved against the three cached legal sources; the named BB11 §8 and Saff10 theorem/definition passages were also read. No new source was needed.

The six worker-elaborated signatures were compared individually to the actual file and README. I ran no Lean command: the read-only prohibition controls this pass. There are no section variable blocks, and both theorem signatures explicitly retain all hypotheses. The rational-function algebra instance is scoped; the file opens RatFunc. The Laurent equality fixes pSeries and imposes regularity. The integral pullbacks use inner-series-first substitution; χ₀=0 supplies HasSubst. AnalyticOnNhd at every point of the closed ball supplies a common open neighbourhood by taking their union. The germ relation and connected-disc identity theorem fix the realizations. No dropped binder, arbitrary-Prop stand-in, sorry-valued data, extra import, set_option or padding was found.

The acceptance endpoints are integrated rank (§2.1), algebraicity (§2.2), holonomic rank (§4.5), fields and scalar comparison (§4.6), integral-coordinate finiteness (§4.7), and centred capacity rank (§5.1). The first two are stated. packages/DiophantineApproximationAndTranscendencePartII/Suggested.lean:10–15 explicitly names the remaining endpoints and the missing scalar-equation/full-meromorphic-basis and arithmetic holonomic-ring carriers. The alternative routes and their supporting Eisenstein, discrepancy and Fekete results remain README work; their earlier deletion from the acceptance file is not reopened. Neither retained theorem follows by unfolding a definition or one pinned library result. Each of the four definitions is needed by those theorems.

### Computed declaration and signature table

All declarations lie in namespace TauCetiRoadmap.DiophantineApproximationAndTranscendencePartII. There are no inherited section variables or local instances. “Retain” records the result of these mathematical tests, not a Lean proof.

| Declaration; section and context | Instances tried | Values computed on both sides | Result; change |
|---|---|---|---|
| IntegralSeries; Layer 0, f:PowerSeries ℚ | 0,1,1+x/2 | All coefficients 0; coefficients (1,0,…); coefficient₁=1/2 has no integer witness | true,true,false; retain |
| Uniformizes; Layer 0, φ,g:ℂ→ℂ, f:PowerSeries ℚ; existential analytic F | F=x², φ=2z, g=4z² versus 2z²; constant term 1 versus branch −1 | F''(0)/2!=2/2=1; F∘φ=4z²≠2z²; values 1≠−1 at zero | Germ and factorial distinguish the intended object; retain |
| positiveLogMean; Layer 0, g:ℂ→ℂ | g=2z,0,1/2,exp(−4z) | J=log2,0,0,4/π respectively; unnormalized first integral 2πlog2 | Correct cutoff and probability normalization; retain |
| rationalFunctionField; Layer 0, p:RatFunc ℚ; native IntermediateField ℚ ℚ((x)) | p=x,x²,0,2; replace x² by 3x²+2 | Fields ℚ(x),ℚ(x²),ℚ,ℚ; first two degrees 1,2; last two infinite, native finrank 0; ℚ(3x²+2)=ℚ(x²) | Scalar field fixed, including constants; retain |
| mean_rank_bound; Layer 2, p,pSeries,χ,φ,g,m,f:Fin m→ℚ[[x]],u:Fin m→ℂ→ℂ; explicit nonconstant/regular/tangent/integral/analytic/expanding/germ/independence hypotheses | p=x,χ=t,φ=2z, m=0 or f={1}; p=x², f={1,x}; p=(1−2x)⁻¹, φ=(1−exp(4z))/2, f={1} | 0≤e,1≤e; J=log4 gives 2≤2e; rational example λ=2, g=exp(−4z), bound e(4/π)/log2≈4.993202 | No missing denominator or scalar assumption; retain |
| arithmetic_algebraicity; Layer 2, same scalar hypotheses, one f,u; no independence premise | f=0,1,√(1−4x), p=x,χ=t, φ=(1−exp(8z))/4 | Polynomials Y,Y−1,Y²−1+4x evaluate to 0; last realization exp(4z), λ=2; last series is not rational since 1−4x has a simple zero | Both displayed algebraicity conclusions match README; retain |

### Computed target table

The parenthesized count is the number of Check bullets read and tested in the section. All arithmetic carriers here have characteristic zero; arbitrary DVRs, inseparable fields, nonreduced schemes and nonabelian groups are not quantified over. Relevant empty-index, rank-zero, zero-series, zero-denominator, singular-point, boundary and noncompact-domain cases are computed below instead.

| Statement | Instances tried | Values computed on both sides | Result; change |
|---|---|---|---|
| §0.1 lattices (5) | Σ(x/2)^n; 1/2; 0; χ=t+t²/4; f=1+x/2 | M=2 gives coefficient 1 versus M=1 coefficient 2⁻ⁿ; constants stay 1/2; zero stays 0; ordinary quadratic scale 2 gives 1, tangent gives 1/2, tangent scale 4 gives 1; f scales to (1,1) | Correct; retain |
| §0.2 germs, mean, scalar field (11) | φ=2z,f=x; binomial m=2,M=8; wrong branch; geometric-series pole; F=x²; g=2,0,1/2; p=x,x²,0,2 | g=2z,J=log2; exp(4z)²=exp(8z)=1−4φ; branch values 1≠−1; (1−φ)g=1 prevents φ=1; coefficient₂=2/2=1; means log2,0,0; scalar degrees 1,2,∞,∞ | All stated distinctions survive; retain |
| §0.3 integer overconvergence (2) | 1+x²,R=2,r=3/2; Σx^n,R=1 | On \|x\|=3/2 use C=13/4; a_n=0 for n≥3≤(13/4)(2/3)^n; geometric a_n=1 for every n | Strict radius necessary; retain |
| §0.4 Eisenstein (2) and finite coefficient field | 1/2; √(1−4u); 0; 1+u/2 with u=x^(1/2) | c=2,M=1 clears constant 1/2; coefficients 1,−2,−2,−4 integral at c=M=1; zero all 0; last scale 2 gives 1+u | Scalar, exponent n=0 and nonnegative Puiseux convention correct; retain |
| §0.5 inverse denominator scale (4) | χ=t+t²/4; p=x² or x with χ=t; inverse of p=x+x⁴/32 | Ordinary/tangent coefficients 1 versus 1/2; scale 4 gives 1; p=x² permits M=1 even with p'(0)=0; inverse coefficients −1/32,1/256 scale to −2,16 | Same-scale tangent inverse valid; retain |
| §1.1 separate variables (2) | f={1},p=x,D=2,d=1,2; incorrect family {1,p} | Coefficient matrices I₂,I₄ have determinant 1; p·1−1·p=0 in the incorrect family | ℚ(p)-independence essential; retain |
| §1.2 auxiliary function (2) | d=2,α=3; d=1,κ=1/2,m=1; cofinal d | Six monomials=binomial(4,2), box has 9; D/α→3, rows/surplus→1/2; d≥log(1+1/κ) gives (1+1/κ)^(1/d)≤e and dD/α≤e²+o(1) | Uniform C valid in the asserted cofinal range; retain |
| §1.3 integral lowest jet (2) | F=x₁−x₂,χ=t+t²/2,φ=2z+z²; F=x/2,χ=t/2 or 2t; F=2,d=0 | Lowest coefficient vectors (1,−1) and (2,−2); pullbacks t/4 versus t; original 1/2 nonintegral in second case; β=0, coefficient 2≥1 | Tangency, β and empty products handled; retain |
| §1.4 normalized multiplier (3) | h=1,g=2z; h=g=1; h=1+z,g=0 | Supremum pairs (1,2),(1,1),(2,0); A=log2,0,log2; λ=2,m=1 limit log2≤e log2 | Maximum and logarithm correct; retain |
| §1.5 multiplier rank (2) | p=x,χ=t,φ=2z; h=1 or 1−2z; λ=1 | A=log2 or log6; bounds 1≤e or e log6/log2; log1=0 excluded; h zero at 1/2 allowed | Correct; retain |
| §2.1 integrated rank (2) | p=x,χ=t,φ=Rz,R>1; m=1,0 | J=logR, denominator logR>0; 1≤e and 0≤e | Correct; repaired source locator verified |
| §2.2 algebraicity (2) | 0,1,√(1−4x) | Y,Y−1,Y²−1+4x vanish; powers of 0 or 1 dependent; square root nonrational | Correct strength; retain |
| §2.3 open-disc criterion (4) | m=2,M=8; r=3/4 or 1/4; m=3; identity coordinate/lacunary series; theta benchmark | λ=2, shrunk λ=3/2 or 1/2; cubic-root coefficients 1,−3,−9,−45 integral; identity λ=1, lacunary coefficients 0/1 and infinitely many singularities; −log(1−x) has coefficient₂=1/2; composed theta coefficients 4,4,0 | Threshold, integrality and source benchmark match; retain |
| §2.4 lexicographic logarithmic bound (3) | 3z₁²z₂; z₂^100+z₁; 1−z | Both sides log3; least vector (0,100) versus total-order vector (1,0), coefficient and mean logarithm 0; last circle-zero set {1} has mass 0 and both sides 0 | Fubini/zero-nullness hypotheses supplied; retain |
| §2.5 Jensen route (2) | φ=2z,p=x; least exponent (0,100) | log2≤e log2; multiplier 2^100, although total order of z₂^100+z₁ is 1 | No confusion of the two orders; retain |
| §3.1 circular discrepancy (6) | empty,singleton,regular d-gon,repeated point,antipodes,(1,1,−1) | D=0,1,1/d,1,1/2,2/3; raw empty formula gives 1; forgetting unequal multiplicity changes 2/3 to 1/2 | All guards and counts correct; retain |
| §3.2 weak continuity (2) | ν_n=(δ_exp(i/n)+δ_exp(−i/n))/2; regular d-gons | D_n=1−1/(πn), D₁≈0.681690, limit 1=D(δ₁); 1/d→0=Haar discrepancy | Finite mesh argument permits atomic limits; retain |
| §3.3 circle Koksma (2) | Re z at singleton 1; constant c | Mean0,error1,V4,D1 gives 1≤4; constant error c−c=0 and V=0 | Mathematical statement correct; S02 repairs build order |
| §3.4 circle Erdős–Turán (2) | d-gon,K=d−1,d≥2; singleton,K=1 | Fourier means vanish below d, so 1/d≤3/d; singleton gives 1≤9/2; cut rotation multiplies kth mean by modulus-one exp(−2πika) | Constant and Fourier sign correct; retain |
| §3.5 positive-log variation (4) | Re z; h=1−z; h=0,z,2z | V(Re)=∫2π\|sin\|=4; V(log⁺\|1−z\|)=2log2 and value at z=1 is 0; last three variations 0,0,0 | C¹ identity imported; cutoff composition need not be C¹; retain |
| §3.6 Fekete inequality/iff (3) | d=1;(1,−1),(1,1),(1,i); regular triple | Product/determinant 1/1; 2/−2 with norm2; 0/0<2; norm√2<2; regular triple product norm3√3=3^(3/2) | Equality both directions correct; S01 changes supplier |
| §3.7 Haar energy (2) | Haar; δ₁; antipodal empirical law | Energy0,+∞,+∞; antipodal off-diagonal part −log2/2; kernel lower bound −log2 | Full self-energy retained; conditional on declared energy contract |
| §3.8 discrepancy gap (3) | collisions; regular d-gons; antipodes with cutoff A=1 | Product0<exp(−cd²); regular product d^(d/2)>1 but D=1/d eventually below fixed ε; truncated energy (1−log2)/2≈0.153426 versus off-diagonal −log2/2 | A/d and eventual d₀ correct; retain |
| §3.9 damping (2) | d=2,F=x₁−x₂,φ=2z,M=1; S=0 | H=2(z₁−z₂)² with coefficients 2,−4,2; derivative exponent β=1 gives 2, not4; S=0 gives M=0 and V⁰=1 even at collisions | Correct; retain |
| §3.10 limits (2) | κ=1/2,d=2,10,100 | 3^(1/d)=1.73205,1.11612,1.01105→1; d/(d!)^(1/d)=1.41421,2.20813,2.63209→e; log2/2>0, logd/d→0 | Ordered limits preserve e; retain |
| §4.1 H membership (8) | 1;(1−x)⁻¹;exp x; f=exp(x/(1−x)),χ=L/(1+L);x²;0;exp(√2x);exp(1/(x−α)) | Pullbacks first two integral; exp coefficient₂=1/2; special pullback exp L=(1−t)⁻¹ integral but essential pole at1 excludes H; jet(0,0,2) versus Taylor(0,0,1); zero order0; p₀+√2p₁=0 forces p₀=p₁=0; monodromy1 does not remove infinite principal part | Independent arithmetic/local-basis tests; retain |
| §4.1 order-preserving coefficient descent | √2((1−x)D−1) annihilates (1−x)⁻¹; order0 for 0 | In basis(1,√2), components 0 and ((1−x)D−1); residual (1−x)/(1−x)²−1/(1−x)=0; leading degree1 preserved; 1·0=0 | Descent owns annihilators, not their local bases; retain |
| §4.2 ring closure (4) | multipliers x,1/2; f=g=(1−x)⁻¹; f=1,g=−1; f=g=x | x integral,1/2 not; sum/product residuals 0 with pole orders1,2; sum0 order0 but direct-sum cyclic vector rank1; (xD−2)x²=0, basis value0 at0 | New repair tracks full bases and order loss; retain |
| §4.3 scalar spans (5) | p=x; p=x²; p=x+x⁴/32; x⁻¹; constant p | Scalars included via1; degrees1,2,4; V contains x⁻¹ of valuation−1 with x·x⁻¹=1; constant-p extension infinite | Common Laurent carrier and scalar labels correct; retain |
| §4.4 simultaneous clearing (2) | f=(1−x)⁻¹,q=1−t or i(1−t); f=(1−2x²)⁻¹,q=1−2t² | Products1 versus i; last product1 removes both ±1/√2 | Rational integral multiplier essential; retain |
| §4.5 W rank (2) | U=ℂ,p=x,χ=t,φ=2z; λ=1 | 1≤dim W≤e implies integer dim≤2; denominator log1=0 excluded | Correct; retain |
| §4.6 fields/scalars (2) | p=x²,χ=t; rank-one algebra | x∈H, W field gives x⁻¹∈W and W=V while scalar degree2; rank-one dimension1 and Laurent1≠0 | Tower factor preserved in general; retain |
| §4.7 integral-coordinate finiteness (2) | U=ℂ,𝔻,ℂ∖{1} | Maps2z and1−exp(2z) have derivatives2,−2; disc self-map derivative≤1; latter exponential never0, so omitted value1 | Hyperbolic and parabolic cases distinguished; retain |
| §4.8 scalar obstruction (2) | inverse of x+x⁴/32; φ=2z | χ₄=−1/32,χ₇=1/256; compositions at degrees4,7:0,0; sup≤5/2, B≤3.593373<4=[ℚ(x):ℚ(p)] | Published V bound refuted, W bound consistent; retain |
| §5.1 centred capacity (2) | r=1/2,φ=4z or2z | capacity1/2; first denominator log2,numerator log2,B=e; second denominator0 | Strict positive radius product necessary; retain |
| §5.2 arbitrary compact obstruction (2) | K=closedDisc(1/2,1/4),φ=8z exp(−20z) | Re z≥1/4,norm≤3/4, normφ≤6e⁻⁵≈0.040428<1; numerator0,denominator log2,rank≥1 gives false1≤0 | Obstruction valid independently of scalar-field issue; retain |

### Computed supporting API table

API numbers refer to bullet order within the indicated section. This table covers all 40 bullets independently of the target/Check table.

| Statement | Instances tried | Values computed on both sides | Result; change |
|---|---|---|---|
| §0.1 API 1: coefficients | f=1+x/2,M=2 or1 | Scaled coefficients(1,1) versus(1,1/2); membership true versus false | retain |
| §0.1 API 2: native rescale image | f=1+x/2,M=2 | f(2x)=1+x, image of integral series with coefficients(1,1,0,…) | retain |
| §0.1 API 3: subring | f=x/2,h=1+x/2,M=2 | Scaled sum1+2x, productx+x², negative−x, unit1 | retain |
| §0.1 API 4: divisibility of scales | Σ(x/2)^n,M=2,N=4 | Scaled coefficients1 and2^n; reverse implication fails on x/4 | retain |
| §0.1 API 5: constants iff | c=2,1/2,M=1,4 | Constants remain2 and1/2; both integral tests independent of M | retain |
| §0.1 API 6: tangent iff | χ=t+t²/4,M=2,4 | Both formulations give quadratic coefficient1/2 or1 | retain |
| §0.2 API 1: Taylor and central value | F=x²+1,φ=2z | n=0 gives1; n=2 gives2/2=1; g(0)=1 | retain |
| §0.2 API 2: uniqueness | F=x versus−x,φ=2z | Composite germs2z versus−2z, difference4z≠0; identical Taylor coefficients give difference0 | retain |
| §0.2 API 3: ring operations | f=x,h=x²,φ=2z | Realizations2z,4z²; sum2z+4z²,product8z³;0 and1 remain0 and1 | retain |
| §0.2 API 4: shrink | φ=2z,r=3/4 or1 | Derivative3/2 or2; for f=x², g(rz)=9z²/4 or4z² | retain |
| §0.2 API 5: substitution | f=x²,φ=z+z² | Composite z²+2z³+z⁴ has coefficient₂1, coefficient₃2 | retain |
| §0.2 API 6: common radius | φ=2z, realizations of1 and(1−x/4)⁻¹ | Realizations1,(1−z/2)⁻¹ analytic near unit disc; common x-radius1 works inside radius4 | retain |
| §0.2 API 7: constants J | g=2,1/2,0 | J=log2,0,0=log(max(1,norm g)) | retain |
| §0.2 API 8: generated field | p=x², intermediate fields ℚ andℚ(x) | x²∉ℚ, x²∈ℚ(x); generated fieldℚ(x²)⊆ℚ(x) contains1 andx² | retain |
| §0.2 API 9: nonconstant/constant | p=x² or2 | Rational function field in x² versusℚ; extension degree2 versus infinite | retain |
| §0.2 API 10: affine scalar replacement | p=x²,a=3,b=2 | x²=((3x²+2)−2)/3; both fields equal; a=0 would giveℚ instead | retain |
| §0.2 API 11: J positivity/rotation | g=2z or1−z, rotate by unitα | First meanlog2≥0, unchanged; second integral unchanged by angular translation | retain |
| §1.4 API 1: logarithmic maximum | h=1+z,g=0 | Suprema2 and0, max2, A=log2 | retain |
| §1.4 API 2: nonnegative A | h=1 or1−2z,g=0 | sup h=1 or3, A=0 orlog3≥0 | retain |
| §1.4 API 3: exponential iff | h=1,g=2z,a=log2 or0 | A≤a true/false; simultaneous bounds(1≤2,2≤2) true, (1≤1,2≤1) false | retain |
| §3.1 API 1: arcs | singleton1, arc lengthℓ starting at0 | Mass1 for ℓ>0, error1−ℓ→1; empty/full errors0 | retain |
| §3.1 API 2: all cuts | singleton at angle1/2 | Fixed D*=1/2; cut at its own angle gives D*=1; supremum=D_circ=1 | retain |
| §3.1 API 3: bounds | d-gon and d repeated points | Lower bound attained1/d; upper bound attained1 | retain |
| §3.1 API 4: permutation | (1,1,−1) versus(−1,1,1) | Masses2/3 at1,1/3 at−1 and D=2/3 for both | retain |
| §3.1 API 5: rotation | (1,−1) versus(i,−i) | Both D=1/2; arcs translate by quarter turn | retain |
| §3.1 API 6: repetition | (1,−1) versus(1,−1,1,−1) | Atomic weights1/2,1/2 in both; D=1/2, not1/4 | retain |
| §3.1 API 7: empirical identity | (1,1,−1) | Tuple count and probability mass at1 both2/3; both discrepancies2/3 | retain |
| §3.1 API 8: Haar iff | Haar andδ₁ | Haar arc massℓ gives0; δ₁ gives1; zero arc defects determine all interval masses and hence the probability | retain |
| §4.1 API 1: membership iff | (1−x)⁻¹ versusexp x,χ=t | First integral with meromorphic basis1/(1−x); second coefficient₂1/2 fails even though differential equation holds | retain |
| §4.1 API 2: zero and one | arbitrary U,χ | Pullbacks0,1; annihilatorD; constant basis1; for zero also order0 operator1 | retain |
| §4.1 API 3: closure | f=(1−x)⁻¹,χ=t | Sum2f,negative−f,productf² have integral coefficients and pole orders1,1,2 | retain |
| §4.1 API 4: restricting U | Essential-singularity example, U=ℂ,U′=disc(0,1/2) | Integral pullback fixed; at1 essential excludes larger U, but singular set in U′ empty allows membership there | Inclusion direction correct; retain |
| §4.1 API 5: ℤ[p] action | χ=t,p=x; nonintegralχ inverse of x+x⁴/32 | x·1=x integral in first; p∘χ=t in second, though χ₄=−1/32 excludes x itself | Correct coordinate distinction; retain |
| §4.1 API 6: rational D-finiteness | √2((1−x)D−1) on f=(1−x)⁻¹ | Algebraic-basis components0 and ((1−x)D−1), each residual0 | Descent supplied here; retain |
| §4.3 API 1: W finite combinations | H contains1,p,χ=t,p=x² | (1/p)·1=x⁻²∈W; finite presentation has one term | retain |
| §4.3 API 2: V finite combinations | H contains1 | (1/x)·1=x⁻¹∈V; valuation−1 | retain |
| §4.3 API 3: subalgebras/scalars | h=k=1, scalarsa,b | Product(a·1)(b·1)=ab·1; unit1≠0; scalar fields embedded | retain |
| §4.3 API 4: extension of scalars | p=x², basis1,x forℚ(x)/ℚ(p) | Any rational coefficient=a(p)+xb(p); V=W+xW=ℚ(x)W | retain |
| §4.3 API 5: integralχ after finiteness | p=x²,χ=t,U=ℂ,φ=2z | x∈H, x·x⁻¹=1 inside W field; W=V although degree2 | retain |
| §4.3 API 6: source V at identity | χ=t,f=(1−x)⁻¹ | Pullback unchanged, source and roadmap generator criterion identical; spans both overℚ(x) | retain |

### Conventions, proof inputs and ownership

| Additional convention or input | Computed witness | Conclusion |
|---|---|---|
| Characteristic-zero factorials | 2!=2≠0; x² Taylor coefficient2/2=1 | No positive-characteristic factorial or inseparability claim |
| General holomorphic germ carrier | F and F̃ agreeing on a neighbourhood of0 have identical Taylor coefficients; changing F outside that neighbourhood does not change the germ | Uniformizes does not claim global evaluation of a formal series |
| Nonempty empirical measure | d=2 weights1/2+1/2=1; empty sum0≠1 | Native Nonempty instance is necessary and sampling targets require it |
| Polydisc normalization | G=z₁z₂ coefficient(1,1)=1; unnormalized contour value(2πi)²=−4π² | Haar formula divides by the correct factor |
| C¹ variation conversion | ∫₀¹2πabs(sin(2πt))dt=4; endpoint set{0,1} has volume0 | Complete targetℝ and finite integral justify conversion from ENNReal |
| Hadamard supplier | Orthogonal columns(2,0),(0,3):6=6; shear columns(1,0),(1,1):1<√2; empty1=1 | Same hypotheses exist at SuccessiveMinima, not the cited Geometry sections: S01 |
| Local-basis closure repair | Constant rank2 frame e₁,e₂; line e₁−e₂ has derivative0 and dimension1, quotient dimension1; tensor ranks1·1=1,0·1=0 | Local meromorphic triviality passes through the actual cyclic subquotients; selected-solution evaluation need not be invertible |
| Capacity/energy scaling | radius2: I_min=−log2, exp(−I_min)=2; radius0: I=+∞,capacity0; finite two-point set has every probability energy+∞ | Positive-capacity uniqueness is correctly separated from existence |
| Conformal radius direction | Domain disc radius2 has cover derivative2, inverse Riemann-map derivative1/2 | No reciprocal or parabolic-domain substitution |
| Quotient phase | g=i has J=0, modulus reconstruction1, required phasei | Supplier's phase correction is needed, norm bound unchanged |
| Uniform height limit | For d≥log(1+1/κ), (1+1/κ)^(1/d)≤e and d/(d!)^(1/d)≤e | C independent of d,κ only in the stated cofinal range |
| No graph cycle among the three rank proofs | Each starts from Layer1; multiplying by h orV occurs after common integral-jet construction | None consumes its own final rank estimate; S02 is the identified local forward edge |

Cross-roadmap contracts were resolved against current permitted versions, not earlier review assertions. The **23 distinct cited section contracts** are Part I §§0.2–0.3,2.8,5.1–5.3 (6); ConformalMappingPartII §§0.1–0.6,1.3–1.4,3.5–3.7 (11); ProbabilisticAndMetricNumberTheory §2.7 (1); ClassicalArithmeticCompletion §§6.18–6.19,6.40 (3); and the two claimed Geometry §0.1 subtargets (2). The first 21 resolve with the stated scope; the last two are S01. SuccessiveMinima §§0.1.1–0.1.2 were additionally checked as the repair. No supplier-declaration name was assumed from a previous round.

- Part I §5.1 is now at TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:2972. Its derivative-span equivalence, closure and disc IVP statements match the narrowed contract. It does not provide the full-meromorphic-basis closure argument; packages/DiophantineApproximationAndTranscendencePartII/README.md:687 now owns that argument.
- TauCetiRoadmap/ConformalMappingPartII/README.md:145–222 supplies equation germs, ordinary jets, continuation, full meromorphic bases and rational clearing. Its §§1.3–1.4 distinguish hyperbolic radius and extremality. Its §§3.5–3.7 supply the complex phase, neighbourhood multiplier and logarithmic bound, including g=0 separately.
- TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md:3090, :3132 and :3142 supply strict-cut star discrepancy, constant-3 Erdős–Turán and pointwise BV Koksma. No change of jump values is imported.
- TauCetiRoadmap/ClassicalArithmeticCompletion/README.md on main:12458, :12492 and :13054 supplies Fekete/Chebyshev objects, affine scaling and disc/segment values. It does not construct logarithmic energy or minimize it; the added contract is still needed. Its open revision is not substituted for main.
- TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md at its open head imports SuccessiveMinima's Hadamard results at :104–106 and starts its own Layer0 at §0.2. The automated citation resolver misses this moved-section problem.

Object searches used the roadmap service on main/open heads, direct searches of main and Completed, board packages, all **55 supplied sibling folders**, and the pinned libraries. Searches covered arithmetic algebraization/holonomic spans, Eisenstein denominators, full meromorphic bases, logarithmic energy/equilibrium, Fekete extrema, circular discrepancy and the six acceptance names. ArithmeticDynamics §2.5 concerns mass-zero continuous-potential measures and diagonal-excluded atomic pairings; TropicalAndBerkovichArithmetic §6.5 concerns Hsia energy over nonarchimedean fields. Neither supplies general compact-plane probability minimization with infinite self-diagonal. The indexed RandomMatrices energy hit concerns a weighted real-line problem; no unsupplied file was treated as a supplier. The circle adapters and arithmetic rank/holonomic compatibility remain this roadmap's work; the generic Hadamard owner is S01. No competing fully qualified acceptance declaration was found.

The pinned declarations were read in their files, including relevant instance context: Mathlib/RingTheory/PowerSeries/Basic.lean:76,583; Mathlib/RingTheory/PowerSeries/Substitution.lean:39,157,170,456,510,542; Mathlib/RingTheory/LaurentSeries.lean:391; Mathlib/FieldTheory/RatFunc/Basic.lean:756 and Mathlib/FieldTheory/RatFunc/IntermediateField.lean:162; Mathlib/RingTheory/Algebraic/Integral.lean:146; Mathlib/NumberTheory/SiegelsLemma.lean:155; Mathlib/LinearAlgebra/FiniteDimensional/Basic.lean:521; Mathlib/Analysis/SpecialFunctions/Stirling.lean:246; Mathlib/Analysis/Complex/Liouville.lean:42; Mathlib/Analysis/Complex/JensenFormula.lean:375; Mathlib/MeasureTheory/Integral/CircleAverage.lean:55; Mathlib/LinearAlgebra/Vandermonde.lean:219; Mathlib/Analysis/InnerProductSpace/GramSchmidtOrtho.lean:374; Mathlib/Topology/EMetricSpace/BoundedVariation.lean:60,1256; Mathlib/MeasureTheory/Measure/Prokhorov.lean:183; Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean:365; Mathlib/MeasureTheory/Measure/FiniteMeasureProd.lean:144; Mathlib/MeasureTheory/Measure/Portmanteau.lean:353. Tau Ceti: TauCeti/Probability/Process/EmpiricalMeasure.lean:54,100; TauCeti/Analysis/Complex/CauchyIntegralPolydisc.lean:116; TauCeti/Analysis/Calculus/MetricVariation.lean:276, with CompleteSpace introduced at :122. Mathlib pin is 6b7abb3c7686292736be2955bd3eb9ebf63b456a; Tau Ceti pin is a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Native substitution asks for nilpotent constant coefficient, which is zero over these fields; native circle averages are totalized on nonintegrable data; eVariationOn itself carries neither continuity nor finiteness. The applications supply the missing conditions explicitly.

The complex-logarithmic-equilibrium gap has the same identifier, named supplier and needs sentence in packages/DiophantineApproximationAndTranscendencePartII/design/plan.json and packages/DiophantineApproximationAndTranscendencePartII/README.md:69. It is a coherent energy/equilibrium interface with nonempty compactness, a genuine extended kernel, positive-capacity uniqueness and precise affine compatibility. Its missing objects are not silently claimed as supplied. The existing G1 ownership problem and frozen-plan-node issue remain settled under packages/DiophantineApproximationAndTranscendencePartII/reports/FIX-PKG-DiophantineApproximationAndTranscendencePartII~2.md, F01 and F10: package repair cannot make the recorded scope decision or edit frozen nodes. The present roadmap asserts no false general compact theorem; Layers0–5 are independent of G1. Those findings are not re-raised.

The read-only dependency gate at this head returned:

```text
depcheck: 56 roadmaps, 644 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. This roadmap-level check does not validate individual section ownership or local forward references, so it does not detect S01/S02. The citation resolver also reported no missing roadmap or Lean name, while explicitly disclaiming external pinned-name verification; the latter was done directly above. The commit diff changes only the package folder. Suggested.lean has one import Mathlib, no lemma, set_option, admitted example or sorry-valued definition. All six local names occur in the README; every numbered target has a locator; no computational algorithm is planned.

## Not verifiable

- No Lean build or scratch elaboration was run during this read-only pass. Signature checking used the six elaborated types supplied for this head; truth was assessed separately by source and mathematical calculations.
- The declared energy/equilibrium contract has not been implemented by the supplier and is accepted only as a declared prerequisite. G1 has no replacement theorem or assigned supplier; its prior scope-decision settlement remains in force.
- Ownership outside main, the board packages, the 55 supplied sibling folders and the roadmap-service search results was not checked. An indexed match alone was not assumed to discharge a contract.
- Source locators were verified against the legal cached author offprint of CDT25 and the specified arXiv versions of BB11/Saff10. No comparison to a separately downloaded publisher PDF, or search for later published errata, was performed. The unused quantitative constants of BB11 Theorem6.1 were not re-proved.

## Source issues

- **Misprint** in BB11 at §1, p.1 (BB11 line 40): the source says the tail uses powers z^(N−k); it should use z^(k−N), so the tail remains a power series; affects the proof.
- **Error** in CDT25 at §1.1.1, p.630 (CDT25 line 176): the source says the binomial example works for every integer m; it should exclude m=0, where both reciprocal exponents and the displayed uniformization are undefined; affects a stated result.
- **Gap** in CDT25 at Lemma 2.1.2(2), pp.637–638 (CDT25 line 560 and line 600): the source says its fixed height constant follows from M/ρ alone; it should also control the p-power coefficient growth, uniformly after restricting d to a cofinal range depending on κ; affects the proof.
- **Error** in CDT25 at Corollary 2.0.5, (2.0.7), p.636 (CDT25 line 498): the source says the ℚ(x)-span V obeys the stated ℚ(p)-rank bound for arbitrary χ; it should bound W, or include the scalar-extension factor for V; the degree-four example separates them; affects a stated result.
- **Error** in CDT25 at the proof of Lemma 2.3.1, p.640 (CDT25 line 752): the source says the Blaschke quotient is a unit near the closed disc; it should retain boundary zeros: g=z−1 gives B=−1 and G=1−z, vanishing at1; affects the proof.
- **Error** in CDT25 at (2.3.2), pp.640–641 (CDT25 line 771): the source says real-logarithmic boundary data reconstruct the complex function G; it should include phase G(0)/abs(G(0)); for G=i the displayed expression is1; affects the proof.
- **Misprint** in CDT25 at the proof of Lemma 2.3.1, p.641 (CDT25 line 820): the source says sup abs(h) is bounded by the positive-logarithmic mean; it should bound sup log abs(h); h=g=1 gives norm1 but mean0; affects the proof.
- **Misprint** in CDT25 at (2.5.2), p.644 (CDT25 line 1048): the source says the reversed pair-difference product equals the displayed Vandermonde determinant; it should include sign (−1)^(d(d−1)/2), or reverse each pair difference; affects nothing.
- **Gap** in CDT25 at the proof of Lemma 2.5.9, p.645 (CDT25 line 1158): the source says take c equal to the positive liminf; it should choose a strictly smaller positive constant to obtain the eventual strict exponential inequality; affects the proof.
- **Error** in CDT25 at the proof of Lemma 2.5.9, p.646 (CDT25 line 1190): the source says every compact plane set has a unique minimizing probability; it should require nonemptiness for existence and positive capacity for uniqueness; on a two-point set all probabilities have infinite energy; affects a stated result.
- **Error** in CDT25 at §2.5.27, (2.5.28), p.649 (CDT25 line 1377): the source says arbitrary compact sampling sets satisfy the capacity-adjusted rank bound; it should impose sufficient base-point-sensitive geometry; the translated quarter-disc has numerator0, denominator log2 and rank at least1; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "95bc923fa619072f15986c6e42e3efa2f72cae56", "job": "RT-DiophantineApproximationAndTranscendencePartII~2a", "model": "gpt-6-astra", "worker": "chris-30"} -->
