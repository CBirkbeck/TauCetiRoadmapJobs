# Roadmap: elliptic curves, part ii — legendre models, descent and character interfaces

**Summary.** Build the equation interfaces between split two-torsion, Legendre parameters, native two-descent, good reduction and primitive quadratic characters. EllipticCurves supplies the general theory through local reduction and quadratic twists; this Part II begins with its Weierstrass equations and point groups and proves the parameter, squareclass and torsion results specific to split cubics. Its end theorems are rational normalization with full two-torsion, unit parameters at good odd primes, odd character-conductor divisibility, the Legendre halving criterion, two-primary point-group results, an explicit order-four point on the twist by two, and the symmetric-cubic and twist trace formulas. All coefficient fields allowed by each statement are included; no progression hypothesis enters these constructions.

## Scope and ownership

This roadmap owns coefficient-level Legendre specializations, ordered-root normalization, root evaluations of the native descent map and their arithmetic consequences. It extends EllipticCurves, whose Layer 4 stops at general local reduction and whose Layer 5 owns quadratic twists. It does not replace their curve, isogeny, local-model or twist carriers.

The five-coefficient model, nonsingular affine point group, invariants, normal forms, admissible coordinate changes and minimal-equation reduction classes are already in the library: Mathlib's elliptic-curve modules supply them. Tau Ceti supplies the cubic algebra, its unit squareclasses, the descent homomorphism and kernel theorem, root-count formula for two-torsion, point counts and quadratic twists. These general constructions are imports, not targets. Layer 2 adds their three ordered root readings; its coordinate product theorem differs from the generic norm condition by identifying the three individual factors. Layer 0's enumeration differs from the native root-count theorem by giving the actual labelled points and the equality of sets.

ModularCurves §9E owns the Legendre line, its S₃ action and invariant-ring description. Layer 0 keeps the six labelled rational expressions and their coefficient-model comparisons, without rebuilding that moduli theory. EllipticCurveModularityPartII §5.1 owns the general full-rational-two-torsion predicate; here its content is used directly as cardinality four of the native doubling kernel. ClassicalArithmeticCompletion §§1.7–1.8 owns primitive quadratic characters and their identification by prime values. NeronModelsAndSemistableAbelianVarieties §§5.3a, 5.3g owns the actual elliptic conductor and its reduction comparison, using ArithmeticGaloisRepresentations Layer 3 for Artin conductors. No discriminant, reduction-symbol formula or Ogg-exponent surrogate is substituted for that conductor.

The finite-field trace comparison here is restricted to the displayed scaled Legendre family. General local factors, rational bad-prime factors, global L-functions and BSD remain outside this Part II. ErdosProgressionPowers Layer 2 consumes these interfaces and owns all progression-specific uses, character nontriviality and character-sum inequalities. ArithmeticDynamics §§6.35, 6.111–6.112 owns Legendre Lattès maps and their common torsion-image bounds; no such construction is repeated here. The coefficient model of §0.1 is an input for MordellLawrenceVenkatesh §6.4, whose cyclic family and Gauss–Manin theory remain there.

## Conventions

Rings are unital and may be the zero ring in coefficient identities. A field K is nontrivial, with arbitrary universe; geometric statements below assume 2≠0, and L(d,λ) is elliptic precisely when d≠0 and λ∉{0,1}. Set L(λ)=(0,−(1+λ),0,λ,0) and L(d,λ)=(0,−d(1+λ),0,d²λ,0); the source’s F′_λ means L(2,λ). Polynomial identities are over every commutative ring; divisions and ellipticity assertions carry the stated field and nonzero hypotheses. The characteristic-three cases are included. Completing the square over a ring requires invertible 2, rather than merely nonzero 2.

All points mean Mathlib's nonsingular affine points together with the origin O at infinity, with its native addition; `(0,0)` is an affine two-torsion point, never O. Use decidable equality when the native point-group instance requires it. The ordered roots are always (0,d,dλ). A squareclass [a] means the class of a nonzero a in Kˣ/(Kˣ)²; zero is a field square but never a unit squareclass. The split target is K×(K×K) and its corresponding triple of squareclasses, in this order. The six parameter labels retain repetitions.

Admissible changes send new coordinates to old coordinates by x_old=u²x_new+r and y_old=u³y_new+u²sx_new+t; hence C•W is the new equation. At roots (3,5,9), r=3 gives new roots (0,2,6). The scalar d corresponds to native twist parameters (0,−d/4), whose twisting discriminant is d; at d=2 the second parameter is −1/2. Neither equality of j nor a full rational two-torsion hypothesis asserts a rational isomorphism to the unscaled L(λ).

Write v_p for the integer-valued rational p-adic valuation, normalized by v_p(p)=1. Mathlib's total value at zero is 0, so every multiplicative valuation calculation explicitly excludes zero. Good reduction of a rational curve means `WeierstrassCurve.HasGoodReduction` on a minimal equation after base change to ℚ_p; it is not that predicate on an arbitrary displayed equation. The unit-parameter theorem separately proves that L(λ) itself is minimal and good. A primitive character may have conductor 1; its odd conductor is its largest odd divisor. Semistable away from 2 means good or multiplicative reduction at every odd prime. Unit parameters and odd support actually hold without that extra condition; the semistable case is the source's conductor application.

The native count includes O. The trace is the integer p+1−#E(𝔽_p), and the good Euler polynomial is 1−a_p T+pT². For λ=3 over 𝔽₅, the count 4 gives trace 2 and polynomial 1−2T+5T²; scaling by 2 gives count 8, trace −2 and polynomial 1+2T+5T². These witnesses fix both the trace and twist signs. No Hasse bound, analytic continuation or distribution theorem is needed for the polynomial-symmetry argument.

## Exact supplier contracts

### From Mathlib

Use `WeierstrassCurve` in Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean, with `WeierstrassCurve.c₄`, `WeierstrassCurve.Δ`, `WeierstrassCurve.IsElliptic` and `WeierstrassCurve.j`. The model is just five coefficients; ellipticity is the separate assertion that Δ is a unit. The native j requires ellipticity. Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Basic.lean supplies `WeierstrassCurve.Affine.Equation` and `WeierstrassCurve.Affine.equation_iff`; Affine/Point.lean supplies `WeierstrassCurve.Affine.Point`, the algebra-homomorphism point map `WeierstrassCurve.Affine.Point.map` and `WeierstrassCurve.Affine.Point.add_self_of_Y_ne`, whose tangent branch needs a nonsingular point unequal to its negative.

Use `WeierstrassCurve.VariableChange` and `WeierstrassCurve.variableChange_j` in Mathlib/AlgebraicGeometry/EllipticCurve/VariableChange.lean. `WeierstrassCurve.toCharNeTwoNF` in NormalForms.lean assumes invertible 2. Reduction.lean supplies `WeierstrassCurve.IsIntegral`, `WeierstrassCurve.IsMinimal`, `WeierstrassCurve.minimal`, `WeierstrassCurve.HasGoodReduction` and `WeierstrassCurve.hasGoodReduction_iff_isElliptic_reduction`; the last comparison assumes a minimal equation over the fraction field of a DVR. The good-reduction class extends minimality and asserts multiplicative discriminant valuation 1, which corresponds to additive valuation 0.

The rational valuation inputs are `padicValRat`, `padicValRat.mul`, `padicValRat.div` and `padicValRat.add_eq_min` in Mathlib/NumberTheory/Padics/PadicVal/Basic.lean. Multiplication and division require nonzero operands; the unequal-valuation sum lemma also requires nonzero summands and sum. Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean supplies `quadraticChar` and `quadraticChar_card_sqrts` over finite fields, the latter with characteristic different from two. Use `legendreSym.at_neg_one`, `legendreSym.eq_neg_one_iff`, `ZMod.euler_criterion` and `ZMod.exists_sq_eq_neg_one_iff` in LegendreSymbol/Basic.lean, and `legendreSym.at_two` in QuadraticReciprocity.lean. Their prime assumptions and the exclusions of 2 are retained.

For the split algebra use `Ideal.quotientMulEquivQuotientProd` in Mathlib/RingTheory/Ideal/Quotient/Operations.lean with coprime ideals, `Polynomial.quotientSpanXSubCAlgEquiv` in Mathlib/RingTheory/Polynomial/Quotient.lean, and `QuotientGroup.map`, `QuotientGroup.eq_one_iff` in Mathlib/GroupTheory/QuotientGroup/Defs.lean. Use `AddCommGroup.equiv_directSum_zmod_of_finite` in Mathlib/GroupTheory/FiniteAbelian/Basic.lean only for finite abelian groups. The finite group argument never applies it to an arbitrary nonabelian group. `DirichletCharacter`, `DirichletCharacter.IsPrimitive` and `legendreSym` give native carriers for the character-support headline.

### From Tau Ceti

TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/XSubT.lean supplies the monic coefficient cubic `WeierstrassCurve.Affine.f`, `WeierstrassCurve.Affine.A` as the AdjoinRoot cubic algebra, `WeierstrassCurve.Affine.M` as its unit group modulo squares, `WeierstrassCurve.Affine.equivProdA'` and `WeierstrassCurve.Affine.equivProdA'_apply`. Under the normal-form and ellipticity hypotheses use `WeierstrassCurve.Affine.separable_f`, `WeierstrassCurve.Affine.μ`, `WeierstrassCurve.Affine.μ_apply`, `WeierstrassCurve.Affine.μ₀_some`, `WeierstrassCurve.Affine.μ₀_zero`, `WeierstrassCurve.Affine.μX_of_eval_f_ne_zero`, `WeierstrassCurve.Affine.μX_of_eval_f_eq_zero`, `WeierstrassCurve.Affine.ker_μ_eq` and `WeierstrassCurve.Affine.normM_μ₀_eq_one`. The homomorphism's source is the multiplicative copy of the native additive point group. Its root representative is x−θ plus the cubic cofactor, rather than the nonunit x−θ.

TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/TwoTorsion.lean supplies `WeierstrassCurve.Affine.card_ker_nsmul_two`; it counts roots, and does not export the labelled set equality. Affine/Point/VariableChange.lean supplies `WeierstrassCurve.Affine.Point.addEquivVariableChange` from points on C•W to points on W. `WeierstrassCurve.Affine.Point.equivVariableChange` is its underlying bijection, not itself the additive equivalence. NormalForms.lean supplies the root-point test `WeierstrassCurve.y_eq_zero_of_order_two`.

TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean supplies `WeierstrassCurve.pointCount`, `WeierstrassCurve.pointCount_eq_card_point`, `WeierstrassCurve.frobeniusTrace` and `WeierstrassCurve.frobeniusTrace_def`. The count is the cardinality of all affine solutions plus one, so the comparison with nonsingular points requires ellipticity and finite affine solution set. Affine/FinitePoint.lean supplies `WeierstrassCurve.Affine.finite_point` over finite coefficients. QuadraticTwist/Basic.lean supplies `WeierstrassCurve.quadraticTwistOf`, `WeierstrassCurve.Δ_quadraticTwistOf`, `WeierstrassCurve.c₄_quadraticTwistOf`, `WeierstrassCurve.j_quadraticTwistOf` and `WeierstrassCurve.isElliptic_quadraticTwistOf_iff`, including the unit twisting-discriminant condition over rings.

### From TauCetiRoadmap.EllipticCurves

Layer 4, “elliptic curves over local fields — reduction, Tate's algorithm, the Tate curve”, supplies general local minimal-model and potential-good-reduction theory. Its integral-j criterion is used only in its good-reduction consequence. Layer 5's quadratic twists are consumed through the native coefficient construction above.

What EllipticCurves must provide (gap:rational-local-unit-reduction): Transport rational equations and their j-invariants to ℚ_p, prove that good reduction of minimal local models implies integral j, and compare rational valuation-zero parameters with ℤ_p units and their nonzero residues, including minimality and nonsingular reduction of integral unit-discriminant equations.

### From TauCetiRoadmap.ClassicalArithmeticCompletion

§1.7, “The Kronecker character of a fundamental discriminant”, supplies the primitive integral-valued character through Tau Ceti's fundamental-discriminant character; §1.8, “Primitive characters agreeing at almost all primes are equal”, supplies uniqueness from prime values. The required rational-squareclass specialization is as follows: for a nonzero rational a there is a unique primitive quadratic character, allowing conductor 1, whose value at each odd prime where a is a unit is the Legendre symbol of its residue; an odd p divides its conductor iff v_p(a) is odd, and the odd conductor is squarefree. Thus a=1 has conductor 1, a=−1 has conductor 4, and a=3 has conductor 12. The Legendre symbol of a rational unit can be read as the symbol of numerator times denominator.

What ClassicalArithmeticCompletion must provide (gap:rational-squareclass-character): Extend §1.7's fundamental-discriminant character to every nonzero rational squareclass with the stated prime-value characterization, uniqueness, odd conductor parity and squarefree odd conductor, including the trivial squareclass.

### From TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties

§5.3a, “The elliptic conductor exponent”, supplies the Artin-conductor definition of the actual elliptic conductor, independently of the auxiliary prime. §5.3g, “Elliptic conductor values and bounds”, supplies for E/ℚ the equivalence p∣N_E iff bad reduction at p and exponent one iff multiplicative reduction. At good primes the exponent is zero. In particular semistability away from 2 gives squarefree odd conductor. These are comparisons of minimal local models with the genuine Tate-module conductor. ArithmeticGaloisRepresentations Layer 3 supplies this owner's general Artin and Swan theory; it is not an additional conductor construction here.

## How to read the build

Layer 0 fixes the equations, the six root orders and the labelled two-torsion points. Layer 1 uses the invariant computation and the local suppliers to pass from good reduction to parameter units and character conductors. Layer 2 splits the native cubic algebra and reads the existing descent map, ending in the halving criterion. Layer 3 combines this with finite abelian groups and quadratic characters to control two-primary torsion. Layer 4 constructs and doubles the explicit conic witness on the twist by two. Layer 5 uses finite-field character sums for the symmetric cubic and the equation-specific twist trace. Each target lists the inputs to its statement and to its indicated proof; the route does not constrain alternative proofs.

## Layer 0: Legendre equations and root orderings

### 0.1 The Legendre equation

Define `legendre` by the following coefficient specialization. For any commutative ring R and λ∈R, L(λ) is the existing WeierstrassCurve with coefficients a₁=a₃=a₆=0, a₂=−(1+λ), a₄=λ. Its equation is y²=x(x−1)(x−λ). This defines a model even at λ=0,1; these boundary models have discriminant zero.

(Bennett–Siksek, §6, equation (17), p.367; BS20 line 513. The coefficient and coordinate formulas are derived in the native conventions.)

The supporting API states:

- The native affine equation of L(λ) is equivalent to y²=x(x−1)(x−λ).
- (L(λ)).map f=L(f(λ)) for every ring homomorphism f.
- L(λ)=L(μ) iff λ=μ, over every commutative ring (compare a₄).
- L(λ) is in native normal form a₁=a₃=0.

One proof proceeds as follows. Specify the five coefficients in WeierstrassCurve; the factored equation follows by ring algebra from Affine.equation_iff.

**Checks.**

- Over ℚ, (L(−1)).a₂=0 and (L(−1)).a₄=−1. This tests the coefficient specialization rather than a short equation with the wrong a₂.
- Over ℚ, (L(2)).Δ=64. This tests the coefficient specialization rather than a short equation with the wrong a₂.
- Over ℚ, (L(1/2)).Δ=1. This tests the coefficient specialization rather than a short equation with the wrong a₂.
- Over ℚ, L(0) is not elliptic (Δ=0). This tests the coefficient specialization rather than a short equation with the wrong a₂.
- λ=−1 has equation y²=x³−x; λ=2 has Δ=64; λ=1/2 has Δ=1 over ℚ. This tests the coefficient specialization rather than a short equation with the wrong a₂.
- Over 𝔽₃, λ=2 gives Δ=1 and c₄=0, hence j=0; excluding j=0 would discard a nonsingular model. This tests the coefficient specialization rather than a short equation with the wrong a₂.
- Over the zero ring all coefficients and Δ are 0=1, so Δ is a unit; the field-only nonzero criterion cannot be asserted for every ring. This tests the coefficient specialization rather than a short equation with the wrong a₂.
- In 𝔽₅[ε]/(ε²), λ=2+ε gives Δ=4+2ε, a unit with inverse 4+3ε; the coefficient identities apply to nonreduced rings too. This tests the coefficient specialization rather than a short equation with the wrong a₂.

*Needs:* Mathlib `WeierstrassCurve`; Mathlib `WeierstrassCurve.Affine.Equation`.

### 0.2 The scaled Legendre equation

Define `scaledLegendre` by the following coefficient specialization. For a commutative ring R and d,λ∈R, L(d,λ) has coefficients (0,−d(1+λ),0,d²λ,0), hence equation y²=x(x−d)(x−dλ). For fields with 2≠0 it is the native quadratic twist (L(λ)) with parameters (0,−d/4): its twisting discriminant is d, not 4d.

(Bennett–Siksek, §6, proof of Lemma 6.6, p.371; BS20 line 703. The coefficient and coordinate formulas are derived in the native conventions.)

The supporting API states:

- The affine equation is equivalent to y²=x(x−d)(x−dλ).
- L(1,λ)=L(λ).
- Mapping coefficients along f gives L(f(d),f(λ)).
- Over a field with 2≠0, L(d,λ) equals the native quadratic twist of L(λ) with parameters (0,−d/4).

One proof proceeds as follows. Specify the coefficients and factor the cubic. At 2≠0 compare all five coefficients with native quadratic twist at t=0,n=−d/4.

**Checks.**

- Over ℚ, L(1,1/2)=L(1/2). This distinguishes root scaling from an admissible coordinate scaling.
- L(2,1/2) over ℚ has a₂=−3,a₄=2,Δ=64. This distinguishes root scaling from an admissible coordinate scaling.
- For d=0 all five coefficients vanish, and Δ=0, for every λ. This distinguishes root scaling from an admissible coordinate scaling.
- d=1 recovers L(λ); d=2 recovers F′_λ exactly, not merely the same j-invariant. This distinguishes root scaling from an admissible coordinate scaling.

*Needs:* §0.1; Tau Ceti `WeierstrassCurve.quadraticTwistOf`.

### 0.3 Six labelled Legendre parameters

For a field K, the labelled parameter tuple at λ is the Fin 6-indexed tuple (λ,1/λ,1−λ,1/(1−λ),λ/(λ−1),(λ−1)/λ). Labelled entries are retained, including repetitions. Mathematical parameter assertions require λ≠0,1; the tuple is a total rational-expression construction but its degenerate values are not valid parameters.

(Bennett–Siksek, §6, proof of Lemma 6.2, p.368; BS20 line 544. The coefficient and coordinate formulas are derived in the native conventions.)

The supporting API states:

- The six evaluations, in the declared order, are exactly the displayed rational expressions.
- If λ≠0,1 then every labelled entry is different from 0 and 1.
- Labels (0,1), (2,3), and (4,5) have product 1 when λ≠0,1.
- An injective field homomorphism maps every labelled entry to the corresponding entry at f λ.

One proof proceeds as follows. Evaluate the six rational expressions at their labels. Retain every label: exceptional parameters have coincident entries. The moduli-level S₃-action and invariant-ring theory remain ModularCurves 9E imports, not targets here.

**Checks.**

- At −1 over ℚ the tuple is (−1,−1,2,1/2,1/2,2). This distinguishes the labelled tuple from a set of six distinct values.
- At 2 over ℚ the tuple is (2,1/2,−1,−1,2,1/2). This distinguishes the labelled tuple from a set of six distinct values.
- At 1/2 over ℚ the tuple is (1/2,2,1/2,2,−1,−1). This distinguishes the labelled tuple from a set of six distinct values.
- At 3 over ℚ the tuple is (3,1/3,−2,−1/2,3/2,2/3). This distinguishes the labelled tuple from a set of six distinct values.
- The generic rational tuple at λ=3 has six distinct values; at λ=−1 its image is only {−1,2,1/2}. This distinguishes the labelled tuple from a set of six distinct values.
- At λ=0 the total tuple is (0,0,1,1,0,0), and at λ=1 it is (1,1,0,0,0,0); these are not six nonsingular parameters. This distinguishes the labelled tuple from a set of six distinct values.

*Needs:* Mathlib `WeierstrassCurve`.

### 0.4 Legendre discriminant and ellipticity

For every commutative ring, Δ(L(λ))=16λ²(1−λ)² and c₄(L(λ))=16(λ²−λ+1). Over a field with 2≠0, L(λ) is elliptic iff λ≠0 and λ≠1; for these parameters its native j-invariant equals 256(λ²−λ+1)³/(λ²(1−λ)²). The identities form one simultaneous coefficient calculation.

(Bennett–Siksek, §6, equation (17), p.367; explicit coefficient computation; BS20 line 513. The coefficient and coordinate formulas are derived in the native conventions.)

One proof proceeds as follows. Substitute the five coefficients into native b₂,b₄,b₆,b₈,c₄,Δ. Factor the discriminant; over a field apply ellipticity iff Δ is a unit. Divide c₄³ by Δ only on an elliptic model. No hypothesis j≠0 or j≠1728 is imposed.

**Checks.**

- At λ=−1,2,1/2 the j-invariant is 1728. In characteristic 2 the discriminant vanishes for every λ. This tests the sign and factors in the native invariant formulas.
- At λ=−1 over ℚ, (Δ,c₄,j)=(64,48,1728). This tests the sign and factors in the native invariant formulas.
- In characteristic 2, Δ=0 for every λ; over 𝔽₃, λ=2 has Δ=1 and j=0. This tests the sign and factors in the native invariant formulas.

*Needs:* §0.1; Mathlib `WeierstrassCurve.Δ`; Mathlib `WeierstrassCurve.c₄`; Mathlib `WeierstrassCurve.j`; Mathlib `WeierstrassCurve.IsElliptic`.

### 0.5 Scaled Legendre discriminant

Δ(L(d,λ))=16d⁶λ²(1−λ)² and c₄(L(d,λ))=16d²(λ²−λ+1). For a field with 2≠0 and d≠0, L(d,λ) is elliptic iff λ≠0,1; on elliptic models j(L(d,λ))=j(L(λ)).

(Bennett–Siksek, §6, F′_λ in proof of Lemma 6.6, p.371; BS20 line 703. The coefficient and coordinate formulas are derived in the native conventions.)

One proof proceeds as follows. Compute the coefficients or specialize the native discriminant and c₄ twist identities with twisting discriminant d. Apply native j-invariance under twisting. The d≠0 assumption is indispensable; over a ring nonzero must be replaced by IsUnit where ellipticity is claimed.

**Checks.**

- At d=2, λ=1/2, Δ=64 and j=1728; at d=0 singularity is explicit. This tests the different powers d² and d⁶ in c₄ and Δ.
- At d=2,λ=1/2 over ℚ, (Δ,c₄,j)=(64,48,1728); d=0 gives Δ=0. This tests the different powers d² and d⁶ in c₄ and Δ.
- For d=2,λ=3, Δ=36864 and c₄=448; the powers d⁶ and d² distinguish root scaling from a coordinate isomorphism. This tests the different powers d² and d⁶ in c₄ and Δ.

*Needs:* §0.2; §0.4; Tau Ceti `WeierstrassCurve.Δ_quadraticTwistOf`; Tau Ceti `WeierstrassCurve.c₄_quadraticTwistOf`; Tau Ceti `WeierstrassCurve.j_quadraticTwistOf`.

### 0.6 Root-ordering cross-ratios

Let e₀,e₁,e₂ be pairwise distinct in a field, and λ=(e₂−e₀)/(e₁−e₀). The cross-ratios obtained from root orders (012),(021),(102),(120),(210),(201) equal, respectively, the six entries of the labelled parameter tuple at λ. Each lies outside {0,1}. Repetitions in values do not collapse the six root orderings.

(Bennett–Siksek, §6, six ratios in proof of Lemma 6.2, p.368; BS20 line 544. The coefficient and coordinate formulas are derived in the native conventions.)

One proof proceeds as follows. Write every quotient in terms of d=e₁−e₀ and λ using e₂−e₀=dλ. Cancel only the nonzero differences; compute each numerator and denominator. The conclusion concerns ordered equations and does not classify all curves with that j-invariant.

**Checks.**

- Roots (0,1,−1) produce exactly the labelled exceptional tuple; roots (0,1,3) produce the generic tuple. This tests the order of the numerator and denominator in the root ratio.
- Roots (3,5,9) give ratios (3,1/3,−2,−1/2,3/2,2/3). This tests the order of the numerator and denominator in the root ratio.
- Coincident roots (0,0,1) give a zero denominator in the first ratio; total division yields 0 rather than a legitimate parameter. This tests the order of the numerator and denominator in the root ratio.

*Needs:* §0.3.

### 0.7 The native scalar-twist identity

Over a field with 2≠0, L(d,λ) equals the native quadratic twist of L(λ) with parameters (0,−d/4). The native twisting discriminant 0²−4(−d/4) is exactly d, so the twist is elliptic iff d≠0 and L(λ) is elliptic.

(Bennett–Siksek, §6, proof of Lemma 6.6, p.371; BS20 line 703. The coefficient and coordinate formulas are derived in the native conventions.)

One proof proceeds as follows. Compare all five native coefficients. Use the native unit-discriminant criterion for ellipticity of a twist.

**Checks.**

- d=2 gives parameters (0,−1/2), not (0,−2); the latter produces scalar 8. This distinguishes the twisting discriminant d from 4d.

*Needs:* §0.2; §0.1; Tau Ceti `WeierstrassCurve.quadraticTwistOf`; Tau Ceti `WeierstrassCurve.isElliptic_quadraticTwistOf_iff`; §0.5.

### 0.8 Legendre normalization of a split cubic

Let W over a field K with 2≠0 be in native normal form a₁=a₃=0, with cubic f=(X−e₀)(X−e₁)(X−e₂) and pairwise distinct roots. Set d=e₁−e₀, λ=(e₂−e₀)/d. Translation x_old=x_new+e₀,y_old=y_new gives a native admissible coordinate change C with C•W=L(d,λ). Hence W is a quadratic twist of L(λ) in the precise native coefficient sense, d≠0 and λ≠0,1. Reordering roots yields exactly the six parameters, with the corresponding twist scalar recomputed.

(Bennett–Siksek, §6, Legendre discussion p.367 and proof of Lemma 6.2 p.368; BS20 line 544. The coefficient and coordinate formulas are derived in the native conventions.)

One proof proceeds as follows. Expand the split monic cubic and translate by e₀ using the native admissible coordinate change action. The translated roots are 0,d,dλ; compare the five coefficients with L(d,λ). Apply §0.6 to every ordering and the scaled/native-twist coefficient identity. Translation is a K-isomorphism; passage to L(λ) itself is a twist, not generally a K-isomorphism.

**Checks.**

- For roots (3,5,9), d=2,λ=3; translation gives y²=x(x−2)(x−6). This fixes the direction of the coordinate translation.
- For roots (3,5,9), the original coefficients are a₂=−17,a₄=87,a₆=−135; translation by +3 yields a₂=−8,a₄=12,a₆=0. This fixes the direction of the coordinate translation.
- Over ℚ the resulting d=2 is nonsquare; an unscaled normalization requiring √2 over ℚ fails. This fixes the direction of the coordinate translation.

*Needs:* §0.2; §0.6; §0.7; Mathlib `WeierstrassCurve.VariableChange`; Tau Ceti `WeierstrassCurve.Affine.f`.

### 0.9 Normalization from full rational two-torsion

If E/ℚ is an elliptic Weierstrass curve whose native rational point group has exactly four points killed by 2, there exist a native rational admissible coordinate change C, d∈ℚ× and λ∈ℚ\{0,1} such that C•E=L(d,λ). All associated parameters are precisely the labelled six root-ordering parameters, allowing coincidences. The headline is `exists_scaledLegendre_of_full_two_torsion`.

(Bennett–Siksek, §6, following equation (17), p.367; BS20 line 513. The coefficient and coordinate formulas are derived in the native conventions.)

One proof proceeds as follows. Use native toCharNeTwoNF to complete the square. Transport the native point group by the variable change. Apply native card_ker_nsmul_two: the normalized cubic has exactly three rational roots. Ellipticity makes it separable, so they are distinct; degree three and monicity give the split factorization. Apply §0.8. The normalization does not use an automorphism classification and works at j=0 and j=1728 as well.

**Checks.**

- E:y²=x³−x is normalized by d=1,λ=−1 and has the three nonzero rational two-torsion points (0,0),(1,0),(−1,0). This tests normalization on the native point group rather than an assumed unscaled model.

*Needs:* §0.8; Mathlib `WeierstrassCurve.toCharNeTwoNF`; Tau Ceti `WeierstrassCurve.Affine.card_ker_nsmul_two`; Tau Ceti `WeierstrassCurve.Affine.Point.addEquivVariableChange`; Tau Ceti `WeierstrassCurve.Affine.separable_f`.

### 0.10 The three labelled two-torsion points

For a field K with 2≠0,d≠0,λ≠0,1, the labelled root-point tuple for d,λ is the Fin 3-indexed tuple of native points (0,0),(d,0),(dλ,0) of L(d,λ), each supplied with its native nonsingularity proof. Their y-coordinate is zero; the point at infinity is not an entry.

(Bennett–Siksek, §6, descent discussion and Lemma 6.5, p.370; BS20 line 655. The coefficient and coordinate formulas are derived in the native conventions.)

The supporting API states:

- The three labelled points have exactly the root coordinates displayed in the definition.
- 2•T_j=O for every label j.
- The Fin 3 tuple is injective and all its entries are nonzero points.
- A native point P satisfies 2•P=O iff P=O or P is one of the three labelled points.

One proof proceeds as follows. Use §0.5 for ellipticity and the factored equation to prove each displayed point nonsingular. Use native negation and addition to show doubling is zero; distinct roots distinguish the three points. Their sum is O by the horizontal line y=0.

**Checks.**

- For d=1,λ=−1 over ℚ the labelled coordinates are (0,0),(1,0),(−1,0). This distinguishes affine root points from O.
- For d=2,λ=1/2 over ℚ the coordinates are (0,0),(2,0),(1,0). This distinguishes affine root points from O.
- For d=1,λ=3 over ℚ the sum of the three labelled native points is O, and each is killed by doubling. This distinguishes affine root points from O.
- The native kernel of doubling consists of O and these three points. This distinguishes affine root points from O.

*Needs:* §0.2; §0.5; Mathlib `WeierstrassCurve.Affine.Point`.

### 0.11 Exhaustion of Legendre two-torsion

On L(d,λ) over a field with 2≠0,d≠0,λ≠0,1, a native point P is killed by doubling iff P=O or P is one of (0,0),(d,0),(dλ,0). These four points are distinct; hence the doubling kernel has cardinality 4.

(Bennett–Siksek, §6, Lemmas 6.3 and 6.5, pp.368,370; BS20 line 655. The coefficient and coordinate formulas are derived in the native conventions.)

One proof proceeds as follows. Native y_eq_zero_of_order_two gives y=0 for any affine two-torsion point. The factored cubic then forces x∈{0,d,dλ}; the construction supplies all three, and the native point constructors distinguish them from O. This is an equation-specific enumeration, not a general torsion-basis construction.

**Checks.**

- For λ=−1 the four points are O,(0,0),(1,0),(−1,0); none is lost at j=1728. This tests both inclusions and the count of the doubling kernel.

*Needs:* §0.10; §0.2; §0.5; Tau Ceti `WeierstrassCurve.y_eq_zero_of_order_two`; Tau Ceti `WeierstrassCurve.Affine.card_ker_nsmul_two`.

### Examples

For L(−1)/ℚ, the rational two-torsion points are (0,0),(1,0),(−1,0), the discriminant is 64 and j=1728. The labelled tuple is (−1,−1,2,1/2,1/2,2). For roots (3,5,9), translation by +3 gives d=2,λ=3; its six values are (3,1/3,−2,−1/2,3/2,2/3).

### Dependencies

Mathlib equation, invariant, normal-form and point-group APIs; Tau Ceti point transport, quadratic twists and two-torsion root count. Within the layer: equations precede invariants, ordered roots precede normalization, and distinct roots precede labelled point enumeration.

## Layer 1: Good reduction and character conductors

### 1.1 Nonintegral Legendre parameters force nonintegral j

Let p be an odd rational prime and λ∈ℚ\{0,1}. Write a=v_p(λ), b=v_p(1−λ). If a<0 then b=a and v_p(j(L(λ)))=2a<0. If a>0 then b=0 and v_p(j(L(λ)))=−2a<0. If b>0 then a=0 and v_p(j(L(λ)))=−2b<0. Consequently v_p(j(L(λ)))≥0 implies a=b=0.

(Bennett–Siksek, §6, Lemma 6.2(i), pp.367–368; alternate explicit invariant proof; BS20 line 526. The coefficient and coordinate formulas are derived in the native conventions.)

One proof proceeds as follows. Apply native padicValRat.add_eq_min to λ+(1−λ)=1; the three bad cases above exhaust failure of a=b=0. When λ or 1−λ has positive valuation, λ²−λ+1 is a unit; when a<0 its λ² term uniquely has the least valuation 2a. Use j=256(λ²−λ+1)³/(λ²(1−λ)²). The factor 256 is a p-adic unit even at p=3. Over ℚ the numerator factor λ²−λ+1=(λ−1/2)²+3/4 is positive, so j and every factor entering the valuation formula are nonzero. There is no assumption that j itself is a unit.

**Checks.**

- λ=3 at p=3 gives valuations (1,0) and v₃(j)=−2; λ=1/3 at p=3 gives (−1,−1) and v₃(j)=−2. At λ=−1,p=3 j=1728 has positive valuation although both parameter factors are units. This distinguishes integral j from unit j and exposes the excluded dyadic case.
- At λ=2,p=2, v₂(j)=6 but v₂(λ)=1; the odd-prime hypothesis is necessary. This distinguishes integral j from unit j and exposes the excluded dyadic case.
- At λ=3,p=3, (v₃(λ),v₃(1−λ),v₃(j))=(1,0,−2); at λ=1/3 the triple is (−1,−1,−2). This distinguishes integral j from unit j and exposes the excluded dyadic case.
- At λ=−1,p=3, the triple is (0,0,3); integral j need not be a unit. This distinguishes integral j from unit j and exposes the excluded dyadic case.

*Needs:* §0.4; Mathlib `padicValRat`; Mathlib `padicValRat.mul`; Mathlib `padicValRat.div`; Mathlib `padicValRat.add_eq_min`.

### 1.2 Parameters at good odd primes

Let F/ℚ be elliptic and suppose an admissible rational change C identifies C•F with L(d,λ), where d≠0 and λ∉{0,1}. For an odd prime p, assume the minimal equation of the base change of F to ℚ_p has good reduction. Then v_p(λ)=v_p(1−λ)=0. This holds for every associated root ordering. The theorem does not require semistability; in particular it applies to the semistable-away-from-2 curves of Lemma 6.2(i). Its native statement is `legendre_units_of_good_reduction`.

(Bennett–Siksek, §6, Lemma 6.2(i), pp.367–368; BS20 line 526. The coefficient and coordinate formulas are derived in the native conventions.)

One proof proceeds as follows. At a good minimal local model, c₄ is integral and Δ is a unit, so j is integral. The generic local/minimal-model comparison is imported from EllipticCurves Layer 4. Native j invariance under admissible coordinate change and native quadratic twist identifies j(F) with j(L(λ)). Apply §1.1. For every root ordering the same argument applies; never infer good reduction of a ramified quadratic twist merely from equal j.

**Checks.**

- F:y²=x³−x, λ=−1,2,1/2: at every odd good prime all three parameters and their complements are units. This tests curve-level good reduction rather than the displayed discriminant.
- For F=L(−1), p=3 gives v₃(−1)=v₃(2)=0 while v₃(j)=3; the proof cannot demand unit j. This tests curve-level good reduction rather than the displayed discriminant.
- A scaling of a good model by a uniformizer can raise its displayed discriminant valuation by 12 without changing good curve-level reduction. This tests curve-level good reduction rather than the displayed discriminant.

*Needs:* §1.1; §0.9; §0.5; TauCetiRoadmap.EllipticCurves Layer 4 and its rational-local-unit-reduction contract; Mathlib `WeierstrassCurve.variableChange_j`; Mathlib `WeierstrassCurve.minimal`.

### 1.3 Nonsingular reduction of the unit Legendre model

For λ∈ℚ\{0,1} and an odd prime p with v_p(λ)=v_p(1−λ)=0, the coefficient model L(λ) is integral over ℤ_p with unit discriminant. Its reduction is an elliptic Legendre model over 𝔽_p with parameter λ̄≠0,1; the curve has good reduction at p. This statement is about L(λ) itself, not an arbitrary d-twist. The headline is `legendre_good_reduction_of_units`.

(Bennett–Siksek, §6, proof of Lemma 6.4, p.368; BS20 line 567. The coefficient and coordinate formulas are derived in the native conventions.)

One proof proceeds as follows. The coefficients −(1+λ),λ are integral; Δ=16λ²(1−λ)² is a unit. The integral unit-discriminant equation is minimal and reduces nonsingularly, using native reduction predicates and the generic local comparison. Reduction of both nonzero units excludes the two singular parameters.

**Checks.**

- λ=3,p=5 gives good reduction; λ=3,p=3 fails the unit hypothesis and Δ is divisible by 3. This tests minimal good reduction of the unscaled equation.
- At λ=3,p=5, Δ=576≡1 and λ̄=3,1−λ̄=3 are nonzero; at p=3, v₃(Δ)=2 and λ̄=0. This tests minimal good reduction of the unscaled equation.
- At p=2, even two parameter units cannot occur in 𝔽₂: λ̄=1 forces 1−λ̄=0. This tests minimal good reduction of the unscaled equation.

*Needs:* §0.4; §0.1; TauCetiRoadmap.EllipticCurves Layer 4 and its rational-local-unit-reduction contract; Mathlib `WeierstrassCurve.HasGoodReduction`; Mathlib `WeierstrassCurve.hasGoodReduction_iff_isElliptic_reduction`; Mathlib `WeierstrassCurve.minimal`.

### 1.4 Odd support of the attached primitive character

Let F/ℚ, C,d,λ be as in §1.2 and let ω∈{1,−1,2,−2}. Let N>0 and let χ be an integral-valued primitive Dirichlet character modulo N satisfying χ(q)=(ωλ/q) at every odd prime q with v_q(ωλ)=0. Then every odd prime dividing N is a bad prime of F. Equivalently, the odd prime support of N is contained in the bad odd prime set of F. This is `legendre_character_odd_support`; the prime-value hypothesis identifies an actual native character, and the supplier contract constructs it. As in §1.2, semistability is unnecessary for the support assertion.

(Bennett–Siksek, §6, Lemma 6.2(ii), pp.367–368; BS20 line 526. The coefficient and coordinate formulas are derived in the native conventions.)

One proof proceeds as follows. Use the rational-squareclass-character contract to identify χ and to read an odd conductor prime by the parity of v_p(ωλ). For odd p each allowed ω has valuation zero. If F had good reduction, §1.2 would give v_p(λ)=0, contradicting odd parity. This argument uses native primitive characters specified by prime values and never assumes the desired support containment.

**Checks.**

- For λ=3 the characters attached to ±3,±6 have possible odd support {3}, whereas for λ=−1,2,1/2 every such odd conductor is 1. This tests the primitive conductor, including conductor 1.
- For λ=3, the four radicands 3,−3,6,−6 have conductors 12,3,24,24, all with odd part 3. This tests the primitive conductor, including conductor 1.
- For λ=−1 the radicands −1,1,−2,2 have conductors 4,1,8,8; their odd parts are all 1. This tests the primitive conductor, including conductor 1.

*Needs:* §1.2; TauCetiRoadmap.ClassicalArithmeticCompletion §§1.7–1.8 and its rational-squareclass-character contract; Mathlib `padicValRat.mul`.

### 1.5 Odd character conductor divides the elliptic conductor

Let F/ℚ have full rational two-torsion and be semistable away from 2, choose any of its associated parameters λ, and let ω∈{1,−1,2,−2}. If N is the primitive conductor of the character of ωλ and M is the actual elliptic conductor of F, then the odd part of N divides M, hence divides the squarefree odd part of M. The theorem includes N=1. The source does not supply nontriviality of the odd conductor under these hypotheses alone.

(Bennett–Siksek, §6, Lemma 6.2(ii), pp.367–368; BS20 line 526. The coefficient and coordinate formulas are derived in the native conventions.)

One proof proceeds as follows. The supplier gives squarefree odd character conductor. The support theorem puts each of its prime factors in the bad-prime set of F. NeronModelsAndSemistableAbelianVarieties §5.3g puts each such prime in M and identifies exponent one under multiplicative reduction. Prime factorization gives divisibility. The same support argument also proves divisibility without semistability, while the squarefree-odd-M wording uses semistability.

**Checks.**

- F:y²=x³−x has conductor 32; all four ω at λ=−1 give characters with odd conductor 1, so the result is valid without a nontrivial-character hypothesis. This distinguishes conductor divisibility from conductor nontriviality.
- For F=L(−1) with M=32, the four odd character conductors are 1 and 1∣32. This distinguishes conductor divisibility from conductor nontriviality.
- For λ=3, ω=1, the character has N=12 and odd part 3; the displayed discriminant 576 is not the definition of M. This distinguishes conductor divisibility from conductor nontriviality.

*Needs:* §1.4; TauCetiRoadmap.ClassicalArithmeticCompletion §§1.7–1.8 and its rational-squareclass-character contract; TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties §§5.3a, 5.3g; TauCetiRoadmap.EllipticCurves Layer 4 and its rational-local-unit-reduction contract.

### Examples

For λ=3, j=21952/9 and v₃(j)=−2. For λ=1/3 the same j has v₃(j)=−2. For λ=−1 the value 1728 has v₃=3 while both parameter factors are units. The character of 3 has conductor 12 and odd part 3; the character of 1 has conductor 1.

### Dependencies

Layer 0 equations, invariant formulas and rational normalization; EllipticCurves Layer 4; ClassicalArithmeticCompletion §§1.7–1.8 with the stated rational-squareclass specialization; NeronModelsAndSemistableAbelianVarieties §§5.3a, 5.3g. Character conductors require no descent or finite-field torsion result.

## Layer 2: Split-cubic readings of the native descent map

Throughout this layer K is a field with 2≠0, d≠0 and λ∉{0,1}; native point-group assertions use decidable equality on K. All three coordinates use the fixed root order (0,d,dλ). The target is a reading of the native descent map, not a second descent construction.

### 2.1 The Legendre split-cubic CRT

For L(d,λ) under the standing hypotheses, define the ordered root-evaluation equivalence to be the canonical root-evaluation ring equivalence A=K[X]/(X(X−d)(X−dλ)) ≃ K×K×K, in root order (0,d,dλ). It is an adapter for the native Affine.A étale algebra, not a replacement algebra.

(Bennett–Siksek, §6, two-descent display preceding Lemma 6.5, p.370; BS20 line 655. The coefficient and coordinate formulas are derived in the native conventions.)

The supporting API states:

- The class of h(X) maps to (h(0),h(d),h(dλ)).
- Two native A classes agree iff their three root evaluations agree.
- The native AdjoinRoot root maps to (0,d,dλ).
- A class is a unit iff every root evaluation is nonzero.

One proof proceeds as follows. The three linear factors are pairwise coprime because d, dλ, d(1−λ) are nonzero. Apply the native CRT decomposition at root 0 (equivProdA′), then the polynomial CRT on its cofactor and quotientSpanXSubC at d and dλ. The inverse sends (a₀,a₁,a₂) to the class of Σ_j a_j ∏ₖ≠ⱼ(X−e_k)/(e_j−e_k), where (e₀,e₁,e₂)=(0,d,dλ). Every denominator is nonzero by distinctness of the roots.

**Checks.**

- At d=1,λ=−1 over ℚ, the root maps to (0,1,−1). This tests the fixed root order and unit domain of the equivalence.
- At d=2,λ=1/2 over ℚ, the root maps to (0,2,1). This tests the fixed root order and unit domain of the equivalence.
- The class of X is not a unit, since its first coordinate is zero; its squareclass is not formed. This tests the fixed root order and unit domain of the equivalence.
- A polynomial class maps to (h(0),h(d),h(dλ)), and constants map diagonally. This tests the fixed root order and unit domain of the equivalence.

*Needs:* §0.2; §0.5; Tau Ceti `WeierstrassCurve.Affine.A`; Tau Ceti `WeierstrassCurve.Affine.equivProdA'`; Tau Ceti `WeierstrassCurve.Affine.equivProdA'_apply`; Mathlib `Ideal.quotientMulEquivQuotientProd`; Mathlib `Polynomial.quotientSpanXSubCAlgEquiv`.

### 2.2 Evaluation through the split-cubic CRT

The class of h(X) maps to (h(0),h(d),h(dλ)).

(Bennett–Siksek, §6, split descent discussion p.370; BS20 line 655. The coefficient and coordinate formulas are derived in the native conventions.)

One proof proceeds as follows. Evaluate the two successive native CRT maps on a polynomial class; the native equivProdA′_apply and the linear quotient evaluation give the three values.

**Checks.**

- The constant 1 maps to (1,1,1), the root to (0,d,dλ). This tests polynomial evaluation rather than a permutation of roots.
- At d=2,λ=3, h=X+1 has values (1,3,7) and h=X² has values (0,4,36). This tests polynomial evaluation rather than a permutation of roots.

*Needs:* §2.1; Tau Ceti `WeierstrassCurve.Affine.equivProdA'_apply`; Mathlib `Polynomial.quotientSpanXSubCAlgEquiv`.

### 2.3 Root readings of native squareclasses

Define the split squareclass equivalence to be the induced multiplicative equivalence from native M=Aˣ/(Aˣ)² to (Kˣ/(Kˣ)²)³, obtained from the ordered root-evaluation equivalence. It transports μ values; it defines neither a new generic descent homomorphism nor a new kernel theorem.

(Bennett–Siksek, §6, two-descent display preceding Lemma 6.5, p.370; BS20 line 655. The coefficient and coordinate formulas are derived in the native conventions.)

The supporting API states:

- For a native A unit u, its image is the triple of squareclasses of the three CRT unit evaluations.
- The trivial native squareclass maps to (1,1,1).
- A native squareclass is 1 iff all three coordinate squareclasses are 1.
- The reading preserves multiplication; it is an equivalence, not merely a map.

One proof proceeds as follows. Map units through the root-evaluation ring equivalence. This carries the square subgroup bijectively onto the product of the three square subgroups; descend it and its inverse through the native quotient construction. Use the equivalence to read the native μ and its norm condition.

**Checks.**

- At d=1,λ=−1 over ℚ, the class of 1 maps to (1,1,1). This distinguishes unit squareclasses from field elements.
- At d=1,λ=2 over ℚ, the class of constant 4 maps to (1,1,1). This distinguishes unit squareclasses from field elements.
- At d=1,λ=1/2 over ℚ, constant 2 is a unit whose class maps to ([2],[2],[2])≠(1,1,1). This distinguishes unit squareclasses from field elements.
- A unit class maps to the three unit-evaluation classes; the class of 1 maps to (1,1,1). This distinguishes unit squareclasses from field elements.

*Needs:* §2.1; Tau Ceti `WeierstrassCurve.Affine.M`; Mathlib `QuotientGroup.map`.

### 2.4 Unit-class root readings

For a native A unit u, its image is the triple of squareclasses of the three CRT unit evaluations.

(Bennett–Siksek, §6, split descent discussion p.370; BS20 line 655. The coefficient and coordinate formulas are derived in the native conventions.)

One proof proceeds as follows. Map the native unit through CRT; quotient maps identify its three evaluations modulo squares.

**Checks.**

- A constant square maps to three trivial classes; zero never supplies a unit. This tests that the quotient reading preserves units and squares.
- For the same rational roots, constant 4 has pattern (1,1,1), while constant 2 has ([2],[2],[2]); constant 0 is excluded from the unit group. This tests that the quotient reading preserves units and squares.

*Needs:* §2.3; §2.2; Mathlib `QuotientGroup.map`.

### 2.5 Native descent away from the roots

For an affine native point (x,y) on L(d,λ) with x∉{0,d,dλ}, the split reading of μ(P) is ([x],[x−d],[x−dλ]), with all three representatives nonzero. The image of O is (1,1,1).

(Bennett–Siksek, §6, two-descent discussion, p.370; BS20 line 655. The coefficient and coordinate formulas are derived in the native conventions.)

One proof proceeds as follows. Use native μ_apply followed by μ₀_some to pass from μ of the affine point to μX of its x-coordinate. The factored cubic is nonzero at x, so native μX uses its nonroot representative x−θ. Apply the CRT evaluation and quotient-unit reading. At O use native μ_apply and μ₀_zero.

**Checks.**

- For a nonroot point the product class is [y²]=1, not the class of an arbitrary cubic value. This distinguishes the nonroot representative from the corrected root branch.
- On L(−1)/𝔽₅, P=(2,4) has representatives (2,1,3), product 6≡1=y² and squareclass pattern (nonsquare,square,nonsquare). This distinguishes the nonroot representative from the corrected root branch.
- At a root x=0 the uncorrected first entry would be 0, which is not a unit; that point belongs to the separate root branch. This distinguishes the nonroot representative from the corrected root branch.

*Needs:* §2.3; §2.1; §0.2; Tau Ceti `WeierstrassCurve.Affine.μ`; Tau Ceti `WeierstrassCurve.Affine.μ_apply`; Tau Ceti `WeierstrassCurve.Affine.μX_of_eval_f_ne_zero`; Tau Ceti `WeierstrassCurve.Affine.μ₀_zero`; §2.2; §2.4; Tau Ceti `WeierstrassCurve.Affine.μ₀_some`.

### 2.6 Native descent at the three two-torsion points

The split readings at T₀,T_d,T_dλ on L(d,λ) are respectively ([d²λ],[−d],[−dλ]), ([d],[d²(1−λ)],[d(1−λ)]), and ([dλ],[d(λ−1)],[d²λ(λ−1)]). All representatives are nonzero. The entry at a root is the derivative product of the other two differences, not zero.

(Bennett–Siksek, §6, Lemma 6.5 and proof of Lemma 6.6, pp.370–371; BS20 line 655. The coefficient and coordinate formulas are derived in the native conventions.)

One proof proceeds as follows. Use native μ_apply followed by μ₀_some to pass from μ of the affine point to μX of its x-coordinate. At a root r native μX uses r−θ+fCofactor(r), not r−θ alone. At its own root evaluation fCofactor(r)(r)=f′(r)=∏ₛ≠ᵣ(r−s); at other roots the cofactor vanishes and r−s remains. Compute the displayed three tuples in declared CRT order; units follow from distinct roots.

**Checks.**

- At d=1,λ=−1,p=5 the tuples reduce to (1,1,1),(1,[2],[2]),(1,[2],[2]); at d=2 and conic λ=2t²,1−λ=2v² the last tuple is entirely square over a field containing i²=−1. This tests the derivative entry in place of an inadmissible zero class.
- On L(−1)/𝔽₅ the raw tuples at roots 0,1,−1 are (4,4,1),(1,2,2),(4,3,2); their squareclass patterns are (1,1,1),(1,[2],[2]),(1,[2],[2]). This tests the derivative entry in place of an inadmissible zero class.
- For d=2,λ=3 over ℚ the tuples are (12,−2,−6),(2,−8,−4),(6,4,24), whose products are 144,64,576. This tests the derivative entry in place of an inadmissible zero class.

*Needs:* §2.3; §2.1; §0.10; §0.2; Tau Ceti `WeierstrassCurve.Affine.μX_of_eval_f_eq_zero`; Tau Ceti `WeierstrassCurve.Affine.μ_apply`; §2.2; §2.4; Tau Ceti `WeierstrassCurve.Affine.μ₀_some`.

### 2.7 Product of the split descent coordinates

For every native point P on L(d,λ), the product of the three split readings of μ(P) is 1. This expresses the native norm condition in the three split coordinates; it holds at O and at the two-torsion roots as well.

(Bennett–Siksek, §6, two-descent discussion p.370; BS20 line 655. The coefficient and coordinate formulas are derived in the native conventions.)

One proof proceeds as follows. For O, use native μ_apply and μ₀_zero and the multiplicative equivalence, so all three classes are 1. For a point away from the roots, §2.5 gives representatives x,x−d,x−dλ. Their product is y² by the scaled equation, and y≠0, so its unit squareclass is 1. At T₀,T_d,T_dλ, §2.6 gives representative products d⁴λ², d⁴(1−λ)², d⁴λ²(λ−1)² respectively. Each is a nonzero square. The native normM_μ₀_eq_one gives the matching general norm condition; the coordinate proof does not assume an unstated split-norm comparison.

**Checks.**

- At T₀ the product of the representatives is d⁴λ²; it is a nonzero square. This tests the product condition also at roots and O.
- At O the product is 1·1·1=1; at P=(2,4) over 𝔽₅ it is [2·1·3]=[1]. This tests the product condition also at roots and O.

*Needs:* §2.3; §2.1; Tau Ceti `WeierstrassCurve.Affine.normM_μ₀_eq_one`; Tau Ceti `WeierstrassCurve.Affine.μ_apply`; §2.5; §2.6; Tau Ceti `WeierstrassCurve.Affine.μ₀_zero`; §0.2.

### 2.8 The Legendre halving criterion

For a native affine point P=(x,y) on L(d,λ) over K with 2≠0,d≠0,λ≠0,1, there exists Q∈L(d,λ)(K) with 2Q=P iff x,x−d,x−dλ are all squares in K. Here a field square may be 0, but zero is not passed to a unit squareclass. The criterion also covers the three two-torsion points. The headline is `scaledLegendre_halving_iff_squares`.

(Bennett–Siksek, §6, proof of Lemma 6.3, p.368; BS20 line 547. The coefficient and coordinate formulas are derived in the native conventions.)

One proof proceeds as follows. The native descent-kernel theorem gives halving iff μ(P)=1. Apply the split squareclass equivalence. Away from the roots, use §2.5. QuotientGroup.eq_one_iff says a unit class is trivial iff its representative lies in the range of squaring; a nonzero field square has a nonzero square root, hence a unit square root. At a root exactly one difference is zero. The other two classes are explicit and the root component is their product, so their being squares is equivalent to all three split classes being trivial. Zero is a square in the field, but it is never a unit representative.

**Checks.**

- At λ=−1 over ℚ, (0,0) is not divisible by 2 because −1 is not a rational square. Over 𝔽₅ it is divisible by 2. This distinguishes a field square, which may be zero, from a unit squareclass.
- For d=1,λ=−1 over ℚ, the three differences at (0,0) are 0,−1,1, so the criterion is false; over 𝔽₅ they are 0,4,1, so it is true. This distinguishes a field square, which may be zero, from a unit squareclass.
- Over 𝔽₅ at (1,0) the differences are 1,0,2, and 2 is nonsquare; the criterion is false even though zero is a field square. This distinguishes a field square, which may be zero, from a unit squareclass.

*Needs:* §2.5; §2.6; §2.3; Tau Ceti `WeierstrassCurve.Affine.ker_μ_eq`; Mathlib `QuotientGroup.eq_one_iff`.

### Examples

At roots (0,2,6), the root-element evaluations are (0,2,6), and the three root descent tuples have products 144,64,576. These are nonzero squares although none of the first representatives is zero. Over 𝔽₅ the point (2,4) on L(−1) has readings ([2],[1],[3]) with product 1.

### Dependencies

Layer 0 equation, roots and ellipticity; native XSubT algebra and descent, Mathlib polynomial and ideal CRT and quotient groups. Evaluation and quotient-unit readings precede descent formulas; both affine branches precede the product and halving theorems. No new generic norm comparison is an input.

## Layer 3: Two-primary torsion over prime fields

### 3.1 Two-by-four torsion over prime fields

Let p be prime, p≡3 mod4, and η∈𝔽_p\{0,1,−1}. The native point group of L(η²):y²=x(x−1)(x−η²) contains a subgroup additively isomorphic to ZMod 2 × ZMod 4. In particular 8 divides the native projective point count. Its native subgroup statement is `legendre_two_by_four_subgroup`.

(Bennett–Siksek, §6, Lemma 6.3, p.368; BS20 line 547. The coefficient and coordinate formulas are derived in the native conventions.)

One proof proceeds as follows. The two-torsion enumeration supplies all four points. Apply the halving criterion at (1,0). If 1−η² is a square, this point is a double. Otherwise the nonzero 1−η² is a nonsquare. Since −1 is a nonsquare when p≡3 mod4, η²−1 is a square. The criterion at (η²,0) now gives a half. A half P of a nonzero point killed by 2 has exact order 4. A different nonzero two-torsion point T is not 2P, hence is independent of ⟨P⟩. The map (a,b)↦aT+bP embeds ZMod 2×ZMod 4; native finite-point and count comparison give 8|projective point count.

**Checks.**

- At p=7,η=2,λ=4 the count is 8. Excluding η=0,±1 is essential: these give repeated cubic roots and not an elliptic group. This tests subgroup independence, beyond the existence of a point killed by four.
- At p=3 there is no η outside {0,1,−1}; this is a vacuous instance, not a singular point group. This tests subgroup independence, beyond the existence of a point killed by four.
- At p=7,η=2, the points P=(3,1) and T=(0,0) have orders 4 and 2, with 2P=(1,0)≠T; their generated subgroup has 8 elements. This tests subgroup independence, beyond the existence of a point killed by four.

*Needs:* §2.8; §0.11; §0.4; Mathlib `legendreSym.at_neg_one`; Mathlib `legendreSym.eq_neg_one_iff`; Tau Ceti `WeierstrassCurve.Affine.finite_point`; Tau Ceti `WeierstrassCurve.pointCount_eq_card_point`.

### 3.2 A half of the zero root on the minus-one model

For every field K with 2≠0 and a specified i with i²=−1, construct the native point P=(i,1−i) on L(−1). Prove that 2P=(0,0) and that P has exact additive order 4; `minus_one_half_order_four` states these conclusions together with native nonsingularity. At primes p≡5 mod8 a choice of i exists. Its choice is retained under field extension.

(Bennett–Siksek, §6, proof of Lemma 6.5, p.370; BS20 line 663. The coefficient and coordinate formulas are derived in the native conventions.)

The supporting API states:

- The coordinates are (i,1−i).
- Twice this point is the native point (0,0) on L(−1).
- This point has exact additive order 4.
- The first split coordinate of native μ at this point is the squareclass [i].
- For a field homomorphism K→L, the native point map L(−1)(K)→L(−1)(L) sends this chosen half to the half specified by f(i).

One proof proceeds as follows. Membership is (1−i)²=−2i=i(i−1)(i+1). The native tangent/doubling formula gives x(2P)=0,y(2P)=0; characteristic 2 is excluded and the tangent denominator is nonzero. The double is a nonzero two-torsion point, so order is 4.

**Checks.**

- For p=5,i=2, the coordinates are (2,4). This distinguishes the selected half from the two-torsion root.
- For p=5,i=3, the coordinates are (3,3). This distinguishes the selected half from the two-torsion root.
- At p=5,i=2, native doubling is (0,0) and the point is not two-torsion. This distinguishes the selected half from the two-torsion root.
- At p=5,i=2 the point is (2,4), and at i=3 it is (3,3). This distinguishes the selected half from the two-torsion root.
- At p=5,i=2, y²=1=x³−x and the tangent denominator 2y=3; at i=3, y²=4=x³−x and 2y=1. This distinguishes the selected half from the two-torsion root.

*Needs:* §0.1; §0.4; §0.10; Mathlib `ZMod.exists_sq_eq_neg_one_iff`; Mathlib `WeierstrassCurve.Affine.Point`; Mathlib `WeierstrassCurve.Affine.Point.map`; §2.5 for the descent-coordinate API.

### 3.3 Doubling the minus-one half

Under the field, nonzero-2 and specified-root hypotheses of §3.2, twice P=(i,1−i) is the native point (0,0) on L(−1).

(Bennett–Siksek, §6, Lemma 6.5 proof p.370; BS20 line 663. The coefficient and coordinate formulas are derived in the native conventions.)

One proof proceeds as follows. Use i²=−1 and the native tangent formula; its denominator 2(1−i) is nonzero. The doubled coordinates are (0,0).

**Checks.**

- At p=5,i=2 the native double of (2,4) is (0,0). This tests the direction and sign of native doubling.
- At p=5,i=3, the double of (3,3) is also (0,0), and its next double is O. This tests the direction and sign of native doubling.

*Needs:* §3.2; Mathlib `WeierstrassCurve.Affine.Point.add_self_of_Y_ne`.

### 3.4 Order of the minus-one half

Under the hypotheses of §3.2, P=(i,1−i) has exact additive order 4.

(Bennett–Siksek, §6, Lemma 6.5 proof p.370; BS20 line 663. The coefficient and coordinate formulas are derived in the native conventions.)

One proof proceeds as follows. Use the nonzero double (0,0) and the native root two-torsion enumeration. Exactly 4, not 1 or 2, is the additive order.

**Checks.**

- The p=5 example has 2P≠O,4P=O. This distinguishes exact order four from merely being killed by four.
- At p=5, either choice of i gives successive orders 4,2,1 for P,2P,4P. This distinguishes exact order four from merely being killed by four.

*Needs:* §3.3; §0.11.

### 3.5 First descent class of the minus-one half

Under the hypotheses of §3.2, the first split coordinate of native μ at P=(i,1−i) is the squareclass [i].

(Bennett–Siksek, §6, Lemma 6.5 proof p.370; BS20 line 663. The coefficient and coordinate formulas are derived in the native conventions.)

One proof proceeds as follows. The x-coordinate i is not 0,1,−1 since i²=−1 and characteristic is odd. Apply the native nonroot reading with d=1,λ=−1.

**Checks.**

- At p=5 both i=2 and i=3 have the nontrivial squareclass. This tests the chosen first root coordinate.
- At p=5 both i=2 and i=3 are nonsquares, with character −1; at p=17, i=4 is a square, so this nonsquareness requires p≡5 mod8. This tests the chosen first root coordinate.

*Needs:* §3.2; §2.5.

### 3.6 No order-eight point on the minus-one model

For p≡5 mod8 prime, L(−1)(𝔽_p) has no point of exact order 8. Only (0,0) among the three nonzero two-torsion points is divisible by 2; each of its four halves has nonsquare first descent coordinate. The headline is `legendre_minus_one_no_order_eight`.

(Bennett–Siksek, §6, proof of Lemma 6.5, p.370; BS20 line 663. The coefficient and coordinate formulas are derived in the native conventions.)

One proof proceeds as follows. The supplementary law says 2 is a nonsquare and −1 is a square. In §2.6 the tuples at (0,0),(1,0),(−1,0) are (1,1,1),(1,[2],[2]),(1,[2],[2]). Every point of order 4 must double to (0,0); its halves are the four translates of the minus-one half by the doubling kernel (enumerated in §0.11). Their first descent class is [i], since every root tuple has first class 1. An i with i²=−1 is a nonsquare: otherwise a square root of i would have order 8 in 𝔽_p×, contrary to p−1≡4 mod8 (equivalently Euler’s criterion gives i^((p−1)/2)=−1). The native descent-kernel theorem rules out halving any point of order 4, hence rules out order 8.

**Checks.**

- At p=5 the point group has 8 elements but exponent 4; thus 8|#E does not imply an order-eight element. This separates group order from the existence of an order-eight element.
- At p=13, the point count is 8 and every point has order 1,2 or 4. This separates group order from the existence of an order-eight element.
- At p=41, P=(6,13) has order 8 and the full count is 32; p≡1 mod4 alone is insufficient. This separates group order from the existence of an order-eight element.

*Needs:* §3.2; §2.6; §0.11; §2.8; Mathlib `legendreSym.at_two`; Mathlib `ZMod.euler_criterion`; §3.3; §3.4; §3.5; Tau Ceti `WeierstrassCurve.Affine.ker_μ_eq`.

### 3.7 Exact two-adic order of the minus-one point count

For p prime with p≡5 mod8, v₂(projective point count(L(−1)/𝔽_p))=3, equivalently 8 divides this positive integer and 16 does not divide it. The count is the full projective elliptic count, including O. The headline is `legendre_minus_one_point_count_v_two`.

(Bennett–Siksek, §6, Lemma 6.5, p.370; BS20 line 663. The coefficient and coordinate formulas are derived in the native conventions.)

One proof proceeds as follows. The native point group is finite and its doubling kernel has cardinality 4. The explicit order-four half with an independent two-torsion point gives a subgroup of order 8. Use the existing finite-abelian-group structure theorem. Since there is no point of order 8, each two-primary cyclic factor has order at most 4. Exactly two factors contribute to the doubling kernel, so the 2-part is at most 16. If it were 16, both factors would have order 4 and every two-torsion point would be divisible by 2, contradicting §3.6, which identifies only one nonzero divisible point. Thus the two-primary group is Z/2×Z/4, of order 8. Compare native projective point count and the cardinality of Point.

**Checks.**

- p=5,13,29 give counts 8,8,40 respectively, all of exact two-adic valuation 3. This distinguishes exact two-part eight from a divisibility-by-eight assertion.
- At p=5,13,29 the counts are 8,8,40 and their odd quotients by 8 are 1,1,5; 16 divides none. This distinguishes exact two-part eight from a divisibility-by-eight assertion.
- An abstract group ℤ/4×ℤ/4 has four points killed by 2 and no order-eight point, but has order 16; the unique divisible nonzero two-torsion point is essential. This distinguishes exact two-part eight from a divisibility-by-eight assertion.

*Needs:* §3.2; §3.6; §0.11; Mathlib `AddCommGroup.equiv_directSum_zmod_of_finite`; Tau Ceti `WeierstrassCurve.Affine.finite_point`; Tau Ceti `WeierstrassCurve.pointCount_eq_card_point`; §3.3; §3.4.

### Examples

At p=7,η=2, L(4) has 8 points. At p=5, the two points (2,4),(3,3) on L(−1) double to (0,0). The group has 8 elements and exponent 4. At p=29 the count 40 has two-part 8, so the theorem concerns the two-primary subgroup rather than the order of the full group.

### Dependencies

Layers 0 and 2; finite native points and point-count comparison; Mathlib quadratic characters, supplementary laws and finite abelian groups. The explicit half and its first descent class precede the no-order-eight theorem; that theorem and the precise divisible-root information precede exact two-adic count.

## Layer 4: Explicit order-four points in the twist by two

Throughout this layer K is a field with 2≠0, t,v are nonzero, i²=−1 and 2t²+2v²=1; put λ=2t². Native point-group assertions use decidable equality on K. Write r=2t and s=2iv. Then r²=2λ, s²=2λ−2, r²−s²=2 and rs=4itv. These identities fix the signs of the coordinates and of the doubling computation.

### 4.1 The corrected order-four witness

For every field K with 2≠0, nonzero t,v and i satisfying i²=−1 and 2t²+2v²=1, put λ=2t². Construct the native point P=(2λ+4itv,8itv(t+iv)) on L(2,λ). These hypotheses imply λ≠0,1 and y(P)≠0. The native membership, doubling and exact-order conclusion is `twist_halving_point_order_four`. This construction requires no progression hypothesis.

(Bennett–Siksek, §6, proof of Lemma 6.6, p.371, with the y-coordinate corrected as proved below; BS20 line 718. The coefficient and coordinate formulas are derived in the native conventions.)

The supporting API states:

- Coordinates are exactly (4t²+4itv,8itv(t+iv)).
- Twice this point is the native two-torsion point (2λ,0).
- This point has exact additive order 4.
- The third split reading of native μ(P) is [4itv].
- For a field homomorphism K→L, the native point map L(2,λ)(K)→L(2,f(λ))(L) sends P to the witness with parameters f(t),f(v),f(i).

One proof proceeds as follows. Set r=2t,s=2iv: r²=2λ,s²=2λ−2,rs=4itv. Then x=r²+rs and y=rs(r+s). The three factors x,x−2,x−2λ equal r(r+s),s(r+s),rs, so the product is y². Distinct cubic roots and the scaled-invariant criterion give nonsingularity. If r+s=0 then r²=s² would force 2=0, so y is nonzero. The corrected y-coordinate satisfies the equation; the printed expression is excluded by the example below.

**Checks.**

- Over 𝔽₅ with t=v=2,i=3, the corrected coordinates are (4,3). This rejects the printed y-coordinate and fixes the chosen sign.
- Over 𝔽₅ with t=v=2,i=2, the corrected coordinates are (3,4). This rejects the printed y-coordinate and fixes the chosen sign.
- At p=5,t=v=2,i=3, native doubling is (1,0)=(2λ,0). This rejects the printed y-coordinate and fixes the chosen sign.
- At p=5,t=v=2,i=3, the printed pair (4,4) does not satisfy the native scaled Legendre equation. This rejects the printed y-coordinate and fixes the chosen sign.
- For p=5,t=v=2,i=3,λ=3, P=(4,3) belongs to y²=x(x−2)(x−1); the printed point (4,4) does not. This rejects the printed y-coordinate and fixes the chosen sign.
- At t=v=2,i=3 over 𝔽₅, r=4,s=2, r²−s²=2 and r+s=1≠0; the corrected y=3 has y²=4, the cubic value. This rejects the printed y-coordinate and fixes the chosen sign.

- Over 𝔽₉=𝔽₃[i] with i²=−1, t=v=1 gives λ=2, P=(1+i,1−i), y²=i and cubic value i; its double is (1,0). This tests the general field statement in characteristic three.

*Needs:* §0.2; §0.5; §0.10; Mathlib `WeierstrassCurve.Affine.Point.map`; §2.5 for the descent-coordinate API.

### 4.2 Doubling the corrected witness

Under the hypotheses of §4.1, native doubling of P is exactly (2λ,0). With r=2t,s=2iv the tangent slope is r+s and the doubled coordinates are (r²,0).

(Bennett–Siksek, §6, proof of Lemma 6.6, p.371; BS20 line 718. The coefficient and coordinate formulas are derived in the native conventions.)

One proof proceeds as follows. Write r=2t,s=2iv, so 2=r²−s², a₂=−(2r²−s²),a₄=r²(r²−s²), and P=(r²+rs,rs(r+s)). The tangent numerator is 2rs(r+s)² and denominator 2rs(r+s), which is nonzero. The native slope is r+s. The native doubling x is (r+s)²−a₂−2(r²+rs)=r², and y is −y(P)+(r+s)(x(P)−r²)=0.

**Checks.**

- At the p=5 tuple, (4,3)+(4,3)=(1,0), which is nonzero. This tests the tangent slope with its nonzero denominator.
- For the same tuple, the tangent slope is 1 and the double is (1,0); with i=2 the slope is 2 and the double is again (1,0). This tests the tangent slope with its nonzero denominator.

*Needs:* §4.1; §0.2; §0.10; Mathlib `WeierstrassCurve.Affine.Point.add_self_of_Y_ne`.

### 4.3 Exact order four of the corrected witness

Under the hypotheses of §4.1, P has exact additive order 4. In particular it is neither O nor two-torsion, although its double is a two-torsion point.

(Bennett–Siksek, §6, proof of Lemma 6.6, p.371; BS20 line 718. The coefficient and coordinate formulas are derived in the native conventions.)

One proof proceeds as follows. Use §4.2 and nonzero of the native labelled point (2λ,0). That labelled point doubles to O. Hence 4P=O and 2P≠O; the divisors of 4 leave only exact order 4.

**Checks.**

- The p=5 tuple satisfies 4P=O and 2P=(1,0)≠O. This distinguishes exact order four from two-torsion.
- The two 𝔽₅ witnesses have 2P=(1,0)≠O and 4P=O, hence order exactly 4 rather than merely dividing 4. This distinguishes exact order four from two-torsion.

*Needs:* §4.2; §0.10.

### 4.4 The witness’s third native descent coordinate

Under the hypotheses of §4.1, the third split reading of native μ(P) is the nonzero squareclass [4itv]. Indeed x(P)−2λ=4itv; y(P)≠0 implies x(P) avoids all three roots.

(Bennett–Siksek, §6, proof of Lemma 6.6, p.371; BS20 line 718. The coefficient and coordinate formulas are derived in the native conventions.)

One proof proceeds as follows. The corrected point has nonzero y, so the nonroot descent formula applies. In declared root order (0,2,2λ), the third difference is exactly 4itv. Its nonzero value follows from 2,t,v,i all being nonzero. No condition that this class is square is assumed.

**Checks.**

- At p=5,t=v=2,i=3 this representative is 3, a nonsquare; at i=2 it is 2, also a nonsquare. This tests the third coordinate and does not assume its class is trivial.
- For i=3 the three representatives are (4,2,3), product 4; for i=2 they are (3,1,2), product 1. The third entries 3 and 2 are both nonsquares. This tests the third coordinate and does not assume its class is trivial.

*Needs:* §4.1; §2.5.

### Examples

Over 𝔽₅, t=v=2 gives λ=3. For i=3 the corrected point is (4,3) with double (1,0); for i=2 it is (3,4), again with double (1,0). The printed y expression in BS20 line 718 gives (4,4) in the first case: y²=1 while the cubic value is 4. The corrected y=8itv(t+iv) gives 3, whose square is 4. The examples test the local identity and assert no progression hypotheses.

### Dependencies

Layer 0 scaled equation, invariants and root points; Layer 2 nonroot descent; Mathlib native tangent addition. Membership precedes doubling, doubling precedes exact order, and the third descent reading needs only membership with nonzero y and the nonroot formula. No progression or trace theorem is a prerequisite.

## Layer 5: Trace and downstream interfaces

### 5.1 Trace zero for a symmetric split cubic

For p prime with p≡3 mod4 and u∈𝔽_p×, the native Weierstrass curve with equation y²=x(x−u)(x+u) has projective point count p+1 and Frobenius trace 0. It is L(u,−1), hence is elliptic. No CM distribution or Hasse-bound input is required. The headline is `scaledLegendre_minus_one_trace_zero`.

(Bennett–Siksek, §5, proof of Lemma 5.2, p.366; BS20 line 462. The coefficient and coordinate formulas are derived in the native conventions.)

One proof proceeds as follows. Use the finite quadratic-character square-root count to write projective point count=p+1+Σ_x quadraticChar(x(x−u)(x+u)). The cubic is odd: f(−x)=−f(x). Since −1 is a nonsquare, the quadratic character changes sign under x↦−x, including its zero values. The sum equals its own negative; it is an integer sum so it vanishes. Use the native Frobenius trace definition.

**Checks.**

- At p=3,u=1 the point count is 4; at p=7,u=2 it is 8; u=0 is excluded because the model is singular. This tests cancellation with the stated congruence and includes O in the count.
- At p=3,u=1 the affine square-root counts at x=0,1,2 are 1,1,1, so the full count is 4 and trace 0. This tests cancellation with the stated congruence and includes O in the count.
- At p=7,u=2 the character values in x-order are (0,1,0,1,−1,0,−1), sum 0; the count is 8 and trace 0. This tests cancellation with the stated congruence and includes O in the count.
- At p=5,u=1 the count is 8 and trace −2; the congruence p≡3 mod4 matters. This tests cancellation with the stated congruence and includes O in the count.

*Needs:* §0.2; §0.5; Mathlib `quadraticChar`; Mathlib `quadraticChar_card_sqrts`; Mathlib `legendreSym.at_neg_one`; Tau Ceti `WeierstrassCurve.pointCount`; Tau Ceti `WeierstrassCurve.frobeniusTrace_def`.

### 5.2 Legendre specialization of the twist-factor interface

For p an odd prime, d∈𝔽_p× and λ∈𝔽_p∖{0,1}, prove `scaledLegendre_frobeniusTrace`: a_p(L(d,λ))=quadraticChar(d)·a_p(L(λ)). Consequently the good Euler polynomial is 1−quadraticChar(d)a_p(L(λ))T+pT². At p≡5 mod8 and d=2 the trace changes sign. The coefficient identity of §0.7 identifies this as the native quadratic twist with parameters (0,−d/4).

(Bennett–Siksek, §6, proof of Lemma 6.6, p.371; BS20 line 703. The coefficient and coordinate formulas are derived in the native conventions.)

One direct proof writes the point count as p+1 plus the quadratic-character sum of the cubic. Substitution x=dz sends x(x−d)(x−dλ) to d³z(z−1)(z−λ). Since d≠0, it permutes the field; multiplicativity and quadraticChar(d³)=quadraticChar(d) give the trace formula, including square d. The supplementary law for 2 gives the stated sign. This proves only the equation-specific comparison and uses neither rational local-factor assembly nor analytic continuation.

**Checks.**

- At p=5,λ=3, L(λ) and L(2,λ) have counts 4 and 8, traces 2 and −2. If d is a square the traces agree. This fixes the trace sign and includes square twist scalars.
- At p=5,λ=3 the unscaled and d=2 counts are 4 and 8; their traces 2 and −2 differ by quadraticChar(2)=−1. This fixes the trace sign and includes square twist scalars.
- At p=5,λ=3,d=4, the count is 4 and trace 2, since quadraticChar(4)=1. This fixes the trace sign and includes square twist scalars.
- At d=0 the model is singular and the scaling substitution is not a permutation; it cannot justify the claimed good Euler polynomial. This fixes the trace sign and includes square twist scalars.

*Needs:* §0.7; §0.4; §0.5; Mathlib `quadraticChar`; Mathlib `legendreSym.at_two`; Tau Ceti `WeierstrassCurve.frobeniusTrace`; Mathlib `quadraticChar_card_sqrts`; Tau Ceti `WeierstrassCurve.pointCount`.

### Examples

For λ=3 over 𝔽₅ the character sum is −2 before scaling and 2 after scaling by 2. Thus the counts are 4 and 8, traces 2 and −2, and Euler polynomials 1−2T+5T² and 1+2T+5T². For u=2 over 𝔽₇, the symmetric cubic has character sum 0, count 8 and trace 0.

### Dependencies

Layer 0 equations, scaled/native-twist identity and ellipticity; native point count and integer trace; Mathlib quadratic-character multiplicativity, square-root counts and supplementary laws. Symmetric cancellation and twist comparison are independent of Layers 1–4 and of any global analytic theory.

## Downstream consumers

ErdosProgressionPowers Layer 2 uses the six labelled parameters, good-prime units, conductor divisibility, root descent readings, the two-primary count and the corrected conic witness. It supplies its own progression hypotheses and proves when the associated odd character conductor is nontrivial. EllipticCurveModularityPartII §§4–5 uses its own full-two-torsion realization and can consume the coefficient normalization here after that realization; it supplies no prerequisite to this roadmap. ArithmeticDynamics uses its own dynamical carriers and can use the ordered equation interfaces without feeding them back as assumptions.

The exports include all four characters at ω=±1,±2, all six root labels with possible repetitions, every odd prime of good curve-level reduction, and the square as well as nonsquare twist scalar. Bad-prime local factors and characteristic-two elliptic normalizations have their general owners in EllipticCurves and NeronModelsAndSemistableAbelianVarieties; the polynomial identities here still describe the singular characteristic-two Legendre equations.

## References

- Michael A. Bennett and Samir Siksek, *A conjecture of Erdős, supersingular primes and short character sums*, Annals of Mathematics 191 (2020), 355–392, DOI 10.4007/annals.2020.191.2.2. Publisher version: https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf. BS20 line 462 is the symmetric cubic, line 513 is equation (17), lines 526–546 are Lemma 6.2, lines 547–557 are Lemma 6.3, lines 655–672 are the descent display and Lemma 6.5, and lines 703–727 are the local part of Lemma 6.6. The order-four witness uses the corrected y-coordinate proved in Layer 4; line 718 is the printed expression tested there.
- The Mathlib and Tau Ceti modules named in the exact supplier contracts fix the formal conventions. The cross-roadmap contracts refer to EllipticCurves Layer 4 and Layer 5, ModularCurves §9E, ClassicalArithmeticCompletion §§1.7–1.8 and NeronModelsAndSemistableAbelianVarieties §§5.3a, 5.3g.
