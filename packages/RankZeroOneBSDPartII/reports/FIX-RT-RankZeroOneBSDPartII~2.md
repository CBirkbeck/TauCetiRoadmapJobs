# Repair report: RankZeroOneBSDPartII

## RT-RankZeroOneBSDPartII~2a/F01 (P2) — applied

Discrete-control construction and broad gap → import EulerSystemsAndKolyvaginSystems §8.31; retain only the rational compact-specialization kernel in gap:cgls-ordinary-control. Updated Scope, Exact supplier contracts, §2.1's route, Needs, Checks and Layer 2 Dependencies, and the matching plan gap. Added explicit free/torsion and Tor controls. Neither the arithmetic endpoint nor its hypotheses change.

## RT-RankZeroOneBSDPartII~2b/F01 (P3) — applied

GrossZagierAndArithmeticHeights §8.19 “imports” EffectiveClassNumbers §2.8 → the two state the same classical formula, while §8.19 derives it through its own §§8.15 and 8.4. Corrected the supplier paragraph and added the nonsquarefree N=20, D=−71 Check in §2.3. No squarefree-conductor hypothesis is introduced.

## RT-RankZeroOneBSDPartII~2b/F02 (P3) — applied differently

Unattributed weak approximation → the exact pinned Tau Ceti mixed-completion theorem, with GlobalNumberFields Layer 1 as its ownership reference. Updated Scope, the Tau Ceti contract, §4.2's route and Needs, and Layer 4 Dependencies. Added d=−31 and d=137 as opposite-sign witnesses. The review's missing-library premise no longer holds at these worker pins.

## Evidence and ownership

The worker content is main c99407021ca54e77e61223896e876565b8c18aa4. Its manifest and actual checkouts agree: Mathlib f6090c7095e1e56b3464c1daba5f24631f1290d2; Tau Ceti 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a. These differ from the review snapshots. The following checks use the worker pins, not the reviews' library inventories.

- EulerSystemsAndKolyvaginSystems §8.31, “Augmentation control” and its corank-one consequence, explicitly supplies finite discrete restriction kernel and cokernel and the coinvariant-rank identity. Its hypotheses are good ordinary p∤2N, discriminant prime to Np, split level and p, and E(K)[p]=0. Its separate sentence excludes residual irreducibility, (Sc) and (Irr) from this theorem's hypotheses. The local dictionary gives E(ℚ_p)[p]=0; splitting gives K_v=ℚ_p, so restriction of coordinates embeds E(K)[p] into this zero group. The chosen field's corank is supplied by §1.2. CGLS line 1847 and line 1852 give the corank-one consequence, and CGLS line 2166 uses it in the converse. The compact kernel remains a genuine additional supplier gap; the discrete theorem does not provide it.
- GrossZagierAndArithmeticHeights's Scope explicitly assigns its §§8.15 and 8.19 to its kernel route, excluding EffectiveClassNumbers as their supplier. Section 8.19's Needs and outline use §§8.15 and 8.4. EffectiveClassNumbers §2.8 independently states the same elliptic coefficient for odd D coprime to N with every level prime split. Thus agreement of formulas is valid; the claimed import was not.
- At the Tau Ceti pin, `TauCeti/NumberTheory/NumberField/Global/Approximation/Weak.lean:204` proves `TauCeti.GlobalNumberFields.weakApproximation_denseRange` for a number field, finite sets of finite and infinite places, and the actual products of completions. The namespace is fixed at line 72 and the field/number-field binders at line 74. Its nonvanishing/sign consequence is at line 325. Nonzero squareclasses are open in each rational completion, including at 2; the real sign is open as well. A point in such a product neighborhood is nonzero. If the set of places is empty, take 1. Replacing the rational point by its signed squarefree representative multiplies by a rational square and preserves every prescription. The analogous owner is GlobalNumberFields Layer 1 on main. There is no new approximation target or supplier gap here.

Ownership searches used `roadmaps grep` over main and the supplied open-head index for augmentation control, mixed-place approximation and compact specialization, together with a board-package search by these objects. I read the matching supplier statements. No new generic construction is owned here: the edits replace a duplicate route by its existing owner and expose a native library input. Ownership against the provided open roadmap heads was checked; no additional heads were sought. The existing assembly and converse targets retain their scope.

## Citation and pin audit

Main-branch shape references read before editing were GlobalNumberFields, PadicMeasuresIwasawaAlgebras and ModularForms. For suppliers absent from main I used their supplied heads or `roadmaps show`; for existing main roadmaps I used main, not revision pull requests.

| Citation family | Resolved statements and scope |
| --- | --- |
| EulerSystemsAndKolyvaginSystems §8.31 | Discrete augmentation control and its corank-one consequence, independently of the image hypotheses on other results in that section. |
| SelmerIwasawaCohomology §§2.6, 2.9–2.12a | Saturation, compact/rational and discrete Kummer carriers, dual/corank and Mordell–Weil/Sha comparisons. |
| SelmerIwasawaCohomology §§3.9–3.11 | Local correction complex, derived Tor edge sequence and classical restriction using actual localization images. None supplies the additional CGLS compact kernel unconditionally. |
| SelmerIwasawaCohomology §§4.26, 4.28, 4.29 | Rational Kummer comparison, quadratic-character decomposition at odd p, and the elliptic alternation/reduced-primary product inside §4.29. The latter subsection's two-primary title does not restrict its general elliptic pairing paragraph. |
| HeegnerPointEulerSystems §§8.5–8.6a, 8.13, 8.24, 8.31–8.32, 8.34 | Actual family and fixed-isogeny corrections, unit-line/bottom comparison, non-torsion tower class, paired structure and augmentation bound. Its pre-trace factor differs from the traced factor here. |
| HeegnerPointEulerSystems §§8b.2, 8b.10 | Rational odd-p CGLS comparison and Eisenstein equality with independent declared supplier gaps. The p>3 integral branch is not substituted at p=3. |
| GrossZagierAndArithmeticHeights §§0.1, 8.14–8.15, 8.18–8.19 | x-height dictionary, explicit formula, trace non-torsion criterion and elliptic formula. §8.17 assumes squarefree N and is excluded. |
| EffectiveClassNumbers §2.8 | Independent classical all-split-level formula with the same coefficient. |
| ArithmeticStatisticsPartI §§0.1, 0.2, 0.5, 0.6, 0.15 | Ratios and relative lower density; local families; squareclass/twist carrier; squarefree residue count; positive denominator for inhabited rectangles. Compatibility is an input to the last theorem, not its conclusion. |
| ArithmeticStatisticsPartIII supporting counting contract | Seven-part C(F,ι,Σ); its rational discharge remains gap:rational-three-isogeny-count. |
| ArithmeticStatisticsPartVI supporting low-rank and elliptic p-parity targets | Q-only forward theorem for every curve with modular comparison, and corank/root-number parity including reducible residual p=3. The two complementary-twist branches remain an explicit additional gap. |
| ArithmeticStatisticsPartVII §§5.10, 5.32 | Adjusted three-Selmer rank, locally defined ratio classes, restricted bounds, and attainable local ratios including bad dyadic places. |
| EllipticCurveModularity R29.3–R29.6; ModularForms Layer 7 | Rational newform, exact conductor/Euler factors, parametrization and analytic continuation. Quadratic base-change factorization is still separately requested. |
| EllipticCurves Layers 1–2, 4–5, 7 | Isogeny/Weil pairing, local reduction and twist interfaces, general discrete Selmer and Kummer theory. |
| PadicMeasuresIwasawaAlgebras Layer 4 | Iwasawa coordinate, height-one localization, characteristic ideals and module structure. |
| GlobalNumberFields Layer 1 | Main-branch mixed-place weak approximation, consumed through its pinned Tau Ceti realization. |
| CMRankZeroConverse C.0–C.6; RankOneConverse PC.0–PC.6 | Board design ownership; C.0 states the shared p-converse proposition. RankOneConverse's PC.0–PC.6 exist in its board design. The resolver's sole missing-roadmap lead is therefore not a missing ownership reference. |

The legal cached sources were read at their cited steps: CGLS line 79 and line 219 for the good odd-prime range; line 1847 for augmentation; line 1934 through line 1963 for normalization; line 2001 for the characteristic equality; line 2145 through line 2215 for the converses and statistical scope. BKLOS line 94, line 156, line 643, line 654, line 674, line 713, line 764 and line 800 fix the family, signed/absolute strata, rank bounds, local ratios and approximation application. PS line 64, line 132, line 425 and line 456 fix divisible kernels and elliptic alternation. No source passage was copied into a package file. No new external work is cited; all three source entries remain certified and no reference request is needed.

Pinned API checks were by source and type, not by name alone:

| Pinned file | Declarations and conditions verified |
| --- | --- |
| Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean | Native five-coefficient carrier, invariants, coefficientwise map, ellipticity as unit discriminant and j. Singular curves remain possible on the bare carrier. |
| Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean:299,323,328 | Minimal curve; HasGoodReduction extends minimality with multiplicative valuation Δ=1; equivalence with elliptic reduction. This is not additive valuation 1. |
| Mathlib/NumberTheory/Height/NumberField.lean:431; Mathlib/NumberTheory/Height/EllipticCurve.lean:103,116 | Number-field Northcott and its affine-point specialization. |
| Mathlib/Topology/Algebra/Order/LiminfLimsup.lean:133 | Real functions, nontrivial filter, eventual nonnegativity, first factor bounded above and second cobounded for ≥. Ratios in [0,1] meet these conditions. |
| Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:84 | Raw L-series of the arithmetic coefficient function, without the continued central-order interface. |
| Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean:71 | Intersection of localization kernels for supplied topological representation data, without elliptic Kummer identifications. |
| TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean:139 | Coordinate pullback and maps-infinity fields; degree and induced point maps belong to the same development. |
| TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean:169,239,299,306 | Real twist body, discriminant scaling, unit-parameter ellipticity criterion and j-invariance with ellipticity. |
| TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean:260,302,332 | Nonnegative height, transfer of Northcott, and zero iff torsion with ellipticity and Northcott. |
| TauCeti/NumberTheory/NumberField/Global/Approximation/Weak.lean:204 | Actual mixed-completion dense-range theorem at the worker pin, as used by the repair. |

The native two-descent squareclass Selmer carriers do not supply the missing odd-primary classical Kummer/ordinary anticyclotomic interfaces. The acceptance docstring's reasons for not stating the headlines still apply. No declaration of another roadmap is redeclared here.

## Adversarial mathematics pass

These are computed controls on definitions and proof steps, not proofs of the deep arithmetic theorems. Write T=γ−1, R=Λ_(T), k=R/(T), C for the fixed-isogeny condition, and η for the nontrivial unramified quadratic character at 3. “Retain” means that the computed test requires no mathematical change. Rows identify every numbered statement and each definition API item; Check rows use their ordinal within the indicated section.

| Statement | Instances tried | Values computed on each side | Result / change |
| --- | --- | --- | --- |
| Conventions: residual determinant/exclusion | p=3; φ=1,ω,η,ωη | ψ=ωφ⁻¹; admissibility vector (0,0,1,1); φψ=ω in all four cases | Retain actual kernel, not an arbitrary constituent. |
| Conventions: corank and coefficients | S=(ℚ₃/ℤ₃)^c⊕M² | Pontryagin-dual rational dimension c; S⊗ℚ₃=0; dim S[3]=c+2 dim M[3] | Retain dual convention. |
| Conventions: quadratic projectors | c acts by 1,−1 | ((1+c)/2,(1−c)/2)=(1,0),(0,1); 1/2∉ℤ₂ | Odd-prime hypothesis retained. |
| Conventions: involution and augmentation | γ=1+T | γ⁻¹−1=−T/(1+T), order 1; T maps to 0 at augmentation; 3 becomes a unit in Λ[1/3] | T remains a nonunit. |
| Conventions: continued central order/sign | r=0,1 | signs +1,−1; complementary signs −1,+1; sums of orders 0+1=1+0=1 | No analytic hypothesis on the original curve introduced. |
| Conventions: height normalization | h_(O)(P)=1; h_(O)(2P)=4 | h_x(P)=2, h_x(2P)=8; B_x(P,P)=(8−2−2)/2=2, versus 1 in the other normalization | Retain positive factor 2. |
| Conventions: signed squareclasses | d=2,18; local classes 1,2,3,6 | 18/2=9; masses 3/8,3/8,1/8,1/8 sum to 1 | No double count or uniform quarter masses. |
| Conventions: signed versus absolute ratio strata | c=1,3,1/3 | signed exponents 0,1,−1; absolute exponents 0,1,1 | BKLOS's absolute T₁ is the union of the two signed odd strata. |
| §0.1 definition | p=3, φ=η; φ=1; p=2 | C=1; C=0; oddness 2>2 is false | Retain. |
| §0.2 finite-Selmer comparison | (c,s)=(0,0),(1,0),(0,1),(1,1) | dim S[p]=0,1,2,3; coranks 0,1,0,1 | dim≤1 forces s=0; retain pairing input. |
| §1.1 complementary fields | r=0,1; D=−3 | complementary order 1,0; total root sign −1; u_(−3)=3 and D<−4 fails | Retain discriminant and splitting conditions. |
| §1.2 corank over K | r=0,1, p split | 0+1=1; 1+0=1; E(K)[p] embeds into E(ℚ_p)[p]=0 | Supplier-control hypotheses follow. |
| §2.1 discrete control and augmentation | X=R, R⊕k, R⊕k² | coinvariant dimensions 1,2,3; torsion lengths 0,1,2 | Import existing discrete theorem; only first model passes corank one. |
| §2.1 compact gap | S=R with specialization f↦f(0); S=R² with same coordinatewise map | kernels TR and TR²; quotient maps k→k and k²→k² inject; Tor₁(k,k)=k has dimension 1 | Kernel formulated on S[1/p]; retain possible cokernel terms. |
| §2.2 traced factor | p=3, a_p=2, α≡5 mod9, β≡6 | 5²−2·5+3=18≡0; α⁻¹≡2; trace factor (1−2)²=1; Howard factor 25·25≡4 | Distinct factors, both units. |
| §2.2 excluded anomalous root | α≡1 mod3 | (1−α⁻¹)²≡0, whereas admissible α≡2 gives 1 | Local exclusion is needed. |
| §2.3 characteristic equality | S=R, κ=1 or T | char(S/Rκ)²=(1) or (T²); bottom class 1 or 0 | Valuation zero forces generator; nonzero tower class alone fails. |
| §2.3 nonsquarefree comparison | N=20, D=−71, c=1 | D mod(8,5,3)=(1,4,1); gcd(N,D)=1; μ=0; u=1; both coefficients ‖ω_E‖²/(C²√71) | Added Check; squarefree N hypothesis fails since 4 divides 20. |
| §3.1 p∞ converse | r=0,1,2 | 1−(1−r)=0,1 in the allowed cases; natural 1−2=0 is junk outside them | Retain r∈{0,1}. |
| §3.2 full Sha consequence | analytic orders 0,1; abstract group ⊕_(ℓ≠p)ℤ/ℓ | forward theorem gives ranks 0,1 and finite total Sha; abstract group's p-part has size 1 but total size is infinite | Keep forward theorem after converse. |
| §3.3 finite-Selmer converse | dim 0,1; false model ℤ/3 | paired case gives coranks 0,1; ℤ/3 has dim[3]=1, corank0, and only zero alternating form | Pairing excludes false model. |
| §4.1 admissible family | φ=1,η on classes 1,2,3,6 | membership vectors (0,1,0,0), (1,0,0,0); for v₃(j)<0 vector (0,0,0,0) | Retain local-good condition and actual character. |
| §4.2 ratio strata | finite ratio 1 or 3, real factor 1 or 1/3 | global pairs (1,1/3) or (3,1), exponents (0,−1) or (1,0) | Both zero and absolute-one strata obtained. |
| §4.2 local realization | d=−31 and 137 | residues mod(3,8,19)=(2,1,7),(2,1,4); roots at19 are ±8,±2; signs −,+ | Added Check and exact pinned supplier. |
| §4.3 restricted proportions | even variable 0,2 with mass q at0; odd variable 1,3 with mass q at1 | means 2−2q≤1 implies q≥1/2; 3−2q≤4/3 implies q≥5/6 | Retain adjusted rank and nonempty strata. |
| §4.3 absolute lower limits | stratum masses 1/8,1/4; relative lower limits 1/2,5/6 | products 1/16 and 5/24; empty cutoff gives 0=0·0 | No analytic density existence needed. |
| §4.4 positive absolute proportions | masses a,b>0; empty admissible family | a/2>0, 5b/6>0; empty masses give 0 and fail good-twist hypothesis | Retain scope. |
| §5.1 model and flex | tuple (0,1,1,1,0), P=(0,0) | b₂,b₄,b₆,b₈=(4,2,1,0); Δ=−19,c₄=−32,c₆=8,j=32768/19; tangent residual x³ | Retain; P is not infinity. |
| §5.2 density diagnostic | squarefree unit classes at3 | unit mass (1−1/3)/(1−1/9)=3/4; allowed half 3/8; 5/12−3/8=1/24 | The restricted method cannot yield the full-family 41.6% claim. |
| §5.3 obstruction and local theorem | W=(1,0,3,0,0); d=1,3,1/3,0 | Δ=−2160,c₄=−71,c₆=−1837; j=357911/2160, v₃(j)=−3; twist Δ-valuations 3,9,−3; d=0 gives Δ=0 | All nonzero twists fail good reduction; d=0 excluded. |
| New native approximation contract | x=2/3; no places; opposite real signs | signed squarefree representative 6 and (2/3)/6=1/9; with no places d=1 works; d=−31,137 meet same finite classes with signs −,+ | No integrality or height-preserving inference from approximation. |

### Definition APIs

Each numbered API item is counted in its original order; no item is added to Suggested.lean.

| Statement | Instances tried | Values computed on each side | Result / change |
| --- | --- | --- | --- |
| §0.1 API 1, constructor | p=3 good, degree3, φ=η versus 1 | conjuncts all 1 versus exclusion0; C=1 versus0 | Retain. |
| §0.1 API 2, projections | C=1 at p=3; identity isogeny | p>2 true, degree3; identity degree1≠3 | Retain. |
| §0.1 API 3, characters | φ=η or1 | ψ=ωη orω; products ω in both; only first passes | Retain. |
| §0.1 API 4, dual | φ=1,ω,η,ωη | dual swaps 1↔ω, η↔ωη; membership vector (0,0,1,1) unchanged | Retain. |
| §0.1 API 5, transport | kernel basis multiplied by −1 | (−1)φ(g)(−1)⁻¹=φ(g) | Transport actual kernel. |
| §0.1 API 6, identity | identity diagram | 1·φ(g)·1=φ(g); C maps to same proposition | Retain. |
| §0.1 API 7, composition | two multiplications by −1 | composite scalar1; twice-conjugated character φ(g)=1·φ(g)·1 | Retain. |
| §4.1 API 1, membership | nineteen-a3 d=2,1,3 | good/exclusion=(1,1),(1,0),(0,–); membership1,0,0 | Retain. |
| §4.1 API 2, squares | d=2,18 | 18/2=9=3²; local character η both; membership1 both | Retain. |
| §4.1 API 3, initial twist | d₀=2; d=1,2 | membership in E² is1,0; product classes2,4 have membership1,0 in E | Both implications; heights1 and2 differ. |
| §4.1 API 4, dual family | φχ=η or1 | dual ωη orω; membership pairs (1,1),(0,0) | Both directions. |
| §4.1 API 5, localization | four classes at3 | allowed set {2} for nineteen-a3, empty for W; masses3/8 and0 | Retain. |
| §4.1 API 6, C iff membership | d=2,1,3 | C and membership both (1,0,0) | Both implications. |
| §5.1 API 1, coefficients | displayed tuple versus short form | a₂=a₃=1 versus0,0 | Coefficient projections distinguish models. |
| §5.1 API 2, invariants | b=(4,2,1,0) | Δ=−64−27+72=−19; c₄=16−48=−32; c₆=−64+288−216=8 | Retain. |
| §5.1 API 3, ellipticity | rational discriminant versus zero curve | (−19)(−1/19)=1 versus Δ=0 | Ellipticity requires unit discriminant. |
| §5.1 API 4, j | any ellipticity proof | (−32)³/(−19)=32768/19; inverse discriminant always −1/19 | Retain proof-independent value. |
| §5.1 API 5, base change | ℚ→ℚ[ε]/ε²; zero ring; hypothetical ℚ→𝔽₃ | coefficient ε-parts0; zero ring0=1 makes Δ a unit; hypothetical map gives1=f(3·1/3)=0 | Ring generality valid; no map to 𝔽₃ posited. |
| §5.3 W API 1, coefficients/ellipticity | (1,0,3,0,0) over ℚ | Δ=−2160; Δ·(−1/2160)=1 | Retain. |
| §5.3 W API 2, invariants | b=(1,3,9,0) | c₄=1−72=−71; c₆=−1+108−1944=−1837; c₄³−c₆²=−3732480=1728Δ | Retain. |
| §5.3 W API 3, local base change | d=1,3 and coordinate scaling u | v₃(j)=−3 both; coordinate changes give 3(−4v(u))−(−12v(u))=0 | Minimalization cannot remove j obstruction. |

### Labelled README Checks

This table accounts for all 53 Check bullets, including the three added bullets. Arithmetic consequences are tested under their named supplier contracts, not on unconnected arbitrary data.

| Statement | Instances tried | Values computed on each side | Result / change |
| --- | --- | --- | --- |
| Conventions Check 1 | η and ωη at3 | Frobenius η=−1; inertia η=1, ωη=−1; product ω | Retain. |
| Conventions Check 2 | c=1,−1; p=2 | projectors (1,0),(0,1); 1/2∉ℤ₂ | Retain. |
| Conventions Check 3 | T coordinate | involution −T/(1+T), order1; 3 invertible, T nonunit | Retain. |
| Conventions Check 4 | heights1,4 | x-heights2,8; polar value2 versus1 | Retain. |
| Conventions Check 5 | four classes; 2,18 | masses sum1; unit mass3/4; 18/2=9 | Retain. |
| §0.1 Check 1 | η and dual | admissibility1,1 | Retain. |
| §0.1 Check 2 | 1 and ω | admissibility0,0 | Retain. |
| §0.1 Check 3 | p=2; multiplicative prime | oddness0; good-reduction conjunct0 | Retain. |
| §0.1 Check 4 | residual matrices with same permitted diagonal and off-diagonal0 or nonzero | φ=η, ψ=ωη both cases; exclusion1 both | No split-extension assumption. |
| §0.1 Check 5 | good reducible at3, φ=η | ordinary quotient Frobenius2; local p-torsion dimension0 | Retain dictionary consequence. |
| §0.2 Check 1 | cyclic order9 | cardinality9 square; b(ae,be)=ab·b(e,e)=0 for alternating form | Not a perfect nontrivial pairing. |
| §0.2 Check 2 | c=s=1 | dim S[3]=3, corank1 | No higher-dimensional equality. |
| §1.1 Check 1 | r=0,1 | twist orders1,0 | Retain complementary branches. |
| §1.1 Check 2 | N=20,D=−71 | all level primes split; D mod8=1, mod5=4 | Split auxiliary field, no residual nonsplit condition. |
| §1.2 Check 1 | original corank0 or1 | only twist's known analytic rank1 or0 is sent through forward theorem; sums1 | No full Sha assumption on E. |
| §2.1 Check 1 | X=R and torsion X_E=k | Λ-ranks1,0 | Modules not interchangeable. |
| §2.1 Check 2 | R and R⊕k | quotient dimensions1,2; torsion lengths0,1 | Expanded boundary Check. |
| §2.1 Check 3 | ℤ/3 and R/(T) | first rationalizes to0; second retains residue dimension1 | Retain augmentation. |
| §2.1 Check 4 | resolution R→R of k by multiplication T | tensor with k gives zero map k→k; Tor₁=k dimension1 | Added; do not erase cokernel terms. |
| §2.2 Check 1 | κ=T in S=R | tower class≠0; bottom0 | Nonzero tower alone insufficient. |
| §2.2 Check 2 | α≡5,β≡6 mod9 | traced factor1; Howard factor4 | Distinct normalizations retained. |
| §2.3 Check 1 | κ=T | index-square (T²) becomes unit after inverting T although bottom0 | Equality at retained P₀ is necessary. |
| §2.3 Check 2 | hypothetical divisible Sha line | corank1 despite finite reduced part0 | Do not assume rank1/finite Sha before converse. |
| §2.3 Check 3 | N=20,D=−71 | splitting residues1,4,1; μ=0, u=1; same coefficient ‖ω_E‖²/(C²√71) | Added nonsquarefree Check. |
| §3.1 Check 1 | factor central orders (0,1),(1,0) | total order1 minus complementary1,0 gives original0,1 | Nonzero value versus simple zero distinguished. |
| §3.1 Check 2 | p=3,φ=η; N=20 split K | p>2 true; exclusion1; squarefree N false | No p≥5, residual irreducibility or squarefree-level hypothesis. |
| §3.2 Check 1 | analytic orders0,1 obtained by converse | forward outputs ranks0,1 and finite whole Sha | Sha finiteness is an output. |
| §3.3 Check 1 | unpaired ℤ/3 versus divisible line | both dim[3]=1; coranks0 versus1 | Pairing excludes first model. |
| §3.3 Check 2 | p=3 | 3>2; no p≥5 test | Retain. |
| §4.1 Check 1 | rational kernel, classes1,2,3,6 | membership (0,1,0,0) | Retain pointwise rational kernel hypothesis. |
| §4.1 Check 2 | 2,18 | ratio9 square; membership1 both | Count once. |
| §4.1 Check 3 | v₃(j)=−3 | all four classes yield negative valuation−3; membership0 | Retain empty family. |
| §4.1 Check 4 | φ=η, then twist by η | φχ=η then1; membership1 then0 | Rule d≡2 is not universal. |
| §4.1 Check 5 | W with rational 3-isogeny | degree3 true, admissible mass0 | Good-reduction conjunct retained. |
| §4.2 Check 1 | fixed 3-adic class2; signs ± | finite class unchanged; real factors1 and1/3 | Statistics uses same local family. |
| §4.2 Check 2 | finite ratio1,3 | odd exponent−1,+1 | Both in absolute-one stratum. |
| §4.2 Check 3 | −31,137 | residues (2,1,7),(2,1,4); 8²≡7,2²≡4 mod19; opposite signs | Added approximation Check. |
| §4.3 Check 1 | masses1/8,1/4 | absolute lower bounds1/16,5/24 rather than1/2,5/6 | Actual denominators retained. |
| §4.3 Check 2 | relative proportions1/2 and1 in a mass1/8 stratum | both satisfy ≥1/2; absolute proportions1/16 and1/8 differ | Bounds give no exact density. |
| §4.3 Check 3 | relative ratios with liminf1/2,limsup1; stratum mass1/8 | no relative limit; absolute liminf (1/2)(1/8)=1/16; odd bound5/24 | Product estimate does not need two limits. |
| §4.4 Check 1 | W outside good-twist hypothesis | admissible density0; endpoint's premise false | No complement assertion. |
| §5.1 Check 1 | native invariant formula | Δ=−19, different from19 and−361 | Retain. |
| §5.1 Check 2 | x=0,1,2 over𝔽₃ | affine fibres2,2,1; total6; trace4−6=−2; equation coefficient a₃=1 | Retain. |
| §5.1 Check 3 | t=0,n=−2 | D=8; Δ=−19·8⁶=−4980736 versus−19·2⁶=−1216 | Native raw model distinction retained. |
| §5.1 Check 4 | tangent at(0,0) | y=x; residual x³; contact order3 | Nonidentity flex has order3. |
| §5.1 Check 5 | tuple versus short model | a₂=a₃=1 versus0 | Retain. |
| §5.2 Check 1 | unit squarefree mass | (3/4)/2=3/8 versus uniform1/2 | Retain height measure. |
| §5.2 Check 2 | point(0,0) versus infinity | affine coordinates(0,0); infinity has no affine coordinates | Distinct group elements. |
| §5.2 Check 3 | admissible conversion ceiling | 3/8<5/12, gap1/24 | Method fails to transfer percentage; full rank-one set is not bounded here. |
| §5.3 theorem Check 1 | d=1,3 | local characters can vary, j valuation remains−3 | Negative valuation persists. |
| §5.3 W definition Check 1 | derivatives at(0,0) | y-partial3,x-partial0; tangent y=0; residual x³ | Flex not infinity. |
| §5.3 W definition Check 2 | 357911/2160 | v₃ numerator0, denominator3; quotient valuation−3 | Sign of valuation correct. |
| §5.3 W definition Check 3 | d=0,1,3 | Δ=0; nonzero twist Δ-valuations3,9; j-valuations−3,−3 | Exclude zero parameter; raw valuations alone not reduction test. |

The Examples and Worked examples use the same objects: their values are the invariant/fibre computations in §§5.1–5.3, the two height values, the augmentation dimensions, the two unit factors modulo 9 and the lower-bound products above. Recomputing them introduced no change. The general approximation theorem's finite/nonfinite place hypotheses, p=2 local squareclasses, the empty prescription, the zero parameter and finite versus augmentation-primary errors were all retained. Nonabelian group countermodels are irrelevant to these explicitly abelian Selmer/Iwasawa modules; no theorem here quantifies over arbitrary groups.

## Checks and maintainer notes

- Required acceptance elaboration: ran `lake env lean` on `packages/RankZeroOneBSDPartII/Suggested.lean` from the worker's pinned content checkout. Exit 0, no output. No TauCeti import is used by that file, so no missing object needed a targeted build. No process remains running.
- Mechanical declaration/signature inventory: 0 definitions, abbreviations, instances, opaque declarations, theorems or examples; exactly one import, `import Mathlib`. There are therefore 0 names for `#check @name`, 0 inferred section binders to compare, and no signature change. The module's unstatability explanations still match the README endpoints. No boundary theorem or API padding was added.
- Required dependency check: exit 0. Exact output:

```text
depcheck: 186 roadmaps, 1222 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Both added ownership references point earlier or to main; the actual weak-approximation input is native at the pin.

- Citation resolver: exit 0; no unresolved Lean names. Its one roadmap lead is RankOneConverse PC.0, resolved against `packages/RankOneConverse/design/plan.json`, including stages PC.0–PC.6. Its automatic library scan reported unavailable Lake packages in its own search context; the library checks above used the actual worker pins directly.
- Scope/diff check: `git diff --check` passes. JSON comparison after removing the top-level gaps list shows every other plan field unchanged. All five gap descriptions match their README contract sentences exactly. Only cgls-ordinary-control changed; its slug, supplier and section are preserved.
- Supplied gate warning: added `module` before `import Mathlib` in `packages/RankZeroOneBSDPartII/Suggested.lean`. Repeated the required acceptance elaboration: exit 0, no output and no warning. Repeated the dependency check: exit 0, with exactly `depcheck: 186 roadmaps, 1222 edges, 0 problem(s)` and no UPWARD or CYCLE line. The header adds no declaration or binder; the zero-declaration signature inventory above is unchanged.
- No declaration name changes affect consumers. SelmerIwasawaCohomology is asked only for the compact endpoint under the existing slug; EulerSystemsAndKolyvaginSystems retains its discrete theorem. GlobalNumberFields's existing endpoint is consumed through Tau Ceti. The other four supplier gaps, the existing package title and the statistical scope are unchanged. Metadata and sources require no edit. The only additional Suggested.lean change is the module header. No commit or external write was made. A fresh independent review remains for the worker.
