# Repair report: HeegnerPointEulerSystems

The two reviews contain 17 findings. Their mathematical witnesses hold. Overlaps are identified below, with one repair for each shared issue. This report is a repair record, not independent acceptance.

# Review r2a

## F01 (P3) — applied

Sixteen boundary/API theorems and 28 routine examples → README API prose and Checks only. All their mathematical content remains in the relevant numbered sections. The additional two algebraic theorems and fourteen definitions are addressed under F02. No boundary declaration was replaced by a proof or another acceptance declaration.

## F02 (P2) — applied differently

Fourteen generic definitions and their consumers → a 44-line acceptance file listing twelve groups of unavailable arithmetic headlines and their missing constructions. The true coefficient normal form remains a §4.1 API target; the finitely generated group fact remains §7.1 background. Neither is a deep Heegner headline. No arithmetic headline can be stated using only simple pinned definitions.

## F03 (P3) — applied

The two unconditional g=1 maximality Checks → optimal-embedding Checks, with both unramified and ramified witnesses. Added the conjugated ℚ₅(√2) and ℚ₂(i) negative controls in §0.1. khayutin line 852 defines the intersection; khayutin line 875 permits a nontrivial conductor. Integrality gives b∈5ℤ₅ and b∈2ℤ₂ respectively.

## F04 (P1) — not actionable in this package: arithmetic image theorems require their supplier

False R28.4 open-image attribution → actual R28.4.5–R28.4.6 Tate comparisons and R28.6.7 commutant generation. Added gap:elliptic-adelic-open-image and gap:abelian-scalar-image under ArithmeticGaloisRepresentations and in the plan. Updated §§7.2–7.4 through the corrected §7.3 inputs. The supplier only defines image predicates; proving these missing general arithmetic theorems requires its owner. nekovar lines 1632–1644 identify the scalar input.

## F05 (P1) — applied

Implicit RM finite generation → HeightsRationalPointsAndObstructions §1.7 before C₀, and in §§7.1, 7.10, 7.12. Added the ℤ² and ℚ divisibility Checks in §7.6. Replaced the multiplicative limit-Kummer citation in §§7.7, 7.12 by SelmerIwasawaCohomology §2.12a and its abelian finite-Selmer theorem. The supplier explicitly proves finite generation for every number-field abelian variety.

## F06 (P1) — not actionable in this package: uniform length descent requires its supplier

Claimed square-index supply by exponent theorems → gap:classical-uniform-square-index in both contracts, consumed in §7.13. Added the exponent-versus-order negative control there. The supplier’s §4.13 expressly excludes this length conclusion. kolyvagin-structure lines 56–70 state the full-image set, square-index divisibility and independence from K; proving its missing generic descent is outside this package.

## F07 (P1) — not actionable in this package: the surjective p=3 integral comparison requires its supplier

Added gap:surjective-three-integral-comparison and its §8b.2 branch, retaining p=3 in §8b.4. The Eisenstein §8b.10 now uses CGS Theorem C directly, with integral normalization inputs. Removed the shared p≥5 μ dependency from §8b.1; it remains on §8b.5’s reverse-divisibility route. bcs lines 413–423 and cgs lines 156–169 support the endpoints; cgls lines 1503–1516 give only rational comparison.

## F08 (P2) — applied

Local ownership of the conductor residue-unit sequence → import from ImaginaryQuadraticClassNumber H1.4. Updated Scope, Exact supplier contracts and §0.4. The successive c→cℓ kernel remains an application here, including all unit indices. H1.4 on main states the full conductor exact sequence, class-number formula and exceptional-unit cases; h(ℤ+3ℤi)=2 agrees with the retained Check.

## F09 (P2) — applied

Odd discriminant alone → explicit (disc): odd D_K≠−3 for the ordinary Heegner family and its arithmetic consumers, stated at §§8.2–8.6, 8.13, 8.37 and in Conventions. Added −3/−7 controls. General orders, towers and unit-corrected CM points retain exceptional discriminants. cgls line 81 defines (disc), and line 1417 imposes it on §4.1.

## F10 (P3) — applied

Three nonexistent Selmer citation suffixes → actual §§2.13–2.17 duality and §3.1 Iwasawa cohomology. The existing §3.2 Shapiro citation remains. Exact supplier contracts now includes §3.1. The supplier’s numbered targets, including §2.17 for integral coefficients, resolve; malformed anchors provide no evidence of missing mathematical theory.

## F11 (P3) — applied

All undeclared own API/Check labels and boilerplate target identifiers → mathematical prose throughout Layers 0–8b. Definition APIs, mathematical targets, source locators and Checks remain. Removed references asserting that deleted examples or wrappers are in Suggested.lean, including the C₃ polynomial Check. The citation resolver now finds no unresolved own Lean names.

## F12 (P2) — applied

Classical conductor-one trace and conjugation construction here → import from EffectiveClassNumbers §2.8, Classical Heegner construction. Updated Scope, contracts, Conventions and §§1.5–1.6. Higher conductors and integral quaternionic normalization remain here. Added the N=37, D=−139 three-summand and N=5077, D=−7 one-summand agreement Checks. The supplied head’s §2.8 explicitly owns those classical laws.

## F13 (P3) — applied differently

Identity/negation-only tests → added the shear inverse test in §§4.4, 5.3, 8.33, and γ·ι(γ)=1 versus γ²≠1 in §8.30. These are README Checks only. For χ(x,y)=(x+y,y), χ⁻¹(0,1)=(−1,1), while χ(0,1)=(1,1). The determinant’s twisted second factor agrees with cs lines 707–715.

# Review r2b

## F01 (P3) — applied

Lower-cased surname → “Heegner-point” in the title. The lower-case title style preserves proper names, as in main’s LocalGaloisGroups and PolynomialGaloisGroups titles. No mathematical target changed.

## F02 (P3) — applied

The same three malformed Selmer suffixes as r2a:F10 were repaired once. Section 5.5 now names actual integral duality targets; §8.6 names §3.1 and retains §3.2 Shapiro. No theory gap was inferred from the invalid suffixes.

## F03 (P3) — applied differently

The nine universal-family labels → prose API/Checks, rather than new prefixed undeclared identifiers. This shares r2a:F11’s package-wide repair. Rephrased finite solvability in §8.5 as the mathematical hypothesis established in §8.4, with explicit soluble and insoluble finite constraint systems. No deleted Lean constructor or witness argument is claimed.

## F04 (P3) — applied differently

The six identified declarations were deleted with r2a:F01–F02’s complete removal of padding and generic wrappers. Their true background/API/Check content remains in §§1.5, 5.3, 7.1, 8.2, 8.14, 8.33. The repair does not add replacement API names or prove the admitted generic group theorem in the acceptance file.

# Verification and mathematical audit

The following computations are boundary tests and conditional numerical ledgers, not proofs of deep arithmetic theorems. For a deep theorem, a ledger instantiates its rank, length, sign or index formula under its stated hypotheses; the source and supplier checks determine whether those hypotheses are available. Characteristics zero, actual number fields, nonzero arithmetic lattices, exact conductor and the stated image hypotheses exclude zero-ring and inseparable-field models from the arithmetic targets. Abstract comparison models are explicitly identified.

## Numbered target statements

| Statement | Instances and values computed on both sides | Result and change |
| --- | --- | --- |
| §0.1 local order | Integral √2 matrix: b∈ℤ₅; conjugated matrix: b∈5ℤ₅; dyadic conjugate: b∈2ℤ₂ | Maximality needs optimal embedding; repaired. |
| §0.2 global order | ℤ+3ℤi has basis (1,3i), index 3 and discriminant −4·9=−36; all maximal localizations give ℤ[i] | Localization and index agree. |
| §0.3 idele/class map | Principal factor a changes I to aI, so [aI]=[I]; in ℚ(√−5), x²+5y²=2 has no integer solution | Principal invariance holds; norm-2 ideal is not principal. |
| §0.4 successive conductor | At ℓ=5: inert/split/ramified give 6/4/5 before units; ℚ(i), c=1, ℓ=3 gives 4/2=2 | Imported sequence gives all stated degrees. |
| §0.5 tower quotients | ℚ(√−5): conductor-one class group has size 2, so [K[1]:K]=2; identity restriction has kernel 1 | Field inclusion and quotient direction agree. |
| §0.6 conjugation | In C₃, τsτ⁻¹=s²; in S₃, (12)(123)(12)=(132); in C₂, inverse is itself | Generalized-dihedral law, not commutativity, is tested. |
| §0.7 relative tower | Local degrees 1 and 2 give torsion-free ranks 1 and 2; step degrees at residue sizes 3 and 9 are eventually 3 and 9 | No procyclic replacement at degree 2. |
| §0.8 norms/Artin | Identity norm gives 1↦1; arithmetic/geometric conversion sends s↦s² in C₃ | Direction and inversion retained. |
| §0.9 different | Split conductor π: norm(π,−π)=−π², discriminant ideal (π²); ℤ₂[i]: norm(2i)=4, valuation 2 | Signed norm separated from ideal equality. |
| §1.4 integral basepoint | deg(2x−D)=2−2=0 for deg D=2; deg(x−D)=−1; multiplying clearing integer 2 by 3 multiplies class by 3 | No lost denominator. |
| §1.5 point family | Cusp d=1 gives φ([x−∞]); zero quotient gives 0; negation orbit gives trace 1−1=0 although selected value is 1 | Actual divisor formula retained; classical trace imported. |
| §1.6 parametrization | Same-curve scaling 5 gives (I,c)↦(5I,5c); isogeny j=5,a=1 gives ratio multiplier 5 | Same-curve invariance and isogeny correction agree. |
| §2.1 neighbours | q=5: horizontal counts 0,1,2 and ascending counts 6,5,4 each total 6; positive level gives 1+5=6 | Three splitting types and predecessor tested. |
| §2.2 inert trace | ℚ(i), ℓ=3: local orbit size 4, field degree 2, unit index 2; 2·2=4 | Unit-corrected trace, not unweighted trace. |
| §2.3 first step | Split identity Artin elements give T−2; ramified identity gives T−1 | Distinct horizontal subtractions retained. |
| §2.4 repeated step | q=5: one predecessor plus 5 ascending neighbours; subtracting predecessor changes T value 7 to 6 | First-step degree 6 cannot replace repeated degree 5. |
| §2.5 nonmaximal level | P-new δ=1 with predecessor value 3 gives −3; δ≥2 permitted types give 0 | Sign/type distinction retained. |
| §2.6 reduction | Arithmetic Frobenius sends residue t to t^ℓ; a geometric Galois generator acts inversely; in C₃ they are s and s² | Reduction endomorphism and Artin action kept distinct. |
| §2.7 quaternionic reduction | Inert q=3 gives residue field size 3²=9; q∤n gives prime-to-conductor ideal (q), hence trivial ring-class Artin | Correct field and splitting for reduction. |
| §3.1 Kummer | In ℤ/5, δ(5)=0 and δ(1)=1; trace of negation orbit is 0 | Divisible versus nontorsion distinguished. |
| §3.2 good local condition | For trivial finite coefficient ℤ/5, unramified H¹ is Hom(Ẑ,ℤ/5), size 5; zero coefficient gives size 1 | “Unramified image” does not mean zero cohomology. |
| §3.3 component error | Component ℤ/25 at p=5 has length 2; trivial component has length 0 | Integral defects retained. |
| §3.4 coefficient-prime condition | Lattices 5ℤ₅⊂ℤ₅ have equal ℚ₅-spans and quotient order 5 | Rational comparison alone cannot identify lattices. |
| §3.5 Kummer/Sha quotient | Rank-one lattice ℤ₅ with line 25ℤ₅ has quotient order 25, length 2; rational quotient is 0 | Saturation/index data survive. |
| §3.6 real correction | On swapped ℤ₂², (1+τ)(1,0)=(1,1), while half is nonintegral; complex H¹=0 | Dyadic correction retained. |
| §4.1 coefficient ideal | (10,20)=(5), (25,150)=(25) in ℤ₅; sum=(5); empty sum=(0); v(0)=∞ | Normal form and numerical Checks stay in README. |
| §4.2 derivative invariance | C₃: D=s+2s², (s−1)D=2−s−s²=3−(1+s+s²); n=1 gives D=1 | Derivative sign and orbit sum agree. |
| §4.3 torsion invariants | Standard GL₂(𝔽₃) action fixes only (0,0); trivial action fixes all 9 vectors | Full-image premise is substantive. |
| §4.4 inverse descent | Shear inverse sends (0,1) to (−1,1); forward sends it to (1,1); zero restriction has both 0 and 1 over 0 | New inverse-direction control. |
| §4.5 divisibility iff | In ℤ, 5∈5ℤ gives zero mod 5; 1∉5ℤ gives 1 mod 5; both implications hold | Invariant vanishing is needed for unique descent. |
| §4.6 bottom class | Two-element negation trace of 1 is 0, so δ(trace)=0; δ(raw) can be 1 mod 5 | Bottom is trace Kummer class. |
| §4.7 generator change | At p=5, u=2 has inverse 3; scalar factor 3 and tensor factor 2 multiply to 1 | Raw scalar changes; intrinsic tensor does not. |
| §4.8 coefficient reduction | 7 mod 25 maps to 2 mod 5; 2 mod 5 has five lifts 2,7,12,17,22 | Reduction direction retained. |
| §4.9 parity | ε=1, w=−1, ν=0,1,2 give signs +1,−1,+1 by both formulas; mod 2 all equal 1 | No dyadic eigenspace splitting. |
| §5.1 transverse relation | ℓ=5 gives sum 1+⋯+5=15, divisible by 3 but not by 2, although 6 is divisible by both | Odd-prime proof not applied at 2. |
| §5.2 correction construction | Negation sends 3↦−3; shear does not commute with diag(1,−1): values (−1,−1) and (1,−1) on (0,1) | Global change-of-group input remains necessary. |
| §5.3 corrected system | Empty product=id gives κ′₁=κ₁; shear inverse value (−1,1) differs from forward (1,1) | Inverse control added. |
| §5.4 image hypotheses | Central −1 has −1−1=−2, a unit mod 3; trivial rank-two residual action has invariants dimension 2 | Nontrivial scalar and irreducibility distinguished. |
| §5.5 self-duality | Hyperbolic 𝔽₅⁴ has isotropic plane dimension 2 and annihilator dimension 2; dyadic half-projection is nonintegral | Corrected integral duality locator. |
| §5.6 detection pairing | For residual rank r=0,1,2 and V=𝔽₅², Hom has sizes 1,25,625 | Finite class-space quantifier retained. |
| §5.7 prime detection | Nonzero linear form x on 𝔽₅² takes value 1 at (1,0); zero form is always 0 | Detection needs a nonzero class. |
| §5.8 local lengths | ℤ/25 component contributes 2 at 5; ℤ/5 local torsion contributes 1 separately | Errors not conflated. |
| §5.9 local obstructions | Split Tate v(q)=5 gives component 5; v(q)=1 gives component 1 even when μ₅ contributes local torsion 5 | Two distinct obstructions. |
| §6.1 Howard rank one | Bottom index p² has length 2, so paired finite length ≤4; index 1 gives length ≤0 | Upper bound only. |
| §6.2 opposite eigenspace | Nonzero residual bottom with one-dimensional preferred line forces opposite dimension 0; a proposed opposite vector would give ≥1 | Conditional dimension contradiction agrees with source. |
| §6.3 same eigenspace | Nonzero bottom spans dimension 1; zero bottom spans dimension 0 | Nonzero premise cannot be dropped. |
| §6.4 Gross descent | Selmer dimension 1=MW/p dimension 1+Sha[p] dimension 0 | Rank/Sha conclusion matches Kummer exactness. |
| §6.5 square index | Index p^r for r=0,2 gives Sha length ≤0,4 respectively | Square rather than linear index. |
| §6.6 primitivity | M₀=3, common divisibility d=0 or 1 gives paired length 6 or 4 | Nontorsion alone does not force sharpness. |
| §6.7 level-changing congruence | In 𝔽₅, matched generators 1 and 2 differ by unit 2; zero maps to zero | Fixed comparison scalar retained. |
| §6.8 rank lowering | Nonzero map 𝔽₅³→𝔽₅ has kernel dimension 2; zero map has kernel dimension 3 | Nonzero localization needed. |
| §6.9 rank-zero formula | Selmer length 2 plus component sum 1 gives L-value valuation 3; L=0 has valuation ∞ | Finite and positive-corank alternatives separated. |
| §6.10 unit criterion | Normalized value 1 is a unit and nonzero mod 5; normalized value 5 is zero mod 5 | Both directions tested. |
| §6.11 period ratio | v(η)=3, v(ξ)=1 gives ratio valuation 2; two component lengths 1+1=2 | Raw congruence ideal would give 3. |
| §6.12 vanishing order | Empty support→∞; support {1}→0; support {6}→2; support {4} would count 1 but is not squarefree | Definition and arithmetic domain distinguished. |
| §6.13 base locus | D=N=1,p=5, zero family: 2 belongs and 5 does not; loc₂=1 excludes 2 | Good-prime exclusion and both membership directions tested. |
| §6.14 local pairing | 𝔽₅⁴ has finite/transverse dimensions 2+2=4; each sign line has dimension 1 | Same-sign perfect pairing and opposite-sign zero consistent. |
| §6.15 residual reciprocity | w=−1, ν=0,1 gives signs +1,−1; normalized finite/transverse identity sends 1↦1 | Tensor/local conventions retained. |
| §6.16 simultaneous detection | Coordinate forms x,y on 𝔽₅² are both nonzero at 16 of 25 points, including (1,1) | Nonempty detection set. |
| §6.17 relaxed condition | A finite local vector (1,0) is nonzero with singular coordinate 0 | Existence does not assert singular nonvanishing. |
| §6.18 triangular basis | ν=0,1,2 gives preferred dimensions 1,2,3 and detecting-prime counts 1,3,5 | Opposite bounds are 0,1,2. |
| §6.19 indivisibility | A residual nonzero class has index 0, so M∞=0; an identically zero family has M∞=∞ | Actual nonvanishing, not support algebra, is the headline. |
| §7.1 finite prime divisibility | y=6 in ℤ is divisible at primes 2,3 only; y=1 in ℚ is divisible at every prime | Finite generation supplies conclusion without rank one. |
| §7.2 open image | SL₂ commutant is scalar, determinant image {1}, index in GL₂ infinite; GL₂ has full matrix span | False attribution replaced by image contract. |
| §7.3 integral errors | u=−1 gives C₂=0 at 3, C₂=1 at 2; full matrix span gives C₃=0; scalar span misses every ϖ^cE₁₂ | Distinct scalar and commutant inputs. |
| §7.4 detection losses | 4v_𝔭(2) equals 0 at odd 𝔭 and 4e at dyadic ramification index e; e=2 gives 8 | Loss retained in coefficient-prime valuation. |
| §7.5 denominators | C₁=0 gives bottom δ(y); C₁=1 gives ϖδ(y), killing a component of order ϖ | No fictitious inverse restriction. |
| §7.6 dyadic descent | y=(12,18): depths 1 at 2 and 3, 0 otherwise; zero other errors give B=21 at 2, 42 when v_𝔭(2)=2 | General MW supplied; Checks added. |
| §7.7 primary finiteness | If B=2, entire primary lies in Sha[𝔭²]; ℚ_p/ℤ_p has elements of orders p³,p⁴ and violates the bound | Finite level plus uniform exponent used. |
| §7.8 CM field | CM ℚ(i) curve conductor 32 has ramified prime 2, so ℚ(i) cannot itself be a split Heegner field; two distinct quadratic fields have compositum degree 4 | Correct endomorphism base retained. |
| §7.9 CM errors | Outside finite error set and p≠2, B=0; at p=2 with other errors zero, B=21 | CM branch retains dyadic loss. |
| §7.10 almost-all vanishing | If x has order p³, then p²x has order p; Sha[p]=0 therefore excludes every nonzero p-primary x | No prior primary finiteness assumed. |
| §7.11 full finiteness | Free rank r quotient by one line has residual free rank r−1; uniform exponent in p^m forces r−1=0 | Rank one and finitely many finite primary groups suffice. |
| §7.12 RM endpoint | O_L-rank 1 gives ℤ-rank d; d=1,2 gives ranks 1,2; finite quotient has rank 0 | General abelian MW and finite Selmer now cited. |
| §7.13 global square index | I=5,d_E=1 gives divisor of 25; (ℤ/5)³ has exponent 5 but size 125 | Length gap explicit; exponent inference rejected. |
| §8.1 initial factor | p=5,a=1: split augmentation 25, inert 35; C₃ polynomial 27−s−s² has content valuation 0 but augmentation valuation 2 | No stale Lean proof claim. |
| §8.2 stabilization | α=2, raw values 2,4 gives (4−2/2)/2=3/2; initial prescribed 7 gives level zero 7 | (Disc) added to arithmetic application. |
| §8.3 norm recurrence | α=2,p=5,a=9/2, raw 2,4: cor(raw₂)=16, cor(raw₁)=20; α⁻²(16−10)=3/2 | Positive recurrence and initial correction distinct. |
| §8.4 finite constraints | ℤ/7: id(q)=5 solved by 5; 0(q)=1 insoluble; q=1 and q=0 jointly insoluble | Simultaneous solvability is substantive. |
| §8.5 universal family | ℤ/2 self-edge tr=id,a=1,bottom=0 admits 0 and 1; their difference 1 satisfies homogeneous equations | Existence is not uniqueness; labels removed. |
| §8.6 Iwasawa class | Two-coordinate model (1,0)≠0 but second projection 0; trace 1−1=0 | Actual arithmetic identification needed; wrapper deleted. |
| §8.7 character stratum | Identity quotient: empty stratum; C₂→1: sign does not factor; S₃→C₂: sign does factor | Exact level and torsion type retained. |
| §8.8 generic sign | F=ℚ: one real place gives −1; add one inert odd-exponent place to get +1 | Real-place parity retained. |
| §8.9 joint distribution | Constant function 1: both integrals 1, difference 0; forbidden component indicator has both integrals 0 | Component fibres retained. |
| §8.10 fibre surjectivity | Two allowed points with masses 1/2 each: indicator averages 1/2; missing one point would give 0 there | Surjectivity confined to allowed fibre. |
| §8.11 toric sum | C₂ nontrivial χ and values (1,0): sum 1−0=1; constant values (1,1): sum 0 | P-new/nonexceptional conditions cannot be discarded. |
| §8.12 definite L-value | Nonzero normalized toric sum 1 has square 1, giving nonzero central value; zero sum gives square 0 | Existence in each stratum, not every character. |
| §8.13 unit comparison | β∈pℤ_p gives β−1≡−1 and β²−1≡−1 mod p; at D=−3,p=5, u_K=3 is a unit but (disc) still fails | (Disc) prevents false unit claim. |
| §8.14 crystalline twists | p=5,m=1,2 give powers 4,20; torsion character ξ⁴=1 gives first twist 1 | Non-torsion arithmetic construction essential. |
| §8.15 profile | Same-stratum indices 2,5 give 2; degree-0 index 3 and degree-1 index 1 give M₀=3,M∞≤1 | No replacement by maximum or bottom index. |
| §8.16 lattice comparison | I₀=5²,C₀=5 and I_•=5,C_•=5² give equal products 125 | Individual factors need not be invariant. |
| §8.17 Tamagawa | Rational factors 5 and 25 give K-product (5·25)²=5⁶; valuations 2·(1+2)=6 | All K-primes counted. |
| §8.18 Selmer fibre | G=0,L=R[0]: fibre R[−1], H¹=R; G→0 leaves G unchanged | Shift and H⁰ error retained. |
| §8.19 local factor | p=5,a=1: split L_p=25, inert L_p=35; valuations 2 and 1 | Scalar augmentation, not group-ring content. |
| §8.20 tower torsion | Reduction groups of sizes a,b bound each prime-to-characteristic torsion part by a,b; sizes 12 and 25 have gcd 1 for common prime-to-both torsion | Two residue characteristics needed. |
| §8.21 point nonvanishing | C₂ character projection of (1,0) has χ-sum 1; of torsion class becomes 0 after tensoring ℚ | Weighted nontorsion, not nonzero torsion. |
| §8.22 derivative nonvanishing | Positive height 1 times nonzero Gross–Zagier coefficient c gives c≠0; torsion height 0 gives 0 | Height input separate from geometric construction. |
| §8.23 higher trace | Formal family may have bottom 0 and higher value 1; existence at a higher conductor does not imply bottom nonzero | Quantifiers retained. |
| §8.24 Λ-nontorsion | In domain Λ, Λ·1 has rank 1, while Λ·0 has rank 0; any nonzero f has no nonzero annihilator | Actual family identification supplied by CGLS with (disc). |
| §8.25 near-one characters | p=3,r=0 gives 4 with v₃(4−1)=1; r=1 gives 64 with v₃(63)=2 | Works at inert p; trivial limit excluded. |
| §8.26 nonzero specializations | f(T)=T: f(0)=0 and f(3^(r+1))≠0, valuation r+1 | Identity specialization excluded. |
| §8.27 logarithm index | p=5,t=3,q=5,I=25,C=25 gives 125·5=25·25=625 | Square-root normalization and torsion factor retained. |
| §8.28 control | Sha=25,C=5,Tam=25,q=5 gives 25·25·25·25=5⁸ | Both squared factors and all local terms retained. |
| §8.29 index square | I₀=5⁴,Sha=5²,Tam=5²,q₀=5 gives 5⁸=5²·5²·5⁴ | Integral equality needs every p-factor. |
| §8.30 determinant element | Identity tensor 5⊗1 gives 5, a nonunit in ℤ; scaling by γ gives γγ⁻¹=1, not γ² | New nontrivial involution Check. |
| §8.31 determinant/ideal iff | Heegner index ideal (f) gives tensor divisor (fι(f)); f=p gives (p²), while f=unit gives (1) | Integral lattice basis criterion tested in both directions. |
| §8.32 specialized lattice | L_p=5,Tam=5,Sha=25 gives multiplier 5²·5²·5²=5⁶ | No rational replacement of integral lattice. |
| §8.33 differentiated descent | Derivative=id and shear restriction sends (0,1) to (−1,1); restriction back gives (0,1) | Inverse-direction Check added. |
| §8.34 local conditions | Finite/transverse 𝔽₅-planes dimensions 2,2 in dimension 4; 0 lies in both | Nonzero class and propagated local condition separate. |
| §8.35 edge relation | Normalized scalar model comparison=id sends 1↦1; negation correction sends 1↦−1 | Corrected relation, not raw relation. |
| §8.36 Howard B | char M=(f) dividing char(S/H)=(f²) permits strict bound; M=0 gives characteristic ideal (1) | No unsupported equality. |
| §8.37 localized bound | D=−3 fails (disc), u=3; D=−7 passes, u=1; p and T both invert in Λ[1/p,1/T] | Discriminant and localization scope repaired. |
| §8.38 specialization | p=5,a=1: split C_p=25, inert C_p=35; valuations 2,1 | Initial scalar may be nonunit. |
| §8.39 uniform error | ind bottom 3 and E=2 gives length M≤5; E=0 gives ≤3, independently of common multiple exponent t | Quantifier independence retained. |
| §8.40 paired length | M₀=5,M∞=2 gives 2(5−2)=6; equality case M₀=M∞ gives 0 | Existing p=3 rigidity gap retained unchanged. |
| §8.41 conditional nonvanishing | M_r=∞ for all r gives no nonzero class; any finite M_r implies a nonzero value | Main conjecture remains a hypothesis. |
| §8.42 refined depth | Rational Tamagawa valuations 1,2 sum to 3; sum over K-primes is 6 | M∞ is 3, not 6. |
| §8.43 determinant index square | I=5³,L_p=5,Tam=5,Sha=25 gives 5⁶=5²·5²·25 | Specialization factors consistent. |
| §8.44 equivalence | M∞=3,v_p(Tam)=3 matches zero difference; value 2 versus 3 fails equality | Both directions require stated p>3 integral hypotheses. |
| §8b.1 BDP conventions | Square-root value 5 gives single-power value 25 up to a unit; replacing root by 2·5 multiplies square by unit 4 at odd p≠2 | Common comparison no longer assumes p≥5 toric μ input. |
| §8b.2 formulation comparison | Local cokernel length c=1,index i=2,X-length x=3: Greenberg length x+2c=5, BDP-square bound 2(i+c)=6; x≤2i and 5≤6 both true | At (3), lengths 1 and 0 disappear on inverting 3; new contract retains them. |
| §8b.3 auxiliary field | For p=5, ℓ≡−1 gives ℓ²≡1 mod 5; that case is assigned inertness, while ℓ≡2 has ℓ²≡4 and the other assignment | Congruence-dependent local choices retained. |
| §8b.4 Euler-system bound | p=3 satisfies oddness but not p>3; ideals (3)⊃(9) show length 1≤2 | Integral p=3 branch now names matching comparison contract. |
| §8b.5 reverse divisibility | v(F)=2,v(G)=3 and v(L₁)=2,v(L₂)=3: product total 5; opposite individual bounds and product bound force both differences 0 | Nonzero cancellation and integral μ prerequisites remain. |
| §8b.6 rational equality | (5) and (1) become equal after inverting 5; integral lengths 1 and 0 differ | Rational theorem not promoted to integral. |
| §8b.7 integral equality | S/H characteristic (5T) gives square (25T²), including p-content 2 | Integral residual-surjective branch retained. |
| §8b.8 rational Greenberg equality | Root f=T, square T² remains T² after inverting p; root p becomes unit | Distinguishes T-divisor from p-content. |
| §8b.9 integral Greenberg equality | Root pT gives square p²T² with valuations 2 at (p) and 2 at (T) | Both factors retained. |
| §8b.10 Eisenstein equality | p=3 passes p∤2N when 3∤N; (3) versus (1) remains distinguishable integrally | CGS odd-prime theorem used directly; local characters retained. |
| §8b.11 split nonvanishing | At p=3 only the listed Eisenstein branch applies here; p=5 satisfies each p>3 numerical restriction | No extra p=3 irreducible branch inferred. |
| §8b.12 refined split depth | Rational component depths 1,2 give M∞=3 and K-sum 6 | Correct integral theorem discharges conditional input. |
| §8b.13 determinant application | At split p>3 the integral Heegner ideal (f) gives determinant divisor fι(f); at inert p no split theorem is available | Inert assertion remains conditional. |

## Definition laws and conventions

Each row tests a separate API law or normalization in addition to its defining statement above. Identity and zero examples are supplemented by nonidentity maps, nonmaximal orders and nontrivial involution examples where direction matters.

| Statement | Instances; computed values | Result/change |
| --- | --- | --- |
| §0.1 membership | a+b√2 maps to [[a,10b],[b/5,a]]; integrality is a∈ℤ₅,b∈5ℤ₅ | Exact preimage, not maximal-order guess. |
| §0.1 conductor uniqueness | ℤ₅+5ℤ₅√2 has index 5; conductor 25 would have index 25 | Larger conductor excluded. |
| §0.1 conjugation | a+5b√2↦a−5b√2, still in the order; applying twice recovers a+5b√2 | Stability and involution tested. |
| §0.2 localization | ℤ+3ℤi at 3 has index 3; at 5, 3 is a unit and the localization is maximal | Correct finite-place family. |
| §0.2 finite index | Basis determinant diag(1,3) is 3 | Finite index, not discriminant 9. |
| §0.2 extensionality | Conductors 3 and 9 give distinct 3-local indices 3 and 9 | Omitting a place breaks equality. |
| §0.3 multiplication | Principal ideles 2,3 give ideals (2)(3)=(6) | Multiplication preserved. |
| §0.3 principal quotient | (6) has class 1, as do (2),(3) | Quotient kills precisely these principal factors. |
| §0.3 class equivalence | Norm-2 ideal in ℚ(√−5) is not generated by any solution to x²+5y²=2 | Quotient not collapsed to one element. |
| §0.4 surjectivity | ℚ(i), c=1, ℓ=3 gives a map from class group size 2 to size 1, kernel size 2 | Surjection includes exceptional units. |
| §0.4 unit quotient | (𝔽₉)×/(𝔽₃)× has size 8/2=4; global unit image has size 2 | Kernel size 4/2=2. |
| §0.4 repeated degree | h(ℤ+9ℤi)/h(ℤ+3ℤi)=6/2=3 | Repeated degree 3, not first local count 4. |
| §0.5 restriction surjectivity | Gal(K[cℓ]/K)→Gal(K[c]/K) at equal conductors is identity | Kernel 1 and degree 1 agree. |
| §0.5 Artin compatibility | In cyclic quotient C₆→C₃, generator 1 maps to 1, its square 2 maps to 2 | Quotient, not opposite inclusion. |
| §0.5 kernel | Same C₆→C₃ has kernel {0,3}, size 2; 6/3=2 | Degree/kernel equality. |
| §0.7 restriction composition | C₉→C₃→1 sends 1 first to 1 then 0, as does direct map | Tower compatibility. |
| §0.7 torsion-free rank | ℤ₃²/3ℤ₃² has 9 elements; ℤ₃/3ℤ₃ has 3 | Rank-two case cannot be replaced by rank one. |
| §0.7 eventual degree | For ℚ(i), p=3: h(O₃)=2, h(O₉)=6, h(O₂₇)=18 | Ratios 3,3 after initial degree 2. |
| §0.9 double dual | Split lattice basis (1,1),(π,0) has Gram determinant π²; dual index exponent negates twice | Double dual recovers original index exponent 1. |
| §0.9 inverse ideal product | (π,−π)·(π⁻¹,−π⁻¹)=(1,1) | Product is unit ideal. |
| §0.9 discriminant comparison after F03 | ℤ₅+5ℤ₅√2 has disc 8·25, v₅=2; ℤ₂+2ℤ₂i has disc −16, v₂=4 | Nonoptimal witnesses recomputed at the different/discriminant consumer. |
| §1.4 degree zero | d=2,deg ξ=1 gives 2−2=0 | Basepoint degree retained. |
| §1.4 base change | Degree 0 stays 0 over a quadratic field; coefficients (2,−1) stay (2,−1) | No normalization by extension degree. |
| §1.4 rescaling | Clearing integers 2 and 6 give D and 3D in Pic⁰ | Multiplies, never divides by 3. |
| §1.5 evaluation | d=2 gives quotient of [2x−D], not [x−D] of degree −1 | Corrected divisor domain of φ:J→A. |
| §1.5 postcomposition | Integer model φ=2,f=3,x=1 gives f(φ(x))=6 | Fixed integral composite. |
| §1.5 Galois equivariance | Negation action with φ=2: φ(−1)=−2=−φ(1) | Action compatibility. |
| §3.1 coefficient reduction | δ₂(7)=7 mod 25 maps to 2 mod 5=δ₁(7) | Correct coefficient direction. |
| §3.1 restriction | Identity extension sends δ(1) to δ(1), value 1 mod 5 | Naturality. |
| §3.1 corestriction | Two equal conjugates of 1 have trace 2; Kummer image 2 mod 5 | Trace, not averaging. |
| §4.1 empty support | Σ∅=(0), quotient ℤ₅/(0)=ℤ₅ | Empty ideal is not unit ideal. |
| §4.1 insertion | (25)+(10,20)=(25)+(5)=(5) | Sum law. |
| §4.1 normal form | p=2,s={0},a=0 gives (0,1)=(1)=(2⁰); min(∞,0)=0 | No implicit good-prime restriction on algebraic law. |
| §4.1 support monotonicity | (25)⊂(5); ℤ₅/(25)→ℤ₅/(5) sends 7 to 2 | Quotient direction correct. |
| §4.2 Galois invariance | C₃ derivative difference 3−(1+s+s²) vanishes after the matching norm/coefficient relation | Integral difference need not vanish before reduction. |
| §4.2 coset independence | Mod 5, representatives giving values 1 and 6 have equal reduction 1 | Only reduced independence claimed. |
| §4.2 bottom trace | D₁=1, orbit values 1,−1 sum to 0 | Raw value 1 is different. |
| §4.4 restriction of inverse | χ(−1,1)=(0,1) | Restriction recovers prescribed class. |
| §4.4 unique preimage | x+y=0,y=1 forces x=−1 | Unique for shear, false for zero map. |
| §4.4 coefficient naturality | (−1,1) mod 5=(4,1); shear sends it to (0,1) mod 5 | Reduction commutes with inverse. |
| §5.2 localization correction | In the negation model, corrected value −3 localizes to −3, forward correction recovers 3 | Required square commutes. |
| §5.2 commuting corrections | χ=−id,ψ=2·id over ℚ: χψ(3)=ψχ(3)=−6 | Commutation has real content. |
| §5.2 tensor generator | u=2 and u⁻¹=3 mod 5 yield tensor factor 2·3=1 | Intrinsic coefficient fixed. |
| §5.3 inverse correction | κ=(0,1) gives κ′=(−1,1) | Forward application excluded. |
| §5.3 uncorrecting | χκ′=(0,1)=κ | Defining inverse relation. |
| §5.3 product correction | Commuting scalars −1,2 over ℚ: (−2)⁻¹·6=−3=(−1)⁻¹·(2⁻¹·6) | Composition order checked. |
| §6.12 support definition | Support {6} has count 2, whereas prime-factor list of 12 has length 3 but distinct count 2 | Distinct-prime convention. |
| §6.12 bottom support | Support {1,6} gives min(0,2)=0 | Bottom nonzero law. |
| §6.12 support invariance | Values 1,2 on same nonzero support {6} both give 2 | Unit rescaling leaves support unchanged. |
| §6.13 membership iff | Zero family: ℓ=2 with p=5 passes primality/nondivisibility and all local zeros; ℓ=5 fails nondivisibility | Both directions computed. |
| §6.13 extensionality | Identical local values 0 at 2 and 1 at 3 give same memberships true,false | Locus depends on localization data. |
| §6.13 zero family | For D=N=1,p=5 all primes except 5 pass | Coefficient prime excluded. |
| §8.1 inert formula | (5+1)²−1²=35 | Inert branch. |
| §8.1 split formula | At σ=σ*=1, (5−1+1)²=25 | Split branch. |
| §8.1 augmentation | C₃ coefficients (27,−1,−1) sum to 25 | Augmentation is not content, whose gcd is 1. |
| §8.1 Artin exchange | Swapping s,s² leaves 27−s−s² unchanged | Compatible inversion. |
| §8.2 successor | α=2,raw=(2,4) gives 3/2 | Inverse root and predecessor signs fixed. |
| §8.2 linear maps | f=3: stabilized raw (6,12) gives 9/2=3·(3/2) | Functoriality. |
| §8.2 unit change | Unit −1 scales (2,4) to (−2,−4), giving −3/2 | Unit rescaling. |
| §8.2 initial term | Prescribed initial 7 yields 7 at level 0 even if raw₀=2 | Separate initial correction. |
| §8.5 bottom projection | ℤ/7,id,Φ=5,P=1 gives Q₀=5 | Raw point 1 not substituted. |
| §8.5 auxiliary trace | Scalar a=0 requires tr(Q)=0; Q=0 solves the zero-bottom instance | Fixed auxiliary equation. |
| §8.5 level projection | With pr₁=id,cor=2,pr₀=2 on ℤ/7, Q=3 gives cor(pr₁Q)=6=pr₀Q | Actual compatible projections needed. |
| §8.5 choice difference | On ℤ/2, choices 0 and 1 differ by 1; zero bottom and id trace with a=1 give 0 and 1=1 | No uniqueness claimed. |
| §8.6 level comparison | Norm values (1,−1) have bottom sum 0 and bottom Kummer 0 | Class-field trace retained. |
| §8.6 scalar transport | Multiplying integral class 1 by 5 changes quotient index from 1 to 5 | Nonunit isogeny factor visible. |
| §8.6 finite initial norm | Tr of two fixed copies of 1 is 2, not 1 | Degree retained. |
| §8.6 zero family | Each point 0 gives each Kummer value 0 and limit 0 | Zero compatibility. |
| §8.7 torsion type | C₂ sign restricts to −1 on nontrivial torsion; prescribed +1 excludes it | Wrong type excluded. |
| §8.7 old-level exclusion | Sign on S₃ equals sign quotient S₃→C₂ followed by id | This character is not new at that quotient. |
| §8.7 tower isomorphism | In C₃, inversion sends generator 1 to 2 and nontrivial characters to nontrivial characters | Exact level preserved. |
| §8.14 recursion | Exponents 4,20 satisfy 20=5·4 | α₂=α₁⁵. |
| §8.14 congruence | u=6,p=5: 6⁴−1=1295=5·259, valuation 1; 6²⁰−1 has valuation 2 | Required depths. |
| §8.14 nontriviality | Non-torsion 6 has powers 6⁴,6²⁰≠1; order-four ξ gives ξ⁴=1 | Necessary non-torsion condition. |
| §8.15 stratum infimum | Indices 2,5 at fixed degree give 2 | Minimum, not max. |
| §8.15 bottom | Only degree-zero conductor 1 with index 3 gives M₀=3 | No other stratum affects M₀. |
| §8.15 infinite iff | Empty stratum and all-zero stratum both have infimum ∞; a value 2 forces infimum ≤2 | Both directions. |
| §8.15 scaling/truncation | Value p² in ℤ_p/p⁴ has index 2; multiply by p to get index 3; multiply by p² gives zero | Depth truncation retained. |
| §8.18 H⁰ error | G=0,L=R[0]: coker(0→R)=R contributes all of H¹ | Error cannot be dropped. |
| §8.18 compact H⁰ | Scalar λ=2 on torsion-free ℤ₅: (λ−1)x=x=0 forces x=0; on discrete ℤ₅[1/5]/ℤ₅ scalar λ=6 fixes 5-torsion | Compact/discrete distinction. |
| §8.18 H¹ kernel | If H⁰(L)=0, the error coker is 0, so H¹→kernel is bijective | Vanishing used before identification. |
| §8.18 base change | Derived tensor of ℤ→⁵ℤ with ℤ/5 has differential 0 and H⁰=H¹=ℤ/5 | Ordinary tensoring of cohomology would lose a term. |
| §8.25 evaluation | α₀(γ²)=4²=16=α₀(γ)² at p=3 | Multiplicativity. |
| §8.25 depth | v₃(4−1)=1,v₃(64−1)=2 | r+1 law. |
| §8.25 limit | 4 and 64 are 1 mod 3; 64 is 1 mod 9; depths r+1 grow without bound | Limit 1 is outside nontrivial family. |
| §8.30 image | Identity rational tensor comparison maps 5⊗1 to coefficient 5 | Required tensor fixed. |
| §8.30 uniqueness | Identity comparison has only coefficient 5 above tensor 5⊗1; multiplication-by-2 comparison over ℚ gives preimage 5/2 | Comparison must be the canonical arithmetic one. |
| §8.30 rescaling | Identity involution a=5 gives factor 25; nontrivial involution a=γ gives factor 1 | Both conventions discriminated. |
| §8.30 base change | γ specializing to 4 sends ι(γ) to 1/4 and γι(γ) to 1 | Opposite twists in the two factors retained. |
| §8.33 restriction | Shear of (−1,1) gives (0,1) | Inverse derivative descent. |
| §8.33 generator change | At p=5, factors 2 and 3 again multiply to 1 | Tensor convention shared with §4.7. |
| §8.33 coefficient reduction | (−1,1) reduces to (4,1) mod 5; shear sends it to (0,1) | Reduction/descent square commutes. |
| §8.33 bottom | Empty derivative=id; identity restriction sends q=3 to 3 | Actual bottom rather than arbitrary normalization. |
| Signed discriminants | ℚ(i): D=−4; conductor 3 gives D_c=−36; absolute norm ideals have positive valuations | Sign not erased. |
| Free versus full index | E(K)=ℤ⊕ℤ/2,y=(1,0): free index 1, full index 2 | Torsion factor retained. |
| Arithmetic Artin | C₃ generator s acts on ideal labels by b⁻¹, so first iterate label b² and second b | Inverse conventions agree with supplied classical construction. |
| Λ inverse tautological action | γ↦γ⁻¹; specializing γ=4 gives 1/4, while the opposite twist gives 4 | Coefficient action not silently inverted twice. |
| Ordinary roots | α=2,β=5/2 gives αβ=5 and α+β=9/2 | Formal recurrence witness, not claim α=2 is unit root of an integral elliptic trace. |
| (disc) and units | D=−3,p=5: odd, p∤D, u_K=3 a unit, but fails (disc); D=−7,p=5: odd, u_K=1, passes | CGLS applications repaired, general CM constructions preserved. |
| Dyadic valuations | v_𝔭(2)=2 makes v_𝔭(2²¹)=42 | No ℤ₂-only valuation in general DVR. |
| Zero/empty boundaries | Empty conductor ideal 0, empty support infimum ∞, zero family Kummer 0, empty ordinary exponent m=0 excluded | No junk total-function value enters arithmetic targets. |

## New supplier-contract witnesses

| Contract | Computation verifying the boundary of the requested input | Status |
| --- | --- | --- |
| gap:elliptic-adelic-open-image | SL₂ has scalar commutant but determinant image {1}; non-CM adelic openness is a strictly stronger input | Supplier theorem still required. |
| gap:abelian-scalar-image | If scalar subgroup has index ≤c and all its units reduce to 1 mod p, its index is ≥p−1; p−1>c excludes that possibility. Nonidentity u gives finite v_𝔭(u−1). | Gives C₂=0 almost everywhere and a finite C₂ everywhere, including 2. |
| gap:classical-uniform-square-index | Groups (ℤ/5)^r have order 5^r for fixed exponent 5; at r=3 this exceeds 5² | Integral length control cannot be replaced by exponent control. |
| gap:surjective-three-integral-comparison | x+2c≤2(i+c) iff x≤2i; x=3,c=1,i=2 gives 5≤6 iff 3≤4, and must also hold at height-one (3) | Exact integral local comparison remains a supplier obligation. |

## Evidence and ownership

The format comparisons were main’s EllipticCurves and LocalGaloisGroups and Completed/ArithmeticDirichletSeries. Ownership searches used the roadmap grep/show tools, main, the board’s available package text, and the eighteen exact sibling folders supplied in the brief. EffectiveClassNumbers was checked at its supplied head; ImaginaryQuadraticClassNumber H1.4 was checked on main. The board’s arithmetic-level-raising target describes unitary bipartite systems, not a competing construction of the classical conductor family. SelmerIwasawaCohomologyPartII’s supplied head does not supply the missing general image or uniform classical length theorems. No new construction was assigned a supplier’s fully qualified Lean name.

| Input or assertion | Evidence and consequence |
| --- | --- |
| Local order | khayutin line 849, Definition 2.1; line 857, Proposition 2.2; line 875, Lemma 2.3. Maximality is almost everywhere, not at every identity translate. |
| Trace dual | khayutin line 1659, Lemma 5.8. Split generator norm −π² versus discriminant ideal (π²) remains explicit. |
| Scalar image | nekovar line 1632, Proposition 6.1.1; line 1638, Proposition 6.1.2; line 1739, Proposition 6.2.2. These are different inputs from abstract image predicates. |
| Faltings supply | TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheorems/README.md, R28.4.5–R28.4.6 and R28.6.7. Rational matrix generation plus clearing denominators gives finite C₃ for each coefficient prime; almost-all integral commutant generation gives C₃=0 almost everywhere when End_K(A)=O_L. |
| Image supplier gap | TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md, §6.4 “Coefficients and images”, defines openness and proves predicate comparisons, not Serre/Bogomolov arithmetic image theorems. |
| General Mordell–Weil | TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md, §1.7. A nonzero vector in a finite torsion-free O_L-module has a finite minimum coordinate valuation locally and is divisible at only finitely many coefficient primes. No rank-one conclusion is used. |
| Abelian finite Selmer | TauCetiRoadmap/SelmerIwasawaCohomology/README.md, §2.12a, abelianSelmerGroup_finite and abelian descent. The multiplication-by-n sequence gives finite Sha[n]; ideal-primary torsion is contained in such n-torsion, so the RM primary argument applies. |
| Uniform exponent versus length | TauCetiRoadmap/EulerSystemsAndKolyvaginSystems/README.md, §4.13, explicitly assumes image and MW inputs and excludes the K-independent square-index theorem. kolyvagin-structure line 67, Theorem A, and line 70, independence from K, support the retained arithmetic endpoint. |
| Conductor owner | TauCetiRoadmap/ImaginaryQuadraticClassNumber/README.md, H1.4. The sequence and exceptional-unit factors precede this roadmap. Successive conductor application remains here. |
| Classical trace owner | TauCetiRoadmap/EffectiveClassNumbers/README.md, §2.8 “Exact vanishing from a Heegner height gap”, Classical Heegner construction. It includes arithmetic-Artin action, K-rationality and conjugation with cusp torsion. |
| Ordinary discriminant | cgls line 81 and line 1417. The CGLS construction in Theorem 4.1.1 starts at line 1428, and the unit comparison at line 1495 uses u_K. |
| Odd-prime versus p>3 comparison | bcs line 413, Theorem 4.2.1, includes odd p; bck line 693, Theorem 5.2, is read with the standing p>3 setting. cgls line 1503, Proposition 4.2.1, and line 1516 retain the rationalization. |
| Integral Eisenstein branch | cgs line 156, Theorem C; lines 163–169, Greenberg reformulation. Theorem 6.5.2 at line 1438 is the bound in the read edition; BCS cites its earlier numbering 5.5.2. The manifest records the read edition’s p.29 locator. |
| Determinant involution | cs line 707, Conjecture 3.2.2; line 712, Proposition 3.2.3; line 742, Proposition 3.3.2. The second factor is twisted, and the specialized finite group is the propagated quotient. |
| Existing rigidity boundary | bcgs line 716, Theorem 1.2.13; the p=3 rigidity contract remains distinct from the newly declared formulation-comparison contract. Its previous verdict is not reopened. |

All nineteen sources remain separate certified entries with the original provenance and hashes. Every corresponding legal cache file exists. No additional work was fetched, no key was renamed, and no missing text was requested. Only the CGLS discriminant locator and the CGS bound/comparison locators and cited-for list changed in sources.toml. No source passage was copied into the package.

The remaining cached works were consulted for their existing target contexts: howard line 56 (Theorem A), line 943 (Theorem 1.7.5), line 1288 (Lemma 2.3.3); gross line 59 (Proposition 2.1); cornut-vatsal line 190 (Theorem 1.4), line 196 (Theorem 1.5), line 719 (Lemma 2.7), line 2073 (Theorem 5.10); pollack-weston line 991 (Theorem 6.2), line 1128 (Theorem 6.8); skinner line 54 (Theorem B); zanarella line 620 (Proposition 2.3.3), line 639 (Theorem 2.3.6); cornut line 49 (higher-trace theorem); cv-dynamics line 403 (Theorem 2.9), line 436 (Corollary 2.10); zhang line 156 (Theorem 1.1), line 1291 (Theorem 6.4), line 1374 (Theorem 7.1); wuthrich line 183 (Theorem 4).

The cross-roadmap citation check found the numbered sections of the readable suppliers. In particular: GlobalNumberFields Layer 11; ClassFieldTheory Layers 12–13; SelmerIwasawaCohomology §§0.6, 0.8, 2.3, 2.5–2.8, 2.12a–2.22, 3.1–3.3, 3.5–3.6, 3.9–3.10, 4.9, 4.12; ArithmeticGaloisDuality R02.2.2–R02.2.3, R02.4, D7; ModularCurvesPartII §§9.9, 13.1–13.4, 17.1–17.3; FaltingsFinitenessAndIsogenyTheorems R28.4.5–R28.4.6, R28.6.7; ArithmeticGaloisRepresentations §§3.5, 6.1–6.4a; HeightsRationalPointsAndObstructions §1.7; PadicMeasuresIwasawaAlgebras §§1.6–1.7, 3.1, 3a.1 and Layers 4–5. The GL₂ transfer global-jl and multiplicity-one anchors exist in R17.3. The other supplied numbered layer headings were checked with roadmaps show; broad headings alone do not certify an unstated strengthening.

There is a material verification limit: GrossZagierAndArithmeticHeights, ModularIwasawaMainConjectures, KatoEulerSystems, PadicHodgeRegulators and AutomorphicCongruences have no readable roadmap in main, the supplied sibling folders or this board, and roadmaps show reports them absent from its index. Their eligibility is explicit in the brief, so their existing ownership and contracts were retained. Their precise section contents could not be independently revalidated. The resolver reports four missing-roadmap leads involving these suppliers and no missing own Lean names; the fifth supplier is likewise unavailable to direct inspection. This is not evidence that those theories do not exist. Ownership against open roadmap files not supplied or returned by the authorized index was not checked.

## Pinned APIs and elaborated signatures

The pins were read from the content repository’s lake-manifest.json: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.

All 32 original elaborated types were compared with the old README and their explicit source binders. None lost a section hypothesis. Their failure was acceptance-test scope, not binder erasure. All 32 were deleted, including the two genuine but elementary/generic algebraic results; their mathematics remains in README. The resulting file has zero declarations, definitions, instances or examples. Thus the required post-edit list of #check @ownName probes is empty, and there is no retained binder to compare or repair. One scratch signature file elaborated with #check @name for all 24 native declarations in the Mathlib supplier table and ContinuousCohomology.tateShafarevich: all 25 resolved, exit 0.

The native Sha definition was read at Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean:71: it is the intersection of localization kernels for a supplied topological Galois module. It does not construct the actual Heegner system or identify an arithmetic point family. TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Basic.lean supplies elliptic Tate modules; TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.lean:121 supplies elliptic Mordell–Weil. Searches by the arithmetic objects found no pinned Heegner point family, CM derivative system, ordinary arithmetic Iwasawa Selmer module or its canonical determinant comparison. Accordingly the docstring names the specific missing arithmetic constructions, rather than falsely claiming that continuous cohomology, completed group algebras or all Selmer carriers are absent.

## Check outcomes

- Suggested.lean elaboration: `lake env lean` on packages/HeegnerPointEulerSystems/Suggested.lean, from the content repository: exit 0, no output, no warnings. The only import is Mathlib. There is no TauCeti import and therefore no missing-object module build.
- Signature probe: exit 0, 25 native #check results, no errors. Retained own declarations: 0; no hypothesis was silently erased.
- Dependency check: exit 0, with output below. No UPWARD, CYCLE or moved line.

```text
depcheck: 19 roadmaps, 149 edges, 0 problem(s)
```

- Citation resolution: exit 0, no unresolved own Lean names; unavailable-supplier leads are described above rather than asserted to be verified.
- Structural/diff checks: git diff --check passes; all 132 numbered target headings remain; 40 explicit Check blocks remain; every new gap has identical needs text in Exact supplier contracts and the plan. The original eight gap objects are unchanged. Removing the top-level gaps value from each JSON version leaves identical data; nothing else in design/plan.json changed.
- Formatting gate repair (`tex=3`): the trace formulas in Conventions and §1.5 now have code-span delimiters; the coefficient-ideal sum in §4.1 is equivalent prose. The gate's formatting scanners return `latex=0` and `tex=0`, exit 0. No mathematical statement or Lean signature changed. Acceptance elaboration and the dependency check were rerun after this repair with the exact successful outcomes recorded above.

## Maintainer consequences

Four additional supplier obligations remain: elliptic-adelic-open-image and abelian-scalar-image for ArithmeticGaloisRepresentations, classical-uniform-square-index for EulerSystemsAndKolyvaginSystems, and surjective-three-integral-comparison for SelmerIwasawaCohomology. This package cannot implement or certify those suppliers. The existing eight gaps, including the prior human-facing dynamics and p=3 rigidity obligations, remain unchanged.

Consumers should cite README sections for the arithmetic targets. All former Suggested.lean names are gone: conductorPoint, coefficientIdeal and its three theorems, descendedClass and its obstruction theorem, correctedClass and its zero theorem, vanishingOrder and its conductor-six theorem, baseLocus and its coefficient-prime theorem, non_torsion_point_prime_divisibility, initialFactor and its two theorems, stabilizedPoint and its first-level theorem, heegnerIwasawaClass and its specialization counterexample, cmCharacterStratum and its example theorem, nearTrivialCharacter and its torsion counterexample, heegnerDivisibilityProfile and its minimum theorem, determinantalHeegnerElement and its rational-basis counterexample, and lambdaDerivativeClass and its restriction theorem. These were generic or elementary acceptance declarations, not finished arithmetic implementations.

No merge-order file, tooling, other package, pull-request text or metadata was changed. No commit or network write was made. Fresh independent review remains required.
