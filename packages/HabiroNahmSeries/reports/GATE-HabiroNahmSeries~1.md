# HabiroNahmSeries human-review response

The seven numbered review findings contain thirteen distinct repair or integration points, numbered below in their original order. Locations refer to the repaired files; the repair commit is 4d36740.

## H01 (CBirkbeck) — applied

The stationary shift in TauCetiRoadmap/HabiroNahmSeries/README.md:1381 now uses z(T^m), V(T^m) and Λ(T^m), followed explicitly by T=t^(1/m); the congruence sum, removed summand, support and difference-variable conventions are specified at lines 1384–1398. For A=0,m=2,T=1/2 the stationary value is 3/4 rather than 1/2, agreeing with GSWZ Definition 2.11, (117)–(118), GSWZ line 1506 and the refined sum (126), GSWZ line 1598.

## H02 (CBirkbeck) — applied

Frobenius naturality now requires the p-complete base square fψ_p=ψ′_pf, with the coefficient square proved by étale uniqueness, in TauCetiRoadmap/HabiroNahmSeries/README.md:129 and :1512; the t=1 specialisation verifies its base square explicitly at :1650. The negative control computes 32≠2 at p=5, while t=1 gives 1=1, matching QWittVectors §6.1 and HabiroRings’ completed-frobenius-base-naturality contract.

## H03 (CBirkbeck) — applied

TauCetiRoadmap/HabiroNahmSeries/README.md:1721 adds integral descent to B[1/γ]⊗ℤℤ[ζ_m] before inverting m, and :1724 requires convergent Frobenius reexpansion also when p divides m; membership, descendants and the all-root residue export explicitly consume these targets. The scalar export at :1850 additionally requires determinant-involution descent from B to R; 1/5 at order five and the incompatible edge P₅=1,P₂₅=0 are excluded in nonzero completions, as required by GSWZ Definition 1.1, (13), GSWZ line 260 and HabiroRings §§5.2–5.3.

## H04 (CBirkbeck) — applied

The canonical figure-eight determinant root is i/r rather than 1/r in TauCetiRoadmap/HabiroNahmSeries/README.md:2019, giving δ(i/r)²=1 rather than −1, and the corresponding §6.4 Check uses the same root. Comparison with the separate knot normalisation takes place in the explicit common field E=K(r,i); adjoining the canonical determinant root alone is not assumed to supply the scalar i.

## H05 (CBirkbeck) — applied

TauCetiRoadmap/HabiroNahmSeries/README.md:2023 now gives the canonical jet −1/24+11/(72s) and second coefficient −335/15552+11s/5184, and :2030 defines the separate series g=−i exp(h/24)f_can, retaining the q-factor, embedding and coefficient extension. The Pochhammer comparison is expressed on g and transported explicitly from f_can, with first coefficients (5z−7)/27 and (16−15s)/243; global membership and K₃-index transport retain their own hypotheses instead of following from this jet (GSWZ line 94 and GSWZ lines 2718–2741).

## H06 (CBirkbeck) — applied

TauCetiRoadmap/HabiroNahmSeries/README.md:103 separates cyclic descent under gcd(n,w_F)=1 from generic finite-Chern injectivity under gcd(n,M_F)=1, and :813 applies the former to the totally real cyclotomic field, where w_F=2. At n=5 the two gcds are respectively 1 and 5, while n=3 is also excluded by the generic factor six; the distinction follows CGZ Proposition 2.5, CGZ line 521, Theorem 2.11, CGZ line 699, and Theorem 1.2/Remark 1.4, CGZ line 112.

## H07 (CBirkbeck) — applied

The formerly undefined η_ζ is the explicit projective-symbol sum at TauCetiRoadmap/HabiroNahmSeries/README.md:805, with its torsion, scaling law and identity 2ξ_ζ=η_ρ−[0] at :811–813, using the separately identified special cyclotomic torsion interface. The n=3 Check retains η_ρ=[0] and R_ζ([0])^(−2)=ζ², so discarding the correction changes the answer to 1 (CGZ (34), CGZ line 1202; (51)–(52), CGZ line 1880).

## H08 (CBirkbeck) — applied

The Rogers trigonometric sum in TauCetiRoadmap/HabiroNahmSeries/README.md:803 now cites (46)–(47), p. 37, rather than (48)–(49); the latter remain the separate modular-transformation and radial-phase inputs. The cached version places these at CGZ line 1763 and CGZ line 1804 respectively.

## H09 (CBirkbeck) — applied

TauCetiRoadmap/HabiroNahmSeries/README.md:423 and its API now distinguish rβ=0⇒rΛ∈(π²/2)ℤ from rc_d=0⇒rdΛ∈(π²/2)ℤ. The added A=1,x=1/2,d=2 Check computes 3Λ=π²/4, which fails the old statement, and 3·2Λ=π²/2, which satisfies the corrected statement (CGZ (42), CGZ line 1680).

## H10 (CBirkbeck) — applied differently

TauCetiRoadmap/HabiroNahmSeries/README.md:9 now states the precise conditional arithmetic boundary: HabiroNumberFields supplies cyclic/finite-Chern and global-module contracts, and PadicHodgeRegulators supplies the local K₃ lattice; analytic convergence and formal admissibility are independent of them. Neither has a readable roadmap on main or in the supplied open-head inventory, and their board packages contain reports but no README, so no section-level supply is claimed and none of their general theory is replanned here; the pull-request description is outside the authorised edit set.

## H11 (CBirkbeck) — disputed

The supplied merge ledger already places K3BlochGroups at ORDER.txt:115 and HabiroCohomologyFoundations at :210, both before HabiroNahmSeries at :227; the README already has both direct supplier contracts. Their supplied open heads contain K3BlochGroups Layer 3 and HabiroCohomologyFoundations §4.21, and the dependency check reports zero problems, so adding them to or changing the ledger is unnecessary.

## H12 (CBirkbeck) — applied

TauCetiRoadmap/HabiroNahmSeries/README.md:11, :78 and :141 now consistently import the shared pre-Bloch carrier, antisymmetric cokernel and boundary from K3BlochGroups §§3.1, 3.3–3.5, with ColemanIntegration §L2.Fb supplying evaluation on that carrier. The supplied K3BlochGroups head assigns exactly this ownership at TauCetiRoadmap/K3BlochGroups/README.md:15; its §5.8 real Rogers detector is also consumed before constructing this roadmap’s complementary projective-convention adapter, avoiding a second generic detector.

## H13 (CBirkbeck) — applied differently

TauCetiRoadmap/HabiroNahmSeries/README.md:32 explicitly identifies B_CGZ with K3BlochGroups §3.13’s B_old=A/(A∩C_ext), retaining the intersection repair and the exact 2-primary comparison kernel and cokernel; its §§3.14–3.16 B_new is distinguished integrally, with |F|≥4 retained for the comparison isomorphisms. This is stronger than an implicit convention adapter: over F₁₁ the owner’s B_new is ℤ/3 and B_old is ℤ/6, and the permitted extended relation at (2,1) has nonzero exterior boundary 2∧(−1) over ℚ (CGZ Definition 1.1, CGZ line 82; TauCetiRoadmap/K3BlochGroups/README.md:923).

**Ownership, sources and acceptance signatures.**

Ownership was checked by object against main at 6f49035, the board packages and the supplied open-head inventory, including the listed sibling checkouts. The added stationary, scalar-descent and explicit cyclotomic comparisons are applications of Nahm constructions owned here; the generic Bloch carrier, real detector, completed Frobenius, arithmetic module and local regulator constructions retain their identified suppliers. No declaration uses another roadmap’s fully qualified name. HabiroNumberFields and PadicHodgeRegulators remain unreadable prerequisite contracts, not certified source theorems supplied by an available roadmap; no later supplier or ownership move was introduced. Cross-roadmap resolution reports no unresolved roadmap citations or own Lean names.

Only the module docstring changed in TauCetiRoadmap/HabiroNahmSeries/Suggested.lean. A scratch file containing #check @name for each of its 16 declarations elaborated successfully, and every resulting type was compared with the corresponding README statement and the supplied earlier signatures: no declaration type changed and no binder was lost. In particular positive definiteness, the square nonsingular Jacobian, Im τ>0, symmetry of the formal matrix and m>0 remain explicit where required. The added arithmetic, Gaussian and all-root endpoints are named as unstatable at the pins with their missing carriers; no substitute theorem or data was introduced.

The pin audit used Mathlib 6b7abb3 and Tau Ceti a91d3aa. Mathlib/LinearAlgebra/Matrix/PosDef.lean:164 defines positivity with Hermitian symmetry and positivity on every nonzero finitely supported vector, permitting empty rank; Mathlib/RingTheory/Unramified/Finite.lean:158 retains the free-module hypothesis for finite_of_free. TauCeti/LinearAlgebra/FiniteBilinearModule/GaussSum.lean:172 requires nondegeneracy for the squared-norm identity, and :284 supplies the separate quadratic-radical quotient formula. Object searches found no pinned Nahm, integral pre-Bloch, indexed number-field Habiro or weighted stationary-expansion carrier to replace the README-only constructions.

All mathematical source evidence came from the legally cached works already recorded in packages/HabiroNahmSeries/sources.toml. No new source or unresolved reference request was needed; no source text was copied into the repository or report.

**Adversarial mathematics record.**

These are finite-instance and convention checks, not proofs of the admitted headlines or of the newly specified integral-descent obligations. In the table s²=−3 and z=(1+s)/2; exact rational arithmetic, polynomial reduction and Wick contraction were used where values are rational or algebraic, and the trigonometric equation residuals were evaluated numerically to 13 decimal places. Rows distinguish local verification from an all-order proof obligation.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| quadraticExponent | Rank zero, C=3/2; A=2,B=1,C=11/60,n=0,1 | 3/2=3/2; 11/60 and 131/60 | Constant and half-factor retained | None |
| NahmDatum | A=√2; all-ones rank two | Value at 1 is √2>0; value at (1,−1) is 0 | Real irrational datum allowed; singular analytic datum excluded | None |
| NahmEq | A=1,x=1/2; x=0,1 | 1−1/2=(1/2)¹=1/2; endpoints give 1≠0 and 0≠1 | Open cube discriminates | None |
| existsUnique_nahmEq | Rank zero; A=1 | One empty tuple; 1−x=x gives x=1/2 | Degenerate and rank-one instances agree | None |
| nondegenerate_zero_isAlgebraic | X²−2 at √2; X² at 0 | Polynomial values 0,0; Jacobians 2√2≠0 and 0 | Repeated-root case excluded without denying algebraicity | None |
| nahmSummand | A=2,B=C=0,q=1/2,n=0,1,2 | 1,1,1/6 from numerator/finite denominator | Index and quadratic factor agree | None |
| analyticNahmSum | Rank zero,C=0 and C=1/2,τ=i | 1 and exp(−π) | Empty sum retains C | None |
| nahmSummand_summable | Rank zero; irrational A=√2,q=e⁻¹ | Single term exp(−C); numerator exp(−n²/√2) | No rationality needed; quadratic decay present | None |
| analyticNahmSum_holomorphic | Rank zero; τ=0 with N=1 | exp(2πiCτ) entire; denominator at n=1,τ=0 is 0 | Open-half-plane domain retained | None |
| formalExponent | A=−1,n=2; A=3,n=1,2 | −3; 3,9 | Negative integer powers legitimate | None |
| formalNahmSeries | A=3,q=2; empty matrix | First coefficients 1,8,512/3; empty coefficient 1 | Signed and empty conventions agree | None |
| formalNahmSeries_qDifference | A=0,1,3,−1 and two coupled matrices, each coordinate 0≤n_i≤2,q=2 | Every coefficient difference LHS−RHS is 0 | Full columns, negative diagonals and zero indices pass | None |
| generalizedQBinomial | (r,k,q)=(−1,2,2),(−4,2,2),(2,1,2),(0,1,2); k=0 | 1/8,155/512,3,0; 1 | Negative upper index is retained | None |
| formalNahmSeries_symmetrisation_qBinomial | A=0,1,3,−1, coupled ((2,1),(1,1)) and ((0,1),(1,0)),k=(2,…,2),q=2 | LHS=RHS respectively 1,1,10795/64,155/8,93345/128,0 | General product survives mixed and negative data | None |
| rationalGaussTaylor | m=0,1,2,3,4,6,8 | 2,1,0,1,2,0,2 | Total m=0 value retained | None |
| rationalGaussTaylor_eq_gaussSum | m=1,2,3,4,5,6,8; m=0 control | Norm²/m=1,0,1,2,1,0,2; at 0 totalised quotient 0≠2 | Positive-order hypothesis necessary | None |
| Rational denominator | Q=n²/4,n=1,d=4,2,0 | 4Q=1,2Q=1/2,0Q=0 | Positivity and integrality are separate | None |
| Strong period | Q=n²/4; constant Q=1/2 | Q(n+2)−Q(n)=n+1; constant shift difference 0 with D=1 | Period need not clear Q | None |
| Signed equation | A=3 versus unsigned A=3 | Polynomials z³−z+1 and x³+x−1; discriminants −23,−31 | Signs identify different fields | None |
| Nahm discriminant | Empty rank; A=0; A=2,z=2 in F₅ | 1; δ=z; δ=0 | Singular evaluation excluded | None |
| Coordinate ring evaluation | Cubic z³−z+1=0 | z(1−z²)=1; δ(2z²+3z−9)/23=1 | Inverted units have actual inverses | None |
| Positive-solution Hessian | A=1,x=1/2; empty rank | H=2>0; det(empty)=1 | Positivity agrees with native predicate | None |
| Coherent root lift | x=1/4,d=2; x=1/16,d=4 | y=1/2, y²=1/4; y⁴=1/16 | Negative roots fail positivity; compatible squares agree | None |
| Cleared polynomial/Jacobian | d=1,A=2; d=1,A=−1 | 1−Y−Y² with derivative −1−2Y; (1−Y)Y−1 | Negative exponents require clearing by units | None |
| Generated fields | A=1; A=1/2,d=2; empty rank | Degrees 1; 2 and 2; 1 | No gratuitous or missing field extension | None |
| Unsigned Bloch class | A=2; rational A=1/2,x=y² | x∧x²=0; res(c₂)=2β | Rationalisation and integral restriction distinguished | None |
| Signed boundary | A=3; doubled class | z∧(−1); 2z∧(−1)=z∧1=0 | Unmultiplied integral lift not automatic | None |
| Integral Nahm model | Cubic; singular F₅ point | δδ⁻¹=1; 0·b=0≠1 | Universal localisation excludes bad point | None |
| Embedding regulator and torsion detector | Figure-eight and its conjugate; real x=1/2 | ±2.0298832128; 0 | One real zero does not test all embeddings | None |
| Rational restriction/qbar comparison | c₂=2β; rational division by 2 | res(c₂)/2=β; torsion becomes 0 after tensoring with Q | Rational comparison retains denominator | None |
| Projective Rogers representatives | x=1/2,2,−1,0,1,∞ | π²/12,−π²/12,π²/4,π²/6,0,−π²/6 | Reflection and inversion give the stated values | Compare with supplied detector |
| Rogers detector adapter | ρ([1/2]) and ρ(c) | −π²/12→+π²/12; −π²/6→+π²/6 modulo π²/2 | Negation and period reduction fixed | Supplier comparison explicit |
| Unmultiplied Rogers torsion implication | β=[0],r=3 | 3Λ=3π²/6=π²/2 | Correct period | Retained separately |
| Denominator-scaled Rogers torsion implication | A=1,x=1/2,d=2,r=3 | Old 3Λ=π²/4; new 3dΛ=π²/2 | Old statement false; new one passes | Repaired |
| Factor-log branch | w=0; w=q=1/2; w=3,q=1/2 | 0; log(3/8) for first two factors; initial factors −2,−1/2 | Nonvanishing does not select logarithm branch | None |
| Constant-shift and block laws | Rank zero,C=1/2; direct sums | τ↦τ+1 multiplies by −1; exp(a+b)=exp(a)exp(b) | C cannot disappear | None |
| Shifted Euler–Maclaurin | f(s)=s,[0,1],θ=0,1; M=0 | 1/2+(θ−1/2)=θ; empty interval 0=0 | B₁ sign and endpoints agree | None |
| Pochhammer remainder | w=0; m=1,ν=0,w=1/2 | ψ=0; first ε coefficient −1/12 | Zero and Bernoulli correction agree | None |
| Radial displacement guard | m=1,ν=−2,w=e⁻ε | qw exp(−νε)=1 | Initial factor vanishes when guard fails | None |
| Dedekind phase | (a,m)=(0,1),(1,3),(2,5) | χ=1,exp(πi/18),1; printed binomial phase at (2,5) is e(1/5) | Phase conventions distinguishable | None |
| Saddle linear term | n=s/ε+v/√ε | −εBn=−Bs−Bv√ε | Negative B sign fixed | None |
| Saddle covariance and parity | One coordinate; cubic perturbation | Second moment m/H; cubic integral 0; sixth moment 15(m/H)³ | Half-factor and odd cancellation agree | None |
| Euler first correction | A=2,B=C=0,m=1 | −1/60; deleting correction gives −1/60+1/24=1/40 | Euler contribution necessary | None |
| Finite-product main term and global tails | n=0; fixed Gaussian tail v=ε^(−1/12) | Main dilogarithm difference 0; Gaussian exp(−cε^(−1/6)) | Boundary and beyond-all-powers scale agree | None |
| Polynomial Gaussian functional | M=1; covariance ((2,1),(1,2)) | Moments 1,0,1,3; mixed fourth moment 2·2+2·1²=6 | Mixed contractions retained | None |
| Gaussian lattice scale | N=1,P=1,h=m√ε | Integral √(2πm); unscaled leading sum √(2πm)/(m√ε) | Covolume contributes m⁻¹ | None |
| Finite Gauss congruence factor | A=1,B=0,m=3,a=1,D=2,4 | (1−1)/2=0; (1−1+1−1)/4=0 | Vanishing respected by additive expansion | None |
| Analytic radial expansion | Rank zero; C=1/2 | e^(−Cε/m)=1−ε/(2m)+… | C correction survives empty Gaussian | None |
| Radial Kummer fields | d=m=1; d=2,m=3,x=1/4 | η=θ=x; η³=1/2 and θ=η² | Coherent root fields retained | None |
| Radial root-change identity | d=2,m=3,η↦ζη | θ↦ζ²θ; holding θ fixed gives difference (ζ²−1)θ≠0 | Arbitrary independent root rotations excluded | None |
| Chern constant comparison | Φ₀=0 versus Φ₀=1 | Normalisation 0/0 undefined versus 1/1=1 | Nonvanishing condition explicit | None |
| Unit-series descent | Φ=1+aε, m=2; Φ=ε | Φ²=1+2aε+…; Φ₀=0 for ε | Coefficient division uses characteristic zero and unit constant | None |
| Andrews–Gordon sine tuple | n=3,5,7,9 | Equation residuals empty,0,(0,0),(0,0,0) to 13 decimals | Retains empty and higher-rank cases | Expanded Checks |
| Andrews–Gordon Rogers sum | n=3,5,7 | 0,π²/15,2π²/21 | Formula (n−3)π²/(6n) agrees | Locator corrected |
| Cyclic descent hypotheses | n=3,5; F totally real | gcd(n,2)=1; gcd(5,M_F)=5; 3 divides M_F | Generic injectivity cannot replace cyclic descent | Repaired |
| η_ζ projective definition | n=3,k=0,±1 | [∞]+2[0]=[0]; no 0/0 since ζ−ζ⁻¹≠0 | Degenerate symbols retained | Added |
| Cyclotomic torsion/scaling | n=3,a=2; n=5,a=2; conjugation | 4≡1 mod 3; 4 mod 5; (−1)²=1 | Scaling consistent with n-torsion | Added |
| Half-root/Nahm identity | n=3,ξ=0; n=5,ρ=ζ³ | 2ξ=0=η_ρ−[0]; 4·3²≡1 mod 5 | Correct half-root and constant class | Added |
| Cyclotomic acceptance and 3-correction | n=3; n=5 | ζ²≠1; correction factor 1 for n=5 | [0] correction necessary at 3 | Added |
| Width-normalised cusp order | 7q_w²+3q_w³,w=3; period 6 | 2/3=4/6; coefficient 7→7ζ₃² under chart shift | Order invariant, coefficient not | None |
| Cusp sum/product/inverse laws | Cancelling germ −7q_w²+2q_w³ | Sum 5q_w³ has order 1; inverse pole order −2/3 | Leading cancellation not suppressed | None |
| Radial cusp estimate | σ=S; σ=((2,1),(5,3)) | At zero growth exp(2πλ/y); at 2/5 inverse coordinate −3/5+i/(25y) | Sign, phase and c² scale agree | None |
| Residue majorant exact split | A=2,B=1,C=11/60,m=2 | Shifted B=1/2,3/2; Q(s)=11/60,131/60 | A remains unchanged | None |
| Finite Euler block bound | m=2,n=1; m=1 | 1+e⁻ᵗ≥1; identical positive factors for m=1 | Even orders included | None |
| Cusp minimum/order bound | A=2,B=−3,C=5 | Q(1)=Q(2)=3, leading coefficient 2 | Minimum need not occur at n=0 | None |
| Modular order-one cancellation | A=2,B=0,C=−1/60 | −1/60+1/60=0 | First relative power cancels | None |
| Fixed-field Kummer comparison | n=1; n>1 with u^s in base | Quotient at n=1 is 0; [u^n]^s=[(u^s)^n]=1 | Bounded power uses a fixed integral class | None |
| Unbounded good orders | L=6,k=1,2 | d=37,73; gcd(d,6)=1 | Prime order is unnecessary | None |
| Divisibility/torsion bridge | G=Z,element 1; G=Z/5,n=6,11 | 1 not in 2Z; 6,11 act as 1 on Z/5 | Unbounded and one-order cases distinguishable | None |
| Augmentation log/exp | 1+t; 1+t₁t₂; constant 2 | t−t²/2+t³/3; mixed coefficients 1,−1/2,1/3; constant 2 excluded | Augmentation domain essential | None |
| Plethystic coefficients/admissibility | (t;q)_∞ and inverse; (−t;q)_∞ | L₁=1 and −1; latter L₂=1/(1+q) | Finite Laurent support is stronger than a formal product | None |
| Root Laurent map | 1/(1−q) at ζ=1,−1 | −x⁻¹; 1/2+x/4+x²/8 | Poles retained instead of evaluating at x=0 | None |
| Potential/discriminant/root-unit factorisation | A=0,1; m=2 | V=−Li₂(t),Li₂(t); residues +t²/4 and −t²/4 | Root sign and m² denominator agree | None |
| Formal defining q-system | A=3 and A=−1,n=2 | q³/(q−1); exponent −3 for A=−1 | Signed integer rather than positive-only data | None |
| Deformed solution | A=0,1,3 | 1−t; (1−t)⁻¹; 1+t+3t²+12t³ | Constant-one branch fixed | None |
| Shift-ratio cocycle | A=0,a=1,−1 | (1−t)·σ((1−q⁻¹t)⁻¹)=1 | Negative shifts use unit inverses | None |
| Root orbit | A=0,m=2,q=−1; m=0 | (1−t)(1+t)=1−t²; empty orbit 1 | m=0 excluded from z(t^m) claim | None |
| Critical-value/logarithmic Hessian | A=0,t=1/2 | Θ²(−Li₂(t))=−t/(1−t)=−1=Λ⁻¹ | Hessian variable convention agrees | None |
| Finite support | A=0,1,3 | L₁=−1,q,q³; A=3 L₂=q⁷,L₃=q¹⁰+q¹¹+q¹³ | Laurent rather than rational tails | None |
| Dwork logarithm | F=(t;q)_∞,p=2,first t coefficient | LHS 2/(1−q); RHS 2/(1−q) | A simple root pole is allowed | None |
| Congruence-series support/system | m=2,k=1; A=1,m=3 | H=t+O(t³); initial operator factor 1−q⁰=0; sign −1 | Restored and normalised pieces differ | None |
| Restricted Adams coefficients | F=1+t₁t₂,m=2; (t;q²)_∞ at q=−1 | L_(1,1)=−(1−q²),L_(2,2)=(1−q²)/2; 1/4 | Rational value in Z[1/2], not integral at 2 | None |
| Level localisation/cancellation | m=2,Φ₄(q)=1+q² | Φ₄(−1)=2≠0; denominator 1/(2Φ₄) gives 1/4 | Allowed poles cannot be deleted by other root orders | None |
| Weighted Gaussian domain | w³/h; w²/h; empty rank | Weights 1/2,0; bracket 1=1 | Positive-weight condition distinguishes domain | None |
| Wick/Fubini | Covariance 1; Λ=((0,1),(1,0)) | Sixth moment 15h³; full det −1, first block 0 | Full contraction need not permit iterated first block | None |
| Corrected local ψ | m=1 and m=2 | Quadratic residual 1/2−1/2=0; linear subtraction Li₁(u²)/(2h) | Earlier local repair retained | None |
| Gaussian stationary point | A=0,m=2,T=1/2 | Correct 1−T²=3/4; wrong 1−T=1/2 | Old shift false | Repaired |
| Gaussian potential/covariance level substitution | A=0,m=2,T=t^(1/2) | V(T²)=−Li₂(t); Λ(T²)⁻¹=−t/(1−t) | Tuple, potential and covariance use same parameter | Repaired |
| Refined sum/normalisation | m=2,a=3,d=6,k=1; a=1 | Indices 1,3,5; stationary z(t³); for a=1 only index 1 and z(t) | Residue sum and kth summand are explicit | Added |
| Gaussian mixed regularity and q-shift | m=2,k=1 | Restored exponents 1+2n; normalised exponents 2n; t↦q²t | Ordinary t-indices follow after normalisation | Repaired |
| Coefficient scheme/Kummer étaleness | Empty rank at p=2; w³=z at p=5 | Derivative 2T=0 mod 2; 3w² a unit at 5 | Inverting 2 and m has a specific role | None |
| Rank-one WKB | A=0,1,3 | b₁=0,0,3X²; signed z₁=1+t, unsigned z₀=1−t+… for A=3 | Normalisations distinguished | None |
| Completed coefficient Frobenius | A=0,t=2,p=5; t=1 base | 32−2=30≠0; 1⁵−1=0 | Étaleness alone insufficient | Repaired |
| p-saturation/full-algebra transfer | Z₅ identity; split u²=1,u↦1 | v₅(25)=2 retained; u−1 gives 0 on one factor,−2 on other | One branch loses a nonzero reduction class | None |
| A=5 branch control | p=5,T=±z² | δT²=1 on both; T−z²=0,−2z² | Both determinant factors required | None |
| Gaussian coefficient localisation | Empty rank and split determinant | Constant coefficient 1; T²=δ⁻¹ on each factor | No inference of divisibility from a single factor | None |
| Jet polynomial | C=T₃=1; C=b=T₃=1; empty coordinates | 5/24; 29/24 versus 17/24 if mixed term dropped; c | Wick polynomial tested independently | None |
| Refined first-jet integrality | m=1,k=0; finite denominator at m=2 | Finite sum 0 at k=0; 1−ζ₂=2 | p=2 excluded from this local test | None |
| Intrinsic W_p | η_i=0; ξ=0 | W_p=pΣℓ₂(1−z_i); regulator defect 0 | Positive sign and zero-class case retained | None |
| Modified-potential off-diagonal term | A=((2,1),(1,1)),η=(a,b) | ηᵀAη=2a²+2ab+b² | Both off-diagonal terms required | None |
| Regulator specialisation/completed exponential | D_pξ=p²,m=1; D_pξ=0 | Pole coefficient p²; 0 for zero class | Completed expression is not an ordinary series | None |
| Kummer orientation | Representative ε→εu^m | Chosen root ε^(1/m)→uε^(1/m); torsor unchanged | Does not determine Chern orientation by itself | None |
| Specialisation at one | Cubic; split δ=a² | Relation becomes 1−z+z³=0; T=±a⁻¹ | Finite presentation preserves both factors | Frobenius condition explicit |
| Regularisation of Gaussian expression | A=0,m=1,first t coefficient | −t/h removed by +Li₂(t)/h; regular coefficient +t/2 | Wrong sign leaves −2t/h | None |
| Membership versus local generator | Two generators with constants 1 and −1 | Sum has constant 0 although each constant is a unit | Nonvanishing not imposed on every member | None |
| Powered auxiliary product | γ=2,q=2,F⁺=t,μ=(1,1) | Correct 16t⁴; reversed rescaling 256t⁴ | Substitution order matters | None |
| Unpowered auxiliary product/system | Same data; negative shift γ=1,ν=1 | 16t²; negative rescaling t/2 | Powered and unpowered objects differ | None |
| Auxiliary uniqueness | q=(2,1) in K×K | (q−1)(0,1)=(1,0)(0,1)=0 | Nonzero is weaker than regular | None |
| Product polar cancellation | A=0,γ=2 | Powered potential −Li₂(t²)+Li₂(t) has t coefficient 1; unpowered defect 0 | Only the unpowered product cancels | None |
| Need to invert γ | A=0,γ=5,m=1,q=1+x | First t coefficient 3−2x+x²+x³/5+… | p=5 coefficient is not integral without 1/γ | None |
| Integral descent before inverting m | p=m=5,γ=1 | v₅(1/5)=−1; completion of C₅[1/5] is 0 | Localised condition was insufficient | Added |
| Reexpansion at p-divisible orders | p=5,m=5,edge to 25 | Constants 1→1 give 1=1; 1→0 gives 1≠0 | Nonzero integral completion detects the defect | Added |
| Descendant curve | m=2,ν=1,q=−1+x; ν=−1,m=1 | t=1−2x+x²; 1−x+x²−… | Constants equal 1; using t=q at m=2 gives −1 | Integral transport strengthened |
| Torsion-power and converse interfaces | ξ=0,n=1; zero collection | Index 1·0=0; all constants 0 for zero collection | Nonzero-constant hypothesis needed for converse | None |
| Rational residue kernel | A=0,m=N=1,t=u,w=1−2u | J=(1−w)/(1−w−t); first x coefficient 2/u−4 | Ambient localisation retains genuine pole | None |
| Normalised residue/product | A=0,m=1; off-diagonal A,m=2,T=1/3 | Raw −1/(1−t),normalised +1/(1−t); corrected value 2,uncorrected −2 | Residue sign and q^(−c_A) agree | None |
| Finite residue Jacobian | A=0,m=2,T=3/5 | Inner sum 16/3; normalised value 5/2=1/(1−T) | Factor m and T retained | None |
| Scalar determinant descent | δ=a²,B=R×R; figure-eight | Values at ±a⁻¹ both δ⁻¹; (1,−1) changes under involution; (±i/r)²=δ⁻¹ | Invariance gives scalar rather than one-factor descent | Added |
| Cubic algebraic discriminant | z³−z+1=0 | δδ⁻¹=1; norm δ=−23 | Exact quotient reduction | None |
| Cubic product and corrected root numerator | q=1,−1,first t coefficient; m=2 | 5,1; T² coefficient 4 rather than 5 | Corrected z⁻¹ numerator retained | None |
| Cubic exponent positivity/support | n=1,2,3 | Supports {3},{7},{10,11,13}; n=3 row 1,1,0,1 | Endpoint interval and exception distinguished | None |
| Cubic small-prime descent | Displayed first root coefficients; order divisible by 2 or 3 | Denominators powers of 23; p-completion after 1/p would be 0 | Finite coefficient data do not prove all-order descent | Stronger general interface retained |
| Quartic coordinates | u⁴+u³+3u²−3u−1=0 | Both Nahm equation residuals reduce to (0,0,0,0) | Exact rational-coordinate comparison | None |
| Quartic discriminant and inverse | Same quotient | δδ⁻¹=(1,0,0,0); norm δ=9025≠7⁴ | det A cannot replace δ | None |
| Quartic integral basis arithmetic | e=(u³−u²+2)/5 | e²−3e+1=0; trace Gram determinant −475; −11875/(−475)=25 | Index is 5; maximality still required separately | None |
| Quartic units | u,v,1−u,1−v | Norms −1,1,1,−1 | Coordinates are units, δ has nonunit norm | None |
| Quartic q/ε normalisation | ε=log(1+x) | ε=x−x²/2+x³/3; coefficients c₁,c₂−c₁/2,c₃−c₂+c₁/3 | Change of variable retained | None |
| Quartic Bloch torsion/descendant rank | Zero class versus proposed quartic class | 60·0=0; an eight-vector spanning set without independence has rank ≤8 | Source finite coefficient data supply no exact torsion/rank proof | Explicit proof obligations retained |
| Neumann–Zagier matrix dictionary | 𝒜=0,ℬ=I; ℬ singular | A=I; inverse undefined for ℬ=0 | Invertibility hypothesis necessary | None |
| Figure-eight discriminant | z²−z+1=0 | (2−z)/z=−s; norm(−s)=3 | Embedding and sign agree | Retained |
| Figure-eight determinant root | r²=s,T=i/r; T=±1/r | δT²=1; δ(±1/r)²=−1 | Sign change of old root cannot repair square | Repaired |
| Figure-eight canonical first jet | Explicit two-dimensional covariance and cumulants | −1/24−11s/216=(1−11z)/108 | Differs from knot jet by −1/24 | Repaired |
| Figure-eight second jet | Wick terms through weight two | b=−335/15552+11s/5184 | Agrees with q-factor transport | Added |
| Figure-eight knot transport | g=−i exp(h/24)f_can | g relative coefficients −11s/216,−697/31104; h³ coefficient 724351s/100776960 | Source’s first three coefficients recovered | Added |
| Figure-eight symmetrisation | Canonical and knot relative coefficients | 2b−a²=−1/27 for both; leading squares δ⁻¹ and −δ⁻¹ | Relative product unchanged, leading scalar changes sign | Repaired |
| Figure-eight Pochhammer transport | Coefficient conjugation retained/omitted | Correct −1/6+5s/54 and (16−15s)/243; omitted conjugation gives −1/6−s/108 | Branch, conjugation and q-factor all matter | Transport linked to canonical series |
| Cubic knot scalar identity | α³−α²+1=0 | −24α²+32α−26+2(2α²−2α+3)² reduces to 0 | Two square roots not discarded | None |
| Rational Gauss arithmetic gluing | m=1,2,4;p=3; p=2 edge 1→2 | Values 1,0,2 remain 1,0,2 under ×3; 1≠0 at ×2 | Inverting 2 has a detectable effect | None |
| Square Gauss companion | m=1,2,3,4,8 | i,0,−i,−2,−2; polynomial gives +2 at 4 | Corrected sign and conjugate p=3 edge retained | None |
| Rogers–Ramanujan residue identity | F=−1/2±√5/10; F=0,−1 | −5F²−5F=1; 0,0 | Raw-residue sign fixed | None |
| Degree-zero comparison | Rational Gauss class minus unit | Root values 0,−1,1; q=1 completion 0 | Completion loses a nonzero global class | None |
| Transported Picard pullback | R→R×R; completed bases 1,1+h | Component ranks (1,1); restricted rank 2; both bases reduce to 1 | Tensor pullback and basis choice distinguished | None |
| Higher-cohomology analytic interface | Series Σp^(−n)x^n; geometric degree N versus 0 | Radius 1/p<1; degree remains N | Positive radius alone does not give whole-unit-disc convergence | None |
| B_old versus B_new convention | F₁₁; F₂ | Z/6 versus Z/3; B(F₂)=0 versus B_old(F₂)=Z/3 | Integral and small-field comparisons need their hypotheses | Adapter explicit |
| Extended five-term exterior boundary | X=2,Y=1 over Q | Boundary 2∧(−1), detected as 1 by valuation/sign pairing mod 2 | C_ext need not be contained in exterior cycles | Intersection repair explicit |

**Build and gate outcomes.**

`lake build TauCetiRoadmap.HabiroNahmSeries.Suggested` exited 0, with the seven expected admitted-theorem warnings and no errors:

```text
Build completed successfully (8976 jobs).
```

The scratch elaboration of all sixteen `#check @name` signatures exited 0. The dependency-direction check exited 0 with its entire output:

```text
depcheck: 28 roadmaps, 253 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The final gate against origin/main exited 0 with this exact summary:

```text
gate HabiroNahmSeries: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Only TauCetiRoadmap/HabiroNahmSeries/README.md and TauCetiRoadmap/HabiroNahmSeries/Suggested.lean were committed. The worktree is clean, and no push or external reply was made.
