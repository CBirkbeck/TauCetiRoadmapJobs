<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1008#issuecomment-6400125153 -->
Review (codex) of 7aaaa21

Verdict: accepted
Conditional on the announced gaps: `nash-schwartz-analysis`, `tensor-holomorphy`, `slf-isotypic-sums`, `frechet-bilinear-continuity`, `real-point-root-data`, `real-descent-cartan`, `real-plancherel-characters`, `rapid-semisimple-centre`, `kostant-centralizer`, `generic-tensor-semisimplicity`, `minimal-type-detection`, `k-type-growth`, `quotient-height-comparison`, `cusp-fiber-bounds`, `deep-cusp-uniqueness`, `quotient-neighborhood-volumes`, `cuspidal-data-central-comparison`, `cuspidal-polynomial-counting`, `hereditary-intertwining-bounds`, `discrete-polynomial-counting`, `central-character-affine-lattice`, `satake-exponential-family`, `compact-eisenstein-comparison`, `arthur-factorization-comparison`, `local-sobolev-evaluation`, `hilbert-schmidt-nuclear-composition`

1. **F01** (P3) Weighted evaluation equations are on printed page 212

   **Location:** packages/AutomorphicSpectralTheoryPartII/README.md:773, “(2.5.5.4)–(2.5.5.5), p.211”.

   **Claim:** Both the weighted point-evaluation inequality and the regularized-functional identity occur on printed page 211.

   **Witness:** bpcz line 1268 marks printed page 212; the two equations occur at bpcz lines 1273 and 1275–1277, below that marker.

   **Exact repair:** Change only this locator to “p.212”. Keep the equation numbers and bpcz line 1270. Reopening that page gives both statements, including the reciprocal weight in the second one. The corrected locator supports the same hypotheses and formulas; the mathematics needs no change.

One P3 locator correction; no P1 or P2 findings. Acceptance is conditional on the 26 declared supplier contracts in design/plan.json. The mathematical package and acceptance signatures were not edited.

## Verified sound

### Previous findings checked first

| Previous finding | Repaired passage in packages/AutomorphicSpectralTheoryPartII/README.md | Witness and status |
| --- | --- | --- |
| F01, support/level stages | :575, “indexed by the J-double cosets contained in C”; :595, “For C={1} and J≠{1}, the stage is zero” | **Repaired.** If JxJ meets the complement of C, invariance forces the entire coset's coefficient to be zero. C={1}, J nontrivial: zero contained cosets, zero-dimensional finite factor. C=JxJ⊔JyJ: two contained cosets, two independent Schwartz coefficients. C=∅: zero summands. bpcz lines 1151–1159 supplies arbitrary compact C, rather than an implicitly saturated C. |
| F02, alleged SR.3 Schwartz algebra | :589, “At a finite place this space is C_c∞(G(F_v))” | **Repaired.** The claim of SR.3 ownership is gone. bplzz line 1067 gives C_c∞; SmoothRepresentationsOfLocalGroups SR.3 concerns cuspidal support, Bernstein theory, tempered support and the Iwahori block. Its Bernstein–Zelevinsky Schwartz submodule is a different object. |
| F03, CSG design labels | :17, “CongruenceSpectralGap Layers 0–5” | **Repaired.** TauCetiRoadmap/CongruenceSpectralGap/README.md:136 and :688 have precisely the stated endpoint layer titles. This is a scope deferral, not an imported spectral-gap theorem. |

The repaired support paragraph, all its new Checks, and its downstream uses in §§2.5–2.8, 3.1–3.2 and 4.3 were reviewed again. A real multiplier restricts to zero on the singleton-support zero stage and acts diagonally on the two-coset stage; finite spherical convolution changes the stage in the controlled manner supplied by SR.4. No remaining target indexes by cosets merely meeting C. There is no remaining SR.3 attribution or CSG section label in the four package files.

The previously settled transfer-ownership issue remains settled: this package supplies scalar spectral multipliers and explicitly leaves transfer preservation to the relative-comparison owner. It was not re-raised. The earlier conjugate-derivative repair, integrated-action ownership repair, Fréchet-open-mapping repair and isobaric locator repair were also rechecked against the present supplier text and computed examples below.

### Principles, shape and coverage

Read all 63 numbered target sections, their API bullets, Checks, proof routes and 63 Needs lines. The report's tables emphasize the seeded targets, headlines and repaired passages; additional computations cover the remaining definitions and interfaces. I did not treat the previous repair report's assertions as evidence of mathematical truth, nor inherit an unchecked claim about a current supplier. The preceding review's numerical tests were useful regression cases and were recomputed where used here.

The introduction identifies where AutomorphicSpectralTheory stops. The package extends its compact-test theory to moderate-symbol Schwartz multipliers and arbitrary weighted intermediate quotients. It does not rebuild the parent roadmap, impose a good-prime restriction, or replace general groups with GL_n. GL_n products occur as the unconditional (HP) specialization and the stronger isobaric-uniqueness application. Ramified places remain in the finite set S, with their full local theory; residue characteristics 2 and 3 are allowed over complex coefficients. All source text used was from the supplied legal cache. No copied source passages, executable computational algorithm, sorry'd data or set_option occurs in the package.

The README has the required summary, ownership, conventions, supplier contracts, build explanation, six ordered layers, layer Examples/Dependencies, downstream consumers and references. Definitions have prose API bullets and at least three Checks, with positive, boundary and negative controls; sections with fewer Checks are theorem/comparison targets importing their carriers. The seven Lean definitions are needed by the three analytic headlines. All ten declaration names occur in the README. Metadata is the single topic math.NT. Sources use four distinct lifetime keys; the three readable works have version/pagination records, and Bernstein remains explicitly uncertified.

### Seeded source verification

All 15 specified targets were reopened at their locators. There are no author-flagged unverified locators in the manifest. “Supported” below includes checking the hypotheses and the indicated proof step, not just finding the theorem number. BPLZZ locators refer to arXiv v3, BPCZ to published pagination, and Lapid to the recorded ESI preprint.

| Target | Source text actually read | Comparison with the package |
| --- | --- | --- |
| 0.4 Real-form involutions | bplzz lines 448–460, 506–508, 621–638; §2.2 p.10, §2.3 p.11, Lemma 2.19 pp.13–14 | The finite W-coset, shifted projected lattice and realized-torus subset are distinguished. The package avoids the source's false finiteness assertion for all involutions. The lemma begins on p.13 and finishes on p.14. |
| 0.5 Moderate symbols | bplzz lines 410–415, 463–470; Definitions 2.3/2.8(1), pp.9–10 | The exponent depends on the involution and strip, not each individual lattice point. Replacing open strips by closed strips is equivalent after enlarging M. Integral polynomial bounds are equivalent to some real exponent. |
| 0.8 Sharp orbit interpolation | bplzz lines 428–445, 495–501; Corollary 2.6/Remark 2.7 and Lemma 2.10, pp.9–11 | Finite θ and finite W permit a finite product. Nonvanishing must hold on the whole orbit before that product. The same proof handles finitely many orbits; normalization divides by a nonzero value. |
| 0.9 Difference operators | bplzz lines 642–653, 778–802; §2.4 pp.14,17 | Pullback is by the inverse affine action; reflection denominators and finite sums agree. Polynomial preservation is a separate restriction, not an automatic property of rational localization. |
| 1.2 Schwartz integration | bplzz lines 522–546, 827–855, 923–967; pp.11–12,18–19 | Moderate Fréchet representations admit the integral. Density and supplied continuity identify the imported action. Fourier faithfulness is a declared Plancherel contract, rather than inferred from a scalar identity alone. |
| 1.3 Delorme extension | bplzz lines 2098–2202; Proposition A.1, Lemma A.2, pp.43–45 | Fixed support and finite K-types, completed tensors, finite components and continuity are retained. The package explicitly includes W-invariance, which the proposition's opening line omits but its proof uses. The derived identity component is used in the finite covering. |
| 1.4 Kostant comparison | bplzz lines 737–775; Lemma 2.22 and proof, p.16; lines 945–966, p.19 | Finite-free centralizer and tensor annihilator are imported, with only the rational-difference comparison owned here. With inverse pullback t_λ, the package correctly uses t_{−λ} for tensor weight +λ. See the torus computation and source issue below. |
| 1.7 Moderate multipliers | bplzz lines 548–578, 803–820, 1039–1042; Theorem 2.13 p.12, Proposition 2.24 pp.17–19, Remark 2.26 p.21 | Continuity, K-type preservation and uniqueness agree. The kernel uses actual characters, not all formal lattice points. Centroid laws follow from transform faithfulness and agree with the pinned algebraic carrier. |
| 2.3 Depth functions | bpcz lines 998–1116; §2.4.4, equations (16)–(22), Lemmas 2.4.4.1–2, pp.206–208 | Proper P⊊Q gives a nonempty minimum. The common quotient, inequality direction, compatible subgroup hypothesis and restriction-of-scalars equality agree. Fiber bounds and deep-cusp uniqueness are separately declared supplier contracts. |
| 2.7 Weighted evaluation | bpcz lines 1252–1280; equations (2.5.5.4)–(5), p.212 | Weight measure w dx, inverse square root in evaluation and reciprocal-weight regularization match. Fixed level and arbitrary comparable weight are retained. **R01 corrects the printed page only.** Bernstein was not reopened. |
| 2.15 Nuclear products | bpcz lines 1281–1288, 1402–1414; Proposition 2.5.5.1 p.212, §2.5.12 p.215 | Nuclearity is at fixed level, and the product statement uses product level and completed projective tensor. The intermediate-quotient extension uses the same derivative/weight comparison, with the explicit Nash and tensor imports. No assertion identifies the algebraic tensor with the completion. |
| 3.2 Arthur factorization | bpcz lines 1980–2061; Proposition 2.8.4.3, p.229 | K₀ normal, m≥1, conjugation-invariant Z and factors, and independence from f agree. The package fixes the adjoint as I(−conj λ,g*) and tests it; the extracted source formula loses enough sign/bar information that I do not certify its typography. |
| 4.2 CAP | bplzz lines 1088–1095; Definition 3.4, p.22 | Fixed inner form, proper parabolic, cuspidal inducing data and almost-everywhere away-T condition agree. There is no archimedean condition and no hidden existential quantifier over inner forms. |
| 4.3 Mixed multipliers | bplzz lines 1108–1119; Definition 3.5, pp.22–23 | Algebraic tensor with finite-support spherical Hecke algebra, evaluation and commuting scalar action agree. The package correctly avoids a unit for the sharp factor. |
| 5.4 Non-CAP isolation | bplzz lines 1120–1132, 1428–1458; Theorems 3.6–3.7 p.23, proof p.30 | Whole-L² domain requires non-CAP; arbitrary χ has only the cuspidal-domain assertion. The target character need not occur automorphically. Normalization and range constraint are distinct. |

Also reopened the analytic headline inputs at bplzz lines 395–445, the repaired support locator at bplzz lines 1063–1067 and bpcz lines 1151–1159, and the Lapid (HP)/inversion inputs at lapid lines 799–811, 924–942, 1069–1087 and bpcz lines 2394–2418. The source's special GL setting is not silently promoted: §3.7 retains hereditary (HP), with the unconditional product/restriction-of-scalars case in its supplier contract.

### Computed adversarial evidence

These are discriminating tests, not proofs of the full analytic theorems. The standing category is connected reductive groups over number fields with complex representations. Zero rings, inseparable global fields and nonreduced bases do not inhabit it. Dimension zero, the zero representation, empty supports, noncompact quotients and small residue characteristics do. Let e_n(x)=exp(2πinx) on a mass-one circle and D=(2π)⁻¹d/dx. Finite-group rows test algebraic identities, not an assertion that S₃ is a connected reductive group.

| Statement/interface | Instances tried | Values computed on the relevant sides | Result/change |
| --- | --- | --- | --- |
| Left differentiation and pairing conventions | π_t(x)=exp(itx), t=1,2; u=1,v=i | ∫−f′e^{itx}=it∫fe^{itx}: i,2i; linear-first pairing −i, native ordered pairing i, exchanged native pairing −i | Sound; opposite signs excluded. |
| Normalized induction/central descent | GL₂ upper Borel, abs(a)=4 | δ=4; induction factor 2; descent factor 1/2; product 1 | Sound in conventions, §§3.6,3.8 and supplier modulus. |
| Finite-place normalization | q=2,3,4, vol(K)=1 | δ¹ᐟ²=√2,√3,2 in ℂ; 1_K*1_K=1_K. At vol(K)=2, normalized e_K=(1/2)1_K has square (1/2)1_K | Sound; no prime exclusion. |
| 0.1 Rank bound and least rank | ∅,{0},ℤ; accumulating 1/(n+1) | Nonzero sums 0,0; for ℤ at p=1 the sum is π²/3, at p=0 divergent; accumulation gives summands (n+1)^(p+1), not tending to 0 | Sound; origin excluded explicitly. |
| 0.1 Monotonicity/counting | {2,4}, subset {4}; ℤ | p=0 sums 3/4 and 1/4; p=1 sum 5/16; integer disk count 2⌊R⌋+1 | Sound; endpoint exponent need not match. |
| 0.2 elementaryFactor | p=0,1,2; w=0,1,2 | At 0: 1,1,1; at 1: 0,0,0; at 2: −1,−e²,−e⁴. Derivatives at 1: −1,−e,−e^(3/2) | Sound; no zero denominator. |
| 0.2 partialCanonicalProduct | Λ={0,1,2}, p=0,z=3 | Empty nonzero index: 3; insert 1: −6; insert 2: 3. Reverse multiplication also gives 3 | Sound; finite-set direction and origin factor. |
| 0.2 finite_rank_weierstrass_product | ∅,{0},{0,1},ℤ | Products 1,z,z(1−z),sin(πz)/π respectively; derivatives at prescribed zeros 1 or ±1. For {0,1}, abs(P)≤R+R²≤exp(2(1+R)); for ℤ, abs(P)≤exp(π(1+R)²) | All conjuncts survive; finite products stabilize and the integer product converges normally. |
| 0.2 Finite-order predicate/API | 1,e^{z²},e^{e^z}; sum/product with e^{z³}; pullback z² | Bounds exp(1), exp((1+abs(z))²); log magnitude e^x for third, exceeding every polynomial. Sum ≤2exp((1+R)³), product ≤exp(2(1+R)³); pullback e^{z⁴} has exponent 4 | Sound; holomorphy remains separate. |
| 0.3 Vertical decay | e^{z²},e^{−z²},1 at z=iy; dimension 0 | Magnitudes e^{−y²},e^{y²},1. Polynomial weight r=1 excludes the latter two; dimension 0 seminorm is abs(c) | Sound; rapid quantifier is ∀r. |
| 0.3 polynomial_zero_fiber_interpolation | q=z²,ψ(w)=w−1; ψ=0; n=0 | ν=e^{z⁶}(z²−1): zeros ±1 and ν(0)=−1; Re((x+iy)⁶)=−y⁶+15x²y⁴−15x⁴y²+x⁶. ψ=0 permits ν=0; sole dimension-zero value can be 0 or 1 | Both zero-set directions and bounded-real-part decay hold. |
| 0.3 affine lattice/interpolation | L=ℤ,A={0,1/2}; a=1/2,b=1; k=0; dependent generators | Damped sinc gives 1 at 0, 2e^(1/4)/π at 1/2,0 at nonzero integers. Translated lattice points are 1/2+m; rank zero gives {a}. b=(1,1) has relation 1−1=0 | Sound; off-lattice A allowed, complex independence retained. |
| 0.4 Real-form data | split G_m,U(1),SL₂, rootless rank two | Split: θ={1},Y={0}; compact torus: θ={−1},Y=ℤ. SL₂: ρ−wρ=2∈X*. Matrices [[1,m],[0,−1]] square to I for every integer m | Sound; finite coset excludes infinite all-involutions model. |
| 0.5 Moderate growth | μ=e^z,e^{−z²},z^d; compact-torus lattice | On z=iy magnitudes 1,e^{y²},abs(y)^d. First bounded by e^M on strip; third times (1+abs(y))^(−d)≤1. On ℤ, e^n/(1+abs(n))^d is unbounded for every d | Sound; vertical-only and lattice-uniform conditions differ. |
| 0.6 Rapid ideal and topology | μ=e^{z²},ν=z²,W={±1}; zero dimension | Product on iy is −y²e^{−y²}; every further polynomial weight is bounded. μ(−z)=μ(z). Zero-dimensional seminorms all equal abs(c) | Sound; 1∈Θ supplies compact-open control. |
| 0.7 Sharp support/module | compact torus; μ=damped sinc,ν=e^z | μ(n)=1 for n=0 and 0 otherwise; (νμ)(n) has the same values. Unit has value 1 at infinitely many n | Sound; algebra nonunital. |
| 0.8 Orbit nonvanishing | W={±1}, target 0 and targets ±1/2 | Damped sinc is even, μ(0)=1 and μ(±1/2)=2e^(1/4)/π≠0; Weyl product values are their squares, still nonzero | Sound; finite product and normalization. |
| 0.9 Difference algebra | t₁,z; t₁t₂; s(z)=−z | t₁z=z−1; t₁t₂z=z−3; z·t₁1=z but t₁(z·1)=z−1. Divided difference sends z to 2 and 1 to 0; division alone sends 1 to 1/z | Sound; noncommutation and polynomial-preserving restriction. |
| 0.10 Extension/strip bounds | f=z²+z; e^{−z²} | (f(z)−f(−z))/z=2, including removable value 2f′(0)=2; the latter function has infinite polynomially weighted vertical supremum | Sound; extended seminorms are allowed. |
| 1.1 Real Schwartz comparison | compact group; split torus t=e^x | On compact group all height powers bounded. A logarithmically rapid tail e^{−√abs(x)} has height-weighted size e^{r abs(x)−√abs(x)}→∞ | Sound; Nash versus logarithmic decay separated. |
| 1.2 Integration comparison/faithfulness | trivial representation, Gaussian; point group; π₁,π₂ | ∫e^{−πx²}dx=1 for both actions; point-group action f(1)v; derivative factors i,2i | Sound; density import, not duplicate construction. |
| 1.3 Delorme multiplier | positive split torus in x=log t, μ(z)=e^{z²}, compact f | Gaussian k(x)=(2√π)⁻¹e^{−x²/4} has Laplace transform e^{z²}; transform(k*f)=e^{z²}transform(f), and at z=0 factor 1 | Sound; noncompact output permitted. |
| 1.4 Translated character/annihilator | torus generator X, τ of weight 1, α=2 | δ(X)=X+1 acts as 3; t_{−1}z at 2 is 3, annihilator 3−3=0. Wrong t₁ gives 1, annihilator 3−1=2 | Sound in package; source sign error recorded. |
| 1.5 Generic tensor characters | α=2, weights ±1; collision α=0 under reflection | Values 3,1 have distinct squares 9,1; at α=0 the squares are both 1 | Generic exclusion discriminates; no semisimplicity continuation at collisions. |
| 1.6 Rapid L² estimate | split Fourier line μ=e^{z²}, λ=it; f with transform supported near 0 | Multiplier modulus e^{−t²}≤1 gives norm² ∫e^{−2t²}abs(f̂(t))²≤∫abs(f̂(t))²; zero f gives 0 on both sides | Correct inequality direction and uniform symbol seminorm. |
| 1.7 Centroid/kernel | finite nonabelian S₃, μ=2; compact SU(2) damped sinc squared | T₂(δ_a*δ_b)=2δ_ab=(T₂δ_a)*δ_b=δ_a*(T₂δ_b). μ(0)=1 but μ(±(n+1))=0, hence SU(2) operator 0 | Sound; actual characters determine kernel. |
| 1.8 Finite detecting types | compact torus selector; split torus | Compact selector retains only n=0; split connected torus has one compact type for every parameter it | Sound; one detecting type does not imply finitely many representations. |
| 1.9 Repaired stages | C=∅,{1},JxJ⊔JyJ; nontrivial J | Finite-factor dimensions 0,0,2. For S₃,J=⟨(12)⟩, the two double cosets have sizes 2 and 4; C=S₃ gives two coefficients, C={1} gives none | Repaired criterion works in both directions. |
| 2.1 Weights/equivalence | 1,n^a; exp(t) on multiplicative positive line | Constant weight ratio 1; powers multiply by adding exponents; exp(2t)/exp(t)=e^t→∞ | Sound; bad weight rejected. |
| 2.2 Franke weights | G_m,λ=1,t=2; zero/negative λ | d₀=1,d_λ=2,d_{2λ}=4=d_λ²,d_{−λ}=1/2; 1≤t≤t² for t≥1 | Sound; comparison rather than chosen equality globally. |
| 2.3 Depth/Res normalization | GL₂ Borel diag(a,1),abs(a)=2; degree-two restriction | Root depth 2; norm character 4, relative-root coordinate 4^(1/2)=2; P=Q has zero roots and no minimum | Sound; identity case separated. |
| 2.4 Quotient Ξ | compact quotient, measure multiplied by 4; modular cusp | Ξ scales by 1/2, while Ξ² dx is unchanged; cusp volume ∼1/y gives Ξ∼√y | Sound; reciprocal square root. |
| 2.5 SLF and closed images | trivial/zero representations; maps z↦2z, z↦0 | Fixed stages ℂ or 0; first sends unit disc to radius 2. Zero map has kernel ℂ and quotient/image both 0 | Sound; no false closed-image embedding. |
| 2.6 Weighted L² | φ=(1+abs(x))⁻¹,w=(1+abs(x))²; constant Franke p=2 | Unweighted integral 2, weighted integral ∞; w=p² gives norm 2‖φ‖₂, w=p gives √2‖φ‖₂ | Sound; weighting and inclusion direction. |
| 2.7 Evaluation/smoothing | mass-one circle,w=4,φ=1; T=δ₀,f=e₋₁,ψ=e₁ | q(1)=2, Ξ=1, w^(−1/2)=1/2: 1≤1. T(R(f)e₁)=1=⟨e₁,e₁⟩; representing e₁ has reciprocal-weight norm 1/2 | Mathematics sound; R01 page correction. |
| 2.8 Nuclearity | circle H^{s+2}→H^s versus identity | Singular values (1+n²)⁻¹ sum to π coth π≈3.153; identity's singular values 1 sum to ∞ | Sound; derivative loss is essential. |
| 2.9 Zeroth-order spaces | compact set indicator; tail n⁻²; discontinuity | Indicator suprema ≤sup_C n^N; for tail, N=3 gives n→∞; jump indicator is not continuous | Sound; measurable and continuous carriers differ. |
| 2.10 Quotient Schwartz | compact bump; cusp y⁻ᵃ | Bump has finite every seminorm; N>a gives y^(N−a)→∞ | Sound; all exponents required. |
| 2.11 Harish-Chandra space | cusp φ=√y exp(−√(1+log y)); fixed logarithmic power tail | Dividing by Ξ leaves e^{−√σ}, so σ^d times it is bounded for every d; y^Nφ diverges. For σ^(−a), d>a gives divergence | Sound; logarithmic versus algebraic decay. |
| 2.12 Measure norms/duality | 3δ_x,w(x)=2; δ_x−δ_y,w=1 | Norm 3/2; distinct point masses have distance 2 | Sound; no strong continuity claim on all measures. |
| 2.13 Uniform derivative growth | 1; exp(iy²); compact cutoffs to 1 | Constant seminorm 1; k-th (y∂_y) derivative has leading magnitude 2^k y^{2k}; cutoff error has supremum 1 | Sound; one exponent for all derivatives and non-density at fixed T₁. |
| 2.14 Relative weighted decay | w=1,w=n; φ=1,n unbounded | At w=1, r disappears; at w=n, exponent is r−N and r>N forces divergence for 1 | Sound; ∃N precedes ∀r. |
| 2.15 Product/nuclear comparison | two circles; F=Σ_{n≥0}2^{−n}e_n⊗e_n | Pure-tensor evaluation e_n(x)e_m(y) on both sides. Every derivative series Σn^k2^{−n}<∞, while coefficient matrix diag(2^{−n}) has infinite rank | Sound; completed tensor needed, finite pure sums insufficient. |
| 2.16 CT/EP/adjunction | P=Q,φ=ψ=1, mass 1 then 2 | Operators identity; pairings 1=1 then 2=2. Rescaling one side only gives 2≠1; δ_P^P=1 | Sound; measures and domains retained. |
| 2.17 Approximation | zero constant term, tail e^{−y}; identity case | y e^{−y}≤e⁻¹ and every y^r e^{−y} bounded; φ−CT_P^Pφ=0 | Sound; fixed height loss may precede arbitrary depth decay. |
| 2.18 Weighted graph | no proper parabolics; a cusp vector of norm 1 | Graph's identity coordinate has norm 1; tuple of proper constant terms alone is 0 | Sound; identity coordinate prevents loss of cuspidal part. |
| 3.1 Relative-character basis | one-dimensional B, operator a; basis v then 2v | Unit vector term a; unnormalized vector term 4a; unitary phase leaves a | Sound; K-orthonormal hypothesis matters. |
| 3.2 Factorization adjoint | A=2,T=i; I(λ,x)=e^{λx},g=1_[0,1],λ=1 | B(AT1,1)=2i=B(A1,T*1), wrong T gives −2i. I(1,g)*=e−1=I(−1,g*); I(1,g*)=1−e⁻¹ | Sound; compact smooth approximations preserve separation. |
| 3.3–3.4 Support/projections | ℂ² blocks,v=(2,3),X={1},Y={2} | P_Xv=(2,0),P_Yv=(0,3),P_XP_Yv=(0,0),P_allv=(2,3); annihilator of all tests is 0 | Sound; arbitrary weights do not supply orthogonality. |
| 3.5 Regularity | GL₂ Borel χ⊠χ and χ₁⊠χ₂,χ₁≠χ₂; M=G | Stabilizer orders 2,1,1 | Sound; stabilizer is of data, not infinitesimal characters alone. |
| 3.6 Regular CT/holomorphy | torus P=G; GL₂ δ=4 | Torus CT norm 1; δ^(s−1/2) at s=1 equals 2, at s=0 equals 1/2 | Sound; boundary value is not a boundary-decay theorem. |
| 3.7 Lapid inversion | regular torus mode e₁; zero vector | Fourier coefficients 1 at matching mode,0 at distinct modes; reconstruction e₁. Zero gives coefficients and integral 0 | Sound; block hypothesis required for full reconstruction. |
| 3.8–3.10 Kernels/derivatives | circle f=e₋₁,Y=iD−1 or D; point group | Kernel e₁(x)e₋₁(y); Y=iD−1 gives derivative 0 and R(Y)f=0, hence 0≤p(0). For D both coefficients −i. Wrong conjugated derivative gives magnitude 2≤0; point kernel f(1) | Sound; earlier sign repair survives. |
| 3.9 Uniform component bound | torus f=e₋₁,w=1,n=1 | Exactly one nonzero spectral component, abs(kernel)=1; choose p(f)≥1, so 1≤p(f) on both formulations | Sound; no uncontrolled infinite component factor. |
| 4.1 T-characters | all finite places in T; GL₁ h=T variable | Hecke algebra ℂ, units evaluate 1. At unramified parameters 2,3, h has values 2,3; forgetting a place removes its equation | Sound; finite support even for infinite T. |
| 4.2 CAP | torus; GL₂ Borel datum; T all finite places | Torus has 0 proper parabolics, CAP false. GL₂ inducing datum gives CAP true. Empty retained-place set gives 0 equations and vacuous matching | Sound; non-CAP is not automatic. |
| 4.3 Mixed action | symbol value 2,Hecke value 3; compact torus | Tensor evaluation 6; action factor 6; zero factor gives 0. Unit symbol takes 1 on infinitely many lattice points | Sound; sharp factor not unital. |
| 4.4 Quasi-cuspidality | torus; GL₂ residual constant,∫f=1 | Torus P_cusp=id so (1−P_cusp)R(f)=0. GL₂ constant maps to 1, outside cusp, so complement operator nonzero | Sound; correct domain and central character. |
| 4.5 Typicality | compact central torus, target differential 0,candidate 1 | Both derived Casimirs 0, but central membership 1∈{0} is false | Sound; central condition indispensable. |
| 4.6–4.7 Counting/finite typical data | toy eigenvalue set {n²:n≥1}; compact torus | Count ≤√R, inverse eigenvalue sum π²/6; multiplicity 2 doubles count but not set. Target central set {0} meets ℤ in one point | Sound; polynomial count stronger than mere discreteness. |
| 4.8 Archimedean annihilator | q=z²,bad c=1,target 0 | (q−1)e^{z⁶} is 0 at ±1 and −1 at 0; Weyl product remains nonzero at target | Sound; sharp seed still separately required. |
| 4.9 Finite surviving blocks | split-torus induced family; finite detecting type set | One compact type and one coarse block can carry every it, t∈ℝ | Sound; finite blocks are not finite irreducibles. |
| 5.1 Simultaneous occurrence | infinity forces s=0; local h-value 2^s,target 2 | At s=0,local value 1≠2; at s=1,local value 2 but infinity fails | Sound; separate existential parameters would be false. |
| 5.2 Mixed annihilator | unwanted local value 2,target 3,seed value 1 | Seed⊗(h−2) evaluates 0 on unwanted datum and 1 at target. If target occurs, family vanishing forces target value 0 | Sound; nonoccurrence necessary. |
| 5.3 Normalization/range | target factor values 2,3; killed block | Product 6, normalized 6/6=1; killed value 0/6=0 | Sound; nonzero denominator established first. |
| 5.4 Non-CAP endpoint | torus Fourier lattice,χ=0,μ=damped sinc; GL₂ proper family | Torus: no proper data, μ(0)=1,μ(n)=0 for n≠0, range is matching cuspidal mode. GL₂ proper occurrence makes CAP true, so whole-space non-CAP premise fails | Sound; unrestricted variant only controls cuspidal domain. |
| 5.5 Admissible preservation | scalar π(f)=a,μ(χπ)=1; empty global matching block | π(μ⋆f)=1·a=a; global operator has range {0} and is 0 | Sound; automorphic occurrence not assumed. |
| 5.6 GL_n support uniqueness | Satake multisets {2,3} versus {2,2} | Polynomials 1−5T+6T² versus 1−4T+4T² | Sound; multiplicities and twists retained, not constituent uniqueness. |
| 5.7 Refined data | PGL₂,q(λ)=λ²−1/4; λ=it,ρ=1/2 | q(it)=−t²−1/4, q(ρ)=0; at t=0 values −1/4 and 0 | Sound; one-way separation of continuous and residual components. |

### Lean headlines, binders and padding

The README's analytic headlines are the fixed-genus global Weierstrass bound (§0.2), polynomial zero-fiber interpolation and affine-lattice interpolation (§0.3). All three appear, on native coordinate carriers and real-bodied predicates. The further deep results are sharp invariant interpolation (§0.8); real rapid/moderate multipliers and finite-type detection (§§1.3,1.6–1.8); weighted evaluation/nuclearity (§§2.7–2.8); quotient tensors and constant-term decomposition (§§2.15,2.18); relative characters and Arthur factorization (§§3.1–3.2); support projections (§3.4); regular CT and holomorphy (§3.6); Lapid expansion (§3.7); kernels and grouped bounds (§§3.8–3.10); counting and annihilators (§§4.6–4.9); and mixed/global/non-CAP/admissible/GL_n/refined isolation (§§5.2–5.7).

Each latter headline is named in the module docstring with the missing reductive Schwartz, induced-representation, quotient-space, completed-tensor, support-decomposition or spectral-family carrier. Searches at the pins found no native carrier that makes one of these omitted headlines a short signature with only simple definitions. Euclidean Schwartz maps, classical modular Eisenstein series and local finite-dimensional representations do not supply those carriers. No stand-in theorem was substituted.

Ran `lake env lean` on the absolute package file from the specified content checkout. Exit 0; only the three declaration-uses-sorry warnings at Suggested.lean:85, :98 and :108. There is one import Mathlib, no TauCeti import requiring a build, no extra imports and no set_option.

A scratch copy appended `#check @name` for all ten declarations and inserted four independent one-tactic probes before each sorry: `simp`, `rfl`, `infer_instance`, and `exact?`, each under fail_if_success/solve. It elaborated from the content checkout with exit 0 and only the same three sorry warnings: all 12 probes failed to close the target. The theorems are not definition restatements, boundary cases or README Checks. No padding deletion is requested.

Compared all ten elaborated types with §§0.1–0.3. The nonzero-point subtype is retained in both products; all product conclusions are under HasRankBound. HasFiniteEntireOrder deliberately does not include holomorphy, and polynomial interpolation explicitly retains both hψ and horder. Rapid decay has ∀M>0 ∀r ∃C≥0 ∀z in that order. The lattice definition accepts arbitrary generators, while its theorem explicitly retains complex LinearIndependent, arbitrary n,k,a and finite A. No section binder was lost. No signature change was needed.

### Duplication and ownership

Used the roadmap service's object searches over main and all indexed open heads, and searched the pinned Mathlib and Tau Ceti trees. Read the board index before drawing absence conclusions, and fetched all 19 indexed board entries at their given heads: four package READMEs and fifteen design READMEs. Searched these and the local board packages for primary products/interpolation, Schwartz multipliers, Delorme, nuclearity and cuspidal support. The hits for local principal-series cuspidal support, p-adic Weierstrass preparation and elliptic Weierstrass curves are different objects. No second owner for this package's extensions was found.

The relevant existing owners were resolved as follows:

- GlobalHolomorphicFunctions, preparatory primary factors, TauCetiRoadmap/GlobalHolomorphicFunctions/README.md:224: owns primary factors, compact-dependent normal convergence and zero divisor. This package imports those and adds the fixed-genus finite-rank global estimate. ZerosOfLFunctions:279 and Layer 5 owns the order convention and genus-one factorization; ModularCurvesPartII:496 owns elliptic sigma. AnalyticNumberTheoryPartI §0.23 is factorization of a given entire function, not construction/interpolation from an arbitrary rank-bounded zero set.
- AutomorphicFormsOnReductiveGroups §0.3 (:130) owns the fixed-support adelic Schwartz carrier; §2.7 (:459, integrated action at :467) owns the Schwartz action and Dixmier–Malliavin. Sections 1.1–1.2 and 1.9 here compare conventions and extend the multiplier on supplied stages.
- AutomorphicSpectralTheory §5.1 (:2725) owns Franke weights on the full quotient. Here w=p² identifies common stages; arbitrary comparable measurable weights on intermediate parabolic quotients and the specified unions/intersections are the extension.
- SmoothRepresentationsOfLocalGroups SR.2's quasi-cuspidality is local Jacquet vanishing. Section 4.4 here is a range condition for a global operator at one central character. EndoscopicTransferAndUnitaryTraceComparison's Delorme material is Paley–Wiener/transfer, not the moderate-symbol multiplier theorem.
- SpectralManifolds SM3 (:79) supplies the actual Fréchet open-mapping theorem. LocallyAnalyticDistributions §0.2 is over an ultrametric field and is not a substitute for complex Fréchet spaces.
- BanachSpaceTheory B4 (:223–245) now explicitly supplies Hilbert nuclear/trace-class norm identification. OperatorIdeals OI-B40 supplies the ideal inequality with bounded outside factors, not the product-of-two-Hilbert–Schmidt nuclear bound. Thus the declared composition-plus-locally-convex-comparison gap still asks for a missing composite theorem; it should use B4's existing norm comparison, not reconstruct it. This is not a duplicate gap.

No fully qualified Suggested.lean declaration collides: a service search of all open/main Lean files for this namespace and the three theorem names returned no matches outside this package. Open-head ownership was checked using the service and board heads provided by the brief; no additional pull requests were sought independently.

### Supplier order, resolved citations and contracts

The dependency command produced exactly:

```text
depcheck: 52 roadmaps, 589 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The resolver checked main 20b02f6 and the 363-head index dated 2026-10-25T15:41:50Z and reported no unresolved roadmap citations or own Lean names. Its explicit limitation that it did not check pinned external Lean names was handled by opening the library files below. The supplied content checkout identified itself as 198a280; no checkout, pin, order or tool file was modified.

Every current cross-roadmap citation was reopened. The table gives the actual owner sections, rather than treating resolver success as proof of content. Line numbers below are in the roadmap README, excluding the service wrapper.

| Supplier | Resolved sections and content checked |
| --- | --- |
| AutomorphicSpectralTheory | §§0.11–0.15 (:276–358), nuclear LF, integration, kernels, vector Schwartz and meromorphic families; §§1.5–1.10 (:967–1049), CT/pseudo-Eisenstein/data/decomposition; §§2.1–2.5 (:1534–1638), intertwiners; §§3.1–3.4 (:1933–1986), truncation; Layer 4 (:2310 onwards), Hilbert and residual/discrete data; §§5.1–5.9 (:2725–2870), Franke theory; §§6.1–6.4 (:2960–3011), compact Paley–Wiener, compact multipliers/kernels. Full-centre, Schwartz and counting supplements are explicit gaps. |
| AutomorphicFormsOnReductiveGroups | §§0.1–0.5 (:89–172), smooth/test/Schwartz/growth/smoothing; §§2.1–2.4 (:288–388), compact types, characters and induction; §2.7 (:459), globalization and action; §§3.4–3.5 (:551–568), tensors and spherical lines; §§4.1–4.2 (:596–614), constant terms and cuspidal occurrences. Real-Plancherel, centralizer, genericity, minimal-type and counting extensions are declared. |
| AdelicAlgebraicGroups | §§2.1–2.3 (:1437–1815), characters/modulus/quotient measures; §§3.1,3.4–3.6 (:2330,3024,3357,3469), rational parabolics/reduction/heights/cusps; §§4.6–4.7 (:4797,4871), compact quotient and character analysis. The stronger intermediate-quotient, fiber, volume and central-lattice inputs are declared, not falsely attributed to these generic targets. |
| SmoothRepresentationsOfLocalGroups | SR.1.1–1.3 (:981,1151,1230), compact locally constant functions, level Hecke algebras and modules; SR.2.2 (:1962), normalized induction/Jacquet; SR.4.1–4.2 (:3083,3178), Satake and spherical parameters. Exponential-family comparison is a declared gap. |
| ReductiveGroups; LieGroups | Main: ReductiveGroups Layer 7 (:627), root structure; RepresentationTheory/LieGroups Layers 6–7 (:383,407), maximal tori, complexification and real forms. Real-point and real-descent refinements are declared. |
| NoncommutativeGeometry | Main N1 (:84), Hausdorff completed projective tensors and continuous-bilinear complete-target universal property. |
| OperatorTheory | Main SelfAdjointSpectralTheory Parts A–E; OperatorIdeals OI-B29–B41 (:349 onwards), OI-B84 (:482) and Part C, trace/HS gauges and column models. No claim that the generic bounded-factor ideal inequality supplies HS×HS→nuclear. |
| VonNeumannAlgebras | V4.Core (:513), trace cyclicity, Hilbert–Schmidt pairing and trace duality; the separate composition/nuclear-convention contract remains declared. |
| PDE | Main Lane A (:223), Sobolev spaces, embedding and local analysis; exact quotient point-evaluation application is declared. |
| GlobalHolomorphicFunctions; ZerosOfLFunctions; ModularCurvesPartII | Preparatory primary factors (:224), standing finite order (:279) and Layer 5 items 1–6, and §1.4a lattice sigma (:496), respectively. |
| AutomorphicLFunctionsAndLocalFactors | isobaric-construction anchor (:269), actual construction immediately after; AL.3 (:1950), strong multiplicity one for isobaric sums (:2288). Includes twists and multiplicities. |
| SpectralManifolds | SM3 (:79), complex Fréchet open mapping, closed subspaces and quotient topology. |
| CongruenceSpectralGap; GanGrossPrasadUnitaryGroups | Scope-only citations: Layers 0–5 (:136,:688); §§6.3–6.4 (:1212,:1246), relative spectral contribution and isolated comparison. No upward supply is introduced. |

All 26 plan gap slugs exactly match the README's “What Supplier must provide” sentences, including supplier and needs text. Each has a named owner. Checked their hypotheses against the target that consumes them: fixed levels/types, complete nuclear Fréchet carriers, proper nested parabolics and relevant quotient maps, common central character, hereditary bounds for every Levi, and polynomial rather than mere finite counting. They ask for the comparisons or stronger estimates missing from the cited owners; none has supplier none. The dependency graph therefore has no unowned prerequisite or undeclared nonexistent-section substitution. No ownership move is requested.

### Pinned declarations opened

Pins checked against lake-manifest.json: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a; Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.

| Native declaration | Pinned file and line | Actual fields/definition and boundary |
| --- | --- | --- |
| SchwartzMap | Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean:75 | toFun, real ContDiff, and ∀k,n∃C∀x weighted iterated-derivative bound; normed real spaces, not an adelic group carrier. |
| Differentiable | Mathlib/Analysis/Calculus/FDeriv/Defs.lean:170 | ∀x,DifferentiableAt at the chosen field; no separate entire-growth assertion. |
| Complex.exp | Mathlib/Analysis/Complex/Exponential.lean:62 | Limit of its Taylor-series Cauchy sequence. |
| HasProd; Multipliable/Summable | Mathlib/Topology/Algebra/InfiniteSum/Defs.lean:106,:114 | Finset-filter limit and existence of a product, default unconditional filter; no built-in countability or exclusion of zero. The total product defaults to 1 without convergence, so the theorem's rank hypothesis is necessary. |
| MvPolynomial.eval | Mathlib/Algebra/MvPolynomial/Eval.lean:256 | Ring-homomorphic evaluation via eval₂Hom and the identity coefficient map; Fin 0 and zero/constant polynomials included. |
| Polynomial.eval | Mathlib/Algebra/Polynomial/Eval/Defs.lean:249 | eval₂ with identity coefficient map; no nonzero-degree assumption. |
| MeasureTheory.Lp | Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:89 | Additive subgroup of a.e.-equivalence classes with finite eLpNorm; not pointwise functions with a chosen smooth representative. |
| CentroidHom | Mathlib/Algebra/Ring/CentroidHom.lean:56 | Additive map with left/right multiplication laws; neither topology nor complex linearity. |
| ContinuousLinearMap.isOpenMap | Mathlib/Analysis/Normed/Operator/Banach.lean:228 | Surjective bounded linear map between Banach spaces, not the general Fréchet theorem. |
| MonoidHom.isOpenMap_of_sigmaCompact | Mathlib/Topology/Algebra/Group/OpenMapping.lean:114 | Sigma-compact source and Hausdorff Baire target topological groups, not arbitrary complex Fréchet spaces. |

The pinned object search distinguishes the elliptic Weierstrass function from elementary canonical products, and local meromorphic order from finite entire growth. Tau Ceti's Fourier/Schwartz and Sobolev modules concern normed vector spaces, not the missing reductive/adelic representation carriers. No native declaration already states one of the three acceptance theorems.

## Not verifiable

- Bernstein, On the support of Plancherel measure, §§3.4–3.5, pp.685–689, remains settled uncertified/paywalled. It was not requested again. The applications are readable in BPCZ, but this does not certify Bernstein's original proof.
- The original Kostant, Delorme, Donnelly and Müller papers were not independently certified. They enter as named supplier contracts and through the particular BPLZZ/BPCZ uses read above, not as a claim that their original full generality was verified.
- I could not raster-inspect the source's printed complex bars/signs in BPCZ Proposition 2.8.4.3 or Lemma 2.10.2.1. The cached extraction can lose bars; this worker has neither pdftoppm nor an installed Python PDF renderer. The package formulas were checked independently by the explicit scalar/circle calculations. No source erratum about those ambiguous printed bars is inferred from the extraction.

No additional unavailable source was discovered, so no new reference request was created and sources.toml was left unchanged.

## Source issues

- **Error** in bplzz at §2.2, printed p.10 (bplzz lines 451–452): the source says all order-at-most-two root-datum automorphisms form a finite set; it should restrict to a finite real-form Weyl coset; affects a stated result.
- **Error** in bplzz at Remark 2.16, printed p.12, and Proposition 2.24 proof, printed p.18 (bplzz lines 574–578 and 839–844): the source says realized characters equal the full shifted-strip union; it should assert containment, since compact SU(2) does not realize the zero parameter; affects a stated result.
- **Error** in bplzz at Lemma 2.22 proof, printed p.16 (bplzz lines 755–761): the source says the tensor-character annihilator uses t_λ with inverse pullback; it should use t_{−λ}, since tensoring a torus weight adds λ; affects the proof.
- **Misprint** in bplzz at Proposition A.1, printed p.43 (bplzz lines 2104–2112): the source says every rapid holomorphic symbol has the character-evaluation multiplier; it should require Weyl invariance, as the following proof does; affects a stated result.
- **Misprint** in bplzz at Theorem 3.19(1), printed p.29 (bplzz line 1434): the source names decomposition (3.9) for cuspidal components; it should name the coarse fixed-level decomposition (3.2); affects nothing.
- **Error** in bpcz at §2.5.4, printed p.210 (bpcz lines 1217–1219): the source says closed-image SLF morphisms are topological embeddings; it should identify the quotient by the kernel with the image, or additionally require injectivity; affects a stated result.
- **Error** in bpcz at §2.5.9, printed p.213 (bpcz lines 1333–1334): the source says weighted Radon measures form a continuous Banach representation; it should omit strong continuity, since distinct moving Dirac masses have distance two at weight one; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "7aaaa212599930bd0e273795dff98832d1d8d8e9", "job": "REV-PKG-AutomorphicSpectralTheoryPartII~4", "model": "gpt-6-astra", "worker": "chris-31"} -->
