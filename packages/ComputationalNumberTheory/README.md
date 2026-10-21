# Roadmap: certified computational number theory and arithmetic data

**Summary.** Build mathematical presentations of algebraic numbers, local balls, finite fields,
prime factors and number-field orders, together with integral modular data, local descent
comparisons and quantitative analytic enclosures on native library carriers. The end theorems are: Pratt
certificates are sound and complete and have quadratic size (`PrattCertificate.sound` (1.3),
`PrattCertificate.complete` (1.4), `pratt_small_certificate` (1.6)); the Miller–Rabin error bound
(`strongLiar_card_le` (1.9), `millerRabin_rounds_bound` (1.10)); the AKS congruence characterization
(`aks_correct` (1.14)); Pocklington certificates (`PocklingtonCertificate.sound` (1.18)); certified
factorization over finite fields, over `ℤ` and over `ℚ` (`FiniteFieldFactorCertificate.sound` (1.23),
`IntegerFactorCertificate.complete` (1.21), `exists_rationalFactorCertificate` (1.28)); integral bases by the
`p`-radical multiplier criterion (`pRadical_multiplier_eq_iff` (2.6), `exists_integralBasisCertificate_extending` (2.8));
Ore's residual irreducibility criterion
(`ore_residual_irreducible` (2.20)); the level-one congruence Sturm bound
(`levelOne_congruence_sturm` (3.4)) and the complete list of nonordinary level-one pairs below 200
(`nonordinary_pairs_lt_200` (3.13)); certified local images of `2`-descent and a finite
`p`-saturation criterion on elliptic curves over `ℚ` (`LocalImageCertificate.eq_range_of_isComplete` (3.19),
`pSaturationCriterion` (3.26)); rigorous enclosures of Dirichlet and cusp-form `L`-values and Platt's
finite-conductor theorems (`small_conductor_no_real_zero` (4.24)); and sound rational Gram certificates
over finite integer ellipsoid covers for the explicit-formula arguments of Chenevier and Taïbi
(`NegativeGramCertificate.sound` (4.30), `ellipsoidPoints_complete` (4.27)).

The targets specify native arithmetic objects, finite presentation data, mathematical validity
predicates, and soundness and existence theorems. Computational algorithms, executable verifiers,
implementation costs and termination specifications are outside this roadmap's scope.

Suggested homes are `TauCeti/NumberTheory/Computational/` for the arithmetic adapters and
`TauCeti/Analysis/ValidatedNumerics/` for enclosure arithmetic, under the namespace
`TauCeti.Computational`. [Suggested.lean](Suggested.lean) records, in the namespace
`TauCetiRoadmap.ComputationalNumberTheory`, the definitions and end theorems that can be stated
against the pinned libraries; this document is the specification.

## Scope and ownership

This roadmap owns:

1. **Exact presentations** (Layer CN.0): isolated algebraic numbers with exact arithmetic and
   equality predicates; canonical finite `p`-adic balls; Rabin irreducibility predicates,
   finite-field presentations and changes of presentation with explicit inverses.
2. **Primality and factorization certificates** (Layer CN.1): Pratt trees with soundness,
   completeness and size bounds; strong liars and the Miller–Rabin bound; the AKS congruence criterion and
   its primality equivalence; Pocklington certificates; integer factor certificates; factor certificates over
   finite fields and their transport; Hensel lifting modulo prime powers; rational polynomial
   factor certificates and the existence of rational factor presentations.
3. **Certified computations in number fields** (Layer CN.2): order bases, multiplier rings, local
   maximality, Frobenius nilradicals, `p`-radicals and the multiplier criterion, integral-basis
   presentations and their existence over any full order, prime-ideal decompositions, `φ`-adic expansions,
   `φ`-Newton sides, residual polynomials and Ore's criterion, finite local expansions, squares of
   units in finite extensions of `ℚ_p`, and roots in `ℚ_p` read off from prime decompositions.
4. **Exact modular and elliptic data** (Layer CN.3): integral `q`-expansion lattices at level one,
   Miller bases, the congruence Sturm bound, exact equality of coefficient data, integral Hecke
   matrices, the ordinary and nonordinary witnesses and companion eigensystems of
   Boxer–Calegari–Gee; point counts over finite fields as character sums, certified local images
   of the `x − T` descent map, and a finite `p`-saturation criterion by exact divisibility and reduction homomorphisms.
5. **Validated numerics** (Layer CN.4): signed rational interval and complex box arithmetic,
   outward dyadic rounding, unique-integer recovery, `p`-adic precision propagation, the Odlyzko
   kernel and the eight scalar quantities of Chenevier–Lannes and Chenevier–Taïbi with certified
   enclosures, complete root isolation, enclosures of Dirichlet and level-one cusp-form `L`-values,
   Platt's finite-conductor theorems, Gram negativity witnesses, finite integer ellipsoids,
   and validity of finite families.
6. **Interpretation of finite arithmetic families** (Layer CN.5).

It builds on, and does not plan again:

- **Mathlib and Tau Ceti** at the pins, listed under *Exact supplier contracts*: native
  order integrality and monogenic Dedekind criteria are inputs. The `multiplierRing` (2.2)
  variant accepts every integer submodule of a characteristic-zero field, including zero;
  the native order version accepts fractional ideals of an order. `IsPMaximal` (2.3)
  permits nonmonogenic orders.
- **TauCetiRoadmap ModularForms** (Layers 7–11): `L`-functions and functional equations, modular
  symbols and the integral Hecke algebra, LMFDB labels, cusp widths and dimension formulas, and the
  level-one trace formula. The lattices of Layer CN.3 live on the `q`-expansion side and are
  distinct from the integral modular-symbol module there.
- **TauCetiRoadmap EllipticCurves** (Layers 1, 3, 4, 6, 7): isogenies and formal groups, the Hasse
  bound, reduction of points and the filtration `E₁ ⊆ E₀ ⊆ E` over local fields, Mordell–Weil with
  explicit `2`-descent and Nagell–Lutz, and Selmer groups. Layer CN.3 adds certificates on top of
  those objects; it does not construct them again.
- **TauCetiRoadmap LocalFieldsRamification** (Layers 0–1): complete discretely valued fields,
  uniformizers, residue fields, ramification indices and residue degrees, Teichmüller
  representatives. Its Layer 2 supplies surjectivity of the norm on units in unramified
  extensions, provided by `TauCeti.map_normUnits_unitFiltration` at depth zero in
  `NumberTheory/LocalField/Norm/Unramified/Basic`; this is an input to the good-odd-prime count.
- **TauCetiRoadmap RealAlgebraicGeometry** (Layers 1–4): Sturm–Tarski, signed remainder sequences,
  subresultants, distinct-root counts, root separation and multiplicity-sensitive root matching.
  Layers CN.0 and CN.4 add finite rational certificates and refinement on top of that theory.
- **TauCetiRoadmap PolynomialGaloisGroups** (Layer 5): degrees of irreducible factors over a finite
  field are Frobenius orbit sizes. Layer CN.0 turns this into a checked irreducibility certificate.
- **TauCetiRoadmap NumberFieldArithmetic** (Layers 3 and 7): the index–discriminant identity,
  Kummer–Dedekind under its index hypothesis, explicit integral bases, rank-one unit certificates.
  Layer CN.2 adds full-order presentations and local maximality comparisons.
- **ClassicalArithmeticCompletion** §§3.3, 3.5, 3.25, 3.27, 3.33 and 3.48 supplies Smith and
  column Hermite decompositions, pivot indices, ordinary Newton polygons and Hermite bases.
  Its §§5.1–5.3, 5.10–5.11, 5.16 and 5.22 own factor-base generation, relation lattices,
  class-group quotients, regulator index comparisons and joint class–unit completeness.
  This roadmap consumes these comparisons; it defines no second relation lattice or stopping bound.
- **AlgebraicModularFormsAndSerreWeights** (Layers R15.2, R15.3, R15.5): the `q`-expansion
  principle and bounded denominators at level one, the theta operator and the Hasse invariant, and
  the Deligne–Serre lifting of residual eigensystems to characteristic zero.
- **HeightsRationalPointsAndObstructions** (§1.17): the index of multiplication by two on the
  points of an abelian variety over a local field, used for the size check of local images.

Downstream roadmaps build on this one and are listed at the end. In particular the `2`-Selmer
groups, rank bounds, canonical-height enclosures, index bounds and Mordell–Weil bases of elliptic
curves are built on Layers CN.2–CN.4 by the effective Diophantine roadmap, while intrinsic automorphic positivity statements are outside this roadmap's scope.

## Conventions

* A rational interval is Mathlib `NonemptyInterval ℚ`, with ordered closed endpoints. A complex
  box is a pair of such intervals; its denotation is a subset of `ℂ`. An isolated algebraic number
  decodes into `algebraicClosure ℚ ℂ`, never into the box itself.
* Polynomials use `Polynomial`; quotient rings and fields use `AdjoinRoot` and `AdjoinRoot.mk`.
  Distinct roots and roots counted with multiplicity are kept apart. A nonzero constant has no
  roots, and finite root-list existence requires a nonzero polynomial.
* A finite field is presented over its prime field `ZMod p`, or over a smaller presented field,
  as `AdjoinRoot f` with `f` monic and certified irreducible; there is one prime field and no
  second copy of it. Changes of presentation carry both directions explicitly.
* A `p`-adic approximation describes a ball, with absolute precision `N`, valuation lower bound
  `v`, and relative precision `N − v` when its mantissa is nonzero. Zero mantissa describes
  `p^N ℤ_p`. Mathlib's `padicValRat` is `0` at `0`; the polynomial valuation here uses `WithTop ℕ`
  so that the zero polynomial has valuation `∞`.
* Matrices act on column vectors. A Hecke matrix entry `(i, j)` is the `i`-th coordinate of the
  image of basis vector `j`. Level-one `q`-expansions have width one; a finite-index subgroup uses
  its actual strict cusp width. Eisenstein series have constant term one and `Δ = q + ⋯`.
* An elliptic curve over `ℚ` in Layer CN.3 is a `WeierstrassCurve` with `a₁ = a₃ = 0`
  (Mathlib `IsCharNeTwoNF`) and integral `a₂, a₄, a₆`; its cubic is
  `f = X³ + a₂X² + a₄X + a₆`, its étale algebra `A = ℚ[X]/(f)` and its descent map is Tau Ceti's
  `x − T` map into `A^×/A^×²`. A place `v` is a prime `p` or the real place, with `|2|_v` the
  normalized absolute value (`|2|_2 = 1/2`).
* Entrywise matrix bounds control quadratic forms only on vectors with nonnegative coordinates.
  Bounds for arbitrary real vectors need a positive-semidefinite difference or full interval
  arithmetic.
* A class-group relation matrix supplies checked relations, not their completeness. The unit
  regulator index is measured after adjoining all torsion units. A numerical inequality is used
  only together with its rigorous remainder bound.

## Exact supplier contracts

### From Mathlib (pinned at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`)

- Elementary arithmetic and primality: `lucas_primality`, `reverse_lucas_primality`
  (`Mathlib.NumberTheory.LucasPrimality`),
  `Nat.primeFactorsList`, `Nat.prod_primeFactorsList`, `Nat.prime_of_mem_primeFactorsList` (`Mathlib.Data.Nat.Factors`),
  `padicValRat` (`Mathlib.NumberTheory.Padics.PadicVal.Basic`),
  `PadicInt.toZModPow` (`Mathlib.NumberTheory.Padics.RingHoms`),
  `hensels_lemma` (`Mathlib.NumberTheory.Padics.Hensel`, a root-lifting theorem).
- Polynomials and finite fields: `AdjoinRoot`, `AdjoinRoot.equiv'`, `AdjoinRoot.algHom_ext` (`Mathlib.RingTheory.AdjoinRoot`),
  `PowerBasis.ofAdjoinEqTop` (`Mathlib.RingTheory.Adjoin.PowerBasis`), `Polynomial.Monic.irreducible_iff_natDegree` (`Mathlib.Algebra.Polynomial.Monic`),
  `Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X` (`Mathlib.FieldTheory.Finite.Extension`), `FiniteField.algEquivOfCardEq` (`Mathlib.FieldTheory.Finite.GaloisField`),
  `FiniteField.frobeniusAlgHom` (`Mathlib.FieldTheory.Finite.Basic`), `UniqueFactorizationMonoid.normalizedFactors_prod_eq`
  (`Mathlib.RingTheory.UniqueFactorizationDomain.NormalizedFactors`),
  `Polynomial.norm_coeff_le_choose_mul_mahlerMeasure_of_one_le_mahlerMeasure`
  (Mignotte-type bound for a factor), `Polynomial.mahlerMeasure_le_sum_norm_coeff`
  (the coefficient-norm bound), both in `Mathlib.Analysis.Polynomial.MahlerMeasure`,
  `quadraticChar` (`Mathlib.NumberTheory.LegendreSymbol.QuadraticChar.Basic`).
- `Real.eulerMascheroniSeq_lt_eulerMascheroniConstant`,
  `Real.eulerMascheroniConstant_lt_eulerMascheroniSeq'`,
  `Real.tendsto_eulerMascheroniSeq` and `Real.tendsto_eulerMascheroniSeq'`
  (`Mathlib.NumberTheory.Harmonic.EulerMascheroni`): lower and upper harmonic–logarithm
  bounds converging to Euler's constant.
- Algebraic numbers and intervals: `algebraicClosure`, `mem_algebraicClosure_iff`
  (`Mathlib.FieldTheory.AlgebraicClosure`),
  `NonemptyInterval` (`Mathlib.Order.Interval.Basic`;its multiplication is the monotone one and does not apply to signed
  rational endpoints; its inverse is a group inverse, not a field reciprocal).
- Number fields: `NumberField.classNumber`,
  `NumberField.exists_ideal_in_class_of_norm_le` (`Mathlib.NumberTheory.NumberField.ClassNumber`),
  `ClassGroup.mk0` (`Mathlib.RingTheory.ClassGroup`),
  `NumberField.Units.regOfFamily_div_regulator` (`Mathlib.NumberTheory.NumberField.Units.Regulator`),
  `Ideal.radical` (`Mathlib.RingTheory.Ideal.Operations`).
- Modular forms and `L`-functions: `ModularForm.dimension_level_one`,
  `ModularForm.sturm_bound_levelOne_nat`
  (`Mathlib.NumberTheory.ModularForms.LevelOne.DimensionFormula`), `ModularForm.weakFEPair`, `ModularForm.L` (`Mathlib.NumberTheory.ModularForms.LFunction`),
  `WeakFEPair.functional_equation` (`Mathlib.NumberTheory.LSeries.AbstractFuncEq`), `DirichletCharacter.LFunction` (`Mathlib.NumberTheory.LSeries.DirichletContinuation`),
  `DirichletCharacter.IsPrimitive` (`Mathlib.NumberTheory.DirichletCharacter.Basic`), `Complex.digamma`, `Complex.digamma_apply_add_nat`
  (`Mathlib.Analysis.SpecialFunctions.Gamma.Digamma`, recurrence with all poles excluded),
  `CuspFormClass.qExpansion_isBigO` (`Mathlib.NumberTheory.ModularForms.Bounds`), and
  `ModularForm.L` (`Mathlib.NumberTheory.ModularForms.LFunction`).
- Elliptic curves: `WeierstrassCurve.IsCharNeTwoNF`
  (`Mathlib.AlgebraicGeometry.EllipticCurve.NormalForms`), the division polynomials `WeierstrassCurve.Φ`
  and `WeierstrassCurve.ΨSq` with `WeierstrassCurve.natDegree_Φ`, `WeierstrassCurve.leadingCoeff_Φ`
  and `WeierstrassCurve.natDegree_ΨSq`
  (`Mathlib.AlgebraicGeometry.EllipticCurve.DivisionPolynomial.Degree`); the polynomial
  definitions are in `Mathlib.AlgebraicGeometry.EllipticCurve.DivisionPolynomial.Basic`.
- Matrices: `Matrix.PosDef` and `Matrix.PosSemidef` (`Mathlib.LinearAlgebra.Matrix.PosDef`).

### From Tau Ceti (pinned at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`)

- `TauCeti.GlobalNumberFields.NumberFieldOrder.isIntegral`
  (`TauCeti.NumberTheory.NumberField.Global.Orders.Basic`),
  `TauCeti.GlobalNumberFields.NumberFieldOrder.multiplierRing`
  (`TauCeti.NumberTheory.NumberField.Global.Orders.ProperIdeal`), and
  `TauCeti.NumberField.IntegralPrimitiveElement.not_dvd_index_iff`
  (`TauCeti.NumberTheory.NumberField.Index.DedekindCriterion`).
- `TauCeti.unitFiltration_le_range_powMonoidHom_two`
  (`TauCeti.NumberTheory.LocalField.Squares`), with explicit local-field and characteristic
  assumptions: units of depth `2*v_L(2)+1` are squares.

- `TauCeti.ModularForm.eq_of_sturm_bound` (equality of two forms on a finite-index subgroup from
  agreement of their coefficients up to the Sturm bound at the actual strict width;
  `TauCeti.NumberTheory.ModularForms.SturmBound`) and
  `HeckeRing.GL2.qExpansion_coeff_heckeSlashGamma1CuspFormEnd_diagCosetGamma1_of_mem_cuspFormCharSpace`
  (`TauCeti.NumberTheory.ModularForms.HeckeSlash.Recurrence`; the coefficient recurrence of `T_p` on `Γ₁(N)` with its nebentypus and coprimality hypotheses).
- `CuspForm.hasEntireExtension_qExpansion_coeff` (the coefficient Dirichlet series of a cusp form
  continues to the native `L`-function, with the cusp-width factor;
  `TauCeti.NumberTheory.ModularForms.LFunction.Basic`).
- `TauCeti.kernelBasis` with `mulVec_eq_zero_of_mem_kernelBasis`, `span_kernelBasis`,
  `linearIndepOn_kernelBasis` and `length_kernelBasis` (the field-kernel basis comparison;
  `TauCeti.LinearAlgebra.Matrix.Echelon.KernelBasis`).
- `WeierstrassCurve.pointCount`, `WeierstrassCurve.frobeniusTrace` and
  `WeierstrassCurve.pointCount_eq_card_point` (the projective count, singular point included, and
  its comparison with Mathlib's point type on an elliptic model;
  `TauCeti.AlgebraicGeometry.EllipticCurve.PointCount`).
- The `x − T` descent: `WeierstrassCurve.Affine.A`, `WeierstrassCurve.Affine.M`,
  `WeierstrassCurve.Affine.μ`, `WeierstrassCurve.Affine.ker_μ_eq`,
  `WeierstrassCurve.Affine.μX_of_eval_f_ne_zero`, `WeierstrassCurve.Affine.localRes`,
  `WeierstrassCurve.Affine.localCondition`, `WeierstrassCurve.Affine.mem_localCondition_iff`,
  `WeierstrassCurve.Affine.selmerGroupA`, `WeierstrassCurve.Affine.normM`,
  `WeierstrassCurve.Affine.card_ker_nsmul_two`, all for `W : WeierstrassCurve.Affine K` with
  `[W.IsElliptic] [W.IsCharNeTwoNF]`. Their modules are
  `TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.XSubT` (A, M, μ, its kernel,
  `μX_of_eval_f_ne_zero`, `normM`),
  `TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.LocalCondition` (local restriction
  and condition), `TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.SelmerGroupA`
  (`selmerGroupA`), and `TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.TwoTorsion`
  (`card_ker_nsmul_two`).
- `WeierstrassCurve.mul_eval_ΨSq_eq_eval_Φ_of_zsmul` (if `n • P = P′` then
  `x(P′)·ΨSq_n(x(P)) = Φ_n(x(P))`;
  `TauCeti.AlgebraicGeometry.EllipticCurve.DivisionPolynomial.Descent`).

### From TauCetiRoadmap roadmaps

- ModularForms Layer 7 (functional equations with their Fricke sign), Layer 8 (modular symbols,
  the integral Hecke algebra), Layer 9 (labels), Layer 10 (congruence subgroups, cusp widths,
  index and dimension conventions), Layer 11 (the level-one trace formula).
- EllipticCurves Layer 4 (the reduction homomorphism on points at a prime of good reduction),
  Layer 6 (Mordell–Weil, explicit `2`-descent, the exact torsion subgroup by Nagell–Lutz).
- LocalFieldsRamification Layer 0 (local fields and their finite extensions: uniformizer, residue
  field, `e` and `f`), Layer 1 (Teichmüller representatives), Layer 2 (surjectivity of the
  unramified norm on units).
- RealAlgebraicGeometry Layers 1–4 (real root counting and matching).
- PolynomialGaloisGroups Layer 5 (factor degrees over a finite field are Frobenius orbit sizes).

### From lower-tier roadmaps

- ClassicalArithmeticCompletion §3.3 `IntMatrix.IsSmithDecomposition`; §3.5
  `IntMatrix.IsHermiteNormalForm`; §3.25 `IntMatrix.IsHermiteDecomposition`; §3.27
  (index equals the product of positive Hermite pivots); §3.48 (the unique Hermite basis
  of a sublattice). Matrices act on columns and the Hermite convention is upper triangular.
- ClassicalArithmeticCompletion §§5.1–5.3, 5.10–5.11, 5.16 and 5.22:
  `classGroupPresentation`, `relationLattice`, `ClassGroupPresentation.index_relationLattice`,
  Minkowski generation, the full-rank found-relation index comparison, and the regulator
  and joint completeness inequalities. Use nonzero ideals generating the class group,
  a relation matrix with nonzero determinant, and an `IsMaxRank` unit family together
  with all torsion units; any analytic lower bound for `h_K*R_K` is a separate input.
- AlgebraicModularFormsAndSerreWeights R15.2 (level-one `q`-expansion principle), R15.3 (theta
  operator with the shift `a_ℓ ↦ ℓ·a_ℓ`, Hasse invariant), R15.5 (Deligne–Serre lifting of a
  residual eigensystem to a characteristic-zero eigenform).
- What HeightsRationalPointsAndObstructions must provide (gap:local-two-quotient): §1.17, `#(A(F)/2A(F)) = |2|_F^(−g)·#A(F)[2]` for an abelian
  variety of dimension `g` over a finite extension `F` of `ℚ_p`, and `#A(ℝ)[2]/2^g` over `ℝ`.
  The nonarchimedean formula follows from Mattuck, Theorem 7, p.114: choose an open
  finite-index subgroup isomorphic to the additive group of the ring of integers in `F`
  to the power `g`, and compare multiplication by two on this subgroup and its finite
  quotient. The finite quotient's kernel and cokernel have equal size. Over `ℝ`, use the
  connected compact real torus and its finite component group instead. FPS §7 applies
  this argument in dimension two; Layer CN.3 uses its dimension-one specialization.

## How to read the build

Layer CN.0 fixes exact presentations and their native meanings. Layer CN.1 supplies primality
criteria and factor presentations. Layer CN.2 develops order presentations, prime decompositions,
φ-Newton factorization and local square and root criteria. Layer CN.3 binds integral Fourier
coefficients and matrices to modular forms, and finite local-image and divisibility data to
elliptic curves. Layer CN.4 supplies quantitative analytic error estimates and rational enclosures,
finite ellipsoid sets and Gram inequalities. Layer CN.5 interprets finite families using these
comparisons. Root presentation arithmetic specifies existence independently of the disjoint-root
existence theorem in Layer CN.4.

| Layer | Targets | Inputs |
| --- | --- | --- |
| CN.0 | Isolated algebraic numbers; `p`-adic approximations; finite-field presentations | Mathlib; RealAlgebraicGeometry Layers 1–4; PolynomialGaloisGroups Layer 5 |
| CN.1 | Primality certificates; integer, finite-field and rational factorization; Hensel lifting | CN.0; Mathlib |
| CN.2 | Orders, integral bases, prime ideals, Newton factors, local squares and roots | CN.0–CN.1; Mathlib; Tau Ceti; ClassicalArithmeticCompletion §§3.3–3.48; NumberFieldArithmetic; LocalFieldsRamification |
| CN.3 | Integral forms, Hecke matrices, BCG witnesses; point counts, local images, saturation | CN.0–CN.2; ModularForms; R15.2, R15.3, R15.5; EllipticCurves; §1.17 |
| CN.4 | Interval, box and `p`-adic arithmetic; explicit-formula enclosures; roots; `L`-values; Gram certificates; Fincke–Pohst | CN.0–CN.3; Mathlib; RealAlgebraicGeometry Layers 1–4 |
| CN.5 | Interpretation of finite arithmetic families | CN.0, CN.3, CN.4 |

## Layer CN.0: Exact presentations

Build exact presentations and their native decoding maps. The retained targets concern
algebraic numbers, local balls and finite-field extensions; their statements are independent
of how the finite data are obtained.

### 0.8 Isolated algebraic root certificate (`AlgebraicRootCertificate`)

**Definition.** An AlgebraicRootCertificate stores a nonzero polynomial f∈ℚ[X], two closed rational intervals R,I, and a proof that exactly one complex z satisfies f(z)=0 and Re(z)∈R, Im(z)∈I. Repeated polynomial roots are permitted: uniqueness concerns distinct roots, not their multiplicities. The exact carrier is the native relative algebraic closure of ℚ in ℂ; the finite polynomial and rectangle are presentation data, not a replacement field. The uniqueness proof is a separate checked obligation, not inferred from small diameter.

- `AlgebraicRootCertificate.value_mem_algebraicClosure`: The decoded root belongs to the native relative algebraic closure.
- `AlgebraicRootCertificate.value`: Decode the unique root as a native complex algebraic number.
- `AlgebraicRootCertificate.value_spec (c : AlgebraicRootCertificate)`: The decoded value is a root lying in both displayed intervals.
- `AlgebraicRootCertificate.value_unique`: Any root in the rectangle equals the decoded value.

*Construction.* Use native Polynomial and NonemptyInterval for finite data. Define the root-and-rectangle predicate explicitly and require unique existence. The uniqueness proof is part of the mathematical presentation. ([Arb](#source-arb), §§5–5.3, pp.7–9.) *Needs:* Mathlib `algebraicClosure`; Mathlib `mem_algebraicClosure_iff`; Mathlib `NonemptyInterval`.

**Checks.**

- *Degenerate case.* X with both intervals [0,0] isolates zero.
- *Computed value.* X² with the singleton zero rectangle is allowed.
- *Non-example.* X²−1 cannot isolate a unique root in [−2,2]×[0,0].

The boundary theorem `AlgebraicRootCertificate.two_root_box_impossible` states this Check on the native carriers.

The boundary comparisons are `AlgebraicRootCertificate.repeated_zero`.

### 0.9 Exact rational root presentation (`rationalRootCertificate`)

**Construction.** For r∈ℚ, rationalRootCertificate r consists of X−r, the singleton real interval [r,r] and singleton imaginary interval [0,0]. Its decoded value is the native embedding of r into the complex algebraic numbers. Integers and rationals themselves use native ℤ and normalized ℚ; no new arithmetic carrier is introduced.

- `rationalRootCertificate_value`: Decoding is the rational algebra map.
- `rationalRootCertificate_add r s`: Rational addition commutes with decoding.
- `rationalRootCertificate_mul r s`: Rational multiplication commutes with decoding.

*Method.* The linear polynomial has exactly the root r. The rational casts commute with addition and multiplication by the existing field homomorphism laws. ([Arb](#source-arb), §§5–5.3, pp.7–9.) *Needs:* `AlgebraicRootCertificate` (0.8).

**Checks.**

- *Degenerate case.* Zero decodes to zero.
- *Computed value.* One half plus one third decodes as five sixths.
- *Non-example.* One half and one third have different decoded values.

### 0.10 Addition of isolated algebraic numbers (`algebraic_add_certificate`)

**Theorem.** Given isolated algebraic inputs a,b, there exists an isolated-root certificate whose value is their sum.

*Proof sketch.* Closure of the native algebraic-number field gives an annihilating rational polynomial. Its finite distinct root set allows a rational rectangle isolating the desired root. ([Arb](#source-arb), §§5–5.3, pp.7–9.) *Needs:* `AlgebraicRootCertificate` (0.8); Mathlib `algebraicClosure`.

### 0.11 Multiplication of isolated algebraic numbers (`algebraic_mul_certificate`)

**Theorem.** Given isolated algebraic inputs a,b, there exists an isolated-root certificate whose value is their product.

*Proof sketch.* Closure of the native algebraic-number field gives an annihilating rational polynomial. Its finite distinct root set allows a rational rectangle isolating the desired root. ([Arb](#source-arb), §§5–5.3, pp.7–9.) *Needs:* `AlgebraicRootCertificate` (0.8); Mathlib `algebraicClosure`.

### 0.12 Inversion of a nonzero algebraic number (`algebraic_inv_certificate`)

**Theorem.** Given an isolated algebraic input a with nonzero decoded value, there exists an isolated-root certificate whose value is its inverse.

*Proof sketch.* Closure of the native algebraic-number field gives an annihilating rational polynomial. Its finite distinct root set allows a rational rectangle isolating the desired root. ([Arb](#source-arb), §§5–5.3, pp.7–9.) *Needs:* `AlgebraicRootCertificate` (0.8); Mathlib `algebraicClosure`.

### 0.13 Equality of isolated algebraic numbers (`algebraicEqual`)

**Construction.** algebraicEqual compares the decoded native algebraic numbers of two certified isolated-root presentations. It is the proposition that their values are equal; overlapping rectangles alone do not prove equality, and disjoint rectangles are only a sufficient inequality test.

- `algebraicEqual_iff a b`: The proposition is equality in the native relative algebraic closure.
- `algebraicEqual_refl a`: Every presentation equals itself.
- `algebraicEqual_symm a b`: The verdict is symmetric.

*Construction.* Use equality of the decoded values. A common root of both annihilating polynomials in both isolating rectangles characterizes this equality. ([Arb](#source-arb), §§5–5.3, pp.7–9.) *Needs:* `AlgebraicRootCertificate` (0.8).

**Checks.**

- *Degenerate case.* Two rational zero inputs compare equal.
- *Computed value.* Different rational expressions for the same number compare equal.
- *Non-example.* One half and one third compare unequal.

### 0.14 Canonical finite p-adic approximation (`PadicApproximation`)

**Definition.** For prime p, PadicApproximation p stores integers N,v and a natural mantissa s. It is either (N,N,0), or v<N with 0<s<p^(N−v) and p∤s. Its centre is p^v·s∈ℚ and its denotation is {x∈ℚ_p | ‖x−centre‖≤p^(−N)}. N is absolute precision and N−v is relative precision in the nonzero case. Zero mantissa means the entire ball p^Nℤ_p, not the exact number zero.

- `PadicApproximation.center`: The exact rational centre is p^v s.
- `PadicApproximation.denotation`: The ball has radius p^(−N) in the native p-adic field.
- `PadicApproximation.center_mem`: The centre always belongs to its ball.
- `PadicApproximation.zero_mem_iff (c : PadicApproximation p)`: Zero belongs precisely to the zero-mantissa ball.

*Construction.* Store the two normalization alternatives. Use a rational centre and the native p-adic field/norm to define the closed ball. Prime p is a hypothesis of semantic theorems; syntax is parameterized by p. ([CarusoPublished](#source-carusopublished), §2.1.1, pp.17–19.) *Needs:* Mathlib `padicValRat`; Mathlib `PadicInt.toZModPow`.

**Checks.**

- *Degenerate case.* The canonical zero ball at precision N has valuation N.
- *Computed value.* The tuple (N,v,s)=(0,−1,1) is permitted at p=3 and has centre 1/3.
- *Non-example.* A nonzero mantissa divisible by p cannot be canonical.

### 0.15 Rabin irreducibility certificate (`RabinCertificate`)

**Definition.** For a finite field F of cardinality q and f ∈ F[X], `RabinCertificate f`
is the proposition that f is monic of positive degree n, that `f ∣ X^(q^n)-X`, and that
`IsCoprime (X^(q^(n/s))-X) f` for every prime s dividing n. Coprimality means existence
of a Bézout identity, with no choice of an executable verifier.

- `RabinCertificate.monic`: The polynomial is monic.
- `RabinCertificate.irreducible`: The stated conditions imply irreducibility.
- `RabinCertificate.exists_of_irreducible`: Every monic irreducible polynomial satisfies the conditions.

*Construction.* Rabin's criterion: a monic f of degree n ≥ 1 is irreducible exactly when f divides X^(q^n) − X and gcd(X^(q^(n/s)) − X, f) = 1 for every prime s dividing n. For soundness, X^(q^n) − X is the product of the monic irreducibles whose degree divides n, each once; so f is squarefree and each irreducible factor has degree d dividing n. The Bézout identities show that no factor divides X^(q^(n/s)) − X, so d does not divide n/s for any prime s dividing n, which forces d = n and a single factor. For completeness, an irreducible f of degree n divides X^(q^n) − X and is coprime to X^(q^(n/s)) − X, and Bézout identities exist in the Euclidean domain F[X]. ([Shoup](#source-shoup), Exercise 20.2(a), printed p.524; Theorem 19.10, p.513; Algorithm IPT and Theorem 20.1, §20.1, p.523.) *Needs:* Mathlib `Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X`; Mathlib `Polynomial.Monic.irreducible_iff_natDegree`; TauCetiRoadmap PolynomialGaloisGroups Layer 5.

**Checks.**

- *Computed value.* Over ZMod 2, f = X²+X+1 is accepted: X⁴ ≡ X (mod f), and for s = 2 the identity 1·(X²−X) + 1·f = 1 holds.
- *Degenerate case.* For f = X − a of degree one no prime divides 1. Both X^q and X reduce to the constant a, so every monic linear polynomial is accepted; comparing the reduced remainder a with the unreduced polynomial X would wrongly reject it.
- *Non-example.* Over ZMod 5, f = X²+1 satisfies X^25 ≡ X (mod f) but gcd(X⁵ − X, f) = f, so no Bézout pair exists and f is rejected; indeed X²+1 = (X−2)(X−3) there.
- *Non-example.* For every prime p, X⁴+1 over ZMod p has no accepted certificate, because it is reducible modulo every prime.

The boundary theorem `RabinCertificate.linear` states this Check on the native carriers.

The boundary theorem `RabinCertificate.quadratic_five_impossible` states this Check on the native carriers.

The boundary theorem `RabinCertificate.quadratic_two` states this Check on the native carriers.

The boundary comparisons are `RabinCertificate.cyclotomic_eight_impossible`.

### 0.16 Certified presentation of a finite field (`FiniteFieldPresentation`)

**Definition.** Let F be a finite field and K a field with an F-algebra structure. A FiniteFieldPresentation F K consists of a monic f ∈ F[X] with an accepted RabinCertificate, an element α ∈ K with f(α) = 0, and the equation finrank F K = natDegree f. It determines the F-algebra isomorphism `FiniteFieldPresentation.equiv : AdjoinRoot f ≃ₐ[F] K` sending the class of X to α; the inverse sends x ∈ K to the class of Σ_(i<n) c_i X^i, where (c_i) are the coordinates of x in the power basis 1, α, …, α^(n−1). Every finite extension K of F has a presentation. A tower F ⊆ E ⊆ K is presented one step at a time; the prime field is Mathlib's `ZMod p`, never a second copy.

- `FiniteFieldPresentation.lift`: The F-algebra map from `AdjoinRoot poly` to K sending the quotient root to the specified root.
- `FiniteFieldPresentation.bijective`: This map is bijective under the full-degree condition.
- `FiniteFieldPresentation.equiv`: The F-algebra isomorphism AdjoinRoot f ≃ₐ[F] K.
- `FiniteFieldPresentation.equiv_root`: The class of X is sent to α.
- `FiniteFieldPresentation.equiv_symm_apply (P : FiniteFieldPresentation F K) (x : K)`: The inverse is read off from power-basis coordinates.
- `FiniteFieldPresentation.minpoly_eq`: The minimal polynomial of α over F is f.
- `FiniteFieldPresentation.card_eq (P : FiniteFieldPresentation F K)`: Nat.card K = (Nat.card F)^(natDegree f).
- `FiniteFieldPresentation.exists`: Every finite extension of F admits a presentation.

*Construction.* Rabin soundness makes f irreducible. A monic irreducible polynomial vanishing at α is the minimal polynomial of α, so F(α) has degree natDegree f = finrank F K and equals K; the power basis of α then gives the isomorphism with AdjoinRoot f and the coordinate formula for its inverse. Existence: a primitive element of K over F has a monic irreducible minimal polynomial of degree finrank F K, which has an accepted certificate. ([Shoup](#source-shoup), Theorem 19.14 and its proof, pp.515–516; §20.1, p.523.) *Needs:* `RabinCertificate` (0.15); Mathlib `AdjoinRoot.equiv'`; Mathlib `PowerBasis.ofAdjoinEqTop`; Mathlib `FiniteField.algEquivOfCardEq`.

**Checks.**

- *Computed value.* For K = GaloisField 2 2 presented by X²+X+1 with root α: equiv sends the class of X+1 to α+1, and α² = α+1.
- *Degenerate case.* Presenting F over itself by X − a with α = a, the inverse sends x to the class of the constant x.
- *Agreement with the library notion.* The polynomial of a presentation equals Mathlib's minpoly F α.
- *Non-example.* X⁴+1 is the polynomial of no presentation over any ZMod p.

The boundary theorem `FiniteFieldPresentation.prime_field_five` states this Check on the native carriers.

The boundary comparisons are `FiniteFieldPresentation.minpoly_eq`, `FiniteFieldPresentation.quadratic_two`, `FiniteFieldPresentation.linear_inverse`.

### 0.17 Change of presentation with an explicit inverse (`presentationChange`)

**Construction.** Let F be a finite field and f, g ∈ F[X] monic irreducible of the same degree n. A change-of-presentation certificate is a pair (b, c) of polynomials with g ∣ f∘b, f ∣ g∘c and f ∣ b∘c − X, each checked by a remainder computation. It defines the F-algebra isomorphism presentationChange b c : AdjoinRoot f ≃ₐ[F] AdjoinRoot g sending the class of X to the class of b, with inverse sending the class of X to the class of c; the reverse congruence g ∣ c∘b − X follows. Every such pair f, g admits a certificate, and certificates compose by substitution.

- `PresentationChange`: The certificate: the pair (b, c) with its three divisibilities.
- `presentationChange_root (C : PresentationChange f g)`: The class of X is sent to the class of b.
- `presentationChange_symm_root (C : PresentationChange f g)`: The inverse sends the class of X to the class of c.
- `exists_presentationChange`: Monic irreducible f, g of equal degree admit a certificate.
- `presentationChange_trans (C : PresentationChange f g) (D : PresentationChange g h)`: Composing certificates (b, c) and (b′, c′) gives the certificate (b∘b′, c′∘c).

*Method.* The divisibilities say that b is a root of f modulo g and c a root of g modulo f, so both maps exist as lifts out of the quotient algebras. Their composite on AdjoinRoot f sends the class of X to the class of b∘c, which is the class of X; an algebra map out of AdjoinRoot f is determined by the image of the root, so the composite is the identity. Both fields have q^n elements, so the forward map is bijective with the stated inverse. Existence: f has a root in the field F[X]/(g) because two extensions of F of the same degree are isomorphic. ([Shoup](#source-shoup), Theorem 19.14 and its proof, pp.515–516.) *Needs:* `FiniteFieldPresentation` (0.16); Mathlib `AdjoinRoot.algHom_ext`; Mathlib `FiniteField.algEquivOfCardEq`.

**Checks.**

- *Degenerate case.* (X, X) is a certificate from f to itself.
- *Computed value.* Over ZMod 3, (b, c) = (X+2, X+1) is a certificate from X²+1 to X²+X+2: (X+2)²+1 = X²+X+2, (X+1)²+(X+1)+2 = X²+1 and b∘c = X+3 = X.
- *Non-example.* Over ZMod 7 with f = g = X³−2, b = 2X is a root of f modulo f since 2³ = 1, but (2X, 2X) fails f ∣ b∘c − X because b∘c = 4X; the certificate is (2X, 4X).

The boundary theorem `PresentationChange.translate_three` states this Check on the native carriers.

The boundary comparisons are `PresentationChange.identity`, `PresentationChange.scaling_seven_impossible`.

### Examples

- The rational presentations of `1/2` and `1/3` add to the presentation of `5/6`, and the presentations of `1/2` and `1/3` compare unequal (`rationalRootCertificate` (0.9), `algebraicEqual` (0.13)).
- At `p = 3` the canonical approximation `(N, v, s) = (0, −1, 1)` has centre `1/3` and denotes `1/3 + ℤ_3` (`PadicApproximation` (0.14)).
- Over `ZMod 2`, `X²+X+1` has the Rabin certificate `X⁴ ≡ X (mod f)`, `1·(X²−X) + 1·f = 1`, and presents `GaloisField 2 2` (`RabinCertificate` (0.15), `FiniteFieldPresentation` (0.16)).
- Over `ZMod 3`, `(X+2, X+1)` changes the presentation `X²+1` of `𝔽₉` into `X²+X+2` (`presentationChange` (0.17)).

### Dependencies

Mathlib (integers, rationals, lists, `NonemptyInterval`, `algebraicClosure`, `Polynomial`, `AdjoinRoot`, finite fields, `padicValRat`, `PadicInt.toZModPow`); TauCetiRoadmap RealAlgebraicGeometry Layers 1–4; TauCetiRoadmap PolynomialGaloisGroups Layer 5.

## Layer CN.1: Primality and factorization certificates

Pratt and Pocklington criteria imply primality unconditionally. The strong-liar count
concerns the uniform independent distribution on all nonzero residues. AKS contributes its
congruence characterization of primes. Polynomial presentations retain multiplicities and the
leading scalar, over arbitrary finite fields and over ℚ.

*Proof obligations of the layer.* The strong-liar count uses prime-power kernel cardinalities,
the CRT and the Carmichael case (Shoup Theorem 10.3, pp.309–312). The AKS proof uses the
quotient-algebra cardinality estimates of Shoup Lemmas 21.6–21.11, pp.550–558. Pratt size is
a combinatorial existence bound on finite trees. Factorization existence uses unique
factorization and preserves arbitrary nonmonic input; no irreducible-reduction hypothesis is
imposed on a rational irreducible polynomial.

### 1.1 Recursive Pratt certificate (`PrattCertificate`)

**Definition.** A PrattCertificate is either the leaf two or a node (n,a,children), where n and a are natural numbers and children is a finite list of Pratt certificates. Its value is 2 at the leaf and n at a node. Repeated children encode repeated prime factors of n−1. This raw syntax contains no unverified primality proof.

- `PrattCertificate.value_two : PrattCertificate.two.value = 2`: The leaf has value 2.
- `PrattCertificate.value_node n a cs`: A node stores its claimed value n.
- `PrattCertificate.node_injective n a cs n' a' cs'`: Two nodes are equal precisely when all their raw data are equal.

*Construction.* Define a finite inductive tree with the leaf and node constructors. Define value by pattern matching. ([PrattNotes](#source-prattnotes), pp.1–4, formal proof system and its length bound.) *Needs:* Mathlib `lucas_primality`; Mathlib `reverse_lucas_primality`; Mathlib `Nat.primeFactorsList`.

**Checks.**

- *Degenerate case.* The base leaf represents 2.
- *Computed value.* The candidate (3,2,[two]) represents 3.
- *Non-example.* A malformed node may represent 1; existence of raw syntax is not primality.

### 1.2 Validity of a Pratt tree (`PrattCertificate.valid`)

Define `PrattCertificate.nodeConditions n a cs` as `3 ≤ n`, `0 < a < n`, product of child
values equal to n−1, `a^(n-1) mod n = 1`, and `a^((n-1)/q) mod n ≠ 1` for every child
value q. Define `PrattCertificate.valid` recursively: the leaf is valid and a node is valid
exactly when these conditions hold and all children are valid. `PrattCertificate.validList`
means validity of every tree in a list.

- `PrattCertificate.valid_two : PrattCertificate.two.valid`: The leaf is valid.
- `PrattCertificate.valid_node_iff n a cs`: Node validity is the displayed conjunction.
- `PrattCertificate.valid_value_ge_two (c : PrattCertificate) (h : c.valid)`: Validity excludes values zero and one.

The conditions are arithmetic propositions on finite data (PrattNotes, pp.1–4).
*Needs:* §1.1; Mathlib `lucas_primality`.

**Checks.**

- The leaf is valid; this distinguishes the base case from the node's strict bound.
- The node `(3,2,[two])` is valid and supplies the first odd prime.
- The node `(9,2,[two,two,two])` is invalid, although its child product is eight.

### 1.3 Soundness of Pratt certificates (`PrattCertificate.sound`)

**Theorem.** For every finite Pratt certificate c, c.valid implies Nat.Prime(c.value).

*Proof sketch.* Induct on the certificate tree. The children are prime by induction. Every prime divisor of the product n−1 occurs among the child values, so the checked modular inequalities supply all hypotheses of lucas_primality. ([PrattNotes](#source-prattnotes), pp.1–4, formal proof system and its length bound.) *Needs:* `PrattCertificate.valid` (1.2); Mathlib `lucas_primality`; Mathlib `Nat.prime_of_mem_primeFactorsList`.

### 1.4 Completeness of Pratt certificates (`PrattCertificate.complete`)

**Theorem.** Every prime n is the value of a Pratt certificate satisfying validity.

*Proof sketch.* Use strong induction on n, with leaf 2. For n≥3, reverse_lucas_primality supplies a Lucas witness; take its representative in 1,…,n−1. Factor n−1 using primeFactorsList. Every factor q≤n−1<n has a recursively accepted certificate. ([PrattNotes](#source-prattnotes), pp.1–4, formal proof system and its length bound.) *Needs:* `PrattCertificate.valid` (1.2); Mathlib `reverse_lucas_primality`; Mathlib `Nat.primeFactorsList`; Mathlib `Nat.prod_primeFactorsList`; Mathlib `Nat.prime_of_mem_primeFactorsList`.

### 1.5 Bit size of a Pratt tree (`prattBitSize`)

**Definition.** prattBitSize assigns one tag bit to the leaf. A node contributes 1 plus the binary lengths of n, a and its child count, plus the sizes of the children. Binary length is log₂(x)+1, including one bit for zero. This is a combinatorial measure on a finite tree.

- `prattBitSizeList`: The sum of the sizes of the trees in a finite list.
- `prattBitSize_two : prattBitSize PrattCertificate.two = 1`: The leaf costs one bit.
- `prattBitSize_node n a cs`: The charge is the sum of header lengths and all child charges.
- `prattBitSize_pos c`: Every finite tree has positive size.

*Construction.* Recurse over the existing finite tree; retain repeated factors and charge every occurrence. ([PrattNotes](#source-prattnotes), pp.1–4, formal proof system and its length bound.) *Needs:* `PrattCertificate` (1.1).

**Checks.**

- *Degenerate case.* The leaf has size one.
- *Computed value.* The tree certifying 3 has size seven.
- *Non-example.* Repeated children are charged repeatedly, not silently shared as a DAG.

### 1.6 Quadratic bit-size bound for Pratt certificates (`pratt_small_certificate`)

**Theorem.** There is an absolute natural constant C such that every prime n has an accepted Pratt tree c of value n and prattBitSize(c)≤C·(log₂(n)+1)². This is an existence bound for certificates, not a bound on the cost of discovering the factorization of n−1.

*Proof sketch.* Induct using the prime factors of n−1 with multiplicity, as in the source proof-length bound. Bound every header by a constant times the binary length of n. Sum the recursive charges. The translation of the source proof lines to this tree measure is an additional proof requirement. ([PrattNotes](#source-prattnotes), pp.1–4, formal proof system and its length bound.) *Needs:* `prattBitSize` (1.5); `PrattCertificate.complete` (1.4).

### 1.7 Strong Miller–Rabin liar (`StrongLiar`)

**Definition.** For n,a∈ℕ write h=v₂(n−1) and t=(n−1)/2^h. StrongLiar n a means n>1 is odd, 0<a<n, and in ZMod n either a^t=1 or a^(t·2^j)=−1 for some j<h. The sample space is the nonzero residues 1,…,n−1; it is not restricted to units. Guards reject n=0,1 and all even n, which the primality wrapper handles separately.

- `strongLiar_iff n a`: The defining modular alternatives use the odd part of n−1.
- `strongLiar_coprime n a (h : StrongLiar n a)`: A strong liar is coprime to n, although the sampling space contains nonunits.
- `strongLiar_one n (hn : 1 < n) (hodd : Odd n)`: The base 1 passes for every odd n>1.

*Construction.* Use the multiplicity of 2 in n−1 via Nat.factorization and exact exponentiation in ZMod n. ([Shoup](#source-shoup), §10.2, pp.308–310.) *Needs:* Mathlib (integers, rationals, lists and finite functions).

**Checks.**

- *Computed value.* Base 3 passes for 7.
- *Degenerate case.* Input 1 is rejected.
- *Non-example.* 2047 is composite but passes the strong base-2 test.

The boundary theorem `strongLiar_2047_composite` states the displayed values.

### 1.8 Prime inputs pass every admissible base (`strongLiar_of_prime`)

**Theorem.** If n is an odd prime and 0<a<n, then StrongLiar n a.

*Proof sketch.* Fermat gives a^(n−1)=1. In the repeated-squaring chain in the field ZMod n, the predecessor of the first 1 is either absent (a^t=1) or is −1, since the only square roots of 1 are ±1. ([Shoup](#source-shoup), Theorem 10.3, prime-input case, p.309.) *Needs:* `StrongLiar` (1.7).

### 1.9 Miller–Rabin strong-liar bound (`strongLiar_card_le`)

**Theorem.** For odd composite n>1, the number of bases a with 0<a<n and StrongLiar n a is at most (n−1)/4. Equivalently, four times this cardinality is at most n−1.

*Proof sketch.* Split prime powers from numbers with at least two distinct prime factors. On prime powers use the cyclic-unit power-map kernel count; on at least two factors apply the CRT and the common 2-adic exponent to bound the two permitted fibres. The cyclic kernel, CRT fibre count, and Carmichael-at-least-three-primes steps are separate proof requirements. ([Shoup](#source-shoup), Theorem 10.3, pp.309–312.) *Needs:* `StrongLiar` (1.7).

### 1.10 Error bound for independent Miller–Rabin rounds (`millerRabin_rounds_bound`)

**Theorem.** For odd composite n>1 and k∈ℕ, among all (n−1)^k equally likely tuples of bases in {1,…,n−1}, at most (n−1)^k/4^k tuples pass every strong test. Equivalently, 4^k times the number of accepting tuples is at most (n−1)^k. This counting formulation is the uniform independent product distribution; it makes no promise for correlated or adversarially chosen bases.

*Proof sketch.* An accepting tuple is a function into the strong-liar subset, so its cardinality is the kth power of the one-round cardinality. Raise the one-round bound to k. ([Shoup](#source-shoup), §10.2 algorithm and Theorem 10.3, pp.309–312.) *Needs:* `strongLiar_card_le` (1.9).

### 1.11 AKS order parameter (`aksParameter`)

For n>1 let `aksParameter n` be the least r≥2 for which `1 < gcd(n,r)` or
`gcd(n,r)=1` and `4*(aksLen n)^2 < aksOrder n r`. Put `aksLen n = Nat.log 2 n + 1`
and `aksOrder n r = orderOf (n : ZMod r)`. For n≤1 set the parameter to zero.
The candidate r=n proves existence when n>1.

- `aksParameter_valid n (hn : 1 < n)`: For n>1 the parameter is between 2 and n and has the stated property.
- `aksParameter_minimal n r (hn : 1 < n) (hr : 2 <= r) (hlt : r < aksParameter n)`: No smaller admissible integer has that property.
- `aksParameter_small n (hn : n <= 1)`: The parameter is zero for n≤1.

Use the least-element property of ℕ (Shoup §21.2, Figure 21.1, printed p.550).
*Needs:* Mathlib `orderOf`, `ZMod`.

**Checks.**

- At n=2 the least admissible r is 2.
- At n=9 it is 3, while r=2 has order one and is inadmissible.
- At n=1 the sentinel is zero, outside the positive-input bounds.

The boundary theorem `aksParameter_two_nine_one` states the displayed values.

### 1.12 AKS polynomial congruences (`AKSIdentities`)

**Definition.** AKSIdentities n r ℓ means that for each integer j with 1≤j≤ℓ, (X+j)^n and X^n+j have the same remainder on division by X^r−1 in (ZMod n)[X]. The definition is a finite family of decidable polynomial identities, separate from claims that the coefficient ring is a field.

- `aksIdentities_zero n r`: The empty check range holds.
- `aksIdentities_mono n r l m (h : l <= m)`: Passing a larger check range implies passing a smaller one.
- `aksIdentities_iff n r l`: The predicate is exactly the finite remainder comparison.

*Construction.* Use Polynomial.modByMonic over the commutative ring ZMod n. The AKS criterion uses r>1, so the modulus is monic of degree r. ([Shoup](#source-shoup), §21.2, pp.549–550; Figure 21.1, p.550.) *Needs:* Mathlib (integers, rationals, lists and finite functions).

**Checks.**

- *Computed value.* The characteristic-5 identity passes at every r and every check range.
- *Degenerate case.* With no bases, even input 9 passes the identity predicate.
- *Non-example.* The empty identity test is not a primality criterion.

The boundary theorem `AKSIdentities.five_and_empty_nine` states this Check on the native carriers.

The boundary comparisons are `AKSIdentities.five_all`.

### 1.13 AKS arithmetic predicate (`AKSAccepts`)

Define `AKSAccepts n` to mean n>1, n is not a power `a^b` with a,b>1, and either
`aksParameter n = n` or that parameter is coprime to n and `AKSIdentities n r ℓ`, with
`r = aksParameter n` and `ℓ = 2*aksLen n*Nat.sqrt r+1`.

- `aks_small`: Integers at most one fail this predicate.
- `aks_perfect_power`: A power with base and exponent greater than one fails it.
- `aks_accepts_iff`: The predicate is exactly the stated arithmetic conjunction.

This is Shoup's arithmetic primality criterion (§21.2, Figure 21.1, p.550).
*Needs:* §§1.11–1.12.

**Checks.**

- Two satisfies the r=n alternative.
- Nine fails the non-power condition, independently of its polynomial congruences.
- One fails n>1 even though every empty family of congruences holds.

The boundary theorem `AKSAccepts.two_and_not_nine` states this Check on the native carriers.

### 1.14 AKS characterization of primes (`aks_correct`)

**Theorem.** For every natural n, `AKSAccepts n` holds iff n is prime.

*Proof sketch.* Prime inputs satisfy the polynomial identities by Frobenius. For a composite that reaches the final branch choose a prime p dividing n; the least-modulus property gives p>r and gcd(n,r)=1. Shoup’s quotient-algebra endomorphisms, upper bound on the evaluation image and lower bound from products of distinct linear factors contradict the order and length bounds. Those nonroutine algebraic estimates are separate proof requirements. ([Shoup](#source-shoup), §21.2 and Lemmas 21.6–21.11, pp.549–558.) *Needs:* `AKSAccepts` (1.13); `AKSIdentities` (1.12); `aksParameter` (1.11).

### 1.15 Pocklington prime-divisor congruence (`pocklington_prime_divisor`)

**Theorem.** Let n>1, F>1 and F∣n−1. Suppose that for each prime q∣F there is an integer a with a^(n−1)≡1 modulo n and gcd(a^((n−1)/q)−1,n)=1. Then every prime divisor p of n satisfies F∣p−1. The witness a may depend on q; F and (n−1)/F need not be coprime.

*Proof sketch.* For every prime-power q^e∣F, the order of a modulo p divides n−1 but does not divide (n−1)/q. Thus its q-adic exponent is at least e, and q^e divides p−1. Combine these prime powers. ([Thery](#source-thery), Theorem 6.1 and corrected Theorem 6.2, p.9.) *Needs:* Mathlib (integers, rationals, lists and finite functions).

### 1.16 Pocklington primality criterion (`pocklington_prime`)

**Theorem.** Under the prime-divisor criterion’s hypotheses, if F²>n then n is prime.

*Proof sketch.* If n were composite it would have a prime divisor p≤√n<F. The preceding congruence F∣p−1 contradicts 0<p−1<F. ([Thery](#source-thery), Theorem 6.1 and corrected Theorem 6.2, p.9.) *Needs:* `pocklington_prime_divisor` (1.15).

### 1.17 Finite Pocklington certificate (`PocklingtonCertificate`)

**Definition.** PocklingtonCertificate n stores a list of Pratt trees and one integer witness for each occurrence. Its certified part F is the product of the child values. Validity requires n>1, F>1, F∣n−1, n<F², all children accepted, and for each (q,a), a^(n−1)≡1 mod n and gcd(a^((n−1)/q)−1,n)=1. Repeated q encode multiplicity. The uncatalogued cofactor is allowed to remain unfactored.

- `PocklingtonCertificate.factor`: F is the product of certified child values.
- `PocklingtonCertificate.valid`: The conjunction of the bounds, divisibility, recursive validity and gcd conditions.
- `PocklingtonCertificate.valid_iff (c : PocklingtonCertificate) (n : Nat)`: Validity is equivalent to the stated finite conjunction.

*Construction.* Represent the entries as a finite list of pairs. Every prime divisor of F is a certified child, so the list supplies the universal witnesses needed by the Pocklington criterion. ([Thery](#source-thery), Theorem 6.1 and corrected Theorem 6.2, p.9.) *Needs:* `PrattCertificate.valid` (1.2); `PrattCertificate.sound` (1.3); `pocklington_prime` (1.16).

**Checks.**

- *Computed value.* F=8 with three factors 2 and witness 3 certifies 17.
- *Degenerate case.* An empty factor list is rejected.
- *Non-example.* A single factor 2 cannot certify 17 because 2²≤17.

### 1.18 Soundness of finite Pocklington certificates (`PocklingtonCertificate.sound`)

**Theorem.** If the Pocklington data are valid for n, then n is prime.

*Proof sketch.* Pratt soundness makes every child value prime. Every prime divisor of F occurs in the list, so select its recorded integer witness and apply the Pocklington criterion. ([Thery](#source-thery), Theorem 6.1 and corrected Theorem 6.2, p.9.) *Needs:* `PocklingtonCertificate` (1.17); `PrattCertificate.sound` (1.3); `pocklington_prime` (1.16).

### 1.19 Integer factorization with prime certificates (`IntegerFactorCertificate`)

**Definition.** An IntegerFactorCertificate stores a sign ε∈{−1,1} and a list of raw Pratt certificates. Its value is ε times the product of their natural values, viewed in ℤ. It is valid for z precisely when every Pratt tree is valid and this product equals z. Units ±1 have an empty factor list. Zero has no accepted certificate, and repeated primes remain repeated list entries.

- `IntegerFactorCertificate.value`: Decode the signed product.
- `IntegerFactorCertificate.valid`: The signed product equals z and all prime trees are valid.
- `IntegerFactorCertificate.valid_iff (c : IntegerFactorCertificate) (z : Int)`: Acceptance is the product equation together with acceptance of all prime witnesses.

*Construction.* Use a Bool for the sign and a finite list of existing Pratt trees. Decode by an integer product and require each tree to be valid. This certifies a discovered factorization independently of the algorithm that found it. ([PrattNotes](#source-prattnotes), pp.1–4, formal proof system and its length bound.) *Needs:* `PrattCertificate.valid` (1.2); `PrattCertificate.sound` (1.3); Mathlib `Nat.primeFactorsList`; Mathlib `Nat.prod_primeFactorsList`.

**Checks.**

- *Degenerate case.* The negative sign and empty list certify −1.
- *Computed value.* Two copies of 2 and the accepted certificate for 3 certify 12.
- *Non-example.* No zero product certificate is accepted.

The boundary comparisons are `IntegerFactorCertificate.zero_invalid`.

### 1.20 Soundness of integer factorization certificates (`IntegerFactorCertificate.sound`)

**Theorem.** An accepted certificate for z gives z≠0 and a list of prime absolute factors whose signed product is z. Thus every prime divisor of |z| occurs among its child values; no completeness inference is made from a partial list.

*Proof sketch.* Apply Pratt soundness to each child. Prime factors are positive and nonzero, so their signed product is nonzero. Euclid’s lemma identifies prime divisors of the product. ([PrattNotes](#source-prattnotes), pp.1–4, formal proof system and its length bound.) *Needs:* `IntegerFactorCertificate` (1.19); `PrattCertificate.sound` (1.3).

### 1.21 Every nonzero integer admits a factor certificate (`IntegerFactorCertificate.complete`)

**Theorem.** Every nonzero integer z admits an accepted IntegerFactorCertificate. Use the native primeFactorsList of |z| and Pratt completeness, retaining the sign of z.

*Proof sketch.* The native product theorem reconstructs the positive absolute value. Each list element is prime and therefore has an accepted Pratt tree. Restore the sign. ([PrattNotes](#source-prattnotes), pp.1–4, formal proof system and its length bound.) *Needs:* `IntegerFactorCertificate` (1.19); `PrattCertificate.complete` (1.4); Mathlib `Nat.prod_primeFactorsList`; Mathlib `Nat.prime_of_mem_primeFactorsList`.

### 1.22 Factorization certificate over a finite field (`FiniteFieldFactorCertificate`)

**Definition.** For a finite field F and f ∈ F[X], a FiniteFieldFactorCertificate f stores a nonzero constant c ∈ F and a finite list of triples (g_i, e_i, R_i) with g_i monic and pairwise distinct, e_i ≥ 1 and R_i an accepted RabinCertificate of g_i. Its fields include the exact polynomial identity f = C c · ∏ g_i^(e_i). The zero polynomial has no accepted certificate, because c ≠ 0 makes the product nonzero.

- `FiniteFieldFactorCertificate.valid`: The conjunction of the product identity and every Rabin condition; these are already proof fields in Suggested.lean.
- `FiniteFieldFactorCertificate.toMultiset`: The multiset Σ e_i·{g_i} of certified factors.
- `FiniteFieldFactorCertificate.leadingCoeff_eq (c : FiniteFieldFactorCertificate f)`: On acceptance, c is the leading coefficient of f.

*Construction.* Store the data as a list with the product identity, positive exponents and Rabin proofs as fields. Repeated factors are recorded by their exponents, not by repetition in the list. ([Shoup](#source-shoup), §20.3, p.527 (factorization of a monic polynomial into irreducibles) and Exercise 20.2(a), p.524.) *Needs:* `RabinCertificate` (0.15); Mathlib `UniqueFactorizationMonoid.normalizedFactors_prod_eq`.

**Checks.**

- *Degenerate case.* The polynomial 1 is certified by c = 1 and the empty list.
- *Computed value.* Over ZMod 5, X²+1 is certified by c = 1 and the linear factors X−2, X−3 with exponent one.
- *Non-example.* Over ZMod 5 the single factor X²+1 with exponent one is rejected, since X²+1 has no accepted Rabin certificate there.
- *Non-example.* The zero polynomial has no accepted certificate.

The boundary theorem `FiniteFieldFactorCertificate.square_linear_three` states this Check on the native carriers.

The boundary comparisons are `FiniteFieldFactorCertificate.five_split`, `FiniteFieldFactorCertificate.zero_impossible`.

### 1.23 Soundness of finite-field factorization certificates (`FiniteFieldFactorCertificate.sound`)

**Theorem.** If a FiniteFieldFactorCertificate of f ∈ F[X] is accepted, then f ≠ 0, leadingCoeff f = c, and its multiset Σ e_i·{g_i} equals Mathlib's normalizedFactors f.

*Proof sketch.* Each g_i is irreducible by Rabin soundness and monic, hence normalized. The product of a multiset of normalized irreducibles has that multiset as its normalized factors; the nonzero constant c is a unit and contributes nothing. Comparing leading coefficients of the monic product gives the second claim. ([Shoup](#source-shoup), §20.3, p.527; Exercise 20.2(a), p.524.) *Needs:* `FiniteFieldFactorCertificate` (1.22); `RabinCertificate` (0.15); Mathlib `UniqueFactorizationMonoid.normalizedFactors_prod_eq`.

### 1.24 Nonzero finite-field polynomials have factor presentations (`FiniteFieldFactorCertificate.complete`)

**Theorem.** Every nonzero polynomial over an arbitrary finite field has a
`FiniteFieldFactorCertificate`, with distinct monic factors and positive exponents.

*Proof sketch.* Unique factorization supplies the normalized factors and their multiplicities;
Rabin completeness supplies the conditions on each irreducible factor. ([Shoup](#source-shoup), §§20.3–20.5, pp.527–544 (Theorem 20.5, p.528; §20.4, pp.531–538; §20.5, pp.539–544).) *Needs:* `FiniteFieldFactorCertificate` (1.22); `RabinCertificate` (0.15).

### 1.25 Transport of certified finite-field factors (`transport_finite_factorization`)

**Theorem.** Let `e : F ≃+* K` be a certified change from a computable finite-field presentation to the intrinsic finite field. For nonzero f=c∏g_i with c≠0 and all g_i monic irreducible, mapping coefficients by e yields map(e,f)=e(c)∏map(e,g_i), again with monic irreducible factors. The certificate `FiniteFieldFactorCertificate` (1.22) and the existence theorem `FiniteFieldFactorCertificate.complete` (1.24) supply the data; this theorem checks the presentation boundary and reconstructs the intrinsic factorization.

*Proof sketch.* Use `FiniteFieldFactorCertificate.sound` (1.23) for the presented factorization. A field isomorphism preserves leading coefficients, products and irreducibility. Check the presentation’s explicit inverse before transport. ([Shoup](#source-shoup), Theorem 19.14, pp.515–516; Chapter 20.) *Needs:* `FiniteFieldFactorCertificate.sound` (1.23); `presentationChange` (0.17); `FiniteFieldPresentation` (0.16).

### 1.26 Coprime factor lifting modulo prime powers (`henselLift`)

**Theorem.** For a prime p, k≥1 and monic f∈ℤ[X], let `f mod p = g₀*h₀` with g₀,h₀
monic and coprime. There exists exactly one monic factor pair over `ZMod (p^k)` with
product `f mod p^k` and reductions g₀,h₀. A finite pairwise coprime monic factorization
lifts uniquely as well. Monicity fixes the degrees, including degree-zero factors.

*Proof sketch.* Induct on k with degree-bounded Bézout corrections: the correction to g has
degree below deg(g₀), and the correction to h has degree below deg(h₀). The homogeneous
correction equation has only the zero such pair, giving uniqueness. This proves the
factor statement directly (MilneANT, Theorem 7.33 and Lemmas 7.34–7.35, printed pp.121–122).
*Needs:* finite-field Bézout identities and reduction maps between `ZMod (p^k)`.

**Checks.**

- At k=1 the unique pair is the supplied pair itself.
- At p=7, `X²-2` with factors `X-3`, `X+3` lifts at k=2 to `X-10`, `X+10`.
- Coprimality is essential: at p=2, k=2, `X²` has the two monic factorizations
  `X*X` and `(X+2)*(X+2)` with the same reduction.

### 1.27 Rational polynomial factor certificate (`RationalFactorCertificate`)

**Definition.** For f∈ℚ[X], RationalFactorCertificate f consists of a nonzero rational leading factor c, a finite list of monic polynomials, proofs that each is irreducible over ℚ, and the exact identity f=c∏g_i. Multiplicity is represented by repeated factors. The definition uses actual irreducibility proofs; a CAS assertion or irreducibility modulo a single prime without a valid lifting criterion is insufficient. For f∈ℤ[X], certify its coefficientwise rational image and separately retain integer content and primitive-factor normalization.

- `RationalFactorCertificate.reconstruct`: The certificate reconstructs f exactly.
- `RationalFactorCertificate.input_nonzero (c : RationalFactorCertificate f)`: No certificate exists for the zero polynomial.
- `RationalFactorCertificate.leadingCoeff`: The scalar equals the leading coefficient of f because every listed factor is monic.

*Construction.* Store finite polynomial data and exact proof obligations. This wraps an output of discovery, not a new factorization theory. Each listed factor has an intrinsic irreducibility proof over ℚ. ([LLL82](#source-lll82), §3, algorithm 3.5 and Theorem 3.6, printed pp.25–26 of the linked report, for rational factorization and reconstruction.) *Needs:* Mathlib (integers, rationals, lists and finite functions).

**Checks.**

- *Degenerate case.* The unit polynomial uses scalar 1 and an empty list.
- *Computed value.* (X−1)² has the repeated linear list [X−1,X−1].
- *Non-example.* The zero polynomial has no such factor certificate.

### 1.28 Existence of rational factor presentations (`exists_rationalFactorCertificate`)

**Theorem.** For every nonzero f∈ℚ[X], there exists a `RationalFactorCertificate f`
whose scalar is `f.leadingCoeff`. The factors are monic and irreducible, with multiplicity
represented by repetition. No reduction-irreducibility hypothesis is imposed.

*Proof sketch.* Unique factorization gives normalized irreducibles; units in ℚ[X] are
nonzero constants, and comparison of leading coefficients identifies the scalar
(LLL82, Theorem 3.6, printed p.26 of the report, for the factorization statement).
*Needs:* §1.27 and unique factorization in ℚ[X].

**Checks.**

- A nonzero constant has no irreducible factors.
- `(X-1)^2` has two copies of `X-1`.
- `2*X^2+3*X+1 = C 2*(X+C (1/2))*(X+1)`, retaining the nonmonic scalar.
- `X^4+1` remains irreducible over ℚ despite having no irreducible reduction modulo a prime.

### Examples

- The Pratt tree `(3, 2, [2])` is accepted and has bit size `7`; the candidate for `9` with three factors `2` and witness `2` is rejected (`PrattCertificate.valid` (1.2), `prattBitSize` (1.5)).
- `2047 = 23·89` is composite but passes the strong test to base `2`; base `3` passes for the prime `7` (`StrongLiar` (1.7)).
- `aksParameter 9 = 3` exposes the factor `3`, and `aks 9` rejects `9` as a perfect power (`aksParameter` (1.11), `aks` (1.13)).
- `F = 8` with three factors `2` and witness `3` certifies `17` by Pocklington, since `8² > 17`; the single factor `2` does not, since `2² ≤ 17` (`PocklingtonCertificate` (1.17)).
- Over `ZMod 5`, `X²+1 = (X−2)(X−3)`; over `ℤ`, `X² − 2 ≡ (X−3)(X+3) (mod 7)` lifts to `(X−10)(X+10) (mod 49)` (`FiniteFieldFactorCertificate` (1.22), `henselLift` (1.26)).
- `X²+1` stays irreducible over `ℚ` although it splits over `ℂ` (`exists_rationalFactorCertificate` (1.28)).

### Dependencies

Layer CN.0; Mathlib (`lucas_primality`, `reverse_lucas_primality`, `Nat.primeFactorsList`, Carmichael numbers, `ZMod`, `Polynomial.modByMonic`, unique factorization, `PadicInt.toZModPow`, the Mahler-measure coefficient bound).

## Layer CN.2: Order presentations and local arithmetic

All coordinates refer to the native number field and its native ring of integers. A full
multiplication-stable integer lattice containing one is an order; maximality is a separate
property. The multiplier criterion applies to arbitrary full orders, including at divisors
of a power-basis index. First-order φ-Newton data keep their sign, normalization and
separability hypotheses. The local targets treat finite extensions of ℚ_p and primes of
arbitrary ramification.

*Proof obligations of the layer.* Prove the p-primary multiplier-overorder comparison and
containment in `(1/p)R` (Stevenhagen Proposition 9.3, p.235), and use the
index–discriminant identity of NumberFieldArithmetic. At index divisors, prime presentations
use the maximal order. The φ-polygon product and factorization theorems are specified in
§2.19a; repeated residual factors carry no first-order irreducibility conclusion. Local
expansions retain the residue section, embedding and uniformizer.

### 2.1 Finite order basis certificate (`OrderBasisCertificate`)

**Definition.** For a number field K and n∈ℕ, an OrderBasisCertificate stores b₀,…,bₙ₋₁∈K forming a ℚ-basis, integer coordinates for 1, and integer structure constants b_i b_j=Σ_k m_ijk b_k. These finite identities prove that the integer span of b is a full order. The certificate does not assert maximality.

- `OrderBasisCertificate.lattice`: The integer span of the displayed rational basis.
- `OrderBasisCertificate.mul_mem`: That lattice is closed under multiplication.
- `OrderBasisCertificate.order`: Package the integer span as a native ℤ-subalgebra of K.
- `OrderBasisCertificate.mem_order (b : OrderBasisCertificate K n) (x : K)`: Membership is existence of integer coordinates in b.
- `OrderBasisCertificate.coordinates_unique (b : OrderBasisCertificate K n) (a a' : Fin n -> Int)`: Integer coordinates in the basis are unique.

*Construction.* Check rational linear independence and spanning, the coordinate equation for 1, and all n² multiplication equations. The integer span is then closed under multiplication. The column Hermite decompositions of ClassicalArithmeticCompletion §3.25 supply coordinate reconstruction. ([NumberRings](#source-numberrings), §9, pp.233–235.) *Needs:* ClassicalArithmeticCompletion §3.25 `IntMatrix.IsHermiteDecomposition`.

**Checks.**

- *Computed value.* The singleton basis 1 presents ℤ in ℚ.
- *Degenerate case.* A number field has no rank-zero order certificate.
- *Non-example.* The singleton rational basis 1/2 is not closed under multiplication over ℤ.

The boundary theorem `OrderBasisCertificate.rational_singleton` states this Check on the native carriers.

The boundary comparisons are `OrderBasisCertificate.half_basis_impossible`.

### 2.2 Multiplier ring of an integral lattice (`multiplierRing`)

**Construction.** For a field K of characteristic zero and an integer submodule I⊆K, multiplierRing I is the ℤ-subalgebra {x∈K | xI⊆I}. This definition also permits I=0, in which case the multiplier ring is all of K. Finiteness and the full-lattice condition are hypotheses of the maximal-order theorems, not hidden in this carrier. For a fractional ideal of an order it is the same set as the `Subring` `NumberFieldOrder.multiplierRing` of the native order carrier; the version here accepts any ℤ-submodule of K.

- `mem_multiplierRing`: Membership means preservation of every lattice element by multiplication.
- `multiplierRing_zero (L : Type*)`: The zero lattice has the whole field as multiplier ring.
- `multiplierRing_smul I a (ha : a != 0)`: Multiplying a lattice by a nonzero field element does not change its multiplier ring.

*Method.* The stabilizing condition is closed under addition, multiplication and negation. Every integer scalar stabilizes I. Package the subset as the existing Subalgebra ℤ K type. ([NumberRings](#source-numberrings), §9, Proposition 9.3, pp.234–235.) *Needs:* Mathlib (integers, rationals, lists and finite functions).

**Checks.**

- *Degenerate case.* The zero lattice must not be treated as a finite order.
- *Agreement with the library notion.* The lattice generated by 1 in ℚ has only integral multipliers.
- *Non-example.* 1/2 does not stabilize the lattice ℤ inside ℚ.

The boundary theorem `multiplierRing_half_impossible` states this Check on the native carriers.

The boundary comparisons are `multiplierRing_integer_lattice`.

### 2.3 Local maximality of an order (`IsPMaximal`)

**Definition.** For a ℤ-subalgebra R of a characteristic-zero field K and a prime p, IsPMaximal R p means that for every x∈K integral over ℤ there is an integer a not divisible by p with a·x∈R. For a full finite order R this says its localization at p equals that of the maximal order, or equivalently p does not divide its index. The predicate is meaningful at arbitrary p, but arithmetic theorems assume primality.

- `isPMaximal_iff R p`: Local maximality is the stated prime-to-p denominator-clearing property.
- `isPMaximal_mono`: Enlarging R preserves local maximality.
- `isPMaximal_top p (hp : p.Prime)`: The whole field satisfies the predicate at primes; finiteness must be imposed separately for orders.

*Construction.* Express equality after localization by clearing a denominator prime to p. Keep the intrinsic integral closure as the target. ([NumberRings](#source-numberrings), §9, pp.233–235.) *Needs:* Mathlib (integers, rationals, lists and finite functions).

**Checks.**

- *Computed value.* The usual copy of ℤ in ℚ is p-maximal at every prime.
- *Non-example.* At p=1 no denominator passes, so the predicate is false.
- *Agreement with the library notion.* Every overorder of a p-maximal order remains p-maximal.

The boundary comparisons are `isPMaximal_integer_order`, `isPMaximal_mono`.

### 2.4 Nilradical from a Frobenius kernel (`nilpotent_iff_frobenius_zero`)

**Theorem.** Let A be a finite-dimensional commutative algebra over ZMod p, p prime, and let p^k≥dim A. Then x is nilpotent iff x^(p^k)=0. Consequently the nilradical is the kernel of the kth iterate of the Frobenius algebra endomorphism, computable by linear algebra in any supplied basis.

*Proof sketch.* A nilpotent multiplication operator on the d-dimensional space has nilpotency exponent at most d. Thus x^d=0 and x^(p^k)=0. The reverse implication is the definition of nilpotence. The semantic kernel is native linear algebra. The kernel of the Frobenius iterate in a supplied basis is computed by Tau Ceti's `TauCeti.kernelBasis` (row reduction over a field, with `mulVec_eq_zero_of_mem_kernelBasis`, `span_kernelBasis` and `linearIndepOn_kernelBasis`); the bound x^d = 0 for nilpotent x is Cayley–Hamilton for the multiplication operator. ([NumberRings](#source-numberrings), §9, pp.233–234.) *Needs:* Mathlib `FiniteField.frobeniusAlgHom`; Mathlib `Ideal.radical`; Tau Ceti `TauCeti.kernelBasis`.

### 2.5 The p-radical in field coordinates (`pRadicalLattice`)

**Construction.** For a ℤ-subalgebra R of a number field K and natural p, pRadicalLattice R p is the integer submodule of x∈R with x^k∈pR for some k≥1. The computational and maximality results use full finite orders and prime p. It is the inverse image of the nilradical of R/pR. The exponent excludes the empty-power convention. This is a coordinate adapter for the native ideal radical, not a second definition of radical.

- `mem_pRadicalLattice`: Membership is a positive power in pR.
- `pRadicalLattice_contains_p R p`: The element p belongs to the p-radical.
- `pRadicalLattice_mul R p x y (hx : x ∈ R) (hy : y ∈ pRadicalLattice R p)`: The lattice is stable under multiplication by its order.

*Method.* Take the native radical of pR in R and map its underlying integer module through the inclusion R→K. Finite-field linear algebra computes it from the Frobenius kernel. ([NumberRings](#source-numberrings), Equation (9-2) and following paragraph, pp.234–235.) *Needs:* Mathlib `Ideal.radical`; `nilpotent_iff_frobenius_zero` (2.4); ClassicalArithmeticCompletion §3.25 `IntMatrix.IsHermiteDecomposition`.

**Checks.**

- *Degenerate case.* For a characteristic-zero field the zero-radical of an order is zero.
- *Computed value.* The p-radical of ℤ inside ℚ is pℤ for prime p.
- *Non-example.* 1 does not belong to the p-radical of ℤ at a prime.

The boundary theorem `pRadicalLattice_integer_three` states this Check on the native carriers.

The boundary comparisons are `pRadicalLattice_zero`.

### 2.6 Multiplier criterion for p-maximality (`pRadical_multiplier_eq_iff`)

**Theorem.** For a full order R presented by an OrderBasisCertificate and a prime p, the multiplier ring of pRadicalLattice R p equals R iff IsPMaximal R p. In the nonmaximal case it is a strictly larger integral overorder contained in (1/p)R; its quotient over R is p-primary.

*Proof sketch.* Apply Stevenhagen Proposition 9.3 to the p-primary saturation. If the order is already p-maximal, the multiplier ring lies between R and its p-primary saturation, forcing equality. Otherwise Proposition 9.3 supplies a multiplier outside R. Finite-lattice coordinate conversion is provided by ClassicalArithmeticCompletion §§3.25 and 3.48. ([NumberRings](#source-numberrings), Proposition 9.3 and its proof, p.235.) *Needs:* `OrderBasisCertificate` (2.1); `pRadicalLattice` (2.5); `multiplierRing` (2.2); `IsPMaximal` (2.3); ClassicalArithmeticCompletion §3.25 `IntMatrix.IsHermiteDecomposition`.

### 2.7 Integral basis certificate (`IntegralBasisCertificate`)

**Definition.** An IntegralBasisCertificate K is an OrderBasisCertificate of some finite rank together with a proof that its order is exactly the set of elements integral over ℤ. Thus its basis spans the native ring of integers, not merely a suborder. A practical finite certificate proves this maximality by checking the p-radical multiplier criterion at every prime whose square divides the starting discriminant.

- `IntegralBasisCertificate.mem_iff (c : IntegralBasisCertificate K n) (x : K)`: The certificate identifies the order with the integral closure.
- `IntegralBasisCertificate.rank_eq (c : IntegralBasisCertificate K n)`: The rank is the rational field degree.
- `IntegralBasisCertificate.integerBasis`: Transport the checked coordinates to a native ℤ-basis of the ring of integers.

*Construction.* Store the full order basis and the exact maximality equation. The finite local checks are converted to this equation by the discriminant-index theorem; the resulting basis transports to the native RingOfIntegers carrier. ([NumberRings](#source-numberrings), §9, pp.233–235.) *Needs:* `OrderBasisCertificate` (2.1); `pRadical_multiplier_eq_iff` (2.6); `IntegerFactorCertificate` (1.19).

**Checks.**

- *Computed value.* ℚ has an integral basis certificate of rank one.
- *Degenerate case.* A certificate has positive rank.
- *Non-example.* The rational 1/2 is excluded by the certificate for ℚ.

The boundary theorem `IntegralBasisCertificate.rational_singleton` states this Check on the native carriers.

The boundary comparisons are `IntegralBasisCertificate.rank_pos`, `IntegralBasisCertificate.half_not_mem`.

### 2.8 Integral bases extending any full order (`exists_integralBasisCertificate_extending`)

**Theorem.** For a number field K and any `OrderBasisCertificate K n` with lattice R,
there exists an `IntegralBasisCertificate K n` whose lattice contains R. Its lattice is the
native integral closure; its rank equals the input rank and the degree of K.

*Proof sketch.* The input identities make every element integral. The native integer ring
is finite free of the same rank and contains R (NumberRings, §9, printed pp.233–235).
*Needs:* §2.7; NumberFieldArithmetic Layers 3 and 7; ClassicalArithmeticCompletion
§3.25 `IntMatrix.IsHermiteDecomposition`.

**Checks.**

- Over ℚ the output lattice is the integer ring, for every full input order.
- Rank zero cannot occur because K is a field containing ℚ.
- An input already spanning the integer ring gives the same lattice, with no chosen-basis equality asserted.

### 2.9 Prime-ideal decomposition certificate (`PrimeIdealFactorCertificate`)

**Definition.** For K a number field and a natural p, a PrimeIdealFactorCertificate K p stores a finite list of pairwise distinct nonzero prime ideals P_i of the native ring of integers, positive exponents e_i, and the identity pO_K=∏P_i^e_i. The arithmetic decomposition theorem assumes p is prime; the raw structure also permits p=1 with the empty list. Each ideal is presented in the certified integral basis. Primality may be checked by an explicit finite-field quotient presentation. At primes dividing the index of a chosen power basis, the computation must use the maximal order or a proved higher-order method.

- `PrimeIdealFactorCertificate.reconstruct`: The product is exactly the rational prime ideal.
- `PrimeIdealFactorCertificate.exponent_pos (c : PrimeIdealFactorCertificate K p) (h : (P, e) ∈ c.factors)`: Every listed exponent is strictly positive.
- `PrimeIdealFactorCertificate.nonempty`: For prime p the decomposition cannot be empty.

*Construction.* Use native ideals, ideal multiplication and primality. The exact product and prime checks certify the decomposition without trusting a discovered factor list. Residue fields are presented by `FiniteFieldPresentation` (0.16), and ideals by the integral basis coordinates. ([NumberRings](#source-numberrings), §9, pp.234–235; §12, p.248.) *Needs:* `IntegralBasisCertificate` (2.7); `FiniteFieldPresentation` (0.16).

**Checks.**

- *Computed value.* A rational prime stays a single prime of exponent one over ℚ.
- *Non-example.* A zero exponent cannot pad the output.
- *Degenerate case.* The zero ideal cannot occur.

The boundary theorem `PrimeIdealFactorCertificate.rational_two` states this Check on the native carriers.

### 2.16 Exact φ-adic polynomial expansion (`phiExpansion`)

**Construction.** For a commutative ring R and monic φ∈R[X] of positive degree m, phiExpansion φ f returns coefficients a_i∈R[X] of degree less than m, zero for i>floor(natDegree f/m), with f=Σa_iφ^i. It uses successive division by the monic polynomial φ; the coefficients are polynomials, not scalar coefficients of f. The zero polynomial has all coefficients zero.

- `phiExpansion_reconstruct`: The finite φ-adic sum is f.
- `phiExpansion_degree phi f i (hphi : phi.Monic) (hdeg : 0 < phi.natDegree)`: Each coefficient has degree strictly below deg φ.
- `phiExpansion_eventually_zero phi f (hphi : phi.Monic) (hdeg : 0 < phi.natDegree)`: Indices beyond the quotient-degree bound have zero coefficient.

*Method.* Repeated monic quotient/remainder division lowers degree. The remainders are the a_i. Induction gives reconstruction, the degree bound and uniqueness. ([GMN](#source-gmn), §1.2, Definition 1.6, p.7.) *Needs:* Mathlib (integers, rationals, lists and finite functions).

**Checks.**

- *Degenerate case.* The expansion of zero is identically zero.
- *Agreement with the library notion.* For φ=X the coefficients are the constant polynomials C(f.coeff i).
- *Computed value.* For φ=X−1, X² has coefficients 1,2,1.

The boundary theorem `phiExpansion_X` states this Check on the native carriers.

The boundary comparisons are `phiExpansion_shifted_square`.

### 2.17 Valuation of a φ-coefficient (`coefficientValuation`)

**Definition.** For prime p and a∈ℤ[X], coefficientValuation p a is infinity if a=0, and otherwise the minimum v_p(a_i) over the nonzero coefficients. It uses WithTop ℕ, so the zero polynomial has infinite valuation; the native default v_p(0)=0 is never inserted into the minimum.

- `coefficientValuation_zero p`: Zero has infinite valuation.
- `coefficientValuation_const p a (ha : a != 0)`: A nonzero constant has its usual integer valuation.
- `coefficientValuation_ge_iff p f N`: A lower valuation bound means coefficientwise divisibility by p^N.

*Construction.* Take the finite minimum over the support of a, with top for the empty support. This is the Gauss valuation used only to compute the points of the φ-adic polygon. Ordinary Newton polygons of polynomials over a valued field, with sloped valuations and slope multiplicities, are ClassicalArithmeticCompletion §3.33's. ([GMN](#source-gmn), §1.2, p.7.) *Needs:* `phiExpansion` (2.16); Mathlib `padicValRat`.

**Checks.**

- *Degenerate case.* The zero polynomial gives top.
- *Computed value.* 3X+9 has 3-adic coefficient valuation 1.
- *Non-example.* X² has valuation zero, regardless of its zero constant coefficient.

The boundary comparisons are `coefficientValuation_three_controls`.

### 2.18 A finite negative φ-Newton side (`IsPhiNewtonSide`)

**Definition.** For prime p and monic positive-degree φ∈ℤ[X], IsPhiNewtonSide p φ f s u e h d certifies the entire supporting side from (s,u) to (s+ed,u−hd), with slope −h/e. Require e,h,d>0, gcd(e,h)=1 and hd≤u. The two endpoint coefficient valuations equal their displayed ordinates. Every φ-expansion point lies on or above the line e·v_p(a_i)+h·i=e·u+h·s, and every point on that line has s≤i≤s+ed. Zero coefficients have valuation infinity. The φ-divisible initial segment has slope −∞ and is recorded separately by its multiplicity; it is not encoded with a finite e,h.

- `phiSide_denominator_pos`: The slope denominator is positive.
- `phiSide_left_nonzero`: The left endpoint coefficient is nonzero.
- `phiSide_length_pos`: A side has strictly positive horizontal length ed.

*Construction.* Use the already specified φ-expansion and coefficient Gauss valuation. Clear the slope denominator to use exact integer inequalities. The side is certified by these inequalities alone; it needs no convex-hull construction. ([GMN](#source-gmn), Definitions 1.6–1.9, pp.7–8.) *Needs:* `phiExpansion` (2.16); `coefficientValuation` (2.17).

**Checks.**

- *Computed value.* X²−3 has the single 3-adic side of slope −1/2.
- *Degenerate case.* The zero polynomial has no finite side.
- *Non-example.* The slope of X²−3 is not −1.

The boundary theorem `phiSide_X_sq_sub_three` states this Check on the native carriers.

### 2.19 Residual polynomial of a φ-Newton side (`phiResidualPolynomial`)

**Construction.** For side data (s,u,e,h,d), phiResidualPolynomial has coefficient at Y^j equal to the reduction in F_φ=(ℤ/pℤ)[X]/(φ mod p) of a_(s+ej)/p^(u−hj), for 0≤j≤d. Divide each integer coefficient exactly before reducing. For a certified side the divisions are exact; points strictly above the side give zero. The endpoint coefficients are nonzero when φ mod p is irreducible, so the residual degree is d and Y does not divide it. Uniformizer p and reduction of the chosen φ are fixed conventions.

- `phiResidual_degree_le`: No coefficient above d occurs.
- `phiResidual_degree`: On a certified side over an irreducible residue polynomial the degree is exactly d.
- `phiResidual_constant_ne_zero`: The left endpoint gives a nonzero constant coefficient.

*Method.* Use integer coefficient division, the native quotient AdjoinRoot and the finite monomial sum. Reduction and exact divisibility lemmas are separate proof requirements. ([GMN](#source-gmn), Definition 1.9, p.8.) *Needs:* `IsPhiNewtonSide` (2.18); `FiniteFieldPresentation` (0.16).

**Checks.**

- *Computed value.* For X²−3 the residual polynomial is Y−1, not Y or Y²−1.
- *Degenerate case.* Raw zero input gives zero residual output.
- *Non-example.* (X−3)² has repeated residual (Y−1)², so a square-free residual hypothesis cannot be omitted.

The boundary comparisons are `phiResidual_X_sq_sub_three`, `phiResidual_repeated_linear`.

### 2.19a Products and factorization of φ-polygons

Use a finite extension L/ℚ_p, its valuation ring O, residue field κ and a fixed uniformizer π.
Fix monic φ∈O[X] of positive degree whose reduction is irreducible. Extend the coefficient
Gauss valuation, φ-expansion and residual construction of §§2.16–2.19 to O, with π in place
of p; denote the negative principal polygon by `phiPrincipalPolygon` and the residual at
λ<0 by `phiResidualAtSlope`. The polygon is the lower hull of finite coefficient-valuation
points restricted to negative slopes, with an initial −∞ side of length `ord_φ(f)`.
The residual polynomial uses the normalized coefficients at the supporting line of slope λ,
even when its λ-component has length zero. API: `phiPrincipalPolygon_slopes`,
`phiResidualAtSlope_ne_zero`, `phiResidualAtSlope_uniformizer_change`; for `π′=ρπ` with
residue c, the change is `R′(Y)=c^(-u)*R(c^h*Y)` at a side starting at (s,u), of slope −h/e.
The integer definitions are their ℚ_p specialization (GMN Definitions 1.6, 1.8–1.10,
printed pp.7–8; GMN line 395).

**Checks.**

- At L=ℚ₃, φ=X, f=X²−3, the polygon has slope −1/2 and residual Y−1.
- A nonzero constant has a point polygon and a nonzero constant residual; f=0 is excluded.
- Changing π=3 to π′=−3 changes the residual of X²−3 from Y−1 to Y+1, fixing the unit factor.

Prove `phiPolygon_mul` and `phiResidual_mul`: for arbitrary nonzero f,g∈O[X] and every
negative rational λ, the principal polygon of fg is the slope-ordered polygon sum and
`R_λ(fg)=R_λ(f)*R_λ(g)`. Monicity of f,g is unnecessary (GMN Theorem 1.13, printed
pp.10–11; GMN line 495). *Needs:* §§2.16–2.19 over O and the displayed definitions.

**Checks.**

- Multiplication by one preserves the polygon and its residual polynomial exactly.
- At ℚ₃, `(X-3)^2` has slope −1 and residual `(Y-1)^2`, retaining multiplicity.
- `(X-3)*(X-9)` has two slopes −2 and −1; replacing both by the mean slope fails.

Prove `phiPolygon_factorization`: for monic f∈O[X] whose reduction is divisible by φ̄,
let f_φ be its unique monic Hensel factor reducing to the full φ̄-primary part.
It factors uniquely into monic factors for the distinct negative slopes. Each has the
corresponding side up to translation and the same residual up to a nonzero scalar;
for a root θ of the λ-factor, `v_L(φ(θ))=-λ`, with v_L extended from L, and the −∞
factor is `φ^ord_φ(f)` (GMN Theorem 1.15, printed pp.11–12; GMN line 575).
*Needs:* `phiPolygon_mul`, `phiResidual_mul`, and coprime factor Hensel over complete DVRs
(MilneANT Theorem 7.33; the same degree-bounded correction proof as §1.26).

**Checks.**

- `(X-3)*(X-9)` over ℚ₃ splits into the two stated slope factors.
- `X²−3` has one slope and one polygon factor, although φ=X has degree one.
- `φ²` has only its −∞ factor; a finite-slope formulation would omit it.

Prove `phiResidual_factorization`: for such monic f, a finite side of slope λ=−h/e,
and a factorization `R_λ(f) ~ ∏ ψ_i^a_i` into pairwise distinct monic irreducibles,
with every a_i>0, its slope factor is a product of monic G_i with
`R_λ(G_i) ~ ψ_i^a_i`, and each G_i has that single slope. For a root θ of G_i,
`e | e(L(θ)/L)` and `deg φ*deg ψ_i | f(L(θ)/L)`; if a_i=1, G_i is irreducible and
both divisibilities are equalities (GMN Theorem 1.19 and Corollary 1.20, printed
pp.14–15; GMN line 684). *Needs:* `phiPolygon_factorization` and `phiResidual_mul`.

**Checks.**

- At ℚ₃, `X²−3` has residual Y−1 with exponent one, giving e=2 and residue degree one.
- At ℚ₅, `X²-25` has slope −1 and residual `(Y-1)*(Y+1)`, producing two linear factors.
- At ℚ₃, `(X-3)^2` has exponent two in its residual factor; irreducibility cannot be concluded.

### 2.20 Ore residual irreducibility criterion (`ore_residual_irreducible`)

**Theorem.** Let p be prime, φ and f monic in ℤ[X], deg φ>0, and φ mod p irreducible. Suppose f mod p=(φ mod p)^n, n>0, and the whole φ-polygon is the finite side from (0,hd) to (ed,0), with n=ed and coprime positive h,e. If its residual polynomial is irreducible over F_φ, then f is irreducible over ℚ_p. For a root θ the resulting local extension has ramification index e and residue degree deg(φ)·deg(R); these intrinsic invariants and their normalization are supplied by LocalFieldsRamification.

*Proof sketch.* Use the product theorem for φ-polygons and residual polynomials, the polygon factorization theorem and residual factorization theorem. An irreducible residual factor of exponent one admits only one irreducible local factor. The native local degree formula then gives the ramification and residue degrees. ([GMN](#source-gmn), Theorem 1.19 and Corollary 1.20, pp.14–15.) *Needs:* `phiResidualPolynomial` (2.19); `phiPolygon_mul`, `phiResidual_mul`, `phiPolygon_factorization`, `phiResidual_factorization` (2.19a); TauCetiRoadmap LocalFieldsRamification Layer 0; `henselLift` (1.26).

### 2.21 Finite local expansion certificate (`LocalExpansionCertificate`)

**Definition.** For a normed field L, chosen nonzero element π with ‖π‖<1, element x and digit count N, a LocalExpansionCertificate stores an integer initial exponent v, digits d₀,…,dₙ₋₁ of norm at most one, and a proved remainder bound ‖x−π^vΣd_iπ^i‖≤‖π‖^(v+N). For local digit extraction, π is a uniformizer and the local field and reduction map are those of TauCetiRoadmap LocalFieldsRamification Layer 0; the certificate itself records only the norm conditions. A chosen residue section is a separate input; canonical Teichmüller representatives belong to TauCetiRoadmap LocalFieldsRamification Layer 1. Without a fixed residue section these finite digits are not canonical; equality of decoded approximations is not asserted to imply equality of digits.

- `LocalExpansionCertificate.center`: The exact finite centre is π^v times the digit polynomial.
- `LocalExpansionCertificate.error_bound (c : LocalExpansionCertificate L pi x N)`: The supplied exact x lies in the certified local ball.
- `LocalExpansionCertificate.integral_digits (c : LocalExpansionCertificate L pi x N) (i : Fin N)`: Every exact digit has norm at most one.

*Construction.* Store exact native field elements and the norm inequality. A choice of residue section is additional data for any digit normalization; the record itself asserts precisely the displayed finite error inequality. Layer 0 supplies field and valuation structure, not an expansion theorem. Preserve the chosen prime, embedding and uniformizer normalization in comparisons. ([CarusoPublished](#source-carusopublished), §2.1.1, pp.17–19.) *Needs:* TauCetiRoadmap LocalFieldsRamification Layer 0; `PadicApproximation` (0.14); `PrimeIdealFactorCertificate` (2.9).

**Checks.**

- *Degenerate case.* Zero has a certificate with zero digits at every finite length.
- *Computed value.* π⁻¹ has a length-one exact expansion with initial exponent −1 and digit 1.
- *Non-example.* A precision-one zero centre at v=0 cannot represent 1 when ‖π‖<1.

The boundary comparisons are `LocalExpansionCertificate.uniformizer_inverse`, `LocalExpansionCertificate.one_not_zero_centre`.

### 2.22 Squares of units in a finite extension of ℚ_p (`isSquare_iff_isSquare_mod`)

**Theorem.** Let L be a characteristic-zero nonarchimedean local field, O_L its native valuation ring and π an irreducible element of O_L (a uniformizer). In particular this includes every finite extension of ℚ_p. A unit u ∈ O_L^× is a square in L exactly when u ≡ w² (mod 4π O_L) for some w ∈ O_L. Consequently the square class of a nonzero element of L is decided by the parity of its valuation and a finite computation in O_L/4πO_L. For odd p the condition says that the residue of u is a square in the residue field; for L = ℚ_2 it says u ≡ 1 (mod 8).

*Proof sketch.* If u ≡ w² modulo 4π then w is a unit, and the polynomial X² − u satisfies |w² − u| ≤ |4π| < |2w|², so Newton's lemma gives a root of X² − u near w. The converse is immediate. For odd p, 4π generates the maximal ideal; for L = ℚ_2, 4π = 8 and the unit squares modulo 8 are 1. ([MilneANT](#source-milneant), Theorem 7.32 (Newton's lemma), printed p.120.) *Needs:* TauCetiRoadmap LocalFieldsRamification Layer 0; Tau Ceti `TauCeti.unitFiltration_le_range_powMonoidHom_two` in `TauCeti.NumberTheory.LocalField.Squares`.

The native `ℤ_[p]` specialization is `isSquare_iff_isSquare_mod_padic`.

**Checks.**

- In ℚ₂, 17 is square while 5 is not; testing modulo four would falsely accept 5.
- In ℚ₅, 6 is square since its unit residue is one.
- `ramified_dyadic_unit_square`: in ℚ₂(√2), with π=√2, the unit 3+2π equals
  `(1+pi)^2`, so it passes the `4*pi` test; replacing π by the base prime changes the quotient.

### 2.23 Roots in ℚ_p from the decomposition of p (`card_padicRoots_eq`)

**Theorem.** Let f ∈ ℚ[X] be monic irreducible, K = ℚ[X]/(f) and p a prime. The number of roots of f in ℚ_p equals the number of prime ideals P of O_K above p with ramification index and residue degree both equal to 1. For a separable f with irreducible factors f_j and fields K_j, the number of roots of f in ℚ_p is the sum of these counts over j. With the PrimeIdealFactorCertificate of each K_j at p, the count is a finite computation.

*Proof sketch.* K ⊗_ℚ ℚ_p is the product of the completions K_P over the primes P above p, and [K_P : ℚ_p] = e(P|p)·f(P|p). A root of f in ℚ_p is a ℚ-algebra map K → ℚ_p, equivalently a factor K_P of degree one. Distinct roots give distinct factors because f is separable. ([MilneANT](#source-milneant), Proposition 8.2 and its proof, printed p.136.) *Needs:* `PrimeIdealFactorCertificate` (2.9); `exists_rationalFactorCertificate` (1.28); TauCetiRoadmap LocalFieldsRamification Layer 0.

### Examples

- The `p`-radical of `ℤ` in `ℚ` is `pℤ`, whose multiplier ring is `ℤ`, so `ℤ` is `p`-maximal (`pRadicalLattice` (2.5), `pRadical_multiplier_eq_iff` (2.6)).
- `X² − 3` has the single `3`-adic side of slope `−1/2` with residual polynomial `Y − 1`; `(X − 3)²` has the repeated residual `(Y − 1)²`, so the square-free hypothesis of Ore's criterion fails there (`IsPhiNewtonSide` (2.18), `phiResidualPolynomial` (2.19)).
- In `ℚ_2`, `17` is a square and `5` is not, although `5 ≡ 1 (mod 4)`; in `ℚ_5`, `6` is a square because `6 ≡ 1 (mod 5)` (`isSquare_iff_isSquare_mod` (2.22)).
- `X² − 2` has two roots in `ℚ_7`, because `7` splits in `ℚ(√2)`, and none in `ℚ_2`, because `2` ramifies (`card_padicRoots_eq` (2.23)).
- `π⁻¹` has a length-one expansion with initial exponent `−1` and digit `1` (`LocalExpansionCertificate` (2.21)).

### Dependencies

Layers CN.0–CN.1; ClassicalArithmeticCompletion §§3.25, 3.27 and 3.48; TauCetiRoadmap NumberFieldArithmetic Layers 3 and 7; TauCetiRoadmap LocalFieldsRamification Layers 0–1; Mathlib (number fields, `Ideal.radical`, Frobenius); Tau Ceti `TauCeti.kernelBasis`.

## Layer CN.3: Exact modular and elliptic arithmetic data

The integral Fourier-coefficient lattice lives inside the complex space of level-one forms.
Construct its Miller basis from the normalized `E₄`, `E₆` and `Δ`, and keep it distinct from the
integral modular-symbol lattice. Mathlib's characteristic-zero Sturm theorem gives exact equality;
congruence modulo a prime needs the integral model and its own theorem. Hecke matrices and finite
coefficient arrays are bound to the intrinsic operators before any numerical example or database
identification is exported. The second half of the layer treats elliptic curves over `ℚ`: point
counts over finite fields, certified local images of the `x − T` descent map with a size check
that decides completeness, and a finite criterion for `p`-saturation of a subgroup of the
Mordell–Weil group.

*Proof obligations of the layer.* Prove coefficient integrality of the normalized E₄, E₆ and Δ, the dimension-compatible monomial family, its leading powers and integral unitriangular elimination (Stein Algorithm 2.18, Lemma 2.20 and Remark 2.21, pp.19–21). The full modular lattice additionally needs an Eisenstein generator with the correct denominator normalization. Prove the integral polynomial-in-j lemma needed for the congruence Sturm bound and use the level-one q-expansion principle of AlgebraicModularFormsAndSerreWeights R15.2 (Stein Theorem 9.18, pp.171–172). In the BCG examples a singular residual determinant gives a finite witness, and a characteristic-zero eigenform comes from the Deligne–Serre lifting lemma of R15.5. A companion system needs one common eigenvector for all Hecke operators, the theta operator and Hasse invariant of R15.3, and a finite congruence Sturm certificate; matching roots of two characteristic polynomials is not enough. Produce full certificates for every listed witness and every exclusion in the finite ranges. In the cohomological convention of BCG, a_g(ℓ) = ℓ^(p−k)·a_f(ℓ), so the exponent at (107, 26) is 81; at (151, 52) and (151, 100) the gcd condition gives 3, not 1. For elliptic curves, every finite output is bound to Tau Ceti's objects: point counts to `WeierstrassCurve.pointCount`, local images to the subgroup range μ of `W_v.M`, and saturation verdicts to divisibility in W(ℚ).

### 3.1 Integral q-expansion lattice (`integralModularLattice`)

**Definition.** For integer weight k, integralModularLattice k is the ℤ-submodule of ModularForm SL₂(ℤ) k consisting of forms whose width-one q-expansion coefficients all belong to the image of ℤ in ℂ. This is a coefficient lattice inside the space of forms. It is distinct from the upstream integral modular-symbol module, which lives on the homological side.

- `mem_integralModularLattice`: Membership is integrality of every q coefficient.
- `integralModularLattice_zero k`: The zero form is integral.
- `integralModularLattice_ext k (f g : integralModularLattice k)`: Elements agree if their underlying modular forms agree.

*Construction.* Use the existing modular-form carrier and q-expansion. Close the integral coefficient condition under addition and integer scalar multiplication. ([Stein](#source-stein), Lemma 2.20 and Remark 2.21, pp.20–21.) *Needs:* Mathlib `ModularForm.dimension_level_one`; Mathlib `ModularForm.sturm_bound_levelOne_nat`.

**Checks.**

- *Degenerate case.* Zero is in the weight-zero lattice.
- *Agreement with the library notion.* Mathlib’s unit-constant E₄ is integral.
- *Non-example.* One half of E₄ is not integral because its constant term is 1/2.

The boundary theorem `eisenstein_four_integral` states this Check on the native carriers.

The boundary comparisons are `half_eisenstein_four_not_integral`.

### 3.2 Integral cusp-form lattice (`integralCuspLattice`)

**Definition.** integralCuspLattice k is the ℤ-submodule of CuspForm SL₂(ℤ) k consisting of forms with every width-one q coefficient in ℤ⊆ℂ. Its inclusion in the modular-form coefficient lattice is the native cusp-to-modular inclusion. It contains no Eisenstein summand.

- `mem_integralCuspLattice`: Membership is integrality of all coefficients.
- `integralCuspLattice_coeff_zero k (f : integralCuspLattice k)`: Its constant coefficient is zero by native cuspidality.
- `integralCuspLattice_ext k (f g : integralCuspLattice k)`: Equality is equality of underlying cusp forms.

*Construction.* Restrict the integral q-coefficient condition to the native cusp-form carrier. ([Stein](#source-stein), Lemma 2.20, pp.20–21.) *Needs:* `integralModularLattice` (3.1).

**Checks.**

- *Computed value.* The normalized discriminant is in the weight-12 lattice.
- *Degenerate case.* The weight-zero cusp lattice is zero.
- *Non-example.* One half of Δ fails integrality at the first coefficient.

The boundary theorem `half_discriminant_not_integral` states this Check on the native carriers.

The boundary comparisons are `discriminant_integral`, `integralCuspLattice_weight_zero`.

### 3.3 Integral Miller basis (`millerBasis`)

**Construction.** For even k∈ℕ and d=dimℂ S_k(SL₂(ℤ)), millerBasis k is a ℤ-basis f₁,…,f_d of integralCuspLattice k satisfying a_j(f_i)=δ_ij for 1≤i,j≤d. Use unit-constant F₄=1+240Σσ₃(n)qⁿ and F₆=1−504Σσ₅(n)qⁿ. They agree with Mathlib E₄,E₆; Stein’s unnormalized symbols require his scaling factors.

- `exists_millerBasis`: Such a normalized integer basis exists at every even nonnegative weight.
- `millerBasis_coeff`: The first d positive coefficients form the identity matrix.
- `millerBasis_repr`: The i-th integral coordinate is the (i+1)-st q coefficient.
- `millerBasis_unique`: A basis with the same first-d coefficient normalization is this basis.

*Method.* Choose a,b≥0 with 4a+6b≤14 and congruent to k modulo 12, choosing a=b=0 when k≡0. The forms Δ^j F₆^(2(d−j)+b) F₄^a have leading coefficient 1 at q^j. Integral triangular elimination gives the Kronecker first-d coefficients. The native dimension bound shows these span over ℂ; the leading coefficients then force integral coordinates for each integral cusp form. ([Stein](#source-stein), Algorithm 2.18 and Lemma 2.20, pp.19–21.) *Needs:* `integralCuspLattice` (3.2); Mathlib `ModularForm.dimension_level_one`; Mathlib `ModularForm.sturm_bound_levelOne_nat`.

**Checks.**

- *Degenerate case.* At weight zero the basis index type is empty.
- *Computed value.* At weight 12 the sole basis form is Δ.
- *Non-example.* Weight two has no cusp basis vector.

### 3.4 Level-one congruence Sturm bound (`levelOne_congruence_sturm`)

**Theorem.** Let k∈ℕ and f belong to integralModularLattice k. For a prime p, if every coefficient a_n(f) for 0≤n≤floor(k/12) is divisible by p, then every coefficient is divisible by p. This is a congruence statement in the integral lattice, not the characteristic-zero identity theorem.

*Proof sketch.* Use the integral triangular basis at level one to propagate divisibility from the initial coefficients to all integral coordinates. Stein’s alternative proof uses the integral polynomial-in-j expansion and multiplication by Δ. The full modular integral basis must be constructed separately from the complex Sturm theorem. ([Stein](#source-stein), Theorem 9.18, pp.171–172, level-one case.) *Needs:* `integralModularLattice` (3.1); Mathlib `ModularForm.sturm_bound_levelOne_nat`; `millerBasis` (3.3); AlgebraicModularFormsAndSerreWeights R15.2.

### 3.5 Exact equality of certified modular data (`modularDataEqual`)

**Construction.** modularDataEqual B a b is the proposition that two arrays agree of isolated algebraic coefficients indexed by 0,…,B. For two same-weight modular forms on a finite-index subgroup Γ of SL₂(ℤ), set B=(k·[SL₂(ℤ):Γ]).toNat/12 and require that the decoded arrays equal the forms’ coefficients at their actual strict cusp width. Acceptance then proves equality by the native Sturm bound. The two coefficient binding proofs are hypotheses: a database label alone provides neither of them.

- `modularDataEqual_iff`: Acceptance is coefficientwise equality of native algebraic values.
- `modularDataEqual_sound`: Correctly bound finite-index modular forms coincide on acceptance.
- `modularDataEqual_symm`: Swapping the arrays preserves the verdict.

*Method.* Apply the exact algebraic-value comparison at each index. Use the two coefficient binding proofs and the native Sturm theorem, including coefficient zero. Modular symbols, integral Hecke algebras, orbit labels and trace formulas stay with TauCetiRoadmap ModularForms Layers 8, 9 and 11; this comparison uses only q-expansions and the Sturm bound. ([Stein](#source-stein), Theorem 9.18, pp.171–172; §9.4.) *Needs:* `algebraicEqual` (0.13); Tau Ceti `TauCeti.ModularForm.eq_of_sturm_bound`; TauCetiRoadmap ModularForms Layer 10.

**Checks.**

- *Degenerate case.* Bound zero still checks the constant coefficient.
- *Computed value.* Identical arrays pass.
- *Non-example.* Matching constant terms do not suffice at weight twelve: the first Δ coefficient differs from zero.

### 3.6 Level-one Hecke recurrence contract (`HasLevelOnePrimeRecurrence`)

**Definition.** For arbitrary natural k and p, HasLevelOnePrimeRecurrence k p T records the coefficient formula a_m(Tf)=a_pm(f)+p^(k−1)a_(m/p)(f) when p∣m, with second term zero otherwise, for every level-one cusp form f. T is a supplied complex linear endomorphism on the native space. For k≥2 and prime p the canonical operator comes from the upstream Hecke action and its pinned coefficient theorem; this predicate specifies the coefficient comparison.

- `heckeRecurrence_coeff_one`: The first coefficient of T_p f is a_p(f) for p>1.
- `heckeRecurrence_unique`: At fixed k,p the recurrence determines the endomorphism uniquely.
- `heckeRecurrence_preserves_integrality`: The endomorphism preserves the integral cusp lattice.

*Construction.* State the native recurrence on the level-one cusp space after identifying Γ₁(1) with SL₂(ℤ). Keep p and k explicit. ([Stein](#source-stein), Proposition 2.31, p.24; Lemma 2.20, pp.20–21.) *Needs:* Tau Ceti `HeckeRing.GL2.qExpansion_coeff_heckeSlashGamma1CuspFormEnd_diagCosetGamma1_of_mem_cuspFormCharSpace`; `integralCuspLattice` (3.2).

**Checks.**

- *Degenerate case.* The zero-dimensional weight-two space has the zero endomorphism satisfying the recurrence.
- *Computed value.* At weight 12 and p=2, T₂ acts by −24.
- *Non-example.* The zero endomorphism does not represent T₂ at weight 12.

The boundary theorem `heckeRecurrence_discriminant_two` states this Check on the native carriers.

The boundary comparisons are `heckeRecurrence_zero_controls`.

### 3.7 Integral Hecke matrix in the Miller basis (`integralHeckeMatrix`)

**Construction.** For even k≥2, prime p and an endomorphism T satisfying the level-one recurrence, integralHeckeMatrix k p T is its integer matrix in the Miller basis, using column vectors. Entry (i,j) is a_(i+1)(T f_j), uniquely read as an integer; the recurrence computes it from coefficients of f_j through degree p·d. It represents an operator on the forms lattice, distinct from the dual modular-symbol matrix.

- `integralHeckeMatrix_entry`: Column j consists of the integral coefficients a_(i+1)(T f_j).
- `integralHeckeMatrix_repr`: The matrix acts on the native integer coordinate column of every lattice form.
- `integralHeckeMatrix_unique`: The coefficient comparison uniquely determines the integer matrix.

*Method.* The recurrence preserves the integral cusp lattice. Restrict T to a ℤ-linear map and apply the native matrix-of-linear-map construction to the Miller basis. Its first-d coefficient property gives the entry formula. ([Stein](#source-stein), Proposition 2.31, p.24; Lemma 2.20, pp.20–21.) *Needs:* `HasLevelOnePrimeRecurrence` (3.6); `millerBasis` (3.3).

**Checks.**

- *Degenerate case.* The weight-two matrix has dimension zero and determinant one.
- *Computed value.* The weight-12 T₂ determinant is −24.
- *Non-example.* At p=2, weight 12 is nonordinary: −24 reduces to zero.

### 3.8 The coefficient at 107 of ΔE₄²E₆ (`weight26_coeff_107`)

**Theorem.** With the unit-constant Mathlib E₄,E₆ and normalized discriminant Δ, the coefficient at q^107 of ΔE₄²E₆ equals 35830422465487817813321292. This exact integer is −1 modulo 107. The coefficient theorem certifies ordinarity once the existing eigenform and reduction interfaces are supplied.

*Proof sketch.* Use the exact integral coefficient formulas and truncate products beyond degree 107. Multiply over ℤ, then compare the resulting coefficient through the native q-expansion multiplication map. The finite convolution certificate is checked independently of any CAS label. ([BCG](#source-bcg), §2.3, proof of Theorem 2.4, p.515.) *Needs:* `integralModularLattice` (3.1); `integralCuspLattice` (3.2).

### 3.9 Ordinary reduction at 107 (`weight26_ordinary_107`)

**Theorem.** The certified coefficient 35830422465487817813321292 reduces to −1 in ZMod 107, hence is nonzero.

*Proof sketch.* Reduce the exact numeral modulo 107. This arithmetic check uses the certified coefficient theorem for its interpretation as a Hecke eigenvalue. ([BCG](#source-bcg), §2.3, p.515.) *Needs:* `weight26_coeff_107` (3.8).

### 3.10 Nonordinary determinant at weight 38 and prime 79 (`weight38_nonordinary_det`)

**Theorem.** The determinant of the level-one T₇₉ matrix on the integral weight-38 cusp lattice is divisible by 79. Together with the Deligne–Serre lifting lemma, this yields a characteristic-zero eigenform with a₇₉ in a prime above 79. Also gcd(37,80)=1. The determinant statement alone is kept separate from that eigenform-lifting input.

*Proof sketch.* Construct the dimension-two Miller basis, compute the recurrence through degree 158, and reduce its exact integer determinant modulo 79. A singular reduction gives a residual eigensystem, which lifts to a characteristic-zero eigenform by the Deligne–Serre lifting lemma of AlgebraicModularFormsAndSerreWeights R15.5. ([BCG](#source-bcg), Corollary 3.2 proof, p.518.) *Needs:* `integralHeckeMatrix` (3.7); AlgebraicModularFormsAndSerreWeights R15.5 (Deligne–Serre lifting of eigenvalues).

### 3.11 Certified nonordinary weight-prime pair (`NonordinaryLevelOnePair`)

**Definition.** NonordinaryLevelOnePair k p means p is prime, k≥2 is even, and the determinant of an integral matrix for the intrinsic level-one T_p action on S_k vanishes modulo p. The matrix must satisfy the complete coefficient recurrence, which determines the operator uniquely. To export existence of a characteristic-zero eigenform with nonordinary reduction, use the Deligne–Serre lifting lemma of AlgebraicModularFormsAndSerreWeights R15.5.

- `nonordinary_pair_prime`: A certified pair has prime residue characteristic.
- `nonordinary_pair_even`: A certified pair has even positive weight.
- `nonordinary_pair_nonzero_dimension`: The cusp space of a certified pair has positive dimension.

*Construction.* Use the matrix construction and reduce its integer determinant into ZMod p. The empty matrix has determinant one, so zero-dimensional spaces never pass. ([BCG](#source-bcg), Corollary 3.2 and Remark 3.3, p.518.) *Needs:* `integralHeckeMatrix` (3.7); `HasLevelOnePrimeRecurrence` (3.6); AlgebraicModularFormsAndSerreWeights R15.5 (Deligne–Serre lifting of eigenvalues).

**Checks.**

- *Computed value.* The pair (38,79) passes.
- *Degenerate case.* No weight-two pair passes.
- *Non-example.* The weight-26 form is ordinary at 107.

### 3.12 The first two nonordinary level-one primes (`small_nonordinary_primes`)

**Theorem.** Among primes p≤79, a level-one nonordinary eigenform of even weight 2≤k<p exists exactly for p=59 or p=79. The determinant witnesses occur at weights 16 and 46 for 59, and 38 and 44 for 79. The weight-16 witness at 59 fails gcd(k−1,p+1)=1, whereas weight 38 at 79 passes it.

*Proof sketch.* Enumerate every prime p≤79 and every even weight below p. For each, reconstruct the Miller basis and T_p matrix by exact q-expansion arithmetic, then check the determinant. The Sturm/basis comparison proves these are the intrinsic operators; dimension-zero cases contribute determinant one. ([BCG](#source-bcg), Remark 3.3, p.518, for the filtered primes; [CG13](#source-cg13), Appendix, Table of results, p.14, N-marked entries and the companion-weight relation.) *Needs:* `NonordinaryLevelOnePair` (3.11); `integralHeckeMatrix` (3.7).

### 3.13 Nonordinary pairs below 200 (`nonordinary_pairs_lt_200`)

**Theorem.** For prime p<200 and even 2≤k<p, the nonordinary pairs (p,k) are exactly (59,16),(59,46),(79,38),(79,44),(107,28),(107,82),(131,40),(131,94),(139,36),(139,106),(151,60),(151,94),(173,24),(173,152),(193,72),(193,124). Filtering by gcd(k−1,p+1)=1 gives the primes 79,151,173,193 used in the nonordinary part of BCG Remark 3.3.

*Proof sketch.* Run the same exact finite matrix checks on the larger range and retain every result. Then perform the integer gcd filter. ([BCG](#source-bcg), Remark 3.3, p.518, for the filtered primes; [CG13](#source-cg13), Appendix, Table of results, p.14, N-marked entries and the companion-weight relation.) *Needs:* `NonordinaryLevelOnePair` (3.11); `integralHeckeMatrix` (3.7).

### 3.14 Complete companion eigensystem at weight 82 (`weight82_companion_system`)

**Theorem.** Let a_n be the exact integer coefficients of f=ΔE₄²E₆. The level-one integral Hecke matrices at weight 82 admit a common nonzero eigenvector over an algebraic closure of 𝔽₁₀₇, with eigenvalue ℓ⁸¹a_ℓ for every prime ℓ≠107. Equivalently a_ℓ(f)=ℓ²⁵a_ℓ(g) modulo 107. This coefficient convention matches BCG’s cohomological Galois normalization ρ̄_f≅ε̄⁻²⁵ρ̄_g, whose determinant is ε̄^(1−k). A common root of two separate characteristic polynomials is insufficient.

*Proof sketch.* Construct a common residual eigensystem, apply the mod-p theta/Hasse weight comparison, and prove the full congruence with a congruence Sturm bound. The theta operator, its eigenvalue shift a_ℓ ↦ ℓ·a_ℓ and the Hasse invariant are AlgebraicModularFormsAndSerreWeights R15.3's; the lift of a residual eigensystem is R15.5's; the cohomological normalization is the one fixed in this statement. These proof inputs are not inferred from two Hecke eigenvalues. ([BCG](#source-bcg), Theorem 2.4 proof, p.515.) *Needs:* `integralHeckeMatrix` (3.7); `levelOne_congruence_sturm` (3.4); `weight26_coeff_107` (3.8); AlgebraicModularFormsAndSerreWeights R15.3; AlgebraicModularFormsAndSerreWeights R15.5 (Deligne–Serre lifting of eigenvalues).

### 3.15 Ordinary level-one companion pair (`OrdinaryCompanionPair`)

**Definition.** For a prime p, OrdinaryCompanionPair p k means 2≤k<p, both k and k′=p+1−k are even, and the integral level-one Hecke operators in these weights have common residual eigensystems over an algebraic closure of 𝔽_p. The first eigensystem has eigenvalues a_ℓ and a_p≠0. For every prime ℓ≠p the companion eigenvalue is ℓ^(p−k)a_ℓ, equivalently a_ℓ=ℓ^(k−1)b_ℓ. Each eigensystem is represented by one nonzero vector simultaneously for all prime Hecke matrices, not a collection of independently chosen eigenvalues.

- `ordinaryCompanionPair_weight`: The weight is even and strictly between 1 and p.
- `ordinaryCompanionPair_dimension`: The first cusp space has positive dimension. Ordinarity belongs to the selected eigensystem; other eigensystems in the same space may be nonordinary.
- `ordinaryCompanionPair_companion_dimension`: The companion cusp space is also nonzero.

*Construction.* Use the integer Hecke matrices and coefficientwise reduction into the algebraic closure. Record both operator families, their intrinsic recurrence comparisons, two nonzero simultaneous eigenvectors and their eigenvalue function. Characteristic-zero lifting is the Deligne–Serre lemma of AlgebraicModularFormsAndSerreWeights R15.5. ([BCG](#source-bcg), Theorem 2.1 and §2.3, pp.513–515; Remark 3.3, p.518.) *Needs:* `integralHeckeMatrix` (3.7); `HasLevelOnePrimeRecurrence` (3.6); `weight82_companion_system` (3.14); AlgebraicModularFormsAndSerreWeights R15.5 (Deligne–Serre lifting of eigenvalues).

**Checks.**

- *Computed value.* Weight 26 at 107 has companion weight 82.
- *Degenerate case.* There is no eligible weight for p=2.
- *Non-example.* Weight two has no cusp eigensystem.

### 3.16 Corrected ordinary companion witnesses (`corrected_ordinary_companion_list`)

**Theorem.** For (p,k)=(107,26),(139,20),(173,68),(179,30),(191,30),(193,48), an OrdinaryCompanionPair p k exists and gcd(k−1,p−1)=1. The candidate at p=151 has weights 52 and 100, and gcd(51,150)=gcd(99,150)=3, so those companion forms do not satisfy BCG Theorem 2.1. No exhaustive statement about all primes is made.

*Proof sketch.* Produce a complete simultaneous eigensystem certificate for each pair, lift it with the Deligne–Serre lemma of AlgebraicModularFormsAndSerreWeights R15.5, and check the integer gcd. T₂/T₃ checks are discovery evidence; the target requires full congruence certificates. ([BCG](#source-bcg), Remark 3.3, p.518; [CG13](#source-cg13), §§6–7, pp.11–12 and Appendix, Table of results, p.14, C-marked entries.) *Needs:* `OrdinaryCompanionPair` (3.15); `levelOne_congruence_sturm` (3.4); AlgebraicModularFormsAndSerreWeights R15.5 (Deligne–Serre lifting of eigenvalues).

### 3.17 Point counts over a finite field as a character sum (`pointCount_eq_charSum`)

**Theorem.** Let F be a finite field of odd characteristic with q elements and W a Weierstrass curve over F with a₁ = a₃ = 0, singular or not, with cubic f(x) = x³ + a₂x² + a₄x + a₆. Then Tau Ceti's projective count satisfies W.pointCount = q + 1 + Σ_(x∈F) χ(f(x)), where χ = quadraticChar F, and so W.frobeniusTrace = −Σ_(x∈F) χ(f(x)). Over a finite field with decidable equality, W.pointCount is also the cardinality of the finite set of affine solutions plus one, which is how a finite enumeration computes it.

- `pointCount_eq_card_filter`: W.pointCount equals the cardinality of the filtered finite set of affine solutions plus one.
- `frobeniusTrace_eq_neg_charSum`: The Frobenius trace is minus the character sum.

*Proof sketch.* For each x ∈ F the equation y² = f(x) has 1 + χ(f(x)) solutions y, because χ is 1 on nonzero squares, −1 on nonsquares and 0 at 0. Sum over x and add the point at infinity. The comparison with Mathlib's point type on an elliptic model is Tau Ceti's pointCount_eq_card_point. ([Sutherland](#source-sutherland), §7.2, equation (1), p.2.) *Needs:* Tau Ceti `WeierstrassCurve.pointCount`; Tau Ceti `WeierstrassCurve.frobeniusTrace`; Tau Ceti `WeierstrassCurve.pointCount_eq_card_point`; Mathlib `quadraticChar`.

**Checks.**

- *Computed value.* y² = x³+x over ZMod 3 has 4 points: x = 0 gives one point, x = 1 none (f(1) = 2 is a nonsquare), x = 2 two (f(2) = 1).
- *Computed value.* y² = x³+x+1 over ZMod 5 has 9 points, so its Frobenius trace is −3.
- *Degenerate case.* The cusp y² = x³ over ZMod 5 has q+1 = 6 points, its singular point included, and trace 0.
- *Non-example.* Over ZMod 2, y² = x³+1 has 3 points, while q + 1 + Σ χ(f(x)) with Mathlib's quadraticChar of ZMod 2 gives 4: the odd-characteristic hypothesis cannot be dropped.

The boundary theorem `pointCount_five_cubic` states this Check on the native carriers.

The boundary comparisons are `pointCount_small_character_controls`.

### 3.18 Certified local image of the 2-descent map (`LocalImageCertificate`)

**Construction.** Let W be an elliptic Weierstrass curve over ℚ with a₁ = a₃ = 0 and integral a₂, a₄, a₆, with cubic f, and let v be a prime p or the real place, K_v = ℚ_p or ℝ. Write W_v for its base change, A_v = K_v[X]/(f), M_v = A_v^×/A_v^(×2) (Tau Ceti `W_v.M`) and μ_v : W_v(K_v) → M_v the x − T map (Tau Ceti `μ`). A LocalImageCertificate W v consists of: (i) finitely many rationals x₁, …, x_k with f(x_i) a nonzero square in K_v, checked exactly (at ℝ: f(x_i) > 0; at p: the p-adic valuation of f(x_i) is even and its unit part passes the square test of `isSquare_iff_isSquare_mod` (2.22)); (ii) the number r_v of roots of f in K_v, certified at ℝ by the sign of the discriminant (three real roots when it is positive, one when it is negative) and at p by `card_padicRoots_eq` (2.23); (iii) the subgroup H_v of M_v generated by the classes of x_i − T. Its target size is N_v = (1 + r_v)·|2|_v^(−1) at a prime and N_v = (1 + r_v)/2 at ℝ, and the certificate is complete when #H_v = N_v. The order of H_v is computed by deciding which products of the generators are squares in each field factor of A_v.

- `localImageSpan`: The subgroup H_v ≤ W_v.M generated by the classes `W_v.μX x_i` of the x_i − T.
- `localImageSpan_le_range`: H_v ≤ range μ_v whenever every f(x_i) is a nonzero square in K_v.
- `LocalImageCertificate.targetSize`: N_v = (1 + r_v)·|2|_v^(−1), or (1 + r_v)/2 at ℝ.
- `LocalImageCertificate.IsComplete`: The predicate #H_v = N_v.
- `LocalImageCertificate.card_span`: #H_v = 2^(rank over 𝔽₂ of the classes of the x_i − T).

*Method.* Each x_i is the abscissa of a point P_i ∈ W_v(K_v), and μ_v(P_i) is the class of x_i − T because f(x_i) ≠ 0 (Tau Ceti μX_of_eval_f_ne_zero), so the y-coordinate is never needed. A_v is the product of the fields K_v[X]/(f_j) for the irreducible factors f_j of f over K_v, and a class is trivial exactly when each component is a square, which the square test decides. The discriminant criterion over ℝ is the statement that E(ℝ) has one or two components according to its sign. ([FPS](#source-fps), §7, Lemma 4 and its proof, p.17; [Cremona](#source-cremona), §3.6, printed p.93, the two discriminant signs.) *Needs:* `isSquare_iff_isSquare_mod` (2.22); `card_padicRoots_eq` (2.23); Tau Ceti `WeierstrassCurve.Affine.μ`; Tau Ceti `WeierstrassCurve.Affine.M`; Tau Ceti `WeierstrassCurve.Affine.μX_of_eval_f_ne_zero`.

**Checks.**

- *Computed value.* For y² = x³ − x at ℝ, the discriminant 4 is positive, r_∞ = 3 and N_∞ = 2; the abscissae −1/2 and 2 give the two classes (+,−,−) and (+,+,+) of signs of x − e_i, so #H_∞ = 2 and the certificate is complete.
- *Degenerate case.* With no abscissae H_v is trivial; this is complete exactly when N_v = 1, for example at ℝ for y² = x³ + 1, whose discriminant is negative.
- *Non-example.* For y² = x³ − x at p = 2, N_2 = (1+3)·2 = 8, while the single abscissa 1/4 (f(1/4) = −15/64, unit part −15 ≡ 1 mod 8) gives #H_2 ≤ 2; the certificate is not complete.

### 3.19 The size check completes a local image (`LocalImageCertificate.eq_range_of_isComplete`)

**Theorem.** For every LocalImageCertificate C of W at v, H_v ≤ range μ_v. If C is complete then H_v = range μ_v (stated in Suggested.lean as `localImageSpan_eq_range_of_card_padic` and `localImageSpan_eq_range_of_card_real`), and Tau Ceti's local condition W.localCondition K_v is the preimage of H_v under W.localRes K_v. If #H_v < N_v then H_v ≠ range μ_v, so the size check is both sufficient and necessary.

*Proof sketch.* Every generator is μ_v of an actual point. The kernel of μ_v is 2W_v(K_v) (Tau Ceti ker_μ_eq), so #range μ_v = [W_v(K_v) : 2W_v(K_v)]. This index is #W_v(K_v)[2]·|2|_v^(−1) at a prime and #W_v(ℝ)[2]/2 at ℝ, and #W_v(K_v)[2] = 1 + r_v (Tau Ceti card_ker_nsmul_two); so #range μ_v = N_v. A subgroup of a finite group with the same order is the whole group, and mem_localCondition_iff identifies the local condition. ([Mattuck](#source-mattuck), Theorem 7, p.114, for the local subgroup used in the index calculation; [FPS](#source-fps), §7, proofs of Lemmas 3 and 4, pp.16–17, for the dimension-two application of that calculation.) *Needs:* `LocalImageCertificate` (3.18); HeightsRationalPointsAndObstructions §1.17 (local indices of multiplication by two); Tau Ceti `WeierstrassCurve.Affine.ker_μ_eq`; Tau Ceti `WeierstrassCurve.Affine.card_ker_nsmul_two`; Tau Ceti `WeierstrassCurve.Affine.mem_localCondition_iff`.

### 3.20 Complete local images exist (`exists_complete_localImageCertificate W v`)

**Theorem.** For every W as above and every place v there is a complete LocalImageCertificate.

*Proof sketch.* Every coset of 2W_v(K_v) is open and infinite: multiplication by two maps a sufficiently small local Lie subgroup onto an open subgroup. Thus each coset has a point away from the finite 2-torsion subgroup and the point at infinity. The map P ↦ μ_v(P) is locally constant there, and the abscissa determines the class. The set of x ∈ K_v with f(x) a nonzero square is open, and ℚ is dense in K_v, so every class in the finite group range μ_v is the class of x − T for some rational x. Finitely many such x generate range μ_v, which gives the required finite presentation. ([Mattuck](#source-mattuck), Theorem 7, p.114, for the nonarchimedean local subgroup; [FPS](#source-fps), §7, Lemma 4, p.17, as a concrete local-generator example. The general argument uses openness of nonzero square classes, local constancy of μ, and density of ℚ in ℝ and ℚ_p.) *Needs:* `LocalImageCertificate.eq_range_of_isComplete` (3.19); Tau Ceti `WeierstrassCurve.Affine.μ`; `TauCeti.isOpen_range_powMonoidHom` in `TauCeti.NumberTheory.LocalField.PowerSubgroup.Open`; density of rational casts in ℝ and ℚ_p.

### 3.21 Local images at good odd primes (`localImage_of_good_odd`)

**Theorem.** Let p be an odd prime and W an elliptic Weierstrass curve over ℚ_p with a₁ = a₃ = 0, integral coefficients and no bad primes over ℤ_p (Tau Ceti `badPrimes`). Then range μ equals the intersection of Tau Ceti's unramified subgroup W.selmerGroupA ℤ_p with the kernel of the norm map W.normM. In particular, for a curve over ℚ and a set S containing 2 and the bad primes, the local conditions at primes outside S impose nothing beyond being unramified with square norm, so a 2-Selmer computation needs local images only at S and ℝ.

*Proof sketch.* The inclusion is Tau Ceti's range_μ_le_selmerGroupA together with range_μ_le_ker_normM. For the count, f has distinct roots modulo p, so every field factor of A is unramified over ℚ_p and contributes two unit square classes. The unramified norm-on-units contract of LocalFieldsRamification Layer 2 makes the norm on unit square classes onto ℤ_p^×/ℤ_p^(×2). Thus its kernel has order 2^((number of factors) − 1) = 1 + r_p: the cubic splitting types are (3), (1,2) and (1,1,1), with kernel orders 1, 2 and 4. The index formula at odd p gives #range μ = 1 + r_p, so the inclusion is an equality. This count is the argument for the equality; Cremona supplies the local-solubility context, rather than this norm-kernel theorem. ([Cremona](#source-cremona), §3.6, Checking local solubility, p.80; [FPS](#source-fps), §7, proof of Lemma 3, pp.16–17, for the local index argument in dimension two.) *Needs:* `LocalImageCertificate.eq_range_of_isComplete` (3.19); HeightsRationalPointsAndObstructions §1.17 (local indices of multiplication by two); TauCetiRoadmap LocalFieldsRamification Layer 2; Tau Ceti `WeierstrassCurve.Affine.selmerGroupA`; Tau Ceti `WeierstrassCurve.Affine.normM`.

### 3.22 p-saturated subgroups (`IsPSaturated`)

**Definition.** Let A be an additive commutative group, G ≤ A a subgroup and p a natural number. G is p-saturated in A when every a ∈ A with p·a ∈ G lies in G. Equivalently A[p] ≤ G and G ∩ pA = pG. When [A : G] is finite and p is prime, G is p-saturated exactly when p does not divide [A : G], and G = A exactly when it is p-saturated for every prime p dividing the index.

- `isPSaturated_iff G p`: IsPSaturated G p ↔ A[p] ≤ G ∧ G ⊓ p•⊤ = p•G.
- `isPSaturated_iff_not_dvd_index`: For finite index and prime p: IsPSaturated G p ↔ ¬ p ∣ G.index.
- `isPSaturated_top (A : Type*) (p : Nat)`: The whole group is p-saturated.
- `eq_top_of_forall_isPSaturated`: A finite-index subgroup that is p-saturated for every prime p ≤ [A : G] is the whole group.

*Construction.* If G is p-saturated then A[p] ≤ G, and pa ∈ G forces a ∈ G. Conversely, if pa = pg with g ∈ G then a − g ∈ A[p] ≤ G. For finite index, Cauchy's theorem in A/G gives a ∉ G with pa ∈ G when p divides the index; when it does not, the class of such an a has order dividing both p and the index, so it is trivial. ([Siksek](#source-siksek), §4, p.17, equation (39).) *Needs:* Mathlib `AddSubgroup.index`.

**Checks.**

- *Computed value.* In ℤ, 6ℤ is 5-saturated and is neither 2- nor 3-saturated.
- *Degenerate case.* ⊤ ≤ A is p-saturated for every p.
- *Non-example.* In ℤ × ℤ/2, G = ℤ × 0 satisfies G ∩ 2A = 2G but is not 2-saturated, because A[2] is not contained in G.

The boundary theorem `isPSaturated_six_integers` states this Check on the native carriers.

### 3.23 p-saturation reduces to finitely many divisibility tests (`isPSaturated_iff_forall_not_dvd`)

**Theorem.** Let A be an additive commutative group, p a prime and G ≤ A generated by g₁, …, g_m. The set V_p of b̄ ∈ 𝔽_p^m with Σ b_i g_i ∈ pA is a well-defined 𝔽_p-subspace, because p·g_i ∈ pA. Then V_p = 0 and A[p] ≤ G hold together exactly when G is p-saturated and the classes of g₁, …, g_m are linearly independent in G/pG. V_p = 0 is decided by testing Σ b_i g_i ∈ pA for one representative of each line of 𝔽_p^m: use |b_i| ≤ (p−1)/2 for odd p and b_i ∈ {0,1} for p = 2. In particular the nonzero class modulo 2 must be tested.

*Proof sketch.* Suppose V_p = 0 and A[p] ≤ G. If pa ∈ G, write pa = Σ c_i g_i; then c̄ ∈ V_p, so c = p·c′, and a − Σ c′_i g_i lies in A[p] ≤ G, hence a ∈ G. Independence in G/pG holds because pG ⊆ pA. Conversely, saturation gives A[p] ≤ G and G ∩ pA = pG, so an element of V_p has Σ b_i g_i ∈ pG and b̄ = 0 by independence. Lines suffice because V_p is a subspace. ([Siksek](#source-siksek), §4, equation (39), and §4.1, p.17; §4.2, projective representatives and the p = 2 exception, p.18.) *Needs:* `IsPSaturated` (3.22).

The variant `isPSaturated_iff_forall_not_dvd_of_span_quotient` assumes only g_i ∈ G and that their classes generate G/pG: every x ∈ G can be written Σ c_i g_i + py with y ∈ G. It has the same equivalence between V_p = 0 together with A[p] ≤ G, and p-saturation together with independence in G/pG. In the forward proof write pa = Σ c_i g_i + py, then apply the preceding argument to a − y. This is the version used when prime-to-p torsion is omitted from the generator list.

**Checks.** At p = 2, A = ℤ and g₁ = 2, the coefficient 1 witnesses failure; rounding the odd-prime bound down to zero would miss it. At A = ℤ/3, p = 2 and G = A, the empty list generates G/2G = 0 and the quotient-generating variant certifies saturation, although the empty list does not generate G. At A = ℤ/2, p = 2 and G = 0, the empty candidate space is insufficient because A[2] is not contained in G.

### 3.24 Exact test for divisibility of a rational point by p (`mem_nsmul_iff_exists_root`)

**Theorem.** Let W be an elliptic Weierstrass curve over ℚ, p a prime and P = (x_P, y_P) a nonzero point of W(ℚ). Then P ∈ pW(ℚ) exactly when the monic polynomial Φ_p(X) − x_P·ΨSq_p(X) ∈ ℚ[X] of degree p², built from Mathlib's division polynomials, has a rational root x₀ for which one of the at most two points Q = (x₀, y₀) ∈ W(ℚ) above x₀ satisfies pQ = P. The degree-one factors of a rational factor presentation give exactly the rational roots, a finite set. The zero point is always divisible.

*Proof sketch.* If pQ = P with Q = (x₀, y₀), Tau Ceti's mul_eval_ΨSq_eq_eval_Φ_of_zsmul gives x_P·ΨSq_p(x₀) = Φ_p(x₀). The polynomial is monic of degree p² because Φ_p is monic of degree p² and ΨSq_p has degree p² − 1, so it is nonzero and has finitely many rational roots. Conversely, a candidate Q is checked directly with the group law, and W(ℚ) has at most two points with a given abscissa. ([Siksek](#source-siksek), §4.2, equation (41), pp.18–19.) *Needs:* `exists_rationalFactorCertificate` (1.28); Tau Ceti `WeierstrassCurve.mul_eval_ΨSq_eq_eval_Φ_of_zsmul`; Mathlib `WeierstrassCurve.natDegree_Φ`; Mathlib `WeierstrassCurve.leadingCoeff_Φ`; Mathlib `WeierstrassCurve.natDegree_ΨSq`.

### 3.25 The reduction sieve for p-saturation (`saturationSieve_sound`)

**Theorem.** Let W be an elliptic Weierstrass curve over ℚ with integral coefficients, p a prime and g₁, …, g_m ∈ W(ℚ). For a prime q of good reduction let ρ_q : W(ℚ) → W̃(𝔽_q)/pW̃(𝔽_q) be reduction followed by the quotient. Each ρ_q vanishes on pW(ℚ), so V_p is contained in the kernel of the 𝔽_p-linear map 𝔽_p^m → W̃(𝔽_q)/pW̃(𝔽_q), b ↦ Σ b_i ρ_q(g_i). If the intersection of these kernels over finitely many good primes is 0, then V_p = 0. A prime q contributes only when p divides #W̃(𝔽_q).

*Proof sketch.* Reduction at a prime of good reduction is a group homomorphism W(ℚ) → W̃(𝔽_q), so it sends pW(ℚ) into pW̃(𝔽_q). Hence an element of V_p maps to zero under every ρ_q. The p-part of W̃(𝔽_q)/pW̃(𝔽_q) is trivial unless p divides the group order. ([Siksek](#source-siksek), §4.1, equation (40), pp.17–18.) *Needs:* `isPSaturated_iff_forall_not_dvd` (3.23); TauCetiRoadmap EllipticCurves Layer 4; `pointCount_eq_charSum` (3.17).

### 3.26 Finite p-saturation criterion (`pSaturationCriterion`)

Define `pSaturationCriterion W p g t` for an integral elliptic Weierstrass curve W/ℚ,
a prime p, rational points g₁,…,g_r and representatives t₁,…,t_s of a basis of
`W(ℚ)_tors/p W(ℚ)_tors`. Let G be generated by these g_i and all rational torsion.
The predicate says no nonzero coefficient class in `𝔽_p^(r+s)` represents a p-divisible
point of W(ℚ). It is a finite family of exact divisibility conditions.

- `pSaturationCriterion_iff`: This predicate holds iff G is p-saturated and the displayed
  classes of g and t are independent in G/pG.
- `pSaturationCriterion_reductions`: The reduction-kernel containment of §3.25 preserves
  every possible divisibility class.
- `index_coprime_of_pSaturationCriterion`: If G has finite index and the criterion holds,
  p does not divide that index.

The quotient-generation version of §3.23 applies because G contains every torsion point;
the division-polynomial comparison of §3.24 identifies the exact divisibility conditions
(Siksek, §4, equations (39)–(41), printed pp.17–19).
*Needs:* §§3.23–3.25; EllipticCurves Layer 6.

**Checks.**

- For `y²=x³-x`, r=0 and G is the full rational group; the criterion holds at every prime.
- If g₁=2Q with Q of infinite order, the coefficient class one violates it at p=2.
- For g=(Q,2Q), the classes are dependent at every p; the criterion fails even if G is saturated.

### Examples

- Mathlib's `E₄` is integral and `E₄/2` is not; at weight `12` the Miller basis is `{Δ}` and `T₂` acts by `−24`, so `2` is nonordinary there (`integralModularLattice` (3.1), `millerBasis` (3.3), `integralHeckeMatrix` (3.7)).
- The coefficient of `q^107` in `ΔE₄²E₆` is `35830422465487817813321292 ≡ −1 (mod 107)` (`weight26_coeff_107` (3.8)).
- At weight `38` the integral matrix of `T₇₉` in the Miller basis reduces modulo `79` to `[[3, 17], [25, 10]]`, whose determinant `30 − 425 = −395 = −5·79` vanishes modulo `79` (`weight38_nonordinary_det` (3.10)).
- `y² = x³ + x + 1` over `ZMod 5` has `9` points and Frobenius trace `−3` (`pointCount_eq_charSum` (3.17)).
- For `y² = x³ − x` at the real place the abscissae `−1/2` and `2` give a complete local image of order `2` (`LocalImageCertificate` (3.18)).
- In `ℤ`, `6ℤ` is `5`-saturated and neither `2`- nor `3`-saturated (`IsPSaturated` (3.22)).

### Dependencies

Layers CN.0–CN.2; TauCetiRoadmap LocalFieldsRamification Layer 2; TauCetiRoadmap ModularForms Layers 7–11; AlgebraicModularFormsAndSerreWeights R15.2, R15.3, R15.5; TauCetiRoadmap EllipticCurves Layers 4 and 6; HeightsRationalPointsAndObstructions §1.17; Mathlib (level-one modular forms, `quadraticChar`, division polynomials); Tau Ceti (Sturm bound, Hecke recurrence, point count, `x − T` descent, division-polynomial identity).

## Layer CN.4: Quantitative analytic bounds and finite Gram data

Every enclosure contains a specified native value. Analytic truncation error is part of
the bound. Polynomial root sets carry both distinct-root isolation and completeness.
The scalar CT formulas and their enclosures are unconditional; their automorphic
positivity interpretation is outside this roadmap. Entrywise matrix bounds are used on
nonnegative vectors; unrestricted vectors require a positive-semidefinite comparison.

*Proof obligations of the layer.* Prove the explicit remainders in §§4.17a, 4.19a and
4.20a, including their domains and decay. Pair polynomial root finiteness with rational
separation. The finite-conductor zero theorems require the mathematical character and zero
counts of Platt §§4–7, printed pp.3–15. For CT, keep the gamma shifts, the weighted
alternating-tail threshold, and the diagonal `A/m_i` with lift `t_i/m_i`. An enlarged
ellipsoid bound gives a cover; extra points are retained explicitly.

### 4.1 Rational interval multiplication (`intervalMul`)

**Construction.** For I=[a,b] and J=[c,d] with rational endpoints, intervalMul I J is [min(ac,ad,bc,bd), max(ac,ad,bc,bd)]. These are enclosing intervals in ℝ under the rational embedding. The existing monotone interval multiplication does not apply to arbitrary signed rational endpoints.

- `intervalMul_lower I J`: The lower endpoint is the minimum of the four corner products.
- `intervalMul_comm I J`: Multiplication is symmetric in its two intervals.
- `intervalMul_pure x y`: Singleton intervals multiply as rational numbers.

*Method.* Evaluate all four corner products. Their minimum is at most their maximum; package these as the endpoints of the existing NonemptyInterval ℚ carrier. ([Arb](#source-arb), §3.1.2, p.5; §4, p.6; §5, p.7.) *Needs:* Mathlib `NonemptyInterval`.

**Checks.**

- *Computed value.* [−2,3] times [−4,5] is [−12,15].
- *Degenerate case.* The singleton zero times any interval is the singleton zero.
- *Non-example.* [−1,1] times itself has lower endpoint −1, not +1.

### 4.2 Enclosure under multiplication (`intervalMul_sound`)

**Theorem.** For x,y∈ℝ, if a≤x≤b and c≤y≤d, then xy lies between the endpoints of intervalMul [a,b] [c,d], with all rational endpoints cast into ℝ.

*Proof sketch.* Split each input interval at zero. In each of the four sign cases, order compatibility of multiplication bounds xy by the corresponding corner products. ([Arb](#source-arb), §3.1.2, p.5; §4, p.6; §5, p.7.) *Needs:* `intervalMul` (4.1).

### 4.3 Partial interval reciprocal (`intervalInv`)

**Construction.** intervalInv I returns none when 0∈I and otherwise returns the interval [1/I.upper,1/I.lower]. Failure is data and carries no assertion that the mathematical reciprocal exists at zero.

- `intervalInv_involutive I J (h : intervalInv I = some J)`: Successful inversion twice recovers the input interval.
- `intervalInv_none I`: Failure is equivalent to the input interval containing zero.
- `intervalInv_endpoints I J (h : intervalInv I = some J)`: Successful output has reciprocals of the reversed input endpoints.

*Method.* Decide whether the rational endpoints straddle zero. On either remaining sign component, inversion reverses order. ([Arb](#source-arb), §3.1, pp.4–6; §5, pp.7–8.) *Needs:* Mathlib `NonemptyInterval`.

**Checks.**

- *Computed value.* The reciprocal of [2,4] is [1/4,1/2].
- *Degenerate case.* The singleton zero is rejected.
- *Computed value.* The reciprocal of [−4,−2] is [−1/2,−1/4].

### 4.4 Enclosure under reciprocal (`intervalInv_sound`)

**Theorem.** If intervalInv I=some J and x∈ℝ lies in I, then x≠0 and 1/x lies in J.

*Proof sketch.* Unfold the successful branch and distinguish positive and negative intervals; apply order reversal of inversion in that sign component. ([Arb](#source-arb), §3.1, pp.4–6; §5, pp.7–8.) *Needs:* `intervalInv` (4.3).

### 4.5 Outward dyadic rounding (`dyadicHull`)

**Construction.** For precision p∈ℕ, dyadicHull p [a,b]=[floor(2^p a)/2^p,ceil(2^p b)/2^p]. Negative endpoints use floor and ceiling, not truncation toward zero. The representation remains NonemptyInterval ℚ.

- `dyadicHull_grid p I`: Both output endpoints lie on the 2^(−p) rational grid.
- `dyadicHull_contains p I`: The original interval is contained in the rounded interval.
- `dyadicHull_idempotent p I`: Rounding again at the same precision does not change the interval.

*Method.* Use the integer floor and ceiling of each scaled endpoint. Positivity of 2^p proves the endpoints are ordered. ([Arb](#source-arb), §3.1, p.4; §5, p.7.) *Needs:* Mathlib `NonemptyInterval`.

**Checks.**

- *Computed value.* At p=2 the singleton 1/3 becomes [1/4,1/2].
- *Non-example.* At p=0 the singleton −1/3 becomes [−1,0].
- *Degenerate case.* Exact zero remains exact at every precision.

### 4.6 Width added by dyadic rounding (`dyadicHull_width`)

**Theorem.** The width of dyadicHull p I is less than width(I)+2·2^(−p). The strict bound includes exact endpoints.

*Proof sketch.* Each endpoint moves outward by strictly less than 2^(−p); add the two floor/ceiling error inequalities. ([Arb](#source-arb), §3.1, p.4; §5, p.7.) *Needs:* `dyadicHull` (4.5).

### 4.7 Rational complex-box denotation (`complexBoxSet`)

**Definition.** A complex box is represented by the native pair (R,I) of closed nonempty rational intervals. complexBoxSet(R,I) is {z∈ℂ | Re(z)∈R and Im(z)∈I}. No new complex-number carrier or rounded value equality is introduced. Degenerate boxes and boxes meeting branch cuts are allowed; analytic evaluators must account for their entire image.

- `mem_complexBoxSet`: Membership is membership of both real components in their endpoint intervals.
- `complexBoxSet_nonempty R I`: Every nonempty component pair denotes a nonempty complex set.
- `complexBoxSet_mono R I R' I'`: Expanding each component interval expands the denotation.

*Construction.* Define the four real endpoint inequalities using rational casts. ([Arb](#source-arb), §5 and §5.3, pp.7–8.) *Needs:* Mathlib `NonemptyInterval`.

**Checks.**

- *Degenerate case.* The pair of singleton zero intervals contains only zero.
- *Computed value.* The box [0,0]×[1,1] contains i.
- *Non-example.* A strictly positive real lower endpoint excludes zero.

### 4.8 Unique integer extraction (`uniqueInteger`)

**Construction.** uniqueInteger I returns the integer ceil(I.lower) precisely when ceil(I.lower)=floor(I.upper); otherwise it returns none. It asserts uniqueness inside the closed interval, not that an unknown real number in it is integral.

- `uniqueInteger_mem I z (h : uniqueInteger I = some z)`: A returned integer lies in the input interval.
- `uniqueInteger_iff I z`: The output is z iff z is the unique integer in I.
- `uniqueInteger_pure (z : Int)`: A singleton integer is recovered.

*Method.* Compute the smallest and largest integers in the rational interval. Compare them exactly. ([Arb](#source-arb), §2.3, pp.3–4.) *Needs:* Mathlib `NonemptyInterval`.

**Checks.**

- *Computed value.* [3/4,5/4] contains exactly the integer 1.
- *Non-example.* [0,1] is rejected because both endpoints are integers.
- *Degenerate case.* The singleton 1/2 contains no integer and is rejected.

### 4.9 Recovery of a known integral value (`uniqueInteger_sound`)

**Theorem.** If z is an integer, its real image belongs to I, and uniqueInteger I=some w, then z=w. An enclosure around zero alone never proves that a general real or complex analytic value vanishes.

*Proof sketch.* Cast the rational endpoint inequalities and apply uniqueInteger_iff to the known integer z. ([Arb](#source-arb), §2.3, pp.3–4.) *Needs:* `uniqueInteger` (4.8).

### 4.10 Normalize a rational p-adic ball (`padicNormalize`)

**Construction.** For prime p, rational centre c and absolute precision N∈ℤ, padicNormalize p c N returns the unique canonical PadicApproximation at precision N with denotation {x | ‖x−c‖≤p^(−N)}. Its valuation field is N if c=0, and min(v_p(c),N) otherwise. For v<N the mantissa is the unique residue in [1,p^(N−v)) prime to p representing c·p^(−v) modulo p^(N−v).

- `padicNormalize_precision`: Absolute precision is retained.
- `padicNormalize_denotation`: Normalization preserves the entire rational-centred ball.
- `padicNormalize_valuation`: The zero branch avoids the native valuation-at-zero default.
- `padicNormalize_id`: Normalizing an already canonical centre and precision recovers the approximation.

*Method.* Separate the zero and high-valuation cases. Otherwise invert the denominator prime to p modulo p^(N−v) and reduce the scaled numerator. Native p-adic truncation compares this residue with the original rational centre. ([CarusoPublished](#source-carusopublished), §2.1.1, Proposition 2.1.1 and Definition 2.1.2, pp.II–17–II–18.) *Needs:* `PadicApproximation` (0.14); Mathlib `PadicInt.toZModPow`; Mathlib `padicValRat`.

**Checks.**

- *Degenerate case.* Zero at precision 5 has valuation 5 and mantissa zero.
- *Computed value.* 5 modulo 3 normalizes to mantissa 2.
- *Non-example.* 9 at absolute precision 2 is a zero-centred ball, not a unit with valuation zero.

### 4.11 Certified p-adic addition (`padicAdd`)

**Construction.** Add two canonical p-adic approximations by normalizing the sum of centres at absolute precision min(N,N′). For every independently chosen x in the first ball and y in the second, the sum lies in the output ball. This enclosure does not recover correlations between repeated occurrences of an uncertain input.

- `padicAdd_precision`: The output has the stated absolute precision.
- `padicAdd_sound`: The output contains every result from independently chosen inputs.
- `padicAdd_comm`: The canonical result is symmetric in its inputs.

*Method.* Expand the error around the exact rational centres and apply the ultrametric inequality. ([CarusoPublished](#source-carusopublished), §2.1.2, Proposition 2.1.3, equation (2.1), p.II–18.) *Needs:* `padicNormalize` (4.10); `PadicApproximation` (0.14).

**Checks.**

- *Degenerate case.* The operation on two precision-zero zero-centred balls contains zero.
- *Computed value.* At p = 3, (1 + O(3²)) + (2 + O(3³)) has centre 3 and absolute precision 2, so its canonical form is (N, v, s) = (2, 1, 1).
- *Agreement with the library notion.* At p = 3, O(3²) + (1 + O(3⁴)) is 1 + O(3²), with canonical tuple (2,0,1); using the larger input precision would lose admissible sums.

### 4.12 Certified p-adic multiplication (`padicMul`)

**Construction.** Multiply two canonical p-adic approximations by normalizing the product of centres at absolute precision min(v+N′,N+v′). For every independently chosen x in the first ball and y in the second, the product lies in the output ball. This enclosure does not recover correlations between repeated occurrences of an uncertain input.

- `padicMul_precision`: The output has the stated absolute precision.
- `padicMul_sound`: The output contains every result from independently chosen inputs.
- `padicMul_comm`: The canonical result is symmetric in its inputs.

*Method.* Expand the error around the exact rational centres and apply the ultrametric inequality. For multiplication the mixed error has valuation at least N+N′, which is no smaller than either retained bound because v≤N and v′≤N′. ([CarusoPublished](#source-carusopublished), §2.1.2, Proposition 2.1.3, equation (2.3) and its proof, pp.II–18–II–19.) *Needs:* `padicNormalize` (4.10); `PadicApproximation` (0.14).

**Checks.**

- *Degenerate case.* The operation on two precision-zero zero-centred balls contains zero.
- *Computed value.* At p = 3, O(3²)·(1 + O(3⁴)) is O(3²), with canonical tuple (2,2,0); replacing the zero centre by valuation zero would give the wrong precision.
- *Agreement with the library notion.* At p = 3, O(3²)·O(3⁴) is O(3⁶), with canonical tuple (6,6,0); taking the minimum of the input precisions would miss this gain.
- *Computed value.* At p=3, multiply 3+O(3^4) by 1/3+O(3^2): the normalized output has centre 1 and absolute precision min(1+2,4−1)=3.

### 4.13 Partial p-adic inversion (`padicInverse`)

**Construction.** padicInverse rejects a zero-mantissa approximation, because its ball contains zero. Otherwise it returns the normalized reciprocal of the rational centre at absolute precision N−2v. Every element in the input ball is nonzero and its inverse lies in this output. The input relative precision N−v is preserved.

- `padicInverse_none_iff`: Rejection is exactly the presence of zero in the input ball.
- `padicInverse_precision`: A successful output has precision N−2v.
- `padicInverse_sound`: A successful output encloses reciprocals of every input value.

*Method.* Write x=c+h with v(h)≥N>v(c). Then x has the same valuation as c and x⁻¹−c⁻¹=−h/(cx), of valuation at least N−2v. ([CarusoPublished](#source-carusopublished), §2.1.2, proof of Proposition 2.1.3, equation (2.5), p.II–19.) *Needs:* `padicNormalize` (4.10); `PadicApproximation` (0.14).

**Checks.**

- *Degenerate case.* The zero-centred ball is rejected.
- *Computed value.* Inverting a precision-four unit preserves absolute precision four.
- *Non-example.* Inverting 3+O(3⁴) loses two absolute digits, yielding precision two.

### 4.14 Odlyzko tail kernel (`ctTailKernel`)

**Definition.** ctTailKernel(x)=2π²exp(−x)/(x²+π²)² for real x. It is positive everywhere and decreases on [0,∞). This is the scalar exponentially decaying kernel in the evaluation formulas for both F_ℓ and G_ℓ; positivity of the test functions and the explicit-formula implication, which assumes GRH, are statements about automorphic forms and not targets of this roadmap.

- `ctTailKernel_pos`: The kernel is strictly positive.
- `ctTailKernel_zero : ctTailKernel 0 = 2 / Real.pi ^ 2`: At zero its value is 2/π².
- `ctTailKernel_geometric x t (hx : 0 <= x) (ht : 0 <= t)`: For x,t≥0, r(x+t)≤exp(−t)r(x).

*Construction.* Use native real exp and π. Positivity follows from π≠0. On the nonnegative half-line both the exponential factor decreases and the positive denominator increases. ([CL](#source-cl), §3.16, Proposition 3.17 and numerical comments (3), printed pp.304–307, French preprint.) *Needs:* Mathlib (integers, rationals, lists and finite functions).

**Checks.**

- *Degenerate case.* At x=0 the kernel is exactly 2/π², rather than zero or 2π².
- *Computed value.* r(1) is strictly below r(0).
- *Non-example.* The kernel is not even: r(−1)>r(1).

The boundary comparisons are `ctTailKernel_strict_controls`.

### 4.15 Geometric bound for the Odlyzko tail (`ctTailKernel_tail`)

**Theorem.** For α>0, b≥0 and N∈ℕ, the series Σr(α(b+n)) converges and its tail after indices 0,…,N−1 lies in [0,r(α(b+N))/(1−exp(−α))]. N=0 includes the entire series.

*Proof sketch.* The preceding kernel inequality gives a geometric majorant with ratio exp(−α)<1. Sum that majorant and use termwise positivity. ([CL](#source-cl), §3.16, Proposition 3.17 and numerical comments (3), printed pp.304–307, French preprint.) *Needs:* `ctTailKernel` (4.14).

### 4.16 Alternating Odlyzko tail bound (`ctTailKernel_alternating_tail`)

**Theorem.** For α>0 and b≥0, the absolute error after the first N terms of Σ(−1)^n r(α(b+n)) is at most r(α(b+N)). The weighted n·r(αn) variant used by J_F(1−ε) needs its own monotonicity threshold; α(N+1)≥1 is a sufficient rationally checkable replacement for the sharper decimal threshold in the source.

*Proof sketch.* The kernel decreases to zero, so apply the alternating-series remainder theorem. For the weighted variant, differentiate log(xr(x)); it is decreasing for x≥1. ([CL](#source-cl), §3.16, Proposition 3.17 and numerical comments (3), printed pp.304–307, French preprint.) *Needs:* `ctTailKernel` (4.14); `ctTailKernel_tail` (4.15).

### 4.17 Closed scalar formulas for CT evaluation (`ctExplicitFormula`)

For ℓ>0 and w∈ℕ, define `ctExplicitFormula l w` as eight real scalars. Put
`phi(z) = (digamma((z+1)/2)-digamma(z/2))/2`,
`z0 = 1/2+i*pi/l`, `z1 = 1+i*pi/l`, `zF = 1/2+w/4+i*pi/(2*l)` and
`zG = (1+w)/2+i*pi/l`. Let `r = ctTailKernel`,
`S(a,b) = sum(n>=0, r(a*(b+n)))`, `T(a,b) = sum(n>=0, (-1)^n*r(a*(b+n)))`, and
`W(a) = sum(n>=1, (-1)^(n+1)*n*r(a*n))`. Primes on ψ and φ mean complex derivatives.
The scalar order is the Fourier values at zero and i/(4π), then the I_w and 1−ε
functionals, first for F and then for G; this order specifies numerical expressions.

| Index | Real expression |
| --- | --- |
| 0 | `4*Re(phi(z0))-4/pi*Im(phi(z0))+4/l*Re(phi'(z0))+4*l*T(l,1/2)` |
| 1 | `8*l/pi^2` |
| 2 | `log(pi)-Re(psi(zF))+Im(psi(zF))/pi-Re(psi'(zF))/(2*l)+2*l*S(2*l,1/2+w/4)` |
| 3 | `1+2*pi/l*Im(phi(z1))+2*pi/l^2*Im(phi'(z1))+2*l*W(l)` |
| 4 | `8*l/pi^2` |
| 5 | `4*pi^2*l*(1+cosh(l/2))/(l^2/4+pi^2)^2` |
| 6 | `log(2*pi)-Re(psi(zG))+Im(psi(zG))/pi-Re(psi'(zG))/l+l*S(l,(1+w)/2)` |
| 7 | `Re(phi(z0))-Im(phi(z0))/pi+Re(phi'(z0))/l+l*T(l,1/2)` |

- `ctExplicitFormula_shared_value`: Indices 1 and 4 agree.
- `ctExplicitFormula_fourier`: Their common value is 8ℓ/π².
- `ctExplicitFormula_G_imag`: Index 5 has the displayed cosh expression.

These formulas fix the Fourier/Laplace normalization `Fhat(0)=Phi_F(1/2)` and
`Fhat(i/(4*pi))=Phi_F(0)` (CL Proposition 3.17, printed pp.304–305;
CT Proposition 4.4, printed pp.298–299). *Needs:* §§4.14–4.16;
Mathlib `Complex.digamma` and complex derivatives.

**Checks.**

- At ℓ=1, both indices 1 and 4 are exactly 8/π² and lie between 4/5 and 41/50.
- At ℓ=2, both become 16/π²; this tests the factor ℓ rather than its inverse.
- Weight zero gives `Re zF=Re zG=1/2`, while the arguments of ψ inside φ have
  real part at least 1/4; all denominators in §4.17a remain nonzero.

### 4.17a Explicit digamma and trigamma remainders

For z∈ℂ with `Re z > 0`, N≥1 and `a = min(1,Re z)`, let
`D_N(z) = -gamma + sum(n<N, 1/(n+1)-1/(n+z))` and
`T_N(z) = sum(n<N, 1/(n+z)^2)`, where γ is Euler's constant.
Prove `digamma_series_remainder` and `trigamma_series_remainder`:
`norm(psi(z)-D_N(z)) <= norm(z-1)/(N-1+a)` and
`norm(psi'(z)-T_N(z)) <= 1/(N-1+a)`.
Every n+z is nonzero since its real part is positive, and N−1+a>0.
The harmonic–logarithm bounds for Euler's constant in the supplier contracts give its
arbitrarily narrow enclosures. Both bounds tend to zero as N→∞; the bounds hold uniformly when `Re z ≥ a0>0`
and `norm(z-1) ≤ C`, with a replaced by min(1,a0). For the weighted series in
§4.16, prove `ctTailKernel_weighted_alternating_tail`: at α>0 and α(N+1)≥1,
the error in W(α) after n=1,…,N is at most `(N+1)*r(alpha*(N+1))`.

The series identities are DLMF equation 5.7.6 (DLMF line 254) and equation 5.15.1
(DLMF15 line 64). Bound each tail by a multiple of `sum(n>=N, (n+a)^(-2))`,
then by its integral from N−1 to infinity. The weighted bound follows from decrease of
`x*r(x)` for x≥1 (CL numerical comments (3), printed pp.306–307).
*Needs:* §§4.14–4.16; the named DLMF series identities; native ψ and ψ′.

**Checks.**

- At z=1 all terms of the digamma tail vanish: D_N(1)=−γ exactly for every N≥1.
- At z=1, N=1, T_N=1 and the error `pi^2/6-1` lies strictly between zero and one;
  at N=2, T_N=5/4 and the bound is 1/2.
- Re z=0 is outside this contract; z=0 would give a zero denominator in the first term.

### 4.18 Rational enclosures of CT scalars (`ctEnclosure`)

For rational ℓ>0, weight w∈ℕ, q∈Fin 8 and P∈ℕ, prove existence of a rational interval
`ctEnclosure l w q P` containing the exact scalar in §4.17 with width at most 2^(−P).
The chosen family has equal intervals at indices 1 and 4.

- `ctEnclosure_sound`: The exact scalar is contained.
- `ctEnclosure_width`: Its interval has the stated width.
- `ctEnclosure_shared`: Indices 1 and 4 use the same interval.

The finite sums and explicit remainders in §§4.15–4.17a, combined with rational bounds for
elementary functions, give arbitrarily small error before outward rounding (CL Proposition
3.17 and numerical comments (3), pp.304–307; Arb §5, pp.7–8).
*Needs:* `ctExplicitFormula` (4.17), `dyadicHull` (4.5), `ctTailKernel_tail`,
`ctTailKernel_alternating_tail`, `ctTailKernel_weighted_alternating_tail`,
`digamma_series_remainder`, `trigamma_series_remainder`.

**Checks.**

- At ℓ=1 and P=5, `[4/5,41/50]` is an admissible interval at indices 1 and 4.
- At ℓ=2 and P=4, `[8/5,41/25]` encloses their shared value 16/π².
- No singleton rational interval contains 8/π², since π² is irrational.

### 4.19 Disjoint presentations of every distinct root (`exists_disjoint_root_certificates`)

**Theorem.** For every nonzero f∈ℚ[X], there exists a list of `AlgebraicRootCertificate`s
all using f, with distinct decoded values, pairwise disjoint closed rational rectangles,
and decoded root set exactly the complex roots of f. Multiplicities are not counted.

Finiteness of the distinct root set gives pairwise disjoint rational neighborhoods;
isolation uses the root-count and separation comparisons of RealAlgebraicGeometry
Layers 1–4 (Arb §5, printed pp.7–8, for enclosure semantics).
*Needs:* §0.8; polynomial root finiteness; RealAlgebraicGeometry Layers 1–4.

**Checks.**

- A nonzero constant gives the empty list.
- `(X-1)^2` gives one root value, with multiplicity two represented separately.
- `X²+1` gives two distinct values; no single rectangle can isolate both.

### 4.19a Uniform continued Dirichlet remainder (`dirichlet_eulerMaclaurin_remainder`)

For a character χ of positive modulus q, use
`L(s,chi) = q^(-s)*sum(a=1..q, chi(a)*zeta(s,a/q))`.
For N,m≥1 and t=a/q, define the finite approximation to ζ(s,t) as
`sum(n<N, (n+t)^(-s)) + (N+t)^(1-s)/(s-1) + (N+t)^(-s)/2`
plus `sum(r=1..m, B_(2*r)/(2*r)! * rising(s,2*r-1)*(N+t)^(1-s-2*r))`.
The remainder is the even-order Euler–Maclaurin integral with periodic B_(2m),
coefficient `-rising(s,2*m)/(2*m)!` and integrand `(x+t)^(-s-2*m)` on [N,∞).

For Re s≥σ₀, ‖s‖≤B and σ₀+2m>1, prove the uniform L-remainder bound
`q^(1-sigma0)*C_m*prod(j<2*m, B+j)/(2*m)! * N^(1-sigma0-2*m)/(sigma0+2*m-1)`,
where `C_m = sum(j=0..2*m, binomial(2*m,j)*abs(B_j))` bounds the periodic
Bernoulli polynomial. It tends to zero as N→∞. All x+t are positive and the final
denominator is positive. At s=1 for nonprincipal χ, replace
`((N+t)^(1-s)-1)/(s-1)` by its removable value `-log(N+t)` and use Σχ(a)=0;
the principal-character pole remains excluded.

This is the shifted even-order form of DLMF equations 25.11.4 and 25.11.7, obtained
by one integration by parts (DLMF25 lines 213 and 419). *Needs:* native Hurwitz and
Dirichlet continuations; Bernoulli polynomials; finite algebraic character values.

**Checks.**

- For q=1, s=2, m=1 the estimate is a bound for the ζ(2) tail, with positive denominator three.
- At s=0 the continued value ζ(0)=−1/2 is recovered, unlike the divergent raw series.
- At s=1 and χ of conductor four the removable expression gives L(1,χ)=π/4;
  the same point for the principal conductor-one character is excluded.

### 4.20 Enclosures of continued Dirichlet values (`dirichletLBox`)

For primitive χ of positive modulus q, any complex z away from a principal-character pole,
and P∈ℕ, prove existence of rational component intervals containing the native
`DirichletCharacter.LFunction chi z`, each of width at most 2^(−P).
The Lean existence theorem is `exists_dirichletLBox`.

- `dirichletLBox_sound`: The rectangle contains that native continued value.
- `dirichletLBox_width`: Both widths meet the bound.
- `dirichletLBox_nonvanishing`: Excluding zero implies nonvanishing.

Use §4.19a to relate finite sums with vanishing errors to the native continuation
(Platt §§4–6, printed pp.3–13; DLMF25 equation 25.11.7).
*Needs:* `dirichlet_eulerMaclaurin_remainder`, `complexBoxSet` (4.7),
`AlgebraicRootCertificate` (0.8), Mathlib `DirichletCharacter.LFunction`.

**Checks.**

- At q=1, z=2, `[8/5,5/3]×{0}` is an admissible P=3 rectangle for ζ(2)=π²/6.
- The principal conductor-one value at one is outside the pole hypothesis.
- At z=0 the continued conductor-one value is −1/2, enclosed by the singleton −1/2.

The boundary comparisons are `dirichlet_conductor_one_controls`.

### 4.20a Uniform two-tail bound for cusp forms (`cusp_mellin_tail`)

Fix k>0 and a level-one cusp form f with Fourier coefficients a_n. Put κ=k/2.
Choose a positive rational C with `abs(a_n) ≤ C*n^kappa` for every n≥1, obtained
from Mathlib `CuspFormClass.qExpansion_isBigO` and the finitely many initial coefficients.
For `sigma0 ≤ Re s ≤ sigma1`, put `B = max(0,sigma1-1,k-sigma0-1)` and
`H = sup norm((2*pi)^s/Gamma(s))` on a specified compact set of arguments, with the
entire reciprocal-Gamma convention at nonpositive integers. Prove the split Mellin identity

`L(f,s) = (2*pi)^s/Gamma(s) * sum(n>=1, a_n * integral(t=1..infinity, exp(-2*pi*n*t)*(t^(s-1)+i^k*t^(k-s-1))))`.

If N≥0, `2*pi*(N+1)>B` and `kappa/(N+1)<2*pi`, the error after n=1,…,N is at most

`2*C*H*(N+1)^kappa*exp(-2*pi*(N+1))/((2*pi*(N+1)-B)*(1-exp(kappa/(N+1)-2*pi)))`.

Both denominators are positive. The bound tends to zero uniformly on that compact set.
It bounds both integrals: `t^B ≤ exp(B*(t-1))` for t≥1, followed by a geometric majorant.
The finite integrals are upper incomplete-Gamma values; their defining integral is DLMF8
8.2.2 (DLMF8 line 122). The Mellin identity and sign are the level-one specialization of
Mathlib `ModularForm.weakFEPair` and `ModularForm.L` in
`Mathlib.NumberTheory.ModularForms.LFunction`. *Needs:* those declarations,
`CuspFormClass.qExpansion_isBigO` in `Mathlib.NumberTheory.ModularForms.Bounds`,
and the incomplete-Gamma integral identity.

**Checks.**

- For f=0 both finite sums and both tails vanish; C may be any positive rational.
- At k=12, s=6, the two integrals have equal positive sign; at k=18, s=9, they
  cancel, giving exact central vanishing because i¹⁸=−1.
- At k=12, s=12, N=3, B=11, both denominator guards hold; N=0 fails the first guard.

### 4.21 Enclosures of cusp-form values (`cuspLBox`)

For k>0, an integral level-one cusp form f, complex z and P∈ℕ, prove existence of rational
component intervals containing the native `ModularForm.L hk f z`, each of width at most
2^(−P), where hk states k>0. The Lean existence theorem is `exists_cuspLBox`.
The finite sums in §4.20a specify the value and both tail bounds.

- `cuspLBox_contains`: The rectangle contains the native continuation.
- `cuspLBox_width`: Both widths meet the bound.
- `cuspLBox_excludes_zero`: Exclusion implies nonvanishing.

The coefficient growth and uniform Mellin-tail comparison of §4.20a give arbitrary
accuracy on compact argument sets (Arb §§5–6, pp.7–10, for enclosing semantics;
DLMF8 equation 8.2.2 for the finite Gamma terms).
*Needs:* `cusp_mellin_tail`, `complexBoxSet` (4.7), `integralCuspLattice` (3.2),
Mathlib `ModularForm.L` and `ModularForm.weakFEPair`.

**Checks.**

- The zero form admits the singleton rectangle `{0}×{0}` at every precision.
- For normalized Δ, `delta_L_twelve_bounds` states
  `1/2 < Re L(Delta,12) < 3/2` and `Im L(Delta,12)=0`. Thus
  `[1/2,3/2]×{0}` is an admissible P=0 output excluding zero. Positivity also follows
  independently from Δ(it)>0 and its Mellin integral. A coefficient bound
  `abs(tau(n)) ≤ 1000*n^6`, three Mellin terms and §4.20a give the displayed rational bounds;
  that coefficient bound follows from the Δ product on the standard fundamental domain.
- For −Δ the reflected rectangle `[−3/2,−1/2]×{0}` is admissible; a sign-insensitive
  enclosure would fail to distinguish these values. This follows from linearity in f.

The boundary comparisons are `cuspLBox_zero`, `delta_neg_L_twelve_bounds`.

### 4.22 Platt’s finite-conductor zero theorem (`platt_bounded_height`)

**Theorem.** For primitive χ of modulus q≤400000, every zero s of the native LFunction in 0<Re(s)<1 with |Im(s)|≤H(q) has Re(s)=1/2, where H(q)=max(10⁸/q,7.5·10⁷/q+200) for even q and max(10⁸/q,3.75·10⁷/q+200) for odd q. This parity is the modulus parity, not character parity. The unconditional finite computation is not an assumption of global GRH.

*Proof sketch.* Reconstruct the character enumeration, interval evaluations, sign-change zero isolations and Turing upper count. Equality between the isolated zero count and the upper count excludes missed off-line zeros. The zero-count comparison and the specified finite character range are part of the theorem. ([Platt](#source-platt), Theorems 7.1–7.2, pp.14–15.) *Needs:* `dirichletLBox` (4.20); Mathlib `DirichletCharacter.LFunction`; Mathlib `DirichletCharacter.IsPrimitive`.

### 4.23 Platt’s central nonvanishing target (`platt_central_nonvanishing`)

**Theorem.** For every primitive complex Dirichlet character of modulus q≤2000000, LFunction(χ,1/2)≠0. This is a separate finite-range theorem from the bounded-height zero-line theorem.

*Proof sketch.* A finite family of rectangles excluding zero establishes nonvanishing for every primitive character in the stated range. The exact-value containment and exhaustiveness of that family are the mathematical obligations. ([Platt](#source-platt), Theorems 7.1–7.2, pp.14–15.) *Needs:* `dirichletLBox` (4.20); Mathlib `DirichletCharacter.LFunction`; Mathlib `DirichletCharacter.IsPrimitive`.

### 4.24 No real zeros for conductor at most 400000 (`small_conductor_no_real_zero`)

**Theorem.** For primitive χ of modulus q≤400000 and real s with 0<s<1, the native continued LFunction(χ,s) is nonzero. This is the exact computation input used by Bennett–Siksek Proposition 7.2.

*Proof sketch.* A hypothetical real zero has height zero, so the bounded-height theorem forces s=1/2. The separate central nonvanishing theorem excludes that value. ([Platt](#source-platt), Theorems 7.1–7.2, pp.14–15; [BennettSiksek](#source-bennettsiksek), §7, proof of Proposition 7.2, p.376.) *Needs:* `platt_bounded_height` (4.22); `platt_central_nonvanishing` (4.23).

### 4.25 Entrywise lower bounds on effective vectors (`effectiveGram_lower`)

**Theorem.** Let A,B be real n×n matrices. If B_ij≤A_ij for every i,j and x_i≥0 for every i, then Σ_ij B_ij x_i x_j≤Σ_ij A_ij x_i x_j. Symmetry is unnecessary for this inequality. The nonnegative-coordinate hypothesis is essential.

*Proof sketch.* Every x_i x_j is nonnegative. Multiply each entry inequality by this number and sum. ([CT](#source-ct), Remark 2.11, pp.281–282.) *Needs:* `intervalMul_sound` (4.2).

### 4.26 Integer points of a rational ellipsoid (`ellipsoidPoints`)

For any rational n×n matrix G, t∈ℚⁿ and R∈ℚ, define
`ellipsoidPoints G t R` as the native set of x∈ℤⁿ satisfying `(x-t)ᵀG(x-t) ≤ R`.
When G is symmetric and positive definite, this sublevel set is bounded, hence finite.
Dimension zero is allowed; all finiteness statements require positive definiteness.

- `ellipsoidPoints_of_neg G t R (hG : G.PosDef) (hR : R < 0)`: For positive-definite G and R<0 the set is empty.
- `ellipsoidPoints_neg G R`: For t=0 it is closed under negation.
- `ellipsoidPoints_mono G t R S (h : R <= S)`: Increasing R gives an inclusion.
- `zero_mem_ellipsoidPoints`: For t=0 and R≥0 it contains zero.

Finiteness follows from positive quadratic completion (deWeger, §3.6, printed pp.51–53).
*Needs:* Mathlib `Matrix.PosDef` and finiteness of bounded integer sets.

**Checks.**

- G=I₂, t=0, R=1 gives `{0, ±(1,0), ±(0,1)}`.
- G=`[[2,1],[1,2]]`, t=0, R=2 gives seven points; `(1,1)` has value six and is excluded.
- G=`[1]`, t=1/2, R=1/4 gives `{0,1}`; negation symmetry requires t=0.
- In dimension zero the empty vector belongs iff R≥0.
- G=`[0]` at R=0 has infinitely many integer points, showing why definiteness is required.

The boundary comparisons are `ellipsoidPoints_binary_counts`, `ellipsoidPoints_zero_form_infinite`, `ellipsoidPoints_zero_dim`.

The shifted-set boundary is `ellipsoidPoints_shifted_one`.

### 4.27 Completeness of the ellipsoid set (`ellipsoidPoints_complete`)

**Theorem.** For symmetric positive-definite G and arbitrary rational t,R,
`ellipsoidPoints G t R` is finite and membership is equivalent to the defining quadratic inequality. For t=0, if this set is `{0}`,
every nonzero integer vector has value strictly above R. If R≤R′, the set at R′
is a finite cover of the set at R, with the extra points retained explicitly
(deWeger, §3.6, printed pp.51–53).
*Needs:* §4.26.

### 4.28 Loewner lower bounds on unrestricted vectors (`loewnerGram_lower`)

**Theorem.** For real matrices A and B with A−B positive semidefinite, xᵀBx≤xᵀAx for every real vector x, including mixed signs. Positive semidefiniteness includes symmetry of the difference; A and B need not separately be symmetric.

*Proof sketch.* Evaluate the positive-semidefinite inequality on x and expand the difference. ([CT](#source-ct), Remark 2.11, pp.281–282.) *Needs:* Mathlib (integers, rationals, lists and finite functions).

### 4.29 Rational witness of Gram negativity (`NegativeGramCertificate`)

**Definition.** For an n×n matrix I of rational enclosing intervals and a rational vector t, NegativeGramCertificate I consists of t_i≥0 for every i, t≠0, and the strictly negative rational upper bound Σ_ij I_ij.upper t_i t_j<0. It does not store an approximate eigenvalue as evidence.

- `NegativeGramCertificate.upper_negative (c : NegativeGramCertificate I)`: The stored endpoint quadratic value is strictly negative.
- `NegativeGramCertificate.vector_ne_zero (c : NegativeGramCertificate I)`: The witness vector is nonzero.
- `NegativeGramCertificate.scale`: Multiplying the vector by a positive rational preserves certification.
- `NegativeGramCertificate.scale_vector (c : NegativeGramCertificate I) r (hr : 0 < r)`: The scaled certificate uses exactly r times the original vector.

*Construction.* The fields are exact rational inequalities. Nonnegativity permits endpointwise upper bounding. ([CT](#source-ct), Algorithm 2.4.4, pp.282–283.) *Needs:* Mathlib `NonemptyInterval`; `effectiveGram_lower` (4.25).

**Checks.**

- *Computed value.* The one-dimensional interval [−2,−1] admits vector 1.
- *Degenerate case.* Dimension zero admits no nonzero vector certificate.
- *Non-example.* The one-dimensional enclosure [−1,1] certifies no negative value by this rule.

### 4.30 Soundness of the negativity certificate (`NegativeGramCertificate.sound`)

**Theorem.** If A_ij lies in interval I_ij and c is a NegativeGramCertificate I, then c.vectorᵀ A c.vector<0 over ℝ.

*Proof sketch.* Cast the exact rational upper inequality to ℝ. Sum entrywise upper bounds weighted by nonnegative vector products. ([CT](#source-ct), Algorithm 2.4.4, step 4, pp.282–283.) *Needs:* `NegativeGramCertificate` (4.29); `effectiveGram_lower` (4.25).

### 4.31 Effective vectors from a certified ellipsoid cover (`effectiveEllipsoidCover`)

**Construction.** Given a certified finite cover S of all integer vectors x with xᵀBx≤c, effectiveEllipsoidCover filters S by nonnegative coordinates and the exact rational bound xᵀBx≤c. If B is entrywise below the real target Gram matrix A, then every effective integer x with xᵀAx≤c remains in the output. The result may contain vectors failing the true A-bound, so it is a cover of the required set, not an exact list for A. A safety factor such as 1.001 must appear in the supplied c and never be silently described as the original cutoff.

- `mem_effectiveEllipsoidCover`: Membership is membership in S plus the two exact filter conditions.
- `effectiveEllipsoidCover_subset`: Filtering never invents a vector.
- `effectiveEllipsoidCover_complete`: Every nonnegative B-short vector is retained when S is exhaustive.

*Construction.* For positive-definite symmetric B, the finite set `ellipsoidPoints B 0 c` supplies S by §4.27. Intersect S with the nonnegative orthant and the stated quadratic sublevel set. The effective Gram comparison proves that each required A-short vector is B-short and therefore was enumerated. ([CT](#source-ct), Remark 2.11 and §2.4.3, pp.281–282.) *Needs:* `ellipsoidPoints_complete` (4.27); `effectiveGram_lower` (4.25).

**Checks.**

- *Degenerate case.* The zero vector survives any nonnegative cutoff when supplied.
- *Non-example.* A negative coordinate is rejected even inside the ellipsoid.
- *Computed value.* A vector on the exact rational boundary is retained.

### 4.32 Validity of a rational Gram witness (`GramWitnessValid`)

Define `GramWitnessValid I t` as `∀ i, 0 ≤ t_i`, `t ≠ 0`, and
`∑ i,j, I_ij.upper*t_i*t_j < 0`. All entries and vector coordinates are rational.
This predicate is a mathematical condition on proposed data.

- `GramWitnessValid_iff I t`: Validity is the displayed conjunction.
- `GramWitnessValid_certificate`: Validity supplies a `NegativeGramCertificate` with vector t.
- `GramWitnessValid_scale I t r (hr : 0 < r)`: Scaling by a positive rational preserves validity.

These conditions give the upper quadratic bound of CT §2.4.4, printed pp.282–283.
*Needs:* §4.29.

**Checks.**

- I=`[[-2,-1]]`, t=1 satisfies the predicate.
- The zero vector fails even for a strictly negative matrix.
- I=`[[-1,1]]`, t=1 fails because its upper endpoint is positive.

### 4.33 Validity of a finite Gram family (`GramDatasetValid`)

A row is a dimension n, an n×n rational interval matrix and a rational n-vector.
Define `GramDatasetValid rows` as `GramWitnessValid` for every row in this finite list.
Validity proves negativity only after each row's intervals have been related to the
specified analytic matrix; exhaustiveness requires a separate finite cover.

- `GramDatasetValid_iff rows`: Validity means validity of every member.
- `GramDatasetValid_append rows rows'`: Validity of a concatenation is validity of both lists.
- `GramDatasetValid_perm (h : rows.Perm rows')`: Reordering preserves validity.

Use dependent pairs over n and ordinary list membership (CT §§2.4.6 and 4.1–4.3,
printed pp.284–286 and 295–299). *Needs:* §§4.18, 4.31–4.32.

**Checks.**

- The empty family is valid but establishes no exhaustiveness.
- A single row I=`[[-2,-1]]`, t=1 is valid.
- Appending a zero-vector row to that family makes it invalid.

### 4.34 Correct multiplicity lift for Gram witnesses (`multiplicityGram_lift`)

**Theorem.** Let m_i>0 be block sizes, A∈ℝ and K an n×n real matrix. On the expanded index set {(i,r):0≤r<m_i}, put B_(i,r),(j,s)=A·δ_(i,r),(j,s)−K_ij. For any vector t, the expanded vector x_(i,r)=t_i/m_i satisfies xᵀBx=tᵀβt, where β_ij=(A/m_i)δ_ij−K_ij. Thus a certified negative value for β gives one for B. The lift is t_i/m_i; replacing it by t_i/√m_i changes the off-diagonal normalization. This equality does not assert equality of Euclidean unit-sphere minima.

*Proof sketch.* Sum each constant block contribution and the diagonal terms separately. Each diagonal block contributes A·m_i·(t_i/m_i)²=A t_i²/m_i, while each off-diagonal block contributes −K_ij t_i t_j. ([CT](#source-ct), §2.4.2, Equation (2.4.4), p.278 and reduction pp.280–281; Algorithm 2.4.5, p.283.) *Needs:* `NegativeGramCertificate` (4.29).

### Examples

- `[−2, 3]·[−4, 5] = [−12, 15]`, and `[−1, 1]·[−1, 1]` has lower endpoint `−1`, not `1` (`intervalMul` (4.1)).
- At precision `2` the outward dyadic hull of `1/3` is `[1/4, 1/2]`; at precision `0` that of `−1/3` is `[−1, 0]` (`dyadicHull` (4.5)).
- At `p = 3`, `(3 + O(3⁴))·(1/3 + O(3²))` has centre `1` and absolute precision `min(1 + 2, 4 − 1) = 3`, and inverting `3 + O(3⁴)` gives absolute precision `2` (`padicMul` (4.12), `padicInverse` (4.13)).
- The shared Fourier value `8ℓ/π²` at `ℓ = 1` lies in `(4/5, 41/50)` (`ctEnclosure` (4.18)).
- For `G = [[2, 1], [1, 2]]` and `R = 2` the Fincke–Pohst output has seven vectors and excludes `(1, 1)` (`ellipsoidPoints` (4.26)).
- The multiplicity lift sends `t_i` to `t_i/m_i`, so each diagonal block contributes `A·m_i·(t_i/m_i)² = A t_i²/m_i` (`multiplicityGram_lift` (4.34)).
- With two block sizes `(2,3)`, `A = 6`, `K = [[1,2],[2,4]]` and `t = (2,3)`, the reduced matrix is `[[2,−2],[−2,−2]]` and its value is `8 − 24 − 18 = −34`. The lift is the five-coordinate vector `(1,1,1,1,1)`, whose expanded value is `30 − (4 + 24 + 36) = −34`; division by square roots of block sizes would give a different value (`multiplicityGram_lift` (4.34)).

### Dependencies

Layers CN.0–CN.3; Mathlib (`NonemptyInterval`, digamma, `DirichletCharacter.LFunction`, `ModularForm.L`, `WeakFEPair`, `Matrix.PosDef`); TauCetiRoadmap RealAlgebraicGeometry Layers 1–4.

## Layer CN.5: Binding and replay of arithmetic datasets

A finite arithmetic family is interpreted by its maps to the native objects and the
mathematical validity of every member. The family includes its exact parameter range,
coefficient embeddings, normalizations and rational endpoints. Completeness is a separate
claim about that exact range.

For modular data the comparisons are `modularDataEqual` (3.5) and `integralHeckeMatrix`
(3.7). For elliptic data they are `LocalImageCertificate` (3.18) and `pSaturationCriterion`
(3.26). The CT applications use `ctEnclosure` (4.18), `effectiveEllipsoidCover` (4.31)
and `GramDatasetValid` (4.33); Platt's two finite ranges use `platt_bounded_height` (4.22)
and `platt_central_nonvanishing` (4.23). These are propositions about all members of a
finite family (CT §§2.4.6, 4.1–4.3, pp.284–286, 295–299; Platt §§4–7, pp.3–15).

### Examples

- The family with I=`[[-2,-1]]`, t=1 is valid; adjoining a zero-vector row makes it invalid.

### Dependencies

Layers CN.0, CN.3 and CN.4.

## Downstream consumers

- **EffectiveDiophantineMethods**: its `2`-Selmer groups, rank bounds, canonical-height enclosures,
  index bounds and Mordell–Weil bases use `LocalImageCertificate.eq_range_of_isComplete` (3.19),
  `localImage_of_good_odd` (3.21), `pSaturationCriterion` (3.26), the order presentations of Layer CN.2 and
  the enclosures of Layer CN.4; its worked Diophantine examples instantiate the dataset binding of
  Layer CN.5.
## References

Locators use the printed page numbers of the linked version unless explicitly marked as PDF
pages. The sources prove or motivate the mathematical statements at the cited locations; the
finite-data presentations use the stated maps into native carriers. Arb
supplies enclosure semantics; LLL82 supplies factorization and coefficient bounds. The CL
reference is the French preprint and its Proposition 3.17; the English edition numbers it
differently.

### Source Shoup

- **Shoup**: Victor Shoup, [A Computational Introduction to Number Theory and Algebra](https://shoup.net/ntb/ntb-v2.pdf), Version 2.

### Source Stein

- **Stein**: William Stein, [Modular Forms: A Computational Approach](https://wstein.org/books/modform/stein-modform.pdf), Author PDF.

### Source Arb

- **Arb**: Fredrik Johansson, [Arb: efficient arbitrary-precision midpoint-radius interval arithmetic](https://arxiv.org/pdf/1611.02831), arXiv:1611.02831v1.

### Source CT

- **CT**: Gaëtan Chenevier, Olivier Taïbi, [Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf), Publ. Math. IHÉS 131 (2020), 261–323.

### Source BCG

- **BCG**: George Boxer, Frank Calegari, Toby Gee, [Cuspidal cohomology classes for GL_n(Z)](https://math.uchicago.edu/~fcale/papers/WeightZero.pdf), JAMS 38 (2025), 509–520.

### Source NumberRings

- **NumberRings**: Peter Stevenhagen, [The arithmetic of number rings](https://library.slmath.org/books/Book44/files/08psh.pdf), MSRI 44 (2008), pp.209–266.

### Source GMN

- **GMN**: Jordi Guàrdia, Jesús Montes, Enric Nart, [Newton polygons of higher order in algebraic number theory](https://arxiv.org/pdf/0807.2620), arXiv:0807.2620v2.

### Source CarusoPublished

- **CarusoPublished**: Xavier Caruso, [Computations with p-adic numbers](https://www.numdam.org/item/10.5802/ccirm.25.pdf), Les cours du CIRM 5 (2017), no.1, II.

### Source BennettSiksek

- **BennettSiksek**: Michael Bennett, Samir Siksek, [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), Annals of Mathematics 191 (2020), 355–392.

### Source Thery

- **Thery**: Laurent Théry, [Primality Tests and Prime Certificate](https://arxiv.org/pdf/2203.16341), arXiv:2203.16341.

### Source Platt

- **Platt**: David Platt, [Numerical computations concerning the GRH](https://arxiv.org/pdf/1305.3087), arXiv:1305.3087, 15-page preprint.

### Source PrattNotes

- **PrattNotes**: Vašek Chvátal, [Pratt’s primality proofs](https://users.encs.concordia.ca/~chvatal/notes/ppp.pdf), Author lecture notes, 5 pages.

### Source CL

- **CL**: Gaëtan Chenevier and Jean Lannes, [Formes automorphes et voisins de Kneser des réseaux de Niemeier](https://arxiv.org/pdf/1409.7616), arXiv:1409.7616, French 461-page preprint.

### Source CG13

- **CG13**: Craig Citro and Alexandru Ghitza, [Computing level one Hecke eigensystems (mod p)](https://arxiv.org/pdf/1102.3321v2), arXiv:1102.3321v2, 29 March 2011.

### Source MilneANT

- **MilneANT**: J. S. Milne, [Algebraic Number Theory](https://www.jmilne.org/math/CourseNotes/ANT.pdf), course notes, version 3.08 (2020).

### Source Sutherland

- **Sutherland**: Andrew V. Sutherland, [18.783 Elliptic Curves, Lecture 7: Point counting](https://math.mit.edu/classes/18.783/2023/LectureNotes7.pdf), MIT lecture notes, Fall 2023.

### Source Cremona

- **Cremona**: J. E. Cremona, [Algorithms for Modular Elliptic Curves, Chapter III](https://johncremona.github.io/book/fulltext/chapter3.pdf), 2nd edition (1997), author's online text.

### Source FPS

- **FPS**: E. V. Flynn, Bjorn Poonen, Edward F. Schaefer, [Cycles of quadratic polynomials and rational points on a genus-2 curve](https://arxiv.org/abs/math/9508211), arXiv:math/9508211v1; Duke Math. J. 90 (1997).

### Source Siksek

- **Siksek**: Samir Siksek, [Infinite descent on elliptic curves](https://samirsiksek.github.io/siksek.github.io/papers/infart2.pdf), author preprint (1995); Rocky Mountain J. Math. 25 (1995).

### Source deWeger

- **deWeger**: B. M. M. de Weger, [Algorithms for Diophantine Equations](https://ir.cwi.nl/pub/13190/13190D.pdf), CWI Tract 65 (1989).

### Source LLL82

- **LLL82**: A. K. Lenstra, H. W. Lenstra Jr. and L. Lovász, [Factoring polynomials with rational coefficients](https://ir.cwi.nl/pub/9304/9304D.pdf), CWI report (1982), printed pages 1–31; published in Math. Ann. 261 (1982), 515–534. Locators above refer to the report's printed pagination.

### Source Mattuck

- **Mattuck**: Arthur Mattuck, *Abelian varieties over p-adic ground fields*, Annals of Mathematics 62 (1955), 92–119; Theorem 7, printed p.114, DOI 10.2307/2007101 (uncertified).

### Source DLMF

- **DLMF**: NIST, [Digital Library of Mathematical Functions §5.7](https://dlmf.nist.gov/5.7), equation 5.7.6.

### Source DLMF15

- **DLMF15**: NIST, [Digital Library of Mathematical Functions §5.15](https://dlmf.nist.gov/5.15), equation 5.15.1.

### Source DLMF25

- **DLMF25**: NIST, [Digital Library of Mathematical Functions §25.11](https://dlmf.nist.gov/25.11), equations 25.11.4 and 25.11.7.

### Source DLMF8

- **DLMF8**: NIST, [Digital Library of Mathematical Functions §8.2](https://dlmf.nist.gov/8.2), equation 8.2.2.
