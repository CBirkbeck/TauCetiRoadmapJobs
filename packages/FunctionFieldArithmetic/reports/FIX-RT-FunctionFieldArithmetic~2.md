# FunctionFieldArithmetic repair report

The finding identifiers below are grouped by review, since both reviews restart at F01. The earlier-round verification tables contain no additional unresolved findings. No independent acceptance is claimed.

# RT-FunctionFieldArithmetic_r2a

## F01 (P1) — applied differently

Self-owned finite-field Picard/Lang constructions → AL.3 imports; generic rigidification → RelativeJacobiansAndIntegralCurveModels §§1.3–1.5 imports. Retained scheme/structure extensions, perfect-field universality, coordinate comparisons and arbitrary finite abelian groups. Repaired Summary, ownership, contracts, build description, §§4.5–4.10 and dependencies. The requested inversion is incorrect: both READMEs use O → L (§4.6; supplier §1.3).

## F02 (P1) — applied

Fixed-centre subtorus → full closed diagonalizable subgroup, retaining every component. Both cuspidal and discrete-data continuation now use component coordinate rings and common denominators. Added GL₂/P=G Check: z=±1 both restrict trivially to scalar degrees 2d. Evidence: AutomorphicSpectralTheory §1.11; morris1 line 2714 explicitly retains connected components.

## F03 (P2) — applied

Unstated native headline → `riemannRoch_reducedBasis`, with a Layer 1 comment and README declaration reference. It retains arbitrary constants, inseparability, a compatible rational-subfield embedding, unique sorted invariants and one basis chosen before every integer shift. Added the inseparable x=t^p Check. Native inputs: RiemannRoch/Basic.lean:87 and Divisor/Principal.lean:247; Hess remains settled uncertified.

## F04 (P3) — applied

Torus Levi implies singleton Weyl sum → P=H_n implies singleton Eisenstein sum and identity intertwiner. Explicitly distinguished the proper GL₂ Borel, whose torus Levi has two ambient Weyl terms. Recomputed both continuation Checks together with the fixed-centre Check; no Lean boundary theorem was added.

## F05 (P3) — applied

Deleted both polynomial examples and their docstrings from `packages/FunctionFieldArithmetic/Suggested.lean`. Retained the general polynomial-data predicate, uniqueness and function-field realization theorems. README §5.6 still tests genus zero and N₁=9 versus 8: the required linear coefficients are respectively 3 and 2.

## F06 (P2) — applied

Uniform local degree r → gcd(r,d_v) factors of degree r/gcd(r,d_v), with arithmetic Frobenius φ^(d_v). Added r=d_v=2 and (r,d_v)=(3,2) Checks in §0.1. Rechecked §5.1’s complementary place-degree formula and every constant-cover use in §§4.9–4.10, §5.5 and worked example 3; their formulas stay unchanged.

## F07 (P2) — applied

Unstated Witt exactness headline → `witt_additiveHilbert90`, using real coefficientwise automorphism/inclusion maps and a sum with Witt addition. Its explicit context includes prime p, characteristic p on both fields, finite dimension, Galoisness and a generator. README §3.1 names it; added length-two trace Check (1,t). Evidence: kw line 276; Truncated.lean:62,74,78,270.

## F08 (P3) — applied

Undeclared own API names in code spans → mathematical notation or prose, throughout the roadmap. Besides the reported chart, lattice, numerator, Abel, modulus, Lang and automorphic names, repaired Lubin–Tate, Schmid–Witt, finite Euler-factor, Chebotarev, adelic-point, constant-term, cusp-module and density notation. Kept API labels in prose; added no acceptance catalogue. All 18 declared names remain advertised.

## F09 (P3) — applied

Incomplete unavailable-headline inventory → explicit inventory of adelic Fourier/volume, reduced Witt/conductor, local reciprocity, modulus geometry, finite-coefficient L-functions, quantitative Chebotarev, Harder, Yu, inducing characters, unitary continuation, density interpolation and Fourier coefficient carriers. The three native additions are identified as statable. In particular §§5.7 and 6.7 now have their exact missing interfaces named.

# RT-FunctionFieldArithmetic_r2b

## F01 (P2) — applied

Local existence described as unstatable → `localAbelianExistence_laurentSeries`, with open finite-index H, a unique finite Galois abelian intermediate field, norm-group equality and degree=index. README §4.2 retains transport to every equal-characteristic local field. Added H=Kˣ Check. Evidence: yoshida line 686 and line 905; LaurentSeries.lean:502 supplies the valuation topology without a reciprocity carrier.

## F02 (P3) — applied

Unsupported earlier consumer → deletion of ArithmeticStatistics from the downstream list. Applying the same order test also deleted the claims for FunctionFieldArithmeticPartII, GlobalShtukasAndFunctionFieldLanglandsPartII and MotivicEtaleKTheory, which likewise precede this roadmap in the supplied merge order. No merge-order edit or new dependency was made; later GlobalShtukasAndFunctionFieldLanglands remains listed.

## F03 (P3) — applied

Quantitative Chebotarev §5.10 → §5.8. Updated its heading, ownership cross-reference, module-docstring locator and the existing kosters manifest entry’s cited_for field. Literature references to Rosen Theorems 5.9–5.10 and Yoshida Proposition 5.10 remain unchanged because they are source locators.

## F04 (P3) — applied

Certificate/presentation language → ring quotient isomorphism and projection compatibility for N′≤N, with zero rings at N=0. Deleted the group-presentation sentence and its Check clause. Retained the quotient isomorphism in finite ray data: it mathematically identifies the finite group rather than describing a certificate. Recomputed truncation at N=0,1,2 and the finite degree quotient.

## F05 (P3) — applied

Odd-characteristic explanation → ordinary multiplication on diagonal coordinates and unramified trace duality on off-diagonal coordinates; split case → matrix trace. Added characteristic-two Gram matrices to §7.3. The global odd-characteristic hypotheses remain those of the Eisenstein/Weil construction. The review’s inert rank-one witness conflates these coordinates: Herm₁ consists of base-field scalars, paired by tb.

# Required validation

- Final elaboration of `packages/FunctionFieldArithmetic/Suggested.lean` with the prescribed `lake env lean` invocation from the content checkout: exit 0, exactly 11 “declaration uses sorry” warnings, no errors or other diagnostics. No missing Tau Ceti object file occurred, and no build command was needed.
- A single scratch file containing the final source followed by `#check @name` for all 18 declarations elaborated: exit 0, the same 11 warnings. Each printed type was compared with its README statement. No standing binder was lost; the three added signatures carry their hypotheses explicitly. The seven real definitions/abbreviations retain their intended broad domains; arithmetic theorems separately require finite exact constants.
- Final dependency check, with the supplied order and `--movable`: exit 0. Its complete output is:

```text
depcheck: 32 roadmaps, 297 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

- Citation resolution against main and indexed open heads: exit 0, no missing cross-roadmap citations and no names found nowhere. That tool reported its pinned-package lookup unavailable; pinned declarations were checked directly in the supplied libraries instead.
- Static inspection: 18 named declarations, 11 sorried theorems, seven definitions/abbreviations with real bodies, zero examples, one Mathlib import and the used TauCeti RiemannRoch.ClassNumber import; no set_option or sorried data. Every declared name occurs in the README. No separate gate failures were supplied in the brief.
- Only the permitted README, Suggested.lean, sources.toml and this requested report changed. Metadata is unchanged; this package has no design/plan.json, and no supplier gap is needed because the required contracts already exist. No commit or external write was made.

# Ownership, locators and pinned inputs

Main was read from the supplied content checkout. Main roadmap shapes consulted include AlgebraicCurves, ClassFieldTheory and SchemeAndStackFoundations. For a supplier already on main, its main text was used, rather than a progress pull request. Other supplier texts were obtained with roadmaps show; ownership searches used roadmaps grep, the board packages, active/completed main and all 31 specifically supplied sibling folders. The sibling Witt/q-Witt, regulator, density and Eisenstein occurrences concern different objects or consume their named generic owners. No newly declared fully qualified name collides with another readable roadmap.

| Supplier | Contract verified in its README |
|---|---|
| AlgebraicCurves | Layers 0–12; in particular finite normalization without separability in Layer 2, curve dictionary, constant extension and one-pole genus/different |
| ArithmeticGaloisDuality | §R02.3.2, function-field places/ideles and class formation; finite Artin/norm quotients and degree direction |
| AutomorphicLFunctionsAndLocalFactors | AL.3 curve additive analysis, unramified and ramified rank-one reciprocity, cuspidal Fourier expansion, Whittaker factorization and spherical normalization at nonzero conductor |
| RelativeJacobiansAndIntegralCurveModels | §§1.3–1.5: finite-flat rigidification O → L, unit sequence, smooth algebraic space and universal family; additional scheme/structure assertions remain here |
| ArithmeticGaloisRepresentations | §§1.8, 2.5, 3.7 and 5.13: Brauer–Nesbitt, inertia-invariant factors, AS conductor and function-field Frobenius inputs |
| DeligneWeightsAndPurity | §§1.6, 1.9 and 3.7, including finiteCover_degreeChebotarev |
| WeilConjectures | WC.1 curve_zeta_numerator_without_rh and WC.5 extension_count_recurrence |
| SchemeAndStackFoundations | §§1.1, 2.11, 2.16, 3.3, 3.6, 3.7 and 5.11, including Picard–Brauer obstruction and abelMaps_highDegree |
| JacobianChallenge; ModularCurves | Layers A–D for bundles, cohomology and ordinary Picard representation; ModularCurves 0E for effective affine descent |
| ClassFieldTheory; LocalFieldsRamification | Class formations/local reciprocity and the stated prime-to-residue-characteristic existence domain; Layer 3 ramification and Hasse–Arf |
| AutomorphicSpectralTheory | §§1.11–1.13, 2.15–2.16 and 4.11–4.17; disconnected fixed-centre groups explicitly retained in §1.11 |
| ReductiveGroupsPartII | RG2.0, RG2.0a, RG2.3.7 and RG2.4: point topology, finite-flat restriction of scalars, Lang and decompositions |
| SmoothRepresentationsOfLocalGroups | SR.2.1–SR.2.3, SR.4.1 and SR.4.4: induction, Whittaker and Satake/unitary interfaces |
| AdelicAlgebraicGroups | AA.0 permits countable second-countable locally compact factors; Layer 1’s field scope explains the function-field extension here |
| GeometryOfNumbersAndQuadraticArithmetic | §3.2 is inert, char(base)≠2 and permits dyadic residue fields; split/equal-characteristic-two extensions remain here |
| EtaleCohomologyFoundations | F.2.5, F.3, F.10.2–F.10.3 and §0.11; compact support, finite-Tor/perfectness, Frobenius and projective trace/determinant algebra |
| PadicMeasuresIwasawaAlgebras | §5.1 determinant lines, quasi-isomorphism, short exact sequence, base change, shift and acyclic identifications |
| MetaplecticAutomorphicForms | Local Schrödinger/Weil interfaces and §6.2 Siegel–Weil sections; only used in the global odd-characteristic branch |

The pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Direct object searches distinguish multiplicative field Hilbert 90 from additive truncated-Witt exactness, and the native section-rigidified Picard functor from arbitrary finite-flat rigidification and representing schemes. No one-tactic imported counterpart of a retained headline was identified.

| Pinned input | Exact file and relevant line; scope |
|---|---|
| Riemann–Roch carrier | TauCeti/FieldTheory/FunctionField/RiemannRoch/Basic.lean:87; valuation inequalities include zero |
| Pole divisor | TauCeti/FieldTheory/FunctionField/Divisor/Principal.lean:247; negative part of the principal divisor of a unit |
| Finite counting and class number | TauCeti/FieldTheory/FunctionField/RiemannRoch/ClassNumber.lean:82,143,202,210; arithmetic theorems keep finite constants and explicit hF |
| Truncated Witt vectors | Mathlib/RingTheory/WittVector/Truncated.lean:62,74,78,270,286; Fin n coordinates with quotient Witt ring operations, not pointwise addition |
| Trace surjectivity | Mathlib/RingTheory/Trace/Basic.lean:518; finite-dimensional separable extension |
| Laurent valuation | Mathlib/RingTheory/LaurentSeries.lean:502; Valued LaurentSeries k with integer value group |
| Formal group | Mathlib/RingTheory/FormalGroup/Basic.lean:56,74; commutativity is separate |
| Native rigidified functor | TauCeti/AlgebraicGeometry/PicardFunctor/Rigidified.lean:66; rigidification along a section, without the required arbitrary-modulus representing scheme |
| Multiplicative Hilbert 90 | Mathlib/RepresentationTheory/Homological/GroupCohomology/Hilbert90.lean:56–76; units and multiplicative cocycles, not W_n additive trace |

All manifest entries retain their keys and access decisions. The following certified-source anchors were reread; locators are paraphrased here, with no source passages copied. Rosen, Goss, Stichtenoth, Hess and SGA 4½ remain settled uncertified; Roquette remains waived. No text was requested again and no additional source was needed.

| Source | Anchor evidence |
|---|---|
| yu | yu line 366, line 1934, line 2024: degree convention and nonvanishing proof; the README retains its sign/nonzero corrections |
| kw | kw line 276, line 362, line 739, line 1184: Witt exactness, character pairing, symbol uniqueness and upper ramification |
| kosters | kosters line 57, line 66, line 81: weighted Frobenius estimate, geometric subgroup and rational-point bound |
| yoshida | yoshida line 145, line 686, line 905: geometric Frobenius normalization, existence and local Kronecker–Weber |
| parshin | parshin line 283, line 363: test functions and adelic duality; the README’s product/translate corrections are retained |
| milne | milne line 4947, line 5072, line 5107: function-field reciprocity and norm quotients |
| conrad_geom | conrad_geom line 48, line 119, line 157: perfect-field modulus geometry and finite-cover comparison |
| russell | russell line 1669, line 1684: linear part and modulus relations; perfect-field fixed-modulus universality is proved here, rather than inferred from an existence-of-modulus theorem |
| guignard_published | guignard_published line 737, line 747, line 762, line 830, line 856: rigidification, representing scheme, normalized generator construction and Abel bundle |
| conrad_adelic | conrad_adelic line 53, line 281: finite-type affine point topology and adelic restricted products |
| bhkt | bhkt line 1574, line 1593: adelic discreteness and cusp finiteness under its stated coefficient hypotheses |
| ciubotaru_harris | ciubotaru_harris line 390, line 412: coefficient extension and algebraic eigenvalues |
| abdurrahman_venkatesh | abdurrahman_venkatesh line 1184, line 1194: geometric-Frobenius Euler product and cohomological identity |
| stacks | stacks line 1138: finite-ring flat-constructible coefficient determinant identity; proof is explicitly omitted in that source |
| fyz | fyz line 509, line 615, line 673: density interpolation, local Whittaker identity and global coefficient formula |
| li_zhang | li_zhang line 688, line 709: overlattice formula and unramified hypothesis, including dyadic residue characteristic |
| kudla_rapoport | kudla_rapoport line 1719: local density/Whittaker comparison; its mixed-characteristic setting is not passed off as the equal-characteristic extension |
| borel_tits | borel_tits line 1109: relative-root vector quotients |
| sga3 | sga3 line 240: smooth characteristic filtration of the unipotent radical |
| harder | harder line 234, line 239: uniform cusp support and deep-cusp constant-term argument |
| morris1 | morris1 line 427, line 439, line 497, line 1612, line 2714: reduction, compactness, volume, continuation and components |
| morris2 | morris2 line 1300, line 2008: spectral decomposition and general Eisenstein continuation |

# Adversarial mathematics pass

Each row records an evaluated instance, rather than an elaboration verdict. FF below means fields k,F with Algebra k F, finite k, explicit IsFunctionField k F and exact constants. The zero ring and q=1 are excluded by the finite-field hypotheses; the polynomial-data predicate deliberately admits q=0,1. For set equalities and classification statements, the positive and negative instances test both directions. Nonabelian tests concern the reductive/unipotent and Chebotarev interfaces; the ray and local existence statements explicitly require abelian groups/extensions. API names in the tables identify prose targets, without adding Lean declarations.

| Acceptance declaration | Context/instances | Computed values | Result | Change |
|---|---|---|---|---|
| exists_divisor_degree_eq_one | FF; P¹/F₃; pointless real conic excluded | deg(∞)=1; degrees 3−2=1 need not be effective; real conic degree image 2ℤ | True in stated domain | Retain |
| riemannRoch_reducedBasis | Arbitrary k, compatible finite RatFunc extension; k(t), D=0 | d=(0), v=(1): r=−1 gives empty span=0; r=0 gives k; r=2 gives span(1,t,t²)=L(2∞) | One basis works for all shifts | Add headline |
| artinSchreierWitt | Prime p, CharP F p; p=2, [t] | Frob[t]−[t]=(t²+t,t²+t³); pointwise difference gives incorrect second coordinate 0 | Witt subtraction essential | Retain |
| aswQuotient | Same context, n=0,1,2 | n=0 quotient=0; F_p at n=1 gives F_p; at n=2 gives ℤ/p² | Truncation kernel has correct effect | Retain |
| witt_additiveHilbert90 | Finite Galois L/F, cyclic generator; n=0; L=F | At n=0 all sets={0}; L=F gives difference=0, trace=id, range inclusion=whole W_n(F) | All three set equalities agree | Add headline |
| artinSchreierWitt_galois | Any CharP field; F_p and algebraically closed F | F_p: quotient and continuous character group both ℤ/p^n; algebraically closed F: both 0; n=0 gives 0≃0 | No perfectness/finite-field restriction needed | Retain |
| localAbelianExistence_laurentSeries | Finite k; open finite-index H | H=Kˣ gives L=K, index=degree=1; valuation-even H gives unramified quadratic, index=degree=2 | Norm group determines abelian intermediate field | Add headline |
| effectiveDivisorCount | Fields/algebra, no hidden finiteness | P¹/F₃: A₀=1,A₁=4,A₂=13; ℂ(t), n=1: infinite subtype gives Nat.card=0 | Total definition; arithmetic hypotheses guard junk | Retain |
| zeta | Same broad definition | P¹/F₃: coefficients 1,4,13,40; equals divisor-count series | Real power series | Retain |
| placeCount | Same broad definition | P¹/F₃: B₀=0,B₁=4,B₂=3,B₃=8 | Places distinguished from points | Retain |
| pointCount | Same broad definition | N₁=4,N₂=4+2·3=10,N₃=4+3·8=28; N₀=0 because 0.divisors is empty | Positive indices give geometric counts | Retain |
| zeta_eulerProduct | FF, coefficient topology | P¹/F₃: coefficient T² is binomial(5,2)+3=10+3=13=A₂; constants 1=1 | Finite stabilization in each coefficient | Retain |
| zeta_logDeriv | FF, r>0 | P¹/F₃: r=1 gives 4=4; r=2 gives 2·13=4·4+10=26; r=3 gives 120=52+40+28 | No out-of-range subtraction | Retain |
| effectiveDivisorCount_of_large | FF, 2g≤n+1 | P¹/F₃,n=0: 2·1=1·(3−1)=2; E/F₅,g=1,n=1:4·9=9·(5−1)=36; n=0 excluded | Exponent does not truncate | Retain |
| zeta_rationality | FF | P¹ gives P=1, degree=0, lead=1, h=1; E/F₅ gives P=1+3T+5T², lead=5, P(1)=9 | Symmetry 5=5·1; numerator tied to zeta | Retain |
| IsLPolynomialData | q,g arbitrary naturals | g=0 forces P=1; q=5,g=1,N₁=9 requires (a₀,a₁,a₂)=(1,3,5); N₁=8 requires (1,2,5) | Wrong-count polynomial excluded | Delete example mirrors only |
| IsLPolynomialData.unique | Same q,g,N for both polynomials | q=0,g=1,N₁=2 forces P=1+T; q=1 forces P=1+T²; q=2,g=2,N₁=3,N₂=5 forces P=1+4T⁴ | Recursion plus symmetry fixes all coefficients | Retain |
| lPolynomial_isLPolynomialData | FF and actual numerator identity | E/F₅: A₁=9,A₂=54, so a₁=9−6=3,a₂=54−6·9+5=5 | Newton data agrees with actual numerator | Retain |

| README statement/convention | Instances tried | Computed values on the claimed objects/formulas | Result | Change |
|---|---|---|---|---|
| Exact constants | F₄(t) over F₂ versus F₄ | dim_F₂ L(0)=2 versus dim_F₄ L(0)=1 | Exactness cannot be suppressed | Retain |
| Valuation/divisor degree | t on P¹; degree-two place | div(t)=[0]−[∞], degree 1−1=0; deg[v]=2 | Product formula agrees | Retain |
| Idele/Yu degree and norm | Uniformizer idele, d=2,q=3 | degree=2, Yu degree=−2, norm=3^−2=1/9 | All signs agree | Retain |
| Scalar determinant degree | GL₂ scalar idele of degree 1 | det degree=2, Yu determinant degree=−2 | Centre doubles degree | Retain |
| Arithmetic/geometric Frobenius | Constant degree-three extension, place degree one | Arithmetic exponent 1, geometric exponent −1=2 mod3 | Inversion is detectable | Retain |
| Constant-field reciprocity/local factors | (r,d)=(2,2),(3,2) | 2 factors×degree1=2, φ²=1; 1 factor×degree3=3, ord(φ²)=3 | Global exponent unchanged | Correct proof and add Check |
| Degree-one divisor versus rational point | Places of degrees 2 and 3 | deg(v₃−v₂)=1; neither place has degree1 | Existence is a divisor assertion | Retain |
| Divisor/Picard comparison | P¹/F₃; real conic | Degree-zero groups both 0; conic Pic classes 2ℤ map into ℤ with cokernel ℤ/2 | Finite-field Brauer hypothesis matters | Retain |
| Degree class torsor | Elliptic curve with #E(F₅)=9 | Each degree class fibre has 9 classes, while effective degree-zero divisors number 1 | Classes differ from divisors | Retain |
| Chart ideals | P¹,x=t,D=2∞ and −∞ | Pairs (k[t],t^−2O∞) and (k[t],tO∞) | Pole sign fixed | Notation only |
| Two-chart inverse intersection | Same divisors | Inverse intersections span(1,t,t²), dimension3; and 0, dimension0 | Finite chart alone would be infinite dimensional | Retain |
| Chart additivity | D=∞+∞ | Infinity ideal t^−1O∞·t^−1O∞=t^−2O∞ | Sum matches product | Retain |
| Chart pole/zero shifts | x=t,r=2 | Pole shift multiplies infinity ideal by t^−2; zero shift multiplies finite ideal by t² | Opposite shifts distinguished | Retain |
| Principal chart pair | D=div(t) | Both component ideals generated by t | Same generator on both charts | Retain |
| General two-lattice reduced basis | Rank0 and rank1 | Rank0: empty invariants and bases; rank1 M∞=x²O∞: v=1,d=2 | No false positive-rank assumption | Retain |
| Reduced-basis uniqueness | Elliptic D=0, pole shifts r=0,1,2 | Dimensions 1,2,4; increments recover thresholds 0,2 and d=(0,−2) | Sorted invariants determined | Retain |
| Reduced-basis shift | Same elliptic field, D→D+(x)∞ | (0,−2)→(1,−1); dimension 2=2+0 | Shift sign correct | Retain |
| Reduced-basis dimension | Elliptic r=2 | max(0,3)+max(0,1)=4=dim span(1,x,x²,y) | Negative tails truncated correctly | Retain |
| Reduced-basis sum | Exact elliptic constants; nonexact degree2 constants/genus2 | 0−2=0+1−1−2; nonexact correction is degD−2−n | Native nonexact genus is not substituted | Retain |
| Principal reduced-basis transport | P¹,D=0,f=t | L(−div t)=span(t), invariant 0=0 | Basis multiplies by f, not f^−1 | Retain |
| Inseparable reduced bases | char p, x=t^p | d=(0,−1,…,−1); r=0 dimension1,r=1 dimension p+1,r=−1 dimension0 | Same theorem covers inseparability | Add Check |
| Divisor lattice definition | D_v=−1 | Local factor πO contains 0 and excludes 1 | Zero valuation junk cannot exclude 0 | Notation A(D) |
| Compact-open lattice | D=0 then D+[v] | O_v→π^−1O_v, a union of q_v cosets of O_v | Both compact and open | Retain |
| Lattice/diagonal intersection | P¹,D=0,−∞ | Intersection k=L(0); intersection 0=L(−∞) | Both inclusions hold | Retain |
| Lattice cohomology quotient | P¹,W=−2∞,D=−2∞,−∞ | Quotient dimensions ℓ(0)=1 and ℓ(−∞)=0 | Repartition comparison matches | Retain |
| Lattice monotonicity | 0≤[v] | O⊆π^−1O; π^−1 is outside O | Direction discriminated | Retain |
| Principal lattice transport | f=t,D=0 | At 0: O→tO=A(−div t); at ∞: O∞→π∞^−1O∞ | Sign consistent on both charts | Retain |
| Lattice index | q=3,degree-two place | Index #F₉=9=3² | Degree weighting retained | Retain |
| Local self-dual volume | n_v=−2 and 2,q_v=3 | Volumes 3 and 1/3; respective annihilator volumes 1/3 and 3 | Volume products both 1 | Retain |
| Global self-dual volumes | P¹,D=m∞; genus1 | P¹ lattice volume q^(m+1), integral lattice q, quotient1; g=1 integral volume1 | Canonical degree gives correct power | Retain |
| Differential rescaling | dt→t dt | Local multipliers at 0,∞ are q^−1/2,q^1/2; product1 | Global measure unchanged | Retain |
| Local annihilator | ω=π²dπ | O⊥=π^−2O; π^−3 paired with π²dπ has nonzero residue | Boundary exponent distinguished | Retain |
| Integral/self-dual ratio | g=0 and g=1 | q^(1−g)=q and 1; multiply quotient volumes q^−1 and 1 to get 1 | Reciprocal conventions agree | Retain |
| Lattice Fourier transform | P¹/F₃,dt,D=0 | Value at zero is vol A(0)=3; RHS 3·1=3 | Normalization correct | Notation only |
| Fourier translation phase | Conductor-O character, residue cb=1 over F₃ | Positive kernel gives ζ₃, inverse phase gives ζ₃² | Sign pinned | Retain |
| Fourier inversion | P¹,D=0 | First volume q, annihilator volume q^−1, product1; double transform reflects argument | Both exponents cancel | Retain |
| Span of translated indicators | Indicator of 1+πO over F₃ | At 1 value1, at 2 value0; unshifted indicators have equal values | Translates necessary | Retain |
| Residue character convention | F₄ additive character | Image size2<4, trace pairing nondegenerate | Nontrivial replaces injective | Retain source correction |
| Witt exactness, positive cyclic case | Degree-p AS extension, n=1,p=2,3 | Tr(1)=0; p=2 Tr(y)=1; p=3 Tr(−y²)=1 | Trace onto despite degree divisible by p | Add headline |
| Length-two Witt trace | p=2,y²+y=t, σy=y+1 | [y]+[y+1]=(1,y(y+1))=(1,t), not (1,0) | Invariants and addition correct | Add Check |
| Witt difference/trace kernel | Same length-two extension | [y]−[y+1]=(1,y+1); trace=(0,(y+1)+y+1)=(0,0) | Image lies in trace kernel | Retain new headline |
| Trace truncation | Same extension, n=2→1 | (1,t) truncates to 1=Tr(y) | Maps commute with truncation | Retain |
| ASW additivity/truncation | p=2,[t] | First coordinate t²+t equals length-one ℘t; second coordinate t²+t³ | Uses Witt rather than coordinate addition | Retain |
| ASW extension order | F₂(t), length2 class [t] | Twice class nonzero, four times zero; extension degree4 | Exponent-two stand-in excluded | Retain |
| ASW cyclic subgroup classification | p=3, nonzero class a | a and 2a generate the same 3-element subgroup and same cubic field; independent a,b give compositum degree9 | Characters differ, fields can agree | Retain |
| ASW localization | t^−1 over F_p(t) | Local class at 0 has conductor2; at ∞ positive valuation gives class0 | Kernel need not vanish | Retain |
| ASW infinite duality | F=F_p; algebraically closed F | Q∞=ℤ_p and Hom_cont(Ẑ,ℤ_p)=ℤ_p; algebraically closed case 0=0 | Specified topologies retained | Retain |
| Reduced Laurent existence/uniqueness | p=3,T^−6 | T^−6≡T^−2, reduced pole2 coefficient1; coefficient0 gives zero class | Divisible pole orders excluded | Retain |
| Reduced reassembly | β+p[T^−m] | Constant coefficient1,pole coefficient p reassemble the same class; both zero give0 | No arbitrary unrelated data | Retain |
| Unramified criterion | β versus [T^−1] | First-layer degrees p,p; conductors respectively 0,2 | Only zero pole coefficients are unramified | Retain |
| Primitive-layer formula | x=β+p[T^−m]; x=pβ | n₀=0,n_c=1 gives first unramified degree p then ramified degree p; pβ gives layer degrees1,p | Constant/pole valuations both used | Retain |
| Change of uniformizer | T′=aT | T^−1=a(T′)^−1; same element and field, coefficient changes by a | Parameter not intrinsic, extension is | Retain |
| Trace condition on β | k=F_(p^p) | Tr_W(1)=p, divisible by p; a trace-unit β gives unit generator | β=1 cannot always generate | Retain |
| Positive-valuation Witt class | p=2,[1+T]−[1] | First two coordinates (T,T), both positive; class0 | Nonlinear Witt subtraction compatible | Retain |
| One-pole cover comparison | p=3,m=2; p=2,m=1 | Different6,genus1,conductor3; different2,genus0,conductor2 | Underlying curve data imported | Retain |
| Constant-extension persistence of AS class | p=3,m=2 over F₃ and F₉ | Pole remains prime to3, class nonzero; counts4 and16 | Genus/conductor unchanged | Retain |
| AS sum versus compositum | Pole class and independent constant class at p=3 | Each class and their sum give degree3; adjoining both gives degree9 | Diagonal field differs from compositum | Retain |
| Lubin–Tate formal group | Equal characteristic, f=πX+X^Q | F_f(X,Y)=X+Y; mixed characteristic additive model would force [p]=0 | Equal/mixed settings distinguished | Notation F_f |
| Formal scalar action | a=0,1,π | Linear terms 0,1,π; [π]=f; [a]∘[b] has linear term ab | Scalar parameter fixed | Retain |
| Formal commutativity | Additive example | X+Y=Y+X | Construction supplies separate commutativity axiom | Retain |
| Tangent-one isomorphism | f=g and scalar [u],u≠1 | Identity derivative1; [u] derivative u≠1 | Rescaling excluded by normalization | Retain |
| Torsion carrier | Q=2,m=0,1,2 | Cardinalities1,2,4; first torsion roots 0,π | Zero included; primitive/nonprimitive differ | Retain |
| Torsion module equivalence | Q=3,m=2 | O/π² has9 elements; primitive elements6 | Module and primitive count agree | Retain |
| Torsion extension degree | Q=2,m=1,2; Q=3,m=2 | (Q−1)Q^(m−1)=1,2,6 | First stage can be trivial | Retain |
| Torsion Galois group | Q=3,m=1 | Both Gal and (O/π)ˣ have order2 | Abelian group correctly identified | Retain |
| Torsion norm sign | Q=3, α²=−π | Norm α=−α²=π | Uniformizer norm sign correct | Retain |
| Relative Lubin–Tate extension | ord(x)=2,Q=3,m=2 | Unramified degree2, ramified degree6,total12; norm valuations2ℤ | Local residue degree tied to x | Retain |
| Local Kronecker–Weber | Unramified quadratic and wild quadratic over F₂((π)) | Their intersection K; compositum degree4 | Both factors needed | Retain |
| Local existence uniqueness | H=Kˣ and ord^−1(2ℤ) | Indices1,2 match degrees1,2; full H is norm of identity field | Identity case fixes order direction | Add native headline |
| Wild norm-group existence | K=F₂((T)),H generated by T,1+T²O | Index2; y²+y=T^−1 has conductor2; [T^−1,1−T)=1 | Prime-to-p existence alone insufficient | Retain |
| Artin injectivity | Valuation component and unit 1+aπ^m,a≠0 | A nonzero valuation survives some ℤ/r; first nonzero jet survives U^m/U^(m+1); intersection kernel={1} | No lost unit direction | Retain |
| Lubin–Tate Artin convention | u=2 modulo5 | Arithmetic Artin acts by u^−1=3; π acts trivially on torsion and by φ on unramified fields | One inversion required | Retain |
| Conductor/norm unit test | AS T^−1 versus constant class | AS kills U² but not U¹; constant class kills U⁰ | Least exponents2 and0 | Retain |
| Schmid–Witt definition | n=1,p=3 | [1,T)=1; [T^−1,1−T)=−1=2 | Arithmetic solution-difference convention | Notation only |
| Finite-length perfect pairing | T^p at length1 | Symbol0 for all classes; pro-p valuation coordinate p≠0 | Whole completion too large at finite length | Retain |
| Symbol characterization | Constants and reduced poles at p=3 | [1,T)=1, [T^−1,T)=0; negated pairing gives2 on first pair | Sign and zero law fix pairing | Retain |
| Residue formula | T^−1 dlog(1−aT), dlog T | Residues −a and1 | Agrees with preceding symbol values | Retain |
| Infinite-pole lift | Σ_j p^j[T^−(pj+1)] | Mod p^m: exactly m negative terms; no common lower pole bound | Completed ring needed | Retain |
| Symbol norm annihilator | B=0 versus B generated by T^−1 | Norm group Kˣ,index1 versus index p | Field degree equals annihilator index | Retain |
| ASW conductor formula | p=3,n=2,pole2 | Unit coefficient:1+2·3=7; valuation1:1+2=3; no poles:0 | All branches evaluated | Retain |
| Upper ramification clamp | β+3[T^−4],r=1 | 1+max(0,ceil(log₃(1/4)))=1; unclamped bound0 | Inertia3ℤ₃ rather than ℤ₃ | Retain source correction |
| Conductor compositum | Length-one poles1,2 at p=3 | Conductors2,3; compositum max=3 | lcm ideals corresponds to max exponent | Retain |
| Length-one conductor | Pole2 and constant-only class | Exponents3 and0 | Empty-pole case is not1 | Retain |
| Supplied ray quotient | P¹/F₃,m=0,2∞ | C₀=ℤ; C_(2∞)^0=F₃ | Infinite degree direction retained | Import AL.3 |
| Supplied degree sequence/finite quotient | Same modulus, quotient by 2a | Kernel order3, degree quotient ℤ; finite quotient order6 | Degree modulus makes group finite | Import quotient; retain finite data |
| Finite ray-character data | C₀/3a, faithful versus zero character | Image orders3 and1 | Specified isomorphism identifies the actual quotient | Retain |
| Ray-data conductor | Degree character versus AS T^−1 | Least exponents0 and2 | Least differs from input bound | Retain |
| Ray-data finite image | Character of order-six quotient | Image order divides6; infinite-image degree character excluded | Finiteness comes from actual quotient | Retain |
| Minimal local ray exponent | T^−1 character | U² maps0; 1−T∈U¹ maps−1 | Minimality two-sided | Retain |
| Ray unramified criterion | Constant class; nontrivial tame character | Exponents0,1; units killed only in first case | Swan zero alone insufficient | Retain |
| Ray constant value | Degree mod3 | θ(a)=1, all unit restrictions0; zero character has θ(a)=0 | Units do not determine constant direction | Retain |
| Local-coordinate comparison | v=∞ on P¹ | t→T^−1, dt→−T^−2dT, integral volume q | Valuation and differential sign agree | Retain |
| Parameter-change invariance | T′=aT | T^−1 dlog(1−bT) and a(T′)^−1 dlog(1−(b/a)T′) both have residue−b | Same symbol and conductor | Retain |
| Quotient-coordinate isomorphism | N=0,1,2 | N=0: zero rings; N=1: κ; N=2,char2: (1+T)²=1 in both quotients | Ring laws and precision agree | Mathematical wording |
| Projection compatibility | N=2→1 | a+bT maps a on both sides | Commuting quotient square | Add compatibility to prose |
| Supplied rigidified sheaf | m=2∞, T=Spec k[ε]/ε² | Rigidifications 1+bT include b=ε; rigidified scalar automorphisms=1 | Nilpotents retained | Import RelativeJacobians |
| Picard scheme structure | P¹,m=0,[∞],2∞ | Dimensions0,0,1; g+N−1 used only for N>0 | Empty modulus handled separately | Keep added scheme theorem |
| Tensor group/action | Additive Picard component | (b,c)→(b+c,c), inverse(d,c)→(d−c,c); dual b→−b | Torsor action isomorphism explicit | Use supplied operations |
| Picard field extension | Degree-two closed reduced modulus | Over splitting field two points give torus rank1, dimension1 | Degree is not support count over k | Retain structure comparison |
| Forget modulus | P¹,3∞→2∞→∞ | Last map kills additive coordinate; composite equals direct zero map to ordinary degree component | Composition agrees | Retain scheme compatibility |
| Unit exact sequence | P¹,m=[∞],2∞; m=0 excluded | Quotients 1 and 1+Tk≃G_a; at m=0 diagonal G_m→1 would not inject | Positive-modulus hypothesis essential | Restore explicit m≠0 in edited text |
| Linear part structure | m=0+∞ versus2∞ | Torus/unipotent dimensions(1,0) and(0,1); total N−1=1 | Reduced and nonreduced moduli differ | Keep additional structure theorem |
| Pointless-conic boundary | Real conic, degree-two modulus | Pic_m^1(ℝ)=∅; ordinary Pic_X^1(ℝ) is a point with Brauer obstruction1∈ℤ/2 | Rigidification does not create line bundle | Retain |
| Ray Abel map | P¹,2∞ and0+∞ | In chosen coordinates c→c in G_a and G_m | Origin and inversion fixed | Finite-field map imported |
| Abel base change | c=2 over F₅→F₂₅ | Value2→2; multiplicative inverse would be3 | Same map after extension | Perfect-field extension retained |
| Abel forgetful compatibility | 2∞→∞ | c maps to unique ordinary degree-one class | Coordinate disappears | Perfect-field extension retained |
| Symmetric-power Abel addition | 2∞, n=0,1,2 | Values0,c,c+d | Degree and tensor addition agree | Perfect-field extension retained |
| High-degree affine bundle | P¹,N=2,n=1,2; elliptic N=1,n=1 | Fibre dimensions0,1; elliptic n=1 misses removed point’s class, below bound2 | Sharp range test | Retain |
| Modulus relation | u=t:A¹→G_a | Congruence mod T² forces sum0; div((t−1)/t) congruent1 mod T gives u-value1 | 2∞ works, ∞ fails | Ordinary prose predicate |
| Fixed-modulus factorization | Same u, modulus2∞ | h=id gives h(c)=c; h=0 fails at c=1 | Zero/wrong map excluded | Retain Rosenlicht theorem |
| Modulus base change | Previous relations over algebraic closure | Values0 and1 remain0 and1 | Both relation and nonrelation persist | Retain |
| Modulus composition | Compose u with multiplication2 | Value1→2; char2 gives0 | Composition can lower conductor | Retain one-way implication |
| Modulus monotonicity | 2∞→3∞ | Congruence mod T³ implies mod T²; killed value0 stays0; modulus∞ counterexample value1 | Direction correct | Retain |
| Rosenlicht uniqueness | u=t over char3 | h(c)=c for every c; scalar2 fails at1 since2≠1 | Factorization uniquely determined | Retain |
| Ray/Picard coordinates | P¹,0+∞,unit λ=2 over F₅ | Divisor[c]−[1] maps c; idele unit2 maps2^−1=3 | Boundary and idele conventions inverse | Keep coordinate theorem only |
| Additive ray/Picard coordinates | P¹,2∞ | Unit1+bT maps rigidification1−bT, coordinate b; direct boundary coordinate−b | Inversion explicit, valid at p=2 | Keep coordinate theorem only |
| Degree-one rational ray fibre | Finite k, degree-three minus degree-two divisor | Degree3−2=1; not effective degree1 | No U(k) hypothesis | Import AL.3 |
| Supplied Lang torsor | G_a/F₃ and G_m/F₅ | Equations y³−y=t and z⁴=t; derivatives−1 and4z³ nonzero on fibres | Étale, translation torsors | Import AL.3 |
| Lang trivial kernel | P¹,m=0; G_m at q=2 | Kernel order1 and degree-one identity cover in both cases | Group scheme G_m may still be nontrivial | Import AL.3 |
| Lang Frobenius coordinates | y³−y=1; z⁴=2 | φ(y)−y=1; φ(z)/z=2, geometric multiplier3 | Arithmetic/geometric signs agree | Keep coordinate comparison |
| Degree multiplier in Lang | q=3,a=[1],v:t²+1 | Tr(t−1)=−2=1; subtracting a once would give−1=2 | d·a essential | Retain Check |
| Lang origin change | Degree2, a→a+b | Frobenius changes by−2b | Translation sign fixed | Retain Check |
| Lang Artin coordinates | b∈C_m^0 and a∈C_m^1 | b−0a=b; a−1a=0 | Image on degree-zero classes is all A | Use supplied finite comparison |
| Geometric Lang connectedness | Additive y³−y=t | Geometric image F₃, constant quotient0, geometric components1 | Wild part retained | Import AL.3 |
| Finite-abelian torsor construction | B=ℤ/4,θ=2deg | Image order2, two connected components, each constant quadratic | Disconnected torsors included | Extend supplied rank-one dictionary |
| Finite-abelian pushout | Degree mod4 pushed to ℤ/2 | Degree4 constant cover pushes to degree2 | Group homomorphism matches pushout | Retain |
| Generic character | Constant cubic cover | Degree-one uniformizer maps1 mod3 | Same character on generic fibre | Retain |
| Finite torsor forget modulus | Degree mod3 at m=0 or2∞ | All unit images0, same constant cubic cover | Modulus functoriality correct | Retain |
| Finite torsor choice independence | d=2,θ(b)=1 in ℤ/3 | Geometric change−2 plus constant change+2 equals0 | Full torsor unchanged as isomorphism class | Retain |
| Finite torsor classification | Zero θ and surjective degree θ to ℤ/3 | Three trivial components versus one connected constant cubic | Both inverse constructions distinguished | Retain extension |
| Connectedness iff surjectivity | θ=2deg and deg into ℤ/4 | Image indices2 and1 give two and one components | Both implications tested | Retain |
| Geometric connectedness iff full degree-zero image | Constant cubic and additive Lang | Geometric images0 and F_q; geometric component counts3 and1 | Constant degree distinct from total degree | Retain |
| Norm group of constructed cover | Constant cubic | Norm degrees3ℤ, class index3, field degree3 | Kernel and degree agree | Use supplied norm theorem |
| Least finite-abelian modulus | z²=t/F₃; y²+y=t/F₂; degree character | Least exponents1,2,0 | Tame/AS/constant distinguished | Extend supplied characterwise result |
| Modulus-factor equivalence | AS simple-pole cover | Character factors through C_(2∞), not C_∞; both opens A¹ | Multiplicity invisible to open set | Retain ramification-bound qualification |
| Product-modulus example | P¹,m=0+2∞ | J_m=G_m×G_a, rational kernel order(q−1)q | Tame, wild, constant directions all present | Retain |
| Euler/point-count identification | P¹/F₃,r=2 | Four rational places plus two points for each of three quadratic places give10 | N₂ differs from B₂=3 and A₂=13 | Retain |
| Counting constant-extension API | P¹/F₂,r=2,s=3 | N₂ over F₈=65=N₆ over F₂ | Base-extension indices multiply | Retain |
| Möbius inversion | P¹/F₃,r=2,3 | 2B₂=10−4=6; 3B₃=28−4=24 | Weights d retained | Retain |
| Effective class sum | E/F₅,h=9,n=0,1 | n=0:1+8·0=1; n=1:9·1=9 | Zero divisor distinguished | Retain |
| Large-degree class count | E/F₅,n=2 | 9(25−1)/(5−1)=54=A₂; n=0 formula would give0≠1 and is excluded | Range is necessary | Retain |
| Numerator functional equation | E/F₅ | 5T²[1+3/(5T)+5/(25T²)]=1+3T+5T² | Reciprocal power and leading coefficient agree | Notation L_F |
| Zeta functional equation | P¹/F₃ | Z(1/(3T))=3T²/((1−T)(1−3T))=3T²Z(T) | g=0 exponent 2−2g correct | Retain |
| Class number identity | E/F₅ | L(1)=1+3+5=9=#E(F₅) | No monic renormalization | Retain |
| Scheme-zeta comparison | P¹/F₃ | Both Euler products have coefficients1,4,13 | Same closed-point degrees | Retain |
| Jacobian/Frobenius comparison | E/F₅ | Characteristic polynomial X²+3X+5 reverses to1+3T+5T²; roots have modulus√5 | Frobenius direction consistent | Retain |
| Weil point bound | Same E | abs(9−6)=3≤2√5; genus0 discrepancy0 | Imported estimate agrees | Retain |
| Constant-extension numerator | Same E,r=2 | α+β=−3,αβ=5; α²+β²=−1; L(T)L(−T)=1+T²+25T⁴ | L₂=1+T+25T² | Retain |
| Constant-extension zeta | P¹/F₃,r=2 | Z(T)Z(−T)=1/((1−T²)(1−9T²))=Z₂(T²) | Denominator also transforms | Retain |
| Polynomial recovery/class number/counts | q=5,g=1,N₁=9 | a₁=3,a₂=5,h=9,N₂=27 | One count sufficient at genus1 | Retain README Checks |
| Characteristic series definition | Rank1 eigenvalue a; zero complex | Degree0 series1−aT; zero complex series1 | Real determinant-line object required | Retain |
| Representative/lift independence | Add contractible identity complex | Extra factor(1−T)/(1−T)=1 | Same derived endomorphism, same series | Retain |
| Characteristic-series base change | Multiplication3 over ℤ→F₂ | 1−3T maps1−T | Agrees with reduced endomorphism | Retain |
| Characteristic-series shift | Rank1 multiplication2 | Shift series(1−2T)^−1; product with original1 | Alternating sign correct | Retain |
| Projective-cohomology formula | P¹ constant sheaf | H⁰ eigenvalue1,H² eigenvalue q,H¹=0; series(1−T)(1−qT) | L is its inverse | Retain |
| Nonprojective cohomology boundary | [ℤ/4→²ℤ/4],id | Complex series(1−T)/(1−T)=1; H⁰=H¹=ℤ/2 not projective | Cannot form individual projective determinants | Retain |
| Finite-ring local Euler factor | Unramified rank1 eigenvalue3 over ℤ/4; zero stalk | 1−3T and1 | Constant terms both1 justify inversion | Mathematical P_v notation |
| Finite-factor field comparison | Previous factor reduced modulo2 | 1−3T→1−T | Agrees with field determinant | Retain |
| Unramified finite factor | Rank2 identity over F₂ | det(1−T id)=(1−T)²=1+T² | Whole stalk invariant | Retain |
| Frobenius lift independence | F₅,inertia diag(1,−1),lifts diag(2,3),diag(2,−3) | Both restrict to2 on invariant line; factor1−2T | Lift difference acts trivially there | Retain |
| Tame nontrivial rank1 inertia | Nontrivial inertia character | Invariant space0, factor1; unramified line factor1−aT | Invariants essential | Retain |
| Finite-coefficient cohomological identity | P¹,q=3,Λ=F₂ | Both L-functions equal1/((1−T)²)=1/(1+T²) | Inverse determinant sign correct | Add unavailable-headline explanation |
| Power-trace obstruction | Rankℓ identity over F_ℓ | All power traces ℓ=0; determinant1−T^ℓ≠1 | Trace-only proof invalid | Retain |
| Chebotarev constant congruence | Constant quadratic extension | Identity class count0 at odd degrees; nonidentity count0 at even degrees | Arithmetic coset enforced | Renumber §5.8 |
| Quantitative degree count | Identity extension P¹/F₂,r=1,2 | r=1 discrepancy0; r=2 discrepancy abs(2−5)=3≤6 | Lower degrees must be subtracted | Retain bound |
| Nonabelian Chebotarev coefficients | S₃ geometric; S₃ with constant quotient sign | Geometric transpositions3/6=1/2; with N=A₃ compatible odd coset3/3=1, 3-cycles2/3 | Normalize by N, not G | Retain |
| Ramification contribution | r=1 | Lower-degree contribution0; error reduces to2g_M√q+R | Ramified points not unramified primes | Retain |
| Adelic points carrier | G_a,G_m | Algebra homomorphisms give a and (a,a^−1), respectively | Inverse controls G_m topology | Mathematical notation |
| Restricted-product comparison | G_m integral model | At v∉S both a_v,a_v^−1 integral iff a_v∈O_vˣ | Units, not nonzero integral elements | Retain |
| Diagonal closed/discrete | G_a over F₃(t) | K intersect integral lattice with one positive place condition is{0} | Identity isolated after translation | Retain |
| Finite stabilizer | G_m/F₃(t); trivial group | Orders q−1=2 and1 | Compact/discrete intersection finite | Retain |
| Adelic functoriality | Multiplication2 on G_a | a+b→2a+2b; in char2 image0 | Zero map still permitted | Retain |
| Local compactness | G_a integral level | Compact open product∏O_v; one pole step gives q_v cosets | Restricted product remains locally compact | Retain |
| Product compatibility | G_a×G_a | Both point functors give pairs(a,b) of adeles | Same operations coordinatewise | Retain |
| G_m topology | Idele with π_v at a moving place | Additive coordinates tend toward1 while inverses have a moving pole; never in∏O_vˣ | Additive subspace topology insufficient | Retain |
| G_a comparison | K[X]→𝔸 | X↦a arbitrary, addition a+b | Entire additive adele carrier | Retain |
| Nonreduced affine group boundary | α_p in characteristic p | Points over each field and over adeles consist only of0 | Affine comparison does not assume reducedness | Retain |
| Automorphic module | GL₁/P¹,Ξ degree3; zero R | Cosets ℤ/3, module R³; zero coefficient ring gives zero module | Definition allows all commutative R | Mathematical 𝒜 notation |
| Evaluation | Three-point functions (1,2,3),(3,2,1) | First evaluation of sum4=1+3 | Linear evaluation | Retain |
| Change of level | Six cosets surject onto three | Pullback(a,b,c) repeats values; zero pullback forces a=b=c=0 | Injective in correct direction | Retain |
| Hecke action | GL₁ uniformizer translation | Two translations shift degree by2, agreeing with convolution | Right action convention fixed | Retain |
| Function-module base change | Finite three-coset support | R³⊗S=S³ | No infinite-product tensor claim | Retain |
| GL₁ module comparison | Integral level,Ξ degree3 | Both descriptions use C_K/(UΞ)=ℤ/3 | Same quotient | Retain |
| Central-character submodule | Degree parity on ℤ/2 | Equivariant values(a,−a); constants force2a=0: a=0 over ℚ, a=2 allowed over ℤ/4 | Coefficient torsion retained | Retain |
| Complex function-space comparison | Same central-character cosets | Translation multiplies values by−1 in both descriptions | Quotient measure and action fixed | Retain |
| Constant term definition | GL₂ f=1; f=0 | Probability quotient gives CT(1)=1,CT(0)=0 | Constant GL₂ form not cuspidal | Mathematical CT notation |
| Nonabelian quotient weights | Heisenberg H(F₂), Γ=J x-axis | H order8, Γ order2; two y=0 orbits weight1/4 each, one y=1 orbit weight1/2; total1 | Double quotient not a group | Retain |
| Constant-term linearity | 2·1+3·1 | CT(5)=5=2+3 | R-linear once p invertible | Retain |
| Complex integral comparison | One orbit of weight1/4 | Integral and weighted sum both a/4 | Same normalization | Retain |
| Refinement of averaging | Orbit weight1/2 split into two | 1/4+1/4=1/2 | Integral independent of refinement | Retain |
| Cusp-module definition/iff | Torus and GL₂ constants | Torus has zero proper tests, all functions; GL₂ constant1 has CT1≠0 | Both sides of vanishing criterion | Retain |
| Cusp Hecke stability | CT(f)=0,identity Hecke element | CT(T_1f)=CT(f)=0; general compatibility gives T_(S*h)0=0 | Stable kernel | Retain |
| Averaging coefficient restriction | Quotient of order p over F_p | Denominator p=0 has no inverse | Averaging not defined there | Retain p invertible |
| Function-field reduction | G_m, anisotropic semisimple, split GL₂ | G_m modulo centre one point; anisotropic root set empty and compact quotient; GL₂ root height at diag(π^a,1) is−a | Full group scope distinguished | Retain |
| Bounded reduction regions | GL₂,−2≤−a≤1 | a∈{−1,0,1,2}, four integral values | Lower/upper sign not interchangeable | Retain |
| Finite quotient volume | G_m modulo full centre | One point has finite Haar mass1; before central quotient degree takes ℤ | Central comparison necessary | Retain |
| Uniform cusp support | GL₁/P¹,Ξ degree1 | Every form supported on same singleton; without Ξ constant1 lives on all ℤ | Uniform quantifiers essential | Retain |
| Cusp finite generation | GL₁ exact class number h | Cusp module R^h, P¹ case rank1 | Noetherian kernel argument matches torus case | Retain |
| Flat cusp base change | Kernel multiplicationℓ over ℤ[1/p]→ℚ | Kernels0→0; moduloℓ kernel becomes F_ℓ | Nonflat map excluded | Retain |
| Integral coefficient model | GL₁/P¹,Ξ degree1 | R⊗_R C=C, matching complex cusp space | Embedding/flatness scope retained | Retain |
| Algebraic Hecke eigenvalues | Rational one-dimensional operator a | Characteristic polynomial X−a, eigenvalue a; transcendental π cannot satisfy nonzero rational polynomial | Model controls algebraicity | Retain |
| Raw Satake compatibility | GL₂,q_v=4 | S*_B h=4X₁+X₂ | Unnormalized coefficients asymmetric | Retain |
| Normalized constant term | Same group,diag(π,1),f=1 | δ=1/4, CTⁿ(1)=2 | Uses δ^−1/2 | Mathematical CTⁿ notation |
| Normalized Satake compatibility | Same h | S_B h=2(X₁+X₂); eigenvalue on CTⁿ(1)=2(2+1/2)=5=q+1 | Wrong raw CT would give4 | Retain |
| Normalized constant term at identity | f with CT(f)(1)=2 | δ(1)=1 gives CTⁿ(f)(1)=2 | Identity normalization | Retain |
| Normalized right translation | q=4,m=diag(π,1),f=1 | CTⁿ(R_m1)(1)=1=(1/2)·2 | δ^1/2 factor correct | Retain |
| Normalized transitivity | GL₃ diag(π,1,1) | δ_B=q^−2=(q^−1)(q^−1) for block and Levi Borel | Modulus factors multiply | Retain |
| P=G constant term | Any f | N=1,δ=1,CTⁿ(f)=f | Identity boundary | Retain |
| GL₁ reciprocity/Hecke | χ(a)=2^deg(a),d_v=2 | Hecke eigenvalue4; geometric Frobenius character1/4 | Single inversion agrees | Retain |
| Yu nonvanishing degree shift | n=2,g=2; n=1 | Yu diagonal degree+2, scalar correction−2,total0; n=1 gives0 | Original doubled sign would give4 | Docstring inventory |
| Yu nonzero hypothesis | Zero versus nonzero vector | Zero vector values0 everywhere; conclusion requires some nonzero value | Excluded zero is necessary | Retain |
| Unramified inducing-character criterion | Even n,split cover; elliptic counterexample | Even η^n=1,χ=1; split diagonal admits(χ₀,χ₀^−1); elliptic kernel class has η=−1 for odd n | Obstruction retained in both directions | Retain |
| Arithmetic obstruction evaluation | E/F₃, P−O | Inert fibre at P contributes−1, split fibre at O contributes+1; ratio−1 | Geometric alternation cannot force+1 | Retain |
| Constant-cover inducing character | Constant quadratic cover, degree d | Inert d gives exact-constant degree d; split even d gives two degrees d/2, total d; χ restriction(−1)^d | Degree base matters | Retain |
| Finite-ramification inducing-character existence | Same obstructed elliptic cover | Unramified obstruction−1 persists; continuous extension kills chosen compact open V, so all outside-S unit values1 | Ramification removes the unramified constraint | Retain |
| Ratio of inducing choices | χ,χ′ extending η^n | (χ′/χ) restricted to C_F equals1 | Correct torsor group | Retain |
| Full fixed-centre parameter group | GL₂,P=G,degree lattice ℤ | Centre image2ℤ; Hom(ℤ/2,ℂˣ)={1,−1}, cardinal2 | Identity component loses−1 | Replace subtorus |
| Cuspidal continuation parameter components | Same GL₂,π=1,P=G | E=f on both points z=±1; common denominator D=1 on each | Componentwise coordinate rings adequate | Retain all components |
| Constant term Weyl sum | GL₂ Borel versus P=G | Borel has2 Weyl terms with parameters s,−s; P=G has1 and identity map | Torus Levi alone insufficient | Correct Check |
| Levi discrete decomposition | GL₂ determinant unitary character | One-dimensional representation, multiplicity1; Borel CT(1)=1 so residual, not cuspidal | Discrete data genuinely wider | Retain |
| Discrete-data continuation | Residual line and identity presentation change | Same inducing vector f gives same E; zero vector gives E=0 | Relation to L² realization enforced | Componentwise denominators |
| Spherical induced section | Φ and2Φ | Φ(1)=1, (2Φ)(1)=2 | Normalization excludes rescaling | Retain |
| Flat sections and stabilizer condition | Supported section with value1 at k | Stabilizer with χ(u)≠1 forces1=χ(u), impossible; χ=1 gives consistent value1 | Condition necessary | Retain |
| Siegel Eisenstein series | n=0 and rank1 | n=0 one coset gives E=1; rank1 proper Borel has two constant-term contributions | Degenerate group handled | Retain |
| Siegel convergence | n=1,s=1 and0 | Re1>1/2, Re0≤1/2 | Convergence asserted only at first point | Retain |
| Rational Siegel continuation | s→s+2πi/log q | q^(−s−2πi/log q)=q^−s | Single rational parameter consistent | Retain |
| Section parabolic/degree law | Split n=1,q=4,s=0,norm determinant1/4 | (1/4)^(1/2)=1/2=4^(−1/2) | Norm and Yu-degree formulas agree | Retain |
| Section unipotent law | n(b), Φ normalized or zero | Levi determinant1 gives multiplier1; section values1 or0 respectively | No extra modulus | Retain |
| Eisenstein left invariance | Rational γ₀=1 and general γ₀ | Coset reindexing γ→γγ₀; identity reindexing fixes every term | Correct map domain | Retain |
| Induction normalization comparison | Split n=1,q=4,s=0 | Correct normalized/unnormalized section values both1/2; double-counting δ gives1/4 | One half-modulus only | Retain |
| Hermitian trace duality | char2,diagonal,inert off-diagonal,split matrices | Diagonal Gram[1]; F₄/F₂ Gram[[0,1],[1,0]], determinant1; E_ij dual E_ji | No factor2; self-dual lattice | Correct reason and Check |
| Global Fourier coefficient | Constant function1 | Rational T=0 coefficient1; nontrivial character coefficient0 | Quotient probability normalization | Retain |
| Local Whittaker integral | Section0 and2Φ | Integral0 and2W(Φ) | Section is essential data | Retain |
| Fourier reconstruction | Constant1 and one character | Only T=0 coefficient1 for constant; one nonzero coefficient for a character | Indices determine expansion | Retain |
| Rational Levi covariance | Rational α=t | Product norm1; transformed index remains rational | Global domain preserved | Retain |
| Local Levi covariance | Split n=1,α=(π,1),q=4,s=0 | Norm factor4^−1, Jacobian4^−1, final covariance factor4^(−1/2)=1/2 | Correct exponent −s+n/2 | Retain |
| Nonsingular Fourier factorization | n=1,g=0 and1 | Measure prefactors q and1; with self-dual local measures prefactor1 | Integral-volume normalization distinguished | Retain |
| Singular-index boundary | n=1,T=0,generic s | Constant term has s and−s exponents, rather than one local Whittaker exponent | Factorization not asserted | Retain |
| Adelic versus rational index | One-place α not rational | Transformed T′ has one changed local component, generally not in diagonal F | No global E_(T′) formed | Retain |
| Ramified local Fourier factor | Zero section,2Φ,unramified spherical unit line | Factors0,2W, and at q=3,s=0 split value2/3 | Cannot replace arbitrary section by density | Retain |
| Split dual lattice | L=(O,πO) | L∨=(π^−1O,O); quotient component lengths1,1 | Cross-duals in correct ambient lines | Notation only |
| Representation density | Rank0;m<n;split unit line q=3 | Densities1,0,2/3 | Empty generic fibre treated correctly | Retain |
| Density polynomial m(a;T) | a=0,1,2 | 1;1−T;(1−T)(1−ηqT) | Inert sign first visible at a=2 | Mathematical notation |
| Density type | Self-dual L;Gram π³ line | Types0 and1, not length3 | Type distinguished from length | Mathematical notation |
| Density half-length | Split torsion lengths(1,0),(1,1) | Half-lengths1/2 and1; Hermitian discriminant has balanced components | Overlattice exponent still integral | Spell out native numerical definition |
| Density normalization formula (1) | n=1,j=0,q=2 | Split1−1/2=1/2; inert1+1/2=3/2 | Dyadic residues included | Retain |
| Density interpolation (2) | Gram π rank1 | Split P=1+T,inert P=1−T; at T=1 values2,0 | Interpolation distinguishes split/inert | Retain |
| Overlattice formula (3) | Split L=(O,πO) | Original term1−T plus two self-dual terms T+T yields1+T | Exponent is1 for each length-one overstep | Retain |
| Nonzero interpolation denominator | i≥1,j≥0,q≥2 | abs((ηq)^(−i−j))≤1/2, so1−(ηq)^(−i−j)≠0 | No division by zero | Retain |
| Self-dual density API | L=L∨ | Only overlattice L, term T⁰m(0;T)=1 | Zero torsion model fixed | Retain |
| Torsion dependence | Two self-dual lattices;split discriminant(κ,κ) | Zero torsion gives1 in both; latter gives1+T | Hermitian torsion pairing retained | Retain |
| Density functional equation | Split1+T,inert1−T | T(1+1/T)=1+T; −T(1−1/T)=1−T | η sign correct, rank0 gives1=1 | Retain |
| Equal-characteristic-two local density | F₄/F₂ trace;split Gram π | Tr values on0,1,u,u+1 are0,0,1,1; inert norm-one fibre size3; split/inert polynomials1+T,1−T | No division by2 | Retain general local extension |
| Whittaker–density comparison | Self-dual rank1,s=j=1;inert Gram π,s=0 | W=1−ηq^−3 with source rank n+2; Gram π at s=0 gives Den(1)=0 and W=0 | q^−2s substitution correct | Retain |
| Global density product | One degree-two bad place,split local1+T | Global factor1+T²; self-dual places contribute1 | Degree substitution necessary | Retain |
| Spherical FYZ coefficient | g=1,deg E=0,self-dual data | Scalar q^0=1,Den=1, coefficient χ(det E)L_n(s)^−1 | Formula agrees locally/globally | Retain |
| Canonical-degree exponent | n=1,g=0 versus1 | q^(−n²(g−1))=q and1 | Canonical factor sign fixed | Retain |
| Constant-cover bundle degree | Line degree1 over F_(q²) | Base-field degree2, norm(q²)^1=q² | Exact-constant degree cannot replace base degree | Retain |
| Serre dual bundle degree | Rank n,bundle degree d | deg Hom(E,ω)=n degω−d; plain dual would give−d | Canonical twist retained | Retain |
| General coefficient formula | α=1;one section scaled2 | Character/norm factors1; bad local factor and global E both multiply2 | Ramified level data necessary | Retain |
| Independence of S | Move one spherical good place into S | L_v^−1Den_v=W_v on both products | Same rational function | Retain |
| Spherical specialization | S=∅ | χ(det ᾱ)^−1=χ(det α), degree log_q norm=deg E | General formula becomes spherical formula | Retain |
| Worked example1 | F_q(t),t^−1 at infinity | g0,h1,N_r=q^r+1,L1,dt order−2,integral self-dual volume q,Yu degree−1 | All layers agree | Recomputed |
| Worked example2 | y²=x³+x+1 over F₅ | Fibres2,0,2,2,2 plus∞ give9; discriminant4; invariants0,−2; pole orders x=−2,y=−3 | L=1+3T+5T²,h9 | Recomputed |
| Worked example3 | Same curve over F₂₅ | α²+β²=−1,N₂=27; 13 two-point affine fibres and12 empty fibres give26+1=27 | Numerator1+T+25T² | Recomputed |
| Worked example4 | y³−y=t^−2 over F₃ | Three places over∞ plus one at0 give4; wild RH −6+6=0, tame −6+2=−4 impossible; L=1+3T² | Different6 and genus1 consistent | Recomputed |

# Maintainer consequences

The only new acceptance names are `riemannRoch_reducedBasis`, `witt_additiveHilbert90` and `localAbelianExistence_laurentSeries`; no existing named Lean declaration was renamed or deleted. The two deleted examples were anonymous.

README interface labels for the duplicated finite-field constructions now refer to their suppliers. In particular, consumers should obtain ray/Picard and Lang construction/classification inputs from AutomorphicLFunctionsAndLocalFactors AL.3, and finite-flat rigidification/universal-family inputs from RelativeJacobiansAndIntegralCurveModels §§1.3–1.5. The remaining added scheme/structure targets are generalizedPicard_schemeStructure and generalizedJacobian_linearStructure; the explicit sign comparisons are rayPicard_coordinateComparison and rayLang_coordinateComparison. The former standalone approximation target ideleClasses_away_dense is unnecessary once the supplied finite-cover comparison is consumed. These are prose interfaces, not deleted pinned declarations.

Cross-roadmap references to this package’s quantitative Chebotarev section must use §5.8. The supplied merge order is unchanged. Earlier roadmaps removed from the downstream list acquire no reverse dependency by this repair. No supplier gap, source-access request, external decision or permission is outstanding within this package.
