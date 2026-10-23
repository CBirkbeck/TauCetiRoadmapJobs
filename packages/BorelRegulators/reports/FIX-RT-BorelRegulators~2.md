# BorelRegulators repair report

The two reviews have six numbered findings. Headings retain their original finding IDs; each section's body identifies review a or b to distinguish repeated IDs. The earlier-round audit tables and source observations are corroborating material, not additional numbered findings.

## F01 (P2) — applied

Review a: “Not statable” → native analytic acceptance theorem dedekindZeta_continuation_leadingTerm, named in §1.3. Its hypotheses require analyticity off 1 and agreement with the pinned Dedekind series on Re(s)>1. They assume neither the order nor the coefficient. Added the zero/doubled-function Check and exact analytic API contracts; retained integer exponents and the punctured limit.

## F02 (P2) — applied

Review a: Unrestricted SL₁(D) structure request → number field, finite-dimensional central division algebra, degree a≥2, in both exact-contract locations. Section 3.4 now tests SL₁(F)={1}, dimension 0, against the geometric SL₂ and SL₃ dimensions 3 and 8. AdelicAlgebraicGroups §3.4 explicitly includes D=F; its carrier is not being replaced.

## F01 (P2) — applied

Review b: Additional order-finite-generation gap → factorization through the maximal-order lattice and ArithmeticKTheory §3.4’s actual rational inclusion equivalence. Deleted the gap and all its README uses. Section 5.5 now proves finite index m and exact covolume m·R_Bo, updates its API and Needs, and tests the nonmaximal order ℤ[2i] and rank zero.

## F02 (P2) — applied

Review b: Self-supplied borel-period-contract entry → deleted from this package’s gaps. The consumer paragraph identifies it as Polylogarithms’ contract in ordinary prose. Polylogarithms’ supplied §“From the symbol and regulator roadmaps” contains that request; no target here consumes it. All ten remaining gaps name other suppliers and have matching exact-contract lines.

## F03 (P2) — applied differently

Review b: Four abbreviated requests → quantified objects, hypotheses, maps and normalizations in both contract locations. The Deligne request explicitly uses the twisted character, consistent with §§2.1 and 6.2; the infinitesimal request binds n≥1 and distinguishes complex CE/Weil from underlying-real CE coefficients. Added local index-three and complex-versus-real gl₁ Checks. No acceptance-test padding was added.

## F04 (P2) — not actionable in this package: re-raised ownership and placement decision requires a human

Review b: Corrected the package-local supply claims: deleted both earlier-consumer bullets and the point-case supply sentence; Scope names ColemanIntegration’s existing finite-Galois Beilinson theorem and HeightsRationalPointsAndObstructions’ direct Poonen input. The remaining overlap is the previously recorded MERGE-ORDER decision in packages/BorelRegulators/reports/FIX-PKG-BorelRegulators~2.md. This package cannot settle another roadmap’s ownership, placement or targets.

## Mathematical evidence and repair boundaries

For a/F01, Mathlib/Analysis/Analytic/Basic.lean:110, Mathlib/Analysis/Analytic/Order.lean:48 and Mathlib/Analysis/Calculus/IteratedDeriv/Defs.lean:55 supply every analytic carrier used. In particular, analyticOrderAt returns 0 without analyticity; here n≥2 gives 1−n≠1, so that branch is excluded. The coefficient denominator d! is a positive integer, including 0!=1. Analytic uniqueness on the connected domain ℂ minus {1} identifies every admissible Z with the supplier’s continuation; its value at 1 is immaterial. LFunctions Layer 3 explicitly supplies agreement on the half-plane, analyticity off the pole and the completed functional equation. No continuation construction is replanned here.

The completed equation, with gamma factors Γ(s/2)^r₁Γ(s)^r₂, gives exactly r₂ poles at 1−n when n is even and r₁+r₂ when n is odd. Their residues are nonzero rational multiples of powers of π; the discriminant contribution is Δ^(n−1/2)=Δ^(n−1)√Δ. Removing the poles therefore gives the exponent d−Nn and a nonzero rational coefficient. Conjugation uniqueness makes the coefficient real. The analytic factorization Z(s)=(s−(1−n))^d g(s), with g analytic and nonzero at 1−n, proves the stated derivative coefficient and punctured limit. Source anchors are borel1977 line 137–139 and line 611–615; the completed-function normalization is read in LFunctions Layer 3. This is a theorem about the named Dedekind series, not an arbitrary function with a presumed leading term.

For b/F01, the essential input is stronger than an equality of ranks. ArithmeticKTheory §3.4, borel_rank_order, says that the actual inclusion R→F induces the rational equivalence. GeneralAlgebraicKTheory §3.2 supplies composition for the ring maps R→O_F→F. Thus Λₙ(R)⊂Λₙ and its rational span is all of span_ℚ Λₙ. A subgroup H of ℤ^d with full rational span has finite index: choose d independent elements of H, whose integer coordinate determinant is nonzero; their span already has finite index. Hence H is discrete and spanning in the real space, without any assumption about finite generation of the source K-group. Mathlib/Algebra/Module/ZLattice/Covolume.lean:148 gives covolume(H)/covolume(Λ)=[Λ:H], in this direction. Section 5.3 already proves the required properties of Λ.

For b/F03, the gauge measure uses additive coordinate mass O_K=1; no distinguished group compact open is assigned mass 1. The generic quotient is requested for connected nonnegative graded algebras, with positive odd generator degrees in the exterior example. The real universal class is chₙᵗʷ, not the untwisted rational chₙ with an unrecorded scalar. The infinitesimal contract follows the separate complex and real Lie-algebra conventions at burgos2002 line 4182–4191, with Propositions 8.9 and 8.10 at burgos2002 line 2865–2885. The real point quotient is computed at burgos2002 line 3973–4001, the actual regulator is constructed at burgos2002 line 4084–4106, and the independent factor-two comparison starts at burgos2002 line 4133–4143. Adams compatibility is used as a supplier input, with its number-field consequence at deligne_goncharov2005 line 429–440.

For b/F04, the required ORDER lists ColemanIntegration at 155, HeightsRationalPointsAndObstructions at 157, EndoscopicTransferAndUnitaryTraceComparison at 166 and this package at 224. The first two cannot consume this package’s theorems in that order. ColemanIntegration §L3.Fc.1 independently constructs its finite-Galois Beilinson regulator and lattice theorem; HeightsRationalPointsAndObstructions §3.6 invokes Poonen directly. The README now describes these facts. No external target, merge-order entry or plan field outside gaps was edited. In particular, the immutable plan consumers array still carries its earlier ColemanIntegration and HeightsRationalPointsAndObstructions records; reconciling it belongs to the human decision. The plan’s universal-deligne gap detail was corrected within the allowed gaps list.

## Citations, ownership and pinned interfaces

Read the main-branch NumberFieldArithmetic, ClassFieldTheory and AlgebraicTopology roadmaps for conventions and shape. Checked supplier and ownership objects using roadmaps grep and roadmaps show, the board packages, main/Completed roadmaps and the supplied sibling checkouts. The added Lean name is absent from other roadmaps’ Suggested.lean files; the three retained names also produced no other-owner match. No new generic carrier, continuation or regulator construction was introduced by these repairs. The analytic headline tests the existing §1.3 target; the other changes specify existing supplier requests or remove unnecessary ones.

The relevant supplier sections were read at their available heads: ArithmeticKTheory §§3.2–3.4, GeneralAlgebraicKTheory §§2.5, 3.2, 3.12, 7.7–7.8, StableHomotopyKTheory §§2.3–2.5, 3.37 and 4.14, AdelicAlgebraicGroups §§1.2, 1.4, 2.2–2.5, 3.4 and 4.2, EndoscopicTransferAndUnitaryTraceComparison §6.2, ArithmeticLocallySymmetricSpaces ALS.F.5, ALS.0.4–0.9 and ALS.5b.1, AutomorphicFormsOnReductiveGroups §§1.1–1.3, ArithmeticGaloisDuality R02.4.5b–R02.4.6, LFunctions Layer 3, IntegralIwasawaTheory §6.0, CharacteristicClasses C5a.2–C5a.5 and C6 items 2–3, TopologicalKTheory T4 and T7 item 1, SchemeKTheoryOperations §6.8, and the cited main-branch ClassFieldTheory, SemisimpleAlgebras, DifferentialGeometry and AlgebraicTopology sections. In particular, the supplied arithmetic comparison is independent of regulator values, while finite-stage and calibration extensions remain explicit gaps.

The supplied Polylogarithms head still owns its borel-period-contract request and still has the earlier section-number drift; no attempt was made to edit it. HabiroNahmSeries §1.5 remains an indirect consumer through Polylogarithms. The resolver finds the existing PeriodsAndSpecialValues and MotivicEtaleKTheory names through board records, but roadmaps show returns no readable main/open roadmap for either. Their section contents could not be independently re-read; no new assertion about their targets was invented. The two MotivicEtaleKTheory prerequisites remain named supplier gaps. The unchanged PeriodsAndSpecialValues PS.3.2a consumer reference remains a maintainer verification limit.

Verified the manifest pins: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Read the native analytic definitions and the lattice-index theorem above, CSA in Mathlib/Algebra/BrauerGroup/Defs.lean:40, IsZLattice in Mathlib/Algebra/Module/ZLattice/Basic.lean:433, Dedekind zeta in Mathlib/NumberTheory/NumberField/DedekindZeta.lean:49, and the retained Tau Ceti Brauer, index and splitting definitions. CSA has centrality, simplicity and finite dimension; IsZLattice separately requires discrete subtype topology and full span. The native splitting predicate permits matrix size zero for general inputs; the division and central-simple inputs here exclude the zero algebra. No data definition was admitted.

All cited source works already have manifest keys. No new work, duplicate key or missing-text request was needed. weil1961 remains waived and beilinson1985 remains uncertified; neither was reopened. The reviews’ observations about dropped scan equations and the source proof’s dimension/regular-representation issues do not change a new target here: §4.4 already states dimension N(j²+2j), uses the padded group representation, and computes its wedge factor rather than relying on an illegible printed formula.

## Adversarial mathematics pass

Each row gives computed values, including the relevant API laws and the consumers of changed objects. Here Δ=|disc F|, N=[F:ℚ], d=dₙ, G denotes Catalan’s constant only in the two imaginary-quadratic analytic rows, and t≠0. A rational proportionality class is never asserted to be an exact scalar. The finite group SL₂(𝔽₂)≃S₃ supplies a nonabelian group test where finite point counts are used. Zero fields, noncentral algebras and positive-characteristic global fields are outside the stated carriers; no prime is excluded from the number-field assertions.

| Statement | Instances tried and computed values on both sides | Result and change |
|---|---|---|
| Tate lines, conjugation and divided coordinates | n=2: conjugation sends 2πi to −2πi, divided pair (1,−1); n=3: (2πi)²=−4π² is real, divided pair (1,1). | Same signs in §§1.1, 2.2, 5.2 and 6.1; no change. |
| Dimension and coordinate topology, §1.1 | ℚ gives (d₂,d₃)=(0,1); ℚ(i) gives (1,1); real quadratic gives (0,2). Native generator norms 2π and 4π² become coordinate norm 1. | Topology agrees; an isometry is not claimed. |
| Coordinate lattice and measure, §1.1 | Replacing a complex representative gives scalar −1 at n=2, +1 at n=3; absolute determinant is 1 in both. Cₙ becomes ℤ^d; d=0 gives point mass 1. | Excludes doubled embedding count and zero empty mass. |
| Restriction/trace, §1.2 | ℚ(i)/ℚ: n=3 gives R(3)=(3,3), TR(3)=6=2·3; n=2 gives T(3,−3)=0. | Full embedding sum, not a selected-coordinate average. |
| Towers and identity, §1.2 | Degrees 2 and 3 give TR(t)=6t by either composite; degree 1 gives T(t)=R(t)=t. | Composition and normalization agree. |
| Analytic headline, §1.3, ℚ n=2 | d=0, c=−1/12; comparison scalar ζ(2)/π²=1/6; q=−1/2 gives −1/12. Punctured quotient tends to −1/12; 0!=1. | Added native statement; coefficient is real and nonzero. |
| Analytic headline, §1.3, ℚ n=3 | d=1, c=−ζ(3)/(4π²); comparison ζ(3)/π² gives q=−1/4. Quotient Z(s)/(s+2) tends to c while Z(−2)=0. | Derivative coefficient and limit agree. |
| Analytic headline, §1.3, ℚ n=4 | d=0, c=1/120; comparison 1/90 times q=3/4 equals 1/120. | Both even-weight signs retained. |
| Analytic headline, imaginary quadratic | ℚ(i), n=2: c=−G/(6π), comparison 2π⁻³ζ_F(2)=G/(3π), q=−1/2. At n=3: c=ζ(3)/(8π²), comparison 2π⁻⁵ζ_F(3)=ζ(3)/(16π²), q=2. | Tests both parities with r₂=1; no narrowing to totally real fields. |
| Analytic hypotheses and total values | Z=0 and Z=2ζ give 0 and π²/3 at s=2 over ℚ, instead of π²/6. At n=1, actual order at 0 is 0 versus d₁=1. At n=2,3,4 the centers are −1,−2,−3, all different from 1. | Added negative-control Check; n≥2 and agreement exclude wrong models. |
| Chern and Bott calibration, §2.1 | ch(u)=−v gives ch(u²)/v²=1 and ch(−u³)/v³=1; twisted evaluations −4π² and −8π³i. Twice the weight-three class gives −16π³i. | Zero/doubled class excluded; ch and chᵗʷ distinguished in new contract. |
| Stabilization and torsion, §§2.1–2.2 | Identity block contributes 0 in positive degree; calibrated sum remains 1. If mx=0, mr(x)=r(0)=0, hence r(x)=0. | Actual maps retained. |
| Rational localization, §2.2 | A nonzero rational K₅(ℚ) class evaluates to t through either construction; doubling the inverse gives 2t≠t. | Specified inclusion inverse excludes arbitrary isomorphisms. |
| Real isomorphism and kernel, §2.3 | ℚ n=2 gives dimensions 0=0, n=3 gives 1=1; ℚ(i) both give 1=1; real quadratic n=3 gives 2=2. A nonzero torsion-free coordinate t cannot lie in the kernel. | No zeta value inferred from zero-dimensional isomorphism. |
| Regulator restriction/transfer, §2.3 | ℚ(i)/ℚ, odd weight: tr res and TR each multiply t by 2; even weight trace of (t,−t) is 0. | Same trace as §1.2. |
| Finite-stage comparison gap | (N,q,a)=(1,5,22):21>20; a=21:20=20. (2,3,26):25>24; a=25:24=24. At q=0,a=2:1>0 and 1 maps to 1. | Strict sufficient range; no endpoint conclusion. |
| period_eq_index, §3.1 | Split F and M₂(F) have period=index=1, dimensions 1 and 4. Two invariants 1/2 give 2=2 and dimension 4; ±1/3 give 3=3 and dimension 9. | Native carrier and hypotheses unchanged. |
| Invariant realization and degree multiples, §3.1 | Empty lcm=1; singleton 1/3 has sum 1/3≠0 and no global class. For period d dividing a, M_(a/d)(D) has degree a; d=3,a=6 gives size 2 and degree 6. | Positivity excludes matrix size zero. |
| Splitting-degree gap | Division degree d=2 with a degree-two splitting field gives d²k=d[L:F]:4·1=2·2. A degree-one splitting field would give 4k=2, impossible for integer k. | Generic supplier divisibility is necessary; no new local index theory. |
| Variable-local-degree gap | For ℚ(ζ₃₂)⁺, [L:ℚ]=8, degree at 2 is 8, Frobenius 31=−1 gives degree 1 at 31. Quotient by {1,15} is cyclic of order 8, generated by 3, with −1 outside the subgroup. | Local degree condition only on S; real complexification requires even a. |
| exists_divisionAlgebra_split_at_infinity, §3.2 | a=1 gives F, dimension 1=1²; a=2 and 3 give dimensions 4 and 9; a=8 gives 64. Hamilton quaternions have real invariant 1/2 instead of 0. | Positive degree and every infinite splitting condition retained. |
| Gauge and scaling, §3.3 | ℚ, ω↦2ω: infinite factor 2, finite product 1/2, global multiplier 1. Complex multiplier is 4. ℚ(i), h=3:4^(−3/2)·2³=1. | Same normalization in volume and mass contracts. |
| Gauge degeneracy, §3.3 | h=0, ω=1 has mass 1; ω=2 over ℚ gives factors 2 and 1/2, product 1. ω=0 gives local mass 0. | Nonzero form hypothesis excludes zero measure. |
| Norm-one structure gap and mass, §3.4 | a=1 gives identity group, dimension 0; a=2 gives geometric SL₂, dimension 3; a=3 gives SL₃, dimension 8. Supplied Tamagawa masses in the latter two cases are 1. | Added a≥2 to standalone request and degree-one README Check. |
| Wrong group, §3.4 | Norm-one quadratic torus has dimension 1 and geometric character rank 1, versus 3 and 0 for quaternion SL₁(D). | Torus excluded; mass-one theorem remains semisimple. |
| Local masses and rationality gap, §3.5 | #SL₂(𝔽₂)/2³=6/8=3/4; #SL₃(𝔽₂)/2⁸=168/256=21/32=(3/4)(7/8). | Includes residue characteristic 2; no hyperspecial-only conclusion. |
| Exceptional gauge and subgroup, §3.5 | At 2, 2ω_std gives (1/2)(3/4)=3/8, correction (3/8)/(3/4)=1/2. Index-three open gives mass (3/8)/3=1/8. | Added subgroup Check; positive rational masses verified. |
| Euler correction, §3.5 | Exceptional mass b gives correction 4b/3; adding a standard place multiplies by 1. q=1 gives 1−q⁻²=0; q=2 gives 3/4>0. | q≥2 excludes zero denominator; j≥2 gives convergence. |
| Adelic identity and level change, §3.6 | Finite mass b gives infinite volume 1/b. Index-three refinement yields b/3 and 3/b; product remains 1. Over ℚ(√5), a=2, unscaled/Borel ratio is 5^(3/2). | Gauge and index direction agree. |
| Compactness hypotheses, §3.6 | Split M₂(ℚ) yields noncompact SL₂(ℝ)/SL₂(ℤ); indefinite quaternion division gives compact quotient of dimension 3. Hamilton algebra has compact real group, unlike the required split real factor SL₂(ℝ). | Division and infinite splitting used for their respective steps. |
| Generic indecomposable gap and §4.1 quotient | Λ(x₃,x₅): dim H⁸=1, dim Q⁸=0; Λ(x₃):dim Q³=1,Q⁶=0. k[u₂]:dim Q²=1,Q⁴=0. | General quotient, not an exterior-only implementation. |
| Quotient universal property, base change and determinant, §4.1 | Projection sends x₃x₅ to 0 and x₃ to [x₃]. Scalar extension ℚ→ℝ leaves dimensions 1 and 0 unchanged. A=k gives Q=0 and ∧⁰Q=k, generator 1. | New quantified request agrees with existing cohomological adapters. |
| Graded-field boundary of quotient request | Over 𝔽₂, Λ(x₁) has x₁²=0 and dim Q¹=1,Q²=0. For 𝔽₂[x₁], x₁²≠0 but is decomposable, so Q²=0 as well. | Generic request does not infer odd squares vanish from graded commutativity alone. |
| Invariant-form correction, §4.2 | q=0 gives 1; q=1,2 gives i,−1 with product −i=i³; q=3,5 gives −i,i. | Multiplicativity and phase agree across §§4.3–5.1. |
| Descent boundary, §4.2 | Point with C₂ stabilizer has dim H^q(C₂,𝔽₂)=1 for every q≥0; plain point has dimension 0 for q>0. | Torsion-free, characteristic-zero descent does not cover this wrong model. |
| Compact determinant, §4.3 | ℚ,n=2: absolute calibrated period 4π² in π²·ℚ_>0; ℚ,n=3:π³-class. ℚ(i),n=2:Δ^(−3/2)=1/8, determinant class π⁴/8. | Nonzero factors justify later cancellation. |
| Rational basis and stabilization, §4.3 | Multiplying one rational basis vector by 2 multiplies determinant by 2. Adding an identity block contributes 0 to the positive-degree primitive. | Rational class and surviving degree preserved. |
| Division cycles and representation, §4.4 | (N,j)=(1,1),(1,2),(2,1) give dimensions 3,8,6 and wedge factors 2,9,4. At j=1,a=17, padded size is 4+13=17 and determinant Nrd(g)²=1. | Corrects the source’s unpadded-representation route already in existing text. |
| Lower-degree ideal, §4.4 | In Λ(x₃,x₅), x₃∧x₃=0 and x₃∧x₃x₅=0, while x₃∧x₅≠0. | Exactly the repeated earlier generator is annihilated. |
| Arithmetic determinant induction, §4.5 | Consecutive products 1,ζ_F(2),ζ_F(2)ζ_F(3) have ratios ζ_F(2),ζ_F(3); both denominators positive. ℚ,n=2 has full primitive rank N=1 despite base rank d=0. | Full and base determinant lines distinguished. |
| Common fibre and lift choices, §4.6 | Rank triples for ℚ n=2,3 are (0,1,1),(1,1,0); ℚ(i) gives (1,2,1). Matrix [[1,2],[0,1]] has determinant 1; replacing fibre identity by 2 gives determinant 2. | Intrinsic cancellation requires actual identity on fibre. |
| Primitive determinant and phase, §5.1 | ℚ,n=2:empty determinant 1 divided by ζ(2)/π²=1/6 gives 6. ℚ,n=3:E=2,i^E=−1. ℚ(i),n=2,3:E=0,i^E=1. | Empty and positive-rank cases agree. |
| exists_pos_rat_dedekindZeta_of_isTotallyReal, §5.1 | ℚ n=2,4 gives q=1/6,1/90. ℚ(√5),n=2 gives √5ζ_F(2)/π⁴=2/75; ℚ(√2) gives √8ζ_F(2)/π⁴=1/24. | Retained headline; positivity and total reality present. |
| General phase identity, §5.1 | For odd n, E=(n−1)r₁; n=3,r₁=2 gives E=4. For even n, E=−nr₁; n=2,r₁=2 gives E=−4. Both give i^E=1. | Integer exponents, no natural subtraction. |
| Homotopy conversion, §5.2 | ℚ,n=3:quotient index 1, Cartan index 2, composite 2, covolume 4π. n=5:indices 2,1, composite 2, covolume 2π. ℚ,n=2:covolume 1. | Same ε=2 or 1 as §5.4. |
| Cartan map and weight boundary, §5.2 | g=diag(i,−i), h=[[0,1],[−1,0]] gives ggᵗ=(gh)(gh)ᵗ=−I; identity coset maps to I. At n=1, π₁SU=π₁(SU/SO)=0 while d₁(ℚ)=1. | Well-defined quotient map; n≥2 essential. |
| Integral lattice and kernel quotient, §5.3 | Rank one gives Λ=tℤ, covolume |t|; 2tℤ has index 2 and covolume 2|t|. Rank zero gives covolume 1. | Finite generation plus real isomorphism gives discreteness. |
| Lattice wrong models, §5.3 | ℤ+√2ℤ has rank 2 in a real line, so its real extension is 2→1 in dimension and not an isomorphism. tℚ contains nonzero t/m→0, unlike tℤ. | Abstract finite generation and rational image are not substituted for Λ. |
| Zeta covolume, §5.4 | ℚ,n=2:R=1=(−12)(−1/12)=6ζ(2)/π². ℚ,n=3 exponent is −2, not −3. ℚ(i),n=2,3 exponents are −3,−5 with √Δ=2. | Analytic headline and lattice conversion feed the same formula. |
| Rational determinant, §5.4 | Swapping two columns multiplies signed determinant by −1 and leaves absolute determinant fixed; doubling a column multiplies both magnitudes by 2. | Positive versus signed rational factors distinguished. |
| Finite S transport, §5.5 | S=∅ gives ratio 1; including a prime over 2 leaves d₂,d₃ unchanged and the odd-degree surjection gives identical image. In degree 1, ℤ→ℤ[1/2] changes unit rank 0→1. | n≥2 retained; no restriction on finite primes. |
| Order image, §5.5 | ℤ[2i]⊂ℤ[i],n=2:Λ(R)=mtℤ⊂tℤ, index m≥1, covolume ratio m. m=2 or 3 gives 2 or 3. Rank zero gives index 1 and covolumes 1,1. | Exact nesting formula replaces an unnecessary new supplier gap. |
| Composition and commensurability, §5.5 | 6tℤ⊂2tℤ⊂tℤ gives indices 3·2=6 and covolumes 6|t|,2|t|,|t|. Comparing 3tℤ with 2tℤ gives ratio 3/2. | Existing common-sublattice Check remains valid for arbitrary commensurable lattices. |
| Point projection and quotient, §6.1 | n=2:P₁(1)=0,P₁(i)=i; n=3:P₂(1)=1,P₂(i)=0. For 1+i the removed components are 1∈ℝ(2) and i∈ℝ(3). | Kernels and both inverse quotient maps agree. |
| Point integral structure, §6.1 | At n=2, quotient image of 2πi has divided coordinate 1, while image of (2πi)² is 0. At ℚ, fixed quotient dimensions are 0 at n=2 and 1 at n=3. | Uses ℤ(n−1), not the vanishing ℤ(n) image. |
| Positive-weight point boundary, §6.1 | n=1:P₀(1+i)=1; n=0 with natural subtraction also gives P₀(1)=1, so it would not annihilate ℝ(0). Geometric weight-zero H¹ is 0. | n>0 and the weight-one scope distinction retained. |
| Universal Deligne gap and Adams law | F=ℚ,n=3,a=2 gives scalar 2³=8; a=1 gives 1. At weight one, ψ² sends 2∈ℚˣ to 4 and log 4=2 log 2. | No weight-one full-lattice claim added; normalized Chern class is independent of Bo. |
| Infinitesimal comparison gap, §6.2 | N=1: complex gl₁ has dimension 1, CE²=0 and differential 0; underlying real gl₁ has dimension 2 and real CE² dimension 1. Both constant comparisons send 1 to 1. | Added coefficient-sensitive Check and bound n≥1. |
| Factor-two comparison, §6.2 | d=0:2⁰=1 and empty determinant 1; d=1:determinant ratio 2; d=2:ratio 4. For tℤ, Be image (t/2)ℤ has half its covolume. | Same basis and same integral source are essential. |
| Rational Adams theorem, §6.3 | ℚ,n=3,a=2 gives scalar and determinant 8; real quadratic gives determinant 8²=64. ℚ,n=2 gives determinant 2⁰=1. a=1 gives 1 in all dimensions. | No a=0 assertion; injective regulator supplies the conclusion. |
| Consumer coordinate conversion | Multiplying each of d rows by λₙπ^(n−1) adds (n−1)d to exponent d−Nn. ℚ,n=3 gives −2+2=0; ℚ(i),n=2 gives −3+1=−2. | Consumer calibration remains with Polylogarithms; no backwards supply claim. |

## Elaborated signatures and required checks

The new theorem’s hypotheses and all three retained signatures were compared with their README statements using one scratch copy containing #check @name for every declaration. The scratch module elaborated with exit status 0 and the same four expected sorry warnings. There are no section variables, definitions or instances; all hypotheses are explicit. No binder was lost and no existing theorem’s type changed.

| Declaration | Elaborated context and conclusion compared with README | Outcome |
|---|---|---|
| dedekindZeta_continuation_leadingTerm | F, Field F, NumberField F; Z; analyticity at every z≠1; actual series agreement for 1<Re z; n≥2. d uses the infinite-place counts, z₀=1−n, c=iteratedDeriv d Z z₀/d!. Order, realness, nonzero coefficient, punctured limit and rational proportionality all survive; the exponent elaborates in ℤ. | Matches §1.3; added headline only. |
| period_eq_index | F, Field F, NumberField F, A:CSA F; orderOf(TauCeti.BrauerGroup.mk A)=TauCeti.Algebra.index F A. | Matches §3.1; unchanged. |
| exists_divisionAlgebra_split_at_infinity | F, Field F, NumberField F, a≥1; existential division ring with central F-algebra and finite dimension; dimension a²; each real/complex embedding uses its induced scalar structure in the splitting predicate. | Matches §3.2; unchanged. |
| exists_pos_rat_dedekindZeta_of_isTotallyReal | F, Field F, NumberField F, IsTotallyReal F; n≥2, Even n; positive rational q and √Δ·ζ_F(n)=qπ^(nN). | Matches §5.1; unchanged. |

Required elaboration: ran lake env lean on packages/BorelRegulators/Suggested.lean from the pinned content environment. Exit status 0; four expected “declaration uses sorry” warnings and no errors. The imported Tau Ceti objects were present, so no targeted module build was needed. A final elaboration after the docstring formatting change had the same outcome.

Required dependency check, with the supplied configuration, README, order and --movable arguments, exited 0 with exact output:

```text
depcheck: 28 roadmaps, 245 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The citation resolver, against main 72d2b66 and the supplied 331-head index, reported no unresolved cross-roadmap citations and no unresolved Lean names. Its output expressly does not check native pinned Lean names; those needed for the repairs were read at the pins and the acceptance signatures were elaborated as described above.

Structural checks: plan.json parses; its entire non-gaps data and text are unchanged. All ten gap slugs match exact supplier-contract lines, their needs sentences match literally, and none is self-supplied. The removed gap tokens occur nowhere in the README. Every acceptance declaration is named in the README; no data definition, extra import, set_option, admitted example or boundary theorem was added. No commit, external write or merge-order edit was made.

Report-format gate repair: pass-prefixed heading IDs → original F01–F04 identifiers, with review labels in the section bodies. All six findings retain their severity, verdict and mathematical explanation. The format check recognizes six finding sections, each explanation has at most 60 words, and only this report changed during the formatting repair. The elaboration and dependency outcomes recorded above are preserved.

## Maintainer consequences

The only new acceptance name is TauCetiRoadmap.BorelRegulators.dedekindZeta_continuation_leadingTerm. No existing Lean name was deleted or renamed. ArithmeticKTheory no longer receives an unnecessary order-finite-generation request. Polylogarithms’ consumer-owned borel-period-contract remains external; its earlier section references still need its author’s edit. The remaining ten supplier gaps retain their existing owners and sections, with five needs sentences made precise.

The re-raised ColemanIntegration/HeightsRationalPointsAndObstructions ownership and placement issue remains for a human, including the protected plan consumers records. The local misleading supply claims have been removed, and this repair neither changes the scope of an earlier roadmap nor claims to settle that external decision. An independent review remains necessary.
