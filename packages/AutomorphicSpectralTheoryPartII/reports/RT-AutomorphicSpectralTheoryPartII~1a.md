<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1008#issuecomment-6425143716 -->
Red team round 1 pass a (codex) of 7aaaa21

Verdict: needs_changes

1. **F01** (P2) Fixed-level eigenspaces are not invariant under arbitrary convolution

   **Location:** packages/AutomorphicSpectralTheoryPartII/README.md:1213: “The fixed-level χ-part is a closed invariant subspace; convolution by a Schwartz test function acts on it.”

   **Claim:** The fixed-K character space is preserved by the whole Schwartz algebra.

   **Witness:** bplzz line 1102–1104 restricts the action to bi-K tests. In the standard S₃ representation, K=⟨(12)⟩ fixes (1,1,−2), whereas (23) sends it to the non-K-fixed (1,−2,1).

   **Exact repair text:** “The fixed-level χ-part is closed and stable under the bi-K Schwartz algebra. Arbitrary Schwartz convolution is defined on the full automorphic representation and can change the finite level; no G(𝔸)-invariance of its K-fixed subspace is asserted.”

   **Repair test:** For normalized e_K, π(e_K)v=v. The operator π(e_K*δ_(23)*e_K) sends v to (−1/2,−1/2,1), which is K-fixed; π(δ_(23)*e_K)v=(1,−2,1) is not. Compact-open averaging replaces these finite-group operators in the local setting. This restriction agrees with the fixed-level test algebra used in §§4.3 and 5.3.

2. **F02** (P2) Weighted measure smoothing uses a later carrier

   **Location:** packages/AutomorphicSpectralTheoryPartII/README.md:875, 883, 885; 929–941: “R(f)μ belongs to S_w”; “apply the tempered-measure smoothing estimate.”

   **Claim:** Section 2.12 proves smoothing into S_w before that space, its topology and its weighted-L² comparison are defined.

   **Witness:** S_w is defined at line 929. Its proof at line 939 invokes measure smoothing; §2.14 needs §2.13, which needs §2.12. Thus the stated route is 2.12→2.14→2.13→2.12.

   **Exact repair text:** In §2.12 replace the S_w assertion and API bullet by “Convolution is defined weakly against test functions; its uniform-growth estimates are proved in §2.13.” In §2.13 prove the measure-to-uniform-growth estimate directly from §2.7 and polynomial weight comparison. In §2.14 retain the S_w definition and comparisons, then state and prove: “For μ∈T₀ and w bounded above on supp μ, R(f)μ∈S_w for every Schwartz test f; use the already established T smoothing, compact convolution and Dixmier–Malliavin.” Remove the invocation of an earlier S_w smoothing estimate from its proof route.

   **Repair test:** For μ=δ_y and w=1 the order becomes weak measure convolution → smooth function of uniform growth → S₁=T. For w=n_P and μ compactly supported the last step gives S_{n_P}=S. No S_w topology is needed to construct either earlier carrier.

3. **F03** (P3) Sobolev estimate has the wrong printed page

   **Location:** packages/AutomorphicSpectralTheoryPartII/README.md:773: “(2.5.5.4)–(2.5.5.5), p.211”.

   **Claim:** Both formulas occur on printed page 211 of BPCZ.

   **Witness:** bpcz line 1268 gives printed page 212; formulas (2.5.5.4) and (2.5.5.5) occur at lines 1273 and 1275–1277 below that heading.

   **Exact repair text:** Replace “(2.5.5.4)–(2.5.5.5), p.211” with “(2.5.5.4)–(2.5.5.5), p.212”.

   **Repair test:** Both equation numbers and the existing bpcz line 1270 locator now land on the stated printed page.

4. **F04** (P3) Moderate-symbol Checks repeat the definition

   **Location:** packages/AutomorphicSpectralTheoryPartII/README.md:355, 357: “restriction to Y has a single polynomial upper bound”; “this is the moderate vertical growth of Definition 2.3.”

   **Claim:** These are two of the four Checks for the new MΘ construction.

   **Witness:** Both simply specialize the defining quantifiers at line 335. Neither computes a symbol or separates a valid symbol from an invalid one; only the two preceding exponential examples discriminate.

   **Exact repair text:** Replace those two bullets by: “For Θ={−1}, Y=ℤ and μ(z)=exp(z), eⁿ/(1+n)^d→∞ for every d, so μ is not moderate, although it is moderate for Θ={1}.” And: “For Θ={−1}, Y=ℤ and μ(z)=z², the exponent r=−2 gives supremum sup_n n²/(1+|n|)²=1, whereas r=−1 gives an infinite supremum.”

   **Repair test:** The first example distinguishes uniform lattice growth from separate pointwise bounds. The second distinguishes the existential exponent from a prescribed insufficient exponent. All four resulting Checks compute different growth behavior.

## Verified sound

Read all 1,559 README lines and all 116 Suggested.lean lines. The inventory is 63 numbered target sections, 197 Check bullets and 10 Lean declarations (7 definitions, 3 theorems). The README does not mark the numbered targets in bold: its other bold text comprises Summary, Checks, reference keys and supplier target titles. Those supplier titles were also resolved. The tables below record the actual instances, rather than treating elaboration as evidence of truth. A successful finite-dimensional or rank-one test is not a proof of the general target.

There are 73 explicit source-key/line anchors in the README. Their local source passages were inspected, including the supplementary theorem/equation locators in those passages; R03 records the incorrect page. Bernstein remains uncertified. The 197 Check bullets were read and tested with the models grouped by section below; statements that merely repeat quantifiers have no separate numerical test. R04 records the consequential shortage of discriminating Checks for a definition. No new missing-text request is needed.

### Lean declaration context and adversarial computations

All declarations are in `TauCetiRoadmap.AutomorphicSpectralTheoryPartII`, Layer 0. There is no surrounding `variable` or `include` block. The context column lists every explicit mathematical binder; all topological, normed and complex structures are the native instances on ℂ and its finite products. The supplied elaborated signatures were compared with the source and README; none of the ten loses a binder. No elaboration was rerun in this read-only pass.

| Declaration; README section; Lean line | Variable/instance context | Instances and computed values on both sides | Result/change |
|---|---|---|---|
| HasRankBound; 0.1; 44 | Λ : Set ℂ, p : ℕ | ∅: sum=0, hence bound at p=0. ℤ: p=0 gives 2Σ1/n=∞; p=1 gives 2Σ1/n²=π²/3. {1/(n+1)} gives Σ(n+1)^(p+1)=∞. | Correct exclusion of zero; countability explicit. |
| elementaryFactor; 0.2; 48 | p : ℕ, w : ℂ | At w=2, p=0,1,2: −1, −e², −e⁴. At w=0: 1. At w=1: 0; derivatives −1, −e, −e^(3/2). | Empty sum and denominators j+1 are correct. |
| canonicalProduct; 0.2; 53 | Λ : Set ℂ, p : ℕ, z : ℂ; classical membership | ∅ gives 1 even at z=0. {0} gives z. {0,a}, p=0 gives z(1−z/a); derivatives at 0,a are 1,−1. | No duplicated zero or division by zero. Claims require HasRankBound. |
| partialCanonicalProduct; 0.2; 60 | Λ,p, s : Finset of nonzero members, z | Λ={0,1,2}, p=0,z=3: s=∅ gives 3; s={1} gives −6; s={1,2} gives 3 in either order. | Correct subtype and directed index. |
| HasFiniteEntireOrder; 0.2; 68 | ψ : ℂ→ℂ | ψ=1: 1≤e at C=1,d=0. ψ=e^(z²): magnitude≤e^abs(z)²≤e^(1+abs(z))². ψ=e^(e^z): along x→∞, e^x/(1+x)^d→∞ for every d. | Nonzero constant covered; holomorphy separately required. |
| HasRapidVerticalDecay; 0.3; 72 | implicit n : ℕ; ν : (Fin n→ℂ)→ℂ | n=0: norm=0, weight=1, any constant has bound its magnitude. n=1, ν=e^(z²): magnitude=e^(x²−y²), all polynomial weights bounded for abs(x)≤M. ν=e^(−z²): at iy, magnitude=e^y², unbounded already at r=0. | Actual finite-product sup norm causes no dimension restriction. |
| affineSpectralLattice; 0.3; 78 | implicit n,k; a; b : Fin k→(Fin n→ℂ) | k=0: lattice={a}; n=k=1,a=1/2,b=1: 1/2+ℤ. Repeated b=(1,1) has coefficient kernel (1,−1), while independent b has kernel 0. | Definition intentionally admits dependent b; theorem excludes it explicitly. |
| finite_rank_weierstrass_product; 0.2; 85 | Λ,p,hΛ : HasRankBound Λ p | Empty product=1, zero locus=∅, derivative clause empty. {0,1},p=0: z(1−z), zero locus={0,1}, derivatives 1,−1; finite net eventually equals this polynomial. Its magnitude≤(1+abs(z))²≤e^(2(1+abs(z))). | All five conclusions true in tests. Global fixed-genus estimate is substantive, not padding. |
| polynomial_zero_fiber_interpolation; 0.3; 98 | n,q : MvPolynomial (Fin n) ℂ, ψ,hψ,horder | ψ=0 gives ν=0 and both zero conditions true everywhere. n=0,q=c: choose ν=0 or 1 according as ψ(c)=0 or not. q=z,ψ=z: ν=z e^(z²), zeros exactly {0}; along iy, weighted magnitude=(1+abs(y))^r abs(y)e^(−y²), bounded. | Constant/zero polynomials and rank zero included; no hypothesis contains conclusion. |
| affine_lattice_interpolation; 0.3; 108 | n,k,a,b,hb : LinearIndependent ℂ b,A : Finset | n=k=0: A=∅ admits ν=0; A={()} admits ν=1. n=k=1,a=0,b=1,A={0}: ν=e^(z²)sin(πz)/(πz), ν(0)=1 and ν(m)=0 for nonzero integer m. A={1/2}: ν=e^(z²)sin(πz), ν(1/2)=e^(1/4) and ν(m)=0 for all integers. | Exceptions outside lattice work. No real-full-lattice assertion is smuggled into hb. |

The three native analytic headlines are precisely the last three rows. The other headline groups are sharp invariant interpolation; reductive multipliers and finite-type detection; weighted Sobolev/nuclear inclusions; quotient tensors and constant-term decomposition; relative characters and factorization; support projections; regular constant-term holomorphy; hereditary-HP inversion; kernels and grouped expansion; counting and typicality; archimedean annihilation; mixed separation/global isolation; non-CAP preservation; GLₙ single-support isolation; and conditional refined isolation. Each is named in the module docstring with a missing carrier. None of the three retained theorems is a one-tactic API fact, small-value computation or boundary theorem. The seven definitions are used by those three signatures. No additional statable headline was identified at the supplied pins.

### README target computations

Each row includes the target's definitions, displayed identities, quantifier restrictions and its Check models. Cumulative section hypotheses are G connected reductive over a number field, complex coefficients, the stated Haar normalization, and fixed finite support/level where indicated. “Retain” means no additional defect established by these tests; it does not turn a declared supplier gap into a proved input.

| Target | Instances and computed values | Result/change |
|---|---|---|
| 0.1 finite rank | ∅ sum 0/rank 0; ℤ sum at p=0 is ∞ and at p=1 is π²/3/rank 1; reciprocal positive integers give summands (n+1)^(p+1)→∞. Subsets reduce nonnegative sums; increasing p only risks finitely many points of norm<1. | Retain. |
| 0.2 products/order | E_p(0)=1; E_p(1)=0 with derivatives −1,−e,−e^1.5 for p=0,1,2. ∅ product 1; {0} product z; {0,a},p=0 product z−z²/a, derivatives 1,−1. Λ={0,1,2},z=3 partial values 3,−6,3. 1≤e; exp(z²)≤exp(abs(z)²); exp(exp(x)) exceeds every exp(C(1+x)^d). | Retain origin, finite-subset indexing and genus zero. |
| 0.3 interpolation | ν=z exp(z²) gives exactly the zero fiber of q=z,ψ=z. n=0 admits constants 0/1. ψ=0 gives ν=0; constant q selects whole/empty zero fiber. Damped sinc is 1 at 0 and 0 at nonzero integers. Rank zero lattice is {a}; repeated b vectors have coefficient kernel (1,−1). | Retain complex independence and arbitrary multivariate q. |
| 0.4 involutions | Split Gₘ: W=1,θ={1},Y={0}. U(1): θ={−1},Y=ℤ. Rootless rank two: matrices [[1,n],[0,−1]] square to I for every n, so the unrestricted involution set is infinite. Compact SU₂ realizes only −1, while its real-form coset also contains 1. | Finite coset, not all automorphisms, is essential and present. |
| 0.5 moderate symbols | On abs(Re z)≤M, abs(exp z)≤e^M. At iy, abs(exp(−z²))=e^y², larger than every polynomial. On Y=ℤ, exp(n)/(1+n)^d→∞; z² has p_(−1,M,−2)=1 and p_(−1,M,−1)=∞. Products of z and z have exponents −1−1=−2. | R04 replaces two restatement Checks. |
| 0.6 rapid symbols | exp(z²) has e^(x²−y²) decay on vertical strips; constant 1 has r=1 supremum ∞ in positive dimension. In dimension 0 all seminorms are abs(c), so constants are rapid. Polynomial times exp(z²) still has polynomial×Gaussian decay. | Retain all-r requirement and 1∈Θ for Fréchet claim. |
| 0.7 sharp symbols | Split torus has one Y-stratum, so no additional restriction. Compact U(1) has Y=ℤ: 1 is nonzero on infinitely many strata; damped sinc takes values 1,0,0,… at 0,±1,±2,… . Multiplication by a moderate symbol cannot create a new nonzero stratum. | Correct nonunital module and restriction-support convention. |
| 0.8 sharp interpolation | On U(1), damped sinc at a=0 has μ(a)=1. For a=1/2, exp(z²)sin(πz) vanishes on ℤ and takes e^(1/4) at a; divide by e^(1/4). Finite Weyl product of nonzero orbit values remains nonzero. | Retain finite orbit, no sharp unit assumed. |
| 0.9 differences | t₁(z)=z−1; t₁t₂(z)=z−3=t₃(z). t₁(zf)=(z−1)t₁f differs from zt₁f by −t₁f. (f(z)−f(−z))/z sends z to 2 and 1 to 0; f/z sends 1 to 1/z. | Polynomial-preserving condition excludes spurious pole. |
| 0.10 extension/strips | Divided difference has removable value 2f′(0); for f=z this is 2. Translation t₁ changes a strip bound M to at most M+1. f=1 does not satisfy divisibility by z; f=z gives quotient 1. Extended seminorms can equal ∞ on both sides of a bound. | Retain separate polynomial-preservation and vanishing hypotheses. |
| 1.1 real Schwartz | On ℝ₊, a tail exp(−sqrt(1+log(t)²)) has only fixed power decay in t, so multiplying by t² is unbounded as t→∞. On compact G all smooth derivative suprema are finite; group with one element gives ℂ with norm abs(c). | Imported carrier comparison, not a new generic definition. |
| 1.2 integration | π_t(LX f)=itπ_t(f), giving i,2i at t=1,2; inverse sign gives −i,−2i. Gaussian exp(−πx²) at t=0 integrates to 1 on both constructions. Trivial group: π(f)v=f(1)v, convolution multiplies the two scalar values. | Signs and normalized mass agree. |
| 1.3 rapid multipliers | Split torus Mellin/Fourier–Laplace transform sends the multiplier to multiplication by μ(s). For zero input both transforms are 0; for a character s and transform value 2, output value is 2μ(s). On connected central/derived product the kernel is precisely the intersection of those two specified connected factors. | Retain W-invariance and connected-factor kernel. |
| 1.4 tensor character | Torus with τ weight +1: δ(z)=z+1 and t_−1 z=z+1; annihilator δ(z)−t_−1z=0. Using t₁ instead gives 2≠0. Trivial τ gives shift 0 and δ(z)=z. | Corrects source sign. |
| 1.5 generic tensor decomposition | τ trivial: one weight 0 and one unchanged character α. Two weights ±1 give α±1; their Weyl squares (α+1)²,(α−1)² collide at α=0 since their difference is 4α. | Exceptional locus excluded from semisimplicity, not from continued identities. |
| 1.6 rapid estimates | μ=0 gives both sides 0; trivial group with mass 1 gives abs(μ f)≤abs(f)abs(μ). Compact SU₂ parameters are ±(n+1), n≥0: 0 belongs to the lattice strip but is not realized. | Retain containment, not equality of actual parameters and strips. |
| 1.7 moderate multipliers | μ=1 gives Tf=f; μ=0 gives Tf=0. Scalar convolutions on the trivial group give μ(ab)=(μa)b=a(μb). On SU₂, exp(z²)sin(πz)/(πz), value 1 at 0, vanishes at every realized nonzero integral character. | Noninjectivity of symbol action allowed; no multiplier classification asserted. |
| 1.8 type detection | Split torus has compact K-types fixed while split twists s range over infinitely many values. Compact U(1) sharp sinc keeps only character 0. The conclusion is a finite detecting type set, not a finite representation set. | Retain. |
| 1.9 adelic stages | C=∅ gives 0 copies; two contained J-double cosets give S(G∞)². If C={1} and J nontrivial, no double coset is contained, giving the zero stage. Compact finite support gives finitely many cosets; an infinite-support function is outside every stage. exp(−x²−y²+xy/2) is Schwartz on ℝ² and has infinitely many independent Taylor coefficient functions, hence is not a finite pure-tensor sum. | Previous contained-coset repair verified; completed tensors essential. |
| 2.1 weights | w=1 has C_U=1. n^aσ^b has polynomial translation comparison. On ℝ₊, w(t)=e^t fails even comparison under the singleton translate u=2 since w(2t)/w(t)=e^t→∞. Positive bounded measurable oscillations between 1 and 2 remain weights; no smoothness follows. | General comparable measurable weights retained. |
| 2.2 Franke weights | Split torus character λ=a gives t^a; d_0=1, d_−a=1/d_a, d_(a+b)=d_a d_b. On t≥1, a≤b implies t^a≤t^b. Rescaling a representative by 2 changes equality to comparison (2d_a)(2d_b)=4d_(a+b), not a normalized identity. | Correct use of ≍. |
| 2.3 depths | GL₂ upper Borel at diag(a,1) gives root abs(a). P=Q has empty root set and no minimum, explicitly excluded. Degree-two norm of a diagonal scalar 2 is 4; a relative root requiring the square root is 2, so normalized restriction must use the stated root comparison. | Proper-parabolic and compatible-subgroup hypotheses retained. |
| 2.4 quotient volume | Compact quotient: neighborhood volume bounded above/below, so Ξ≍1. Replacing measure by c times itself sends Ξ to c^(−1/2)Ξ. Modular cusp: vol(xU)≍y^−1, hence Ξ≍sqrt(y); Ξ²σ^−d dx has tail dy/[y(1+log y)^d], finite for d>1. | Existential d, quotient rather than spherical Ξ. |
| 2.5 SLF | Trivial finite action on ℂ gives one Fréchet stage. Map 0:ℂ→0 has closed image but kernel ℂ, so is not an embedding; quotient ℂ/ℂ=0 is. Multiplication by 2 takes unit disk to radius-2 disk and has inverse factor 1/2. | Correct quotient-by-kernel formulation. |
| 2.6 weighted L² | On ℝ, φ=(1+abs(x))^−1 gives unweighted squared integral 2; weight (1+abs(x))² makes integral ∞. Two representatives differing at one point give same AE class but point values 0 and 1. Franke p=2 corresponds to w=4: norm factor 2, whereas w=2 gives sqrt(2). | Weight square and unique smooth representative distinguished. |
| 2.7 Sobolev/smoothing | On one point of mass 1, weighted norm=sqrt(w)abs(φ), Ξ=1; RHS norm×w^−1/2=abs(φ). Evaluation dual has the reciprocal weight. Rescale w by 4: norm factor 2 and inverse square root 1/2 cancel. | Mathematics retained; R03 fixes page. |
| 2.8 nuclear inclusion | On the circle, Fourier mode e_n has Sobolev weight (1+n²)^(k/2); choosing a loss k>1 makes Σ(1+n²)^(−k/2)<∞. The identity on infinite-dimensional L² has singular values all 1, sum ∞. | Smooth topology essential; does not claim zeroth-stage identity nuclear. |
| 2.9 zeroth rapid spaces | Compact interval indicator is bounded/rapid in n but discontinuous, so belongs to S₀ not S₀⁰. A continuous compact-support function lies in both. Tail n^−2 has n³-weighted value n→∞, so is not rapid. Moving an indicator by any small nonzero distance leaves sup difference 1. | Continuity subspace matters for strong translation continuity. |
| 2.10 quotient Schwartz | Compact quotient: n bounded, S=C∞. Compact support gives every height-weighted derivative bounded. Tail n^−a fails weight n^(a+1) with value n→∞. Zero function gives every derivative seminorm 0. | All N,D required; density stated in the correct target topology. |
| 2.11 quotient Harish-Chandra | Compact quotient: Ξ and σ bounded, hence C=S=C∞. Tail Ξσ^−a gives normalized seminorm σ^(d−a), infinite for d>a. Tail Ξexp(−sqrt(σ)) gives σ^d exp(−sqrt(σ)) bounded for every d, but n^NΞexp(−sqrt(σ)) is unbounded in a cusp. | Correct Ξ denominator; C can strictly contain S. |
| 2.12 measures | cδ_y has norm abs(c)/w(y). Distinct unit point masses have distance 2 at weight 1 even as y→x. On a compact quotient all finite measures occur; a derivative of δ is not a finite measure. Pairing at y with function norm w(y) gives dual factor 1/w(y). | No false strong continuity; R02 moves premature S_w conclusion. |
| 2.13 uniform growth | Constant 1 lies in T₁ with seminorms 1,0,0,… . For exp(iy²), (y∂_y)^k has leading factor (2i)^k y^(2k); no fixed N bounds every k. Compact cutoffs differ from 1 by sup 1 in T₁, but by at most R^−ε in an increased height stage outside radius R. | Single N and nonstrict union/density distinction retained. |
| 2.14 relative decay | w=1 removes the r factor: S₁=T. w=n gives n^(r−N); for every desired exponent choose r=N+exponent, yielding S_n=S. Constant 1 has n^(r−N)→∞ when r>N. | Correct quantifier order; R02 repairs construction order. |
| 2.15 tensor product | One-point quotients: ℂ completed-tensor ℂ≅ℂ sends 2⊗3 to 6. Two-point factors give dimensions 2×2=4. The nonseparable Schwartz function in 1.9 lies in the completion but not in the finite tensor span. | Generic completion imported, quotient comparison owned here. |
| 2.16 CT/EP | P=Q gives CT=EP=id and δ=1. For compatible mass-one finite fibers, pairing both sides on constant 1 gives 1=1; scaling only one quotient measure by 2 gives 2≠1; scaling coherently restores 2=2. Compact support gives finitely many nonzero discrete summands at each point. | Adjunction and measure restrictions retained. |
| 2.17 approximation | At a zero constant term φ=exp(−y), height/depth y and invariant derivatives give polynomials in y times exp(−y). For each r, y^(r−N)abs(Dφ) has finite supremum, so the same N works before r. φ=0 gives 0 on both integral and pointwise bounds. | Fixed height loss distinguished from arbitrary derivative-dependent growth. |
| 2.18 graph decomposition | A nonzero cusp form has every proper CT=0; without identity component its graph image is 0, with it the image is (0,φ), norm nonzero. P=Q,w=w′=1 gives identity embedding and identity surjection. | Identity component and opposite weight inequalities retained. |
| 3.1 relative characters | One-dimensional unit vector v and operator a give B(av,v)=a; using 2v gives 4a. Multiplication v↦iv gives B(aiv,iv)=a. f=0 gives tensor and trace 0. Re λ in [−1,1] permits λ=it with arbitrarily large abs(t). | Conjugate tensor factor, ON basis and real-strip quantifiers correct. |
| 3.2 factorization/adjoint | −conj(it)=it, while −conj(1)=−1. On ℝ with g=1_[0,1], character at 1 gives e−1; adjoint at −1 gives e−1, while at +1 gives 1−e^−1. Linear-first B(2i,1)=2i=B(2,−i), but B(2,i)=−2i. | Correct adjoint parameter and slot; Z need not be central. |
| 3.3 support decomposition | Empty support projection 0; full support projection id. In ℂ² with orthogonal coordinates, projection to the first block sends (1,1) to (1,0). A positive form with off-diagonal entry 1/2 gives pairing of coordinate vectors 1/2, so arbitrary weights need not preserve orthogonality. | Orthogonality restricted to the stated central weights. |
| 3.4 projections/sums | Two-coordinate projections satisfy P_XP_Y=P_(X∩Y); disjoint blocks give 0. In ℓ², coefficients 1/n have Σabs(1/n)²<∞ but Σabs(1/n)=∞; Hilbert unconditional convergence alone is not absolute. | Smooth nuclear topology/height loss is necessary and retained. |
| 3.5 regularity | M=G: W(P)=1. GL₂ torus with two equal characters has stabilizer S₂ of size 2; two distinct characters have stabilizer size 1. Different-rank blocks admit no permutation. | Regularity is of datum, not a lone infinitesimal parameter. |
| 3.6 regular CT | δ=4: factor δ^(s−1/2) is 2 at s=1 and 1/2 at s=0. Only s=1 is inside the asserted half-plane; zero boundary is not an assertion. For the torus P=G, δ=1 and CT=id. | Positive half-plane and measure comparison retained. |
| 3.7 wave packets | For a compact torus, pairing characters gives ∫e_n conjugate(e_m)=1 if n=m and 0 otherwise. φ=0 has every coefficient/integral 0. A vector in another orthogonal block has χ expansion 0 rather than itself. | Inversion requires φ∈C_χ; hereditary HP explicitly conditional except supplied GL products. |
| 3.8 kernels | Trivial group: kernel f(1), action f(1)v. Circle f=e_−n gives kernel e_n(x)conjugate(e_n(y)); integral against e_m is δ_nm e_n(x). f=0 gives all kernels 0. δ=4 contributes disintegration factor 1/2. | Smooth kernel representatives and Fourier sign consistent. |
| 3.9 component bounds | One-point quotient, constant weight c: pointwise weight ratio c/c=1, so abs(K)≤p(f). Weighted q on T_c is abs(K)/c, equal to p(f)/c for p=abs(f). Restricting central parameter to H_P=0 removes unbounded central drift. | N₀ precedes w and q; no universal claim off the stated central slice for K⁰ bound. |
| 3.10 grouped expansion | Circle normalized D=(2π)^−1∂_y, Y=iD−1: Y(e_−1)=0; conjugate(Y(e_1))=−2e_−1. Hence placing conjugation outside the complex derivative changes 0 to −2e_−1. Within a two-dimensional K-type, values 1 and −1 sum to 0 before absolute value, versus absolute sum 2. | Correct derivative and grouping retained. |
| 4.1 T-characters | T=all finite places gives H=ℂ. GL₁ Hecke character is Laurent evaluation h(T)↦h(a), unit↦1. Every pure tensor uses finitely many nonunit factors. Fixed-K vector under arbitrary translation can leave the fixed space, as in R01. | R01. |
| 4.2 CAP | Torus has no proper parabolic, hence CAP=false. GL₂ character induced from a cuspidal torus datum gives CAP=true. If complement of T is empty, finite-place comparison is vacuous, but existence of a proper cuspidal datum remains. Changing only χ∞ leaves CAP unchanged. | Independent χ∞ and fixed inner form correctly retained. |
| 4.3 mixed multipliers | Pure factors of values 2 and 3 evaluate to 6; zero factor gives 0. Compact U(1) sharp factor 1 has infinitely many nonzero lattice values and is inadmissible, although Hecke unit evaluates to 1. Finite sum of finite-support tensors still has finite support. | Evaluation descends bilinearly; no implicit sharp unit. |
| 4.4 quasi-cuspidality | f=0 gives (1−P_cusp)R(f)=0. On an anisotropic quotient P_cusp=id, so every f qualifies. On GL₂ a nonnegative test with positive integral acts nontrivially on the residual constant: R(f)1=∫f>0, so it fails the range condition. | Global operator condition, not local CT vanishing. |
| 4.5 typicality | Torus has derived Casimir 0 for every character; distinct central differentials 0 and 1 are still distinguished by γ⁺. When c_M=a_M the central quotient is 0 and the derived condition alone remains. Exact target infinitesimal character satisfies both finite-image conditions. | Neither independent condition omitted. |
| 4.6 Casimir rank | Counting N(R)≤C(1+R)^d gives annular contribution ≤C′2^(j(d−p−1)); summable when p+1>d. Repeating one eigenvalue infinitely often does not enlarge its underlying set but violates multiplicity counting. | Uses stronger supplied count with multiplicity; arbitrary level reduction explicit. |
| 4.7 typical finiteness | Derived-trivial torus has all derived eigenvalues 0; without a central restriction infinitely many Fourier characters remain. Fixing central differential to a finite set intersects a discrete affine lattice in finitely many points; fixed-level finite component characters contribute a finite factor. | Central gap supplies indispensable input rather than a consequence of Casimir alone. |
| 4.8 archimedean annihilation | Bad Casimir c and target a≠c: factor q−c gives 0 and a−c. Empty unwanted set permits product factor 1, but final multiplier still includes sharp seed. Compact torus: derived factor is identically 0, so central interpolation must distinguish unwanted characters. | Every complex twist is annihilated; nonzero seed kept. |
| 4.9 finite survivors | A split torus continuous family has infinitely many parameters inside one coarse component. Finite-type detection and typicality give finitely many component labels, not finitely many twists. At zero f, range=0 within the same f-independent finite list. | Retain coarse range claim. |
| 5.1 occurrence | Datum (G,π) with matching character occurs at s=0. Matching finite places but differing χ∞ fails simultaneous equations. With T all places the finite equations disappear but χ∞ still must match an induced orbit. Two places requiring s=0 and s=1 cannot be satisfied by a single s. | Correct quantifier order and distinction from CAP. |
| 5.2 separation | Full-group Hecke values unwanted=2,target=3: h−2 gives 0,1; multiply by sharp seed value 1 to stay in the mixed algebra. If archimedean characters differ, a separating invariant polynomial gives 0 and nonzero. If target occurs, killing its entire induced family forces value 0 at target, contradicting nonzero normalization. | Nonoccurrence necessary; finitely many places and all complex parameters retained. |
| 5.3 normalized isolation | Target factors 2 and 3 multiply to 6; divide by 6 to get 1. On a matching irreducible π, π(μ⋆f)=1·π(f). On killed blocks scalar=0. A surviving block may have multiplier value 2 at another parameter, so μ² value 4 differs from μ value 2. | Correct range constraint, no projector overclaim or 0/0. |
| 5.4 non-CAP | Torus has CAP=false and no proper support blocks; whole spectrum is cuspidal. GL₂ residual constant comes from a proper torus datum, so its CAP character does not satisfy the hypothesis. If χ has no cuspidal occurrence, the permitted cuspidal eigenspace is 0. | Cuspidal-domain-only alternative for arbitrary χ retained. |
| 5.5 preservation | On prescribed π the scalar equation is 1·π(f)=π(f), even if the global nearly isotypic subspace is 0. Then global R(μ⋆f)=0 and the unrelated local/admissible π action can remain nonzero. | No automorphic-occurrence hypothesis inserted. |
| 5.6 GLₙ support | Satake multiset {2,3} gives (1−2T)(1−3T)=1−5T+6T². {2,2} gives 1−4T+4T². Equality determines multiplicities, while continuous and residual constituents can share the resulting inducing support. | Isobaric, not cuspidal-only, uniqueness imported. |
| 5.7 refined isolation | PGL₂ q(λ)=λ²−1/4: at it, value=−t²−1/4; at residual λ=1/2, value=0. Difference remains −1/4 at t=0. Residual character also occurs in Borel family at 1/2, so retaining it cannot annihilate that entire family. Identical coarse/refined partitions give identical allowed sums. | Additional polynomial discrete counting remains a hypothesis. |

The miscellaneous example blocks reproduce the numerical tests above: U(1) sinc values 1 and 0, split torus one stratum, GL₂ stabilizer sizes 1 and 2, GL₂ cusp algebraic versus logarithmic tails, and mixed-selector values 0,1,6. None contradicts another target. Characteristic-p coefficients, zero coefficient rings, inseparable coefficient extensions and q=1 are outside the stipulated number-field/complex/local-field hypotheses, rather than hidden degenerate instances. Dyadic and triadic places are not excluded: normalized δ at a uniformizer has positive real values 2 or 3 (or their inverses), with square roots in ℂ. A non-quasi-separated scheme/fan is not an object in any target.

### Suppliers, ownership and pins

Checked 18 named roadmap supplier/ownership citations, resolving the named sections and bold target titles against main or the available open head. Object searches used the roadmap service over main and indexed open work, the supplied sibling checkouts, and board packages. Search objects included canonical products/finite-order entire functions, Schwartz multipliers, constant terms, cuspidal projections, Casimir counting, nuclear spaces/projective tensors and Hilbert–Schmidt composition. The namespace and all three headline theorem names had no other Lean match on main or indexed open work; the board namespace occurs only in this package.

| Citation/owner | Resolved locator and inspected supply | Boundary relevant to this package |
|---|---|---|
| AutomorphicSpectralTheory | TauCetiRoadmap/AutomorphicSpectralTheory/README.md:278 (0.11); 969 (1.5); 1030 (1.9); 2312 (4.1); 2726 (5.1); 2962 (6.1) | Generic locally convex analysis, normalized cuspidal support, compact spectral theory and Franke spaces are imported. Weighted quotient and moderate-symbol extensions belong here. Explicit gaps cover stronger comparisons. |
| AutomorphicFormsOnReductiveGroups | TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:145 (0.3); 290 (2.1); 337 (2.2); 364 (2.3); 390 (2.4); 461 (2.7); 553 (3.4); 598 (4.1) | Existing Schwartz carrier/integrated action and induction are not recreated. Additional finite-type and polynomial estimates are declared gaps. |
| AdelicAlgebraicGroups | TauCetiRoadmap/AdelicAlgebraicGroups/README.md:1439 (2.1); 2334 (3.1); 3361 (3.5); 3473 (3.6); 4811 (4.6) | Heights, measures, reduction and compact central character inputs have named owners; additional uniform comparisons have matching gap slugs. |
| SmoothRepresentationsOfLocalGroups | TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:982 (SR.1.1); 1963 (SR.2.2); 3083 (SR.4.1); 3178 (SR.4.2) | Normalized Satake requires a square root of q, available in ℂ also at residue characteristics 2 and 3. Complex exponential-family compatibility remains a declared gap. |
| ReductiveGroups | TauCetiRoadmap/ReductiveGroups/README.md:627, Layer 7 | Algebraic structure/root data imported; real-point components and covering comparison explicitly gap-owned. |
| LieGroups | TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:383 and 407, Layers 6–7 | Maximal compact tori and real forms exist; real Cartan descent compatibility is separately declared. |
| PDE | TauCetiRoadmap/PDE/README.md:223, Lane A | Local Sobolev foundation imported; precise evaluation/regularity adapter is a declared gap. |
| SelfAdjointSpectralTheory | TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/README.md, Parts A–E | Generic spectral calculus stays with this owner. |
| OperatorIdeals | TauCetiRoadmap/OperatorTheory/OperatorIdeals/README.md, OI-B29–OI-B41, OI-B84, Part C | Hilbert–Schmidt/trace-class carriers and column comparisons exist; locally convex nuclear-map compatibility is not assumed from their names. |
| NoncommutativeGeometry | TauCetiRoadmap/NoncommutativeGeometry/README.md:84, N1 | Hausdorff completed projective tensor and universal property imported; quotient tensor isomorphisms remain new applications. |
| VonNeumannAlgebras | TauCetiRoadmap/VonNeumannAlgebras/README.md:514, V4.Core | Trace and Hilbert–Schmidt pairing supplied; the requested norm-controlled composition plus locally convex comparison is declared. BanachSpaceTheory B4 was also inspected for existing nuclear-map ownership. |
| GlobalHolomorphicFunctions | TauCetiRoadmap/GlobalHolomorphicFunctions/README.md:224, Preparatory primary factors and locally uniform products | Product/zero-divisor theory is imported. Fixed-genus rank growth and spectral interpolation remain this package's additional conclusions. |
| ZerosOfLFunctions | TauCetiRoadmap/ZerosOfLFunctions/README.md:280, finite-order convention; Layer 5.1–5.6 | Order-bound predicate and genus-one theory exist; the package only specializes the bound for interpolation. |
| ModularCurvesPartII | TauCetiRoadmap/ModularCurvesPartII/README.md:495, §1.4a, Lattice sigma function | Rank-two sigma theory remains there; not a new target here. |
| AutomorphicLFunctionsAndLocalFactors | TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:269, isobaric-construction; 2290, AL.3, Strong multiplicity one for isobaric sums | Explicitly retains norm twists and multiplicities and identifies support for arbitrary constituents. This is the input used in §5.6. |
| SpectralManifolds | TauCetiRoadmap/SpectralManifolds/README.md:77, SM3 | General Fréchet open mapping and closed quotient topology are explicit; zero map must first be divided by its kernel. |
| CongruenceSpectralGap | TauCetiRoadmap/CongruenceSpectralGap/README.md, Layers 0–5 at supplied head | Ownership exclusion agrees with that head; no congruence-gap theorem is replanned here. |
| GanGrossPrasadUnitaryGroups | TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md:1212 and 1246, §§6.3–6.4 at supplied head | Relative period/trace applications remain there. Transfer preservation is explicitly outside this package; the previously settled ownership issue is not re-raised. |

The pins agree with lake-manifest.json: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Direct pin inspection confirmed:

| Pinned declaration | File/line | Definition actually provides |
|---|---|---|
| SchwartzMap | Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean:75 | Real smoothness and all polynomially weighted iterated-derivative bounds on normed vector spaces; no reductive-group/adelic quotient carrier. |
| Differentiable | Mathlib/Analysis/Calculus/FDeriv/Defs.lean:170 | Differentiability at every point; used over ℂ on native finite products. |
| Complex.exp | Mathlib/Analysis/Complex/Exponential.lean | Native complex exponential; all primary-factor exponentials use it. |
| MvPolynomial.eval | Mathlib/Algebra/MvPolynomial/Eval.lean:256 | Ring-homomorphic evaluation, also for zero/constant polynomials and Fin 0. |
| Polynomial.eval | Mathlib/Algebra/Polynomial/Eval/Defs.lean:249 | Native univariate evaluation for the comparison API. |
| Summable / Multipliable | Mathlib/Topology/Algebra/InfiniteSum/Defs.lean:114 | Unordered finite-subset limits; no enumeration multiplicities. |
| MeasureTheory.Lp | Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:89 | AE classes with finite eLpNorm; not a chosen pointwise smooth function. |
| CentroidHom | Mathlib/Algebra/Ring/CentroidHom.lean:56 | Additive map with left/right multiplication identities; no continuity or complex-linearity field. |

All 26 gap slugs occur in both `packages/AutomorphicSpectralTheoryPartII/design/plan.json` and the README's Exact supplier contracts, with named suppliers and matching needs. They concern identifiable additional estimates or comparison interfaces, not missing names falsely claimed as existing declarations. No supplier is `none`. Their absence from present supplier targets is not a finding. The local proof-order defect R02 is separate from this accepted conditional supply.

Mechanical dependency output, unchanged README:

```text
depcheck: 56 roadmaps, 647 edges, 0 problem(s)
```

No UPWARD or CYCLE line was emitted. This checks inter-roadmap supply, not the section-level issue R02. Citation resolution against main `546d9e4` and the supplied open-head index found no unresolved roadmap/name reference; the table above records the manual semantic checks rather than treating that name resolution as sufficient.

The head diff contains nine files, all inside `packages/AutomorphicSpectralTheoryPartII/`. Suggested.lean has a single `import Mathlib`, one module docstring, the required namespace and layer comment, and docstrings on every declaration. Its only admissions are the three theorem proofs. There are no `lemma`, `set_option`, admitted definitions, free condition fields, foreign roadmap imports or computational algorithms. No policy finding arose from the package's source or docstrings. Only this report and scratch notes were written during this pass.

## Not verifiable

- Bernstein §§3.4–3.5, pp.685–689 is settled as uncertified in sources.toml. Its text was not obtained or guessed. BPCZ's stated applications were checked, but this is not certification of Bernstein's underlying proof.
- No Lean build or fresh `#check` elaboration was run, as required by the read-only brief. The ten precomputed elaborated signatures supplied with this job were used; this report does not claim a new compiler run.
- The 26 declared supplier contracts are future supply. Their ownership, matching declarations and precision were checked; their mathematical implementation is not present and was not certified.
- General truth beyond the recorded tests and inspected source arguments is not established by this pass. In particular, source errors in the following register are not silently treated as published corrections.
- Ownership searches covered main, board packages, the provided sibling checkouts and the available indexed open-roadmap text. No unprovided checkout or unindexed external work was sought. No suspicious instruction found in retrieved text was acted on.
- The text extraction at bplzz line 1323 renders an intersection as a backslash. The printed page 27 was rendered and inspected: it has the correct intersection. This is an extraction defect, excluded from the source-errata register. Other suspect symbolic errata below were checked against rendered pages where necessary.

## Source issues

- **Misprint** in bplzz at Definition 2.3, printed p.9 (bplzz line 414): the source says the growth inequality concerns ν after declaring μ; it should be the inequality for μ; affects nothing.
- **Error** in bplzz at notation before Definition 2.8, printed p.10 (bplzz line 451): the source says all involutions of a root datum form a finite set; it should be a finite chosen real-form coset, since rootless rank two has infinitely many involutions; affects the proof.
- **Error** in bplzz at Remark 2.16, printed p.12 (bplzz line 574): the source says realized infinitesimal characters equal the full union of lattice strips; it should be containment, since compact SU₂ does not realize the singular parameter zero; affects a stated result.
- **Misprint** in bplzz at Lemma 2.22 proof, printed p.16 (bplzz line 759): the source says tensor weight λ contributes t_λz to the annihilator; it should be t_−λz under the stated pullback convention, as the weight-one torus gives z+1; affects the proof.
- **Gap** in bplzz at Lemma 3.13 proof, printed p.26 (bplzz line 1271): the source says finiteness of derived Casimir possibilities directly gives finiteness of typical representations; it should be supplemented by central differential and fixed-level component-character finiteness; affects the proof.
- **Gap** in bplzz at Proposition 3.17 proof, printed p.28 (bplzz line 1376): the source says a bare Hecke separator is an allowed mixed multiplier; it should be multiplied by a sharp archimedean seed nonzero at the target when the sharp algebra lacks a unit; affects the proof.
- **Misprint** in bplzz at Theorem 3.19, printed p.29 (bplzz line 1434): the source says its spectral decomposition is numbered 3.9; it should be the previously displayed cuspidal-support decomposition (3.2); affects nothing.
- **Misprint** in bplzz at Proposition A.1, printed p.43 (bplzz line 2104): the source says an arbitrary rapid symbol can be evaluated on an infinitesimal-character orbit; it should be a Weyl-invariant rapid symbol, as required by the following proof; affects a stated result.
- **Misprint** in bplzz at Proposition A.1 proof, printed p.45 (bplzz line 2184): the source says central K-types index the derived Schwartz factor and derived types index the central factor; it should be central types on the central factor and derived types on the derived factor; affects the proof.
- **Error** in bpcz at §2.5.4 before Lemma 2.5.4.1, printed p.210 (bpcz line 1217): the source says every equivariant closed-image morphism of SLF representations is a topological embedding; it should be injective, or replaced by the map from the quotient by its kernel; affects a stated result.
- **Error** in bpcz at §2.5.9, printed p.213 (bpcz line 1333): the source says all weighted Radon measures form a continuous Banach representation under translation; it should be locally bounded translation, with continuity restricted appropriately, since distinct point masses have distance two; affects a stated result.
- **Misprint** in bpcz at Corollary 2.9.7.2 proof, printed p.237 (bpcz line 2358): the source says differentiating ψ_s=δ_P^sψ contributes (2s−1)ρ_P; it should be 2sρ_P, giving zero additional derivative at s=0; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "7aaaa212599930bd0e273795dff98832d1d8d8e9", "job": "RT-AutomorphicSpectralTheoryPartII~1a", "model": "gpt-6-astra", "worker": "chris-30"} -->
