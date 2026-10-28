<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1008#issuecomment-6446411580 -->
Red team round 2 pass a (codex) of f09b575

Verdict: needs_changes

1. **F01** (P3) The new GL₂ Check does not distinguish depth from modulus

   **Location:** README.md:699: “reading the depth d_B^G≍|a| in place of the modulus character would give a different weight”.

   **Claim:** The displayed GL₂ value detects substitution of depth for modulus.

   **Witness:** On diag(a,1), both d_B^G and δ_B^G are comparable to |a|; at |a|=4 both yield 4. The stipulated ≍ convention makes these the same weight class.

   **Exact repair text:** Replace that Check by: “For GL₂, δ_B^G(diag(a,1))=|a| and δ_B^B=1; the proper-parabolic depth is comparable to the same |a|, so this example alone does not distinguish the weights. For GL₃ take B⊂G and diag(t²,t,1), t≥1: choose the chamber representatives d_{B,α}=exp⟨α,H_B⟩. Then d_B^G=t while δ_B^G=t⁴; at t=2 their values are 2 and 16. Their ratio t³ is unbounded. At P=Q the modulus is 1 and no depth minimum is defined.”

   **Repair test:** The original GL₂ values remain 4 and 4. The GL₃ roots have values t,t,t²: minimum t, product t⁴. Thus the replacement separates the weight classes, rather than only different choices of representatives.

2. **F02** (P2) Isolation uses the full inducing space where the source removes the split centre

   **Location:** README.md:1423: “there is one complex parameter s∈a_M,ℂ*”; also README:1325–1385 and 1449–1459.

   **Claim:** The imported a_M notation can be used unchanged for fixed-ω occurrence and typicality.

   **Witness:** AdelicAlgebraicGroups README:2457 defines a_M=Hom(X*_F(M),ℝ). BPLZZ instead quotients by Z(𝔸) (bplzz line 1149–1155). For G=M=G_m, these spaces have dimensions 1 and 0 respectively.

   **Exact repair text:** Add to the conventions: “Keep the absolute spaces a_M and A_M∞ of AdelicAlgebraicGroups in Layers 2–3. In Layers 4–5 write a_M^{G,*}=ker(a_M*→a_G*) for inducing characters trivial on the fixed split centre Z(𝔸); equivalently this is the dual of Z(𝔸)M(𝔸)¹\M(𝔸), in BPLZZ's notation. All unitary-twist quotients, complex inducing parameters, central quotients c_M*/a_M^{G,*}, and splittings ℓ in Layers 4–5 use this relative space. For M=G it is zero.” Replace the occurrences of a_M* and its complexification in those layers and the corresponding central-comparison contracts by this explicitly relative space. Leave the full a_P* integration of §3.7 unchanged.

   **Repair test:** Let G=M=G_m/ℚ, ω=1, σ=1 and T contain every finite place. In the currently imported absolute space, s=1 produces infinitesimal character 1 from character 0, contradicting the nonoccurrence Check at README:1441. In the relative space only s=0 is allowed, so character 1 does not occur, and twisting preserves ω. For a GL₂ Borel, the retained parameters are (s,−s), which preserve the central character; (s,s) does not. The declared comparison gap does not state this missing convention; this finding asks for its precise contract, not its implementation.

3. **F03** (P2) The Arthur supplier gap still combines independent inputs

   **Location:** README.md:91: “Supply fixed-normal-level Arthur factorization … and identify compact-test kernel expansion and split-central disintegration”.

   **Claim:** gap:arthur-factorization-comparison is one precise prerequisite.

   **Witness:** bpcz line 2043–2061 concerns finite-differentiability convolution factorization; line 2420–2429 concerns central kernel disintegration; line 2481–2508 concerns a spectral expansion. These have different domains and feed §§3.2, 3.8 and 3.10 separately.

   **Exact repair text:** Split this entry in both README and design/plan.json into three contracts on AutomorphicSpectralTheory: (1) gap:arthur-factorization-comparison, §6.3: “For each normal compact open K₀⊂K_f and m≥1, supply Z∈U(g∞) and compact tests g₁∈C_c∞, g₂∈C_cᵐ, invariant under K∞ conjugation and bi-K₀ at finite places, such that f=f*g₁+(f*Z)*g₂ for every bi-K₀ Schwartz f; choices depend only on K₀,m.” (2) gap:compact-kernel-central-comparison, §6.4: “Identify the compact-test parabolic and support-component kernels with the quotient measures of §3.8 and prove K⁰(x,y)=∫_{A_P∞}K(x,ay)δ_P(a)^(−1/2)da.” (3) gap:compact-kernel-spectral-comparison, §6.4: “Supply the compact-test discrete-inducing spectral kernel identity of §3.10, with its specified χ,P,K-type indexing, |𝒫(M_P)|^(−1) coefficient, conjugate second factor and dual Haar measure.” Point each consuming section to its own contract; §3.10 also consumes §3.2 as already stated.

   **Repair test:** On the one-point group, the three contracts separately give f=f·1+0, K⁰=K=f(1), and the single spectral term f(1). On GL₂, the disintegration contract retains δ=4↦δ^(−1/2)=1/2, which the factorization equation cannot determine. This is a new compound contract finding, not a re-raising of the four contracts repaired for b:F01.

4. **F04** (P2) The Schwartz-density API depends on the next section

   **Location:** README.md:845: “S is dense in every smooth weighted L² space and in C([G]_P).”

   **Claim:** All of §2.10, including density in C([G]_P), can be completed before §2.11 using its listed inputs.

   **Witness:** C and its topology are constructed at README:863. Section 2.11 explicitly needs §2.10 at README:875. Keeping C-density in §2.10 produces the section dependency 2.10 → 2.11 → 2.10.

   **Exact repair text:** Replace the API bullet at line 845 by “S is dense in every smooth weighted L² space.” Keep the C-density assertion only in §2.11, where it is already stated at lines 863 and 871. No new supplier is needed.

   **Repair test:** On a compact quotient, the later statement remains S=C=C∞ with dense identity map. On the modular cusp, the later C-space still contains the tail y^(1/2)exp(−sqrt(1+log y)) while S does not; its approximation in C is proved only after C's logarithmic seminorms exist. The section graph is then 2.10 → 2.11 in supply order, without a reverse edge. This is separate from the repaired measure-smoothing cycle a:F02.

## Earlier findings: verification at this head

The identifiers below distinguish the two earlier reviews. None of the seven findings was marked not actionable. The repaired passages and computations were inspected afresh; the repair report was not treated as authority.

| Earlier finding | Status and repaired passage | Witness at the reviewed head |
|---|---|---|
| a:F01, arbitrary convolution at fixed level | Repaired. README:1227: “closed and stable under G∞ and under the bi-K Schwartz algebra”. | README:1243: (23)(1,1,−2)=(1,−2,1), whereas e_K(23)e_K gives (−1/2,−1/2,1). The latter is fixed by (12), the former is not. bplzz line 1100–1107 agrees. |
| a:F02, smoothing dependency cycle | Repaired. README:889: “Its uniform-growth estimates are proved in §2.13 and its relative-decay estimate in §2.14.” | README:925,953 gives weak convolution → uniform growth → relative decay. For δ_y and compact f, support lies in y(supp f)⁻¹, so bounded w contributes only C^r; w=1 gives T, w=n_P gives S. No S_w input precedes its definition. |
| a:F03, Sobolev printed page | Repaired. README:787: “(2.5.5.4)–(2.5.5.5), p.212”. | bpcz line 1268 heads printed p.212; line 1273 and lines 1275–1277 contain the two formulas. |
| a:F04, moderate-symbol checks | Repaired. README:367–369: “the ratio eⁿ/(1+n)^d tends to ∞”; “sup_n n²/(1+\\|n\\|)²=1”. | For exp(z), the integer-lattice ratios diverge for every d, whereas vertical-strip bound is e^M. For z², r=−2 gives 0,1/4,4/9,… with supremum 1; r=−1 diverges. |
| b:F01, four compound gaps | Repaired for the four contracts identified. README:63–85 separates rapid semisimple, split-centre, refined-data and counting contracts; README:99–105 separates Plancherel and tempered strips; README:155 retains only Satake families. | All 29 current slugs, suppliers, sections and needs match design/plan.json exactly. README:593 correctly changes support to C·supp(h). For f=1_K and h=1_{K diag(ϖ,1)K}, output support is the latter double coset, not K. The proposed duplicate Nash gap was correctly avoided. |
| b:F02, undefined relative modulus | Repaired definition; its new Check introduces S01. README:679: “δ_P^Q(x)=exp⟨2ρ_P^Q,H_P(x)⟩”; “δ_P^G=δ_P and δ_P^P=1”. | bpcz line 697–705 supplies the definition. GL₂ diag(a,1), \\|a\\|=4 gives δ_B^G=4 and δ_B^B=1. The depth/modulus distinction is correct in general, but the chosen proper-GL₂ example does not distinguish them. |
| b:F03, p=0 source scope | Repaired. README:215: “which require p>0; the case p=0 is admitted here and its growth bound is treated in §0.2”. | bplzz line 401–407 assumes p>0. At p=0, E₀(w)=1−w and \\|E₀(w)\\|≤e^\\|w\\|. Empty set sum=0; integer nonzero points give divergent harmonic sum. |

Locations below are in packages/AutomorphicSpectralTheoryPartII unless another repository-relative path is given.

## Verified sound

The complete README (1,575 lines) and Suggested.lean (116 lines) were read. There are 63 numbered mathematical targets, 199 Check bullets, and 10 Lean declarations: seven definitions and three theorems. The actual targets are section headings, not bold target statements; the bold supplier targets are audited separately below. Each numbered target has a computation row. The tables are tests of the statements, not proofs of their unrestricted general forms.

### Lean declaration inventory and context

All ten declarations are in `TauCetiRoadmap.AutomorphicSpectralTheoryPartII`, Layer 0. There is no section `variable` or `include` block. All norm, topology, scalar and finite-product instances are the native ones on ℂ and `Fin n → ℂ`. The supplied elaborated signatures were compared individually with the source and README. No lost binder was found. No Lean command was run.

| Declaration; Lean line; README section | Variables and hypotheses retained in elaborated type | Instances; computed sides | Result/change |
|---|---|---|---|
| HasRankBound; 44; 0.1 | Λ:Set ℂ, p:ℕ | Λ=∅: sum 0 at p=0; Λ=ℤ: p=0 gives divergent 2Σ1/n, p=1 gives π²/3; Λ={1/(n+1)}: summands (n+1)^(p+1) do not tend to 0. | No lost finiteness hypothesis; 0 excluded explicitly. |
| elementaryFactor; 48; 0.2 | p:ℕ,w:ℂ | p=0,1,2 at w=2 give −1,−e²,−e⁴; w=0 gives 1 in each case; w=1 gives 0 with derivatives −1,−e,−e^(3/2). | Empty exponent sum and positive denominators correct. |
| canonicalProduct; 53; 0.2 | Λ,p,z; classical membership decision | ∅ gives 1 even at 0; {0} gives z; {0,2},p=0 gives z−z²/2, derivatives 1 at 0 and −1 at 2. | No duplicate origin or zero denominator. Definition is total; theorem imposes summability. |
| partialCanonicalProduct; 60; 0.2 | Λ,p,s:Finset(nonzero members of Λ),z | Λ={0,1,2},p=0,z=3: empty s gives 3; {1} gives −6; {1,2} gives 3, independently of multiplication order. | Finite-subset directed system correct. |
| HasFiniteEntireOrder; 68; 0.2 | ψ:ℂ→ℂ | ψ=0: 0≤e; ψ=1: 1≤e with C=1,d=0; ψ=e^(z²): norm≤e^\|z\|²≤e^(1+\|z\|)²; ψ=e^(e^z): log norm=e^x exceeds C(1+x)^d. | Holomorphy is deliberately separate. |
| HasRapidVerticalDecay; 72; 0.3 | implicit n:ℕ,ν:(Fin n→ℂ)→ℂ | n=0: norm z=0 and weight=1; ν=c bounded by \|c\|. n=1: e^(z²) has norm e^(x²−y²); e^(−z²) at iy has norm e^y², unbounded for r=0. | Native sup norm is equivalent to the prose Euclidean norms. |
| affineSpectralLattice; 78; 0.3 | implicit n,k; a and b:Fin k→(Fin n→ℂ) | k=0 gives {a}; a=1/2,b=1 gives 1/2+ℤ; repeated b=(1,1) has coefficient kernel (1,−1). | Independence is in the theorem, not silently assumed by this total range definition. |
| finite_rank_weierstrass_product; 85; 0.2 | Λ,p,hΛ:HasRankBound Λ p | Empty set: limit 1, zero set ∅, derivative clause empty. Λ={0,1},p=0: eventual product z(1−z), roots 0,1, derivatives 1,−1. | All conjuncts match README. Global estimate follows from log\|E_p(w)\|≤C_p\|w\|^(p+1), summed over Λ, with the origin absorbed. No one-tactic proof at the pins. |
| polynomial_zero_fiber_interpolation; 98; 0.3 | n,q:MvPolynomial(Fin n)ℂ,ψ,hψ:Differentiable ℂ ψ,horder | n=0 gives one point and ν=0 or 1 according to ψ(q)=0. ψ=0 gives identical zero sets. q=z,ψ=z: ν=z e^(z²) has zero set {0}, and at iy weighted norm is (1+\|y\|)^r\|y\|e^(−y²). | Both directions of zero equivalence tested; zero/constant q included. Large odd damping exponent gives the required negative leading term in imaginary directions. |
| affine_lattice_interpolation; 108; 0.3 | n,k,a,b,hb:LinearIndependent ℂ b,A:Finset | n=k=0: A=∅ uses ν=0; A={()} uses ν=1. L=ℤ,A={0}: e^(z²)sinc(πz) has values 1 at 0 and 0 at nonzero integers. A={1/2}: e^(z²)sin(πz) is 0 at every integer and e^(1/4) at 1/2. | Complex independence excludes a full real rank-two lattice in ℂ. Exceptional points outside L are allowed. No algebraic stand-in or conclusion in the hypothesis. |

The source product's uniform estimate can be checked without an elaborator: on |w|≤1/2 the logarithmic remainder starts at degree p+1; on |w|≥1/2 each lower power is bounded by a constant times |w|^(p+1). At p=0, log|1−w|≤|w|. The rank sum then bounds the product globally. The interpolation proof uses exp(Σz_j^(2q₀)) with q₀ odd and large: its real part has leading term −Σy_j^(2q₀) on each bounded-real strip. These are substantive analytic conclusions, not padding.

### Target-by-target mathematical tests

The common context is a connected reductive group over a number field, complex coefficients, compatible Haar measures, and fixed levels where asserted. Fields of characteristic 2 or 3, the zero coefficient ring, inseparable number-field extensions, and nonreduced bases are outside these binders; they are not omitted valid instances. Finite residue cardinalities 2 and 3 remain allowed. Empty supports, zero-dimensional parameter spaces, trivial groups, zero vectors, compact/noncompact centres and noncommutative actions are tested below. “Retain” means the listed tests reveal no further defect.

| Target | Instances and computed values on the two sides | Result/change |
|---|---|---|
| 0.1 finite rank | ∅: sum 0/rank 0. ℤ: harmonic sum ∞ versus inverse-square sum π²/3/rank 1. Reciprocal integers give terms (n+1)^(p+1)→∞. | Retain; finitely many points of norm<1 handle increasing p. |
| 0.2 products and order | E₀(2)=−1,E₁(2)=−e²,E₂(2)=−e⁴. Λ={0,1}: product z−z², derivatives 1,−1. At z=3, Λ={0,1,2} partial products 3,−6,3. exp(exp x) has log magnitude e^x versus polynomial bound C(1+x)^d. | Retain. |
| 0.3 vertical interpolation | At iy, Gaussian norm e^(−y²), wrong-sign Gaussian e^y². Damped sinc has values 1,0 at 0,1. n=0 has one evaluation, hence ν=0/1. Repeated generators yield coefficient relation (1,−1)↦0. | Retain. In the dimension-zero, empty-exception Check the available vanishing affine function is the zero function. |
| 0.4 real forms | Split G_m: W=1,θ={1},Y={0}. U(1): θ={−1},plus-space 0,Y=ℤ. Matrices [[1,n],[0,−1]] square to I for every n∈ℤ. SU₂: θ={±1} but θ_G={−1}. | Finite coset, not all involutions; retain. |
| 0.5 moderate symbols | exp(x+iy) has norm e^x≤e^M; exp(−(iy)²)=e^y². On Y=ℤ, e^n/(1+n)^d→∞. For z², r=−2 supremum 1 versus r=−1 supremum ∞. | a:F04 repaired. |
| 0.6 rapid symbols | Gaussian weighted vertical norm tends to 0 for every r; constant 1 has r=1 norm 1+\|y\|→∞. In dimension 0 every seminorm is \|c\|. | Retain all-r quantifier and explicit 1∈Θ topology hypothesis. |
| 0.7 sharp symbols | Split torus has only one restriction stratum. U(1): constant 1 is nonzero on infinitely many integers; damped sinc takes 1 at 0 and 0 elsewhere on ℤ. Product with any moderate symbol keeps zero values 0. | Retain nonunital algebra and module law. |
| 0.8 sharp interpolation | U(1),a=0: damped sinc gives 1; a=1/2: e^(z²)sin(πz) gives e^(1/4), divided by that value gives 1. Product over a finite W-orbit multiplies nonzero values, hence remains nonzero. | Retain. |
| 0.9 differences | t₁z=z−1; t₁t₂z=z−3=t₃z. Divided difference (f(z)−f(−z))/z gives 2 for f=z and 0 for f=1. Division alone sends 1 to 1/z. | Retain pullback order and pole restriction. |
| 0.10 extension | For f=z²+z, divided difference is 2 including at 0=2f′(0). Translation by 1 increases needed real-strip width by at most 1. For f=1, f/z has a pole; vanishing hypothesis excludes it. | Retain real-form-coset restriction on the second estimate. |
| 1.1 real Schwartz | On ℝ₊, e^(−sqrt(1+(log t)²)) behaves like t⁻¹ at infinity; multiplying by t² gives growth like t, so it is not Nash Schwartz. On a compact group smooth derivatives have finite maxima; on the trivial group S=ℂ. | Retain compact-centre distinction; carrier imported from AF. |
| 1.2 integrated action | On ℝ, integration by parts gives ∫−f′e^(itx)=it∫fe^(itx), factors i and 2i. At t=0, f=e^(−πx²) gives scalar 1. Trivial group convolution gives ab and action a(bv)=(ab)v. | Retain. Plancherel with every π(f)=0 gives norm²=0. |
| 1.3 rapid multipliers | Split torus, character s: transform of μ⋆f is μ(s)F(s); F(s)=2 gives 2μ(s). For f=0 both sides 0. Identity-component covering has kernel {(z,z⁻¹):z∈Z⁰∩G_der⁰}. | Retain W-invariance and compact-domain support restriction. |
| 1.4 tensor character | Weight +1 torus: δ(z)=z+1 and t_−1z=z+1, giving annihilator 0. t₁z=z−1 would leave 2. Weight 0 gives unchanged z. | Retain corrected sign. |
| 1.5 generic tensor | Weights ±1 produce characters α±1; their Weyl squares differ by 4α and collide at α=0. Trivial tensor factor has just the original character. | Retain exceptional-parameter exclusion only for semisimplicity. |
| 1.6 rapid estimates | μ=0 gives norm 0 and bound 0. On trivial mass-one group, norm\|μf\|=\|μ\|\|f\|. For SU₂, actual parameters ±(n+1) exclude 0 although Y contains it. | Retain containment rather than false equality. |
| 1.7 moderate multipliers | μ=1 sends f↦f; μ=0 sends f↦0. Trivial group: μ(ab)=(μa)b=a(μb). On SU₂ the even damped sinc is 1 at 0 but 0 at every actual nonzero integral infinitesimal character. | Retain noninjective symbol action; no classification asserted. |
| 1.8 detecting types | Split one-dimensional torus has fixed trivial connected compact type for all split twists s, an infinite parameter family. Sharp U(1) sinc retains only integer 0. SL₂ limit types ±1 must be included at parameter 0. | Retain finite type-set conclusion, not finite dual. |
| 1.9 adelic stages | C=∅ gives 0; C=JxJ⊔JyJ gives two copies; C={1},J≠1 gives 0 because nonzero value would propagate outside C. Convolution 1_K*1_{KaK} has support KaK. The Schwartz function e^(−x²−y²+xy/2) has infinitely many independent x-derivative coefficient functions in y. | b:F01 support repair holds; completed tensor needed. |
| 2.1 weights | w=1 has C_U=1. w(t)=e^t under t↦2t gives ratio e^t→∞. A measurable weight between 1 and 2 has translate ratio between 1/2 and 2, without any derivative. | Retain measurable comparable weights. |
| 2.2 Franke weights | Torus d_a(t)=t^a: d₀=1,d_−a=t⁻ᵃ,d_(a+b)=t^(a+b). On t≥1, a≤b gives t^a≤t^b. Rescaling representatives by 2 makes product 4d_(a+b), not 2d_(a+b). | Retain comparison classes, not representative equalities. |
| 2.3 depths/moduli | GL₂ root and modulus both \|a\|; at \|a\|=4 both 4. P=Q has no root minimum and δ=exp(0)=1. Degree-two scalar restriction: norm value 4, relative root coordinate sqrt(4)=2. GL₃ diag(t²,t,1): minimum t versus modulus t⁴. | S01. Relative-root normalization otherwise matches source. |
| 2.4 quotient Ξ | On compact quotient, volume of xU lies between positive constants. Scaling measure by c scales Ξ by c⁻¹ᐟ². Modular cusp: volume∼1/y gives Ξ∼sqrt(y); Ξ²σ⁻ᵈ dx has tail dy/[y(1+log y)^d], finite for d>1. | Retain. |
| 2.5 SLF | Trivial representation has every fixed stage ℂ and transitions id. Map z↦2z sends radius-1 disc to radius-2 disc. Zero map ℂ→ℂ has kernel ℂ, image 0, quotient ℂ/ℂ=0. | Retain quotient-to-image correction; no embedding of ℂ into 0. |
| 2.6 weighted L² | On ℝ, φ=(1+\|x\|)⁻¹ has norm²=2; weight (1+\|x\|)² gives infinite integral. Franke p=2 gives w=4 and norm 2‖φ‖₂, while w=2 would give sqrt(2)‖φ‖₂. Changing one point changes point value 0→1 but AE class unchanged. | Retain inclusion direction and smooth representative. |
| 2.7 Sobolev/smoothing | One point, mass 1, weight w: q(φ)=sqrt(w)\|φ\| and Ξw⁻¹ᐟ²=w⁻¹ᐟ², product \|φ\|. Rescale w by 4: factors 2 and 1/2 cancel. Functional c·evaluation regularizes to the reciprocal-weight vector with the prescribed conjugation. | a:F03 repaired; no weight-independent seminorm claimed. |
| 2.8 nuclear inclusion | Circle Fourier modes: a Sobolev loss k>1 gives summable singular values (1+n²)^(-k/2). At k=0 they are all 1 and their sum diverges. | Smooth topology essential; retain. |
| 2.9 zeroth spaces | Discontinuous compact indicator has height seminorm finite but uniform translate difference 1. Continuous compact bump belongs to both spaces. Tail n⁻² has N=3 seminorm n→∞. | Retain distinction between measurable and continuous spaces. |
| 2.10 quotient S | Compact quotient has bounded height and gives C∞ at each level. Compact smooth support makes every N,D seminorm finite. Tail y⁻ᵃ at N=a+1 gives y→∞. | S04 moves the duplicate C-density API to §2.11. Retain all derivatives and all decay exponents. |
| 2.11 quotient C | Compact quotient gives C=S=C∞. Tail Ξσ⁻ᵃ has normalized seminorm σ^(d−a), unbounded when d>a. Tail Ξe^(−sqrt(σ)) has σ^d e^(−sqrt(σ))→0 but multiplied by n grows without bound. | Retain logarithmic versus algebraic decay. |
| 2.12 measures | cδ_y has norm \|c\|/w(y). For x≠y and w=1, norm(δ_x−δ_y)=2. On compact quotient all finite measures qualify; derivative of δ is not a measure. | a:F02 repaired; weak convolution used before smoothing. |
| 2.13 uniform growth | Constant 1 has derivative 0 for nonconstant monomials and supremum 1. (y∂_y)^k e^(iy²) has leading term (2i)^k y^(2k)e^(iy²), so no common N. Compact approximants to 1 have sup error at least 1, but with extra n⁻¹ tail weight that error tends to 0. | Retain common exponent and nonstrict exponent union. |
| 2.14 relative S_w | w=1 removes r-dependence and gives T. w=n forces n^(r−N)\|φ\| bounded for all r, hence S; φ=1 fails at r=N+1. For μ=δ_y, compact f gives bounded w on y(supp f)⁻¹, hence all w^r absorbed by constants. | a:F02 repaired route is acyclic. |
| 2.15 tensors | One-point factors give ℂ⊗̂ℂ=ℂ and (a⊗b)↦ab. Zero factor gives 0. The two-variable Gaussian with mixed xy term has infinite tensor rank, though it is in the completion. | Retain completed topology and product level. |
| 2.16 CT/EP | P=Q gives CT=EP=id and δ=1. On mass-one compact quotient, constants pair to 1 on each side; scaling only one measure yields 2 versus 1. Compact support intersects a discrete fibre finitely; P=Q contributes exactly φ(x), φ=0 contributes 0. | Retain measure-normalized adjunction. |
| 2.17 approximation | P=Q identity model has difference 0 (handled separately). Cusp φ=y^a e^(−2πy)e^(2πix) has CT=0; y^r\|φ\|→0 for every fixed r. A constant φ has φ−CTφ=0 even though φ itself has no decay. | Retain depth estimate on the difference and fixed-N quantifier. |
| 2.18 weighted graph | Rank-zero parabolic set: product of proper CT factors is empty, graph is φ↦φ. For w=w′=1 the map is identity and its adjoint sum is identity. On a nonzero cusp vector, all proper CTs are 0 while the retained identity component is φ≠0. | Retain identity component and both weight directions. |
| 3.1 relative characters | One-dimensional B(u,v)=u conj(v), A=a: orthonormal sum=a; replacing basis vector by 2 gives 4a. Rephasing by i leaves a unchanged. Zero A gives 0. | Retain conjugate tensor and orthonormality. |
| 3.2 factorization | Scalars A=2,T=i give B(AT,1)=2i=B(2,T*), since T*=−i; using T gives −2i. For I(λ,x)=e^(λx), g=1_[0,1], λ=1: adjoint e−1=I(−1,g*), while I(1,g*)=1−e⁻¹. | Mathematical formula retains corrected adjoint; S03 separates its supplier. |
| 3.3 support spaces | H=ℂ² with orthogonal e₁,e₂: P_{1}(2e₁+3e₂)=2e₁; P_∅=0,P_all=id. For circle weight 2+cos x, integral of 1 times conjugate(e^(ix)) times weight is 1/2, although unweighted integral is 0. | General-weight support is annihilator support, not weighted orthogonality. |
| 3.4 projections | On ℂ², P₁P₂=0=P_∅ and P₁+P₂=id. In ℓ², Σe_n/n converges unconditionally with norm² π²/6, but sum of norms Σ1/n diverges. | Retain stronger-topology requirement for absolute sums. |
| 3.5 regular data | Normalized GL₂ torus datum χ⊗χ has stabilizer size 2; distinct normalized characters have stabilizer size 1. M=G has relative Weyl group {1}. | Retain only for normalized representatives. See S02's convention separation; arbitrary norm-twisted full Hecke characters are not normalized BPCZ representatives. |
| 3.6 regular CT | δ=4 gives δ^(1−1/2)=2 and δ^(0−1/2)=1/2. P=G gives δ=1 and CT=id. On a compact torus the C and S seminorms are equivalent. | Retain open half-plane, no assertion at its boundary. |
| 3.7 inversion | Mass-one compact torus: pairing e_n with e_m is 1 if n=m and 0 otherwise; inversion returns e_n. φ=0 gives every coefficient 0 and integral 0. A vector in a disjoint support block integrates to 0, not that vector. | Retain (HP) and regularity, full a_P* in this layer. |
| 3.8 kernels | Trivial group: K_f=f(1). Circle f=e_−1: K(x,y)=e₁(x)e_−1(y), so integration sends e₁ to e₁ and 1 to 0. f=e₁ instead retains e_−1. | Retain kernel sign and δ⁻¹ᐟ² central normalization; S03. |
| 3.9 kernel bounds | δ_y has weighted norm 1/w(y). On one mass-one point, q(z)=\|z\|/w gives q(K)=\|f\|/w, exactly p(f)/w. Constant rescaling w↦cw cancels in w(x)/w(y). | Retain N₀ before w,q and H_P=0 restriction for K⁰. |
| 3.10 grouped expansion | Circle D=(2π)⁻¹∂, f=e_−1,Y=iD−1: Ye_−1=0 and R(Y)f=0, so 0≤p(0)=0. Wrong conjugation of Ye₁ gives 2≤0. With Y=D, both kernel coefficient and R(D)f coefficient are −i. | Retain complex-linear derivative convention and grouped absolute value; S03. |
| 4.1 T-characters | T=all places gives empty tensor ℂ and no finite equations. Laurent generator T evaluated at 2 gives 2, at 3 gives 3; unit gives 1. S₃ K-fixed vector goes to (1,−2,1) under (23), bi-K averaging to (−1/2,−1/2,1). | a:F01 repaired. |
| 4.2 CAP | Torus has 0 proper parabolics, so existential CAP=false. GL₂ induction of two Hecke characters supplies one Borel witness. T=all places makes the local matching conjunction true on every proper cuspidal witness. | Retain fixed inner form and distinction from occurrence. |
| 4.3 mixed multipliers | Pure scalar values 2 and 3 give 6; zero factor gives 0. Compact U(1) unit symbol has infinitely many nonzero lattice restrictions, so 1⊗h is excluded unless the sharp factor permits it. | Retain nonunital tensor action and fixed level. |
| 4.4 quasi-cuspidal | Zero R(f) gives (1−P_cusp)R(f)=0. Anisotropic modulo centre has P_cusp=id. GL₂ constant residual vector is sent to (∫f)·1≠0 for positive nonzero compact f, while P_cusp1=0. | Retain full Hilbert-domain condition. |
| 4.5 typicality | Compact torus: Casimir(0)=Casimir(1)=0, central differentials 0 and 1 differ; typicality at 0 retains only 0. A zero central quotient contributes no condition; unequal derived Casimir values still fail. | Retain two conditions; relative central quotient must be fixed as in S02. |
| 4.6 counting | If N(R)≤C(1+R)^d, dyadic shells contribute ≤C′2^{j(d−p−1)}, summable for p+1>d. A repeated eigenvalue λ counts m times spectrally but gives one zero of the interpolation set. Derived torus group has Casimir set {0}. | Retain multiplicity versus zero-set distinction and conjugated levels. |
| 4.7 typical finiteness | Compact torus target differential 0 cuts lattice ℤ to {0}; without the central cut, every integer survives despite Casimir 0. A finite target Casimir set with bound R yields at most C(1+R)^d counted derived occurrences. | Retain fixed finite level/types; S02 fixes the remaining central space. |
| 4.8 annihilators | Bad Casimir c=2,target q=3: q−2 gives 0 and 1 respectively, preserved as zero/nonzero by damping. Compact central lattice factor distinguishes 0 from 1 while both derived values are 0. Empty bad set uses 1 before multiplying the sharp seed. | Retain all-complex-parameter vanishing; S02. |
| 4.9 finite surviving blocks | A split inducing line has infinitely many s even when there is only one Levi datum. Killing a datum gives μ(χ_{σ_s})=0 for every s; a finite list of typical data gives a finite sum of entire blocks, not finitely many s. | Retain f-independent block list. |
| 5.1 occurrence | One common parameter test: equations s=0 and s=1 have no simultaneous solution, although each separately does. For G=M=G_m,T=all, absolute a_G allows s=1 to shift character 0→1, whereas relative a_G^G=0 forbids it. | S02; own-datum occurrence uses s=0. |
| 5.2 mixed separation | Seed value 1 and Hecke values 2 at unwanted,3 at target: seed·(h−2) gives 0 and 1. If target lies on the killed family, vanishing forces target value 0, contradicting preservation. W={1}: subtracting the family evaluation at ℓ(α) makes the identity factor exactly 0 on α=α_σ+s. | Retain finite-place separation and sharp seed; S02 parameter convention. |
| 5.3 isolation | Two nonzero target values 2,3 multiply to 6; division by 6 gives 1. On a killed block value 0 remains 0; on target π, value 1 gives π(f). A different parameter in a surviving block may have value 2, whose square 4≠2, so no projection follows. | Retain finite range-block list and scalar normalization. |
| 5.4 non-CAP | If a proper datum contains χ it supplies a CAP witness, contradicting non-CAP. On a full-group target block value 1 preserves R(f); killed cuspidal blocks have value 0. If χ is absent, target eigenspace is 0. | Retain restricted-domain assertion for arbitrary χ. |
| 5.5 admissible preservation | For an absent automorphic π, the two operators may be global R(μ⋆f)=0 and π(μ⋆f)=π(f)≠0 without contradiction: they act on different spaces. Matching Hecke parameters 2=2 gives same spherical character, while 2≠3 separates them. | Retain no automorphy assumption on π. |
| 5.6 GL_n support | {2,3} gives Satake polynomial 1−5T+6T²; {2,2} gives 1−4T+4T². Swapping 2 and 3 changes neither polynomial. n=1 has no proper Levi and reduces to its full-group character. | Retain multiset uniqueness, including multiplicities and twists. |
| 5.7 refined data | PGL₂ q(λ)=λ²−1/4: at λ=it it is −t²−1/4, at residual λ=1/2 it is 0; at t=0 the first is −1/4. Residual parameter 1/2 still occurs in the coarse Borel family. | Retain conditional counting input and one-way separation. |

### Headline coverage and padding

The three statable analytic headlines are the finite-rank product theorem (§0.2) and the polynomial-fibre and affine-lattice interpolation theorems (§0.3). All three appear in Suggested.lean with their actual objects and hypotheses. All seven definitions are used by those headlines. None of the three theorems is a definition unfolding, boundary example, or one-library-lemma consequence: the global growth bound and the two rapid interpolation constructions remain substantive conclusions.

The remaining headline families are explicitly named in the module docstring, with the missing carriers:

| README headline | Docstring coverage / carrier still required |
|---|---|
| 0.8 sharp W-invariant interpolation | Real-form spectral strips and symbol algebras. |
| 1.3–1.8 real multipliers, rapid estimates and finite type detection | Reductive-group Schwartz algebra and Casselman–Wallach representations. |
| 2.7–2.8 Sobolev evaluation and nuclear inclusions | Smooth weighted quotient representations and locally convex nuclear maps. |
| 2.15–2.18 nuclear tensors and weighted constant-term decomposition | Quotient Schwartz spaces, completed projective tensor and constant terms. |
| 3.1–3.2 relative characters and factorization | Smooth automorphic induced representations and their completed tensors. |
| 3.3–3.4 support projections and summability | Weighted cuspidal-support spaces. |
| 3.6 regular constant-term holomorphy | Regular cuspidal data and Levi quotient spaces. |
| 3.7 inversion under hereditary (HP) | Schwartz-valued Eisenstein packets and normalized intertwiners. |
| 3.8–3.10 kernels and grouped expansion | Quotient kernels and discrete inducing spaces. |
| 4.6–4.7 counting and typical finiteness | Cuspidal representations with level, type and derived Casimir parameters. |
| 4.8–4.9 annihilators and finite surviving components | Induced families and their Schwartz action. |
| 5.2–5.3 mixed separation and normalized isolation | Mixed multipliers and the cuspidal-support Hilbert decomposition. |
| 5.4–5.5 non-CAP isolation and preservation | CAP occurrence and fixed-central-character Hilbert representations. |
| 5.6 one GL_n support component | Adelic induction and its support blocks. |
| 5.7 refined conditional isolation | Langlands discrete-data decomposition and character equations. |

No substitute theorem on unrelated free predicates was inserted. Native SchwartzMap concerns real normed vector spaces; it does not by itself provide the group or quotient carriers in the table. Searches at both pins found no alternative implementation of these headline carriers. This is a carrier audit, not a claim that keyword search proves mathematical undefinability.

### Bold supplier targets and ownership

The README has six distinct bold mathematical supplier labels, rather than additional bold local targets. Other bold phrases are Check labels, the summary label and bibliography author labels. Each supplier label was resolved at its current permitted version.

| Bold label | Owner and locator | Computed comparison / ownership result |
|---|---|---|
| Preparatory primary factors and locally uniform products | TauCetiRoadmap/GlobalHolomorphicFunctions/README.md:222, preparatory section | E₀(2)=−1; E₁(2)=−e²; empty product 1. The owner supplies normal convergence and zero multiplicities; this package adds the summable-rank global bound. |
| finite order | TauCetiRoadmap/ZerosOfLFunctions/README.md:279; Layer 5.1–5.6 | exp(z) has an integral bound of degree 1 and OrderLE at 1; exp(exp x) has logarithmic magnitude e^x and fails every polynomial bound. The predicate here is the required native specialization, not a competing order theory. |
| Lattice sigma function | TauCetiRoadmap/ModularCurvesPartII/README.md:496, §1.4a | On ℤ+iℤ the origin factor gives σ(0)=0 and σ′(0)=1. This real rank-two lattice cannot be encoded by a complex-independent pair in ℂ; §0.3 deliberately proves a different interpolation statement. |
| GLₙ isobaric sums | TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:271, isobaric-construction | Values 2,3 give 1−5T+6T². Ordered normalized induction and its Langlands quotient are supplied, not reconstructed here. |
| Strong multiplicity one for isobaric sums | Same owner, README.md:2290, AL.3 | {2,3} and {3,2} give the same polynomial; {2,2} gives 1−4T+4T². The owner explicitly retains multiplicities and norm twists and distinguishes support from an arbitrary induced constituent. |
| Smooth projective modules, functions and spectral measure | TauCetiRoadmap/SpectralManifolds/README.md:79, SM3 | The zero map ℂ→ℂ induces 0→0 after quotienting; z↦2z induces a homeomorphism with inverse z/2. SM3 explicitly supplies Fréchet open mapping and closed-subspace quotient topology. |

The following 17 cross-roadmap citation groups were checked by current section/target, not by remembered numbering. Existing roadmaps were read on main; new roadmap suppliers were read through the current-head tool. Revisions of existing roadmaps were not substituted for main.

| Citation group | Resolved supply and boundary |
|---|---|
| AutomorphicSpectralTheory | §§0.11–0.15: nuclear/LF analysis, integration, kernels, vector Schwartz and holomorphy; §§1.5–1.10: compact pseudo-Eisenstein and cuspidal blocks; Layers 2–4: intertwining and spectral data; §§5.1–5.9: Franke weights; §§6.1–6.4: compact multipliers/kernels. The additional generalities are declared gaps, not claimed existing theorems. |
| AutomorphicFormsOnReductiveGroups | §§0.1–0.5, 2.1–2.4, 2.7, 3.4–3.5 and 4.1–4.2 exist. Section 2.7 explicitly supplies the integrated Schwartz action and Dixmier–Malliavin; §4.1 uses probability unipotent quotients. K-type counts, centralizer and tempered-strip refinements remain gaps. |
| AdelicAlgebraicGroups | §§2.1–2.3, 3.1, 3.4–3.6 and 4.6–4.7 exist; absolute character spaces and modulus are explicit. The relative twist convention needs S02. Quotient heights, precise cusp bounds and the central affine lattice remain declared supplements. |
| SmoothRepresentationsOfLocalGroups | SR.1.1–SR.1.3, SR.2.2 and SR.4.1–SR.4.2 exist: compact tests, level Hecke action, modulus/normalized induction and spherical parameters. Complex coefficients supply the positive square root of q, including q=2 and q=3. Exponential twist compatibility remains the declared gap. |
| ReductiveGroups | Main Layer 7 supplies algebraic root data and parabolic structure. The requested real-point covering and components are explicitly separated as a gap. |
| LieGroups | Main RepresentationTheory/LieGroups Layers 6–7 supply compact tori and real forms. Precise Cartan descent/infinitesimal-character compatibility is the named gap. |
| PDE | Main Lane A supplies weak derivatives, Sobolev spaces and embeddings. The compact-chart evaluation/distributional-smoothness interface is explicitly requested as a gap. |
| OperatorTheory | Main SelfAdjointSpectralTheory Parts A–E and OperatorIdeals OI-B29–OI-B41, OI-B84, Part C have the cited carriers. OI-B40 is an ideal inequality with bounded outside factors, not the missing two-Hilbert–Schmidt nuclear-composition theorem. |
| NoncommutativeGeometry | Main N1 explicitly constructs the Hausdorff completed projective tensor, complete-target universal property and Fréchet completeness. The automorphic product comparison here is a specialization with additional estimates. |
| VonNeumannAlgebras | V4.Core has trace-class/HS pairings and trace duality. Its citation of main BanachSpaceTheory B4 supplies the nuclear/trace-class identification, but the requested two-HS composition estimate and locally convex comparison still require the declared supplement. |
| GlobalHolomorphicFunctions | Preparatory primary-product target resolved above. No competing generic primary-product theory is planned here. |
| ZerosOfLFunctions | Standing finite-order convention and Layer 5 resolved above. The genus-one factorization is not used as a substitute for general finite-rank interpolation. |
| ModularCurvesPartII | §1.4a resolved above; cited only to delimit sigma ownership. |
| AutomorphicLFunctionsAndLocalFactors | Preparatory isobaric construction and AL.3 uniqueness resolved above, with twists and multiplicities. |
| SpectralManifolds | SM3 resolved above. No Banach-only open mapping lemma is passed off as the Fréchet theorem. |
| CongruenceSpectralGap | Layers 0–5 exist with positive spectrum, normalization and continuous threshold. They delimit ownership; no congruence gap theorem is rebuilt here. |
| GanGrossPrasadUnitaryGroups | §§6.3–6.4 exist; §6.4 requires transfer-preserving isolation. This package explicitly leaves that additional comparison with the relative-period owner, rather than claiming scalar action proves preservation of transfer. |

Ownership searches used the roadmap grep/show tools, main and Completed, board packages and the available sibling checkouts, by objects including primary products, finite-order interpolation, Nash Schwartz spaces, cuspidal support, nuclear tensors and Hilbert–Schmidt composition. No other accessible Suggested.lean declares any of this package's ten fully qualified names. No competing owner of its finite-rank growth or rapid interpolation headlines was found. BanachSpaceTheory was additionally inspected to distinguish its existing nuclear/trace-class comparison from the composition supplement. No search was made for unavailable, unprovided sibling checkouts.

All 29 declared gap slugs, supplier names, section strings and needs sentences match design/plan.json and the exact-contract README block. None has supplier `none`. Their mathematical uses are conditional contracts. The rapid-semisimple/split-torus, Plancherel/tempered-strip and discrete-data/counting splits now separate the previously conflated inputs. S03 identifies a different remaining compound gap; S02 asks that the fixed-centre parameter convention be explicit in the central-comparison contracts. No finding is based merely on an accepted gap not being implemented yet.

### Pinned APIs, source coverage and policy

The manifest pins match the README: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The following native definitions were read at those pins:

| Pinned declaration | File and defining content inspected |
|---|---|
| SchwartzMap | Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean:75–81: real smoothness and all polynomially weighted iterated derivatives. |
| Differentiable | Mathlib/Analysis/Calculus/FDeriv/Defs.lean:170: differentiability at every point. |
| Complex.exp | Mathlib/Analysis/Complex/Exponential.lean:62: native complex exponential. |
| Multipliable / Summable | Mathlib/Topology/Algebra/InfiniteSum/Defs.lean:106–115: existence of an unconditional finite-subset product/sum limit; Summable is generated additively. No countability is built into the ambient index type. |
| MeasureTheory.Lp | Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:89–91: finite-norm subgroup of almost-everywhere equivalence classes. It does not supply point evaluation. |
| CentroidHom | Mathlib/Algebra/Ring/CentroidHom.lean:56–60: additive map with both multiplication laws. No topological continuity or complex linearity field. |
| MvPolynomial.eval | Mathlib/Algebra/MvPolynomial/Eval.lean:256: ring-homomorphic evaluation at the supplied tuple. |
| Polynomial.eval | Mathlib/Algebra/Polynomial/Eval/Defs.lean:249: specialization of eval₂. |

All 199 Check bullets were read and tested against their section formulas, quantifiers and applicable boundary cases; the computation table records the discriminating models, with S01 and S02 the failed checks. Repeated consequences or scope reminders were not counted as additional independent numerical evidence. The definitions have at least three distinguishing cases when their section Checks and explicitly shared examples are taken together. The corrected S01 instance belongs in the depth/modulus checks.

There are 85 source-line references, representing 79 distinct anchors, across the three legally cached readable works. Each anchor was inspected with its surrounding statement/proof. Numbering was checked against BPLZZ arXiv v3, the published BPCZ pagination and the specified Lapid preprint; no newer numbering was silently substituted. All four works have unique sources.toml entries. Bernstein's settled uncertified entry is the one exception to textual verification. Source defects are recorded below; they are not automatically defects of the package when its statement already corrects them.

The source/README signatures agree on complex coefficients, number-field groups, all retained finite places (including residue cardinalities 2 and 3), fixed finite levels where required, common growth exponents, linear-first pairings, conjugation in the second slot, normalized induction and δ^(−1/2) disintegration. S02 is the remaining absolute/relative parameter mismatch. There is no restriction to good primes in the general library; spherical factors are used only at places where a hyperspecial subgroup is actually part of the datum.

The committed diff contains ten files, all inside packages/AutomorphicSpectralTheoryPartII. Suggested.lean has one import Mathlib, one namespace, one module docstring and a Layer 0 section marker; three theorem declarations use sorry, and all seven definitions have real bodies. There is no set_option, lemma declaration, sorry'd data, admitted example, forbidden diagnostic, computational algorithm, pull-request number or repair narrative in README.md or Suggested.lean.

Read-only mechanical dependency output:

```text
depcheck: 149 roadmaps, 1010 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. This roadmap-level check does not detect the internal section cycle S04. The citation resolver found no unresolved roadmap citation or local Lean name. Its warning that external Lean names were not checked automatically was addressed by reading the actual pinned files listed above; it was not taken as evidence that those APIs are absent.

Audit totals: 10 declarations, 63 numbered targets, six distinct bold mathematical supplier labels, 199 Check bullets, 79 distinct readable source-line anchors, 17 cross-roadmap citation groups, and 29 matched declared contracts. Seven earlier findings were rechecked individually. No Lean build, fresh elaboration, package-source edit, git write or external post was performed.

## Not verifiable

- Bernstein, §§3.4–3.5, pp.685–689: text remains uncertified/paywalled under its settled manifest entry. No new request was made. The corresponding BPCZ applications were checked in the readable text.
- Fresh Lean elaboration: prohibited by the read-only brief. All ten supplied elaborated signatures were compared with the declarations and README; no changed signature needs a rerun because Suggested.lean was not edited.
- The future proofs of the 29 declared contracts are not present merely because their contracts match. Acceptance of results that use them remains conditional on those contracts; S02 and S03 identify specification changes needed before relying on the affected ones.
- Textual inspection and computed models do not certify all estimates of the future automorphic library. The report distinguishes explicit failed instances from source-supported general statements. No missing source was guessed, and no additional reference request is pending.

## Source issues

- **Misprint** in bplzz at Definition 2.3, printed p.9 (bplzz line 414): the source says the growth inequality bounds ν after defining μ; it should be the same function μ throughout; affects nothing.
- **Error** in bplzz at notation before Definition 2.8, printed p.10 (bplzz line 451): the source says all root-datum involutions form a finite set; it should be a finite chosen Weyl descent coset, since rootless rank-two lattices have infinitely many involutions; affects a stated result.
- **Error** in bplzz at Remark 2.16, printed p.12, and Proposition 2.24 proof, printed p.18 (bplzz line 574 and line 840): the source says admissible or tempered characters fill the corresponding torus-lattice union; it should be containment, since compact SU₂ has no infinitesimal character zero; affects the proof.
- **Misprint** in bplzz at Lemma 2.22 proof, printed p.16 (bplzz line 759): the source says the tensor-character polynomial uses t_λ; it should be t_−λ under the defined pullback convention, giving α+λ for tensor weight λ; affects the proof.
- **Gap** in bplzz at Lemma 3.12 proof, printed p.26 (bplzz line 1266): the source says restriction reduces counting to the original derived-group level; it should be a finite union of conjugated levels, after translating a vector to obtain nonzero restriction; affects the proof.
- **Gap** in bplzz at Lemma 3.13 proof, printed p.26 (bplzz line 1271): the source says derived Casimir finiteness implies finiteness of typical representations; it should be supplemented by fixed-level central-character lattice finiteness; affects the proof.
- **Gap** in bplzz at Proposition 3.17 proof, printed p.28 (bplzz line 1376): the source says a separating finite Hecke element supplies the required sharp multiplier; it should be multiplied by a sharp archimedean seed nonzero at the target; affects the proof.
- **Misprint** in bplzz at Theorem 3.19, printed p.29 (bplzz line 1434): the source says its cuspidal-support decomposition is equation 3.9; it should be equation 3.2; affects nothing.
- **Gap** in bplzz at Theorem 3.19 specialization, printed p.29 (bplzz line 1436): the source says strong multiplicity one gives the inducing-support conclusion; it should be specified in its isobaric form, retaining constituent multiplicities and norm twists; affects the proof.
- **Error** in bplzz at Proposition A.1, printed p.43 (bplzz line 2104): the source says an arbitrary rapid entire symbol acts by its infinitesimal-character value; it should be Weyl invariant, so evaluation on a Weyl orbit is defined; affects a stated result.
- **Misprint** in bplzz at Proposition A.1 proof, printed p.45 (bplzz line 2184): the source says central types belong to the derived-group factor and derived types to the central factor; it should be the central Schwartz factor with central types, then the derived factor with derived types; affects the proof.
- **Error** in bpcz at §2.5.4, printed p.210 (bpcz line 1217): the source says every equivariant SLF morphism with closed image is an embedding; it should be an embedding when injective, or an isomorphism from its quotient by the kernel; affects a stated result.
- **Error** in bpcz at §2.5.9, printed p.213 (bpcz line 1333): the source says weighted Radon measures form a continuous Banach representation; it should be locally bounded translation with weak convolution, since distinct weight-one Dirac masses stay distance two apart; affects a stated result.
- **Error** in bpcz at Proposition 2.8.4.3, printed p.229 (bpcz line 2053 and line 2057): the source says the second slot uses conjugate λ and plain inverse pullback; it should be −conjugate λ and conjugate inverse pullback, the operator adjoint under the stated pairing; affects a stated result.
- **Misprint** in bpcz at Corollary 2.9.7.2 proof, printed p.237 (bpcz line 2358): the source says differentiating ψ_s=δ_P^sψ adds (2s−1)ρ_P; it should be 2sρ_P, giving no added term at s=0; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "f09b5758a8103f86ac9761fc87e58d1da512052e", "job": "RT-AutomorphicSpectralTheoryPartII~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
