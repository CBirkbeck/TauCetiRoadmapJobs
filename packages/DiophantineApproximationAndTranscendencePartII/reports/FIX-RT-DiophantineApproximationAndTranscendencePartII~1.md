# Repair report

The first F01 below belongs to pass a; the second F01, F02 and F03 belong to pass b. These are four different findings. The reviews' overlapping source observations are settled together in the source table below. Verdicts and computations here are this repair's audit, not independent acceptance.

## F01 (P3) — applied

Pass a: a new FTC proof of C¹ variation → the pinned TauCeti.eVariationOn_eq_lintegral_enorm_derivWithin, MetricVariation.lean:276. Updated Scope and ownership, From Tau Ceti, §3.5, the C¹ specialization dependency in §3.3, and Layer 3 Dependencies. Retained positive-log bounded variation by Lipschitz composition; the imported identity applies to C¹ g, without assuming its positive logarithm is C¹.

## F01 (P3) — applied

Pass b: supplier “obligation” and “maintainer scope decision” prose → the mathematical G1 problem of specifying base-point-sensitive sampling geometry and proving its rank theorem. Preserved G1, its lack of a supplied rank theorem, the energy/equilibrium contract, and independence of Layers 0–5. Avoided asserting that no corrected theorem exists anywhere in the literature.

## F02 (P3) — applied

Pass b: attributed module construction → Part I §5.1 supplies finite derivative spans; §4.2 owns the closure argument tracking full meromorphic bases through sums, tensors and cyclic subquotients. Scalar relations come from derivative dependence, requiring no separate generic cyclic-vector theorem. Updated Scope and ownership and Layer 4 Dependencies; expanded §4.2 Checks for pole orders, cancellation and vanishing basis values.

## F03 (P3) — applied

Pass b: §2.1's Lemma 2.3.1 locator pp.640–641, CDT25 line 440 → pp.639–641, CDT25 line 711. Kept Theorem 2.0.1 separately at CDT25 line 440. Added the lemma's locator to the existing CDT25 manifest entry. Searched all occurrences: the supplier's proof-only pp.640–641 references are accurate; no other incorrect occurrence remained in this package's README or Lean file.

## Verification and mathematical ownership

Read the two reviews, the entire README and all six Lean declarations. Used the main-branch DiophantineApproximationAndTranscendence and ClassicalArithmeticCompletion roadmaps as shape and supplier references. Read the certified cached CDT25, BB11 and Saff10 passages used by the arguments; no new work or second manifest key was needed, and no reference request was generated.

The variation theorem's context explicitly includes a real normed space and CompleteSpace before line 276. Its argument is ContDiffOn ℝ 1 on Icc a b. For ℝ and [0,1], the interior within derivative is the ordinary derivative; the two endpoints have volume zero. Continuity of the derivative on the compact interval gives finite integral. Thus converting the nonnegative integral and variation to real numbers is legitimate. For positive-log variation, the scalar map r↦log(max(1,r)) on nonnegative reals has slopes 0 or at most 1; combine it with the norm and native Lipschitz composition. This does not apply the C¹ identity directly to a function with a cutoff kink.

Part I §5.1 states D-finiteness, finite derivative spans, closure and scalar initial-value theorems, without the claimed module/solution-space construction. The specialized closure target remains §4.2, supported by CDT25 line 473 and the full-basis convention at CDT25 line 479. A finite derivative span is a differential module over ℚ̄(x). A relation on the cyclic vector in a direct sum annihilates the sum; a relation in the tensor annihilates the product under multiplication. These maps may lower order. Locally a meromorphic horizontal frame trivializes the modules. A differential subspace of a trivial module is constant: in a chart given by an invertible minor, differentiating its normalized graph matrix gives zero. Its quotient is constant too. Hence the resulting cyclic equations retain full meromorphic bases, including at singularities introduced by their presentations. This is the additional local-basis argument, rather than an assertion about the parent closure API.

Object searches used the roadmap service on main and open heads, and rg on board packages and pinned libraries, for differential modules, cyclic subquotients, horizontal meromorphic bases, holonomic arithmetic and C¹ variation. Relevant owners were Part I §5.1, ConformalMappingPartII §§0.1–0.6, and the pinned calculus theorem. The p-adic cyclic-vector theory and periodic square-zero differential modules are different objects. No competing owner of closure for this arithmetic full-meromorphic-basis ring was found. No generic differential-module carrier or general cyclic-vector theorem is newly planned here. No Lean declaration was added, renamed or placed in another roadmap's namespace.

Cross-roadmap citations were resolved against the permitted copies: Part I on main, §§0.2–0.3,2.8,5.1–5.3; ClassicalArithmeticCompletion on main, §§6.18–6.19,6.40; ConformalMappingPartII at its supplied head, §§0.1–0.6,1.3–1.4,3.5–3.8; ProbabilisticAndMetricNumberTheory at its supplied head, §2.7; GeometryOfNumbersAndQuadraticArithmetic §0.1.1–0.1.2 through the roadmap service. Ownership searches included main, board packages and the indexed open heads, including the supplied sibling heads; no claim is made about unindexed open work. Read the relevant returned passages before using them.

The Mathlib contracts were inspected at the pin: PowerSeries Basic:76,583 and Substitution:39,157,170,456,510,542; LaurentSeries:391; RatFunc Basic:756 and IntermediateField:162; Algebraic/Integral:146; SiegelsLemma:155; FiniteDimensional/Basic:521; Stirling:246; Liouville:42; JensenFormula:375; CircleAverage:55; Vandermonde:219; GramSchmidtOrtho:374; BoundedVariation:60,1256; Prokhorov:183; ProbabilityMeasure:365; FiniteMeasureProd:144; Portmanteau:353. Tau Ceti contracts were inspected at EmpiricalMeasure:54,100, CauchyIntegralPolydisc:116 and MetricVariation:276, including their enclosing instance contexts. Native substitution requires nilpotent constant coefficient, which is zero over our fields; native circle averaging is a totalized integral, so analyticity provides the needed integrability; native variation imposes neither continuity nor finiteness by definition. The applications supply those conditions.

## Computed adversarial pass

Each row records mathematical values, not a proof supplied by an admitted Lean declaration. All arithmetic carriers are characteristic zero; arbitrary DVRs, residue fields, groups, inseparable extensions and nonreduced schemes are not quantified over. Empty samples, rank zero, zero series, constant rational functions, ramification, zeros, poles, totalized powers and zero denominators are tested where relevant. API indices mean bullet order in the named subsection. “Retain” means the calculation is consistent with the statement, not independent certification.

| Statement | Instances tried | Values computed on the two sides | Result; change |
|---|---|---|---|
| IntegralSeries (§0.1 Lean definition) | 0, 1, 1+x/2 | Coefficients 0; (1,0,…); (1,1/2,0,…); integer witnesses for the first two, none for 1/2 | True, true, false; retain |
| Uniformizes (§0.2 Lean definition) | f=x², φ=2z; realizations 4z² and 2z²; constant 1 with branch −1 | F''(0)/2!=2/2=1; composite 4z² differs from 2z²; branch values 1≠−1 | Correct germ and factorial; retain |
| positiveLogMean (§0.2 Lean definition) | g=2z, 0, 1/2 | J=log 2, 0, 0; unnormalized first integral 2π log 2; raw last logarithm −log 2 | Probability and cutoff distinguished; retain |
| rationalFunctionField (§0.2 Lean definition) | p=x, x², 0, 2 | Fields ℚ(x), ℚ(x²), ℚ, ℚ; degrees 1,2,∞,∞; native finrank 1,2,0,0 | Nonconstancy needed for finite degree; retain |
| mean_rank_bound (§2.1 Lean theorem) | p=x, χ=t, φ=2z, family empty or {1}; p=x² with {1,x}, φ=2z | J=log 2 gives 0≤e and 1≤e; J(4z²)=log 4 gives 2≤2e | Independence and scalar field match; retain |
| arithmetic_algebraicity (§2.2 Lean theorem) | f=0,1,√(1−4x), last with φ=(1−exp(8z))/4 | Annihilators Y,Y−1,Y²−1+4x evaluate to 0; λ=2 and realization exp(4z) | Algebraic includes nonrational; retain |
| §0.1 ordinary and tangent lattices | Σ(x/2)^n, 1/2, 0; χ=t+t²/4 | Scale 2 gives 1 in every coefficient of the geometric series; constant remains 1/2; zero stays 0; tangent coefficients at M=2,4 are 1/2,1 | Scaling and n=0 correct; retain |
| §0.2 analytic germ, shrinking and mean | φ=2z, f=x; radius factor 3/4; m=2,M=8 binomial | Composite 2z; derivative 2·3/4=3/2; 1−4φ=exp(8z)=(exp(4z))² | Relations agree; retain |
| §0.3 integer overconvergence | f=1+x², r=3/2<R=2; geometric series at R=1 | Coefficients n≥3 are 0≤(13/4)(2/3)^n; geometric coefficients stay 1 | Strict radius needed; retain |
| §0.4 Eisenstein and Puiseux | 1/2; √(1−4u); 0; y(u)=1+u/2 with u=x^(1/2) | c=2,M=1 clears 1/2; square-root coefficients 1,−2,−2,−4 integral at c=M=1; zero all 0; y(2u)=1+u | Constant and nonnegative Puiseux cases correct; retain |
| §0.5 inverse scales | χ=t+t²/4; p=x² or x, χ=t; inverse of x+x⁴/32 | Ordinary M=2 coefficient 1 vs tangent 1/2; p=x² permits M=1 though p'(0)=0; inverse tangent M=4 coefficients −2,16 | Same-scale inverse and ramification allowed; retain |
| §1.1 separate-variable independence | f=1,p=x,D=2,d=1 or 2; wrong family 1,p | Matrices I₂,I₄ have determinant 1; wrong family gives p·1−1·p=0 | ℚ(p)-independence required; retain |
| §1.2 auxiliary constraints and uniform range | d=2,α=3; d=1,κ=1/2,m=1; d≥log(1+1/κ) | binomial(4,2)=6 vs box 9; D/α→3 gives rows/surplus→1/2; (1+1/κ)^(1/d)≤e and d/(d!)^(1/d)≤e give dD/α≤e²+o(1) | Uniform constant only on cofinal range; retain |
| §1.3 lowest homogeneous jet | F=x₁−x₂, χ=t+t²/2, φ=2z+z²; F=x/2, χ=2t | Leading vectors (1,−1)→(2,−2); second pullback t integral but original coefficient 1/2 | Tangency is essential; first test concerns the leading jet only; retain |
| §1.4 multiplier and Cauchy estimate | h=1,g=2z; h=g=1; h=1+z,g=0 | Supremum pairs (1,2),(1,1),(2,0) give A=log 2,0,log 2; limiting m=1 bound log 2≤e log 2 | Logarithm, h factor and maximum fixed; retain |
| §1.5 multiplier rank | h=1 or 1−2z,g=2z | A=log 2 or log 6 from suprema (3,6); bounds 1≤e or 1≤e log 6/log 2; at λ=1 denominator 0 | Interior zeros of h allowed; retain |
| §2.1 integrated rank | φ=Rz,p=x,χ=t,R>1; m=0 | J=log R, B=e; 1≤e and 0≤e | Same bound for empty family; locator repaired |
| §2.2 algebraicity | √(1−4x),0,1 | Nonzero quadratic or linear polynomials give 0; 1−4x has a simple zero and cannot be a rational square | No rationality overclaim; retain |
| §2.3 open-disc criterion and benchmarks | m=2,M=8; r=3/4 or 1/4; m=3; theta benchmark | λ=2, shrunk moduli 3/2,1/2; cube-root coefficients 1,−3,−9,−45; theta-composite coefficients 4,4,0 from 4,36,400 and 1,−8,44 | Strict threshold and branch scaling agree; retain |
| §2.3 equality negative control | Σ x^(2^k), φ=z; −log(1−x) | Lacunary coefficients 0 or 1, derivative 1, infinitely many dyadic singularities; logarithm coefficient at n=2 is 1/2 | Integral boundary example fails strict premise; logarithm not integral; retain |
| §2.4 lexicographic Jensen | 3z₁²z₂; z₂^100+z₁; 1−z | log coefficient and torus mean are log 3,0,0; lex exponent (0,100) vs least total degree 1; circle zero {1} has mass 0 | Both order notions and integrable zero preserved; retain |
| §2.5 logarithmic rank route | φ=2z; least exponent (0,100) | log 2≤e log 2; coefficient multiplier 2^100, not 2 | Same factor e; retain |
| §3.1 circular discrepancy | Empty, singleton, d-gon, repeated point, antipodes, (1,1,−1) | D=0,1,1/d,1,1/2,2/3; deleting multiplicity changes last value to 1/2; raw empty supremum 1 | Guard and multiplicity essential; retain |
| §3.2 weak continuity | Equal atoms at exp(±i/n); regular d-gons | D=1−1/(πn) tends to 1, with n=1 giving 0.681690…; polygon D=1/d→0 | Atomic limit is permitted; retain |
| §3.3 circle Koksma | Re z sampled at 1; constant c | Mean 0, error 1, V=4,D=1 gives 1≤4; constant error c−c=0=V | C¹ variation dependency now explicit |
| §3.4 circle Erdős–Turán | d-gon, K=d−1; singleton K=1 | Fourier means through d−1 vanish, giving 1/d≤3/d; singleton gives 1≤9/2 | Constant 3 survives rotation; retain |
| §3.5 positive-log variation and C¹ identity | Re z; h=0,z,2z,1−z | ∫₀¹2π abs(sin(2πt))dt=4=V; constant positive logs 0,0,log 2 have derivative integral and V both 0; log⁺ at h(1)=0 equals 0 | Import identity, keep bounded-variation consequence |
| §3.6 Fekete equality | d=1; (1,−1),(1,1),(1,i) | Product and determinant 1; 2 and −2 with norms 2; collision 0; nonextremal norm √2<2 | Equality iff regular polygon in both directions; retain |
| §3.7 circle energy | Haar, δ₁, antipodal empirical probability | Energies 0,+∞,+∞; antipodal off-diagonal contribution −log 2/2; kernel lower bound −log 2 | Finite products do not give finite self-energy; retain |
| §3.8 discrepancy gap and truncation | Collision; regular d-gon; antipodes, cutoff A=1 | 0<exp(−cd²); regular product d^(d/2)>1 but D=1/d<ε eventually; truncated antipodal energy (1−log 2)/2=0.153426… | A/d diagonal and d₀ retained |
| §3.9 damping | d=2,F=x₁−x₂,φ=2z,M=1; S=0 | H=2(z₁−z₂)² has coefficients 2,−4,2; derivative factor 2^1=2 vs wrong 2²=4; S=0 gives M=0,V⁰=1 | Correct exponent; no division by zero; retain |
| §3.10 damping limits | κ=1/2; d=2,10,100 | 3^(1/d)=1.73205…,1.11612…,1.01105…→1; d/(d!)^(1/d)=1.41421…,2.20813…,2.63209…→e; log 2/2=0.34657…→0 along log d/d | α,d,κ,ε limit order retained |
| §4.1 H membership and full bases | 1; (1−x)⁻¹; exp x; exp(x/(1−x)),χ=L/(1+L) | First two integral, basis 1 or (1−x)⁻¹; exp coefficient₂=1/2; special pullback exp L=(1−t)⁻¹ integral but singularity at 1 essential | Arithmetic and full-basis tests independent; retain |
| §4.1 order-preserving descent | √2((1−x)D−1) on (1−x)⁻¹; exp(√2x); zero | Basis (1,√2) components 0 and ((1−x)D−1), residual 0; p₀+√2p₁=0 forces p₀=p₁=0; zero annihilator 1 has order 0 | Rational coefficients essential; no claim that descended equation preserves full bases |
| §4.1 jets and monodromy | x²; exp(1/(x−α)) | Jet (0,0,2), Taylor data (0,0,1); essential exponential monodromy 1 but infinite principal part | Neither evaluation nor monodromy replaces meromorphic bases; retain |
| §4.2 closure and rational multiplier | χ=t, multipliers x,1/2; f=g=(1−x)⁻¹ | x integral, constant 1/2 not; sum/product residuals (1−x)·2/(1−x)²−2/(1−x)=0 and (1−x)·2/(1−x)³−2/(1−x)²=0; pole orders 1,2 | Construction attribution repaired; expanded Check |
| §4.2 cancellation and cyclic relation | f=1,g=−1; f=g=0 | Sum 0 has order-zero operator 1 and solution dimension 0; cyclic vector (1,−1) has D relation and rank 1; zero cyclic vector has rank 0 | No order-preservation assertion for sums; new Check |
| §4.2 tensor and singular basis | χ=t,f=g=x | xD(x²)−2x²=2x²−2x²=0; basis value at 0 is 0, at 1 is 1; full local solution dimension 1 | Basis can vanish at singular point; new Check |
| §4.2 local subquotient argument | Constant frame of rank 2; diagonal line and quotient | Horizontal basis (1,0),(0,1); line (1,−1) derivative 0, rank 1; quotient rank 1, derivative 0; tensor ranks 1·1=1 and 0·1=0 | Full bases pass to subquotients; target owned here |
| §4.3 scalar spans | p=x; p=x²; degree-four p; x⁻¹ | Scalar degrees 1,2,4; 1∈H gives nonzero ranks; x⁻¹ valuation −1 and x·x⁻¹=1 | Laurent carrier and scalar labels essential; retain |
| §4.4 simultaneous clearing | f=(1−x)⁻¹,q=1−t; q=i(1−t); f=(1−2x²)⁻¹ | Products 1,i,1; second not rational; last clears both ±1/√2 | Rational integral clearing and harmless conjugate zeros; retain |
| §4.5 W rank | U=ℂ,p=x,χ=t,φ=2z; λ=1 | J=log 2,B=e, hence 1≤dim W≤2 as integer; log 1=0 | Full hypotheses and strictness retained |
| §4.6 field and scalar comparison | p=x²,χ=t; rank-one algebra | x∈H and W field imply x⁻¹∈W, so W=V while scalar degree is 2; rank-one field dimension 1; Laurent 1≠0 | Degree factor retained for general χ |
| §4.7 qualitative finiteness | U=ℂ,𝔻,ℂ∖{1} | Maps 2z and 1−exp(2z) have derivative 2 and −2; based disc self-map derivative ≤1; exponential never 0 so latter never 1 | Parabolic domains handled by map criterion; retain |
| §4.8 degree-four obstruction | p=x+x⁴/32,χ inverse,φ=2z | χ₄=−1/32,χ₇=1/256; composition coefficients −1/32+1/32=0,1/256−4/1024=0; B≤3.593373…<4 | Printed V bound refuted, W bound unaffected; retain |
| §5.1 centred capacity | r=1/2,φ=4z or 2z | cap=1/2; first numerator log 2, denominator log 4+log(1/2)=log 2, B=e; second denominator 0 | Strict radius product necessary; retain |
| §5.2 arbitrary-compact obstruction and G1 | K=closedDisc(1/2,1/4),φ=8z exp(−20z) | Re z≥1/4,abs(z)≤3/4,abs(φ)≤6exp(−5)=0.04042768…<1; numerator 0, denominator log 2, rank≥1 gives false 1≤0 | Formula remains refuted; G1 phrasing made mathematical |

The supporting APIs and conventions have the following separate computations.

| Statement | Instances tried | Values computed on the two sides | Result; change |
|---|---|---|---|
| §0.1 API 1, coefficient membership | f=1+x/2,M=2 or 1 | Scaled coefficients (1,1) or (1,1/2) | Equivalence distinguishes membership; retain |
| §0.1 API 2, rescale image | f=1+x/2,M=2 | f(2x)=1+x, integral-series image (1,1,0,…) | Equal descriptions; retain |
| §0.1 API 3, subring | f=x/2,h=1+x/2,M=2 | Rescaled sum 1+2x, product x+x², negative −x; at M=1 integral series unchanged | Ring laws compatible; retain |
| §0.1 API 4, divisible scales | f=Σ(x/2)^n,M=2,N=4 | Scaled coefficients 1 and 2^n | Inclusion in stated direction; retain |
| §0.1 API 5, constants | c=2 or 1/2,M=1 or 4 | Constant remains 2 or 1/2 in all four cases | Both directions of iff; retain |
| §0.1 API 6, tangent equivalence | χ=t+t²/4,M=2,4 | χ(Mt)/M=t+t²/2 or t+t² | Equivalent to coefficient condition; retain |
| §0.2 API 1, central relation | F=x² or constant 1 | F''/2!=1; F(0)=1=g(0) | n=0 included; retain |
| §0.2 API 2, germ uniqueness | F=x vs −x,φ=2z | Composites 2z vs −2z, unequal on every neighbourhood | Wrong germ excluded; retain |
| §0.2 API 3, ring operations | f=x,h=x²,φ=2z | Sum 2z+4z²; product 8z³=(2z)(4z²); constants 0,1 preserved | Retain |
| §0.2 API 4, shrinking | φ=2z,r=3/4; r=0 boundary | Derivative 3/2; r=0 gives 0 and lies outside 0<r | Radius guard retained |
| §0.2 API 5, Taylor substitution | f=x²,φ=2z+z² | Composite 4z²+4z³+z⁴ equals formal substitution; constant 0 permits it | Retain |
| §0.2 API 6, common convergence radius | family 1,(1−x)⁻¹,φ=z/2 | Both converge on abs(x)<1; inverse chart x↦2x exists on any smaller disc | Finite family has positive common radius; retain |
| §0.2 API 7, constant means | c=0,1/2,2 | J=0,0,log 2 | Retain |
| §0.2 API 8, generated field | p=x² | Constants 1 and p present; p·p⁻¹=1, while linear span of p alone misses 1 | Field generation rather than vector span; retain |
| §0.2 API 9, constant case | p=x,0 | Generated ℚ(x),ℚ; degrees 1,∞ | Retain |
| §0.2 API 10, affine generator | p=x²,a=2,b=3 | x²=((2x²+3)−3)/2 and 2x²+3 in ℚ(x²); a=0 leaves ℚ | Nonzero a necessary; retain |
| §0.2 API 11, finite rotation-invariant J | g=2z, rotate by i | Norms both 2, means both log 2≥0 | Retain |
| §1.4 API 1, logarithmic maximum | h=1+z,g=0 | Norm suprema 2,0 give log 2 | Second function is hg; retain |
| §1.4 API 2, nonnegativity | h=g=1 | Supremum 1, log 1=0 | Retain |
| §1.4 API 3, exponential comparison | h=1,g=2z,a=log 2 or 0 | Norm bounds 1≤2 and 2≤2 true; at a=0,2≤1 false | Both directions of equivalence agree; retain |
| §3.1 API 1, half-open arcs | singleton at 1, arc length ℓ approaching 0 containing 1 | Empirical mass 1, Haar mass ℓ, defect 1−ℓ→1 | Supremum rather than maximum; retain |
| §3.1 API 2, rotated star identity | singleton at −1 | Fixed-cut star discrepancy 1/2; rotating to argument 0 gives 1=circular discrepancy | Retain |
| §3.1 API 3, bounds | d-gon vs d repeated points | 1/d and 1; both satisfy 1/d≤D≤1 | Retain |
| §3.1 API 4, permutation | (1,1,−1) vs (−1,1,1) | Mass at 1 is 2/3 in both, D=2/3 | Retain |
| §3.1 API 5, rotation | antipodes multiplied by i | Fourier first means both 0; discrepancy both 1/2 | Retain |
| §3.1 API 6, repetition | (1,−1) repeated twice | Weights 1/2 vs 2/4, D=1/2 in both | Retain |
| §3.1 API 7, empirical comparison | (1,1,−1) | Measure masses 2/3,1/3 give D=2/3=tuple value | Retain |
| §3.1 API 8, Haar characterization | Haar vs δ₁ | Arc masses ℓ vs up to 1 on arbitrarily short arcs; D=0 vs 1 | Wrong measure excluded; retain |
| §4.1 API 1, membership | (1−x)⁻¹ vs exp x,χ=t | Integer coefficients all 1 vs coefficient₂=1/2; both have order-one equations | Integral condition active; retain |
| §4.1 API 2, zero and one | Any U,χ | Pullbacks 0,1; equations 1·0=0 and D1=0 | Retain |
| §4.1 API 3, ring operations | f=(1−x)⁻¹ | −f coefficients −1; f+f coefficients 2; f² coefficients n+1 | Full-basis closure owned in §4.2 |
| §4.1 API 4, restriction | f=(1−x)⁻¹,U=ℂ,U'=D(0,1/2) | Pole at 1 with order 1 in U; no singularity in U'; pullback coefficients still 1 | Inclusion direction correct; retain |
| §4.1 API 5, polynomial action | χ=t,multiplier x vs 1/2 | x·1=x integral, (1/2)·1 nonintegral | Only integral multiplier hypothesis gives action; retain |
| §4.1 API 6, D-finite descent | (1−x)⁻¹, operator scaled by √2 | Residual 0; rational basis component (1−x)D−1 of order 1 | Descent of annihilator only; retain |
| §4.3 API 1, W finite sums | p=x²,1∈H | p⁻¹·1=x⁻²∈W | Rational coefficients in p allowed; retain |
| §4.3 API 2, V finite sums | 1∈H | x⁻¹·1=x⁻¹∈V | Negative valuation allowed; retain |
| §4.3 API 3, scalar subalgebras | 1∈H, p=x² | p·1=x², p⁻¹·1=x⁻²; product 1 | Scalar fields contained; retain |
| §4.3 API 4, scalar extension | p=x², generator 1 | W contains ℚ(x²); scalar extension contains x·1=x and x⁻¹·1 | V=ℚ(x)W, not equality of scalar fields; retain |
| §4.3 API 5, integral χ | χ=t,p=x² under finite-rank hypotheses | x∈H and field inverse x⁻¹∈W, so adjoining ℚ(x) changes W by 0 | Conditional W=V; retain |
| §4.3 API 6, source comparison | χ=t,f=(1−x)⁻¹ | Pullback coefficients all 1; same generator in both V definitions | Retain |
| Conventions: derivative and Cauchy factor | F=x²; G=z₁z₂ | F''=2 vs Taylor coefficient 1; polydisc integral coefficient (2πi)² divided by (2πi)² equals 1 | Factorials and orientation fixed; retain |
| Conventions: Vandermonde | (1,−1), d=2 | Reversed product 2 vs determinant −2; sign (−1)^1=−1; norms 2 | Retain |
| Conventions: logarithms | g=0,1/2,2z | Positive logs 0,0,log 2 vs raw log(1/2)=−log 2 | Cutoff and Haar normalization fixed; retain |
| Conventions: limit order | κ=1/2,d=1 or d→∞ | Row/surplus 1/2; 3^(1/d) starts at 3 then tends to 1 | Dimension limit must precede κ→0; retain |
| Supplier: Hadamard | Orthogonal columns (2,0),(0,3); (1,0),(1,1); empty | Determinant norms 6=2·3; 1<√2; empty 1=1 | Supplier hypotheses allow dependence/emptiness; retain |
| Supplier: empirical measure | Antipodes once vs twice; singleton | Weights 1/2=2/4; constant integral 1; singleton atom mass 1 | Nonempty indices and multiplicities retained |
| Supplier: ODE jets and full local bases | y'''=0; xy'+y=0; x²y'+y=0 | x² jet (0,0,2); basis x⁻¹ pole 1; exp(1/x) monodromy 1 but essential | Imported conditions have stated strength |
| Supplier: radius and quotient | D(0,2); g=i; h=g=1 | Cover derivative 2, inverse derivative 1/2; reconstructing phase i vs modulus 1; A=J=0 | Radius direction and phase retained |
| Supplier: energy and capacity | Radius-2 circle/disc; singleton; [0,1] | Minimum −log 2, capacity 2; singleton +∞ and 0; segment capacity 1/4 | Positive-capacity uniqueness only; gap unchanged |
| Supplier: weak measures | δ₁; antipodal measure; ν_n atoms exp(±i/n) | Mass 1; product mass 1 with each antipodal diagonal weight 1/4; integrals of constant 1 stay 1 under weak limits | Compact circle supplies topology/measurability hypotheses |

## Source observations from both reviews

These observations concern source wording already corrected by the roadmap, rather than additional numbered package findings. Overlaps between the reviews are explicitly combined here.

| Observation and evidence | Settlement and computation |
|---|---|
| BB11 tail exponent, BB11 line 40 (pass a) | §0.4 uses f=b+x^N g, so coefficient a_(N+1) has exponent 1 in g, not −1. No edit needed. |
| Binomial m=0, CDT25 line 176 (pass a) | All package binomial examples require m≥2; at m=2,M=8, derivative modulus is 2 and realization exp(4z). No edit needed. |
| Siegel height uniformity, CDT25 line 546 and CDT25 line 600 (both passes) | §1.2 retains d≥d₁(κ), with d≥log(1+1/κ) giving dD/α≤e²+o(1); constant is uniform on this cofinal range. No edit needed. |
| Vandermonde sign, CDT25 line 1048 (both passes) | Conventions and §3.6 use product 2 versus determinant −2 on (1,−1), equal norms 2. No edit needed. |
| Quotient phase, CDT25 line 771 (pass a) | Import ConformalMappingPartII §3.5: constant G=i has reconstruction from its modulus 1 and needs phase i. No edit needed. |
| Supremum vs logarithm, CDT25 line 820 (pass a) | §§1.4–2.1 and imported quotient use logarithmic A; h=g=1 gives A=J=0, whereas norm supremum is 1. No edit needed. |
| Equilibrium existence/uniqueness, CDT25 line 1190 (pass a) | Existing supplier gap requires nonempty compactness for existence and positive capacity for uniqueness; Saff10 line 315 distinguishes infinite energy. On two-point compacta every probability has energy +∞, so uniqueness is not asserted. No edit needed. |
| Strict exponential constant, CDT25 line 1158 (pass a) | §3.8 explicitly shrinks the positive lower constant. If liminf normalized energy is L>0, eventual energy >L/2, yielding a strict bound with a smaller c. No edit needed. |
| Scalar field of V, CDT25 line 492 (both passes) | §§4.5–4.8 bound W and include the scalar degree for general V. Degree-four witness gives rank≥4 while B≤3.593373… . No edit needed. |
| Arbitrary compact formula, CDT25 line 1364 and CDT25 line 1377 (both passes) | §5.2 gives numerator 0, denominator log 2, rank≥1. §5.1 proves centred cases by rescaling; G1 remains a separate generalization problem. Only the process wording changed. |

## Check outcomes

- Suggested.lean elaboration: ran lake env lean on packages/DiophantineApproximationAndTranscendencePartII/Suggested.lean from the pinned content repository. Exit 0. Exactly two expected warnings: declaration uses sorry, at lines 50:8 and 70:8. No error and no Tau Ceti import requiring a build.
- Mechanical signature check: copied the unchanged acceptance file into scratch, appended #check @name for all six declarations, and elaborated it once. Exit 0, with the same two expected warnings. Compared each displayed type with README §§0.1–0.2,2.1–2.2. No dropped section binder; both theorem types explicitly retain nonconstant p, its fixed regular germ, tangent χ, all integral pullbacks, closed-disc analyticity, φ(0)=0, strict derivative expansion and uniformization. Only mean_rank_bound requires linear independence. No signature change was necessary.
- Dependency check: ran the exact requested gate --depcheck invocation, with the package README, roadmap name, board order and --movable. Exit 0; complete output:

```text
depcheck: 54 roadmaps, 599 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

- Citation resolver: exit 0, no cross-roadmap citation found nowhere and no Lean name found nowhere. Its service did not check external Lean names against pins; the pinned files were inspected separately as listed above.
- Diff whitespace check: git diff --check, exit 0.
- No gate failures were supplied in the brief. No tooling, merge-order file or sibling roadmap was edited.

## Maintainer consequences

Only packages/DiophantineApproximationAndTranscendencePartII/README.md, its sources.toml and this report change. Suggested.lean, metadata.toml and design/plan.json remain unchanged. The acceptance test retains four necessary definitions and two headline theorems, with no padding. No exported name changes, downstream migration or merge-order decision results from these repairs.

The existing gap:complex-logarithmic-equilibrium still requires the energy/equilibrium extension of ClassicalArithmeticCompletion §§6.18,6.40. Its slug and needs agree with the unchanged plan's top-level gap. The prior report's G1 scope decision and frozen-plan-node issue are not reopened or silently resolved; this round changes only how the mathematical generalization problem is described. A fresh independent review remains necessary. No commit or external write was made.
