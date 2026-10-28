<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1467#issuecomment-6400427277 -->
Red team round 1 pass a (codex) of 788c4da

Verdict: needs_changes

1. **F01** (P3) The C¹ variation identity is already proved at the pin

   **Location:** packages/DiophantineApproximationAndTranscendencePartII/README.md:525: “The real C¹ variation identity follows from the FTC upper bound on partition sums and approximation of the integral”.

   **Claim:** §3.5 plans a new calculus bridge proving that variation equals the integral of the derivative norm.

   **Witness:** TauCeti/Analysis/Calculus/MetricVariation.lean:276, `TauCeti.eVariationOn_eq_lintegral_enorm_derivWithin`, already proves this for C¹ curves into a complete real normed space, hence for the real angular pullback on [0,1].

   **Exact repair text:** Replace the final sentence of the proof paragraph with: “Apply `TauCeti.eVariationOn_eq_lintegral_enorm_derivWithin` in `TauCeti/Analysis/Calculus/MetricVariation.lean:276` to the angular pullback on [0,1], replace `derivWithin` by the ordinary derivative almost everywhere, and convert the finite nonnegative integral to a real integral.” Add that declaration to From Tau Ceti and §3.5’s Needs; retain the circle specialization and positive-log bounded-variation consequence.

   **Repair test:** For the angular pullback cos(2πt), both variation and the integral of 2π|sin(2πt)| equal 4. For constant 0 and log⁺|2z|=log 2, both sides equal 0. The complete-target hypothesis holds for ℝ.

## Verified sound

Read all 881 README lines and all 85 Suggested.lean lines at head 788c4da. Read the repository README and CONTRIBUTING rules. Counts: **6 Lean declarations** (4 definitions, 2 theorems), **35 numbered README targets**, the additional order-preserving descent target in §4.1, **40 supporting API bullets**, **105 numbered-section Check bullets**, and **43 source passage locators** examined. The target paragraphs are headings/plain prose rather than bold declarations; all 35 are included below. **23 distinct cross-roadmap section contracts across 5 suppliers** were resolved, including the open ConformalMappingPartII and ProbabilisticAndMetricNumberTheory heads. No competing owner for arithmetic rank/algebraicity or arithmetic holonomic spans was found. R01 records the native calculus overlap.

The six elaborated signatures supplied with the job were compared individually with the actual file and README. No section variables or instances disappear: there are no section variable blocks, and each theorem explicitly carries its arithmetic, analytic and independence hypotheses. I did not rerun Lean; the read-only prohibition takes precedence over the generic scratch-elaboration instruction. The tables below record the signature comparison, not an assertion of a build performed during this pass.

The acceptance headlines are §2.1 integrated rank, §2.2 algebraicity, §§4.5–4.6 holonomic rank/fields/scalar comparison, §4.7 integral-coordinate finiteness, and §5.1 centred capacity rank. The first two are stated. The module docstring names all remaining headlines and their missing holonomic/differential-equation carriers. The multiplier theorem, Eisenstein input, open-disc corollary and Fekete/damping lemmas are supporting results/proof routes here, not additional independent acceptance summits. Their removal in the preceding repair does not by itself justify reinstating them. The two retained theorems are not one-tactic consequences of their definitions or of a pinned declaration. All four definitions are used by them. There is no padding to delete, sorry-valued data, free condition standing for an unavailable object, extra import, set_option, lemma declaration, or admitted example.

The diff against origin/main changes seven files, all inside packages/DiophantineApproximationAndTranscendencePartII. No computational-algorithm target was found. No pull-request number occurs in the reviewed README or Lean docstrings. The outstanding scope-decision prose concerns the expressly required G1 contract, rather than a newly invented approval requirement.

The dependency command requested in the brief returned exit 0 with precisely:

    depcheck: 53 roadmaps, 593 edges, 0 problem(s)

No UPWARD, CYCLE or moved line occurred. Within the package, the construction routes proceed through 0→1→2, 1→3, 0/2→4, 4→5. The definition of H announces its subring structure from §4.2; its carrier and membership predicate, needed to prove closure, are already defined in §4.1. The reference in the §1.5 proof to algebraicity in §2.2 is explanatory: the multiplier-rank argument itself ends before it and has no cycle.

The complex-logarithmic-equilibrium slug, supplier and needs sentence agree between README:67 and the plan's top-level gaps. The missing general energy/equilibrium results are neither already stated by ClassicalArithmeticCompletion §§6.18,6.40 nor found at the pins. This is one coherent potential-theory interface, with nonempty compactness and positive-capacity uniqueness explicitly separated; its affine compatibility concerns the new energy/measure construction. Acceptance of the dependent roadmap remains conditional on that declared contract. G1 and the stale frozen-plan supplier strings are not re-raised: packages/DiophantineApproximationAndTranscendencePartII/reports/FIX-PKG-DiophantineApproximationAndTranscendencePartII~2.md marks F01 and F10 not actionable, and their stated edit/scope restrictions remain applicable.

**Signature and instance ledger.** Every name below is in namespace TauCetiRoadmap.DiophantineApproximationAndTranscendencePartII. Instances are native for ℚ, ℂ, PowerSeries, LaurentSeries and the intermediate-field subtype; no arbitrary topology or ring parameter enlarges the carriers. “Keep” means the displayed computed cases do not refute the statement, not that a sorry proof was verified.

| Declaration, section, explicit context | Instances tried | Computed values on both sides | Result / change |
|---|---|---|---|
| IntegralSeries, §0.1, f : PowerSeries ℚ; no extra instance binder | f=0, 1, 1+x/2 | coefficients respectively 0; (1,0,…); (1,1/2,0,…); integer witnesses exist in first two, none for 1/2 | True, true, false; keep |
| Uniformizes, §0.2, φ,g : ℂ→ℂ, f : PowerSeries ℚ | φ=2z, f=x², g=4z² or 2z²; f=1 with branch −1 | F''(0)/2!=2/2=1; actual composite 4z²; wrong coefficient 2≠4; central values −1≠1 | Real body distinguishes correct germ; keep |
| positiveLogMean, §0.2, g : ℂ→ℂ, native circle average | g=2z,0,1/2,2 | log(max(1,norm)) is log2,0,0,log2; normalized averages have exactly those values | Cutoff and mass correct; keep |
| rationalFunctionField, §0.2, p : RatFunc ℚ, IntermediateField ℚ (LaurentSeries ℚ) | p=x,x²,0,2 | generated fields ℚ(x),ℚ(x²),ℚ,ℚ; extension degrees 1,2,∞,∞; native finrank 1,2,0,0 | No constant-field finite-degree claim; keep |
| mean_rank_bound, §2.1; p,pSeries,χ,φ,g,m,f,u; hp,hregular,hχ0,hχ1,hpInt,hfInt,hφ,hφ0,hExpansion,hg,hgp,hu,huf,hlin explicit | p=x, pSeries=x, χ=t, φ=g=2z, m=0 or f={1}; p=x², f={1,x}, g=4z², u={1,2z} | m=0≤e and 1≤e; second family independent over ℚ(x²), J=log4 and RHS=2e, giving 2≤2e; λ=1 would give logλ=0 and is excluded | Correct fields, empty case and denominator; keep |
| arithmetic_algebraicity, §2.2; same scalar context, one f,u, no independence premise | f=0,1; p=x,χ=t,f=√(1−4x), φ=(1−exp(8z))/4,u=exp(4z) | annihilators Y,Y−1,Y²−1+4x respectively; in last case λ=2 and composition square is exp(8z); quadratic is nonzero over both displayed fields | Algebraic need not rational; keep |

**Computed target ledger.** Arithmetic fields have characteristic zero throughout; DVRs, inseparable coefficient extensions, p=2/3 local fields, arbitrary schemes and nonabelian groups are not quantified over. Their introduction would change these statements. Relevant zero, empty, order-zero, ramified, atomic and total-function cases are recorded explicitly. Each row covers the target and all of its Check bullets, with subsidiary identities separated in the API ledger below.

| README target | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| §0.1 integral and tangent lattices (5 Checks) | Σ(x/2)^n; 1/2; 0; χ=t+t²/4; 1+x/2 | ordinary M=2 coefficients all 1 versus at M=1 coefficient 1/2; constant M⁰/2=1/2; zero stays 0; tangent quadratic at M=2 is 1/2 and at M=4 is 1; last scaled pair (1,1) versus (1,1/2) | Ordinary and tangent conditions distinguished; no change |
| §0.2 germ/mean/scalar definitions (11 Checks) | φ=2z,f=x; binomial branch; opposite branch; pole; factorial; constant means; p=x,x²,0,2 | pullback 2z and J=log2; (exp(Mz/m))^m=exp(Mz)=1−m²φ; wrong branch value −1≠1; pole at φ=1; x² derivative 2 divided by 2!=1; J(2)=log2 versus arclength 2πlog2, J(0)=J(1/2)=0 versus raw log(1/2)=−log2; degrees 1,2,∞,∞ | Correct boundary/normalization distinctions; no change |
| §0.3 overconvergence (2) | 1+x²,R=2,r=3/2; Σx^n,R=1 | polynomial coefficients n≥3 equal 0≤(13/4)(2/3)^n; geometric coefficients all 1 never vanish | Strict R>1 necessary; no change |
| §0.4 Eisenstein (2) | 1/2; √(1−4u); zero; u=x^(1/2) | c=2,M=1 gives constant 1; every variable-only scale leaves 1/2; square-root coefficients 1,−2,−2,−4 integral at M=1; zero all 0; for y(u)=1+u/2, y(2u)=1+u | Constant and ramification guards correct; no change |
| §0.5 uniform inverse scales (4) | χ=t+t²/4; p=x²,χ=t; p=x,χ=t; p=x+x⁴/32 and its inverse | ordinary quadratic 1 at M=2 but tangent 1/2; M=4 tangent 1; both χ=t examples M=1, including p'(0)=0; inverse coefficients −1/32,1/256 become −2,16 at M=4; p(4x)/4=x+2x⁴ | Same-scale inversion and ramified p allowed; no change |
| §1.1 separate-variable independence (2) | d=1,D=2,p=x,f₁=1; d=2; wrong family (1,p) | coefficient matrices I₂ and I₄ have determinant 1; wrong family gives p·1−1·p=0 | ℚ(p)-independence essential; no change |
| §1.2 auxiliary construction (2) | d=2,α=3; d=1,κ=1/2,m=1; d=0/m=0 boundary | 6=binomial(4,2) total-degree constraints versus 9 box constraints; D/α→3 gives rows/surplus→1/2; d=0 and m=0 fail premises | Cofinal d restriction retained; no change |
| §1.3 lowest jet (2) | F=x₁−x₂,χ=t+t²/2,φ=2z+z²; χ=t/2 or 2t with F=x/2 | lowest parts (1,−1) and (2,−2); χ=t/2 gives pullback t/4 nonintegral, χ=2t gives t integral but original coefficient 1/2 | Tangency is needed. First Check tests the homogeneous identity only: its higher coefficients ±1/2 are not integral; no full-integrality claim inferred |
| §1.4 multiplier/extrapolation (3) | h=1,g=2z; h=g=1; h=1+z,g=0 | sup pairs (1,2),(1,1),(2,0); A=log2,0,log2; limiting m=1 inequality log2≤e log2 | Three discriminating multiplier tests; no change |
| §1.5 multiplier rank (2) | p=x,χ=t,φ=2z,h=1; h=1−2z | first RHS=e≥1; second suprema 3,6 give A=log6 and RHS=e log6/log2>1; λ=1 gives zero denominator | Zeros of h allowed; no change |
| §2.1 mean rank (2) | p=x,χ=t,φ=Rz,R>1; empty family | J=logR; RHS=e; m=1 gives 1≤e and m=0 gives 0≤e | Correct probability normalization; no change |
| §2.2 algebraicity (2) | √(1−4x),0,1 | nonzero polynomials Y²−1+4x,Y,Y−1 evaluate to 0; first has a simple zero in 1−4x, hence cannot be a rational square | Both algebraicity fields; no rationality overclaim |
| §2.3 open-disc criterion (4) | m=2,M=8; λ=2 with r=3/4 or 1/4; lacunary series; general binomial with m=3 | derivative −2 and realization exp(4z); rescaled moduli 3/2>1 and 1/2<1; lacunary coefficients 0/1 and φ'=1; cube-root coefficients 1,−3,−9,−45; general derivative modulus M/m² | Strict threshold, integral binomial and shrinking verified |
| §2.4 lexicographic Jensen (3) | 3z₁²z₂; z₂^100+z₁; 1−z | log coefficient=log3=torus mean; least vector (0,100) but total order 1, coefficient log=0 and torus mean=0; last mean log norm=0, zero set {1} has mass 0 | Distinct order notions and integrable zeros; no change |
| §2.5 logarithmic route (2) | p=x,φ=2z,m=1; least vector (0,100) | log2≤e log2; coefficient factor 2^100, not 2 | Same mean rank constant; no change |
| §3.1 circular discrepancy (6) | singleton; regular d-gon; repeated point; antipodes; (1,1,−1); empty | D=1,1/d,1,1/2,2/3,0 respectively; deleting multiplicity changes 2/3 to 1/2; unguarded empty formula has supremum 1 | All six distinguish intended convention; no change |
| §3.2 weak continuity (2) | equal atoms at exp(±i/n); regular d-gons | short arc length 1/(πn), D=max(1/2,1−1/(πn))=1−1/(πn) for n≥1, tends to 1; polygon D=1/d→0 | Continuity does not require atomless limit; no change |
| §3.3 Koksma (2) | Re z sampled at 1; constant c | error 1, V=4,D=1 gives 1≤4; constant error c−c=0 and variation 0 | For c=1 a wrongly unnormalized mean 2π gives error abs(1−2π)>0 against RHS 0; angular variation is independently fixed in §3.5 |
| §3.4 Erdős–Turán (2) | regular d-gon,K=d−1≥1; singleton,K=1 | Fourier means k<d are 0, giving 1/d≤3/d; singleton mean modulus 1, RHS=3(1/2+1)=9/2≥1 | Rotations preserve Fourier moduli; no change |
| §3.5 variation (4) | Re z; h=1−z; h=0,z,2z | V(Re)=4=2π·(2/π); at z=1, log⁺ norm=0 though raw logarithm singular; three constant-modulus positive-log functions have V=0 | Formula true, native proof already exists; R01 |
| §3.6 Fekete and equality (3) | d=1; (1,−1); (1,1); (1,i) as extra nonextremal test | 1=1; product 2, det −2, both norm 2=2^(2/2); collision norm 0<2; adjacent pair norm √2<2 | Both directions of equality characterization survive; no change |
| §3.7 energy (2) | Haar; δ₁; antipodal empirical probability | Haar potential/energy 0 on closed unit disc; atomic energies +∞; antipodal off-diagonal contribution −log2/2 but diagonal +∞ | Finite products are not finite self-energy; conditional on declared supplier |
| §3.8 exponential gap (3) | collision; regular d-gon; antipodal pair with cutoff A>0 | V=0<exp(−cd²); regular polygon D=1/d<ε eventually and norm d^(d/2)>1; truncated antipodal energy A/2−log2/2 versus off-diagonal −log2/2 | A/d term and d₀ threshold necessary; no change |
| §3.9 damping (2) | d=2,F=x₁−x₂,φ=2z,M=1; S=0 | H=2(z₁−z₂)² gives coefficients 2,−4,2; λ^β=2 versus incorrect λ^(β+1)=4; S=0 gives M=0 and V⁰=1, including collision | Exponent and totalized power handled; no change |
| §3.10 damping limits (2) | κ=1/2; d=2 then d→∞ | 3^(1/d)→1; d/(d!)^(1/d)→e; log2/2>0 but logd/d→0 | Correct four-limit order; no change |
| §4.1 H and descent (8) | 1; 1/(1−x); exp x; f=exp(x/(1−x)),χ=L/(1+L); x²; zero; exp(√2x); exp(1/(x−α)) | 1 has coefficients (1,0,…), D annihilator; rational germ satisfies (1−x)f'−f=0; exp has coeff₂=1/2 and equation row [1,1], kernel (−1,1); special composite exp L=1/(1−t) integral but essential singularity at 1; x² jet (0,0,2); 1·0=0; rational order-one equation for exp(√2x) forces both coefficients 0; essential exponential has monodromy 1 but no meromorphic extension | Arithmetic and full-basis requirements independently tested; no change |
| §4.1 order-preserving coefficient descent (additional target) | √2((1−x)D−1) on 1/(1−x); zero order | basis (1,√2) components 0 and ((1−x)D−1), with leading coefficient 1−x≠0 and residual 0; zero has order-zero annihilator 1 | Order and degree bound preserved; no meromorphic-basis descent claimed |
| §4.2 closure (2) | x·1; (1/2)·1; (1−x)⁻² | pullbacks x integral, 1/2 nonintegral; square has coefficients n+1 and annihilator ((1−x)D−2) | Rational multiplier integrality cannot be dropped; no change |
| §4.3 W,V (5) | scalar units; p=x; degree-four p with inverse χ; x⁻¹; p=x²,constant 0 | 1≠0 implies ranks≥1; p=x makes scalar fields equal; degree-four subfield extension contributes ≥4 to rank V over ℚ(p); x⁻¹ has valuation −1; extension degrees 2 and ∞ | Laurent carrier and scalar distinction correct; no change |
| §4.4 pole clearing (2) | q=1−t, f=(1−x)⁻¹,p=x; q=i(1−t); f=(1−2x²)⁻¹ | first product 1 integral; second i not rational; q=1−2t² makes product 1 at both ±1/√2 | Rational clearing with harmless conjugate zeros; no change |
| §4.5 W rank (2) | U=ℂ,p=x,χ=t,φ=2z; λ=1 | J=log2, B=e, so 1≤dim W≤2 as integer; second denominator log1=0 | No V-over-ℚ(p) identification; no change |
| §4.6 fields and safe bounds (2) | p=x²,χ=t; one-dimensional algebra; zero ring excluded | degree n=2; x∈H and inverse x⁻¹∈finite field W imply W=V, though base fields differ; rank-one field has dimension 1; Laurent unit 1≠0 excludes zero ring | Tower factor n retained; no change |
| §4.7 qualitative finiteness (2) | U=ℂ,𝔻,ℂ∖{1} | φ=2z has derivative 2; based self-map of 𝔻 has modulus≤1; 1−exp(2z) has derivative −2 and never equals 1 | Operational map criterion valid on parabolic domains |
| §4.8 false published V bound (2) | p=x+x⁴/32,χ inverse,φ=2z | inverse coefficients −1/32,1/256; both compositions at degrees 4,7 yield −1/32+1/32=0 and 1/256−4/1024=0; degree 4; boundary≤5/2; e log(5/2)/log2<3 log(5/2)/log2<4 since 125/8<16 | Counterexample refutes published scalar field, not corrected W theorem |
| §5.1 centred capacity (2) | r=1/2,φ=4z,p=x; φ=2z | capacity 1/2; numerator log2; denominator log4+log(1/2)=log2; B=e; second product rλ=1 and denominator 0 | Correct rescaling and strictness |
| §5.2 compact obstruction (2) | K=closedDisc(1/2,1/4),φ=8z exp(−20z),p=x,χ=t | Re z≥1/4,norm z≤3/4, norm φ≤6exp(−5)<1; mean 0; cap=1/4, λ=8, denominator log2>0; rank≥1 would be ≤0 | Independent counterexample to compact formula; G1 remains settled |

**Supporting API and convention ledger.** API indices follow the bullet order in the specified subsection. Each ordinary predicate has satisfying and failing instances; generated fields are distinguished from linear spans, and atomic energy from off-diagonal energy.

| Statement | Instances tried | Computed values on each side | Result / change |
|---|---|---|---|
| §0.1 API 1, coefficient membership | f=1+x/2,M=2 or 1 | M⁰a₀=1; Ma₁=1 or 1/2 | True at 2, false at 1 |
| §0.1 API 2, rescale image | same f,M=2 | f(2x)=1+x, integer-series image coefficients (1,1,0,…) | Two descriptions agree |
| §0.1 API 3, subring and scale one | f=x/2,h=1+x/2,M=2 | sum rescales to 1+2x; product to x+x²; negative to −x; at M=1,1+x integral | Ring operations agree |
| §0.1 API 4, divisible scales | M=2,N=4,f=Σ(x/2)^n | scaled coefficients 1 and 2^n | Inclusion direction correct |
| §0.1 API 5, constants | c=2 or 1/2,M=1,4 | M⁰c=c in every case | Iff true in both directions |
| §0.1 API 6, tangent equivalence | χ=t+t²/4,M=2,4 | normalized series t+(1/2)t² versus t+t²; M^(2−1)/4=1/2 or 1 | Both descriptions agree |
| §0.2 API 1, Taylor/central relation | F=x² or 1,φ=2z | a₂=2/2!=1; F=1 gives g(0)=1=a₀ | Factorial and n=0 included |
| §0.2 API 2, uniqueness | F=x versus −x,φ=2z | composites 2z versus −2z; coefficients 1 versus −1 | Wrong germ excluded |
| §0.2 API 3, ring compatibility | f=x,h=x²,φ=2z | sum 2z+4z²; product 8z³=(2z)(4z²); constants remain 0,1 | Operations agree |
| §0.2 API 4, shrinking | φ=g=2z,r=3/4 or 1/4 | derivatives 3/2 and 1/2; new g same multiple of z | Germ preserved, expansion only first |
| §0.2 API 5, substitution | F=x²,φ=2z+z² | composite 4z²+4z³+z⁴ | Correct argument order |
| §0.2 API 6, common radius | f₁=(1−x)⁻¹,f₂=(1−2x)⁻¹ | radii 1 and 1/2 admit common 1/4>0 | Finite-family minimum works |
| §0.2 API 7, constant mean | c=0,1/2,2 | J=0,0,log2, identical to positive log modulus | Includes zero |
| §0.2 API 8, generated field | p=x² | x²,x⁻²,1 belong; linear span ℚ·x² lacks last two | Field closure matters |
| §0.2 API 9, constant boundary | p=x,0,2 | fields ℚ(x),ℚ,ℚ; degrees 1,∞,∞ | Constant finrank 0 not extension degree |
| §0.2 API 10, affine replacement | p=x²,a=2,b=3; a=0 | x²=((2x²+3)−3)/2; a=0 leaves only ℚ | Nonzero slope necessary |
| §0.2 API 11, rotation | g=2z,rotation i; g=0 | J(2iz)=log2=J(2z)≥0; J(0)=0 | Finite analytic means |
| §1.4 API 1, supremum maximum | h=1+z,g=0 | suprema 2,0; A=log2 | Product supremum alone wrong |
| §1.4 API 2, positivity | h=1; h=1−2z | sup norm h=1 or 3; A≥log1=0 | Central normalization fixes bound |
| §1.4 API 3, iff threshold | h=1,g=2z,a=log2 or 0 | A=log2; exp(a)=2 admits norms, exp(0)=1 fails norm g=2 | True/true and false/false |
| §3.1 API 1, arc supremum | antipodes, half-circle and shrinking arc | half-circle frequency=length=1/2,error 0; short arc error→1/2 | D is supremum, not fixed-arc value |
| §3.1 API 2, rotated star | singleton at angle 1/2, then cut there | fixed-cut star 1/2; rotated angle 0 gives 1 | Circular value 1 |
| §3.1 API 3, bounds | regular d-gons,d=1,2,3 | D=1,1/2,1/3, each equals 1/d and ≤1 | Nonempty guard |
| §3.1 API 4, permutation | (1,1,−1) and (−1,1,1) | weights 2/3,1/3 unchanged; D=2/3 both | Multiplicities retained |
| §3.1 API 5, rotation | (1,−1),(i,−i) | D=1/2 both | Arcs rotate with tuple |
| §3.1 API 6, repetition | antipodal pair repeated twice | probabilities 1/2,1/2; D=1/2 both, not 1/4 | Count alone does not improve discrepancy |
| §3.1 API 7, empirical agreement | (1,1,−1) | shrinking arc mass/frequency 2/3; both errors→2/3 | Native law agrees |
| §3.1 API 8, Haar iff zero | Haar; δ₁ | Haar arc mass ℓ,error 0; shrinking arc at 1 has δ₁ errors→1 | Wrong probability excluded |
| §4.1 API 1, membership | 1 versus exp x,χ=t | D(1)=0,basis {1}; exp coefficient 1/2 fails | Holonomic alone insufficient |
| §4.1 API 2, zero/unit | arbitrary U,χ | pullbacks 0,1; derivative residuals 0 | Both included |
| §4.1 API 3, closure | f=h=(1−x)⁻¹,χ=t | sum coefficients 2; negative −1; product n+1 | Arithmetic closure |
| §4.1 API 4, restriction | U=ℂ,U'=disc(0,1/2),f=(1−x)⁻¹ | singularity 1 lies in U but not U'; meromorphic basis satisfies former | Fewer conditions after restriction |
| §4.1 API 5, multipliers | χ=t,p=x or 1/2 | p∘χ=t integral versus constant 1/2 nonintegral | Multiplier premise discriminates |
| §4.1 API 6, descent | exp x,order 1,degree 0 | row [1,1] rank 1,kernel (−1,1) over ℚ and ℚ̄ | Not a full-basis descent claim |
| §4.3 API 1, W span | p=x²,(1/p)·p | value 1, coefficient 1/p∈ℚ(p) | Correct scalar field |
| §4.3 API 2, V span | x⁻¹ times 1 | coefficient 1 at exponent −1 | Laurent ambient necessary |
| §4.3 API 3, subalgebras | a·1,b·1 | product ab·1,unit 1,zero 0 | Nonzero unital algebra |
| §4.3 API 4, V=ℚ(x)W | p=x²,finite Σ a_i(x)h_i | both sides contain exactly these sums; h_i=1·h_i∈W | Both inclusions by distributivity |
| §4.3 API 5, integral χ | χ=t,p=x² after finite rank | x∈H,so x and x⁻¹∈W; ℚ(x)⊆W | W=V despite base degree 2 |
| §4.3 API 6, source V | χ=t | identical ℚ(x)-span of identical H(U,t,ℤ) | No scalar substitution |
| Puiseux convention | y=1+u/2,u=x^(1/2),N=2 | y(2u)=1+u,exponents 0,1 in u; N=0 forbidden | No zero-root denominator |
| Formal versus analytic coordinates | χ=t/2,φ=2z,f=x² | f∘χ=t²/4, F∘φ=4z²; χ₁=1/2 fails | Coordinates independent |
| Native inverse unit premise | X+X² over ℤ; 2X over ℤ or ℚ; zero ring | inverse coefficients 1,−1,2,−5; 2b₁=1 impossible in ℤ,b₁=1/2 in ℚ; zero-ring X=0 and compositions 0=X | Invertible coefficient essential |
| Native substitution nilpotence | constant 1 over ℚ; ε over ℚ[ε]/(ε²) | 1^n=1≠0; ε²=0 | HasSubst not convergence |
| Haar/Cauchy normalizations | g=2z; G=z₁z₂ | mean log2 versus arclength 2πlog2; coefficient (1,1)=1 versus torus integral factor (2πi)²=−4π² | Normalization fixed |
| Vandermonde parity | (1,−1); empty; regular triple | product 2 versus determinant −2; empty product 1; triple modulus 3√3 | Sign factor necessary |
| Dimension factor | d=1,2,κ=1/2 then d→∞ | d/(d!)^(1/d)=1,√2 then →e; 3^(1/d)→1 | No d=0 division |
| Auxiliary uniform constant | p=x+2,f=1,d=1 versus cofinal d | (T−2)^α divides nonzero P∈ℤ[T], so height(P)≥2^α/√D; log height/α≥log2−o(1) | README correctly restricts source's all-d uniformity |
| Truncated energy | antipodal empirical law | diagonal A/2,off-diagonal −log2/2,total A/2−log2/2 | d-limit before cutoff-limit |
| Equilibrium contract | radius-2 circle; singleton; {0,1}; empty | minimum −log2,cap 2; atomic energy +∞,cap 0; distinct point masses both minimize on {0,1}; no probability on empty | Existence/uniqueness guards separated |
| Order-zero holonomic boundary | L=1,f=0; L=D | order-zero space {0},empty basis size 0; D has basis {1} and annihilates 0 | Zero series permitted |
| Modular benchmark | F=1+4x+36x²+…,φ=q−8q²+… | q coefficient 4;q² coefficient −32+36=4,matching theta square | Factor 16 and square verified |
| Compact worked examples | centred half-disc with 4z; translated quarter-disc with 8z exp(−20z) | first numerator/denominator log2; second numerator 0,denominator log2,rank≥1 | Capacity positivity alone insufficient |

**Supplier and ownership audit.** Object searches used the roadmap service and direct searches of main, Completed, packages and the supplied open folders. Search hits from revisions of existing main roadmaps were not used instead of main contracts. No competing fully qualified acceptance declaration was found.

| Supplier sections resolved | Repository-relative evidence | Compatibility witness |
|---|---|---|
| DiophantineApproximationAndTranscendence §§0.2,0.3,2.8,5.1,5.2,5.3 | TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:227,358,1804,2928,2968,3034; consumed targets at 2930,2932,2960,2964 | x² has second derivative 2; D-finite product closure supplied; rational coefficient descent owned locally |
| ConformalMappingPartII §§0.1–0.6 | TauCetiRoadmap/ConformalMappingPartII/README.md:137,162,182,188,194,214 | D³ equation gives x² jet (0,0,2); x⁻¹ meromorphic with pole 1; exp(1/x) not meromorphic; q=1−2t² clears conjugate poles |
| ConformalMappingPartII §§1.3,1.4 | Same README:289,310 | Radius of disc(0,2) is 2; domain-to-disc derivative 1/2 |
| ConformalMappingPartII §§3.5–3.7 | Same README:555,561,567 | g=i has modulus 1,J=0,phase i; h=g=1 has A=0 |
| ProbabilisticAndMetricNumberTheory §2.7 | TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md:3086 and its Koksma/Erdős–Turán targets | Singleton angle 1/2 has star 1/2 but circular 1; Fourier rotation has modulus 1; K=1 singleton RHS 9/2 |
| GeometryOfNumbersAndQuadraticArithmetic §§0.1.1,0.1.2 | TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md, §0.1, read with roadmaps show | Orthogonal columns:6=2·3; dependent:0; empty determinant/product:1; conjugate-first inner product |
| ClassicalArithmeticCompletion §§6.18,6.19,6.40 | TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:12458,12493,13054 on main | Radius-2 disc:δ₂=4,d=2; [0,1]:1/4; singleton:0; no general energy minimization supplied |

The arithmetic substitution/denominator compatibility, rank/algebraicity theorem, arithmetic holonomic condition and W/V comparison have no competing owner found in these searches. Circle adapters extend the supplied interval theory. R01 is the identified native overlap.

**Pinned-library audit.** Pins read from lake-manifest.json: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Names and surrounding hypotheses were read at these pins.

| Declarations | Pinned file:line | Restriction or computed convention |
|---|---|---|
| PowerSeries.coeff, coeff_rescale | Mathlib/RingTheory/PowerSeries/Basic.lean:76,583 | Multiplier a^n; degree zero unchanged |
| PowerSeries.subst, substAlgHom | Mathlib/RingTheory/PowerSeries/Substitution.lean:157,170 | Inner argument first; HasSubst from zero constant; subst (t/2) (x²)=t²/4 |
| PowerSeries.substInv, subst_substInv_right, subst_substInv_left | Same file:456,510,542; context 437 | Zero constant/invertible linear coefficient; both inverse identities |
| RatFunc.coeToLaurentSeries; RatFunc.liftAlgebra | Mathlib/RingTheory/LaurentSeries.lean:391; Mathlib/FieldTheory/RatFunc/Basic.lean:756 | Native embedding and scoped algebra; x⁻¹ exponent −1 |
| IntermediateField.adjoin | Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean:34 | Generated subfield plus algebraMap_mem; contains inverses, unlike a linear span |
| RatFunc.finrank_eq_max_natDegree | Mathlib/FieldTheory/RatFunc/IntermediateField.lean:162 | Constants give finrank 0; genuine finite degree needs nonconstancy |
| IsAlgebraic.exists_integral_multiple | Mathlib/RingTheory/Algebraic/Integral.lean:146 | One element:1/2 needs scalar 2; series scale derived separately |
| Int.Matrix.exists_ne_zero_int_vec_norm_le | Mathlib/NumberTheory/SiegelsLemma.lean:155 | 0<rows<columns; max(1,norm A); 1 row/3 columns exponent 1/2 |
| fieldOfFiniteDimensional | Mathlib/LinearAlgebra/FiniteDimensional/Basic.lean:521 | CommRing,IsDomain,Algebra,FiniteDimensional; excludes zero ring |
| Stirling.factorial_isEquivalent_stirling | Mathlib/Analysis/SpecialFunctions/Stirling.lean:246 | Factorial asymptotic implies d/(d!)^(1/d)→e |
| Complex.norm_iteratedDeriv_le_of_forall_mem_sphere_norm_le | Mathlib/Analysis/Complex/Liouville.lean:42 | Complete target,R>0,DiffContOnCl; divide n! for coefficients |
| AnalyticOnNhd.circleAverage_log_norm | Mathlib/Analysis/Complex/JensenFormula.lean:375 | Nonzero radius/central value; remove central zero order first |
| Real.circleAverage | Mathlib/MeasureTheory/Integral/CircleAverage.lean:55 | (2π)⁻¹ normalization; definition implies no integrability |
| Matrix.det_vandermonde | Mathlib/LinearAlgebra/Vandermonde.lean:219 | Factors v_j−v_i; determinant −2 at (1,−1) |
| InnerProductSpace.gramSchmidtOrthonormalBasis_det | Mathlib/Analysis/InnerProductSpace/GramSchmidtOrtho.lean:374 | Product of orthonormal coordinates; equality analysis only |
| eVariationOn, LipschitzWith.comp_boundedVariationOn | Mathlib/Topology/EMetricSpace/BoundedVariation.lean:60,1256 | Partition sums, finite variation, no built-in continuity |
| isCompact_setOfPred_finiteMeasure_le_of_isCompact | Mathlib/MeasureTheory/Measure/Prokhorov.lean:183 | T2/Borel,compact support,bounded mass |
| ProbabilityMeasure.tendsto_iff_forall_integral_tendsto | Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean:365 | Bounded continuous real tests |
| ProbabilityMeasure.continuous_prod | Mathlib/MeasureTheory/Measure/FiniteMeasureProd.lean:144 | Second-countable,pseudometrizable,measurable opens |
| ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto | Mathlib/MeasureTheory/Measure/Portmanteau.lean:353 | HasOuterApproxClosed,null frontier; mesh avoids atoms |
| TauCeti.Probability.empiricalMeasureOfFintype, integral_empiricalMeasureOfFintype | TauCeti/Probability/Process/EmpiricalMeasure.lean:54,100 | Nonempty finite indices,multiplicities,strong measurability,complete target; antipodes weights 1/2 |
| DifferentiableOn.torusIntegral_prod_sub_inv_smul | TauCeti/Analysis/Complex/CauchyIntegralPolydisc.lean:116 | Complete target,differentiability on closed polydisc,evaluation inside; factor (2πi)^d |
| TauCeti.eVariationOn_eq_lintegral_enorm_derivWithin | TauCeti/Analysis/Calculus/MetricVariation.lean:276 | Complete real normed target,ContDiffOn ℝ 1 on Icc; supplies §3.5 bridge |

**Source-locator audit.** All three manifest works were legally available in the supplied cache; no further work is cited by this package, so no fetch or missing-reference request was needed. The 43 passage locators are counted explicitly below.

| Source | Verified passages |
|---|---|
| CDT25, 34 passages | CDT25 line 145:Lemma 1.1.2,p.629; line 169:§1.1.1,p.630; line 242:(1.1.4)–(1.1.5),p.631; line 440:Theorem 2.0.1,p.635; line 467:Definition 2.0.4; line 479:full-basis convention,p.636; line 489:Corollary 2.0.5; line 502:pole clearing; line 519:multiplier lemma; line 541:inverse chart,p.637; line 546:auxiliary lemma; line 574:denominators; line 576:scale construction; line 604:independence,p.638; line 614:extrapolation; line 620:lowest jet; line 706:powers argument,p.639; line 711:Nevanlinna lemma; line 886:converse bound,p.641; line 936:lexicographic lemma,p.642; line 973:averaging; line 1018:third-proof introduction,p.643; line 1063:Fekete,p.644; line 1082:discrepancy; line 1096:variation,p.645; line 1106:Koksma; line 1110:Erdős–Turán; line 1134:gap; line 1184:weak limit,p.646; line 1190:energy; line 1235:damping,p.647; line 1327:extrapolation,p.648; line 1364:compact formula,p.649; line 1399:modular application,pp.649–651 |
| BB11, 3 passages | BB11 line 26:§1,p.1,qualitative denominators/tail argument; line 543:Theorem 6.1 and proof,pp.10–11; line 764:§8,p.14,finite coefficient field |
| Saff10, 6 passages | Saff10 line 272:kernel/potential,p.171; line 297:Lemma 1.6,lower semicontinuity; line 310:Lemma 1.7,minimizer,p.172; line 319:Definition 1.8,capacity; line 326:Theorem 1.9,diameter comparison; line 387:Example 1.10,disc equilibrium,p.173 |

## Not verifiable

- The eventual Lean proofs were not run or reviewed: both acceptance theorems have sorry. This pass used supplied elaborated signatures and pinned source reads under the no-build instruction.
- G1 has no supplied replacement theorem or assigned owner. The previous repair's F01 scope-decision restriction remains settled; neither centred theorem nor counterexample depends on resolving it.
- The general energy/equilibrium implementation remains the declared ClassicalArithmeticCompletion gap. The contract is precise and source-supported; implementation is not claimed to exist.
- Ownership against open pull requests without supplied contents was not exhaustively checked. Index matches were leads; supplied siblings, main/Completed, packages and the directly consumed GeometryOfNumbersAndQuadraticArithmetic contract were checked. No unseen open result is asserted missing.
- Overbars and some conjugation glyphs are lost in the CDT25 extraction. Its line 453 was not treated as proof of a published rationality claim. The errors below have independent witnesses and do not rely on that ambiguity.

## Source issues

- **Misprint** in BB11 at §1, printed p.1 (BB11 line 40): the source says the tail series uses powers N−k for k≥N; it should be powers k−N, giving a power series regular at zero; affects the proof.
- **Misprint** in CDT25 at §1.1.1, printed p.630 (CDT25 line 176): the source says the binomial example applies to every integer m; it should be restricted to nonzero m, since 1/m and m⁻² occur; affects nothing.
- **Error** in CDT25 at Lemma 2.1.2, printed pp.637–638 (CDT25 line 546): the source says one coefficient-height constant works for every fixed d and arbitrarily small κ; it should be restricted to a cofinal range d≥d₁(κ), or allow dependence on κ; affects a stated result.
- **Misprint** in CDT25 at (2.5.2), printed p.644 (CDT25 line 1048): the source says the reversed pair product equals the displayed increasing-power Vandermonde determinant; it should include (−1)^(d(d−1)/2), as (1,−1) gives 2 versus −2; affects nothing.
- **Misprint** in CDT25 at (2.3.2), printed p.640 (CDT25 line 771): the source says the exponential quotient reconstructs the complex zero-free function directly; it should include the unit phase G(0)/abs(G(0)); constant G=i distinguishes i from 1; affects the proof.
- **Misprint** in CDT25 at proof of Lemma 2.3.1, printed p.641 (CDT25 line 820): the source says the supremum of abs(h) is bounded by the logarithmic mean; it should bound the supremum of log(abs(h)); h=g=1 gives 1 versus 0; affects the proof.
- **Error** in CDT25 at proof of Lemma 2.5.9, printed p.646 (CDT25 line 1190): the source says every compact set has a unique energy-minimizing probability; it should require nonemptiness for existence and positive capacity for this uniqueness assertion; affects a stated result.
- **Gap** in CDT25 at proof of Lemma 2.5.9, printed p.645 (CDT25 line 1158): the source says to take c equal to a positive liminf for the eventual strict exponential bound; it should take a smaller positive constant, for example half that liminf; affects the proof.
- **Error** in CDT25 at Corollary 2.0.5, (2.0.7), printed p.636 (CDT25 line 492): the source says the mean bounds the full ℚ(x)-span over ℚ(p) for general rational χ; it should bound W, or include the scalar-extension degree for V; affects a stated result.
- **Error** in CDT25 at §2.5.27, (2.5.28), printed p.649 (CDT25 line 1364): the source says arbitrary compact sampling sets satisfy the capacity-adjusted rank bound; it should impose sufficient base-point-sensitive geometry; the translated quarter-disc example has rank≥1 but proposed bound zero; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "788c4da1f0b19adc0a95bb97ec7ef1e8d76f5eb9", "job": "RT-DiophantineApproximationAndTranscendencePartII~1a", "model": "gpt-6-astra", "worker": "chris-35"} -->
