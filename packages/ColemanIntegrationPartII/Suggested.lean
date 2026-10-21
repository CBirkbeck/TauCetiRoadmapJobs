import Mathlib

/-!
# ColemanIntegrationPartII: representative target signatures

The roadmap is `README.md`. This file records statements suggested against the
pinned APIs and is not exhaustive. The formal degree-one logarithmic space uses
its Laurent-coefficient decomposition. Analytic annuli, Coleman functions,
natural integration and semistable comparisons have their full targets in the
README. The polynomial specialization law records the algebra used for branch
transport; it does not construct an integration theory.

Layer 5 requires the full polynomial-logarithm primitive data, beyond the
degree-one coefficient pairs below. With those data,
`Annulus.tripleIndex_changeConstant` gives the residue error from opposite
primitive shifts. `Annulus.tripleIndex_simplePoles` expresses the index using
constant coefficients when the three differentials have at most simple poles.
`Annulus.tripleIndex_pullback` scales it by the positive oriented degree only
when every auxiliary primitive is transported. These signatures require the
primitive-data construction in the README.
-/

namespace TauCetiRoadmap.ColemanIntegrationPartII

/-! ## Layer 2: Logarithmic annular functions and the double index -/

namespace Annulus

/-- In a fixed formal parameter, `f + a L` is represented by its Laurent part and
scalar logarithmic coefficient. This is a module presentation, with no assertion
that multiplication preserves degree one (Besser, Definition 3.1, p. 9). -/
abbrev LogarithmicFunctions (k : Type*) [Field k] := LaurentSeries k × k

namespace LogarithmicFunctions

/-- The coefficient of `dz` in `d(f + a L)`, where `dL = dz/z`. -/
noncomputable def differential {k : Type*} [Field k] (F : LogarithmicFunctions k) :
    LaurentSeries k :=
  LaurentSeries.derivative k F.1 + HahnSeries.single (-1) F.2

/-- The formal logarithmic coefficient decomposition embeds into the polynomial
logarithm algebra by `f + a L`. -/
noncomputable def toPolynomial {k : Type*} [Field k] (F : LogarithmicFunctions k) :
    Polynomial (LaurentSeries k) :=
  Polynomial.C F.1 + Polynomial.C (HahnSeries.single 0 F.2) * Polynomial.X

/-- Every formal meromorphic differential has a degree-one logarithmic primitive,
and its logarithmic coefficient is its residue. Characteristic zero is essential. -/
theorem formal_primitive {k : Type*} [Field k] [CharZero k]
    (w : LaurentSeries k) :
    ∃ F : LogarithmicFunctions k, differential F = w ∧ F.2 = w.coeff (-1) := sorry

/-- The only degree-one logarithmic functions with zero differential are scalars. -/
theorem differential_eq_zero_iff {k : Type*} [Field k] [CharZero k]
    (F : LogarithmicFunctions k) :
    differential F = 0 ↔ ∃ c : k, F = (HahnSeries.single 0 c, 0) := sorry

/-- Residue recovers the logarithmic coefficient, with positive `dz/z` orientation. -/
theorem differential_residue {k : Type*} [Field k] [CharZero k]
    (F : LogarithmicFunctions k) :
    (differential F).coeff (-1) = F.2 := sorry

/-- A degree-one logarithmic function is Laurent exactly when its differential
has zero residue. This is the formal coefficient version of the residue criterion. -/
theorem residue_zero_iff {k : Type*} [Field k] [CharZero k]
    (F : LogarithmicFunctions k) :
    (differential F).coeff (-1) = 0 ↔ ∃ f : LaurentSeries k, F = (f, 0) := sorry

/-- Laurent and logarithmic coefficients are unique in the polynomial presentation. -/
theorem toPolynomial_injective {k : Type*} [Field k] :
    Function.Injective (toPolynomial (k := k)) := sorry

/-- The nonzero logarithmic residue and scalar zero derivative distinguish the
logarithm from constants, including over residue characteristic two. -/
example {k : Type*} [Field k] [CharZero k] :
    differential ((0, 1) : LogarithmicFunctions k) = HahnSeries.single (-1) 1 ∧
      differential ((0, 1) : LogarithmicFunctions k) ≠ 0 ∧
      ∀ c : k, differential ((HahnSeries.single 0 c, 0) : LogarithmicFunctions k) = 0 := by
  refine ⟨by simp [differential], ?_, ?_⟩
  · simp [differential]
  · intro c
    simp [differential, LaurentSeries.derivative]

/-- The derivative of `2 + 3 L` has residue three. The polynomial comparison sends
the nonzero Laurent constant to its constant polynomial and the logarithmic generator
to `X`, while excluding `X²` from its image. Over `ZMod 2`, the non-scalar
monomial `z²` has zero differential, testing the characteristic-zero kernel hypothesis. -/
example :
    (differential ((HahnSeries.single 0 2, 3) : LogarithmicFunctions ℚ)).coeff (-1) = 3 ∧
      toPolynomial ((HahnSeries.single 0 2, 0) : LogarithmicFunctions ℚ) =
        Polynomial.C (HahnSeries.single 0 2) ∧
      toPolynomial ((0, 1) : LogarithmicFunctions ℚ) = Polynomial.X ∧
      (∀ F : LogarithmicFunctions ℚ, toPolynomial F ≠ Polynomial.X ^ 2) ∧
      differential ((HahnSeries.single 2 1, 0) : LogarithmicFunctions (ZMod 2)) = 0 ∧
      ∀ c : ZMod 2,
        ((HahnSeries.single 2 1, 0) : LogarithmicFunctions (ZMod 2)) ≠
          (HahnSeries.single 0 c, 0) := by
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩
  · norm_num [differential, LaurentSeries.derivative]
  · simp [toPolynomial]
  · simp [toPolynomial]
  · intro F h
    have hc := congrArg (fun P : Polynomial (LaurentSeries ℚ) ↦ P.coeff 2) h
    simpa [toPolynomial] using hc
  · norm_num [differential, LaurentSeries.derivative]
  · intro c h
    have hc := congrArg
      (fun F : LogarithmicFunctions (ZMod 2) ↦ F.1.coeff 2) h
    simpa using hc

end LogarithmicFunctions

/-- The formal double index in positive parameter orientation. Its residue rule
places the differentiated function second (Besser, Definition 3.2, p. 9).
The last two terms are the logarithmic correction.

The fixed-parameter coefficient presentation does not encode annular maps or
oriented ends. On those carriers, `Annulus.doubleIndex_pullback` scales the
index by positive oriented degree, and `doubleIndex_reverse` negates it under
orientation reversal. `doubleIndex_scalarExtension` transports this value under
coefficient embeddings; `doubleIndex_shrink` identifies analytic values on a
common end annulus. Their signatures use the domain and transport constructions
specified in README Layer 2. -/
noncomputable def doubleIndex {k : Type*} [Field k]
    (F G : LogarithmicFunctions k) : k :=
  (F.1 * LaurentSeries.derivative k G.1).coeff (-1) +
    G.2 * F.1.coeff 0 - F.2 * G.1.coeff 0

/-- The local double index is alternating for every characteristic-zero field. -/
theorem doubleIndex_self {k : Type*} [Field k] [CharZero k]
    (F : LogarithmicFunctions k) : doubleIndex F F = 0 := sorry

/-- Additivity in the first slot of the double index, with the pointwise module
structure in the coefficient presentation. -/
theorem doubleIndex_add_left {k : Type*} [Field k] [CharZero k]
    (F F' G : LogarithmicFunctions k) :
    doubleIndex (F + F') G = doubleIndex F G + doubleIndex F' G := sorry

/-- If the first argument has no logarithmic term, the index is the residue of
that argument times the differential of the second. -/
theorem doubleIndex_laurent_first {k : Type*} [Field k] [CharZero k]
    (f : LaurentSeries k) (G : LogarithmicFunctions k) :
    doubleIndex (f, 0) G = (f * LogarithmicFunctions.differential G).coeff (-1) := sorry

/-- Alternation and the Laurent-first residue rule uniquely determine the
formal double index among bilinear pairings. -/
theorem doubleIndex_ext {k : Type*} [Field k] [CharZero k]
    (B : LogarithmicFunctions k →ₗ[k] LogarithmicFunctions k →ₗ[k] k)
    (hAlternating : ∀ F : LogarithmicFunctions k, B F F = 0)
    (hLaurent : ∀ (f : LaurentSeries k) (G : LogarithmicFunctions k),
      B (f, 0) G = (f * LogarithmicFunctions.differential G).coeff (-1))
    (F G : LogarithmicFunctions k) : B F G = doubleIndex F G := sorry

/-- Adding scalar constants gives the two residue terms with opposite signs. -/
theorem doubleIndex_add_constants {k : Type*} [Field k] [CharZero k]
    (F G : LogarithmicFunctions k) (a b : k) :
    doubleIndex (F + (HahnSeries.single 0 a, 0))
      (G + (HahnSeries.single 0 b, 0)) - doubleIndex F G =
        a * G.2 - b * F.2 := sorry

/-- Constants paired with the logarithm detect the residue order; logarithms
paired with themselves and pairs of constants have zero index. -/
example :
    doubleIndex ((HahnSeries.single 0 1, 0) : LogarithmicFunctions ℚ) (0, 1) = 1 ∧
      doubleIndex ((0, 1) : LogarithmicFunctions ℚ) (HahnSeries.single 0 1, 0) = -1 ∧
      doubleIndex ((0, 1) : LogarithmicFunctions ℚ) (0, 1) = 0 ∧
      ∀ a b : ℚ,
        doubleIndex ((HahnSeries.single 0 a, 0) : LogarithmicFunctions ℚ)
          (HahnSeries.single 0 b, 0) = 0 := by
  norm_num [doubleIndex, LaurentSeries.derivative]

/-- The Laurent test gives `B(z,z⁻¹) = -1`. The Laurent-first rule and the
constant-change witness fix the logarithmic correction. -/
example :
    doubleIndex ((HahnSeries.single 1 1, 0) : LogarithmicFunctions ℚ)
      (HahnSeries.single (-1) 1, 0) = -1 ∧
      (∀ (f : LaurentSeries ℚ) (G : LogarithmicFunctions ℚ),
        doubleIndex (f, 0) G = (f * LogarithmicFunctions.differential G).coeff (-1)) ∧
      doubleIndex ((HahnSeries.single 0 1, 0) : LogarithmicFunctions ℚ) (0, 1) -
        doubleIndex ((0, 0) : LogarithmicFunctions ℚ) (0, 1) = 1 := by
  constructor
  · norm_num [doubleIndex, LaurentSeries.derivative, HahnSeries.single_mul_single]
  constructor
  · intro f G
    simp [doubleIndex, LogarithmicFunctions.differential, mul_add,
      HahnSeries.coeff_mul_single, mul_comm]
  · norm_num [doubleIndex, LaurentSeries.derivative]

end Annulus

/-! ## Layer 7: Branch transport, traces and arbitrary-reduction descent -/

namespace SingleIntegral

/-- The coefficients of an affine universal single-integral value `A + B T`.
This is the affine value space, without an assertion that a form has been integrated. -/
abbrev UniversalAffine (k : Type*) := k × k

namespace UniversalAffine

/-- Evaluate an affine universal value at the chosen logarithm parameter. -/
def specialize {k : Type*} [CommRing k] (I : UniversalAffine k) (lam : k) : k :=
  I.1 + I.2 * lam

/-- Evaluation at logarithm parameter zero recovers the constant coefficient. -/
theorem specialize_zero {k : Type*} [CommRing k] (I : UniversalAffine k) :
    specialize I 0 = I.1 := sorry

/-- Specialization preserves addition of affine universal values. -/
theorem specialize_add {k : Type*} [CommRing k]
    (I J : UniversalAffine k) (lam : k) :
    specialize (I + J) lam = specialize I lam + specialize J lam := sorry

/-- A coefficient ring homomorphism commutes with specialization, transporting
both affine coefficients and the logarithm parameter. -/
theorem specialize_tower {k l : Type*} [CommRing k] [CommRing l]
    (f : k →+* l) (I : UniversalAffine k) (lam : k) :
    f (specialize I lam) = specialize (f I.1, f I.2) (f lam) := sorry

/-- Exact-form values have no branch term; the zero value stays zero. -/
example {k : Type*} [CommRing k] (a lam : k) :
    specialize (a, 0) lam = a ∧ specialize ((0, 0) : UniversalAffine k) lam = 0 := by
  simp [specialize]

/-- The `dlog` value has branch slope one. Ramification index two changes this
slope to one half, so a branch change by two contributes one. -/
example :
    specialize ((0, 1) : UniversalAffine ℚ) 2 - specialize (0, 1) 0 = 2 ∧
      specialize ((0, 1 / 2) : UniversalAffine ℚ) 2 -
        specialize (0, 1 / 2) 0 = 1 := by
  norm_num [specialize]

end UniversalAffine

/-- The specialization law underlying branch transport: the value of `A + B T`
changes by `(lam' - lam) B`. Membership of an actual integral in this affine space
is the separate natural-integration target. The scalar law holds over every
commutative ring. The geometric assertion
`SingleIntegral.properHolomorphic_branchIndependent` additionally says that
actual holomorphic integrals on smooth proper curves have zero branch slope;
its signature requires the natural-integration and curve carriers of the README,
rather than an arbitrary affine pair. -/
theorem branchTransport_affinePolynomial {k : Type*} [CommRing k]
    (I : UniversalAffine k) (lam lam' : k) :
    UniversalAffine.specialize I lam' - UniversalAffine.specialize I lam =
      (lam' - lam) * I.2 := sorry

end SingleIntegral

end TauCetiRoadmap.ColemanIntegrationPartII
