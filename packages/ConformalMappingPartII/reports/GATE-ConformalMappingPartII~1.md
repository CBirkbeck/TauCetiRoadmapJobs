# Human-review response: ConformalMappingPartII

## H01 (CBirkbeck) — applied

`TauCetiRoadmap/ConformalMappingPartII/Suggested.lean:4` now identifies the headline results, and the file has 13 headline theorems with `sorry` and 12 necessary definitions instead of 60 named declarations. The previously absent abstract noncompact surface uniformization is stated on native complex manifolds at line 64, including its holomorphic inverse (Uniformization line 39).

## H02 (CBirkbeck) — applied

`TauCetiRoadmap/ConformalMappingPartII/Suggested.lean:14` identifies the missing puncture-to-cusp compactification map, roots-cover projective deck subgroup with its marked polygon, and continued hypergeometric branch, and names the geometric and continuation headlines requiring them. Those constructions remain fully specified in the README, with no placeholder predicates, admitted data or substitute theorems in Lean.

## H03 (CBirkbeck) — applied

The acceptance test shrank from 500 to 236 lines: 36 old named declarations and all 15 examples were removed, while the surface-uniformization headline was added. Boundary evaluations, API facts and negative controls remain mathematical prose and Checks in `TauCetiRoadmap/ConformalMappingPartII/README.md:137` and the corresponding later sections; four helper definitions used only by removed declarations were also removed.

## H04 (CBirkbeck) — applied

The README's undeclared API identifiers and removed Check-theorem names were replaced throughout by prose assertions and bullet APIs, beginning at `TauCetiRoadmap/ConformalMappingPartII/README.md:144`, while every retained Lean declaration is named in the README. Its explanation at line 131 now describes the headline acceptance test; source-extraction locators were also resolved against the supplied versions, including TeschlODE line 6243, Uniformization line 39 and CDT-journal line 2382.

---

**Signature audit.** All 25 retained or added declarations were put in one scratch unit with explicit `#check @name` commands and elaborated together using the prescribed module build. Comparing every emitted type with the README found no lost binder: the new surface statement retains its complex analytic manifold, Hausdorff, second-countable, simply-connected and noncompact hypotheses; the existing equation, covering, level, meromorphic-germ and radius hypotheses remain intact. The checking commands were then removed and the final module rebuilt. The global initial-value prose now explicitly states existence and uniqueness on the domain before its linear-algebra consequence, matching the admitted signature.

**Ownership and citations.** Main was checked at `0ed4485`, Mathlib at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, and Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches by object covered main, the board packages, the open-roadmap index and all twelve supplied sibling checkouts. No new supplier or ownership transfer was introduced: ConformalMapping L1–L4 supplies planar mapping and continuation, UniversalCovers Stages 0–2 supplies topological covers and lifting, FuchsianOrbifolds Layers 0, 2–4 supplies generic projective geometry and compactification, and ClassicalArithmeticCompletion §6.20 supplies the simply connected radius. This Part II owns abstract analytic uniformization, continuation of the supplied local ODE theory to general domains, the hyperbolic-domain radius extension, and the roots-specific formulas and estimates; the board's arithmetic and modular extensions consume this material. ArithmeticDynamics uses a conformal-radius estimate, but does not construct this covering theory.

All cross-roadmap links and their cited sections were checked against main, including DiophantineApproximationAndTranscendence §5.1, RiemannianGeometry R4.3/R4.7, PDE Lane C items 12–15, ComplexCurveModuli D0.4 and DifferentialGeometry §2.3. No retained declaration has another roadmap's fully qualified name. The resolver's five apparent missing Lean names are declarations elaborated here: `LinearEquation.initialJet`, `LinearEquation.global_initial_value`, `SurfaceUniformization.noncompactCoordinate`, `inverseRatio.cover_inverse` and `gammaRadius.positive_expansion`. Its remaining apparent roadmap citations, `TeschlODE, §1.2` and `McMullenRS, §16`, are source keys in the References, not suppliers.

The native carrier checks used `Mathlib/Geometry/Manifold/Diffeomorph.lean:82` (analytic regularity in both directions), `Mathlib/Geometry/Manifold/HasGroupoid.lean:284` (the open-subset charted-space instance) and `Mathlib/AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean:40` (the native simply-connected-space condition). These carriers suffice for the added headline. `Mathlib/Topology/Covering/Basic.lean:287` defines covering by evenly covered neighbourhoods and does not require surjectivity; `PointedCover` explicitly adds surjectivity and holomorphy. `Mathlib/Analysis/Meromorphic/Divisor.lean:40` assigns the integer meromorphic order on its meromorphic domain, with infinite order and out-of-domain values sent to zero; `discCounting` uses precisely that divisor. `Mathlib/Analysis/Complex/ValueDistribution/Proximity/Basic.lean:49` uses the circle mean of the positive logarithmic norm at infinity. `Mathlib/Analysis/SpecialFunctions/OrdinaryHypergeometric.lean:81` defines the native series sum, and line 116 supplies its value one at zero; neither supplies a continued branch. The native universal-cover atlas is supplied by `TauCeti/Geometry/Manifold/Instances/UniversalCover.lean:72`, not reconstructed here.

The admitted mathematical statements were compared with TeschlODE line 6243; Uniformization line 39; CDT-journal line 711, CDT-journal line 2382, CDT-journal line 2420, CDT-journal line 2560, CDT-journal line 2848, CDT-journal line 2957, CDT-journal line 3017, CDT-journal line 3054 and CDT-journal line 3084; and the existing special-function sources. The corrected auxiliary extraction locators are Uniformization line 152, Uniformization line 155, Uniformization line 213, McMullenRS line 318 and McMullenRS line 5348, and DLMF-15-10 line 76. Hem88 remains waived and KR16 remains uncertified under their existing manifest keys; no new work or source key was introduced.

**Adversarial mathematics.** The tables record exact small-instance computations or numerical evaluations, not proofs of the admitted universal assertions. Numerical inverse-cover values were obtained from the convergent hypergeometric germ near zero; mean values use angular quadrature there. Tests with a displayed trial constant check the scale only and do not assert that this trial constant works uniformly.

| Statement in Suggested.lean | Instances tried | Computed values on the two sides or defining conditions | Result; change |
| --- | --- | --- | --- |
| LinearEquation | Orders 0, 1 and 2; coefficient 1/z at zero | Order 0 requires 0<0, false; order 1 with coefficient 1 is admissible; coefficient 1/z has order −1 at zero | Positive order and analytic coefficients retained |
| LinearEquation.initialJet | y=z², order 3, x=0; y=3+2z, order 2 | Jets (0,0,2) and (3,2); factorial-rescaled alternatives give (0,0,1) | Unscaled body retained |
| LinearEquation.IsSolution | y=0, exp(−z), and 1 for y′+y=0 | Residuals 0, −exp(−z)+exp(−z)=0, and 0+1=1 | Non-example excludes omitting the equation |
| LinearEquation.global_initial_value | y″=0 with jet (3,2) at 1; y′+y=0 with value 1 at zero | Solution 3+2(z−1), jet (3,2); solution exp(−z), value 1 and residual 0 | Full-domain uniqueness retained; prose aligned |
| SurfaceUniformization.noncompactCoordinate | ℂ and 𝔻 with identity; conjugation; sphere | Identity and inverse have derivative 1; conjugation has antiholomorphic derivative 1; every holomorphic sphere-to-plane function has derivative 0 | Added full analytic equivalence; noncompactness excludes sphere |
| PointedCover | Identity, dilation by 2, square map, zero map | Derivatives 1, 2, 0, 0; square has branch point at 0; zero map's image is {0} | Covering and surjectivity exclude wrong models |
| PointedCover.exists_cover | Unit disc, ℂ∖{−1,1}; ℂ∖{0} | Disc omits ±1; roots domain omits two distinct points; last complement has cardinality 1 | Two-omitted-point guard retained |
| conformalRadius | Discs of radii 1 and 2, and unit disc pointed at 1/2 | Cover derivative norms 1, 2, 1−(1/2)²=3/4; the respective singleton infima have those values | Geometric interpretation retains eligible-domain hypotheses |
| RootsCover | N=2; source precomposition by i | Derivatives γ₂=4.37687923045 and iγ₂; the second has real part 0 and imaginary part γ₂ | Positive real orientation excludes phase change |
| schwarzian | 2z+1, z², 1/z at x=1; constant function | Values 0, −3/2, 0; totalized constant expression 0/0=0 | Nonzero-derivative guard retained for analytic identities |
| roots_inverse_schwarzian | N=2,3 at x=0.1, with actual inverse germ | Both sides respectively 1.53555759616 and 0.400851301752; at zero respectively 3/2 and 0 | Exact roots-specific identity retained |
| quotient_representation | g=0,1,2,i; h=1; ε>0 | Boundary log pairs (0,0), (0,0), (0,log 2), (0,0); m=0,0,log 2,0 | Each pair is ≤m+ε; totalized zero case retained |
| inverseRatio | N=2,3 near zero | J₂=u+u³/4+2u⁵/15+…; J₃=u+u⁴/6+103u⁷/1260+…; denominator at 0 is 1 | Real-bodied germ retained; no continued-series substitution |
| inverseRatio.cover_inverse | N=2,3, target u=0.1 | Inverse source points 0.0229047540439 and 0.0387502843516; forward compositions both 0.1; derivative products γ_N·γ_N⁻¹=1 | Both germ inverse directions retained |
| gammaRadius | N=2,3,10; totalized N=0,1 | Values 4.37687923045, 2.58105653984, 1.32030638266; junk values 1 and 0 | N≥2 remains the geometric range |
| roots_conformal_radius | N=2,3; arbitrary unit source phase | Gamma expression and alternative evaluations agree to 2×10⁻¹⁵; multiplying derivative by i preserves norms 4.37687923045 and 2.58105653984 | All phases retained, not only oriented covers |
| gammaRadius.positive_expansion | N=2,3,10,20 | E=0.00693975404, 0.000432456459, 2.11599896×10⁻⁷, 3.05336995×10⁻⁹; N⁶E=0.444144258, 0.315260758, 0.211599896, 0.195415677 | Positive residuals; absolute quantifier order retained |
| half_rotation_involution | N=2,3, z=0.02; z=0 | Both sides 1.00769226522 and 1.00013756641 respectively; at zero both 1 | Rotation sign agrees with equivariance |
| discCounting | f=1/z at r=1/2; f=1/(z−1/2) at r=1/2; f=0 | Counts −log 2, log(1)=0 and 0; omitted centre correction would give 0 in first case | Local divisor and centre term retained |
| discCharacteristic | f=z, 1/z, 2 at r=1/2 | (m,N,T)=(0,0,0), (log 2,−log 2,0), (log 2,0,log 2) | Native proximity and local counting agree |
| local_first_main_translation | f=2z, a=0, r=1/4; f=1/z; f=a | First: T=0, inverse T=−log 2, log trailing coefficient=log 2, residual 0; second: T−T_inv−log 1=0; last order=⊤ | Nonzero-germ guard excludes constant f=a |
| large_n_max_growth | Based germ at N=2,3 and r=0.02; trial C=1 | log values −2.43760140146, −2.96384710462 versus 2.04081632653, 3.06122448980; denominator at r=1 is 0 | Radius and large-level threshold retained; samples do not fix threshold |
| pivotMap | N=2 at x=0,2,1 | Values 0,4/3,0; punctured order at x=1 is −1 | Totalized root value distinguished from analytic pole |
| normalized_log_derivative | g=1 and exp(2z), R=1,r=1/2; g=z | First lhs 0, rhs log 2+1/e=1.06102662; second lhs log 2=0.69314718, rhs 1.99573828; g=z has zero at 0 | All guards retained; nontrivial estimate retained |
| uniform_mean_growth | N=2,3, r=0.02; trial C=1 | Three means approximately (0,0,0.00243912333) and (0,0,0.0000437856001); log(N/(1−r))=0.713349888,1.11881500 | Actual covers, three maps, all-level quantifiers retained |

| README statement or convention | Instances tried | Computed values on the two sides or defining conditions | Result; change |
| --- | --- | --- | --- |
| Roots-level convention | N=0,1,2 | Target at N=0 is empty since x⁰=1; at N=1 it omits only 1; at N=2 it omits ±1 | N≥2 retained |
| Complex derivative and jet convention | y=z² at zero, order 3 | Derivative jet (0,0,2), Taylor coefficients (0,0,1) | Unscaled derivative convention retained |
| Hyperbolic-domain convention | Disc, punctured plane, disconnected two-disc union | Complements contain respectively at least 2, exactly 1, at least 2 points; disconnected union has 2 components | Connectedness is separate from omitted-point count |
| Cover normalization | F_N(0), positively oriented derivative, quarter turn | Values 0, γ_N, iγ_N; norms of last two both γ_N | Orientation kept for inverse normalization |
| Effective projective action | Matrix g and −g; identity and −identity | Möbius fractions agree; both ±identity act by τ↦τ | Projective, not faithful SL₂, convention retained |
| Circle probability convention | Constant 1 on radius 2 circle | Probability mean 1; arclength integral 4π | Mean normalization retained |
| Meromorphic representative convention | Value 2 at zero, 1 elsewhere | Assigned value 2, punctured limit 1, germ order 0 | Continuity guard retained in pointwise holomorphy criterion |
| Totalized-expression convention | 1/0; pivot at root; Gamma radius at 1 | Scalar values 0,0,0, despite analytic poles in first two cases | No analytic interpretation at junk inputs |
| Absolute versus fixed-level constants | Finite constants C₂=3,C₃=5 and large-level C=4 | Finite completion max(3,5,4)=5 | Quantifier distinction retained |
| Native Cayley agreement | z=0,1/2; τ=i,3i | C values i,3i; inverse values 0,1/2; Im C(1/2)=(3/4)/(1/4)=3 | Direction, sign and inverse agree |
| Native cover-atlas agreement | Two inverse sheets over same plane coordinate | Overlap transition x↦x, derivative 1 | Atlas imported, not rebuilt |
| Companion system | y″=0, vector (3+2z,2); vector (0,1) | v′=(2,0)=Av; second vector has v′=(0,0) but Av=(1,0) | Both directions and derivative-coordinate law retained in prose |
| Local germ-space linear equivalence | y″=0 at 1, jet (3,2); y‴=0, jet (0,0,2) | Solutions 3+2(z−1) and z²; evaluations return the original jets | Supplied disc theorem compared with germs |
| ODE path continuation | y′+y=0, value 1 at zero | Continuation exp(−z); around loop ending at zero value returns to 1 | General-domain continuation retained |
| Meromorphic full basis | xy′+y=0; x²y′+y=0 | Basis 1/x has pole order 1; exp(1/x) is single valued but has infinitely many negative Laurent exponents | Identity monodromy does not replace meromorphic basis |
| Uniform pole bound | Basis 1/x and 1/x³ | Maximum pole order 3; 2/x+1/x³ also has order −3 | Finite-basis maximum retained |
| Algebraic pole clearing | Basis poles at 0 of order ≤3, p=x² | q(t)=t² gives q(p)x⁻³=x, regular | Nonconstant p and nonzero polynomial retained |
| Surface Perron envelope | Constants bounded above by 2, closed under maxima and replacement | Supremum 2, Laplacian 0 | Surface theorem retained in prose |
| Surface Dirichlet theorem | Constant data 3; Re z on unit circle; annulus radii 1,2 | Extensions 3, Re z, log(abs z)/log 2; boundary pairs (3,3), (1,−1), (0,1) | Boundary attainment and multiply connected case retained |
| Surface Green function | Radius 2 disc, pole 0, z=1 and z=2 | log(2/1)=log 2; log(2/2)=0; regular part log 2 | Logarithmic sign and boundary value retained |
| Bordered-disc embedding | Radius 2 disc | z↦z/2, inverse z↦2z, derivative product (1/2)·2=1 | Biholomorphic inverse retained |
| Exhaustion and normalized limit | Unit disc exhausted by radii 1−1/n, n≥2 | At z=1/4 the unscaled exhaustion maps give n/(4(n−1))→1/4 | Nonconstant normalized limit retained |
| Isometry comparison | Disc identity and conjugation | Real determinants +1 and −1; complex derivative of identity 1, antiholomorphic derivative of conjugation 1 | Orientation premise retained |
| Twice-punctured metric adapter | Curvature −1 disc and flat cylindrical punctured plane | Curvatures −1 and 0; standard disc vector 1 has squared length 4 | Flat cylinder excluded by curvature |
| Cover rotation uniqueness | Identity and i·identity of disc | Unique phase i; derivative norms 1=1 | Prose API retained |
| Based lifting | Identity cover, f=z/2; potential lift z/3 | First composition z/2=f; second composition z/3 differs at z=1/2 (1/6≠1/4) | Lift equation excludes arbitrary disc map |
| Nonvanishing cover derivative | Identity and square map at zero | Derivatives 1 and 0; square ramification order 2 | Unramified-cover premise retained |
| Radius positivity and classical comparison | D(0,2), normalized map z/2 | Cover norm 2; reciprocal map norm 1/(1/2)=2>0 | Hyperbolic extension agrees with supplier |
| Radius affine covariance | Unit disc, dilation 2 and translation 3 | R(D(3,2),3)=2=abs(2)·1 | Prose API retained |
| Cover extremality and equality | Identity cover, f=az with a=1/2,i | Derivative norms 1/2<1 and 1=1; based lifts have the same factors | Strict and equality cases retained in prose |
| Radius monotonicity | Unit disc inside radius 2 disc | 1≤2 | Extension kept distinct from supplied simply connected law |
| Projective deck realization | Annular cover strip with translation by 2πi | exp(z+2πi)=exp z; translation has no fixed point | Actual holomorphic deck action retained |
| Complete pullback-metric comparison | Standard disc, scale factor 2, map z/2 | Squared length at 0: 4,8,1; curvature of scaled metric −1/2; last incomplete radial length log 3 | Completeness and curvature guards retained |
| Finite-puncture cofiniteness | S={0,1,∞} | Quotient area 2π; universal-disc area ∞ | Finite area used downstairs |
| Puncture-to-cusp bijection | S={0,1,∞} | Three punctures and three cusp orbits; finite-puncture-only count 2 | Infinity retained |
| Compactification equivalence | Primitive punctured-disc coordinate q | Added point q=0 maps to puncture p; inverse sends p to 0 | Domain and added cusp specified |
| Simple q-coordinate | X=p+2q+q²; nonprimitive q=q_m² | Linear coefficients 2 and 0 | Nonprimitive generator excluded |
| Real radial cusp limit | Positive real inverse along x↑1 | ψ_N(x)→1; interior values satisfy F_N(z)≠1 | Boundary limit remains distinct from evaluation |
| Rotation equivariance | N=2, ζ=−1; N=3 matrix at τ=2i | F₂(−z)=−F₂(z); Cayley coordinate 1/3 maps to −1/6−i√3/6=ζ₃⁻¹/3 | Matrix/disc sign witness retained |
| Descended power and root independence | F₂(z)=az+bz³+…; roots ±z | F₂(z)²=a²z²+2abz⁴+… agrees for both roots; G₂(w)=a²w+2abw²+… | Generic descent imported, roots-specific consequences kept |
| Descended derivative and ramification | Chosen zero at 0; another simple zero z₀≠0, N=2 | G₂′(0)=a²≠0; near z₀² its zero has order 2 and derivative 0 | No universal-cover claim for descended map |
| Schwarzian affine and inversion laws | 2z+1 and 1/z at x=1 | Values 0 and 0 | Prose API retained |
| Schwarzian chain rule | f=g=z² at x=1 | S(z⁴)=−15/2; S(f)(1)·2²+S(g)(1)=−6−3/2=−15/2 | Squared derivative weight retained |
| Möbius invariance | f=z², M=1/z at x=1 | S(z⁻²)=−3/2=S(z²) | Pole guards retained |
| Schwarzian ODE correspondence | w=z and w=exp z | First v₁=z,v₂=1 solve y″=0; second v₁=exp(z/2),v₂=exp(−z/2) solve y″−y/4=0, S(w)=−1/2 | Factor one half retained |
| Accessory principal part | τ=log(x−p) | τ′=(x−p)⁻¹, τ″=−(x−p)⁻², τ‴=2(x−p)⁻³; S=1/(2(x−p)²) | Double-pole coefficient 1/2 retained |
| Infinity constraints | Symmetric finite punctures {0,−1,1}, m=(0,3/4,−3/4) | Σm=0; Σ(2mp+1)=−3+3=0; Σ(mp²+p)=0 | All three cancellations retained |
| Symmetric accessory parameters | N=2, ζ=−1 | m₀=0; remaining values ±3/4 | Rotational inverse convention retained |
| Roots inverse ODE | N=2 at x=0, ψ′(0)=γ₂⁻¹ | S(ψ)(0)=3/2, hence ψ‴(0)=3/(2γ₂); associated Q(0)=3/4 | Matches Schwarzian and inverse-germ cubic term |
| Boundary Blaschke factor | a=0,1,−1 | Factors z,−1,1; raw rational at a=z=1 gives 0 | Boundary extension retained in prose |
| Blaschke circle modulus | a=1/2,z=i | Numerator and denominator norms both √5/2, quotient norm 1 | Native interior convention retained |
| Finite Blaschke empty/product law | Empty family; two zeros at 0 of multiplicity 1 | Products 1 and z²=z·z | Empty product and concatenation retained |
| Finite Blaschke strictness | z=1/2; interior multiplicity 2; boundary-only a=1 | Moduli 1/4<1 and 1 | Positive interior multiplicity required |
| Normalized Herglotz logarithm | g=1 and exp(2z), R=1 | L=0 and 2z; boundary means at z=0 vanish; exp L=g | Existence and normalization retained in prose |
| Derivative Herglotz formula | g=exp(2z), R=1,z=0 | g′/g=2; circle mean 2·Re(2w)/w=2 | Kernel factor 2 retained |
| Quotient phase | G=i | log abs G=0, exponential integral 1; phase multiplier i gives i | Complex phase retained |
| Radial smoothing and boundary zeros | g=z−1, b₁=−1 | Remaining factor 1−z has value 0 at z=1 | Closed-disc zero-free input cannot be inferred |
| Optimal quotient lower bound | g=2, h=1 | m=log 2; max boundary logs max(0,log 2)=log 2 | Equality example retained |
| Gauss equation on convergence disc | a=0,b=c=1; a=−1,b=c=1 | y=1 gives residual 0; y=1−x gives −1+x+1−x=0 | Native function theorem kept in prose |
| Terminating Gauss equation | a=−1,b=c=1,x=2; denominator c=0 | Polynomial value −1, residual 0+1−1=0; c=0 is a denominator pole | Entire terminating range and c guard retained |
| Descended inverse differential equation | N=2, x→0 | Indicial terms xφ″+(1/2)φ′ have exponents 0,1/2: α(α−1/2)=0 | Branch exponents retained |
| Hypergeometric solution pair | N=2 at leading orders | φ₁=x^(1/2)(1−x/8+…); φ₂=1−3x/8+… | Independent exponents 1/2 and 0 |
| Inverse-ratio equivariance | N=2, ζ=−1 | J₂(−u)=−u−u³/4−…=−J₂(u) | Prose API retained |
| Zero-balanced continuation normalization | a=1/2,k=0 | Γ(1)/Γ(1/2)²=1/π; bracket −log x+4log 2 | Ordinary/regularized normalization distinguished |
| Digamma index and monotonicity | a=1/2,k=1 and 2 | Gaps 2log 2−1≈0.386294361 and 2log 2−7/6≈0.219627694 | k+1 index and decrease retained |
| Uniform zero-balanced tail | a=1/2,k=1,x=0.01 | Coefficient (a)₁²=1/4; first remainder term x/4·(−log x+2(2log 2−1))≈0.0134444 | Nonzero tail and logarithmic factor retained |
| Gamma positivity and denominator | N=2 | Gamma arguments 5/4,1/2,3/4,3/2, all positive; denominator Γ(3/4)²Γ(3/2)>0 | No zero denominator in geometric range |
| Alternative Gamma expression | N=2,3 | Both formulas give 4.37687923045 and 2.58105653984 | Prose API retained |
| Radius limit and cusp limit | N→∞; real x↑1 in inverse ratio | γ_N→1; s_N(x)→γ_N, so normalized inverse tends to 1 | Distinct limit variables retained |
| Local log-Gamma series | z=0; coefficient of z² | Both sides 0 at zero; quadratic coefficient ζ(2)/2=π²/12 | Branch vanishing at zero retained |
| Odd-zeta log-radius series | k=1,2 | Rational coefficients (4−1)/(2·3)=1/2 and (16−1)/(8·5)=3/8 | Signs and factors agree |
| Positive exponential remainder | First omitted square term | (ζ(3)/(2N³))²/2=ζ(3)²/(8N⁶)>0 | Explains positive N⁻⁶ residual |
| Symmetric ideal polygon | N=2 | 4 ideal vertices; area (4−2)π=2π | Actual geometric region remains README target |
| Primitive cusp width | N=2,3 | h₂=2, h₃=2√3≈3.464101615; doubled generator widths 4,4√3 | Full primitive stabilizer retained |
| Free deck presentation | N=2 | Free rank 2; abelianization ℤ², rather than cyclic group of order 2 | Elliptic rotation excluded from free deck group |
| Power stabilizer and deck index | N=2,3 | Quotient orders 2 and 3; rotation at i has fixed point i | Enlargement is distinct from free deck group |
| Largest power invariance group | Root rotation at N=2 versus general cover | F₂(−z)²=F₂(z)² while F₂(−z)=−F₂(z) | Power invariance does not imply deck invariance |
| Fundamental quadrilateral area | N=2,3 | 2π−2π/N=π,4π/3 | Quotient area ratio to deck polygon is N |
| Index-two triangle region | N=2,3 | π−π/N=π/2,2π/3; double equals preceding areas | Orientation-preserving index two retained |
| Local pole-sum formula | f=1/(z−1/4),r=1/2 | Count log((1/2)/(1/4))=log 2; boundary r=1/4 gives 0 | Open-disc versus closed-disc distinction retained |
| Local/global comparison | Globally meromorphic f=1/z,r=1/2 | Both native global and local counts log(1/2)=−log 2 | Comparison requires global meromorphicity |
| Local restriction invariance | f=g=1 near radius 1/2 closed disc, different outside | Both local divisors 0 and counts 0 | Outside values do not enter local wrapper |
| Local pole-count power law | f=1/z,n=0,2,r=1/2 | Counts 0 and −2log 2, equal to n·(−log 2) | Natural exponent zero retained |
| Holomorphic characteristic and constants | f=z,2,0 at r=1/2 | T=m=0,log 2,0 | Prose API retained |
| Local characteristic power law | f=2,n=0,2 | T=0 and log 4=2log 2 | Native proximity scaling retained |
| Pole-count positivity | No centre pole, pole at 1/4,r=1/2; centre pole 1/z | Counts log 2>0 and −log 2<0 | Centre hypothesis retained |
| Zero pole count iff removable germs | 1/(z−1/2),r=1/2; scalar spike | Count 0 in both; boundary pole outside open disc; spike has punctured order 0 but wrong point value | Both directions and continuity distinction retained |
| Local Jensen identity | f=2z,r=1/4 | Mean log abs f=−log 2; zero count log(1/4)=−log 4 plus log trailing=log 2 | Zero-minus-pole sign retained |
| First main inversion | f=2z,r=1/4 | T(f)−T(1/f)=0−(−log 2)=log 2 | Allows negative characteristic with centre pole |
| Translation proximity bound | f=0,a=2 | Difference log 2; bound log 2+log 2=log 4 | Totalized zero logarithm compatible |
| Radial monotonicity | h=2z,r=1/4,ρ=3/4 | m=0≤log(3/2) | Holomorphicity and ordered radii retained |
| Uniform cusp asymptotic | N=2,x=0.01 | Exact normalized ratio ≈0.472084729; leading expression ≈0.469884433; error≈0.002200296=(0.4400592)x/N | Signed digamma constants retained |
| Cusp-height implication | τ=i, M>0 | F̃_N(i)=0 gives cusp defect 1; threshold exp(−MN)<1 | Basepoint fails small-cusp premise as required |
| Transformed horoball diameter | g=identity,D=1; g and −g | E=2/(1+1)=1, centre 1/2, tangent point 1; sign change leaves a²+c² and tangent unchanged | Domain intersection excludes tangency point |
| Matrix-entry estimate | N=2, identity; rotation r₂ with a=0,c=1 | h₂(abs a+abs c)=2 in both cases, ≥1 | c=0 case cannot be discarded |
| Exceptional cusp membership | N=M=2; F_N value 0 versus t=√(1−exp(−4)/2) | Defects 1 and 0.00915781944; threshold 0.01831563889 | Negative and positive membership witnesses retained |
| Rotation of large cusp values | N=M=2 and target value 10 | Defect 99>exp 4; reciprocal defect 1/99≈0.010101<exp(−4)≈0.018316 | Large values enter rotated small set |
| Horoball exclusion | Trial A=4,N=8,r=1/2 | Diameter bound A(1−r)/N=1/4<1/2=1−r | Increasing threshold above A gives strict exclusion |
| Inverse-square kernel mean | R=1,r=1/2 | Mean 1/(1−1/4)=4/3 | Probability normalization retained |
| Boundary L1 logarithm | g=exp(2z),R=1 | Mean abs(log abs g)=4/π; twice m=2·(2/π)=4/π | Factor 2 retained |
| Logarithmic mean inequality | H=0,1,exp 1 | Mean log⁺H=0,0,1; bounds 1/e,1/e,1+1/e | Nonnegative and zero cases retained |
| Small-radius transfer | r=1/8,3/4 | (ρ,R,R−ρ)=(1/4,9/16,5/16),(3/4,7/8,1/8); required gaps 7/32,1/16 | Correct outer radius retained |
| Omitted-value logarithmic derivative | F_N=az+…, f=1−F_N^N | f′/f=−Na^N z^(N−1)+…; for N=2 first term −2a²z | Sign and vanishing order retained |
| Pivot partial fractions | N=2,x=2 | p₂(2)=4/3; (2/2)(1/(2−1)+1/(2+1))=4/3 | Factor 1/N retained |
| Pivot chain identity | F_N=az+…, N=2 | F_N/(2F_N′)·f′/f has first term −a²z², same as p₂(F₂) | Denominators and sign retained |
| Pivot characteristic lower bound | N=2,r=0.02 | Computed T(p∘F)=0 and 2T(F)−log 4=−log 4 | Checks additive loss at small radius |
| Fixed-level bound and small-radius completion | N=2,r=0.02 | T(F₂²)=0, log(2/(1−r))≈0.713349888>0 | Required all-radius range retained |
| Equivalence of three means | N=2,r=0.02 | Values 0,0,0.00243912333 differ by <log 4≈1.38629436 | All three holomorphic compositions retained |
| Logarithmic derivative at value one | F_N=az+… | F_N′/(1−F_N)=a+…; for N=2 constant magnitude γ₂≈4.37687923 | g(0)=1 and omitted-value guard retained |
| Covering logarithmic-derivative divisor | F=az+… at its simple zero | F′/F=z⁻¹+…; 1/F=a⁻¹z⁻¹+…; both orders −1; F/F′ has order 1 | Divisor and holomorphic reciprocal claims retained |
| Covering derivative reciprocal bound | Near zero F/F′=z+… | Ratio at zero 0, no centre pole, local count 0 | Nonvanishing derivative retained |
| Pivot characteristic upper bound | N=2,r=0.02 | T(p∘F)=0 and T(F)=0; error scale log(2/(1−r))≈0.713349888 | Positive logarithmic scale retained |
| Large-level absorption | N=2,3 | N/(N−1)=2,3/2, both ≤2 | Threshold requires N≥2 |
| Finite-level completion | Trial C=4,C₂=3,C₃=5 | Maximum 5 dominates 4,3,5 | No loss of small levels |

**Build and gates.** Commit `552db86c` contains only the two authorized roadmap files; the worktree is clean and nothing was pushed. The initial gate's only failure was the two uncommitted edits; after committing, the prescribed gate passed.

Build command: `lake build TauCetiRoadmap.ConformalMappingPartII.Suggested` — exit 0, 13 expected admitted-theorem warnings, no errors.

```text
Build completed successfully (8976 jobs).
```

Exact dependency-check output (no UPWARD or CYCLE line):

```text
depcheck: 13 roadmaps, 100 edges, 0 problem(s)
```

Exact final gate summary:

```text
gate ConformalMappingPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
