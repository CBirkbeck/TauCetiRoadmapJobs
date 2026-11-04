<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1361#issuecomment-6481417826 -->
Red team round 2 pass a (codex) of 8725818

Verdict: needs_changes

1. **F01** (P1) The new Heegner–Gross differential has the wrong normalization

   **Location:** packages/EllipticModularityEffectiveComparisons/README.md:1306: “e_D=|O_(−D)^×|^(−1)Σ_s h_s(−D)[s]” and “the differential attached to e_D is the logarithmic derivative”.

   **Claim:** Counting optimal embeddings modulo conjugation by R_s^× and dividing by the quadratic order's unit count gives exactly the Hilbert-class-polynomial logarithmic derivative under line 1305's cotangent identification.

   **Witness:** At p=17,D=3, E_s:y²=x³+1 has Aut(E_s)=μ₆. There are two optimal embeddings of ℤ[ζ₃], fixed by conjugation by μ₆. Thus e₃=[s]/3, whereas H₋₃=X has logarithmic derivative dj/j.

   The two embeddings send ζ₃ to the two order-three automorphisms. There are no others, because an embedded unit is an automorphism of E_s. They are optimal since ℤ[ζ₃] is maximal. Under line 1305 the differential is dj/(3j), not dj/j; in characteristic 17 its coefficient is 6, not 1. This is a new error in the repair of pass-a F01, inherited from bilu-parent-rebolledo lines 819–832. The Check at line 1311 says only “a nonzero multiple”, which does not verify the asserted equality.

   **Exact repair text:** “For each negative discriminant −D, let m_s(D) be the multiplicity of j(s) in the reduction of H_(−D), and set v_D=Σ_s m_s(D)[s]. Prove the Heegner–Gross comparison I♯_e v_D=0 with its exact optimal-embedding multiplicities, distinguishing inert and ramified primes and primes dividing the order conductor. Under the cotangent identification above, v_D has differential H′_(−D)(j)/H_(−D)(j) dj. Use v_D in §5.5. At p=17,D=3, v₃=[j=0] and its differential is dj/j; the separately defined embedding-weighted vector e₃ is [j=0]/3 and has differential dj/(3j).” Retain a precise source for the corrected embedding comparison; do not reuse equation (5.2) as a proof of the original normalization.

   **Repair test:** H₋₃ mod 17=X, so m₀(3)=1, v₃=[0], and both sides now equal dj/j. The embedding-weighted vector remains explicitly distinct, with coefficient 6 modulo 17.

2. **F02** (P1) Supersingular cotangents omit Frobenius descent

   **Location:** packages/EllipticModularityEffectiveComparisons/README.md:1305: “the cotangent space ... at p and 𝔽_p^S” and “the pullback ... is Σλ_s/(j(P)−j(s)) dj”.

   **Claim:** Every vector with arbitrary 𝔽_p coefficients indexed by geometric supersingular curves gives an 𝔽_p-rational cotangent with the displayed partial-fraction formula.

   **Witness:** At p=37 write t²=2. Supersingular j-values are 8,3±10t. For v=[3+10t] and ordinary j₀=1, the displayed pullback coefficient is 17+26t, outside 𝔽₃₇; a rational differential at that rational point has coefficient in 𝔽₃₇.

   The supersingular polynomial is (X−8)(X²−6X−6); the quadratic discriminant 60≡23 is nonsquare modulo 37. The calculation can be verified directly by the Hasse invariant: for j≠0,1728 use a=3j/(1728−j), b=2j/(1728−j), and the coefficient of X³⁶ in (X³+aX+b)¹⁸. It vanishes at exactly these three j-values in 𝔽₃₇². Also (−2−10t)(17+26t)=1. The error is already present in bilu-parent-rebolledo lines 775–781; arbitrary geometric basis vectors are not rational over 𝔽_p.

   **Exact repair text:** “After base change to 𝔽_(p²), identify the cotangent space of J₀(p)♯ with 𝔽_(p²)^S, with its Hecke action and semilinear Frobenius. The 𝔽_p cotangents are precisely the tuples satisfying λ_(Frob s)=λ_s^p. Over 𝔽_(p²), the pullback is Σ_s λ_s/(j−j(s)) dj. Apply the winding-annihilator criterion in this space; for a rational cotangent impose this descent condition. Prove that the class-polynomial multiplicity vectors used in §5.5 satisfy it.”

   **Repair test:** At p=37 the vector supported only at 3+10t fails descent. The sum [3+10t]+[3−10t] descends and has coefficient 34∈𝔽₃₇ at j₀=1, since (17+26t)+(17−26t)=34.

## Round-one finding verification

The ids below are those of the two prior reviews and the repair report. Locations are in packages/EllipticModularityEffectiveComparisons unless a supplier is named. Quoted repaired passages are short; computations are independent checks of their claimed effect.

| Prior finding | Status | Repaired passage and current locator | Verification witness |
|---|---|---|---|
| a F01: missing generalized Jacobian and Heegner–Gross inputs | Partly repaired | README.md:1298: “Define J₀(p)♯ as the generalized Jacobian”; :1304: “φ_P(s₂) is a torsion section” | All requested intermediates are now targets, with bilu-parent-rebolledo lines 731–833. Dimension at p=17 is 2 rather than 1. New cotangent/embedding comparisons are false: S01–S02. |
| a F02: split normalizer at 2 | Repaired | README.md:1154: “at p=2 ... the line-pair condition is strictly stronger”; Suggested.lean:216: “at `p = 2` it is strictly stronger” | Normalizer of {I} has order 6; pair stabilizer has order 2. At 3 both intended groups have order 8. |
| a F03: Siegel-function owner | Repaired | README.md:1272: “imports the Siegel functions of ImaginaryQuadraticClassNumber H3.2” | TauCetiRoadmap/ImaginaryQuadraticClassNumber/README.md:91–101 on main supplies general rational-index functions and products. At denominator 5 this covers all required indices, not only denominator 2. |
| a F04: six absent headline signatures | Repaired | Suggested.lean:90,101,115,132,243,253; README.md:554: “Prove `newform_integral_of_small_primes`” | Six actual theorem declarations now exist. Cutoffs: I(11)/6=2; I(32)/6=8. Four-count realization concludes degree 1 or 2; integral-j theorem permits CM j=1728. See full binder ledger below. |
| a F05: unspecified specialization cusp | Repaired | README.md:1494: “an isomorphism α ... composed if necessary with w_r”; :1512: “By §5.16a replace P by α(P)” | r=5,p=11 gives two fibres of five cusps; w₅ exchanges fibres. At q=23 all ten cusps are rational in the special fibre. The transported Abel map reduces to 0. darmon-merel lines 716–725 makes this transport. |
| a F06: norm-bound lemma labels | Repaired | README.md:395: “proof of Lemma 2.2”; :419: “Lemma 2.1(ii) ... for the congruence” | bennett-siksek-2020 lines 193 and 198–203 separate the congruence from the norm proof. Norm(3−√2)=7≤(1+√2)⁴. |
| a F07: no exceptional-prime bound | Repaired | README.md:1645: “every prime p>37 ... satisfies p≤B(E)”; :1663: “For each ... 37<p≤B(E) ... exhibit a good prime” | The new target has an explicit finite character set, nonzero trace witnesses, and max(q,abs(trace)); the q=p branch is retained. E₁₁ has sole odd character of discriminant −11, a₂=−2, B=2. The CM twist counterexample has every inert trace 0. |
| b F01: undeclared identifiers | Repaired | README.md:653: “Prove `integral_ideal_sturm`”; Suggested.lean:101 | The same six identifiers from a F04 are now declared and backticked. No missing identifier from this finding remains. |
| b F02: Kraus theorem/proof pages | Repaired | README.md:775: “Théorème 4, p.1144 ... its proof §3.3, pp.1145–1146” | kraus-1997 line 284 is the theorem; line 374 starts §3.3. These are different printed pages as now stated. |
| b F03: squarefree cusp-torsion duplication | Repaired | README.md:1401: “the Γ₀(N) case is EisensteinIdealAndRationalTorsion §7.9’s cusp-difference torsion theorem” | TauCetiRoadmap/EisensteinIdealAndRationalTorsion/README.md:984 states geometric cusp-difference torsion at squarefree N. N=11 gives order 5; the general nonsquarefree/congruence target is distinguished. |
| b F04: stale internal section title | Repaired | README.md:366: “Layer 0.10 Small composite levels” | Matches heading :284. The target's equality witness remains N=35: 12·3=36. |
| b F05: class-field supplier overstatement | Repaired | README.md:102: “together with the trivial narrow class group of ℚ”; :859: “the narrow Hilbert class field of ℚ is ℚ itself” | ClassFieldTheory Layer 13 provides the general narrow class-field/ray-class comparison; Cl⁺(ℚ)=1 gives degree 1 and hence trivial finite unramified characters. |

No settled “not actionable in this package” item is re-raised. The previously settled overlap with EllipticCurveModularityPartII remains an external ownership-coordination issue, not a new finding here.


## Computed README statement ledger

Each numbered target is included (103 rows). The file uses numbered headings rather than bold theorem names; the bold Summary endpoints are covered by §§0.16, 1.6, 3.6, 3.17, 4.21–4.22 and 5.28. “Pass” records the specified adversarial instances, not a proof of a universal theorem. Source-dependent and unexecuted exhaustions remain explicit. Source text was read as data.

All locations below are in packages/EllipticModularityEffectiveComparisons/README.md.

| Statement and line | Instances | Computed values, left and right or positive and negative controls | Result / change |
|---|---|---|---|
| §0.1, :136, Martin’s prime-power correction table | p,e=(0,0),(4,1),(2,2),(3,2),(2,3) | Five ones; five zeros; (1/4,0,−1,1,0); (5/9,1,1,−1,0); (3/8,0,1,0,0). Exponent-zero guard prevents 1/0. | Pass |
| §0.2, :162, The weight-two arithmetic dimension expression | N=0,1,11,30,35 | Values 0,0,1,1,3; omitting the zero branch gives −1/12 at 0; full dimension at 30 is 3 rather than 1. | Pass |
| §0.3, :188, Prime-power inversion of the divisor multiplicity | p^e, e=0,1,2,3 | μ*μ=(1,−2,1,0); convolution with (1,2,3,4) gives (1,0,0,0). | Pass |
| §0.4, :200, The five inverted dimension terms | N=1,2,4,8 | Index convolution at 8 is 12−2·6+3=3=8·3/8; cusp convolution 4−2·3+2=0; order-two convolution 0−0+1=1. | Pass |
| §0.5, :212, Identification with the actual trivial-character newspace | N=1,11,30,35 | New dimensions 0,1,1,3 equal rational expressions; old/new at 30: 3=1+2·1 (level 15). | Pass |
| §0.6, :236, Bounds for the five correction products | N=1,4,35 | NS=1,1,24 versus φ=1,2,24; V∞=1,0,0 versus √N=1,2,√35; at 35 A=0,B=0,M=1. | Pass |
| §0.7, :248, The totient–prime-factor upper bound | N=1,35 | 12g=0,36 versus φ+7·2^ω+12=20,64. | Pass |
| §0.8, :260, The sharp estimate at prime levels | p=2,3,11,13,23 | 12g=0,0,12,0,24 versus p+1=3,4,12,14,24; equality residues are 11. | Pass |
| §0.9, :272, Large composite levels with at most two prime factors | N=1600=2^6·5² | 12g=420<1601; √1600=40>39 and coarse estimate φ+40=680<1601. | Pass |
| §0.10, :284, Small composite levels | Composite N≤1521, ω≤2 | Enumeration has sole equality 35: 36=36; at 1521, 708<1522. | Pass |
| §0.11, :296, Levels divisible by a sixth prime power | N=64 | 12g=12≤58=N−6; N=0 is explicitly excluded. | Pass |
| §0.12, :308, At least two large prime factors | N=154=2·7·11 | 12g=60≤145=N−9; ω=3 gives 2^ω=8. | Pass |
| §0.13, :320, A large prime together with a factor of six | N=1548=2²·3²·43 | 12g=204≤1548; coarse threshold N/129=12 exactly. | Pass |
| §0.14, :332, The remaining small levels in the large-prime case | N=86 | 12g=48≤86; the prime factor 43 exceeds 41 and gcd(86,6)=2. | Pass |
| §0.15, :344, The residual finite family of levels | All 11250 tuples | 10125 distinct levels; min(N−12g)=18 at N=30, where 30−12=18. | Pass |
| §0.16, :356, Martin’s sharp weight-two newspace bound | All 1≤N≤3000; N=35 and p=11 | No negative/nonintegral g or bound failure; equality exactly 35 and tested primes ≡11 mod12. At N=1, 0<2. | Pass |
| §1.1, :381, Nonvanishing of the removed-prime comparison integer | p=2, c=±2√2, sign ±1 | Smallest absolute difference is 3−2√2>0; p=1,c=2 would give 0 but is excluded. | Pass |
| §1.2, :393, Congruences force divisibility of the integer norm | K=Q(√2), x=3−√2, λ=(7,√2−3) | x mod λ=0; Norm x=7; 7 divides 7. Unit x=1 is outside λ and has norm 1. | Pass |
| §1.3, :405, Archimedean bound on the comparison norm | Same x and p=2 | Norm=7≤(1+√2)^4=17+12√2; both embeddings are 3±√2. | Pass |
| §1.4, :417, The removed-prime bound with coefficient degree | Arithmetic comparison instance p=2,d=2,ℓ=7 | 7≤17+12√2; at p=ℓ Frobenius congruence is not invoked (hypothesis fails). | Pass of norm step; arithmetic lift conditional |
| §1.5, :429, Replacing the coefficient degree by the explicit level | N=35,d≤3,p=2 | Exponent 2d≤6=(35+1)/6; base 1+√2>1 preserves inequality. | Pass |
| §1.6, :441, The removed-prime residual exponent bound | N=11,p=2 | Endpoint is ℓ≤(1+√2)^2=3+2√2; integer-prime possibilities above 2 are 3,5. No assertion at coefficient prime. | Pass of exponent step |
| §2.1, :466, Kraus’s coefficient-rationality threshold | N=1,11,35 | F=1,3+2√2,(1+√8)^6; g=0 gives exponent 0, not 2. | Pass |
| §2.2, :490, Kraus’s two-torsion threshold | N=1,4,11 | G=4,4,13+4√3; replacing lcm(4,4)=4 by 16 changes 4 to 9. | Pass |
| §2.3, :514, Kraus’s full-two-torsion comparison threshold | N=1,11; ℓ=4 at N=1 | H=4,13+4√3; 4<H(1) is false and H(1)<4 is false; both sides of strict-threshold iff fail at equality. | Pass |
| §3.1, :552, Finite-prime recognition of rational coefficients | Level 11 normalized form; N=1 | Index/6=2, tested a₂=−2, all coefficients integral; N=1 has g=0, so no normalized form (a₁ would be both 0 and 1). | Pass |
| §3.2, :564, A small good prime detects a nonrational newform | Degree-one level 11 versus hypothetical nonrational form | a₂=−2∈Z, so premise fails at 11; degree≥2 forces some coefficient outside Z, with good-prime restriction via bad a_q∈{0,±1}. | Pass of boundary and contrapositive logic |
| §3.3, :576, The coefficient-recognition witness is below F | N=11 and N=1 | 2<3+2√2; g(1)=0 is excluded, F(1)=1. For q=2 and ℓ=7, q≠ℓ. | Pass |
| §3.4, :588, The norm of a noninteger coefficient minus an elliptic trace | q=2,a=√2,b=−2 or 3 | Norm(−2−√2)=2; Norm(3−√2)=7; both ≤17+12√2. With a=b=−2 norm 0, excluded by a∉Z. | Pass |
| §3.5, :600, The F-threshold forces coefficient field Q | N=11,ℓ=7 | F≈5.828<7; a nonzero integer norm divisible by 7 cannot have absolute value ≤5.828. Rational field degree is 1. | Pass of contradiction step |
| §3.6, :612, Kraus’s rational realization theorem | E₁₁,ℓ=7,N=11 | 7>F(11); identity residual comparison E_f=E₁₁ has conductor 11, residual dimension 2. E₁₁ has no rational two-point, illustrating absence of that conclusion. | Pass; supplier gaps retained |
| §3.7, :624, Kraus’s local coefficient filters | R=Z and zero ring; six filter branches | At (2,0,3):1−3X+2X²; (2,1,3):1−3X; (2,2,0):1; odd e=0:1; (3,1,−1):1−5X; (3,2,0):1−4X+3X². In zero ring all equal 0=1. | Pass |
| §3.7a, :651, Integral ideal Sturm recognition | k=0, constant f=1; J=(2), top, zero | Cutoff includes n=0: 1∉(2), so false premise excludes counterexample; top ideal gives all coefficients; zero form has all a_n=0∈(0). | Pass |
| §3.8, :665, The odd weight-two Eisenstein comparison | n=1,2,3,4,5 | Odd Eisenstein coefficients 1,0,4,0,6; σ₁(3)=4 and σ₁(5)=6; constant coefficient 0. | Pass |
| §3.9, :677, The filtered forms have the required coefficient congruence | Dyadic Euler filter with a₂=−2 | Newform recurrence a₄=a₂²−2=2; filtered a₂−a₂a₁=0; filtered a₄−a₂a₂+2a₁=2−4+2=0. | Pass |
| §3.10, :689, Kraus’s global prime-power coefficient congruence | Level 11, coefficient ideal (5), m=1 | Good q=3: a₃−4=−5∈(5); bad q=11:12(a₁₁−1)=0. Cutoff I(44)/6=12 includes both; good q=7 has a₇=−2 and difference −10∈(5). | Pass |
| §3.11, :701, A small prime detects failure of divisibility by four | E₁₁, N=11, q=3 | #E(F₃)=5≡1 mod4; q=3≤I(44)/6=12 and q∤22. | Pass |
| §3.12, :713, The mod-four witness is below G | N=11; B=12 | 12<G=13+4√3≈19.928; at N=1, B=1<4. | Pass |
| §3.13, :725, The G-threshold transfers full-two point counts | E:y²=x³−x, N=32,ℓ=101 | #E(F₃)=4,#E(F₅)=8; G(32)=9+4√2≈14.657<101, so small witness prime cannot equal ℓ. | Pass of cutoff/count step |
| §3.14, :737, Global four-point counts give a rational two-torsion point | Mod-two images C₃,S₃,C₂ | Order-three operator has charpoly X²+X+1 and det(1−g)=1 mod2, giving odd #E; C₂ fixes one of three nonzero two-points, so compatible counts can be even. | Pass |
| §3.15, :749, Four-point counts force one quadratic square class | a=b=1 versus a=0,b=−1 | First b=1 square while a²−4b=−3 is not; second b=−1 nonsquare while a²−4b=4 is square. Both alternatives are needed. | Pass |
| §3.16, :761, The full-two curve in the two-isogeny class | E:y²=x(x²+x+1) | E′:y²=x(x²−2x−3)=x(x−3)(x+1), degree 2 and four rational two-points; full-two E=y²=x³−x instead uses degree 1. | Pass |
| §3.17, :773, Kraus’s full rational two-torsion realization | E:y²=x³−x,N=32,ℓ=101 | g(32)=1; F=G=H=9+4√2<101; conductor 32 and four rational two-points on identity realization. | Pass; supplier gaps retained |
| §3.18, :785, The finite-flat adapter from deletion level to residual conductor | M=11,ℓ=5,v₁₁Δ=5; or good reduction at ℓ | Deletion M₀=1, residual away-5 conductor 1. At ℓ with multiplicative valuation ℓ, deleting its exponent 1 removes ℓ; with valuation 1 it would remain, so local hypothesis matters. | Pass of local recipe; no weight shortcut at 5,7 |
| §4.0, :810, Native torsion and cyclic-kernel predicates | n=0,1,2; identity and [2] | Geometric torsion entire group,1,4 points; identity degree1 kernel1 cyclic; [2] degree4 kernel C₂² noncyclic. S₃,C₃ images fix no line; C₂ fixes one. | Pass |
| §4.1, :853, The five possible isogeny-character exponents | r=11,m=5; r=17,m=8 | Residues {0,1,3,2,4} mod5; mod8 half excluded, third=3,two-thirds=6. Duality swaps 0↔1,2↔4 mod5 and fixes 3. | Pass |
| §4.2, :865, Frobenius congruences for a rational prime-isogeny character | q=3,r=11,k=2=1/3 mod5,β=1 | Eigenvalues 9,4 mod11 have trace2, determinant3; twelfth trace 658≡9, and 3^24+3^(−12)≡9 mod11. | Pass |
| §4.3, :877, The finite twelfth-power trace checks | q=3,a=0,±1,±2,±3 | A₁₂=1458,−1358,658,1458 respectively from A₀=2,A₁=a. | Pass |
| §4.4, :889, The zero-exponent prime-isogeny case | q=3,5 prime divisor lists | Their intersection is {2,3,5,7,13,37}; restricting r=11 or r≥17 leaves {37}. | Pass |
| §4.5, :901, The one-third prime-isogeny case | q=3, traces 658,−1358,1458 | 3⁴+3⁸=6642; differences 5984,8000,5184 have primes {2,3,5,11,17}; allowed range leaves 11,17. | Pass |
| §4.6, :913, The half-exponent class-number-one reduction | r=11,19,163 | 2√r/π≈2.111,2.775,8.128 versus r/4=2.75,4.75,40.75; all listed fields have class number1. r=7 outside the positive-genus branch. | Pass of bound; classification imported |
| §4.7, :925, Mazur’s rational prime-isogeny theorem | Prime degrees 2,13,163 and excluded 23 | All three belong to list; 23 absent; identity degree1 fails prime premise. CM is retained at 163. | Pass |
| §4.8, :937, Mazur’s minimal positive-genus composite levels | N=22,39,169 and genus-zero 25 | 22 divisible by positive-genus11;39 and169 are minimal obstruction levels;25 itself is genus zero and is absent from positive-genus obstructions. | Pass |
| §4.9, :949, The genus-one rational-isogeny point tables | Nine listed genus-one levels | Noncusp counts (14,15,20,21,24,27,32,36,49)=(2,4,0,4,0,1,0,0,0); 27 supplies one CM value, not zero. | Source table agrees; not independent descent proofs |
| §4.10, :965, The cusp-only level 39 | N=39 | Four rational cusps, claimed noncusps=0; genus3. This is stronger than merely finite rational points. | Uncertified Kenku primary |
| §4.11, :977, The cusp-only level 65 | N=65 | Four rational cusps, claimed noncusps=0; genus5. | Uncertified Kenku primary |
| §4.12, :989, The cusp-only level 91 | N=91 | Four rational cusps, claimed noncusps=0; genus7. | Uncertified Kenku primary |
| §4.13, :1001, The cusp-only level 125 | N=125 | Two rational cusps, claimed noncusps=0; genus8; geometric cusp count10. | Uncertified Kenku primary |
| §4.14, :1013, The cusp-only level 169 | N=169 | Two rational cusps, claimed noncusps=0; genus8; geometric cusp count14. | Uncertified original plus corrigendum |
| §4.15, :1025, Kenku’s five remaining cusp-only levels | Five levels 39,65,91,125,169 | Claimed noncusp count tuple (0,0,0,0,0), matching the cited aggregate table; rational cusp counts (4,4,4,2,2). | Conditional on preceding exhaustions |
| §4.16, :1037, Excluding composite isogeny extensions | Degrees 26,35,50 | 26=2·13,35=5·7,50=2·25 all absent from final degree set; their proper factors 2,5,7,13,25 are present. | Source-dependent exclusion |
| §4.17, :1049, Mazur–Kenku’s rational cyclic-isogeny degrees | n=0,1,19,21,25,27,20 | List predicate false,true,true,true,true,true,false; degree0 impossible for nonconstant isogeny, identity degree1 retained. | Pass |
| §4.18, :1061, A rational two-point gives a cyclic twice-prime isogeny | ℓ=3 and 11 | C₂×C₃ is cyclic C₆, yielding allowed degree6; C₂×C₁₁ cyclic C₂₂, which classification excludes. | Pass |
| §4.19, :1073, Full two-torsion gives a cyclic four-isogeny in its class | E:y²=x³−x; quotient by (0,0) | Quotient E′:y²=x³+4x has rational 2-point; composite with another transported 2-isogeny yields cyclic order4. [2] instead has C₂², so degree4 alone fails. | Pass |
| §4.20, :1085, Full two-torsion and reducibility give a cyclic four-times-prime isogeny | ℓ=5 | Transport along degree2 preserves 5-torsion; product of cyclic kernels C₄×C₅=C₂₀, excluded by degree list. | Pass |
| §4.21, :1097, Uniform irreducibility with one rational two-point | ℓ=11; excluded ℓ=7 | 2ℓ=22 absent; 14 present for ℓ=7, so lowering cutoff invalidates the classification contradiction. | Pass |
| §4.22, :1109, Uniform irreducibility with full rational two-torsion | ℓ=5; excluded ℓ=3 | 4ℓ=20 absent;12 present at ℓ=3, so cutoff is needed. | Pass |
| §5.0, :1138, Geometric endomorphisms and nonsplit image containment | CM y²=x³−x; p=2,3,5 | [i]²=−1 excludes integer scalar endomorphisms; split pair stabilizer at2 has order2 versus full normalizer6; at3 both order8. Nonsplit Cartan at5 has24 elements and normalizer48. | Pass |
| §5.1, :1180, The CM prime-isogeny exceptions | r=19,43,67,163 | j=−884736,−884736000,−147197952000,−262537412640768000; all equal specified cubes and have CM, so non-CM branch excludes them. | Pass |
| §5.2, :1208, Serre’s projective inertia bound | p=5,17,41 | Required orders ≥1,4,10; q=p case included. At p=41 order≥10 exceeds largest exceptional order5. | Pass of numerical thresholds |
| §5.3, :1220, Excluding exceptional projective residual images | p=41 versus p=37 | Inertia bound 10>5 versus9>5; projective A₄,S₄,A₅ maximum element orders3,4,5. Stated >37 range suffices. | Pass |
| §5.3a, :1232, Quantitative elliptic isogenies over number fields | K=Q,h_F≤985; cyclic degree1 | Bound10⁷·985²=9702250000000≥1; d=0 excluded since number-field degree≥1. CM isogeny bound retained, but cyclic-degree consequence excludes CM (arbitrarily large split CM prime degrees). | Pass of constants and scope |
| §5.3b, :1254, Integrality of split Cartan rational points | Noncuspidal split-normalizer point p=17; cusp | Integral conclusion j∈Z applies only off cusp; cusp j=∞ is not a rational number. CM j=0 is integral and not excluded. | Source-dependent integrality |
| §5.3c, :1268, The explicit Runge inequality | p=17,j=0,1728 | log max(1,abs j)=0,≈7.455; RHS≈83.8. No log0 or negative bound occurs. | Pass of normalization |
| §5.4, :1282, The large-prime split Cartan exclusion | p=14000001 threshold versus p=14000000 | Strict inequality admits first integer and excludes second (primality additionally required); primes≤14000000 handled by 5.6. CM j=0 has h=0 and is not contradicted. | Source-dependent quantitative exclusion |
| §5.4a, :1294, The generalized Jacobian of X₀(p) and Heegner–Gross vectors | p=17,D=3; p=37,t²=2 | dim J♯=2 versus dim J=1; e₃ coefficient1/3 versus H logarithmic coefficient1; at37 a single conjugate basis vector gives17+26t outside F₃₇. | FAIL S01,S02 |
| §5.5, :1317, The Heegner–Gross criterion for split Cartan points | p=17,D=3 | H=X,H′=1, so every resultant with H′ equals1; gcd=1,17∤1, χ₋₃(17)=−1; every ordinary j₀ has1/j₀≠0. | Criterion test passes; repair 5.4a first |
| §5.6, :1329, The finite split Cartan exclusion | p=17, p=13 and p=11 | 17 passes preceding resultant test;13 explicitly omitted;11 fails strict lower bound. No finite range silently includes them. | Source sieve not recomputed in full |
| §5.7, :1343, The split Cartan uniformity input | p=17; p=13 | Prime17 meets >11 and ≠13;13 excluded. CM j=0 at17 is a noncuspidal CM point and remains allowed. | Pass of quantifiers |
| §5.8, :1359, Every remaining proper image is in a non-split Cartan normalizer | Non-CM proper image at p=41; CM at p=163 | Prime41 not in rational prime-degree list; exceptional order≤5 conflicts with≥10; split excluded. CM 163-isogeny excluded by hCM, so no false nonsplit conclusion there. | Pass of case exhaustion |
| §5.9, :1371, Potentially multiplicative primes under a non-split image | p=11; q=23 or2 | 23≡1 mod11 admitted as possible multiplicative place,2≠±1 excluded; q=p treated separately. Conclusion restricts places, not all q. | Pass |
| §5.10, :1383, The Cartan correspondence kills the p-old part | r=5,p=11 versus positive-genus r=11 | Genus X₀(5)=0 gives target old Jacobian dimension0; genus X₀(11)=1 would not, and is excluded here. | Pass |
| §5.10a, :1395, Geometric cuspidal-divisor torsion | N=11; C=P¹ with two marked points | Cusp difference on X₀(11) has order5; Pic⁰(P¹)=0 gives order1, so torsion does not imply nonzero. General congruence case distinct from imported squarefree case. | Pass |
| §5.11, :1412, The winding class selects exactly nonvanishing central periods | W=i/π for q+2q²; W=0 | −2πiW=2; W=0 iff L=0 since −2πi≠0. Rescaling period basis by2 divides normalized period by2, preserves nonvanishing. | Pass of pairing normalization |
| §5.12, :1424, Nonvanishing of the new winding class | r=5,p=11; excluded r=2,p=3 | div(t)=11D, order[D]=11 via PSL₂(F₁₁) order660 with no cyclic quotient11; excluded A₄ has quotient C₃, and genus-zero Jacobian gives[D]=0. | Pass of group/boundary obstruction |
| §5.13, :1438, The nonzero finite winding quotient | r=5,p=11; zero quotient | e_B≠0 forces dim A≥1, so zero quotient dim0 is ruled out; finite A(Q) means rank0, not dim0. | Conditional on rank-zero/Chen gaps |
| §5.14, :1450, The cusp residue-field constraint | p=11,q=23,43,3 | Residue degrees in Q(ζ₁₁)^+ are1,1,5 respectively; ±1 condition true,true,false. | Pass |
| §5.15, :1462, Formal immersion into the winding quotient at a cusp | p=11,q=23,r=13 | q≥2p−1=21>13, so q∤rp; cusp width11 gives11dt≠0 mod23. Width reduction at q=11 would be0 but is excluded. | Pass of local numerical conditions |
| §5.16, :1474, The rational modular point has torsion quotient image | r=5,p=11,K=Q(ζ₁₁)^+ | Five cusps in each fibre; rational trace uses five conjugates and finite A(Q). A single [P−∞] need not be rational; statement places it in A(K). | Pass of field and torsion logic |
| §5.16a, :1492, Moving the specialization cusp to infinity | r=5,p=11,q=23 | Two fibres each size5; level-preserving automorphisms act within fibre, w₅ exchanges them; transported specialization is ∞ and Abel value0. | Pass |
| §5.17, :1506, Formal immersion excludes every denominator away from p | Same r,p,q | e=1<q−1=22; a torsion image reducing to0 must equal0, and cusp formal immersion identifies sections. q=p excluded here. | Pass of specialization hypotheses |
| §5.18, :1518, A proper residual image forces integral j | E:y²=x³−x,r=2,p=11 | CM permitted; nonsplit because11 inert in Q(i); j=1728∈Z. Removing non-CM restriction is intentional and valid. | Pass |
| §5.19, :1530, The five genus-zero j-numerators | r=2,7,13,11 | Degrees3,8,14,zero polynomial; constants4096,49,13,0. Out-of-range r=11 has no modular coordinate. | Pass |
| §5.20, :1557, The modular meaning of the five j-polynomials | r=2,t=8,−64; t=0 | j=(t+16)³/t=1728 at both; t=0 is a cusp with pole, despite total field division returning0. | Pass |
| §5.21, :1569, Integral j forces a signed constant-term divisor | r=2,t=1/2,−16; f(T)=T | j=35937/4 noninteger at1/2; t=−16 divides4096 and j=0. Degree-one f at1/2 gives1, explicitly excluded from general argument. | Pass |
| §5.22, :1581, The finite integral j-candidate sets | All signed divisors at five r | Divisor counts26,14,8,6,4; distinct image counts25,13,8,6,4; r=13 values −39091613782464,576,2101248,2045023375454208. | Pass |
| §5.23, :1607, Integral j-values are the finite divisor candidates | r=2,j=1728,−3375 | Witnesses t=8 and t=−1 respectively; both nonzero rational coordinates and integral j. Outside five levels no asserted iff. | Pass in both directions on examples |
| §5.24, :1619, Surjectivity is invariant under quadratic twist | p=5, G=GL₂(F₅), quadratic determinant twist | Scalar −I fixed because det(−I)=1; twisting map has zero kernel and both groups have480 elements. p=2 excluded. | Pass |
| §5.25, :1631, The finite j-table at prime degrees 11,17,37 | r=11,17,37 | Source j-table counts3,2,2, total7; one value is CM, leaving6. This does not assert rank0 of J₀(37). | Source table agrees |
| §5.25a, :1643, A witness bound for nonsurjective primes | E₁₁; CM y²=x³−x | Odd character −11 has ε(2)=−1,a₂=−2, B=2. CM character −4 has every inert a_q=0, so nonzero witnesses fail. At7 order χ₇³=2 explains exclusion. | Pass |
| §5.26, :1657, Residual-image theorems for the six large-isogeny j-values | Six non-CM values; p>37 | Each bound B gives finite interval38..B; if B<38 interval empty. q=p retained via p≤q; if q≠p then p≤abs a_q. No bound follows from a_q=0. | Proof architecture passes; full witnesses not recomputed |
| §5.27, :1669, Residual-image theorems for the integral j-lists | Five j-set counts and CM j=0,1728 | 25+13+8+6+4=56 entries before cross-level collisions; j=0,1728 discarded by geometric non-CM, not by invalid trace test. | Proof architecture passes; full witnesses not recomputed |
| §5.28, :1681, Lemos’s rational cyclic-isogeny surjectivity theorem | Identity n=1; nontrivial n=2; p=41 | n=1 fails 1<n; n=2 admitted. Full GL₂(F₄₁) has(41²−1)(41²−41)=2755200 elements. CM r=2 examples fail non-CM premise. | Pass of final scope |

## Suggested.lean declaration and binder ledger

All 268 lines read: 24 declarations, comprising 14 theorems, 9 definitions/abbreviations and one instance. The namespace is TauCetiRoadmap.EllipticModularityEffectiveComparisons. There are no mathematical section variables; every required curve, level, instance and numerical hypothesis is explicitly bound by the declaration. The global noncomputable section and the Classical opening add no mathematical hypotheses. `Type*` coefficient fields have independent universes. The following is a manual type audit, **not** an elaboration claim: the supplied signature job failed before printing any signature, and this review ran no Lean command.

Locations in this table are in packages/EllipticModularityEffectiveComparisons/Suggested.lean. E denotes a rational Weierstrass curve, with `[E.IsElliptic]` explicitly present wherever E occurs.

| Declaration / line / layer | Actual variable and instance context | Instances and computed values | Result |
|---|---|---|---|
| localTerms :46 / 0 | p,e:N; no prime instance; Fin 5→Q | (0,0) five ones; (0,1) five zeros; (2,3)=(3/8,0,1,0,0); indices only Fin 5 | Real definition needed by headline |
| martinValue :64 / 0 | N:N, total Q-valued function | N=0→0; N=1→1/12−1/2−1/4−1/3+1=0; N=35→3 | Real definition needed by headline |
| newDimension :70 / 0 | N:N, [NeZero N]; finrank C of newspace∩trivial-character space | N=11→1; N=30→1 versus full dimension3; N=0 rejected by instance | Native carrier |
| martin_dimension_formula :76 / 0 | N:N,[NeZero N] | N=1:0=0;11:1=1;35:3=3 | Substantive theorem |
| martin_sharp_bound :81 / 0 | N:N,[NeZero N]; natural arithmetic | 35:36≤36 and both iff sides true;13:0≤14 and both equality sides false;1:0≤2 | Substantive theorem; no truncating subtraction |
| newform_integral_of_small_primes :90 / 3 | N,[NeZero N], f:Newform N 2,hχ; all prime q with6q≤index; n:N | N=11 index12,q=2,a₂=−2∈Z; n=0 coefficient0; level1 normalized form impossible | Substantive theorem on actual newform |
| integral_ideal_sturm :101 / 3 | N,[NeZero N],k:N,χ; K:Type*,[Field K],[NumberField K],σ:K→+*C; f:character space,a:N→O_K,ha,J:Ideal O_K,hJ,n | k=0,f=1,J=(2): n=0 is tested and1∉J; J=top all coefficients admitted; zero form/J=0 yields0∈0 | Full ideal statement, includes constant term |
| kraus_prime_power_congruence :115 / 3 | N,[NeZero N], f,hχ,K,[Field],[NumberField],σ,a,ha,P,[P.IsPrime],m≥1; good/bad cutoff hypotheses;q prime,q∤2N | N=11,P=(5): a₃−4=−5,a₇−8=−10; bad11 gives12(1−1)=0; q=2 excluded | Substantive theorem; zero prime ideal not silently prohibited |
| four_divisible_isogeny_realization :132 / 3 | W:WeierstrassCurve Z,[(W.baseChange Q).IsElliptic]; all odd good q have4 dividing point count | y²=x³−x gives counts4,8 at3,5 and identity degree1; y²=x(x²+x+1) has quotient x(x−3)(x+1), degree2, rational2-torsion card4 | Actual point and isogeny carriers |
| GeometricTorsion :146 / 4 | E,[E.IsElliptic],n:N | n=0 entire group;n=1 card1;n=2 card4; characteristic5 supersingular E[5] card1 is outside Q setup | Real abbreviation |
| CyclicIsogenyDegree :151 / 4 | E,[E.IsElliptic],n; target F and its ellipticity existentially bound; geometric kernel | identity degree1/card1 cyclic; [2] degree4/card4 but C₂² noncyclic; rational3-kernel on y²=x³+2 has nonrational generators | Real predicate, geometric base change retained |
| torsionModule :157 / 4 | E,[E.IsElliptic],n | n=0 gives Z-module on whole group; n=1 zero ZMod1-module; n=2 gives2P=0 | Required native scalar instance; not a padding theorem |
| torsionRepresentation :162 / 4 | E,[E.IsElliptic],n; G=Aut_Q(Qbar), coefficients ZMod n | identity sends P to P; conjugation sends(0,√2) to(0,−√2) on3-torsion; on2-torsion scalar2 is0 | Body uses actual coordinate action and composition order |
| prime_cyclic_isogeny_degrees :179 / 4 | E,[E.IsElliptic],r,hr:r.Prime,h:cyclic degree r | r=2,13,163 in set;r=23 out;r=1 fails hr | Substantive classification; includes CM |
| rational_cyclic_isogeny_degrees :185 / 4 | E,[E.IsElliptic],n,h:cyclic degree n | n=1→true;27→true;20→false;0→false; degree0 not an isogeny | Substantive classification |
| rational_two_uniform_irreducibility :191 / 4 | E,[E.IsElliptic],ell,[Fact ell.Prime],11≤ell; nonzero rational P with2P=0 | ell11 would give cyclic degree22 if reducible;22 absent; ell7→14 allowed but excluded | Actual irreducibility, no free predicate |
| full_two_uniform_irreducibility :198 / 4 | E,[E.IsElliptic],ell,[Fact ell.Prime],5≤ell; rational2-torsion card4 | ell5 reducible→degree20 absent; ell3→degree12 allowed but excluded | Rational torsion hypothesis versus geometric representation correctly distinct |
| GeometricallyNonCM :208 / 5 | E,[E.IsElliptic]; every native geometric Hom endomorphism has form n•1 | 0=0•1 and identity=1•1; on y²=x³−x,[i]²=−1 has no integer n with n²=−1 | Real non-CM predicate |
| SplitNormalizerImage :217 / 5 | E,[E.IsElliptic],p:N; two distinct additive subgroups cardp, permuted by all Galois operators | p=2 pair stabilizer2≠full normalizer6;p=3 both8; p=1 no two distinct subgroups card1 | Real predicate; odd-prime caveat correctly states its scope |
| NonsplitNormalizerImage :227 / 5 | E,[E.IsElliptic],p:N; cyclic subgroup C of actual additive automorphisms, card p²−1, normalized by image | p=2 cyclic C₃ normalized by S₃;p=11 C order120,normalizer240;p=1 torsion trivial and no subgroup card0 | Prime interpretation only; arbitrary-n junk not consumed |
| split_normalizer_exclusion :235 / 5 | E,[E.IsElliptic],hCM,p,hp,11<p,p≠13 | p=17 included;p=11,13 excluded; CM j=0 is excluded by hCM | Substantive theorem |
| proper_image_nonsplit :243 / 5 | E,[E.IsElliptic],hCM,p,hp,37<p; failure of surjectivity of actual action | p41: inertia order≥10>5; Borel41 absent; full GL₂ image order2755200 makes hprop false | Substantive theorem; premise not conclusion |
| cyclic_isogeny_integral_j :253 / 5 | E,[E.IsElliptic],r in five-element set,cyclic degree r;p prime outside set;actual nonsplit predicate | CM y²=x³−x,r2,p11 has j1728∈Z; r=11 fails membership | Substantive theorem; correctly no non-CM assumption |
| lemos_uniform_surjectivity :262 / 5 | E,[E.IsElliptic],hCM,n,1<n,cyclic degree n;p prime,37<p | n1 excluded; p37 excluded; atp41 full target card2755200; CM example fails hCM | Substantive headline |

The one-tactic probe found no theorem that restates a definition, computes a boundary case, or follows from one pinned lemma. The native scalar instance and coordinate-action adapter are necessary definitions for the two irreducibility headlines, not additional acceptance theorems. All 14 theorem bodies use `sorry`; no data body does. All 24 own names appear in the README. The seven individual TauCeti imports exist at the pin; the only Mathlib import is `import Mathlib`. No `set_option`, `lemma`, admitted example, free proposition field, or assumption containing a headline conclusion occurs.

The README headlines represented are dimension formula/sharp bound, coefficient recognition, integral ideal Sturm, prime-power congruence, four-count isogeny realization, prime/composite cyclic degrees, both irreducibility bounds, split exclusion, proper-image containment, integral j, and Lemos surjectivity. The module docstring explicitly defers the removed-prime/exact-conductor endpoints, split modular-point theorem, geometric cusp torsion, exceptional modular-point exhaustions, mixed winding quotient/formal immersion, and quantitative height/isogeny bound because their arithmetic conductor, modular-curve/Jacobian/model or Faltings-height carriers are missing. No new missing statable headline was established in this pass.

## Supplier, ownership and pin audit

The current manifest pins are Mathlib f6090c7095e1e56b3464c1daba5f24631f1290d2 and TauCeti 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a. The following locators refer to those files, not current upstream documentation.

| Native object | Pinned definition or theorem inspected | Adversarial distinction |
|---|---|---|
| Factorization, Möbius inversion, divisors, totient | Mathlib/Data/Nat/Factorization/Defs.lean:50,96; Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean:51,112,156; Misc.lean:143,178; Mathlib/Data/Nat/Totient.lean:313 | Reconstruction needs N≠0; μ(p)=−1 while μ*μ(p)=−2; at N=1 empty products are1 |
| Algebraic and ideal norms | Mathlib/RingTheory/Norm/Transitivity.lean:211,261; Norm/Basic.lean:110; Ideal/Norm/AbsNorm.lean:329,396; Mathlib/NumberTheory/NumberField/Norm.lean:38 | All embeddings in the separable product; finite-free/domain conditions in nonzero norm; x=3−√2 has norm7, not just one real absolute value |
| Embedding count and Minkowski | Mathlib/LinearAlgebra/FreeModule/Finite/Matrix.lean:91; Mathlib/NumberTheory/NumberField/ClassNumber.lean:77 | Native finite-free rank and actual number-field discriminant/signature; quadratic imaginary bound2√r/π |
| Irreducibility and scalar conversion | Mathlib/RepresentationTheory/Irreducible.lean:29; Mathlib/Algebra/Module/ZMod.lean:81; Mathlib/Algebra/Module/Torsion/Basic.lean:1010 | `IsSimpleOrder (Subrepresentation ρ)` includes nontriviality; zero representation on zero module is not a false positive; at n=0 scalar ring is Z |
| Newspace/character space | TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean:202; DiamondOperators.lean:279; Newforms/Nebentypus.lean:161; TrivialNebentypus.lean:220 | Native definition is `CuspForm.peterssonOrthogonal (cuspFormsOld N k)` with [NeZero N]; it does not itself impose trivial character |
| Primitive normalized form | TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104 | `isNew` plus `isNorm` pins a₁=1; bad-prime eigenvector identities are theorems, not structure assumptions |
| Characteristic-zero Sturm | TauCeti/NumberTheory/ModularForms/SturmBound.lean:102 | Actual strict period/cusp-width and discrete-topology hypotheses; equality over C does not supply arbitrary-ideal congruence |
| Covariant torsion action | TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean:48,64 | Actual coordinate action restricted to n-torsion, not arbitrary representation data; arithmetic determinant at q=2 is2, not1/2 |
| Actual isogeny/geometric kernel | TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean:139; Degree.lean:94; Kernel.lean:75; BaseChange/Basic.lean:212; Hom/Basic.lean and Hom/Add.lean | Kernel is taken after algebraic-closure base change; [2] has degree4 but noncyclic geometric kernel |

The 18 supplier-contract groups were checked against their present files; 72 numbered supplier-section excerpts were inspected in addition to the main-roadmap and pinned-library checks. The following compact ledger records the actual ownership distinctions used in assessing the proof routes.

| Supplier | Resolved sections and scope used |
|---|---|
| EllipticCurveModularity | R29.3–R29.4, R29.6: exact-conductor modularity, torsion/Tate and local factors; R29.1's per-curve finiteness does not consume the uniform bounds |
| ModularForms (main) | Layers2–4: good/bad recurrences, primitive/old decomposition;6: exact-divisor involutions;8G: actual coefficient fields/conjugate eigenlines;10C: full-space genus formula |
| SerreWeightAndLevelOptimisation | §§2.8,4.8,6.1–6.3 exist; §4.8 is conditional on finite-flat weight recipe, not an unconditional elliptic weight-two recognition theorem |
| ArithmeticGaloisRepresentations | §§2.3–2.4,3.1–3.6,4.2–4.5,5.1,6.1–6.4: characters, full Swan/Artin conductors, finite-group classification, Frobenius and covariant elliptic torsion |
| NeronModelsAndSemistableAbelianVarieties | §5.3h gives actual residual conductor for ℓ≥5 including Swan; §§5.2,5.4 isogeny invariance; §6.4d requires connected abelian kernel and e<p−1, not arbitrary isogeny cotangent exactness |
| HeightsRationalPointsAndObstructions | §§1.15b–1.18: formal kernel and all torsion under e<q−1; §1.19 two-isogeny square classes; §§1.4–1.7,1.15 descent inputs do not themselves assert all modular genus-one tables |
| ModularCurvesPartII | §§3.8,4.1–4.2,4.8,5.2,5.5,9.1,9.5–9.7,13.1–13.3,14.11–14.12,14.15,16.2–16.6,17.3: actual normalized curves/maps, Jacobians, integral Hecke action and quotient differentials; generic charts do not discharge the mixed integral gaps |
| AlgebraicModularFormsAndSerreWeights / FiniteFlatGroupsAndIntegralPadicHodgeTheory | R15.2 integral expansions; R15.4 and R07.5 extension-sensitive recipe; R07.1 finite-flat inertia tools. Positive-characteristic support descent is separately contracted |
| AutomorphicGaloisRepresentations / DeligneWeightsAndPurity | §§6.1,6.4 give weight-two Tate decomposition and rational-newform exact conductor; DWP.1 §§1.1–1.4 Weil bounds. Simultaneous embedding/lattice comparison remains a gap |
| EisensteinIdealAndRationalTorsion | §§2.3,6.3–6.4,7.9 and8.9 resolved. Squarefree geometric cusp torsion is explicitly imported; invariant-vector exclusion does not replace invariant-line classification |
| ImaginaryQuadraticClassNumber (main) | H1.1–H1.4 actual quadratic orders; H3.2 general Siegel functions; H3.5–H3.6 certified singular values and exhaustive class-number-one theorem |
| ComplexMultiplicationAndExplicitReciprocity | §3.1 class polynomials; §§5.1–5.5 distinguish geometric/model endomorphisms, ordinary exact orders and supersingular reduction; no equivalence between supersingular curves and maximal-order types imported |
| ClassFieldTheory (main) | Layer13 supplies narrow Hilbert field and actual Galois/ray-class identification; the extra Cl⁺(Q)=1 step is now explicit |
| ModularSymbolsPadicLFunctions | §§0.6–0.8,1.1–1.2 actual homology/differential pairing, rational splitting and Mellin comparison; orientation transports 0→i∞ period to −L(f,1) |
| MordellLawrenceVenkatesh | §8.11 gives the Picard-Jacobian period lattice and finite-map compatibility; geometric cuspidal torsion remains the arithmetic consequence here |
| EulerSystemsAndKolyvaginSystems | §§4.7,5.13 concern genuine arithmetic descent systems with local hypotheses, not blanket modular-factor rank zero; the latter remains a gap |
| ArakelovGeometryAndAbelianHeights / FaltingsFinitenessAndIsogenyTheorems | §§4.4,5.9: stable height change≤½log degree and h_F≤h(j)/12+3; R28.4.5–R28.4.7: semisimplicity and isogeny recognition. The original Faltings normalization is retained |
| EllipticCurves (main) / Chebotarev (Completed) | Layers1–7: quotient isogeny, torsion, local reduction, twists and descent; Completed/Chebotarev/README.md:410 Layer10 gives density #C/#G and finite-set avoidance |

All eight gap slugs match in README and design/plan.json. Each has a named earlier supplier and a specific output: optimized elliptic weight-two lift, weight-two/local reduction comparison at ℓ≥11, mixed cusp charts, Chen/integral quotient comparison, positive-characteristic support descent, all-embedding Frobenius, modular abelian-factor rank zero, and quantitative abelian periods. Their stated missing comparisons are not replaced by unrelated existing theorems. No new finding is raised for their present absence, and acceptance after the two repairs is conditional on these contracts.

Object searches covered main, Completed, board packages, and the available open-roadmap index/heads. Siegel functions belong to ImaginaryQuadraticClassNumber H3.2, and squarefree cusp torsion to EisensteinIdealAndRationalTorsion §7.9. EllipticCurvePeriodsAndModularParametrizations does not own these effective residual comparisons. The later AnabelianGeometryAndNonabelianChabauty has a reduced-boundary generalized Jacobian; the needed construction moves earlier here and cannot be consumed upward. The already settled later EllipticCurveModularityPartII overlap is not re-raised. A search of readable sibling/main/Completed Suggested.lean files found no declaration in this package's fully qualified namespace. A broad object search is not certification of inaccessible or unspecified sibling heads.

The requested mechanical dependency check returned:

```text
depcheck: 172 roadmaps, 1191 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The read-only diff against origin/main contains ten changed files, all within packages/EllipticModularityEffectiveComparisons; no out-of-folder change was found. The reviewed README and Lean file have no pull-request numbers or process narrative, computational algorithm target, forbidden Lean import or option. Reports and design metadata are distinguished from the mathematical deliverable.

The final repeat of the same read-only dependency check, using the service's refreshed roadmap index, returned:

```text
depcheck: 176 roadmaps, 1189 edges, 0 problem(s)
```

Both runs were clean; the target checkout remained 87258183. No merge-order file was changed.

## Verified sound

Counts and scope: **24 Lean declarations read**, **103 numbered README target sections read**, **101 distinct cached source-line anchors inspected**, **110 Check bullets assessed in 31 blocks** (30 Checks blocks plus the normalization block), **18 supplier-contract groups checked**, including **72 numbered supplier-section excerpts**, and **8 matching declared gaps**. The README's six headline endpoint groups and the fourteen acceptance theorems are separately accounted for above. These counts do not certify the six inaccessible Kenku primary texts or the computations listed below as not reproduced.

The exact-arithmetic tests included all N from1 through3000 for integrality/nonnegativity and the sharp dimension equality, all11250 residual-family tuples, all signed constant-term divisors for the five j-polynomials, the twelfth-power trace recurrence, and the 1369 elements of F₃₇² for the S02 supersingular witness. No Lean build or theorem execution was run. At N=30 the residual-family minimum is30−12g=18; the distinct-level count is10125. The five j-image cardinalities are25,13,8,6,4. E₁₁ point counts at2,3,5,7 are5,5,5,10, giving traces−2,−1,1,−2.

Additional convention/Check computations: roots−1±i have product2, inverse roots have product1/2; the two-term q+2q² Mellin value is2, normalized upward period−2, unscaled period i/π. Cusp width11 gives cotangent11dt≠0 mod23. The Runge expression is approximately48.033 at5 and83.790 at17. At d=2 the square root of the isogeny bound is2√10⁷·(985+4log2). Torsion descent with cusp exponent5 and rational exponent7 kills the image by35; it does not kill every point of A(K). The nine genus-one noncusp counts subtract rational cusps, not geometric cusps: at20,6−6=0; at14,6−4=2. At19 the CM exception similarly has3−2=1 rational noncusp.

The tests retain every meaningful boundary allowed by the types: N=0/1, p=2/3, n=0/1/2, zero ideals and unit ideals, zero coefficient ring in the polynomial definition, dimension zero, identity isogeny, split/nonsplit and CM/non-CM, and finite versus infinite geometric point groups. Inseparable elliptic kernels and nonreduced square-zero bases cannot enter these characteristic-zero Weierstrass signatures; finite-field degeneration is tested separately in the torsion Checks. Arbitrary schemes, arbitrary topologies and higher-cardinality carriers are not silently admitted. Q₈/S₃ cannot substitute for a two-dimensional prime-field coefficient module; the relevant nonabelian S₃ action on F₂² was tested against its three lines. No generality narrowing, unowned input, duplicate native theorem or padding theorem beyond the reported comparisons was established.

The repaired explicit finite witness bound is a substantive improvement over finite residual samples: p=q_ε gives p≤q_ε, and p≠q_ε gives p≤abs(a_(q_ε)) from a nonzero divisible integer. Both branches are needed. Oddness follows from complex conjugation, and CM self-twists fail the nonzero-trace witness, as required. This verifies the new route's logical finite reduction, not every later per-curve certificate.

## Not verifiable

- Mechanical elaboration and `#check @name` comparison: the supplied signature run exited before printing any signature because a pinned TauCeti Newforms/Basic object file was missing. The explicit read-only/no-Lean-build instruction was respected. The binder ledger is manual; successful elaboration at these current pins is not asserted.
- The six settled primary entries kenku-1979, kenku-1980a, kenku-1980b, kenku-1981, kenku-1982 and kenku-169-corrigendum remain uncertified. Their published locators and the accessible aggregate classification were checked; their descent proofs and the corrigendum's exact repair were not read. They were not requested again or put in a missing-reference file.
- The universal split-Cartan sieve through14000000 and the full per-curve residual-image certificates for §§5.26–5.27 were not independently executed. Their source theorem/statement, finite ranges, explicit bound architecture and small controls were checked. This is not a claim to have reconstructed every finite certificate.
- The eight supplier contracts are declared future mathematical outputs, not completed library results. No missing implementation was promoted to a finding merely because it is contracted. Completion depends on those outputs at their stated generality.
- Ownership against open work was searched through the supplied readable heads and the local roadmap index. No separate assertion is made about inaccessible or unspecified open heads. No GitHub write, source download outside the source service, package repair or source-manifest edit was performed.

## Source issues

- **Error** in bilu-parent-rebolledo at §5.1.2, equations (5.1)–(5.2), printed p.975 (lines819–832): the source says the unit-normalized optimal-embedding vector has the Hilbert-polynomial logarithmic differential; it should use the actual reduction multiplicities with the correct embedding weights; affects a stated result.
- **Error** in bilu-parent-rebolledo at §5.1.1, printed p.974 (lines775–781): the source says arbitrary F_p coefficients on geometric supersingular classes give the displayed rational cotangent; it should extend scalars and impose Frobenius descent for rational cotangents; affects a stated result.
- **Error** in bilu-parent-rebolledo at §5.1.2, printed p.975 (line812): the source says supersingular curve classes correspond one-to-one to maximal-order types; it should retain curve classes, since distinct Frobenius-conjugate curves can have isomorphic endomorphism rings; affects the proof.
- **Error** in lemos-2017 at proof of Theorem1.1, preprint p.5 (line194): the source says the Jacobian of X₀(37) has rank zero; it should have rank one, and its rational-point exhaustion needs a separate argument; affects the proof.

The two disputed Bilu–Parent–Rebolledo displays and the maximal-order assertion were also inspected on the rendered original pages974–975, so these are not inferred from missing OCR bars or fractions. The rank-zero countercheck uses the conductor37 quotient y²+y=x³−x: P=(0,0) has5P=(1/4,−5/8), hence is not torsion by the integral-coordinate torsion criterion on this minimal model. The package already avoids the rank-zero and maximal-order-type errors; S01–S02 concern the two errors it newly imported.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "87258183ee76306250b32c2396228d19393d7638", "job": "RT-EllipticModularityEffectiveComparisons~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
