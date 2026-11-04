# Repair report: AutomorphicSpectralTheoryPartII

## F01 (P1) — applied

Both §3.2 second-slot parameters λ̄ → −λ̄; its Check now computes the adjoint and distinguishes conjugation from adjunction. The sign also agrees with the pairing convention and §3.7’s unitary-axis adjoint use. Evidence: bpcz line 2053 and line 2057 print λ̄, but normalized induction gives I(λ,g)*=I(−λ̄,g*); the additive model gives e−1 on both corrected sides.

## F02 (P2) — applied

The nash-schwartz-analysis contract and plan entry now request only the Nash Schwartz product/embedding comparison, at parent §0.14. Integration is explicitly imported from AutomorphicSpectralTheory §0.12 in §§1.2 and 2.12. Duality and norm-smooth measure comparison remain local targets in §§2.12–2.13; their obsolete gap references were deleted. Parent §0.12 and bpcz line 1327, line 1347 and line 1364 verify ownership.

## F03 (P2) — applied

Three compound gaps → twelve individual contracts with precise supplier sections; parent §0.15 supplies weak-to-strong holomorphy directly, and §§2.2–2.3 retain exponential weights and restriction-compatible depths. Every consumer of the old slugs was updated, including §§1.4–1.6, 1.8, 2.1–2.5, 2.15, 2.18, 3.1 and 3.6. The supplier map and mathematical witnesses below specify the replacements.

## F04 (P3) — applied

§0.10’s unspecified C → `∀M>0 ∀r∈ℝ ∃C_{S,M,r}>0`, uniformly in μ, for both the ordinary strip estimate and the maximum over θ. M_S and r_S remain chosen before M,r. This is exactly the quantifier order of bplzz line 659 through line 664. No Lean declaration encodes this presently unstatable headline.

## F05 (P3) — applied differently

§2.16 now constructs intermediate EP_P^Q and compares Q=G with parent §1.6; §3.3 cites parent §1.10. §2.13 constructs T([G]_P), identifying P=G with the supplier. All three AL.3 titles were corrected. Kostant remains an explicitly secondary citation through BPLZZ, bplzz line 741 and line 760; no unread primary source is claimed or added.

## F06 (P3) — applied

§2.16 now has three Checks: identity, finite contributing compact-support fibers, and a numerical quotient-measure test for adjunction. §3.1 now has three, adding trace, zero input, and orthonormal-basis controls. These remain prose. The finiteness argument uses the proper map and discrete fibers at bpcz line 1053; adjunction and the trace definition are at bpcz line 1443 and line 1987.

## F07 (P3) — applied

§3.7’s GL-product restriction → every connected reductive G satisfying hereditary (HP), with regular χ. The unconditional GL-product instance still comes through hereditary-intertwining-bounds. The two Checks now cover Fourier orthogonality, zero input and the support hypothesis. Evidence: lapid line 801, line 924, line 933 and line 1069; bpcz line 2402 and line 2417. Suggested.lean’s existing module docstring already states this generality.

## F08 (P3) — applied

§5.7’s ambiguous separation Check → a unitary-axis T-character retains the continuous Borel component and kills the residual constant representation; the reverse separation is impossible. The explicit polynomial q(λ)=λ²−1/4 distinguishes λ=it from λ=ρ=1/2. This agrees with both directions at bplzz line 1490 through line 1492 and with §5.1’s full complex-parameter occurrence definition.

## F09 (P3) — not actionable in this package: transfer ownership and merge order are external

Deleted the unsupported EndoscopicTransfer consumer claim and the assertion of an existing downstream GGP consumer. Scope now identifies BPLZZ Proposition 4.8 as the separate comparison needed by GanGrossPrasadUnitaryGroups §6.4. Its existing gap:spectral-isolation still requests transfer preservation from this theory. Adding its missing target and placing this package before that consumer require edits outside the authorized files.

## F10 (P3) — applied differently

Scope now acknowledges the parent’s Franke spaces, and §2.6 imports §§5.1–5.9 for their comparison. Added the p² norm Check, with central quotient, measure and level matched. The equality concerns individual weighted-L² stages: §2.14’s S_w is an intersection/union of those stages, rather than one Franke S_p. This avoids the overly broad identification suggested in the finding.

## Supplier and ownership audit

The three replaced compound gaps have the following remaining contracts. Their README sentences, supplier names, section locators and needs strings agree exactly with the plan’s top-level gaps list.

| Former gap | Replacement | Supplier | Section |
| --- | --- | --- | --- |
| vector-holomorphy-slf | tensor-holomorphy | AutomorphicSpectralTheory | §0.15 |
| vector-holomorphy-slf | slf-isotypic-sums | AutomorphicSpectralTheory | §0.11 |
| vector-holomorphy-slf | frechet-open-mapping | AutomorphicSpectralTheory | §0.11 |
| vector-holomorphy-slf | frechet-bilinear-continuity | AutomorphicSpectralTheory | §0.11 |
| kostant-minimal-types | kostant-centralizer | AutomorphicFormsOnReductiveGroups | §2.2 |
| kostant-minimal-types | generic-tensor-semisimplicity | AutomorphicFormsOnReductiveGroups | §2.3 |
| kostant-minimal-types | minimal-type-detection | AutomorphicFormsOnReductiveGroups | §2.4 |
| kostant-minimal-types | k-type-growth | AutomorphicFormsOnReductiveGroups | §2.1 |
| quotient-height-cusps | quotient-height-comparison | AdelicAlgebraicGroups | §3.5 |
| quotient-height-cusps | cusp-fiber-bounds | AdelicAlgebraicGroups | §3.6 |
| quotient-height-cusps | deep-cusp-uniqueness | AdelicAlgebraicGroups | §3.6 |
| quotient-height-cusps | quotient-neighborhood-volumes | AdelicAlgebraicGroups | §3.6 |

There are twelve replacements for three old entries, hence 27 total gaps rather than 18. The k-type-growth contract explicitly assumes finite length and admissibility; arbitrary smooth representations do not have polynomial multiplicity bounds. The direct-sum contract uses the compact finite-adelic K_f, with Fréchet summands and a locally convex direct-sum topology; it does not call an infinite algebraic direct sum Fréchet. No gap requests the weights or depth functions built in this package. The cusp maps name the source P(F)N_Q(𝔸)∖G(𝔸) and target [G]_Q. The volume comparison uses ρ₀ on Siegel charts, not δ_G=1 at P=G.

Supplier sections were read through the roadmap service at the supplied indexed heads, and the relevant main files were read directly. In particular:

- AutomorphicSpectralTheory §0.12 is quasi-complete vector integration; §0.15 supplies the locally bounded weak/strong comparison, specialized to scalar source ℂ and denominator 1. Its §1.6 is the Paley–Wiener Q=G construction, §1.9 the generated cuspidal-data spaces, and §1.10 the orthogonal sum. §§5.1–5.9 include the Franke weights and §5.7a the logarithmically weighted core.
- AutomorphicFormsOnReductiveGroups §0.4 defines smooth uniform growth on [G]. Its §§2.1–2.4 locate the representation-theoretic contracts; the absent supplements are explicitly gaps, rather than assertions that those sections already prove them.
- AdelicAlgebraicGroups §3.5 supplies height theory; §3.6 supplies cusp/Siegel theory. The new intermediate-quotient supplements are explicit requests. Polynomial cusp fibers and deep uniqueness are precisely distinguished in bpcz line 1044 and line 1047. The compact finite-adelic direct-sum argument is at bpcz line 1231 through line 1251.
- AutomorphicLFunctionsAndLocalFactors AL.3’s item is titled “Strong multiplicity one for isobaric sums.” ModularCurvesPartII §1.4a contains its “Lattice sigma function” item. The SmoothRepresentationsOfLocalGroups, ReductiveGroups, LieGroups, PDE, NoncommutativeGeometry, VonNeumannAlgebras, GlobalHolomorphicFunctions and ZerosOfLFunctions cited sections were checked against their text. The nested OperatorTheory files exist on main even though service show does not accept their nested path as a roadmap name; their Parts A–E, OI-B32–OI-B41, OI-B84 and Part C were checked directly. CongruenceSpectralGap CSG.0–CSG.5 is in its board design, not a claimed missing main file.

Ownership searches used the roadmap service over main and the indexed open heads, plus the board packages, for Schwartz multipliers, smooth transfer, compact-isotypical spaces, Kostant centralizers, cusp fibers and deep-cusp uniqueness. No new local carrier was introduced. The generic supplements remain with the existing earlier suppliers; the intermediate quotient extensions remain this Part II’s difference from its parent. The service exposes the indexed open files, so ownership was checked against those available heads; no separate network search for unspecified pull-request files was made.

The legal cached sources bplzz, bpcz and lapid were read at the repair locators. Bernstein remains settled as uncertified and was not requested. Kostant is cited only through the inspected BPLZZ use. No additional source was needed; sources.toml and metadata.toml are unchanged.

## Adversarial mathematics pass

Rows record actual values or explicit formulas on test inputs, including negative controls. The definition/API rows and theorem rows are separated where their conclusions differ. All newly added or changed mathematical claims appear below; retained targets are also tested in README order. “Retained” records no change to the original statement, not a claim that finite tests prove it.

| Statement | Instances tried | Values computed on the two sides or models | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: linear-first pairing | 1,i in ℂ | integral pairing −i; Mathlib inner product i | exchanging slots is necessary | retained |
| Conventions: adjoint and parameter | λ=1,it; additive g=1_[0,1] | adjoint e−1=1.718281828; corrected slot e−1; old slot 1−e⁻¹=0.632120559; −conj(it)=it | old off-axis identity fails | §3.2 corrected |
| Conventions: normalized induction/disintegration | GL₂ upper Borel, abs(a)=4 | δ=4; δ^(1/2)=2; δ^(−1/2)=1/2 | opposite exponents distinguish the two maps | retained |
| Conventions: left derivative | additive π_t, t=1,2 | integration by parts gives iπ₁(f), 2iπ₂(f); reversed derivative gives −i,−2i | sign agrees in §1.2 | retained |
| Conventions: translations of symbols | z and weight +1 | t₁z=z−1; tensor character α+1 | inverse translation is required in §1.4 | retained |
| Conventions: right convolution | circle, e₋₁ and e₁ | R(e₋₁)e₁=e₁; R(e₁)e₁=0 | sign agrees with §3.8 | retained |
| Conventions: weights and measures | constant weight 4; cδ_y | L² norm 2 times unweighted norm; variation norm abs(c)/4 | direct and reciprocal weights are different | retained |
| 0.1 HasRankBound | empty; ℤ at p=0,1; 1/(n+1) | sums 0; divergent harmonic versus π²/3; terms (n+1)^(p+1) do not tend to 0 | rank 0, rank 1, no rank respectively | retained |
| 0.1 monotonicity/counting API | finite {1/2,2}; p=0,1 | inverse-power sums 5/2 and 17/4, both finite; disk count ≤2 | monotonicity is finiteness, not a termwise inequality below norm 1 | retained |
| 0.2 elementaryFactor | p=0,1,2; w=0,1,2 | at 0: 1,1,1; at 1: 0,0,0; at 2: −1,−e²,−e⁴ | empty exponential sum is 0 at p=0 | retained |
| 0.2 elementaryFactor derivative | p=0,1,2 at w=1 | derivatives −1,−e,−e^(3/2); at p=0,w=0 derivative −1 | every specified zero is simple, including genus zero | retained |
| 0.2 canonicalProduct | empty; {0}; {0,a}, p=0 | 1; z; z(1−z/a), with derivatives 1 at 0 and −1 at a | origin appears exactly once | retained |
| 0.2 partialCanonicalProduct | Λ={0,1,2},p=0,z=3 | empty index 3; {1}: −6; {1,2}: 3; reversed order 3 | insertion and reordering laws give the same final value | retained |
| 0.2 HasFiniteEntireOrder | 1; exp(z²); exp(exp(z)) | bounds e, exp((1+abs(z))²); on x>0, log abs(exp(exp(x)))=exp(x) | first two pass; third exceeds C(1+x)^d for every C,d | retained |
| 0.2 finite-order sum/product/composition | exp(z²), exp(z³), pullback z² | product bounded by exp(2(1+abs(z))³); composition exp(z⁴) has exponent 4 | maximum degree for products, degree multiplication for composition | retained |
| 0.2 finite_rank_weierstrass_product | empty; {0}; ℤ,p=1 | 1; z with derivative 1; sin(πz)/π with derivatives (−1)^n at n | exact simple zeros and an order-2 bound; finite-set limit stabilizes | retained |
| 0.3 HasRapidVerticalDecay | exp(z²), exp(−z²),1 on z=iy | abs values exp(−y²), exp(y²),1; r=1 makes constant function unbounded | positive Gaussian sign is required | retained |
| 0.3 polynomial_zero_fiber_interpolation | n=0; Ψ=0; q=z²,Ψ=z−1 | one-point choices ν=0 or 1; ν=0; ν=exp(z⁶)(z²−1) has zeros ±1 | both zero-set directions hold, including constant inputs | retained |
| 0.3 affineSpectralLattice | k=0; b=(1); b=(1,1) | {a}; a+ℤ; coefficient relation 1−1=0 | rank zero included; repeated generators excluded | retained |
| 0.3 affine_lattice_interpolation | L=ℤ,A={0,1/2} | exp(z²)sin(πz)/(πz) takes 1 at 0, 2exp(1/4)/π at 1/2, 0 at every other integer | exceptional points may lie outside L | retained |
| 0.4 real-form lattice | split G_m; U(1); rootless rank 2 | Y₁={0}; Y₋₁=ℤ; matrices with rows (1,n),(0,−1) square to I for every n | one finite Weyl coset is essential | retained |
| 0.4 positive-root independence | rank-one root α=2 on X*=ℤ | ρ=1 and −ρ=−1 differ by 2∈X*; both give the same lattice coset | basis change does not change Y | retained |
| 0.5 moderate symbols | exp(z), exp(−z²), polynomial z² | on abs(Re z)≤M: exp(M), exp(y²) on iy, and abs(z)²/(1+abs(z))²≤1 | first and third moderate; second fails | retained |
| 0.5 product/restriction API | μ=z,ν=z, exponents −1,−1 | abs(z²)/(1+abs(z))²=(abs(z)/(1+abs(z)))²≤1; fewer strips impose fewer bounds | multiplication and inclusion direction agree | retained |
| 0.6 rapid symbols | dimension 0; positive-dimensional strip | at a point every seminorm is abs(μ(0)); for μ=1,r=1 the strip weight tends to infinity | ℂ in dimension zero; no rapid unit on a line | retained |
| 0.6 ideal and completeness controls | exp(z²) times z²; finite W action | on iy: y²exp(−y²), still faster than every inverse power; averaging two equal values a gives a | polynomial loss is absorbed; fixed-space normalization preserved | retained |
| 0.7 sharp support | U(1), damped sinc; split G_m | compact-lattice values 1 at 0 and 0 at n≠0; unit has infinitely many values 1; split lattice has one point | nonunital compact sharp algebra | retained |
| 0.8 nonzero prescribed orbit | rank-zero Cartan; two factors with target values 2,3 | symbol 1 works at a point; product 6 normalized by 6 gives 1 | nonzero value precedes division | retained |
| 0.9 crossed-product action | f=z,q=z,t₁; reflection s(z)=−z | t₁(qf)=(z−1)²; q·t₁f=z(z−1); divided difference sends z→2 and 1→0 | coefficients do not commute with translation | retained |
| 0.9 localization negative control | multiplication by 1/z | image of 1 is 1/z, whereas divided difference sends 1 to 0 | arbitrary rational poles are not polynomial preserving | retained |
| 0.10 extension and division | μ=z²+z; μ=z² divisible by z | divided difference 2; derivative limit 2μ′(0)=2; quotient μ/z=z | removable-pole value matches extension | retained |
| 0.10 strip constant quantifiers | t₁ at z=0, shifted point −1; r=0,1,−1 | weight ratio 1/(2^r) is 1,1/2,2; general translation comparison permits 2^abs(r) | constants chosen after r; source states this order | both estimates corrected |
| 1.1 real Schwartz comparison | compact group; positive torus t→∞ | compact weights bounded; t²/(1+(log t)²)→∞ | logarithmic decay alone fails Nash decay | retained |
| 1.2 integrated action | trivial representation; two functions of integral 2,3 | π(f)=2; π(h)=3; π(f*h)=6 | Fubini agrees with multiplication | integration import made explicit |
| 1.3 Delorme normalization | trivial group; central/derived product | symbol value a gives multiplication by a; for (U(1)×SO(1,3))/μ₂, full-derived intersection has {I,−I} while connected-derived intersection has {I} | the connected-derived kernel is smaller than the full-derived one | retained |
| 1.4 translated tensor characters | one-dimensional torus weight +1, z(α)=α | δ(z)(α)=α+1=t₋₁z(α); wrong t₁ leaves discrepancy 2 | independent verification of sign in secondary citation | supplier slug and locator corrected |
| 1.5 generic tensor semisimplicity | torus weights ±1 at α=2; SL₂ reducibility parameter | distinct characters 3 and 1; reducible spherical principal series at ρ has a nonsplit extension | generic decomposition cannot be asserted at exceptional points | supplier gap separated |
| 1.6 rapid multiplier estimates | compact SU(2) | realized parameters ±(n+1), n≥0; lattice union ℤ also contains 0 | containment suffices; equality fails at 0 | supplier gaps separated |
| 1.7 moderate multiplier | μ=1; SU(2) symbol supported only at lattice point 0 | T₁f=f; second symbol has μ(0)=1 but μ(±(n+1))=0, hence operator 0 | kernel is controlled by realized characters | retained |
| 1.8 finite detecting types | compact torus selecting weight 0; SL₂ limits | selected set {0}; limits have lowest types +1 and −1 | detection must include the two limits | supplier gap separated |
| 1.9 adelic stage comparison | compact support meeting two double cosets | stage S(G∞)⊕S(G∞); values (1,0) and (0,1) independent | one copy loses a degree of freedom | retained |
| 2.1 quotient weight | w=1; exp(t) on positive torus; n^a | comparison constant 1; w(2t)/w(t)=exp(t) unbounded; at n=2,n^a=2^a | exponential-in-coordinate weight fails | height-only contract |
| 2.2 exponential Siegel weight | G_m, norm 4, λ=0,1,−1 | d₀=1; d₁=4; d₋₁=1/4; d₁d₋₁=1 | powers and inverse comparisons match | local construction retained |
| 2.3 depth definition | GL₂ Borel, norm 4; P=Q | singleton minimum 4; equal-parabolic root set empty | proper containment is necessary for a finite minimum | local ownership retained |
| 2.3 depth restriction | degree-two restriction of scalars, norm-2 idele | norm character 4; relative coordinate 4^(1/2)=2; diagonal root 2 | norm character and relative root are distinct | retained |
| 2.4 quotient Ξ | cusp height y; measure scaled by c=4 | volume y⁻¹ gives Ξ=y^(1/2); rescaling gives Ξ/2 | inverse square root, rather than inverse volume | volume-only contract |
| 2.4 integrability | modular cusp, d=2 | Ξ²dy/y²=dy/y; integral from 1 to infinity of (1+log y)⁻²dy/y=1 | logarithmic power 2 suffices in this model | retained |
| 2.5 SLF and closed-image maps | trivial ℂ; zero map ℂ→ℂ | transitions id; zero image {0}, kernel ℂ, quotient 0 | closed image does not imply injectivity | direct-sum/open-map gaps separated |
| 2.6 weighted L² | n=1+abs(x), φ=n⁻¹ on ℝ | unweighted norm squared 2; at w=n² integral of 1 is infinite | larger measure weight gives smaller space | retained |
| 2.6 Franke comparison | same quotient/measure, p=1,2 | norm squares ∫abs(Dφ)² and 4∫abs(Dφ)²; using w=p at p=2 gives only 2∫abs(Dφ)² | w=p² is necessary | Check and scope added |
| 2.7 Sobolev evaluation | constant weight 4, mass-one compact chart | derivative norm is doubled; w⁻¹ᐟ²=1/2; product unchanged | reciprocal square root has correct scaling | retained |
| 2.8 nuclear inclusion | circle Fourier modes; scalar Hilbert maps 2,3 | zeroth-order inclusion has infinitely many singular values 1; composite nuclear norm 6=2·3 in dimension one | smooth derivative strengthening, not bare Hilbert inclusion | retained |
| 2.9 S₀ and S₀⁰ | compact indicator; φ=n⁻² | indicator has finite weighted suprema but a jump; n³φ=n→∞ | measurable and continuous carriers differ; fixed decay order insufficient | retained |
| 2.10 quotient Schwartz | compact smooth φ; cusp tail y⁻² | compact support bounds every height seminorm; N=3 gives y³y⁻²=y→∞ | all decay exponents required | retained |
| 2.11 Harish-Chandra Schwartz | Ξσ⁻²; Ξexp(−√σ) | normalized d=3 values σ and σ³exp(−√σ); first unbounded, second bounded | second passes logarithmic tests without algebraic-height decay | retained |
| 2.12 measure norm and duality | 3δ_y,w(y)=2; distinct δ_x,δ_y,w=1 | norm 3/2; distance 2; pairing δ_y with ψ gives conj(ψ(y)) | weighted variation and conjugate pairing agree | local target kept |
| 2.12 convolution/smoothing | mass-one circle, μ=δ₀, f=e₁ | right-convolution density f(−x)=e₋₁(x), with norm 1; δ₀ itself has no function density | smoothing does not require a norm-continuous Dirac orbit | local route kept |
| 2.13 uniform derivative growth | constant 1; exp(iy²) | D1=0; D exp(iy²)=2iy²exp(iy²); D²=(4iy²−4y⁴)exp(iy²) | no single N bounds all derivatives of the second input | intermediate quotient owned here |
| 2.13 union versus fixed-stage density | constant 1 on noncompact quotient | sup abs(1−compact cutoff)=1; with one extra height loss, tail bound ≤1/R | fixed T₁ density fails; union density can hold | retained |
| 2.14 S_w | w=1; w=n, φ=1 | w=1 gives T_N for each N; w=n,r=N+1 gives n⁻ᴺn^(N+1)=n→∞ | S_w is not an arbitrary single weighted-L² stage | scope comparison qualified |
| 2.15 completed tensor | point; two finite sets of sizes 2,3; ℝ² | dimensions 1 and 6; exp(−x²−y²+xy/2) has infinitely many independent y-slices | completion includes functions outside finite sums of tensors | retained |
| 2.16 CT/EP identity and compact fibers | P=Q; φ=0 | identity has one summand φ(x); zero input has zero nonzero summands; δ=1 | compatible with proper-map/discrete-fiber proof | Checks added |
| 2.16 adjunction measures | P=Q, mass-one compact quotient, φ=ψ=1 | LHS=1=RHS; one measure doubled: 2 versus 1; both doubled: 2=2 | inconsistent quotient normalization fails | Check added |
| 2.17 constant-term approximation | zero constant term; P=Q | difference φ−0=φ; equal-parabolic difference φ−φ=0 | arbitrary cusp decay and identity case agree | retained |
| 2.18 graph embedding and dual sum | norm-one cusp vector with every proper CT zero | proper CT tuple 0; full tuple (0,φ) has norm 1 | identity component prevents a kernel | open-map gap updated |
| 3.1 relative character | operator diag(2,3), Petersson form; f=0 | J=2+3=5=trace; zero gives 0 | trace and zero controls | Check added |
| 3.1 basis normalization | one-dimensional operator 2·id | unit vector contribution 2; vector 2v contribution 8; multiplication of v by i still gives 2 | orthonormal changes preserve, arbitrary basis changes fail | Check added |
| 3.2 finite-type adjoint movement | A=2,T=i,B(u,v)=u conj(v) | B(AT,1)=2i; B(A,T*)=2i; using T gives −2i | conjugate inversion and adjoint are necessary | corrected |
| 3.2 noncommuting finite-type control | A with rows (1,2),(3,4); T swaps coordinates; B has weights (1,2) | first-slot sum 2+6=8; second-slot sum 6+2=8 | identity does not assume A,T commute or B is Petersson | corrected identity passes |
| 3.3 support spaces | ℂ² with two blocks; vector (2,3) | empty projection 0; full projection (2,3); first-block projection (2,0) | neither zero nor identity is a general support projection | parent §1.10 cited |
| 3.4 projection algebra and convergence | disjoint blocks; orthonormal e_n/n | P₁P₂=0,P₁+P₂=I; squared norm sum π²/6 but sum norms divergent | Hilbert unconditional does not imply absolute | retained |
| 3.5 regular datum | GL₂ χ⊠χ versus χ₁⊠χ₂,χ₁≠χ₂; M=G | stabilizer sizes 2,1,1 | equality of infinitesimal characters alone does not decide regularity | retained |
| 3.6 normalized constant term | δ=4,s=1,1/2,0 | multipliers 2,1,1/2 | boundary normalization alone proves no boundary decay | parent holomorphy imported |
| 3.7 inversion | compact torus, mass-one Haar, e₁; zero vector | pairing with e₁ is 1, distinct modes 0; reconstruction e₁; zero integral 0 | general (HP) statement contains this instance | HP generality restored |
| 3.7 support hypothesis | φ=φχ+φψ in disjoint regular blocks | χ-reconstruction φχ; equality with φ fails by φψ when φψ≠0 | φ∈Cχ is required | Check added |
| 3.8 kernels | trivial group; circle f=e₋₁, x=0,y=1/2 | kernel f(1); circle kernel exp(−πi)=−1; zero f gives 0 | Fourier sign and central factor agree with conventions | retained |
| 3.9 component bounds | point mass at w(y)=2; f=0 | weighted mass norm 1/2, hence column bound p(f)/2; zero kernels 0 | reciprocal weight direction correct | retained |
| 3.10 grouped kernel expansion | trivial group; one K-type with eigenvalues 1,−1 | one-term expansion f(1); grouped trace abs(1−1)=0 versus individual abs sum 2 | grouped estimate does not assert its stronger ungrouped form | retained |
| 4.1 T-character | T all finite places; spherical unit; GL₁ parameter 2 | algebra ℂ; unit value 1; Laurent monomial T has value 2 | empty tensor is scalars; finite support retained | retained |
| 4.2 CAP | torus; GL₂ with all finite places in T | zero proper parabolics gives false CAP; proper Borel datum and empty finite conditions give true CAP | degenerate T does not manufacture non-CAP | retained |
| 4.3 T-multiplier | factors of values 2,3; compact torus constant symbol | tensor value 6; unit symbol has infinitely many lattice values 1 | scalar action does not require a unit in the sharp algebra | retained |
| 4.4 quasi-cuspidal | f=0; anisotropic quotient; GL₂ positive f of integral 1 | operators 0; every range cuspidal; on constant residual vector R(f)1=1 | positivity example is a negative control | retained |
| 4.5 typicality | compact central torus, differentials 0,1 | derived Casimir values both 0; central projection values 0 and 1 | derived test alone retains a wrong character | retained |
| 4.6 Casimir counting | multiset 1,1,4; zero-dimensional derived group | multiplicity count 3; zero-set count 2; inverse-square sum 17/16; derived value 0 | set interpolation and multiplicity counting distinguished | retained |
| 4.7 finite typical set | central lattice ℤ, target set {0,1}; derived group trivial | two allowed central values; derived Casimir alone gives 0 at every integer | central condition is indispensable | retained |
| 4.8 unwanted-family annihilator | bad value c=2,target q=3 | q−2 takes 0 on bad fiber,1 at target; empty unwanted set gives factor 1 before sharp seed | all complex twists remain on the killed quotient fiber | retained |
| 4.9 finite surviving blocks | GL₂ Borel datum with λ=it | one coarse datum; infinitely many parameters t∈ℝ | finite blocks does not mean finite irreducible spectrum | retained |
| 5.1 occurrence | M=G; proper datum with archimedean candidate s=0 but finite value 2 | no full-group twist changes χ∞; proper candidate has finite value 2^0=1≠2 | all equations require the same complex parameter | retained |
| 5.2 mixed annihilator | unwanted Hecke value 2,target 3, sharp seed 1 | seed·(h−2) gives 0 and 1; if target lies on family, every vanishing factor gives 0 there | normalization impossible in the excluded occurrence case | retained |
| 5.3 normalized isolation | two selectors of target values 2,3 | product 6; divide by nonzero 6 gives 1; killed component remains 0 | no division by zero or projector conclusion | retained |
| 5.4 non-CAP isolation | proper occurrence; absent χ in cusp spectrum | proper occurrence implies CAP; if cuspidal χ-space=0, range is 0 | whole-space cuspidality requires non-CAP | retained |
| 5.5 representation preservation | π(f)≠0 but nearly-isotypic cusp space 0 | global L² action 0; π(μ⋆f)=1·π(f) | no automorphic occurrence assumed | retained |
| 5.6 GLₙ support uniqueness | multisets {α,β},{β,α},{α,α},α≠β | first two have multiplicity one at α,β; third has multiplicity two at α and zero at β | uniqueness is of inducing multiset, not arbitrary constituent | exact AL.3 title |
| 5.7 refined isolation | PGL₂,ρ=1/2,λ=0 and λ=ρ | q(0)=−1/4; q(ρ)=0; residual character occurs also in complex Borel family at ρ | keep continuous/kill residual possible; reverse impossible | directional Check |
| New gap: Nash product comparison | two real Gaussians | e^(−x²)e^(−y²)=e^(−x²−y²), value 1 at (0,0); discontinuous characteristic function fails smoothness | comparison concerns genuine Schwartz spaces | narrowed F02 |
| New gap: tensor holomorphy | families zu,zv | tensor z²(u⊗v); at z=1 value u⊗v and derivative 2u⊗v | tensor, not conjugate tensor, is holomorphic | split F03 |
| New gap: compact-isotypical topology | finite quotient GL₂(𝔽₂)=S₃ with V=ℂ⊕{(a,b,c):a+b+c=0}; cyclic quotient C₂ with trivial and sign characters | S₃ projection ranks 1,2, and trivial projection of sum-zero summand is 0; C₂ projection ranks 1,1 | finite-adelic, nonabelian and cyclic models agree; archimedean smooth vectors are not asserted to be algebraic type sums | split F03 |
| New gap: Fréchet open mapping | z→2z; zero map ℂ→0 | unit disk image has radius 2; second quotient ℂ/ℂ=0 | surjectivity onto target/closed image is required | split F03 |
| New gap: bilinear continuity | scalar multiplication | B(1,i)=i; abs(B(z,w))=abs(z)abs(w) | product estimate gives joint continuity | split F03 |
| New gap: Kostant centralizer | trivial τ; torus τ of weight 1 | centralizer rank 1 in trivial case; δ(z)−(z+1)=0; wrong z−1 leaves 2 | finite-free and tensor-character conventions agree | split F03 |
| New gap: generic semisimplicity | torus, weights ±1 at α=2 | characters 3 and 1 give a diagonal two-term sum; at SL₂ exceptional ρ the extension is nonsplit | generic hypothesis remains essential | split F03 |
| New gap: minimal types | compact torus selected weight 0; SL₂ limits | detecting type set {0}; limits contribute types +1,−1 | bounding discrete parameters allows split twists | split F03 |
| New gap: K-type growth | SU(2) irrep of highest weight n=0,1,2 | dimensions 1,2,3; Casimir n(n+2)=0,3,8; dim²=Casimir+1 | explicit polynomial bound at finite length | split F03 |
| New gap: intermediate height | positive torus, n(t)=max(t,t⁻¹) | n(1)=1,n(2)=2,n(1/2)=2; n(t)→∞ at both ends | proper height, not a depth definition | split F03 |
| New gap: cusp fibers | identity parabolic quotient; ε=1,1/2 | fiber cardinality 1; model bound ε⁻¹=1,2 | constant selected before the small threshold | split F03 |
| New gap: deep-cusp uniqueness | identity quotient; modular inversion | identity fiber contains one point; y=2 and y=1/2 have same modular image | global injection would fail; depth restrictions matter | split F03 |
| New gap: neighborhood volumes | modular cusp y=4; measure scaling c=4 | volume 1/4, Ξ=2; scaled volume 1, Ξ=1 | inverse modular-character volume, inverse-square-root Ξ | split F03 |
| Transfer-preservation boundary | relative characters multiplied by scalars 2 and 3 versus compatible scalar 2 | matching value 1 becomes 2 versus 3; compatible scalars give 2=2 | scalar normalization alone cannot imply matching | external F09 issue |

The additive indicator used for the adjoint computation is integrable with compact support. For actual smooth tests take a nonzero nonnegative smooth function supported in (0,1): the discrepancy of the old parameters is the strictly positive integral of g(x)(e^x−e^(−x)). Thus the sign failure persists within the intended test space. The noncommuting two-dimensional row also tests the finite-dimensional argument without an unintended commutativity assumption.

All original worked examples were recomputed against their definitions: genus-zero finite products give 3, −6, 3 at the three specified stages; the damped sinc gives 1 at 0 and 0 at nonzero integers; the degree-two restriction-of-scalars norm gives 4 but depth 2; circle modes 0 and 1 give kernels 1 and exp(2πi(x−y)); compact central weights 0 and 1 have the same derived Casimir 0; mixed selector values 2 and 3 normalize from 6 to 1. None refutes a repaired target.

## Mechanical checks

- **Formatting repair:** the supplied tex=1 failure came from the unformatted constant in §0.10. Enclosed it in an inline code span and preserved the quantifiers and both estimates. The installed gate’s LaTeX and TeX-residue scanners now return **latex=0, tex=0** for both README.md and this report. Acceptance elaboration, all ten signature checks, dependency direction and whitespace checks were rerun after this formatting change with the successful outcomes below.
- **Acceptance elaboration:** from the content checkout, ran the requested `lake env lean` with target packages/AutomorphicSpectralTheoryPartII/Suggested.lean. Exit **0**. Diagnostics only: `declaration uses sorry` at lines **85:8, 98:8, 108:8**. No TauCeti module is imported, so no targeted module build was needed. No Lean process from these checks remains running.
- **Binder audit:** elaborated one scratch copy containing `#check @name` for all **10** declarations, exit **0**. The seven real definitions retain their complete signatures; the three theorems retain Λ,p, the rank hypothesis; n,q,ψ, differentiability and finite-order hypotheses; and n,k,a,b, complex linear independence and the finite exceptional set. There are no section variables. All match §§0.1–0.3. No binder or Lean-name changes were needed.
- **Pins:** lake-manifest.json gives Mathlib **6b7abb3c7686292736be2955bd3eb9ebf63b456a** and TauCeti **a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039**. Inspected the native SchwartzMap fields in Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean:75, Differentiable in Mathlib/Analysis/Calculus/FDeriv/Defs.lean:170, the unconditional Multipliable/Summable definitions in Mathlib/Topology/Algebra/InfiniteSum/Defs.lean:114, MvPolynomial.eval in Mathlib/Algebra/MvPolynomial/Eval.lean:256, MeasureTheory.Lp in Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:89, and CentroidHom in Mathlib/Algebra/Ring/CentroidHom.lean:56. Lp is an almost-everywhere quotient, and CentroidHom imposes no topology. ContinuousLinearMap.isOpenMap at Mathlib/Analysis/Normed/Operator/Banach.lean:228 is the Banach theorem, not the requested general Fréchet supplement.
- **Headline form:** Suggested.lean remains unchanged: one Mathlib import, seven simple real definitions used by three admitted deep headlines, no sorry-valued data or set_option. The spectral targets affected by F01/F07 lack the automorphic induced and quotient-Schwartz carriers at the pins and are named in the module docstring. Searches for those objects at the pins found no native alternative. No README Check was turned into Lean padding.
- **Gap synchronization:** **27** unique slugs; supplier, section and needs strings match in README and plan. Removed slugs have no remaining README uses. The only changes to design/plan.json are inside its top-level gaps value; every byte outside that value is preserved.
- **Check counts:** §2.16 **3**; §3.1 **3**.
- **Citation resolver:** exit **0**; cross-roadmap citations found nowhere: **None**; Lean names found nowhere: **None**. The resolver identifies its main/index snapshot as ae2562c and 350 indexed open heads; the content checkout and pinned library files were also inspected directly. Its warning that pinned packages are not searched by that service was handled by the direct pin inspection and Lean elaboration above.
- **Dependency direction:** requested `gate --depcheck` with this README, name AutomorphicSpectralTheoryPartII, ORDER.txt and `--movable`, exit **0**. Exact output:

```text
depcheck: 47 roadmaps, 513 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. This validates this package’s outgoing dependencies; it does not place the external GGP consumer correctly.

- **Whitespace/scope:** `git diff --check` passes. Only the authorized README, the plan gaps, and this requested report were edited. The supplied tex=1 failure is repaired by enclosing §0.10’s constant `C_{S,M,r}>0` in an inline code span; the same notation in this report is formatted likewise. This changes no mathematical statement or Lean signature. No commit, merge-order edit, source fetch, tooling change or external write was made.

## Maintainer consequences

F09 requires a human decision outside this package. GanGrossPrasadUnitaryGroups gap:spectral-isolation currently asks for preservation of transfer and exact support, while its §6.4 uses that property. BPLZZ Proposition 4.8 assumes matching pure-tensor Schwartz tests at every place and base-change-compatible multipliers; it is a further theorem, not a consequence of scalar action. That roadmap needs to own the comparison using this package’s §4.3. No supplier gap was added here because none of this package’s targets needs the relative comparison.

ORDER.txt places AutomorphicSpectralTheory at 98, EndoscopicTransferAndUnitaryTraceComparison at 167, GanGrossPrasadUnitaryGroups at 261 and this package at 279. The finding proposes placing this package after its last supplier and before the GGP consumer. This repair leaves that decision and the order file to the maintainer. This is an unresolved external finding, not a claimed acceptance of it.

No Lean declaration was renamed or deleted. The obsolete gap slugs vector-holomorphy-slf, kostant-minimal-types and quotient-height-cusps are replaced as listed above; the retained nash-schwartz-analysis slug now has the narrower parent §0.14 contract. Other roadmaps citing the three unchanged interpolation headlines need no signature changes. Source formulas using λ̄ in the adjoint slot must transport to −λ̄ under this roadmap’s normalized-induction convention.
