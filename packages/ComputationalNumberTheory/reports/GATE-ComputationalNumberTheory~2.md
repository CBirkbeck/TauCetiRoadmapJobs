## H01 (CBirkbeck) — applied differently

`TauCetiRoadmap/ComputationalNumberTheory/README.md:116` and `:2652` now assign the shared primitives here and specify the consumer comparisons, `:1792` supplies the generic joint-reduction criterion, and `:2477` reduces affine finiteness to existing IntegralLattices Layer 2, milestone 2A by clearing denominators, rather than assigning new work to that existing roadmap. EffectiveDiophantineMethods at head `5499fdb` still independently claims these objects in §§0.1–0.3, 1.7–1.8, 3.2–3.4 and 3.17–3.18; its supplier/adaptor edits are outside the authorized files, so the cross-roadmap coordination remains unresolved and must precede merging both roadmaps.

## H02 (CBirkbeck) — applied

`TauCetiRoadmap/ComputationalNumberTheory/README.md:94`, `:333`, `:2383` and `:2617` now cite ContourIntegration Layer 3 instead of Layer 2, consistently using the null-homologous argument principle and its star-convex specialization. The hypotheses retain an open neighborhood, analyticity and nonvanishing off the finite zero/pole set, meromorphic orders, boundary avoidance and null-homology, together with the two conductor-one pole corrections; the pinned declarations are in `TauCeti/Analysis/Contour/Argument/Cycle.lean:110` and `TauCeti/Analysis/Contour/StarConvex.lean:210`.

## H03 (CBirkbeck) — applied

`TauCetiRoadmap/ComputationalNumberTheory/README.md:1561` adds the coefficient- and Hecke-compatible equivalence from the localized integer Fourier lattice to R15.2's L_q, then identifies residual scalar extension with the geometric reduction image for p>3 before theta/Hasse is used in §§3.14–3.15. The inverse reads the Miller pivot coefficients (Stein line 1134, Stein line 1162); the Checks retain the zero-dimensional space, Δ, the weight-38 kernel and the characteristic-three weight-14 Katz counterexample, and `TauCetiRoadmap/ComputationalNumberTheory/Suggested.lean:349` documents the comparison without changing any acceptance signature.

### Signatures, sources and ownership

All 69 declarations were checked with fully qualified `#check @name` in one scratch file and elaborated successfully; every printed type was compared with the README. No required binder disappeared and no mathematical signature changed: completeness in the DVR theorem, finite generation and spanning in the multiplier theorem, local normal form and ellipticity, prime instances on residual tensors, quotient generation and ambient torsion in saturation, and all analytic denominator guards remain present. The earlier signature transcript's unqualified-name errors do not occur in this check.

The content main is `72d2b66`; the library pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. `Mathlib/LinearAlgebra/TensorProduct/Basis.lean:63` and `Mathlib/LinearAlgebra/TensorProduct/Tower.lean:657` supply actual basis and operator scalar extension, not a geometric reduction theorem. R15.1, “Level-one and level-two descent”, and R15.2, “The integral cusp lattice and its reduction image”, were read at AlgebraicModularFormsAndSerreWeights head `4e550b1`; the geometric step in §3.13a retains the inverted-6 hypothesis. No new geometric carrier or generic coefficient lattice is claimed here.

The shared ball and root contracts were compared with EffectiveDiophantineMethods §§0.1–0.3 and 0.9, and its local-image, saturation and ellipsoid contracts with §§1.7–1.8, 3.2–3.4 and 3.17–3.18. The normalized ball is the primitive here (CarusoPublished line 922); general-completion balls and selected-value enclosure proofs remain consumer refinements. Rectangular root data forget extra squarefreeness/embedding labels; a disc-to-rectangle restriction requires the selected root in the disc interior, with a new independent isolation otherwise. Local-image comparisons retain the coordinate isomorphism and square witnesses, and saturation retains ambient p-torsion. The affine comparison consumes IntegralLattices milestone 2A on main (`TauCetiRoadmap/IntegralLattices/README.md:772`); it does not revise IntegralLattices or its completed foundational roadmap. The affine interpretation is supported by deWeger line 2357 and deWeger line 2376; the joint-reduction argument generalizes the elementary kernel argument accompanying Siksek line 820 and is proved explicitly in §3.25.

Ownership searches covered objects on main, board packages, the supplied 26 sibling roadmap folders and the indexed open roadmap heads. Other occurrences concern different constructions, such as HabiroNahmSeries §3's divisibility of ring embeddings and HeegnerPointEulerSystems' integral Kummer comparisons; they do not replace the shared primitive interfaces at issue here. ComputationalNumberTheory occurs at merge-order position 158 and EffectiveDiophantineMethods at 203, so importing the latter here would reverse the permitted direction. No supplier was moved upward and no existing roadmap was replanned; the only added supplier is the already-owned IntegralLattices bounded-norm result. Every cross-roadmap citation was resolved against main or the supplied/indexed new-roadmap head, including the R15.1 title, ContourIntegration's Layer-2/Layer-3 distinction, HeightsRationalPointsAndObstructions §1.17, and the existing ClassicalArithmeticCompletion and NumberFieldArithmetic contracts. The four ClassicalArithmeticCompletion names flagged by the preliminary citation inventory are planned declarations explicitly present in its main README; `PrattTree.validList` is declared here at line 93.

All source texts used for these changes were legal cached extractions. The existing Zhou reference was fetched legally and verified at Zhou line 234; its pre-existing omission from `packages/ComputationalNumberTheory/sources.toml` remains because that manifest is outside the authorized files. No required text is unread; the settled mattuck waiver was not reopened.

### Adversarial mathematics record

The following are instance calculations, not proofs of the admitted general theorems. Decimal values are diagnostic numerical approximations; exact residues, fractions, subgroup orders and polynomial evaluations are exact. “Retained” means no mathematical change in this repair. The first table covers every Lean declaration; the subsequent tables cover the added comparisons, standing conventions and the remaining prose targets.

| Statement | Instances tried | Computed values on the two sides or defining conditions | Result | Change |
| --- | --- | --- | --- | --- |
| `IsolatedAlgebraicRoot` | X; X²; X²−1 on [−2,2]×{0} | Distinct root counts 1,1,2; the last fails unique existence | Pass | Retained |
| `IsolatedAlgebraicRoot.value` | Singleton roots 0,1/2 | Values 0,1/2; X(0)=0 and (X−1/2)(1/2)=0 | Pass | Retained |
| `RabinCriterion` | X²+X+1 over F₂; X²+1 over F₅; 1 | X⁴ mod f=X and gcd=1; second gcd=f; natDegree(1)=0 rejects | Pass | Retained |
| `rabin_iff_irreducible` | Same quadratics and constant | Truth pairs true/true, false/false, false/false | Pass | Retained |
| `PrattTree` | Leaf; nodes (3,2,[2]), (1,0,[]) | Stored values 2,3,1, including invalid raw 1 | Pass | Retained |
| `PrattTree.value` | Leaf; nodes with n=0,1 | Decoded 2,0,1 | Pass | Retained |
| `PrattTree.nodeConditions` | (3,2,[2]); (9,2,[2,2,2]) | Child products 2,8; 2² mod3=1 but 2⁸ mod9=4; first Lucas exclusion 2≠1 | Pass | Retained |
| `PrattTree.valid` | Leaf; preceding nodes | True,true,false; 9 fails 4=1 | Pass | Retained |
| `PrattTree.validList` | []; [leaf]; [node1] | True,true,false; empty list has no failing entry | Pass | Retained |
| `PrattTree.sound` | Valid presentations of 2,3,5 | Prime values 2,3,5; witness2 gives 2⁴ mod5=1, 2² mod5=4 | Pass | Retained |
| `PrattTree.complete` | 2,3,5 | Leaf; node3 with child2; node5 with two child2s, products 1,2,4 | Pass | Retained |
| `prattBitSize` | Trees for 2,3,5,7 | Sizes 1,7,10,16; repeated leaves add 2 at 5 | Pass | Retained |
| `prattBitSizeList` | []; [leaf]; [leaf,leaf] | 0,1,2 | Pass | Retained |
| `pratt_small_tree` | 2,3,5,7,17; trial C=2 | Sizes 1,7,10,16,15 ≤ 8,8,18,18,50; C=1 fails at7 since16>9 | Pass | Retained |
| `StrongLiar` | 7; 9; 2047 at base2; n=0,1,2 | Six bases at7, two at9; 2¹⁰²³ mod2047=1; forbidden n reject | Pass | Retained |
| `strongLiar_card_le` | 9,15,25,2047 | 4·counts=8,8,16,968 ≤ bounds 8,14,24,2046 | Pass | Retained |
| `aksOrder` | (9,2); (2,2); (2,0) | Orders 1,0,0; 2 in ZMod0=ℤ has no positive power1 | Pass | Retained |
| `aksLen` | 0,1,2,9 | 1,1,2,4 | Pass | Retained |
| `aksParameter` | 0,1,2,9 | 0,0,2,3; at9 order mod2=1≤64, gcd(9,3)=3 | Pass | Retained |
| `AKSIdentities` | n5,r2; n9,r2,ℓ0,1 | Characteristic5 gives equality; empty range true; at9 remainders4X+4≠X+1 | Pass | Retained |
| `AKSAccepts` | 0,1,2,9 | False,false,true,false; 9=3² fails nonpower clause | Pass | Retained |
| `aks_correct` | 0,1,2,9 | Acceptance/primality pairs F/F,F/F,T/T,F/F | Pass | Retained |
| `pocklington_prime` | 17,F8,a3; 25,F8,a7 | 3¹⁶ mod17=1, gcd(3⁸−1,17)=1,64>17; 7¹² mod25=1 makes gcd25 reject | Pass | Retained |
| `henselLift` | p7,k1,2,X²−2; p2,k2,X² | 3 lifts to10 with10² mod49=2; X² and (X+2)² agree mod4, so repeated residue factors fail uniqueness premise | Pass | Retained |
| `henselFactor_completeDVR` | ℤ₂ and F₂[[t]], X(X−1); factor 1 | Pairs (X,X−1) and (1,f) retain their products and distinct coprime reductions | Pass | Retained |
| `multiplierRing` | 0 and ℤ inside ℚ | Stabilizers ℚ and ℤ; (1/2)·1=1/2∉ℤ | Pass | Retained |
| `IsPMaximal` | ℤ in ℚ; ℤ[2i] at2; p1 | Denominator1 works in first; odd multiple of i never in ℤ[2i]; 1 divides every denominator | Pass | Retained |
| `pRadicalLattice` | ℤ,p0,1,3 | Radicals 0,ℤ,3ℤ; 1 never has a positive power in3ℤ | Pass | Retained |
| `pRadical_multiplier_eq_iff` | ℤ at2; ℤ[2i] at2 | Multiplier of2ℤ isℤ, true/true; radical2ℤ[i] has multiplierℤ[i], false/false | Pass | Retained |
| `phiExpansion` | φ=X−1,f=X²; f=0; index3 | Coefficients1,2,1,0 give (X−1)²+2(X−1)+1=X²; zero gives0 | Pass | Retained |
| `coefficientValuation` | p3,a0,3X+9,X² | ∞,1,0, ignoring zero coefficients | Pass | Retained |
| `IsPhiNewtonSide` | X²−3; (X−3)² at3; zero | Endpoints(0,1),(2,0) give−1/2; (0,2),(2,0) give−1; zero has no finite endpoints | Pass | Retained |
| `phiResidualPolynomial` | Those inputs at3 | Residuals Y−1,(Y−1)²,0; no spurious Y² in the first | Pass | Retained |
| `ore_residual_irreducible` | X²−3 at3; (X−3)² at3; X²−25 at5 | Residual Y−1 is irreducible, giving(e,f)=(2,1); other residuals (Y−1)²,Y²−1 are reducible | Pass | Retained |
| `isSquare_iff_isSquare_mod` | ℚ₂ units17,5; ℚ₅ unit6; π²=2 | 17≡1,5≡5 mod8: true,false; 6≡1 mod5: true; (1+π)²=3+2π | Pass | Retained |
| `card_padicRoots_eq` | X²−2 at7,2,3; linear polynomial | Root and degree-one-prime counts 2=2,0=0,0=0,1=1; ramified(2,1) and inert(1,2) excluded | Pass | Retained |
| `integralModularLattice` | E₄,E₄/2,constant1 | First coefficients(1,240),(1/2,120),(1,0) give membership T,F,T | Pass | Retained |
| `integralCuspLattice` | Δ,Δ/2,weight0 | a₁=1,1/2 give T,F; weight0 has dimension 0 | Pass | Retained |
| `exists_millerBasis` | k0,2,12 | Ranks0,0,1; empty bases, empty bases, Δ with pivot1 | Pass | Retained |
| `exists_integralModularBasis` | k0,2,12 | Ranks1,0,2; pivots{0},∅,{0,1}; E₄³−720Δ and Δ give identity pivot matrix | Pass | Retained |
| `levelOne_congruence_sturm` | k12,p2,Δ,2Δ; k0,constant1 | Δ fails pivot1≡0; 2Δ coefficients2,−48≡0; constant1 fails at index 0 | Pass | Retained |
| `IntegralHeckeAction` | k12,p=2; k2 | T₂Δ=−24Δ, whereas zero operator gives0≠−24; dimension 0 admits zero operator | Pass | Retained |
| `ResidualCuspSpace` | k2,12,38; p2,79 | Dimensions0,1,2; 1⊗Δ has pivot1, 1⊗pΔ pivot0 | Pass | Docstring identifies §3.13a |
| `residualHecke` | k12,T₂ atp5,p=2; k38,T₇₉ atp79 | Scalars1,0; matrix times(47,1)=(158,1185)≡(0,0) | Pass | Retained |
| `NonordinaryLevelOnePair` | 79/38; 107/26; zero,pΔ | det=−395≡0 mod79; a₁₀₇≡106≠0; zero and pΔ have every coefficient0 modp | Pass | Retained |
| `nonordinary_pairs_lt_200` | 79/38;107/26; eight lower weights and their p+3−k partners | True/true;false/false; 16 distinct listed pairs; weight2 has dimension 0 | Pass | Retained |
| `weight82_companion_system` | p107,k26,ℓ2,3 | 59·45≡87 and6·53≡104; inverse-direction exponent25 gives56,95 | Pass | Added coefficient/geometric comparison to its route |
| `OrdinaryCompanionPair` | 107/26; p=2; zero vectors | Companion82, twist81; no k with2≤k<2; vector 0 fails nonzero clause | Pass | Added comparison to its route |
| `ordinary_companion_list` | Six listed pairs;151/52,151/100 | Companion weights82,120,106,150,162,146; six gcds1; excluded candidates have gcd3 | Pass | Retained |
| `localImageSpan` | Empty list; real x=−1/2,2 for y²=x³−x | Orders1,2; sign vectors(+,-,-),(+,+,+) | Pass | Retained |
| `localImageSpan_eq_range_of_card_padic` | Same curve overℚ₂; x1/4; x−4,−16,−23 | Required8=(1+3)·2; single class gives2; triple gives8 | Pass | Retained |
| `localImageSpan_eq_range_of_card_real` | Real cubics X³−X,X³+1 | 2·2=1+3 and2·1=1+1 | Pass | Retained |
| `exists_complete_localImage_padic` | ℚ₂, abscissae−4,−16,−23 | f=−60,−4080,−12144; v₂=2,4,4; odd parts1 mod8; eight distinct products of square-class vectors | Pass | Retained |
| `exists_complete_localImage_real` | X³−X,x−1/2,2; X³+1,empty list | f=3/8,6>0, span2; second span 1=image 1 | Pass | Retained |
| `localImage_of_good_odd` | p5,cubics X³−X,X³+X+1,X³+1 | Root counts3,0,1, factor counts3,1,2, norm-kernel/image orders4,1,2 | Pass | Retained |
| `IsPSaturated` | 6ℤ atp5,2,3; ℤ×ℤ/2 andG=ℤ×0 | T,F,F; 2(0,1)=0∈G but(0,1)∉G | Pass | Retained |
| `pSaturationCriterion_iff` | Full rational group of y²=x³−x at2; subgroup0,empty list | Full group has torsion4 and only the zero class among four coefficient classes divisible by2, both sides true; G0 misses torsion, both sides false | Pass | Retained |
| `complexBoxSet` | {0}×{1};{0}×{0};[1,2]×[−1,1] | First contains i, excludes0; second{0}; third excludes0 | Pass | Retained |
| `digamma_series_remainder` | z1,N1,2; z2,N1; z0 | Errors0,0,1/2 ≤ bounds0,0,1; z0 violates positive-real-part guard | Pass | Retained |
| `trigamma_series_remainder` | z1,N1,2 | Errorsπ²/6−1≈0.644934,π²/6−5/4≈0.394934 ≤1,1/2 | Pass | Retained |
| `exists_disjoint_root_presentations` | 1,(X−1)²,X²+1; excluded0 | Root lists∅,{1},{i,−i}, sizes0,1,2; zero has infinitely many roots | Pass | Retained |
| `hurwitzEMPartial` | t1,N=m1,s0,2,1 | −1/2,79/48,61/48−log2; s=1 branch retains−log2 | Pass | Retained |
| `dirichletEMPartial` | q1,s2; oddχ mod4,s0 | 79/48; 1/4−(−1/4)=1/2; atq4,s2 the normalization is1/16 | Pass | Retained |
| `bernoulliBound` | m0,1,2 | 1,13/6,121/30; signed cancellation at2 would yield119/30 | Pass | Retained |
| `dirichlet_eulerMaclaurin_remainder` | q1,s2,N=m1,σ₀=B2; s0 | Absolute error≈0.0008992665≤13/6; at s0 rising factorial0 and error0 | Pass | Retained |
| `cuspMellinPartial` | f=0; N0; k18,s9; k12,s6 | 0;0; integrand t⁸−t⁸=0; integrand2t⁵ pins positive sign | Pass | Retained |
| `cusp_mellin_tail` | f0,k=s12,N3; N0; k18,s9 | Error0; guards25.1327>11 and1.5<6.2832 atN3; N0 fails6.2832>11; central k18 error0 | Pass | Retained |
| `platt_bounded_height` | q1,400000; strip pointRe(s)=1/2 | H=100000000,387.5; conclusion1/2=1/2; odd-modulus substitution at400000 would wrongly give293.75 | Pass | Retained |
| `platt_central_nonvanishing` | Conductor1 and odd conductor4 at1/2 | ζ(1/2)≈−1.460354509; β(1/2)≈0.667691457, both nonzero | Pass | Retained |

| Added comparison or convention | Instances tried | Computed values | Result | Change |
| --- | --- | --- | --- | --- |
| §3.13a localization and inverse | k=2,12; coefficient a=1/2 in O_(ℚ,5) | Dimensions0,1; (1/2)⊗Δ maps to Δ/2 and pivot inverse returns1/2; denominators at2 are not units in O_(ℚ,2) | Pass | Explicit O-linear equivalence |
| §3.13a reduction image and Hecke comparison | k=12,p5; k=38,p79; p3,k14 | T₂ scalars−24≡1 on both sides; T₇₉·(47,1)=(158,1185)≡0 on both sides; characteristic-zero S₁₄=0 while Katz AΔ has a₁=1 | Pass | Geometric comparison requires p>3 and targets the reduction image |
| §3.25 generic joint reduction | A=ℤ,G=3ℤ,p2,ψ mod2; G=2ℤ; A=ℤ/2,G0 | Generator3↦1 gives injective map; 2↦0 fails injection and2·1∈G; last domain0 injects but2·1=0 and ambient torsion condition fails | Pass | Generic criterion and three controls added |
| §4.26 affine finiteness via integral norms | G=1/2,t=1/2,R=1/8,a=D=2; x0,1,2 | u=2x−1=−1,1,3; norms u²=1,1,9 equal aD²(x−t)ᵀG(x−t); bound aD²R=1 retains 0,1 and excludes 2 | Pass | Existing IntegralLattices 2A supplies finiteness |
| P-adic enclosure adapter | p3,c5,N1; c0,N2 | Normalized tuples(1,0,2),(2,2,0); norm(5−2)=1/3 matches radius; zero ball radius1/9 contains0 | Pass | Preserve entire ball and selected-value containment |
| Rectangular/disc root adapter | Root i, disc centre i radius1/2; root1 on unit-disc boundary | Box[−1/4,1/4]×[3/4,5/4] has farthest distance√(1/8)<1/2 and contains one root of X²+1; boundary root has distance1=radius and fails interior condition | Pass | Preserve value; state disc restriction guard |
| Coordinate-rich local image adapter | y²=x³−x atℝ | x−(−1,0,1) at−1/2 has signs(+,-,-); at2 signs(+,+,+); group order2 remains2 under isomorphism | Pass | Coordinates remain consumer data |
| Fincke–Pohst membership adapter | G1,t1/2,R1/4; G0,R0 | First exact set {0,1}, both boundary values1/4; second native sublevelℤ infinite, whereas empty totalization is∅ | Pass | Comparison assumes positive definiteness |
| Contour orientation and pole sign | Counterclockwise rectangle containing0, f(z)=z and1/z | Normalized log-derivative integrals1,−1 equal orders+1,−1; clockwise reverses both windings | Pass | Layer3 cited throughout |
| Null-homology guard | Annulus1/2<abs(z)<2, f(z)=z, unit circle,S=∅ | Normalized integral1≠empty sum0; winding about omitted0 is1, so null-homology fails | Pass | Retained essential hypothesis |
| Zero-ring, universe and group guards | Zero ring; trivial group; S₃; Q₈ | 0=1 excludes field; trivial saturation true; (12)(23)=(123)≠(132)=(23)(12), ij=k≠−k=ji exclude AddCommGroup | Pass | No extra generality asserted |
| Prime and characteristic conventions | p0,1,2,3; F₂[ε]/ε² | 0,1 fail prime; 2,3 included; ε≠0 but ε²=0 exercises Frobenius kernel; positive-characteristic local-square input excluded by CharZero | Pass | Retained |
| Saturation iff, both directions | Cyclic groups of orders 1–8, every subgroup, p0–5 | 120 instances agree with torsion-plus-intersection condition; subgroup 2ℤ/6 at2 gives F/F, at3 T/T | Pass | Generic hypotheses retained |
| Matrix column convention | Weight38 matrix at79 | (u,v)↦(3u+17v,25u+10v); determinant−395; vector(47,1) gives(158,1185) | Pass | Same convention in localized and residual comparison |
| Fourier and twist conventions | E₄,E₆,Δ; companion atℓ2,3 | Constant terms1,1,0; first coefficients240,−504,1; companion twists yield87,104, reverse exponent56,95 | Pass | Witnesses agree across affected layer |
| Local-index convention and supplier | y²=x³−x overℝ,ℚ₂,ℚ₅ | (1+3)/2=2, 2(1+3)=8, 1+3=4; unramified quadratic overℚ₂ would give4·4=16 | Pass | General-completion data are not identified with ℚ_p records |
| Closed membership and dimension 0 | Affine ellipsoid n0,R0,−1; G0,n1,R0 | Empty vector has value 0, counts1,0 respectively; zero form admits all integers, infinite | Pass | Guards retained |
| Total valuations, precision and inverse | c0,N2; c=1/3,N0; 3+O(3⁴) | Native v_p(0)=0 differs from stored v=2; tuple(0,−1,1) has centre1/3; inverse precision4−2=2 | Pass | Canonical record contract explicit |

### Remaining README targets

Each row names a prose target or identity not already represented by a separate Lean declaration above. For definitions with several API clauses, the values exercise their defining condition as well as the listed invariance/boundary clauses.

| Statement | Instances tried | Computed values | Result | Change |
| --- | --- | --- | --- | --- |
| §0.9 rational root presentation | 0,1/2 | Linear polynomials vanish at0,1/2; singleton rectangles contain precisely those values | Pass | Retained |
| §0.9a isolation existence | Repeated root0 of X²; roots±1 of X²−1 | Singleton0 selects one distinct root; boxes{−1},{1} are disjoint | Pass | Retained |
| §0.10 addition | 1/2+1/3;0+0 | Values5/6,0, annihilated by X−5/6,X | Pass | Retained |
| §0.11 multiplication | 1/2·1/3;0·1/3 | Values1/6,0 | Pass | Retained |
| §0.12 nonzero inverse | 1/2;0 | Inverse2 with product 1; zero fails nonzero guard | Pass | Retained |
| §0.13 equality/common root | 1/2 and2/4;1/2 and1/3 | First equality/common-root both true; second both false since1/2−1/3=1/6≠0 | Pass | Retained |
| §0.14 canonical ball | p3,(0,−1,1);(2,2,0); candidate(2,0,3) | Centre1/3,0; third has p dividing mantissa and rejects | Pass | Ownership made explicit |
| §0.16 finite-field presentation | F₄=F₂[α],α²+α+1=0; degree1 | α²=α+1, cardinal4=2²; degree1 quotient identifies a with chosen root a | Pass | Retained |
| §0.17 inverse and composition | F₃,b=X+2,c=X+1; F₇,b=c=2X | b∘c=X, c∘b=X mod3; latter composite4X≠X, while c=4X repairs inverse since8X=X | Pass | Retained |
| §1.8 prime Miller–Rabin input | n7,a1..6 | All 6 bases pass; n2 is excluded by oddness | Pass | Retained |
| §1.10 independent rounds | n9,k0,1,2 | Accepting counts1,2,4; 4^k times counts1,8,64 equal8^k | Pass | Retained |
| §1.13a substitution composition/equality | E=F₃[X]/(X²−1),ξ=[X] | ξ³=ξ, so σ₁=σ₃=id; σ₁σ₃=σ₃; 1≡3 mod2 | Pass | Retained |
| §1.13a Frobenius substitution | Same E,p3 | (a+bξ)³=a+bξ³=a+bξ, matching σ₃ | Pass | Retained |
| §1.13a multiplicativity and exponent multiplication | Same E,n3,j3,a=ξ,b=2 | (2ξ)³=2ξ=σ₃(2ξ); ξ⁹=ξ=σ₉(ξ) | Pass | Retained |
| §1.13a image upper bound | n=p2,r31,degree5 | Frobenius image has32 elements but2^(2 floor√5)=16; prime-power exclusion prevents false upper bound | Pass | Retained |
| §1.13a image lower bound | n3,p3,r2,ℓ1 | E has9 elements and evaluation image F₃ size3≥2¹−1=1; p3>r2 | Pass | Retained |
| §1.13a growth contradiction | n2,r101,ord₁₀₁(2)=100,ℓ41 | len2=2;100>16; 2⁴¹−1>2²⁰;41>40 | Pass | Retained |
| §1.15 prime divisor congruence | n17,F8,a3 | Only prime divisor 17 has16 divisible by8; gcd(3⁸−1,17)=1 | Pass | Retained |
| §1.17 Pocklington data | Three child2s,F8 for17; empty list | Product8,64>17; empty product 1 failsF>1 | Pass | Retained |
| §1.18 Pocklington soundness | Same data for17 | Child prime 2; witness3 gives1 mod17 and gcd1;17 prime | Pass | Retained |
| §1.19 integer factor data | −1;12;0 | −empty product=−1;2·2·3=12; signed products never0 | Pass | Retained |
| §1.20 factor-data soundness | −12 | Signed product−(2·2·3)=−12; prime divisors{2,3} each occur | Pass | Retained |
| §1.21 integer factor existence | 1,−1,12 | Empty,empty,[2,2,3] with appropriate signs | Pass | Retained |
| §1.22 finite-field factor data | F₅,X²+1;constant1 | (X−2)(X−3)=X²+1, scalar 1; constant has empty product 1 | Pass | Retained |
| §1.23 normalized factors | F₅,2(X−2)² | Leading coefficient 2; multiset two copies ofX−2; monic product times2 gives input | Pass | Retained |
| §1.24 factor existence | Same nonzero polynomial;zero | c2,one factor exponent2; zero cannot have nonzero scalar product | Pass | Retained |
| §1.25 factor transport | Identity F₅; Frobenius onF₄ | Identity leaves X²+1=(X−2)(X−3); Frobenius sends(X−α)² to(X−α²)² and preserves2-factor multiplicity | Pass | Retained |
| §1.26 finite pairwise lift | p7,1,(X−3),(X+3) | Lifts1,(X−10),(X+10); productX²−100≡X²−2 mod49 | Pass | Retained |
| §1.26a finite complete-DVR lift | F₂[[t]],1,X,X−1 | ProductX(X−1), same pairwise coprime reductions | Pass | Retained |
| §1.27 rational factor data | (X−1)²;constant2;zero | [X−1,X−1];empty list withc2;zero excluded | Pass | Retained |
| §1.28 rational factor existence | 2X²+3X+1;X⁴+1 | 2(X+1/2)(X+1); X⁴+1 isΦ₈ and irreducible overℚ even though reductions are never irreducible | Pass | Retained |
| §2.1 order basis | [1] inℚ;[1/2];empty | 1²=1 and unit coordinate1; (1/2)²=1/4 not integer multiple1/2; rank 0 cannot span 1 | Pass | Retained |
| §2.4 Frobenius nilradical | F₂[ε]/ε²,dimension 2,k1;F₂ | (a+bε)²=a, kernel{0,ε}=nilradical; field kernel 0 | Pass | Retained |
| §2.7 integral basis | ℚ;ℚ(i) | Bases[1],[1,i], ranks1,2;1/2 not integral inℚ | Pass | Retained |
| §2.8 extending full orders | ℤ[2i]⊂ℚ(i) | Basis[1,2i] enlarged to[1,i], same rank 2 and index2 | Pass | Retained |
| §2.9 prime decomposition | ℚ,p3;ℚ(i),p=2;rawp1 | (3)¹;(2)=(1+i)² up to ideal unit, exponent2; empty product is unit ideal | Pass | Retained |
| §2.19a uniformizer change | X²−3,π3 andπ′−3 | ResidualY−1 becomesY+1 by c=−1,u=h=1 | Pass | Retained |
| §2.19a polygon product | (X−3)²;(X−3)(X−9) | Slopes−1,−1 with residual(Y−1)²; product has slopes−2,−1 rather than mean−3/2 | Pass | Retained |
| §2.19a residual product | (X−3)² at3 | (Y−1)(Y−1)=(Y−1)², retaining repeated factor | Pass | Retained |
| §2.19a slope factorization | (X−3)(X−9);φ² | Factors slopes−1,−2; φ² contributes only the length2,−∞ part | Pass | Retained |
| §2.19a residual factorization | X²−25 at5; (X−3)² at3 | Residual(Y−1)(Y+1) gives two degree1 factors; repeated residual exponent2 gives no irreducibility conclusion | Pass | Retained |
| §2.20 extension invariants | X²−3 at3 | Ramification2,residue degree1, product2=polynomial degree2 | Pass | Retained |
| §2.21 local digit data | π⁻¹ withv−1,N1,digit1;zero;input1 at zero centre | First error0; zero error 0; last error norm 1 > norm π rejects | Pass | Retained |
| §2.22 ramified square witness | π²=2,u3+2π | (1+π)²=3+2π; remainder modulo4π is0 | Pass | Retained |
| §2.23 separable sum of root counts | (X−1)(X−2) overℚ₃ | Two linear factors each contribute 1, total 2 roots | Pass | Retained |
| §3.3 basis uniqueness | k12,Δ and2Δ | Pivots1 versus2; onlyΔ has required pivot1 | Pass | Retained |
| §3.5 equality of finite coefficient data | k12,0 andΔ;bound0 constants | Constant coefficients0=0 but a₁0≠1 rejects equality; k0 includes constant coefficient | Pass | Retained |
| §3.6 recurrence uniqueness | k12,p2,n1 | a₁(T₂Δ)=a₂Δ=−24; zero map would give0 | Pass | Retained |
| §3.7 column matrix | k12,p=2; k2 | 1×1 matrix[−24],det−24; empty matrix det1 | Pass | Retained |
| §3.8 coefficient 107 | ΔE₄²E₆ | 35830422465487817813321292 mod107=106=−1 | Pass | Retained |
| §3.9 ordinary reduction | Same coefficient | 106≠0 inF₁₀₇ | Pass | Retained |
| §3.10 determinant and gcd | k38,p79 | det30−425=−395=−5·79;gcd(37,80)=1 | Pass | Retained |
| §3.12 first primes | p59,k16; p79,k38 | Witness prime59 precedes79;gcd(15,60)=15 rejects first filter,gcd(37,80)=1 passes second | Pass | Retained |
| §3.13 filtered list | Eight lower weights and partners | gcd(k−1,p+1)=1 selects79,151,173,193; sixteen pairs from eight partners | Pass | Retained |
| §3.17 character sum | F₅,y²=x³+x+1; singularx³ | Characters1,−1,1,1,1 sum3, point count9 and trace−3; singular sum0,count6 | Pass | Retained |
| §3.18 local data, empty and incomplete | RealX³+1,empty;ℚ₂,X³−X,x1/4 | Image1=empty span 1; f(1/4)=−15/64 square but span2<required8 | Pass | Ownership clarified |
| §3.22 torsion/intersection and finite-index characterizations | G6ℤ⊂ℤ,p2,3,5 | Index6; saturationF,F,T agrees with2 divides6,3 divides6,5 does not | Pass | Ownership clarified |
| §3.23 quotient-generation variant | A=ℤ/3, p=2,G=A,empty list; A=ℤ/2,G0 | G/2G=0 despite nontrivialG, saturation true; second ambient2-torsion2 not contained in0 rejects | Pass | Retained |
| §3.24 rational-point divisibility | P=O; p=2; nonzero candidateP2Q | O=2O; nonzero polynomial degree4=p²; rootx(Q) satisfies Φ₂−x(P)ΨSq₂=0 | Pass | Retained |
| §3.25 elliptic reduction application | Finite reduction group order9,p3;order5,p3 | Quotient orders3,1 respectively; only divisible group order contributes a nontrivial test | Pass | Generic criterion added above application |
| §3.26 finite criterion application | g=(Q,2Q),p2,free quotient | Coefficient(0,1) gives2Q=2·Q, hence nonzero divisibility class and failure of independence | Pass | Retained |
| §4.1 signed product | [−2,3]·[−4,5];[−1,1]² | Corner products8,−10,−12,15 give[−12,15]; second[−1,1] | Pass | Retained |
| §4.2 product containment | x3,y5; x−2,y5 | Products15,−10 lie in[−12,15], attaining upper boundary15 | Pass | Retained |
| §4.3 partial reciprocal | [2,4];[−4,−2];{0} | [1/4,1/2];[−1/2,−1/4];none | Pass | Retained |
| §4.4 reciprocal containment | x−3 in[−4,−2] | −1/2≤−1/3≤−1/4 andx≠0 | Pass | Retained |
| §4.5 dyadic hull | p2,x1/3;p0,x−1/3;zero | [1/4,1/2];[−1,0];{0}; repeated rounding unchanged | Pass | Retained |
| §4.6 rounding width | Same singleton examples | Width1/4<1/2 atp=2; width1<2 atp0;0<2·2^(−p) forzero | Pass | Retained |
| §4.8 unique integer | [3/4,5/4];[0,1];{1/2} | Integer sets{1},{0,1},∅; returned 1,none,none | Pass | Retained |
| §4.9 known integral recovery | z1 in[3/4,5/4];unknown real1/2 in[−1,1] | First returned 1 equalsz; second is not integer, so enclosure does not force zero | Pass | Retained |
| §4.10 normalization | p3,c5,N1;c0,N5;c9,N2 | Tuples(1,0,2),(5,5,0),(2,2,0); 9 in9ℤ₃ has zero residue | Pass | Ownership clarified |
| §4.11 p-adic addition | (1+O(3²))+(2+O(3³)) | Centre3,precision2,tuple(2,1,1); swapping summands same | Pass | Retained |
| §4.12 p-adic multiplication | O(3²)·O(3⁴); (3+O(3⁴))(1/3+O(3²)) | Precisions6 and3,centres0 and1; zero tuple(6,6,0) | Pass | Retained |
| §4.13 inverse precision | 3+O(3⁴);unit atprecision4;zero ball | Inverse1/3+O(3²);unit stays precision 4;zero ball rejected | Pass | Retained |
| §4.14 kernel | x0,1,−1 | 2/π²≈0.202642,0.061462,0.454147; positivity and asymmetry retained | Pass | Retained |
| §4.15 positive tail | α1,b0,N0 | First50-term total≈0.281431<geometric bound0.320576; tail bound has denominator1−e⁻¹>0 | Pass | Retained |
| §4.16 alternating tail | α1,b1/2,N1 | Truncated diagnostic error≈0.024768<first omitted 0.029985; threshold α(N+1)=2≥1 | Pass | Retained |
| §4.17 scalar 0 | ℓ1,w0 | z0=1/2+iπ; φ uses real parts1/4,3/4, avoiding poles0,−1,… | Pass | Retained |
| §4.17 scalar 1 | ℓ1,2 | 8/π²≈0.810569,16/π²≈1.621139 | Pass | Retained |
| §4.17 scalar 2 | ℓ1,w0 | zF=1/2+iπ/2; real part1/2>0 and2ℓ=2>0 | Pass | Retained |
| §4.17 scalar 3 | ℓ1,w0 | z1=1+iπ; weighted tail first index 1 has αn=1,meeting monotonicity threshold | Pass | Retained |
| §4.17 scalar 4 | ℓ1,2 | Same exact 8/π²,16/π² as slot1 | Pass | Retained |
| §4.17 scalar 5 | ℓ1 | Value 4π²(1+cosh(1/2))/(1/4+π²)²≈0.8202; positive denominator | Pass | Retained |
| §4.17 scalar 6 | ℓ1,w0 | zG=1/2+iπ, real part1/2>0; tail parametersα1,b1/2 | Pass | Retained |
| §4.17 scalar 7 | ℓ1,w0 | Slot0=4·slot7 by multiplying each of four summands by4; ratio remains4 | Pass | Retained |
| §4.17a weighted alternating remainder | α1,N0 and1 | First omitted bounds r(1)≈0.061462 and2r(2)≈0.02777; thresholds1,2 both≥1 | Pass | Retained |
| §4.18 scalar enclosures | ℓ1,P5;ℓ2,P4 | Values0.810569∈[0.8,0.82],width1/50≤1/32;1.621139∈[1.6,1.64],width1/25≤1/16 | Pass | Retained |
| §4.19a character pole cancellation | χ mod4,s1 | χ1+χ2+χ3+χ4=1+0−1+0=0; polar coefficients cancel, unlikeχ1 ofconductor 1 | Pass | Retained |
| §4.20 continued Dirichlet enclosure | ζ(2);ζ(0) | π²/6≈1.644934∈[8/5,5/3],width1/15<1/8; ζ(0)=−1/2 singleton | Pass | Retained |
| §4.20a Mellin identity sign | k12,s6;k18,s9 | i¹²=1 gives2t⁵;i¹⁸=−1 gives0; N0 finite sum 0 | Pass | Retained |
| §4.21 cusp enclosures | f=0;Δ and−Δ | Singleton0 valid; L(Δ,12) positive and reflected value negative, with target intervals[1/2,3/2] and[−3/2,−1/2] | Pass | Retained |
| §4.21a completed normalization | q=1; q4,a1,s2 | Scalar multipliers1 and4^((2+1)/2)=8 agree with(q/π)^((s+a)/2) versusπ^(-(s+a)/2) | Pass | Retained |
| §4.21a horizontal argument direction | Positive constantf; reciprocal of same | Both f′/f=0, argument0; reversing a nonzero integral changes its sign | Pass | Retained |
| §4.21a contour count and poles | q1,zero-free small band | CountN0 minus two poles = −2, normalized integral−2; dropping poles would give0 | Pass | Contour layer corrected |
| §4.21a count difference | Zero-free band;conjugate zero pair | Differences0 and2 respectively; the two positive-count terms sum2 | Pass | Retained |
| §4.21a integrated identity | Band withconstant N=M andZχ=Zconj=0 | IntegrandM,integralhM equalsleft hM | Pass | Retained |
| §4.21a Turing bound | q1,t₀51,h1 | Bound1.8397+0.1242log(52/(2π))≈2.102; all log arguments positive | Pass | Retained |
| §4.21a critical-function sign choice | ε and−ε,values(+1,−1) | Sign products−1 in both choices; number of sign changes1=1 | Pass | Retained |
| §4.21a count completeness | M0,U1/2;M2,U5/2 | Integers0≤N≤1/2 give N=0;2≤N≤5/2 give N=2; overlapping intervals cannot certify two distinct roots | Pass | Retained |
| §4.24 no real strip zeros | Hypothetical realzero,s1/4 or1/2 | First contradictsRe(s)=1/2 since1/4≠1/2; second excluded by nonzero central values | Pass | Retained |
| §4.25 nonnegative-vector bound | B0,A=[[0,1],[1,0]],x(1,1) and(1,−1) | Values0≤2 for first;0≤−2 false forsecond, which fails nonnegativity | Pass | Retained |
| §4.26 affine-set definition | G1,t1/2,R1/4; n0 | Set {0,1}; empty vector has value 0 and belongs iff R≥0 | Pass | Integral-lattice comparison added |
| §4.27 completeness/cover | G1,t0,R1/2 and1 | Sets{0}⊂{−1,0,1}; every nonzero integer norm≥1>1/2 | Pass | Existing finiteness consumed |
| §4.28 Loewner bound | A=I,B0,x(1,−1) | Values2 and0; differencepositive definite handles mixed signs | Pass | Retained |
| §4.29 negative witness | I=[−2,−1],t1;t0 | Upper quadratic−1<0 andt≠0; zero quadratic0 fails | Pass | Retained |
| §4.30 enclosed Gram negativity | A=−3/2 inI=[−2,−1],t1 | Avalue−3/2≤ upper−1<0 | Pass | Retained |
| §4.31 effective cover | G1,R1,S{−1,0,1} | Nonnegative filter{0,1}; exact boundary1 retained,−1 removed | Pass | Retained |
| §4.32 validity scaling | I=[−2,−1],t1,scale2 | Upper quadratic−1→−4,nonnegative vector1→2;zero rejected | Pass | Retained |
| §4.33 finite-family validity | Empty;  one valid row;append zero row | Empty conjunction true;−1<0 true;appended 0<0 false | Pass | Retained |
| §4.34 multiplicity lift | m(2,3),A6,K[[1,2],[2,4]],t(2,3);m0 | Lift five ones:expanded 30−64=−34;reduced 8−24−18=−34;zero-block expanded 0 differs from formal−1 | Pass | Retained |
| §5.1 family interpretation | Two1×1 rowsA=−3/2,−7/4,both I=[−2,−1],t1 | Actual values−3/2,−7/4 are both ≤−1<0;empty family has zero exhaustiveness claims | Pass | Retained |

### Build, gate and commit

Committed the two authorized content files as `fbe8e9db` with message `ComputationalNumberTheory: review repairs (ownership contracts, contour supplier, and Fourier lattice comparison)`. The worktree is clean and nothing was pushed.

`lake build TauCetiRoadmap.ComputationalNumberTheory.Suggested` exited 0 with the 32 expected admitted-target warnings and no errors:

```text
Build completed successfully (9016 jobs).
```

The 69-declaration scratch signature elaboration exited 0 without errors. The dependency direction check exited 0 with no UPWARD or CYCLE line; its complete output is:

```text
depcheck: 27 roadmaps, 235 edges, 0 problem(s)
```

The final gate exited 0:

```text
gate ComputationalNumberTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
