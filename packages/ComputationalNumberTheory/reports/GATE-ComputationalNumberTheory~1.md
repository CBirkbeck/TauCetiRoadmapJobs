## H01 (CBirkbeck) — applied

The API catalogue is replaced by 32 headline theorems with only their 37 necessary definitions and data bundles in `TauCetiRoadmap/ComputationalNumberTheory/Suggested.lean:6` (203 named declarations → 69, 1781 lines → 593). The acceptance statements now include the full nonordinary classification, simultaneous companion eigensystems, complete local descent images, finite elliptic saturation and quantitative continued L-function remainders, matching the existing targets in README §§3.13–3.26 and §§4.19a–4.20a.

## H02 (CBirkbeck) — applied

Every advertised headline is statable at the pins, as the module docstring explains at `TauCetiRoadmap/ComputationalNumberTheory/Suggested.lean:22`: the residual cusp spaces use the native tensor product of the integral Fourier lattice with an algebraic closure of the prime field. `TauCetiRoadmap/ComputationalNumberTheory/Suggested.lean:341` binds the integer operators to the full Fourier recurrence, and scalar extension supplies the actual common-eigenvector statements without an opaque carrier, free predicate or weakened substitute.

## H03 (CBirkbeck) — applied

All 56 value-computing or boundary examples and the routine API theorems are absent from `TauCetiRoadmap/ComputationalNumberTheory/Suggested.lean`, including the interval, Gram, recurrence-uniqueness and boundary-control catalogue. Arbitrarily narrow enclosure existence is replaced in the acceptance test by the explicit native Dirichlet and cusp-form error bounds at `TauCetiRoadmap/ComputationalNumberTheory/Suggested.lean:542` and `TauCetiRoadmap/ComputationalNumberTheory/Suggested.lean:563`, while the README retains the presentation APIs and discriminating Checks.

## H04 (CBirkbeck) — applied

The API bullets and references in `TauCetiRoadmap/ComputationalNumberTheory/README.md:397` onward describe facts in prose instead of claiming undeclared Lean names; redundant assertions that boundary Checks have Lean counterparts are removed. All 69 remaining Lean names occur in the README, the new residual-space and analytic-expression definitions have APIs and three or more discriminating Checks, and the citation resolver reports no missing roadmap citations or Lean names.

### Signature and carrier verification

All 69 declarations were checked with `#check @name` in one scratch signature file, elaborated through the prescribed targeted build, and each printed type was compared with its README statement. No required binder disappears: the Rabin finite-field instance, complete-DVR completeness, finite-order generation and spanning, local ellipticity and normal form, residual prime instances, saturation quotient-generation and torsion conditions, and both analytic denominator guards are present. The originally flagged `PresentationChange` belonged to the deleted catalogue; its raw substitution data did not itself need finiteness. The general local-image existence statements transport a₁=a₃=0 by proved local instances, and the saturation headline now ranges over the actual rational-point group with finite coefficient vectors.

The pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, verified in both the supplied content checkout and the build's packages. Native-carrier checks included:

- `Mathlib/Order/Interval/Basic.lean:35`: a pair of endpoints with their order proof; it carries no signed-product or reciprocal convention.
- `Mathlib/LinearAlgebra/TensorProduct/Tower.lean:657` and `Mathlib/LinearAlgebra/TensorProduct/Basis.lean:63`: scalar extension of actual linear maps and bases; these permit the companion statements without constructing geometric modular forms.
- `Mathlib/NumberTheory/Bernoulli.lean:194`, `Mathlib/RingTheory/Polynomial/Pochhammer.lean:50`, and `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean:53`: the Bernoulli sign, rising factorial and completed-Gamma normalization.
- `Mathlib/NumberTheory/ModularForms/LFunction.lean:61` and `Mathlib/NumberTheory/ModularForms/LFunction.lean:134`: the native Fricke factor i^k and uncompleted L-function; no raw divergent Dirichlet series replaces continuation.
- `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/XSubT.lean:505`, `:794`, `:961`: the actual square-class group, descent homomorphism and its multiplication-by-two kernel; `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/TwoTorsion.lean:57` gives the root/torsion count.
- `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/BadPrimes.lean:114` and `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroupA.lean:129`: good-prime conditions and the intrinsic unramified square-class subgroup. The native definition of bad primes includes divisors of two, the discriminant and coefficient denominators.
- `TauCeti/NumberTheory/NumberField/Global/Orders/ProperIdeal.lean:38`: the native multiplier ring takes fractional ideals of an order; the retained adapter takes arbitrary integer submodules, including zero. `TauCeti/NumberTheory/LocalField/Squares.lean:121` supplies the square-neighborhood input, with its characteristic hypothesis.

### Sources and ownership

The source checks used legal cached texts; the general claims are supported by the following locators, independently of the finite controls below.

| Target | Resolved source |
| --- | --- |
| Rabin equivalence | Shoup line 20535, Exercise 20.2(a), printed p.524 |
| Pratt soundness/completeness and size | PrattNotes lines 34,76,89, printed pp.2–4; the tree bit measure charges every repeated child |
| Strong-liar bound | Shoup line 12442, Theorem 10.3 and its prime-power/CRT proof, pp.309–312 |
| AKS equivalence | Shoup line 21678 and Lemmas 21.6–21.11, pp.553–558 |
| Pocklington criterion | Thery lines 248–274; the proof uses √n<F, giving the retained n<F² statement |
| Hensel factors, arbitrary complete DVR | MilneANT lines 5346–5389, Theorem 7.33, Lemmas 7.34–7.35 and Remark 7.36; the correction proof uses completeness, monicity and coprimality, not a finite residue field |
| p-radical multiplier criterion | NumberRings lines 1107–1130, especially Proposition 9.3 at line 1125 |
| Ore irreducibility | GMN lines 684–722, Theorem 1.19 and Corollary 1.20; residual exponent one is essential |
| Local squares; local root count | MilneANT line 5320, Theorem 7.32; MilneANT lines 5929–5941, Proposition 8.2, with the named local/global invariant suppliers |
| Miller and full integral bases, congruence bound | Stein lines 1134–1169, Lemma 2.20 and Remark 2.21; Theorem 9.18, printed pp.171–172 |
| Nonordinary and companion systems | CG13 lines 255–270,464–467,536–564; BCG lines 326–338 and Remark 3.3. The twist witnesses are 87 and 104 at primes two and three, not 56 and 95 |
| Local descent images | FPS lines 631–715 supplies concrete genus-two local calculations; HeightsRationalPointsAndObstructions §1.17 supplies the general dimension-one index used here; mattuck Theorem 7, p.114 remains settled as waived |
| Finite elliptic saturation | Siksek lines 804–824 and equations (39)–(41), pp.17–19; the retained form includes ambient p-torsion and quotient-generation |
| Digamma/trigamma and continued Dirichlet remainder | DLMF line 254, equation 5.7.6; DLMF15 line 64, equation 5.15.1; DLMF25 lines 213,419, equations 25.11.4,25.11.7, with the even-order integration-by-parts bound |
| Cusp Mellin remainder | Pinned `ModularForm.weakFEPair` and `ModularForm.L` above; DLMF8 line 122, equation 8.2.2 for the finite integrals |
| Platt theorems | Platt lines 955–978, Theorems 7.1–7.2, pp.14–15 |

The existing Zhou citation was resolved legally at Zhou line 234, and its obsolete line locator was corrected. Its work is absent from `packages/ComputationalNumberTheory/sources.toml`; that manifest is outside the two authorized content files, so no manifest edit was made. There is no unread required source; the Mattuck waiver was not reopened.

Cross-roadmap contracts were resolved on main for ModularForms Layers 7–11, EllipticCurves Layers 1,3,4,6,7, LocalFieldsRamification Layers 0–2, NumberFieldArithmetic Layers 3,5,7 and §§5.3,5.5, ContourIntegration Layer 2, RealAlgebraicGeometry Layers 1–4, PolynomialGaloisGroups Layer 5, NewtonPolygons §§0.1,0.3,3.2, ClassicalArithmeticCompletion §§3.3,3.5,3.25,3.27,3.48,5.1–5.3,5.10–5.11,5.16,5.22, FormalLaurentPuiseux L5 and GlobalNumberFields Layer 11. The new-roadmap heads supply AlgebraicModularFormsAndSerreWeights R15.2,R15.3,R15.5, HeightsRationalPointsAndObstructions §1.17 and ZerosOfLFunctions §§4.1,4.3–4.4,4.9,7.1–7.2a and Layer 9; the existing-roadmap revisions were not used as suppliers.

Ownership was checked by object across main, board packages and all twelve provided open-roadmap checkouts: ConformalMappingPartII, EffectiveClassNumbers, AbelianSchemesAndArithmeticModuliPartII, GanGrossPrasadUnitaryGroups, SelmerIwasawaCohomologyPartII, QSeriesPartitionsAndMockModularForms, K3SurfacesAndSymplecticBoundedness, CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers and ArithmeticDynamics. The added acceptance statements formalize this roadmap's existing Fourier-lattice, finite local-image and quantitative-remainder targets; their bundles specialize native linear maps and tensor products, while coherent modular-form geometry, generic local indices and intrinsic orders retain their named owners. No ownership moved and no supplier was added.

### Adversarial mathematics record

Each row records actual values or finite algebraic computations for a retained or added declaration. The decimal integration values are numerical controls, not certified enclosures or proofs; the admitted general statements rely on the source arguments, and the cusp numerical comparison is conditional on the coefficient bound expressly present in that theorem.

| Statement | Instances tried | Computed values | Result | Change |
| --- | --- | --- | --- | --- |
| `IsolatedAlgebraicRoot` | X; X²; X²−1 in [−2,2]×{0} | Distinct root counts 1,1,2; first two isolate 0, last fails uniqueness | Pass | Retained; no mathematical change |
| `IsolatedAlgebraicRoot.value` | Singleton presentations of 0 and 1/2 | Decoded values 0 and 1/2; polynomial evaluations 0 and 0 | Pass | Retained; no mathematical change |
| `RabinCriterion` | X²+X+1 over F₂; X²+1 over F₅; constant 1 | First: X⁴ mod f=X and gcd(X²−X,f)=1; second gcd(X⁵−X,f)=f; degree(1)=0 rejects | Pass | Retained; no mathematical change |
| `rabin_iff_irreducible` | Same two quadratics; monic constant 1 | True↔true; false↔false; false↔false | Pass | Replaced separate soundness/completeness API with the irreducibility equivalence |
| `PrattTree` | Leaf; raw nodes (3,2,[2]), (1,0,[]) | Values 2,3,1; raw syntax retains the invalid value 1 | Pass | Retained; no mathematical change |
| `PrattTree.value` | Leaf; node (0,0,[]); node (1,0,[]) | 2,0,1 respectively; no hidden primality in decoding | Pass | Retained; no mathematical change |
| `PrattTree.nodeConditions` | (3,2,[2]); (9,2,[2,2,2]); (1,0,[]) | 3: product=2, 2² mod3=1, 2 mod3=2; 9: 2⁸ mod9=4≠1; 1 fails 3≤n | Pass | Retained; no mathematical change |
| `PrattTree.valid` | Leaf; trees for 3 and 9 | True, true, false; malformed-node bound prevents n=0,1 | Pass | Retained; no mathematical change |
| `PrattTree.validList` | []; [leaf]; [invalid node 1] | True, true, false; empty conjunction agrees with list membership | Pass | Retained; no mathematical change |
| `PrattTree.sound` | Leaf; valid trees for 3,5; invalid node 9 | Values 2,3,5 are prime; node 9 has false premise (2⁸ mod9=4) | Pass | Retained; no mathematical change |
| `PrattTree.complete` | Primes 2,3,5 | Leaf; witness 2 with child [2]; witness 2 with children [2,2]; validity true in all three | Pass | Retained; no mathematical change |
| `prattBitSize` | Trees for 2,3,5,7 | Sizes 1,7,10,16; for 5, two leaf occurrences are charged twice | Pass | Retained; no mathematical change |
| `prattBitSizeList` | []; [leaf]; [leaf,leaf] | Sizes 0,1,2 | Pass | Retained; no mathematical change |
| `pratt_small_tree` | Primes 2,3,5,7,17; trial C=2 | Sizes 1,7,10,16,15 ≤ 8,8,18,18,50; C=1 fails at 7 (16>9), so C must be existential | Pass | Retained; no mathematical change |
| `StrongLiar` | n=7,9,15,25; 2047 at base 2; n=0,1,2 | Liar counts 6,2,2,4; 2¹⁰²³ mod2047=1 although 2047=23·89; small forbidden n reject | Pass | Retained; no mathematical change |
| `strongLiar_card_le` | Odd composites 9,15,25 | 4·2=8≤8; 4·2=8≤14; 4·4=16≤24; prime 7 would give 24>6 and is excluded | Pass | Retained; no mathematical change |
| `aksOrder` | (n,r)=(9,2),(2,2),(2,0) | Orders 1,0,0; nonunits have total order zero and cannot meet the coprime/order branch | Pass | Retained; no mathematical change |
| `aksLen` | n=0,1,2,9 | Lengths 1,1,2,4, retaining the zero convention | Pass | Retained; no mathematical change |
| `aksParameter` | n=0,1,2,9 | Parameters 0,0,2,3; at n=9,r=2 the order is 1≤64, while gcd(9,3)=3 | Pass | Retained; no mathematical change |
| `AKSIdentities` | n=5,r=2; n=9,r=2,l=0 and l=1 | Frobenius gives equality at 5; empty family true at 9; at j=1 remainders 4X+4 and X+1 differ | Pass | Retained; no mathematical change |
| `AKSAccepts` | n=0,1,2,9 | False,false,true,false; 9=3² is excluded before the congruence branch | Pass | Retained; no mathematical change |
| `aks_correct` | n=0,1,2,9 | Predicate/primality pairs false/false,false/false,true/true,false/false | Pass | Retained; no mathematical change |
| `pocklington_prime` | n=17,F=8,a=3; n=25,F=8,a=7; a=0,1 | 17: 3¹⁶ mod17=1, gcd(3⁸−1,17)=1,64>17 and gcd(F,(n−1)/F)=2; 25: gcd(7¹²−1,25)=25 rejects; a=0,1 have gcd n after natural subtraction | Pass | Retained; no mathematical change |
| `henselLift` | p=7,k=1,2,f=X²−2; noncoprime p=2,k=2 | Roots 3→10, and 10² mod49=2; at modulus4 both X·X and (X+2)²=X² give distinct pairs, excluded by coprimality | Pass | Retained; no mathematical change |
| `henselFactor_completeDVR` | Z₂ with X(X−1); F₂[[t]] with same input; constant factor 1 | Lift pairs (X,X−1) and (1,f) have exactly the prescribed products and reductions in both characteristics | Pass | Retained; no mathematical change |
| `multiplierRing` | I=0 and I=Z in Q | Multiplier rings Q and Z; (1/2)·1=1/2∉Z excludes the larger wrong ring | Pass | Retained; no mathematical change |
| `IsPMaximal` | R=Z⊂Q,p=2; R=Z[2i]⊂Q(i),p=2; p=1 | First true with denominator 1; i has no odd denominator in Z[2i], false; p=1 has no admissible denominator | Pass | Retained; no mathematical change |
| `pRadicalLattice` | R=Z⊂Q,p=0,1,3 | Lattices 0,Z,3Z; at 3, 3³∈3Z but 1ᵏ∉3Z for every positive k | Pass | Retained; no mathematical change |
| `pRadical_multiplier_eq_iff` | Z at p=2; Z[2i] at p=2 | Multiplier of 2Z is Z: true↔true; radical 2Z[i] has multiplier Z[i]≠Z[2i]: false↔false; full field fails the FG hypothesis | Pass | Retained; no mathematical change |
| `phiExpansion` | φ=X−1,f=X²; f=0; index 3 | Coefficients 1,2,1 then 0; (X−1)²+2(X−1)+1=X²; zero input gives 0 at every index | Pass | Retained; no mathematical change |
| `coefficientValuation` | p=3,a=0,3X+9,X² | Values ∞,1,0; zero coefficients are excluded by support | Pass | Retained; no mathematical change |
| `IsPhiNewtonSide` | p=3,φ=X,f=X²−3; f=(X−3)²; f=0 | Valuation points (0,1),(2,0) give slope −1/2; points (0,2),(1,1),(2,0) give −1; zero has only ∞ and no finite side | Pass | Retained; no mathematical change |
| `phiResidualPolynomial` | Same two inputs; f=0 | Normalized endpoint coefficients −1,1 give Y−1; 1,−2,1 mod3 give (Y−1)²; zero gives 0 | Pass | Retained; no mathematical change |
| `ore_residual_irreducible` | X²−3 at 3; (X−3)² at 3; X²−25 at 5 | Residuals Y−1 irreducible, (Y−1)² reducible, Y²−1 reducible; only first meets the premise and has e=2,f=1 | Pass | Retained; no mathematical change |
| `isSquare_iff_isSquare_mod` | Q₂ units 17,5; Q₅ unit 6; π²=2 | Residues modulo8:1,5 give true/false; 6 mod5=1 gives true; (1+π)²=3+2π pins 4π rather than the base prime | Pass | Retained; no mathematical change |
| `card_padicRoots_eq` | f=X²−2,K=Q(√2),p=7,2,3; linear f over Q | Root counts 2,0,0 agree with counts of (e,f)=(1,1) primes:2,0,0; ramified (2,1) and inert (1,2) contribute zero; linear case gives 1=1 | Pass | Retained; no mathematical change |
| `integralModularLattice` | E₄; E₄/2; weight-zero constant 1 | Coefficients begin (1,240), (1/2,120), (1,0); integrality true,false,true; span equals this additive Z-stable condition | Pass | Retained; no mathematical change |
| `integralCuspLattice` | Δ; Δ/2; weight zero | Positive coefficients (1,−24), (1/2,−12); integrality true,false; weight-zero cusp dimension 0 | Pass | Retained; no mathematical change |
| `exists_millerBasis` | Weights 0,2,12 | Dimensions 0,0,1; first two bases empty, weight12 basis Δ has first coefficient 1 | Pass | Retained; no mathematical change |
| `exists_integralModularBasis` | Weights 0,2,12 | Dimensions 1,0,2; pivots {0},∅,{0,1}; at12 E₄³−720Δ and Δ have pivot rows (1,0),(0,1) | Pass | Retained; no mathematical change |
| `levelOne_congruence_sturm` | k=12,p=2,f=Δ and 2Δ; k=0,f=1 | Δ has a₀=0,a₁=1 and fails premise; 2Δ has 2,−48 divisible by2; constant 1 is rejected at index0, excluding a cusp-only bound | Pass | Retained; no mathematical change |
| `IntegralHeckeAction` | Weight12,p2; zero space at weight2; weight38,p79 | T₂Δ=−24Δ; the zero operator gives 0≠−24 at coefficient1 and is rejected; weight2 has the unique zero endomorphism; weight38 has matrix [[3,17],[25,10]] mod79 | Pass | Added only a bundle of integer endomorphisms tied to the native prime recurrence |
| `ResidualCuspSpace` | Weights2,12,38; p=2 and79 | Dimensions 0,1,2; 1⊗Δ≠0 but 1⊗pΔ=0, since p=0 in the scalar field | Pass | Added the native tensor-product specialization needed by the companion headlines |
| `residualHecke` | T₂ at weight12 modulo5 and2; T₇₉ at weight38 modulo79 | Scalars −24 mod5=1 and −24 mod2=0; [[3,17],[25,10]]·(47,1)=(158,1185)≡(0,0) | Pass | Added scalar extension of the actual integer operators, not arbitrary residual matrices |
| `NonordinaryLevelOnePair` | k=38,p=79; k=26,p=107; zero or pΔ | Matrix [[3,17],[25,10]] has determinant −395≡0; weight26 a₁₀₇≡106≠0; zero and pΔ have no nondivisible coefficient | Pass | Added native integral-form kernel definition, equivalent to the existing determinant target |
| `nonordinary_pairs_lt_200` | CG13 eight lower weights and p+3−k partners; concrete 79/38 and 107/26 | Sixteen distinct pairs result; (79,38) true on both sides, (107,26) false on both; the weight-two cusp dimension is zero | Pass | Added the complete classification headline; CG13 lines 536–564 and 270 fix both directions |
| `weight82_companion_system` | Normalized f=ΔE₄²E₆ at l=2,3 modulo107 | a₂=−48≡59,2⁸¹≡45 gives b₂=87; a₃=−195804≡6,3⁸¹≡53 gives b₃=104; exponent25 would give 56,95 | Pass | Added one common nonzero eigenvector for every prime other than107, on the residual cusp space |
| `OrdinaryCompanionPair` | (p,k)=(107,26); p2; zero candidate vector; (151,52) | Companion weight82 and twist81; p2 has no k with 2≤k<p; zero vector fails v≠0; 151/52 has companion100 but gcd(51,150)=3 | Pass | Added an intrinsic residual eigenvector predicate with both all-prime equations and p-eigenvalue nonvanishing |
| `ordinary_companion_list` | Six listed pairs; candidate (151,52),(151,100) | Companion weights82,120,106,150,162,146; all six gcd(k−1,p−1)=1; the two 151 candidates have gcd3 and are outside the list | Pass | Added the advertised simultaneous companion and coprimality theorem; no exhaustiveness claim |
| `localImageSpan` | Empty list; W:y²=x³−x over R with xs=[−1/2,2] | Span orders 1 and 2; signs of x−(−1,0,1) are (+,−,−) and (+,+,+) | Pass | Retained; no mathematical change |
| `localImageSpan_eq_range_of_card_padic` | Same curve over Q₂; xs=[1/4]; xs=[−4,−16,−23] | Target (1+3)·2=8; first span order2 fails premise; second span order8 equals the full image; odd-prime factor would give the wrong 4 | Pass | Retained; no mathematical change |
| `localImageSpan_eq_range_of_card_real` | y²=x³−x; y²=x³+1 | First has r=3 and #H=2, so 2·2=4=1+3; second r=1 and trivial #H=1, so 2=2 | Pass | Retained; no mathematical change |
| `exists_complete_localImage_padic` | Q₂, y²=x³−x, xs=[−4,−16,−23] | f-values −60,−4080,−12144; v₂=2,4,4, unit parts 1 mod8; three independent classes generate 8 | Pass | Added all-prime existence on rational abscissae; normal form transported by proved local instances |
| `exists_complete_localImage_real` | y²=x³−x, xs=[−1/2,2]; y²=x³+1, xs=[] | f-values 3/8 and 6 are positive and span order2; second has target1, so the empty span equals the image | Pass | Added real-place existence on rational abscissae |
| `localImage_of_good_odd` | p=5, cubics X³−X,X³+X+1,X³+1 | Root counts 3,0,1; factor counts 3,1,2; norm-kernel/image orders 4,1,2; p=2 gives order8 and is excluded | Pass | Added the native unramified norm-kernel equality; general local images remain all-prime targets |
| `IsPSaturated` | 6Z⊂Z,p=5,2,3; A=Z×Z/2,G=Z×0 | True,false,false; for the last, 2(0,1)=0∈G but (0,1)∉G | Pass | Retained; no mathematical change |
| `pSaturationCriterion_iff` | E:y²=x³−x,G=E(Q), two independent torsion generators,p=2; G=0,m=0; g=(Q,2Q) | Finite coefficient counts 4 with exactly one divisible combination; both sides true. For G=0 ambient 2-torsion has order4, so both sides false. On y²=x³−2, Q=(3,5), 2Q=(129/100,−383/1000), b=(0,1) witnesses failure | Pass | Replaced free-group catalogue statements with the finite criterion on actual elliptic points, retaining quotient generation and ambient torsion |
| `complexBoxSet` | {0}×{1}; {0}×{0}; [1,2]×[−1,1] | i is in the first, 0 is not; second denotes {0}; third excludes 0 | Pass | Retained; no mathematical change |
| `digamma_series_remainder` | z=1,N=1,2; z=2,N=1; z=0 | Errors 0,0,1/2 against bounds 0,0,1; z=0 has a zero denominator and fails Re z>0 | Pass | Retained; no mathematical change |
| `trigamma_series_remainder` | z=1,N=1,2; z=2,N=1 | Errors 0.644934…,0.394934…,0.394934… ≤ bounds 1,1/2,1 | Pass | Retained; no mathematical change |
| `exists_disjoint_root_presentations` | f=1,(X−1)²,X²+1; excluded f=0 | Lists have lengths 0,1,2, values ∅,{1},{i,−i}; zero polynomial would have infinitely many roots | Pass | Retained; no mathematical change |
| `hurwitzEMPartial` | t=1,N=m=1,s=0,2,1; N=0,s=0 | Values −1/2,79/48,61/48−log2; at N=0,s=0 still −1/2; the s=1 branch avoids division by zero | Pass | Added necessary finite approximation with an explicit polar-free branch |
| `dirichletEMPartial` | q=1,s=2; odd q=4 character at s=0,1,N=m=1 | Values 79/48,1/2,0.7858867666…; q^(−s) at q4,s2 is 1/16, excluding the unnormalized sum | Pass | Added the normalized finite character sum |
| `bernoulliBound` | m=0,1,2; B₂ at 0,1/2 | Constants 1,13/6,121/30; ∣B₂∣ at the two points is 1/6,1/12≤13/6; using signed cancellation at m2 would give 119/30 | Pass | Added the explicit positive remainder constant |
| `dirichlet_eulerMaclaurin_remainder` | q=1,s=2,N=m=1,σ₀=B=2; odd q4 at s=1 and s=0 | Errors ≈0.0008992665≤13/6; ≈0.0004886032≤13/12; 0≤0 at s0; q=0 and principal s=1 excluded | Pass | Replaced bare rational-enclosure existence with the advertised quantitative native L-function bound |
| `cuspMellinPartial` | f=0; N=0; k=18,s=9 | Values 0,0,0; at the centre the integrand is t⁸−t⁸=0, whereas k12,s6 gives 2t⁵ | Pass | Added only the finite split Mellin expression needed by the tail headline |
| `cusp_mellin_tail` | Δ,k=s=12,N=3,C=1000 contract; k18,s9; N0 at k=s12 | Three-term value ≈0.9945438721, 158-term L-sum≈0.9945436929, difference≈1.792·10⁻⁷ below bound≈6.7423·10⁻⁴; central k18 error0; at N0 first guard 2π>11 is false | Pass | Replaced bare cusp-L enclosure existence with a two-tail inequality carrying coefficient/prefactor bounds and positive-denominator guards |
| `platt_bounded_height` | q=1,4,399999,400000 | H=100000000,25000000,293.7502343756…,387.5; even-q bound at 400000 differs from the odd-q value 293.75, fixing modulus parity | Pass | Retained; no mathematical change |
| `platt_central_nonvanishing` | Conductor1 and odd conductor4 characters at s=1/2 | Alternating-series bounds give ζ(1/2)∈[−2.4143,−0.7070] and β(1/2)∈[0.4226,1], both excluding zero; q=2000001 is outside the stated range | Pass | Retained; no mathematical change |

| Shared convention or changed interface | Instances tried | Computed values | Result | Change |
| --- | --- | --- | --- | --- |
| Native fields and commutative groups | Zero ring; S₃; Q₈; trivial additive group | 0=1 excludes a field; (12)(23)=(123)≠(132)=(23)(12), and ij=k≠−k=ji exclude the nonabelian groups from AddCommGroup; the trivial group's saturation predicate is true | Pass | No extra generality claimed |
| Frobenius and inseparability | F₂, X²+X+1 and X² | First derivative 1 and irreducible; second derivative 0 and X⁴−X is not divisible by X² | Pass | Rabin accepts only the first |
| Prime and characteristic guards | p=0,1,2,3; characteristic-two local coefficients | 0,1 not prime; F₂ and F₃ remain included in finite-field targets; characteristic two is excluded by CharZero in the local square theorem | Pass | Explicit binders retained |
| Closed rectangles and repeated roots | X² and X²−1 | Distinct root counts 1 and2, irrespective of multiplicities | Pass | Native presentations retain unique distinct roots |
| Width-one modular normalization | E₄,E₆,Δ | Constant terms 1,1,0 and first coefficients 240,−504,1; E₄³−720Δ has first two coefficients 1,0 | Pass | Same normalization in lattice, Hecke and companion statements |
| Column Hecke matrices | Weight38 at79, vector (u,v) | Matrix sends it to (3u+17v,25u+10v), det=−395; (47,1) maps to (158,1185)≡0 | Pass | No transpose ambiguity |
| Companion twist direction | p107,k26,l=2,3 | Twisted eigenvalues 87,104; opposite exponent gives 56,95; 2²⁵·87≡59 and 3²⁵·104≡6 | Pass | Added two-term README witness |
| Local index normalization | y²=x³−x over R,Q₂,Q₅ | (1+3)/2=2; (1+3)·2=8; (1+3)·1=4 | Pass | Recomputed against supplier §1.17 |
| Signed interval and Gram facts retained in prose | [−1,1]²; reciprocal [−4,−2]; block sizes (2,3) | Product [−1,1]; reciprocal [−1/2,−1/4]; both expanded and reduced quadratic values −34; zero block gives 0≠−1 | Pass | Lean API/Check mirrors deleted, mathematical targets retained |
| Finite coefficient representatives | p2, b=1; g=(Q,2Q) | Fin2 contains 1; b=(0,1) gives 2Q on both sides and is nonzero | Pass | No rounded odd-prime convention omits the dyadic candidate |
| Enclosure normalization retained in prose | CT lengths1,2 | Shared Fourier slots 8/π²≈0.810569 and 16/π²≈1.621139, inside the stated rational intervals | Pass | Bare density consequences removed from Lean |

### Build, gate and commit

`lake build TauCetiRoadmap.ComputationalNumberTheory.Suggested` exited 0, with the 32 expected admitted-target warnings and no errors:

```text
Build completed successfully (9016 jobs).
```

The dependency direction check exited 0, with no UPWARD or CYCLE line; its complete output was:

```text
depcheck: 13 roadmaps, 100 edges, 0 problem(s)
```

The final gate exited 0 on the clean committed worktree. Its exact summary line was:

```text
gate ComputationalNumberTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Commit: `8444931` — `ComputationalNumberTheory: review repairs (headline acceptance tests and prose API)`.
Only `TauCetiRoadmap/ComputationalNumberTheory/README.md` and `TauCetiRoadmap/ComputationalNumberTheory/Suggested.lean` changed in the worktree; nothing was pushed.
