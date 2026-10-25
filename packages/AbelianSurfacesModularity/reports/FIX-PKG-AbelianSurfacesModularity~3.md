# Repair report: AbelianSurfacesModularity

## F01 (P2) — applied

Redundant algebraization gap → ShimuraCompactifications C4.4–C4.6 under (C4-a). Removed the gap from the README and the plan. Updated Scope, both supplier contracts, §4.7, its Needs and References. Specified the complete normal base, isotrivial lattices, principal polarization and compatible square decomposition; added positive, zero and negative valuation witnesses. Néron §3.14 retains torsion, pairing and descent ownership.

## F02 (P2) — applied

Supplier seed gap → this roadmap's Weil-restriction seed target in §8.7. Added the unmarked Torelli open and Checks in §4.8, and explicit lifting, same-special-fibre deformation, polarization and theta-action statements in §8.7. Updated Scope, supplier inputs, §8.8 and Worked examples; removed the gap from the plan. Used A4.10 with A4.8 effectivity, avoiding A4.14's smooth-special-curve hypothesis.

## F03 (P3) — applied

Unpointed use of supplier §2.3 → pointed §§2.2 and 2.4, followed when necessary by an unramified section-acquiring extension and Néron–Ogg–Shafarevich descent. Updated Scope, both relevant supplier paragraphs, §4.4's API and the Needs of §§4.4, 5.1 and 8.1. Added the smooth pointless dyadic curve as a prose Check; recomputed its counts (0,6).

## F04 (P3) — applied

Dangling dataset reference → BCGP25 §10.1, p.210, line 9773, in both §7.6's conductor-1982 Check and Layer 7 Examples. BCGP25 lines 9768–9775 identify the unramified residual condition, positive dyadic conductor and displayed equation. No external dataset or new source key is needed.

## F05 (P3) — applied

Ambiguous local “§1.1” → “BCGP25 Theorem B (BCGP25 §1.1, p.3, line 150)” in §7.5. BCGP25 lines 150–158 give surjectivity and good ordinary curve reduction at 2 and 3. The roadmap's §1.1 remains the finite-group class table; no theorem hypothesis changes.

## Mathematical audit

All five findings were settled independently against the supplier statements and the existing legal source extractions. The added Torelli statement uses BCGP21 line 12976; the local open-neighbourhood route is visible in BCGP25 lines 9380–9383. A4.14 was read with its smooth genus-two special-fibre hypothesis. A4.10 supplies the polarized ordinary formal deformation and canonical lift; A4.8 supplies its effectivity. Thus constancy of the special fibre comes from the deformation problem itself, rather than being inferred from constancy of a finite Galois module.

For F03, a smooth geometrically connected curve over a finite field has a closed point over some finite residue extension. Smoothness and henselianity lift that point to a section over the corresponding unramified extension. Its inertia subgroup equals the original inertia subgroup. Applying the pointed Jacobian theorem upstairs therefore makes the original prime-to-residue-characteristic Tate module unramified, so NeronModelsAndSemistableAbelianVarieties §5.1 supplies good reduction downstairs. The underlying relative Jacobian comparison in supplier §2.2 is independent of the section; its canonical descent data give the special-fibre comparison as well. This proves the implication needed here without assuming a rational point on the original curve.

The tables record boundary and convention tests, not proofs of modularity by finite computation. Each deep endpoint retains its stated image, local, classification and lifting premises. Statements appearing more than once with the same object and hypotheses share their row. The changed objects have separate rows for their construction, defining conditions, maps and dependent examples.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Frobenius/Euler convention | Trace-one elliptic fibre at 3 and its square | Q=X²−X+3, L=1−T+3T²; product L²; inverse Frobenius gives constant 1/3 in Q | Correct direction | None |
| Cyclotomic convention | Frob₂ modulo 3; scalar ±I | ε(F)=2⁻¹=−1; ν(±I)=1 | Scalars are excluded from the outer coset | None |
| Alternating convention | Two paired basis vectors; integral 2×2 block | Pairings 1,1,0; block square −I | Characteristic-two sign loss is accounted for | None |
| Hodge–Tate normalization | Dual and ε⁻³ twist of H¹ | {0,0,1,1} → {0,0,−1,−1} → {3,3,2,2} | Scalar twists cannot give finite image | None |
| Functional-equation convention | s=0,1,2 | 2−s=2,1,0; Γ-factor exponent 2 | Centre is 1 | None |
| §0.1 modularity predicate and product API | Two elliptic factors, including equal factors | Ranks 2+2=4, r=2; denominator degree 4 | Products admitted | None |
| §0.1 isogeny and uniqueness APIs | Identity; multiplication by 3; cuspidal versus product support | Rational ranks 4=4; multiplication by 3 kills 3-torsion; support lengths 1 versus 2 | Rational comparison and isobaric uniqueness kept separate | None |
| §0.1 exterior powers | Rank-four H¹ | Ranks 1,4,6,4,1 | All-place transfer contract still required | None |
| §0.2 distinguishedness | E×E versus traces −1,2 at 3 | Square Q_E² versus X⁴−X³+4X²−3X+9; latter Q(1)=10 | Equal factors fail distinction | None |
| §0.2 residual distinction and twists | Same trace pair and its quadratic twist | Q mod 3=X²(X+1)²; twisted quartic Q(−X), point count 18 | Characteristic-zero and residual distinction differ | None |
| §0.3 cuspidal transfer normalization | GL₄ witness, GL₂ witness, product | Exponents −3/2,−1/2; product ranks 2+2 | Absolute irreducibility excludes a false cuspidal-product conclusion | None |
| §1.1 projective classes | Ten displayed classes | Sizes sum to 25920=51840/2; lift squares for 2C/2D are −I/I | Order and multiplier retained | None |
| §1.1 resolvent comparison | 4C/4D and 6G/6H | 27-point fixed counts 1/5 and 3/0, despite equal 40-point types | Quartic alone is insufficient | None; class data remain sourced |
| §1.2 scalar twists and forbidden polynomials | Both signs of (X²+X+2)² | Descending coefficient tuples (1,2,2,1,1) and (1,1,2,2,1) modulo 3 | Both excluded classes retained | None |
| §1.3 regularity | Order-five element versus squared quadratic | Derivative gcd degrees 0 versus 2 | Order eight alone does not imply regularity | None |
| §1.4 allowed-image conditions | Full group and class counts | Orders 103680/51840, index 2; 25=15+10 and 10=4+3+3 | Cyclotomic kernel is not the full image | None |
| §1.5 symplectic versus GL adequacy | First-order deformation and its reduction | ε²=0 with ε≠0; adjoint dimensions 16=10+6; ε↦0 kills the first-order term | Different obstruction spaces | None |
| §2.1 matrix dictionary | Two involutions and five-cycle | Orders 2,2,5; involution ranks 2,1; group orders 720=720 | Matches the supplied exceptional isomorphism | None |
| §2.1 parabolic boundary | Triple-transposition centralizer, intersection, transposition centralizer | Orders 48,8,48; first centralizer C₂≀S₃≅S₄×C₂ is nonabelian | Order alone does not identify the parabolic | None |
| §2.2 fixed-letter criterion | Trivial action, S₅(b), S₅(a) | Fixed letters 6,1,0; trivial action gives 15 nonzero rational 2-torsion vectors | Both directions use the chosen six-point action | None |
| §2.3 involution criterion | I, transvection, double and triple transpositions | Ranks 0,1,2,2; diagonal tests 0000,1000,1100,0000 | Two strongly odd classes | None |
| §2.4 A₅ representations | Three-cycle and five-cycle | V traces 1 and −1; U⊕U^σ gives −2 at a three-cycle; dimensions 1,2,2,4 | Embeddings and scalar extension distinguished | None |
| §2.5 near adequacy | V, End(V), scalar quotient | Dimensions 4,16,15; socle dimension 5; H¹ dimensions 0 for ad and 1 for ad/k | Quotient obstruction retained | None |
| §2.5 Schur coefficients | C₂ with additive versus multiplicative characteristic-two coefficients | dim Hom(C₂,k⁺)=1; Hom(C₂,kˣ) trivial | Coefficient-dependent library object is not the integral multiplier | None |
| §2.6 CM restriction | Index ≤2 in A₅; identity/nonidentity conjugation | Candidate orders 30,60; no quotient C₂ leaves 60; diagonals 0000/1100 | Real-place condition retained | None |
| §3.1 residual automorphy | S₅(b) sign kernel and A₅(b) | Orders 120→60 and 60→60; double-transposition sign +1 | Solvable restriction preserves the required A₅ | None |
| §3.2 2-adic modularity | Polarization type (1,2); elliptic product | Degree 4 is even; product has 2 geometric idempotents | Residual symplectic framing and End=ℤ route remain essential inputs | None |
| §4.1 ordinary Weil definition | X⁴−X²+4; (X²+2)²; zero polynomial | b=−1,4,0; constant terms 4,4,0 | Root size alone does not imply ordinarity | None |
| §4.1 reciprocity | p=2, Q=X⁴−X²+4, x=1/0 | At 1, Q(2)=16=4Q(1); total division at 0 gives 0 versus 16; cancelled polynomial gives 16=16 | Nonzero denominator hypothesis retained | None |
| §4.1 product coefficients | Traces −1,2 at 3 | b=(−1)·2+6=4; Q(1)=10 | Product convention agrees | None |
| §4.2 finite quartic table | Six row multiplicities | 3+1+4+2+2+4=16; middle coefficients ±3 both reduce to 0 modulo 3 | Integer polynomials remain distinct | None |
| §4.3 local curves | C₁,C₂,C₃ over 𝔽₂/𝔽₄ | Counts (5,7),(3,7),(3,3); (a,b)=(2,3),(0,1),(0,−1); Q(1)=14,6,4 | Recomputed | None |
| §4.4 characteristic-two affine criterion | h=1,f=x⁵; h=x³+1,f=x²+x; h=f=0 | Affine gcds 1,1,0 | Zero/nonreduced case excluded | None |
| §4.4 infinity criterion | h=1, f=x⁵/x⁶ | Infinity values 1/0 | Only first is smooth | None |
| §4.4 odd-characteristic criterion | x⁵−x and x⁴−1 over 𝔽₃ | Affine gcds 1,1; reversed infinity multiplicities 1,2 | Degree-four case excluded | None |
| §4.4 equation census | All 2048 dyadic pairs and 2187 triadic polynomials | Smooth 768/1296; ordinary 384/864; pointless 16/19 | Recomputed; section hypothesis matters on actual inputs | F03 |
| Pointless boundary smoothness | h=x³+x²+1, f=x⁶+x⁵+1 | h′²f+f′²=x¹⁰+x⁹+x⁸+x⁴ has remainder x² mod h, gcd 1; h₃=1 | Smooth on both charts | New F03 Check |
| Pointless boundary section | Same curve over 𝔽₂/𝔽₄ | Counts 0/6; affine counts 0/4, infinity counts 0/2 | No ℤ₂-section; section after unramified quadratic extension | New F03 Check |
| Relative-Jacobian descent | That unramified extension; ℓ=3 | Ramification index 1; I_L=I_K; trivial inertia on rank-four T₃ upstairs gives the same four zero inertia differences downstairs | NOS applies without a section downstairs | F03 contracts and all three Needs lists |
| Relative-Jacobian special fibre | Smooth genus-two fibre versus product fibre | Jacobian dimension 2 in both; theta component counts 1 versus 2 | Forward implication descends; converse is not asserted | F03 |
| §4.5 marked good-reduction exclusion | Odd-Q(1) case and two reference quartics | Q(1)=7 versus 4,6 | Rational nonzero 2-torsion excludes the odd count | None |
| §4.5 eigenvalue ratio | α and −α in X²+X+2 over 𝔽₃ | Subtracting equations gives 2α=0, but constant at α=0 is 2 | Ratio −1 excluded | None |
| §4.6 toric rank | Good nonordinary 6G fibre; ranks t=1,2 | Good fibre b=2 and Q(1)=7, t=0; X²+1 takes 1,2,2 on 𝔽₃; t+a=2 leaves t=2 after excluding t=1 | Bad-or-ordinary hypothesis retained | None |
| Shimura C4-a input | ℤ₂,(2); isotrivial lattice R | Quotient ℤ₂/(2)=𝔽₂ reduced; R²=−I, R⁴=I, so splitting degree 4 suffices | Complete normal base and isotriviality hold; C4-b good-prime restrictions are not invoked | F01 |
| §4.7 norm-minus-one cube | u²=u+1, t=u³ | t=2u+1, t²=8u+5; σu=1−u; N(u)=N(t)=−1; σt=−t⁻¹ | Units and cubes exist | Retained and re-evaluated |
| §4.7 symmetric principal datum | λ₁=(q,t²), λ₂=(t²,q); identity Y→X | Matrix equals its transpose; det(identity)=1; φλ₁=λ₂, φλ₂=λ₁⁻¹, matching χ₁↦χ₂↦−χ₁ | Principal and equivariant, with zero abelian part | F01 supplier input |
| §4.7 positivity and decomposition | q=8000,5,8000⁻¹; (m,n)=(1,0),(1,1),(0,0) | Valuation forms 6I,0,−6I; positive values 6,12,0; m²+n² is invariant under (m,n)↦(−n,m) | Positive datum admits the invariant square decomposition; zero and inverse periods fail | F01 Check |
| §4.7 period halves and pairing | a²=q, f₁=(a,t), f₂=(−t,−a) | f₁²=λ₁, f₂²=λ₂; φ²f₁=f₁⁻¹; e₂(f₁,f₂)=t/(−t)=−1 | Additive cross-pairing is 1 | Retained with Néron §3.14 ownership |
| §4.7 coupled marking | All 16 quadratic refinements of K₁ | 6 odd, 2 fixed, with basis values 1100/1111; each has 6 zeros; symplectic centralizer 16 in group of order 720 | Double transposition fixes a marking | Recomputed |
| §4.7 diagonal negative control | Diagonal-period Frobenius and K₀ | 6 odd, 0 fixed; centralizer 48 in group of order 720 | Triple transposition fails the marking | Recomputed |
| §4.7 mod-3 cone | Period thirds (20,u²),(u²,20) | M=diag(−R,R), M²=−I, characteristic polynomial (X²+1)²; evaluation gives multiplier −1 | Same projective class 2C on the dual convention | Retained |
| §4.7 product seeds | Tate parameter 64 and ordinary Y, plus twists | v₂(64)=6; 64=4³=8²; first mod-3 quartic X⁴+X³+X²+2X+1; second integer quartic X⁴+3X²+4 | Classes and reduction types unaffected by ownership change | None |
| §4.7 distinguished ordinary characters | Four seed pairs | Differences 1−α≠0 since Q_Y(1)=4; 2α,2,2i are nonzero | All four are distinct in characteristic zero | None |
| §4.8 P, covers and marked Torelli | Full level two; point stabilizer; trivial/full subgroup | Degrees 720,720/120=6,120,1; fixed letters for S₅(b)/S₅(a) are 1/0 | Only proper covers contribute degree >1 | None |
| §4.8 unmarked Torelli definition | Smooth sextic (x²+1)(x²+2)(x²+3) and product polarization | 6 distinct branch points, 0 real branch points; theta component counts 1/2 | Curve belongs to M₂ but has no rational odd-theta marking; product is excluded | F02 |
| §4.8 geometric product condition | Quadratic descent interchanging factors | Two geometric theta components exchanged by a group of order 2 | Exclusion concerns geometric products, not only products over F | New F02 Check |
| §4.8 local density and descent API | Product locus; smooth framed moduli; field extension | Dimensions 1+1=2 versus 3; codimension 1; the product point itself remains outside the open after base change | Any local analytic ball meets the open; rationality of B is unnecessary | F02 |
| §4.8 unmarked Torelli differential | C:y²=x⁵−x in characteristic zero | Products (dx/y)², x(dx/y)², x²(dx/y)² have independent coefficients 1,x,x²; source and target dimensions both 3; f′ is −1 at 0 and 4 at its other four roots | Tangent rank 3 supplies the infinitesimal comparison in addition to geometric Torelli | F02 proof sketch and Check |
| §4.9 bad 6G seed | Sourced bad seed versus good nonordinary Y | Conductor exponents 2/0; toric ranks 2/0; unit values i,−i differ by 2i | Class alone cannot force toric rank | None; conductor remains sourced |
| §4.10 exact realization table | All ten projective classes | Good ordinary distinguished 4; semistable ordinary distinguished 8; forbidden 2 | 2C remains supplied | F01 route updated only |
| §5.1 triadic square locus | All smooth y²=f of degree ≤6 | 1296 smooth, 864 ordinary; square multiplicities (a,b)=(-4,10):1,(-2,7):4,(2,7):4,(4,10):1; 854 distinguished | Recomputed | None |
| §5.2 scalar product seeds | Traces −1,2 and 1,−2 | Q=X⁴∓X³+4X²∓3X+9; point counts 10/18; scalar signs −1/+1 modulo 3 | Product special fibres require the Torelli-neighbourhood passage | Consistent with new unmarked construction |
| §5.3 nonscalar seeds | Four quintics in table order | Counts (7,15),(7,11),(3,13),(5,11); (a,b)=(3,7),(3,5),(−1,2),(1,1) | Recomputed | None |
| §5.3 full étale module | Scalar I versus nontrivial Jordan block over 𝔽₃ | Fixed dimensions 2/1; nonzero fixed vectors 8/2; six polynomials give eight classes | Characteristic polynomial alone cannot identify the module | None |
| §6.1 local equivalence | 2C,2D,4D and forbidden 4C,12C | Distinguished semistable seed counts 1,1,1,0,0; 2C fixes 2 odd characteristics | Coupled algebraization supports the same equivalence | F01 consequence |
| §6.2 switch and real open | x(x²+1)(x²+2) | Fixed branch points 2, exchanged pairs 2; sign +1; proper-cover degree at least 2 | Required real involution and thin avoidance agree | None |
| §6.3 infinite-family conclusion | A fixed curve and its markings | At most 6·103680=622080 markings | Infinite marked points force infinitely many curve classes | None |
| §7.1 ordinary transfer | Weight-two lifts; nodal comparison ring | Weights {0,0,1,1}; supplied component dimension 16; xy=0 has 2 components | Component premise cannot be replaced by residual equality | None |
| §7.2 fifteen-image endpoint | Full image; elliptic product; repeated Q | Order 103680; two geometric idempotents; Q_E² has repeated roots | End=ℤ and distinguishedness premises retained | None |
| §7.3 Theorem A | Forbidden quartics and full image | Two forbidden tuples (1,2,2,1,1)/(1,1,2,2,1); full-image index 1, symplectic index 2 | Exclusion and surjectivity differ | None |
| §7.4 good-curve modularity | Five ordinary dyadic curve classes; triadic squares | Zero dyadic classes in {4C,12C}; ten triadic ordinary equations fail distinction | Good curve reduction does not alone settle the triadic test | None |
| §7.5 Theorem B | Squarefree quintic versus repeated root | Branch counts 5+1=6; repeated-root discriminant 0; exceptional ordinary triadic curves have 0 rational branch points | Rational ramification supplies distinction; source §1.1 disambiguated | F05 |
| §7.6 bad-at-2 exclusion | Finite toric lattice orders; roots of forbidden quadratic | Orders 1,2,3,4,6 give cyclotomic-twisted orders 2,1,6,4,3; forbidden roots have order 8 | No order-eight toric eigenvalue | None |
| §7.6 conductor-1982 example | Source's curve and residual action | 1982=2·991, so v₂(N)=1>0; residual inertia action is identity by BCGP25 lines 9768–9775 | Residual unramifiedness does not imply good reduction | F04; conductor and representation assertions remain sourced |
| §8.1 density | Recomputed local equation loci | 624/2048=39/128; 854/2187; product 5551/46656 | Density unchanged by unramified section acquisition | F03 consequence |
| §8.2 potentially abelian decomposition | ab=4; finite-up-to-twist control | (a,b)=(4,1),(2,2),(1,4); finite twist has one weight value versus two for H¹ | Non-finiteness and oddness remain separate premises | None |
| §8.3 endomorphism-type definition | ℝ×ℝ with trivial/swapping C₂ actions | Fixed algebra dimensions 2/1; system split 2+2 versus induced rank 4 | Galois action is part of the object | None |
| §8.4 32-type modularity | Two excluded types; scalar twist | 34−2=32; weights {0,0,1,1} have two distinct values versus one for a finite twist | Exclusions retained | None |
| §8.5 parameter definition | K=F⁶, θ=(0,1,2,3,4,5); θ=0 | 15 equality hyperplanes; six distinct roots versus T⁶ with discriminant 0 | Distinct-conjugate open excludes the junk value | None |
| §8.5 twist and field-extension APIs | c=1/nonsquare d | Six branch points and 16 torsion points unchanged; infinities solve y²=1 and y²=d respectively | Nonzero leading coefficient is necessary | None |
| §8.6 identity-Frobenius obstruction | Trivial six-point action; ordinary elliptic factors | Required rational branch points 6 versus 4 on ℙ¹(𝔽₃); only positive multiple of 4 in [1,7] is 4, trace 0 | Identity case excluded | None |
| §8.7 elliptic seed definition | E/𝔽₉, t²=−1 | Affine fibre counts 1,1,0,1,0,2,0,2,0 plus infinity give 8; trace 2; roots 0,1,t are distinct | Smooth, ordinary and full rational E[2] | F02 |
| §8.7 Weil restriction and principal polarization | Degree-two finite étale extension, conjugate elliptic factors | Dimension 2·1=2; product polarization degree 1·1=1; Q=X⁴−2X²+9 and Q(1)=8 | Principal polarization descends | F02 |
| §8.7 distinguishedness | Q and Q′=4X(X²−1) | Q(0)=9; Q(±1)=8; gcd=1; b=−2≢0 mod 3 | Ordinary with four distinct characteristic-zero roots | F02 |
| §8.7 residual theta action | Swap on the two symplectic E[2] summands | 1 odd and 3 even refinements per summand; total odd 1·3+3·1=6, fixed 0, three two-cycles | Type [2,2,2]; no marked Torelli point | F02 |
| §8.7 canonical lift and deformation | Serre–Tate parameter 1 and nearby parameters ≡1 | Polarized deformation dimension 2·3/2=3; parameter 1 has two geometric theta components; all these parameters reduce to 1 in the residue deformation | Nearby unmarked Torelli points have the same A₀, without good curve reduction | F02 |
| §8.7 source negative control | (X²+2X+3)² | X⁴+4X³+10X²+12X+9; two roots each repeated twice | Does not supply distinguishedness | Retained |
| §8.7 nine other triadic seeds | Table order | Counts (4,6),(5,13),(6,10),(6,10),(5,13),(5,7),(6,14),(4,12),(6,16); (a,b)=(0,−2),(1,2),(2,2),(2,2),(1,2),(1,−1),(2,4),(0,1),(2,5) | All nine smooth, ordinary and nonsquare Q | Recomputed |
| §8.7 dyadic seeds | Three generalized models | Counts (3,3),(5,7),(6,6); (a,b)=(0,−1),(2,3),(3,5); Q(1)=4,14,19 | Order-two reference has no four rational étale points since 4∤14 | Recomputed |
| §8.7 prescribed W | Order-five unramified generic action versus ordinary self-dual model | Generic group order 16; GL₂(𝔽₂) order 6 has no order-five element | Generic finite flatness does not supply the required W | None |
| §8.8 residual modularity | S₆,A₆ and spherical primes | Orders 720,360; primes 2,3 | Same endpoint with the seed now owned here; dyadic contracts retained | F02 consumer updated |
| Worked switch chain | Coupled 2C seed and real quintic | Two local fixed odd characteristics; M₃²=−I; two real fixed branch points | No class lost when changing the algebraization supplier | F01 |
| Worked mod-2 chain | Weil-restriction seed | #E=8; b=−2; quadratic-in-X² discriminant −32, constant 9≠0; fixed odd count 0 | Same local point of Z⁺ at 3 | F02 wording updated |

## Ownership, sources and citation checks

Read the main-branch roadmaps ComplexTori, LocalGaloisGroups and EllipticCurves for shape. Used the roadmap service's object search across main and the indexed open heads, and searched the board packages, for polarized degeneration/algebraization, unmarked Torelli complements, Weil-restriction seeds and sectionless smooth families. ShimuraCompactifications is the existing algebraization owner. AbelianSchemesAndArithmeticModuli owns ordinary formal lifting, its effectivity, Weil restriction and the induced Tate-module comparison. This package owns the explicit local seed and the twisted marked/unmarked genus-two Torelli application, rather than a second generic lifting theorem. No supplier construction is redeclared in Suggested.lean.

The source passages used for the repairs were read at BCGP21 lines 12966–12980 and BCGP25 lines 150–158, 9378–9388, 9768–9775 and 10182–10223. The BCGP21 manifest entry now includes the unmarked Torelli paragraph and its use in §8.7, under the same lifetime key. FC90, KIS99 and THORNE17 remain settled as uncertified, cited only by their existing locators; none was requested again. No additional text is needed and no missing-source request was added. All new prose is paraphrased.

Every supplier was located using the roadmap service at its available main or new-roadmap head. PotentialAutomorphyInfrastructurePartII and GSp4NonregularModularityLifting are available as board designs, so their cited PL.0, PL.4, NR2.5–NR2.6, NR10 and NR11.2–NR11.6 and proof-gate sections were checked there. The three suppliers present on main are AlgebraicCurves, PolynomialGaloisGroups and EllipticCurves; their cited layers were read on main. No revision of an existing main roadmap was used as an extra dependency. A final comparison found no change in the supplier snapshots during the work. The changed contracts were checked in full, including Shimura C4-a/C4.4–C4.6, abelian A4.8/A4.10/A4.12/A4.14/A6.32–A6.33, relative-Jacobian §§2.1–2.4 and Néron §§3.14 and 5.1.

The final citation resolver, against main 8888d45e and 363 indexed open heads, reports no unresolved cross-roadmap citation and no unresolved roadmap Lean name. Its output explicitly does not check pinned library names; those were checked locally. The exact consumed library definitions were located at the pins: Mathlib Matrix.J and Matrix.symplecticGroup (Mathlib/LinearAlgebra/SymplecticGroup.lean:58,101), Matrix.charpoly (Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:132), Matrix.IsSymm (Mathlib/LinearAlgebra/Matrix/Symmetric.lean:33), alternatingGroup and card_alternatingGroup (Mathlib/GroupTheory/SpecificGroups/Alternating.lean:72,136), alternatingGroup.isSimpleGroup (Mathlib/GroupTheory/SpecificGroups/Alternating/Simple.lean:203), MulAction.stabilizer (Mathlib/GroupTheory/GroupAction/Defs.lean:515), Representation (Mathlib/RepresentationTheory/Basic.lean:48), groupCohomology.H1 (Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean:965), and Polynomial.aroots (Mathlib/Algebra/Polynomial/Roots.lean:479). Tau Ceti's AbelianVariety (TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95), coefficient-dependent schurMultiplier (TauCeti/RepresentationTheory/ProjectiveRepresentation/SchurMultiplier.lean:148) and fixed-vector theorem (TauCeti/RepresentationTheory/PGroupInvariants.lean:161) have the hypotheses described in the README.

The pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 from the content manifest. The native AbelianVariety fields give a proper geometrically integral group scheme, without polarization or torsion realizations. Pinned searches by those objects and by genus-two Jacobians and automorphic representations do not provide the carriers of the acceptance headlines. In particular elliptic Jacobian coordinates are not genus-two Jacobians. The existing Suggested.lean docstring remains accurate for the added seed route; no stand-in or padding theorem was added.

## Check outcomes

- Lean elaboration: ran `lake env lean` on `packages/AbelianSurfacesModularity/Suggested.lean` from the pinned content checkout. Exit 0; no stdout or stderr. There is only `import Mathlib`, so no TauCeti object-file build was required. No process remains running.
- Declaration/binder check: mechanical declaration inventory found zero declarations and exactly one import. There are no names for `#check @name`, so the elaborated-signature/binder comparison is empty. There is no `sorry`, `set_option`, data placeholder, admitted example or one-tactic padding declaration. Suggested.lean is unchanged; every headline remains explicitly identified as not statable on its actual missing carriers.
- Mathematical recomputation: finite-field counts, the two 720-element symplectic groups and their centralizers, and all 16 quadratic refinements were recomputed. The tables above record the values. Deep automorphy, source conductor values and the degree-40/degree-27 class labels were source-checked where used, not independently proved by these computations.
- Dependency direction: the prescribed command exited 0 and printed exactly:

    depcheck: 51 roadmaps, 603 edges, 0 problem(s)

  There is no UPWARD, CYCLE or moved line. No merge-order file was edited.
- Internal Needs scan: no self or forward section edge. The unmarked Torelli input is §4.8, earlier than §8.7; its Needs does not consume §8.7.
- Contract consistency: all 19 remaining gap slugs, suppliers and needs sentences agree exactly between the README and the plan. Comparing the parsed plan to its starting version shows that only the two named entries of the top-level gaps list changed; all other keys and values are identical.
- Structure checks: sources.toml and metadata.toml parse; `git diff --check` passes. Only the authorized README, source manifest, top-level plan gaps and this report changed. No gate failure was supplied in the brief, and none occurred in the prescribed checks.

## Maintainer consequences

ShimuraCompactifications C4.4–C4.6 is the added supplier citation; the former Néron algebraization request and abelian-moduli seed request are deleted. The ordinary canonical-lift route additionally names the existing A4.8 effectivity input. Other 19 supplier gaps, including dyadic polarized lifting and integral W-openness, remain explicit. No public Lean name or section number changed, and no other roadmap file needs an edit to resolve these five findings. No commit or network write was performed.
