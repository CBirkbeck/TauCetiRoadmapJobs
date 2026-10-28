# Repair report: AutomorphicPadicLFunctionsPartII

## F01 (P1) — applied

Unsigned interpolation → interpolation with ε(d,β), retained through §§4.3, 7.1, 7.4 and 8.3–8.5. Section 8.4 now specifies the full signed character moment M. Removed the proposed cancellation by comparison maps. Added the nonzero Gaussian character Check and checked the existing worked example. Evidence: KS-v4 lines 3009–3035, 3507–3514; the specified maps preserve the EK coordinate's sign.

## F02 (P1) — applied

Untranslated conductor-one family → raw family followed by convolution with δ_(Art(c′)). Added boundedness, subgroup compatibility, both auxiliary relations and finite-twist behavior in §8.3. Clarified the corresponding scalar multiplication in §5.7 and the translated input to §8.4. Evidence: KS-v4 lines 2491–2498 give χ(c′)⁻¹−1; translation multiplies by χ(c′), giving 1−χ(c′).

## F03 (P1) — applied

Whole-theta/whole-measure divisibility → critical-coordinate descent in §5.4 and a separate weighted ray-quotient divisibility theorem in §8.3. Kept torsion-free groups through §§6.3–7.4; normalization follows the finite-quotient mass theorem. Added the ordinary dyadic obstruction and quotient-measure Check. Updated Conventions, the build description, §8.5 and the acceptance docstring. No small prime or critical type was excluded.

## F04 (P3) — applied

Theorem 1.1 at line 324 → weight decomposition at KS-v4 line 289, classification at lines 296–322, Definition 1.2 at line 324. The worked example's Theorem 5.22 pointer 3089 → 3009. Opened both headings and page markers; line 3089 concerns translation operators in Theorem 5.23's proof.

## Mathematical evidence and scope of the repairs

The four numbered findings were settled individually. Their proposed repairs agree with the mathematics. Boundary calculations remain prose Checks; no new Lean declaration was added. Only `packages/AutomorphicPadicLFunctionsPartII/README.md`, the missing-headline paragraph of `packages/AutomorphicPadicLFunctionsPartII/Suggested.lean`, and this report changed. The metadata, source manifest and design plan are unchanged.

For F01, put χ((λ))=λ⁻⁴ on ℚ(i). Every ideal is principal and i⁻⁴=1, so this is a conductor-one ideal character, also admissible at tame modulus (3). Its absolute value is Na⁻². Thus its L-series at zero and Euler product converge absolutely, with nonzero product. The extra factors are 80/81 at (3), (12−24i)/5 at (2+i), and (632−24i)/625 at (2−i); Local=1. The periods and factorial are nonzero. Hence the unsigned expression U is nonzero. Since ε(1,0)=−1 and δ_(7)(χ)=49−2401=−2352, both the construction and the repaired smoothed formula give +2352U. The unsmoothed value is −U. At β=1 the sign is +1, so a global scalar negation would not repair all critical types.

For F02, the homothety rule of §4.1 applied to the four-term distribution gives (χ(c′)⁻¹−1)(Nc−χ(c)⁻¹). With c=(7), c′=(3), this is −188160 before the class sign, and +188160 with ε(1,0). Convolution by δ_(Art(c′)) multiplies the latter by 1/81 and gives 62720/27=2352·80/81. With a finite twist having ψ(c′)=−1 the raw second factor is −82 and its translation is 82/81. At a vanishing second factor both values are zero; no inverse of that factor occurs. The scalar integrality argument in §5.7 multiplies by χ(c)χ(c′), which is a unit after the specified localization. It gives −188160/(2401·81)=−1280/1323, equal to (80/81)(49/2401−1).

For F03, direct computation on y²+xy=x³−x²−2x−1 gives b₂=−3, b₄=−4, b₆=−4, b₈=−1, c₄=105, Δ=−343 and j=−3375. The only affine 𝔽₂-point is (0,1), so #E(𝔽₂)=2 and a₂=1. The CM polynomial X²−X+2 has two distinct roots modulo 2. After a finite extension splitting E[15], the two-auxiliary function has 24 values 8, 192 values −1 and 8 values 0. Its trace is 192−192=0; the odd residues persist in the smooth integral special fibre. Rigidified augmentation identifies θ(T,0) times the invariant differential with the local expansion of the residue differential. A twice-integral theta function would reduce to zero there; injectivity of the local ring into its completion on the integral smooth special fibre would force the rational differential to vanish, contrary to residue 1. These are finite-level augmentation and residue comparisons, not an assertion about commuting an inverse limit with reduction.

The replacement theorem is owned here: for the specified arithmetic residue families, every finite-quotient mass of the weighted pushforward ν_(Γ₀) belongs to mO_(ℂ_p), m=[U_f:Γ₀]. The subgroup law is stated separately. These imply that ν_(Γ₀)/m is an integral measure and independent of Γ₀. This is an arithmetic target to prove, not a consequence of integral critical moments, not an additional hypothesis containing the interpolation conclusion, and not a theorem claimed of arbitrary theta functions. It applies to the raw conductor-one family as well. The source's construction is at KS-v4 lines 3468–3484 and 3681–3709; it does not supply the stronger whole-theta divisibility assertion. No supplier gap was invented for this package's own arithmetic theorem.

The finite-quotient formulation is equivalent to integral divisibility: divide ν by the nonzero integer m in the coefficient field. Divisible masses put its values on all integral locally constant tests in O_(ℂ_p), with bound one independent of the quotient. Density and completeness extend this bound to continuous tests. Conversely, m times an integral measure has every mass in mO_(ℂ_p). Intersections compare two subgroup choices, since the two products of finite indices both equal [U_f:Γ₀∩Γ₁]. Artin translation is an isometry, commutes with convolution on the abelian ray group, and preserves these mass and subgroup properties.

## Adversarial calculations

Each numbered target is represented below, with additional rows for the changed interfaces and conventions. The values are computations or discriminating local consequences, not claimed proofs of the future deep theorems. All changed Checks and the examples using their signs, periods, residues or smoothing factors were recomputed. No numerical experiment is used to certify a continuation or an arithmetic integrality theorem.

| Statement | Instances tried | Values computed on the two sides or in competing models | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: indices and ideal exponent | α=1,2,3; χ=N | a=0,1,2 and a+1=1,2,3; w=2 and χᵘ=1 give ζ_L(s−1) | Index and norm directions agree | Retained |
| Conventions: allowed bases and ideals | R⊂ℂ; zero and unit ideals | ε²=0 forces ε=0; p·1≠0; N(O_L)=1, while the excluded zero ideal has no invertible norm | No nilpotent arithmetic base or zero denominator silently admitted | Retained |
| Conventions: arithmetic Artin | Prime 2 on μ₅ | ζ₅↦ζ₅², inverse ζ₅↦ζ₅³; 2·3=1 modulo 5 | Supports distinguish Artin and its inverse | Retained |
| Conventions: class sign | (d,β)=(1,0),(1,1),(2,0),(3,0),(5,0) | ε=−1,+1,+1,+1,−1 | Dimension and β parity both matter | Propagated |
| §0.1 critical type and uniqueness | Gaussian type (−2,1); zero selected exponent | a=1, β=1 uniquely; selected exponent 0 would require a=−1 | Critical boundary correct | Retained |
| §0.1 lifted types and subgroup restriction | Quartic over ℚ(i), α=(1,2); Gaussian μ₄ | Lifted entries would be equal, so 1≠2 fails; weight (−2,1) at i is i, not 1, but is 1 on its kernel | Unit and norm-pullback conditions necessary | Retained |
| §0.2 based CM datum and transport | Scalar 2; γ=i; Serre ranks 0,1,2 | Lie/cotangent scalars 2 and 1/2; at i inverse and complementary weights are −i; dimensions 0,d,2d | Inverse action and positive-dimensional domain distinguished | Retained |
| §0.3 coefficient invariants | a=β=0; μ₆ on R/(2) with weight 3σ | Determinant weight −1; weight −1 becomes +1 modulo 2, giving nonzero invariants for a nontrivial characteristic-zero weight | Torsion-free coefficient hypothesis essential | Retained |
| §1.1 trace-zero function and API | Kernels of size 3 and 5; identity isogeny | h=(2,−1,−1), sum 0; extension has sum 4·0=0; restriction off e instead sums to −2; identity-minus-e gives empty D and 0 | Correct residue domain and zero case | Retained |
| §1.2 equivariant residue and limits | d=1, Γ=1, finite étale split D | Support degree 1 maps (h₁,h₂)↦h₁+h₂; (1,−1)↦0 and (1,1)↦2 | Trace kernel distinguished from all functions | Retained |
| §1.2 nonabelian equivariance | S₃ permuting a split three-point finite étale scheme | Invariant values (r,r,r) have trace 3r, rather than r | Generic equivariant trace does not discard degree | Retained |
| §1.3 unique EK residue class | h=0 and split h=(1,−1) | Residues 0 and (1,−1); zero class has residue 0, so cannot represent the second datum | Residue law excludes zero map and rescaling | Retained |
| §1.4 flat derivatives | z², a=0,2; z₁z₂, a=(1,1) | Zero-th derivative z²; second derivative 2; mixed derivative 1 | Ordinary derivative and divided-power conversion distinguished | Retained |
| §2.1 torsion moments | d=1, Γ=1, a=b=0; x=e | Degree 0 coordinate is augmented section value; rigidified zero-th splitting is 1 | No extra determinant factor suppressed | Retained |
| §2.2 cap and orientation | d=1; a transposition at d=2 | cap(r)=r; orientation −1 times determinant −1 is +1 | Ordering independence consistent | Retained |
| §2.2 local coefficients | Circle with monodromy 1 or −1 on ℤ | Differentials 0 or −2; H¹=ℤ or ℤ/2, with H⁰=ℤ or 0 | Constant coefficients cannot replace the given representation | Retained |
| §2.2 shift and torsion normalization | Ru, a=1 over ℤ₂; μ₂⊃1 | Shift sends u⊗u to u^[2], shuffle to 2u^[2]; normalized input 1 would be 1/2 | Shift is integral; unrestricted torsion cap is not | Retained |
| §2.3 subgroup index | Oriented circle covers of degrees 1,2,3 | Pullback integral 1,2,3 equals m·1 | Index multiplication retained | Retained |
| §2.4 refined evaluation | f=O_L; h=0 at a nonunit conductor norm | Both isogeny maps are identity in first case; pushed residue and evaluation are 0 in second | No inserted factor Nf or 1/Nf | Retained |
| §2.5 refined comparison | Identity isogeny | Both TSym maps are identity; left and right coordinates both e_(β,a) | Variance agrees | Retained |
| §2.6 polylogarithm comparison | d=1,2 | Coherent degrees 0,1; de Rham degrees 1,3 | Degrees remain distinct | Retained |
| §3.1 Borel model and metric | d=1,2; r=1,z=1,c=2 | Cover dimensions 0,1 and total dimensions 2,5; transformed metric 4·(1/2)²=1, wrong direct action gives 16 | Inverse action necessary | Retained |
| §3.2 currents and differential | d=1,(p,q)=(1,0); p=2 | Tests have type (0,1) and wedge degree 2; out-of-range current 0; Stokes sign −1 | Range and test-first sign agree | Retained |
| §3.2 local residue | Point Thom current and its double | Pairing with unit test is 1 versus 2 | Rigidification excludes unit rescaling | Retained |
| Supplier current conventions | Real dimension 2, degree 1; holomorphic degree 1 | Wedge-order transport −1; homotopy transport −1; regularization +1 | Supplier and consumer conventions separated | Retained |
| §3.3 native Hermitian formula | h=1,z=1/2,w=i/2; h=2,z=w=1 | H(z,w)=−i/4 and H(w,z)=i/4; H₂(1,1)=2 | Antisymmetry and positive metric agree | Retained |
| §3.3 summand and zero branch | z+λ=i,ν=1; z+λ=(1,0),ν=(0,1); λ=−z | Numerators −i and 0; omitted term exactly 0 before logarithms | Antiholomorphic and entire-zero conventions agree | Retained |
| §3.3 convergence and junk metric | (d,ν)=(1,0),(2,2); h=0 | Thresholds Re(s)>1 and >3; wrong h=0 gives log(0)=0 and spurious denominator 1 | Positive h and full discrete lattice required | Retained |
| §3.3 translations | h=1,z=1/2,w=i/2,a=1; dual shift | z-translation multiplier −1; dual shift exp(2πin)=1 | Both directions agree | Retained |
| §3.4 continuation headline | Square lattice, ν=0 or 1, z=w=0 | K⁰(0)=−1, Res₁K⁰=π; odd numerator cancels pairwise, K¹=0 | Continued value differs from divergent total sum 0 | Retained |
| §3.4 completion and Gamma poles | Same ν=0 case | Res₀M=−1, Res₁M=1; total Gamma(0)=0 does not represent the meromorphic product | Pointwise exclusions necessary | Retained |
| §3.4 duality and metric volume headline | h=2, Λ=ℤ[i] | Lebesgue covolumes 1,1/4; metric volumes 2,1/2; residue π/2 on both formulations | Metric Jacobian present | Retained |
| §3.4 dual iff and phase | Λ=2ℤ+iℤ; z=1/2,w=i/2 | Real dual ½ℤ+iℤ, alternating dual ℤ+(i/2)ℤ; 1/2 pairs with i to −1/2; phases i and −i multiply to 1 | Dual carrier and phase order distinguished | Retained |
| §3.5 current contraction | d=1; d=2,3 at top degree | Contraction −v dz; coefficients −2C and +6C; square lattice C=−π gives +π·barℓ/r·dz | Nonzero volume and signs agree | Retained |
| §3.5 binomial and levels | j=0,b=0,1,2; truncation 2→1 | A⁻¹,−A⁻²,+A⁻³; top degree 2 maps to 0 and degrees 0,1 keep their coefficients | Alternation and pro-compatibility agree | Retained |
| §3.6 current comparison | h=0; d=1 adjacent symmetric degrees | Source and residue both 0; coefficients +1 and −1 cancel the adjacent connection terms | Zero class and local cancellation agree | Retained |
| §4.1 orbit series and API | Gaussian μ₄,α=4 or 1; Γ′=1,t=1/3; c=2,α=4 | i⁻⁴=1 but i⁻¹=−i; four distinct torsion translates give E+E+E+E=4E; homothety factor 1/(16·4ˢ) | Invalid weight rejected; multiplicity explicit | Retained |
| §4.2 fibre integration | d=1,α=4,s=0; d=2 | Both sides 6E; logarithmic Jacobian −2 has absolute value 2 | Gamma and dimension factors agree | Retained |
| §4.3 class formula | d=1,β=0 or 1,a=3; d=2,β=0 | Coefficients −6,+6,+6 | Same sign must survive moments | Updated downstream sign statement |
| §4.3 algebraic conversion | Ω=2,q=1 | Ω∨=πi and barΩ/q=2=(2πi)/Ω∨ | Conjugation and 2πi factor agree | Retained |
| §5.1 ideal and period datum | ℤ[i]; Ω=2,q=1,u=i | Trace-dual basis 1/2,−i/2 gives diagonal traces 1,1 and cross traces 0; new Ω=2i,q=−i gives same Ω∨=πi | Inverse different and conjugate first factor necessary | Retained |
| §5.2 normalizer and API | α=3,β=0; α=2,β=1; α=(3,2); v=0 | 2v/Ω³; (2πi)v/(Ω²Ω∨); product factorial 2 versus total factorial 6; 𝒩(0)=0 | Period and factorial conventions agree | Retained |
| §5.3 partial L-function | b=O_L; χ=N | Ideal-class prefactor 1; χᵘ=1,w=2 yields ζ_L(s−1), not ζ_L(s+1) | Ideal normalization agrees | Retained |
| §5.4 critical-coordinate descent | m=1; h=0,m=2; dyadic α=2,β=0 | ν=ν; 0/2=0; weight (−1)⁻²=1, while the full theta has residue 1 after reduction | Selected coordinate and full function distinguished | Deleted whole-module claim |
| §5.5 distribution | Nc=3 | 2E(a)−Σ_(t≠0)E=3E(a)−E(c⁻¹a) | Lattice direction agrees | Retained |
| §5.6 regularized difference | Nc=7,χ(c)=2 | Complex factor 13; measure atom 13/2; multiplying by χ(c)=2 gives 13 | Character denominator cannot be ignored | Retained |
| §5.7 two conductor cases | Nc=7,χ(c)=2,χ(c′)=3 | First regularizer 13; second (1−3)13=−26; raw (1/3−1)(7−1/2)=−13/3, multiplied by 2·3 gives −26 | Scalar translation agrees | Clarified raw distribution |
| §5.7 actual Gaussian factors | c=(7),c′=(3),χ=λ⁻⁴ | Raw −188160; multiply by 1/(2401·81) gives −1280/1323 on both formulas | Nonzero factors with allowed denominators | Added Check |
| §5.8 repeated periods | L=K and quartic over ℚ(i) | Period repetition powers 1 and 2 | Extension degree retained | Retained |
| §5.9 Deligne ratio | L-value 0, period c⁺≠0 | 0/c⁺=0∈Qbar and 0∉Qbar× | No special-value nonvanishing inferred | Retained |
| §6.1 ordinary levels | ℚ(i),p=5,3; Lie(i)=3 mod 5; dyadic −7 field | Two place sets at 5, one shared place at 3; differentials of 2+i and 2−i are 0 and 4; X²−X+2 has roots 0,1 modulo 2 | Connected/étale directions and allowed small prime agree | Dyadic Check added |
| §6.2 canonical periods | Canonical basis; unit u=2 at p=5; nonunit p | Ω_p=1 then 2; pΩ_p is a nonunit and is not a basis ratio | Unit domain explicit | Retained |
| §6.3 theta construction and API | h=0; torsion-free subgroup index 2; d=1,a=β=0 | θ(0)=0; restricted theta 2θ; augmented theta Ω_p e_(0,0), with no removal of Ω_p | Determinant and subgroup laws agree without division | Torsion-free construction retained |
| §6.3 dyadic obstruction | E with Δ=−343, c=(3),c′=(5) | #E(𝔽₂)=2, a₂=1; 24·8−192=0; odd residue −1 reduces to 1, whereas twice-integral expansion would give 0 | Entire theta divisibility false | Added negative control |
| §6.4 derivatives and monomials | (1+T)²; mixed powers 2,3; zero index | Invariant second derivative 4 versus ordinary 2; mixed derivative 6; zero monomial 1 even at 0; 12·18=216=2³3³ | Factorials and coordinate products agree | Retained |
| §7.1 Amice definition and API | (1+T)^m; constant c; h=0 | Moments m^k of δ_m; cδ₀ has mass c and positive moments 0; zero h gives zero measure | No Haar substitution | Retained |
| §7.1 signed critical moments | d=1,a=3,β=0 or 1 | Algebraic-to-canonical factors Ω_p⁴ and Ω_p⁴Ω_p∨; signed coordinates −6E and +6E | Moment map adds no sign | Explicit sign statement and Check |
| §7.1 entire-measure divisibility | Dyadic datum | μ=2η would imply θ=2Amice(η), giving reduced residue 0 instead of 1 | Whole measure divisibility false as well | Added negative control |
| §7.2 torsion translation | n=0; inverse pairing on a cyclic character | Kernel size 1, coefficient 1 gives θ=θ; character times its inverse gives 1 | Generic formula and pairing order agree | Torsion-free data inherited |
| §7.3 Fourier and inflation | C₃; C₄→C₂; n=0 | (1,ζ,ζ²)↦(0,1,0); δ₀↦(1/3,1/3,1/3); (1,0,1,0)↦(1/2,0,1/2,0); size-one transform 1↦1 | Inverse kernel, denominator and annihilator support agree | Retained |
| §7.4 finite twists | ρ=1; two signed coordinates with A=2,B=3,v=5,w=7 | Constant transform has zero-frequency coefficient 1; −2·5−3·7=−31=−(10+21), whereas sign loss gives +31 | Finite linear combinations preserve ε | Added Check |
| §8.1 local factors | Trivial local character; quadratic character of 𝔽₃× | Local=1; inverse-kernel coefficient (ζ₃⁻¹−ζ₃⁻²)/3=−i/√3 versus +i/√3 | Fourier sign and nonvanishing agree | Retained |
| §8.2 atoms and mass | Nc=7,χ(c)=2; χ=1; c=O_L | Values 13/2,6,0; second atom has mass 0 | Atoms need not be units | Retained |
| §8.3 weight and tame quotient | α=2,β=1,t=2,s=3; f=O_L or (3) in ℚ(i) | Inverted character 12, weighted 6=ts; unit groups μ₄ and {1} | Derivative shift and actual tame units necessary | Retained |
| §8.3 signed smoothed formula | Actual χ=λ⁻⁴,p=5,f=(3),c=(7) | εδ_cU=(−1)(−2352)U=+2352U; unsigned value would be −2352U; U≠0 | Sign defect resolved | Signed formula and nonzero Check |
| §8.3 conductor-one translation | Same χ,c′=(3) | Raw factor 80, translated 80/81; raw signed coefficient 188160, translated 62720/27 | Artin translation is required | Constructed translated family |
| §8.3 finite-twist and zero factors | ψ(c′)=−1; (χψ)(c′)=1 | (−1/81)(−82)=82/81; in zero case 1·(1−1)=0 | Compatible with twists and vanishing | Added Check |
| §8.3 quotient descent model | δ_1−δ_(−1) on ℤ₂× | Amice 2T−T²+T³−⋯; half has moments 0,1,0,1,… and indicator value 1/2; weighted pushforward 2δ_[1], normalized mass 1 | Correct target removes the obstruction | Added Check |
| §8.3 subgroup compatibility | Indices 1; 2 then 3; zero datum | ν/1=ν; 2η/2=6η/6=η; 0/m=0 | Finite indices are positive; no infinite-level stabilizer postulated | New arithmetic target and Check |
| §8.3 auxiliary cross-relations | Evaluate at χ with δ_b=B,δ_c=C,δ′_(b′)=B′,δ′_(c′)=C′ | B·CM=C·BM; B′·CC′M=C′·CB′M, also when a factor is 0 | Translated moments satisfy both relations | Added API |
| §8.3 complementary depletion | Unramified values 2 and 3; ramified value convention 0 | (1−2)(1−3)=2; individual factors −1,−2; ramified factor 1−0=1 | Entire product retained, no inverse of zero | Retained |
| §8.4 signed M and boundedness | Gaussian χ; C₂,C₃ averages; bounded difference vanishing on twists | M/(Ω_p⁴)=−U; average character values 1 or 0 but indicator values 1/2,1/3; bounded difference gives 0 on dense span and closure | Uniform congruences remain essential | M explicitly signed; translated family specified |
| §8.5 final formula and scaling | Gaussian χ; β=1; α=2,u=2 at p=5 | Final normalized value −U and smoothed +2352U; β=1 sign +1; both normalized sides scale by 1/4 | Agreement with construction and period covariance | Signed interpolation |
| Worked Gaussian example | α=2,β=1 | a=1, ε=+1, divisor Ω_p²Ω_p∨ and multiplier (2πi)/(Ω²Ω∨) | Existing worked value unchanged | Sign made explicit; locator repaired |
| Worked non-CM example | x²=1+i | x⁴−2x²+2=0; N(1−i)=2 is not a rational square; lifted coordinate count 2 | Period repetition survives without a CM involution | Retained |

The division-free translation tests include c′=O_L: the residue function and both second factors are zero. For the local coefficient and cover tests, nonabelian S₃ was used only for the generic equivariant trace, since number-field units and ray groups are abelian. The p=2 and p=3 tests on the congruence criterion have identity-indicator values 1/2 and 1/3; the repair does not invert these primes. Rank zero and h=0 are excluded by the explicit positive-dimension and positive-metric hypotheses of the analytic headlines, while the real-body definitions retain their total zero-branch values.

## Sources, ownership and citations

Both cited works are the legal cached texts under their existing manifest keys. All KS locators refer to the 85-page arXiv v4; no journal numbering was substituted. The BKO-2021 scope boundary was checked at BKO-2021 lines 70–95. No other work was introduced, fetched, renamed or left unread, and no missing-reference request is needed. The source formulas were read as mathematical data; none supplied work instructions.

Read main-roadmap exemplars `TauCetiRoadmap/ThetaSeries/README.md`, `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md` and `TauCetiRoadmap/GlobalNumberFields/README.md`. The repair preserves the existing layers, API lists, dependencies and prose Checks. The source-bearing claims used in the repair were opened at KS-v4 lines 289–357, 2353–2406, 2491–2498, 2620–2655, 2941–2955, 3004–3035, 3084–3093, 3392–3545 and 3681–3736.

The content main checkout is 5f173a7b9ac37eb6b62d01eb3db5047b92d19363. Citation resolution used that main and the supplied index of 362 open heads. Existing-roadmap revisions were not used as suppliers. The new-roadmap suppliers were opened through the roadmap service; section ownership was compared with the following locations.

| Supplier | Sections read and interface checked |
| --- | --- |
| GlobalNumberFields, main | Layers 2, 7, 9–10: ray carriers, tame congruence units, ideal characters and infinity types. The avatar and converse classification remain declared gaps. |
| ClassFieldTheory, main | Layers 7, 11–13: arithmetic Artin, global reciprocity and ray fields. The completed tame-unit kernel remains its declared gap. |
| ThetaSeries, main | Layer 1 items 1A, 1E, 1F and Layer 2 items 2A, 2C: positive Poisson phase, summability, Gaussian transform, real dual and covolume. The consumer's alternating dual remains i times the real dual. |
| SchemeAndStackFoundations, main | §§2.6–2.7, 2.19–2.20, 2.23: affine acyclicity, support cohomology, coherent duality and derived equivariance. No whole-theta divisibility is inferred. |
| AlgebraicTopology, main | Stages 5–6 and Stage 8 items 5, 7, 8: covers, oriented caps, local systems and classifying comparison. Finite torsion is not assigned an unrestricted integral cap. |
| DifferentialGeometry, main | Layers 0–1 and 5: forms, differential, integration and Stokes; retained wedge-order conversion. |
| Hyperfunctions, main | HF2.AnalyticPreparation.CurrentResolution: compact-current topology, regularization and signed homotopy. |
| AbelianSchemesAndArithmeticModuliPartII, supplied head | P0.1–P0.6, P1.1, P2.1–P2.8, P3.2–P3.4, P4.1–P4.3: moment and rigidified augmentation conventions, étale-dual torsion splitting and ordinary integral trivialization. The owner explicitly leaves EK classes to consumers. |
| ComplexMultiplicationAndExplicitReciprocity, supplied head | §1.3, including cmHodgeEigenspaces: inverse cotangent weights, norm degrees, Serre tensors and period comparison. |
| ComplexComparisonPartII, supplied head | C1.1, C5.1, C5.4: bundle Dolbeault, comparison and current calculus. Mixed Borel bidegrees and residue trace remain exact supplier gaps. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory, supplied head | R07.1.7, R07.1.9, R07.1.13: Cartier duality, henselian connected–étale sequence and the complete-noetherian-base formal comparison. The ordinary CM extension remains contracted. |
| PadicMeasuresIwasawaAlgebras, main | §§0.1, 1.2, 1.7, 2.1–2.2, 3.1: restriction, convolution, integral weighting and projection. The new arithmetic use of Artin translation uses these operations; they are not reconstructed here. |
| AutomorphicLFunctionsAndLocalFactors, supplied head | AL.0 finite Fourier levels and AL.1 local Gauss sums, Euler products and rank-one comparison. Positive Tate and inverse finite kernels remain distinguished; the unitary shift is retained. |
| PeriodsAndSpecialValues, supplied head | PS.0–PS.1: determinant periods, criticality and normalized-value predicates, with period nonvanishing separate from L-value nonvanishing. Hecke realization and explicit CM-period extensions remain gaps. |

Object searches used the roadmap service on main and the indexed open heads, and `rg` in the board packages, for EK classes, completed Poincaré coefficients, theta residues, multivariate Amice and unit-index measure descent. Generic geometry and measure calculus retain the owners above. The additional theorem here concerns these specific coherent residue measures after arithmetic weighting and ray pushforward. Modular or Shimura theta constructions in the search results are different objects. No competing owner of this arithmetic theorem or duplicate fully qualified acceptance declaration was found. No additional open work outside the supplied index was sought.

All twelve existing supplier-gap slugs and their exact needs sentences still match between the README contracts and the top-level design-plan list. No generic supplier construction was moved into this package, no new gap was required, and no later roadmap was made a supplier.

At the manifest pins, Mathlib is 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti is a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The following native definitions were inspected rather than inferred from their names:

| Pinned declaration | File and evidence |
| --- | --- |
| AbstractMeasure | `Mathlib/NumberTheory/Padics/Measure/Basic.lean:40`: continuous linear functionals on continuous tests; the body contains no mass-one or operator-bound-one field. |
| AbstractMeasure.dirac and AbstractMeasure.map | `Mathlib/NumberTheory/Padics/Measure/Basic.lean:97` and `:105`: evaluation and precomposition. These fix the direction of the new translation and pushforward. |
| AbstractMeasure.dirac_mul_dirac and AbstractMeasure.diracHom | `Mathlib/NumberTheory/Padics/Measure/Monoid.lean:98` and `:115`: convolution of atoms follows multiplication of their supports. |
| AbstractMeasure.amiceTransformEquiv | `Mathlib/NumberTheory/Padics/Measure/AmiceTransform.lean:157`: ℤ_p-valued measures on ℤ_p, rather than the coefficient-complete multivariate theorem. |
| IsZLattice | `Mathlib/Algebra/Module/ZLattice/Basic.lean:433`: separate DiscreteTopology argument and full-span field. |
| ZLattice.covolume | `Mathlib/Algebra/Module/ZLattice/Covolume.lean:72`: a real volume with the displayed measure argument; the elaborated acceptance signatures use product volume. |
| TauCeti.Comodule.isInternal_weightSpace and endOfPoint_tmul_of_mem_weightSpace | `TauCeti/Algebra/Coalgebra/Comodule/MonoidAlgebra/Basic.lean:416` and `:568`: decomposition and scalar action; no disappearance of nontrivial weights on arbitrary torsion modules. |
| HeckeCharacter.IsAlgebraic and unitaryPart | `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Algebraic.lean:60` and `Shift.lean:273`: character conditions and norm shift, without CM period or EK residue data. |

The object search at these pins supplied no completed equivariant EK, ordinary CM theta or coefficient-complete multivariate Amice carrier that would make the unstatable arithmetic headlines into native acceptance statements. The repair therefore changes the missing-headline explanation, not the analytic theorem signatures, and introduces no surrogate predicate or sorried datum.

## Check outcomes

- Required elaboration: `lake env lean` on `packages/AutomorphicPadicLFunctionsPartII/Suggested.lean`, with its absolute tool argument and the supplied content working directory, exited 0. Exactly two warnings: declaration uses `sorry`, at lines 63 and 86. There is one `import Mathlib`; no TauCeti import or prerequisite object build was needed. No Lean process remains running.
- Mechanical signatures: elaborated a scratch copy with `#check @name` for each of all four declarations. Exit 0, with the same two warnings. Compared all four displayed types with §§3.3–3.4. Both definitions retain their native arguments; both theorems retain d>0, full/discrete lattice and positive h. The functional equation retains the full dual-membership iff, both Gamma exclusions, pole exclusions and punctured residue limit. Product volume is explicit in the elaborated covolume. No binder was lost and no declaration signature needed changing.
- Acceptance-file shape: two real-body definitions and two headline theorems, each with `sorry`; no added API lemma, boundary theorem or example, no sorried data, no prohibited import and no `set_option`. All four local names occur in the README. Their names are unchanged.
- Citation resolution: exit 0, no unresolved cross-roadmap citation and no unresolved local Lean name. Its stated inability to check pinned Lake declarations was addressed by the pinned-file inspection and Lean elaboration above.
- Required dependency check: exit 0. Exact output:

```text
depcheck: 51 roadmaps, 588 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Neither tooling nor merge order was edited.

- `git diff --check`: exit 0, no whitespace errors. No gate failures were supplied in the brief; no additional gate-failure repair was needed.
- Scope checks: 44 numbered README targets remain; all twelve gap contracts match; only the authorized package files and this requested report were edited. No commit, push, issue or pull-request write was made.

## Maintainer consequences

Consumers of the interpolation formula must retain ε(d,β). The mathematical symbol μ_(O_L,c,c′) now means the Artin-translated family; the untranslated output is explicitly μ^raw_(O_L,c,c′). Integral unit-index normalization of measures is supplied on the weighted ray quotient, while the torsion-free theta and Eisenstein measures before it need not be divisible by the full unit index. No Lean declaration was renamed or deleted, and no external roadmap file needs changing for this repair. The arithmetic descent and bounded-division targets remain mathematical work for the finished library; passing elaboration and these boundary calculations does not prove them.
