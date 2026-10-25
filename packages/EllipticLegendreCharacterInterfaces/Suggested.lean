import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.PointCount

/-!
# Elliptic Legendre character interfaces: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned APIs. The odd-character-conductor divisibility theorem is not
statable at these pins: the actual elliptic conductor of a rational elliptic curve, with its
comparison to reduction, has no native carrier. The primitive-character support theorem uses
native primitive Dirichlet characters specified by their prime values; it does not construct a
second character. Split descent coordinates and their CRT constructions are specified in README.md.
-/

namespace TauCetiRoadmap.EllipticLegendreCharacterInterfaces

/-! ## Layer 0: Legendre equations and root orderings -/

/-- The five-coefficient Legendre model over a commutative ring. -/
def legendre {R : Type*} [CommRing R] (lam : R) : WeierstrassCurve R :=
  ⟨0, -(1 + lam), 0, lam, 0⟩

/-- The split cubic with ordered roots `0`, `d`, and `d * lam`. -/
def scaledLegendre {R : Type*} [CommRing R] (d lam : R) : WeierstrassCurve R :=
  ⟨0, -d * (1 + lam), 0, d ^ 2 * lam, 0⟩

/-- Full rational two-torsion gives an admissible scaled Legendre equation. -/
theorem exists_scaledLegendre_of_full_two_torsion
    (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (hfull : Nat.card (nsmulAddMonoidHom (α := E.toAffine.Point) 2).ker = 4) :
    ∃ (C : WeierstrassCurve.VariableChange ℚ) (d lam : ℚ),
      d ≠ 0 ∧ lam ≠ 0 ∧ lam ≠ 1 ∧ C • E = scaledLegendre d lam := by
  sorry

/-! ## Layer 1: Good reduction and character conductors -/

/-- Good reduction of a rational curve at an odd prime forces its associated parameter units. -/
theorem legendre_units_of_good_reduction
    (p : ℕ) [Fact p.Prime] (hp : p ≠ 2)
    (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (C : WeierstrassCurve.VariableChange ℚ) (d lam : ℚ)
    (hd : d ≠ 0) (hlam : lam ≠ 0) (hlam₁ : lam ≠ 1)
    (hmodel : C • E = scaledLegendre d lam)
    (hgood : WeierstrassCurve.HasGoodReduction (PadicInt p)
      ((E.map (algebraMap ℚ (Padic p))).minimal (PadicInt p))) :
    padicValRat p lam = 0 ∧ padicValRat p (1 - lam) = 0 := by
  sorry

/-- Unit Legendre parameters give a minimal good equation over the p-adic integers. -/
theorem legendre_good_reduction_of_units
    (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) (lam : ℚ)
    (hlam : lam ≠ 0) (hlam₁ : lam ≠ 1)
    (hu : padicValRat p lam = 0) (hv : padicValRat p (1 - lam) = 0) :
    WeierstrassCurve.HasGoodReduction (PadicInt p)
      ((legendre lam).map (algebraMap ℚ (Padic p))) := by
  sorry

/-- An odd prime in the primitive squareclass character's conductor is a bad prime of the curve.
The character is identified by its values at every odd prime where the radicand is a unit. -/
theorem legendre_character_odd_support
    (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (C : WeierstrassCurve.VariableChange ℚ) (d lam ω : ℚ)
    (hd : d ≠ 0) (hlam : lam ≠ 0) (hlam₁ : lam ≠ 1)
    (hmodel : C • E = scaledLegendre d lam)
    (hω : ω ∈ ({1, -1, 2, -2} : Set ℚ))
    (N : ℕ) (hN : N ≠ 0) (χ : DirichletCharacter ℤ N) (hχ : χ.IsPrimitive)
    (hvalues : ∀ (q : ℕ) (hq : q.Prime), q ≠ 2 → padicValRat q (ω * lam) = 0 →
      (letI : Fact q.Prime := ⟨hq⟩
       χ q = legendreSym q ((ω * lam).num * (ω * lam).den)))
    (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) (hpN : p ∣ N) :
    ¬ WeierstrassCurve.HasGoodReduction (PadicInt p)
      ((E.map (algebraMap ℚ (Padic p))).minimal (PadicInt p)) := by
  sorry

/-! ## Layer 2: Split-cubic readings of the native descent map -/

/-- An affine point can be halved exactly when its three root differences are field squares. -/
theorem scaledLegendre_halving_iff_squares
    {K : Type*} [Field K] [DecidableEq K] (h2 : (2 : K) ≠ 0)
    (d lam : K) (hd : d ≠ 0) (hlam : lam ≠ 0) (hlam₁ : lam ≠ 1)
    (x y : K) (hP : (scaledLegendre d lam).toAffine.Nonsingular x y) :
    (∃ Q : (scaledLegendre d lam).toAffine.Point,
      2 • Q = WeierstrassCurve.Affine.Point.some x y hP) ↔
      IsSquare x ∧ IsSquare (x - d) ∧ IsSquare (x - d * lam) := by
  sorry

/-! ## Layer 3: Two-primary torsion over prime fields -/

/-- Square parameters at primes congruent to three modulo four supply a two-by-four subgroup. -/
theorem legendre_two_by_four_subgroup
    (p : ℕ) [Fact p.Prime] (hp : p % 4 = 3) (η : ZMod p)
    (hη : η ≠ 0) (hη₁ : η ≠ 1) (hηm : η ≠ -1) :
    ∃ f : (ZMod 2 × ZMod 4) →+ (legendre (η ^ 2)).toAffine.Point,
      Function.Injective f := by
  sorry

/-- The explicit minus-one point halves the zero root and has exact order four. -/
theorem minus_one_half_order_four
    {K : Type*} [Field K] [DecidableEq K] (h2 : (2 : K) ≠ 0)
    (i : K) (hi : i ^ 2 = -1) :
    ∃ (hP : (legendre (-1 : K)).toAffine.Nonsingular i (1 - i))
      (hT : (legendre (-1 : K)).toAffine.Nonsingular 0 0),
      let P := WeierstrassCurve.Affine.Point.some _ _ hP
      2 • P = WeierstrassCurve.Affine.Point.some _ _ hT ∧ addOrderOf P = 4 := by
  sorry

/-- At primes congruent to five modulo eight the minus-one model has no order-eight point. -/
theorem legendre_minus_one_no_order_eight
    (p : ℕ) [Fact p.Prime] (hp : p % 8 = 5) :
    ∀ P : (legendre (-1 : ZMod p)).toAffine.Point, addOrderOf P ≠ 8 := by
  sorry

/-- The full projective minus-one point count has exact two-adic valuation three. -/
theorem legendre_minus_one_point_count_v_two
    (p : ℕ) [Fact p.Prime] (hp : p % 8 = 5) :
    padicValNat 2 (legendre (-1 : ZMod p)).pointCount = 3 := by
  sorry

/-! ## Layer 4: Explicit order-four points in the twist by two -/

/-- The corrected conic witness is a native point of exact order four, doubling to the last root. -/
theorem twist_halving_point_order_four
    {K : Type*} [Field K] [DecidableEq K] (h2 : (2 : K) ≠ 0)
    (t v i : K) (ht : t ≠ 0) (hv : v ≠ 0) (hi : i ^ 2 = -1)
    (hconic : 2 * t ^ 2 + 2 * v ^ 2 = 1) :
    ∃ (hP : (scaledLegendre 2 (2 * t ^ 2)).toAffine.Nonsingular
        (4 * t ^ 2 + 4 * i * t * v) (8 * i * t * v * (t + i * v)))
      (hT : (scaledLegendre 2 (2 * t ^ 2)).toAffine.Nonsingular (4 * t ^ 2) 0),
      let P := WeierstrassCurve.Affine.Point.some _ _ hP
      2 • P = WeierstrassCurve.Affine.Point.some _ _ hT ∧ addOrderOf P = 4 := by
  sorry

/-! ## Layer 5: Trace and downstream interfaces -/

/-- The odd symmetric cubic has point count p+1 and trace zero when minus one is a nonsquare. -/
theorem scaledLegendre_minus_one_trace_zero
    (p : ℕ) [Fact p.Prime] (hp : p % 4 = 3) (u : ZMod p) (hu : u ≠ 0) :
    (scaledLegendre u (-1)).pointCount = p + 1 ∧
      (scaledLegendre u (-1)).frobeniusTrace = 0 := by
  sorry

/-- Scaling the three roots multiplies the native Frobenius trace by the quadratic character. -/
theorem scaledLegendre_frobeniusTrace
    (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) (d lam : ZMod p)
    (hd : d ≠ 0) (hlam : lam ≠ 0) (hlam₁ : lam ≠ 1) :
    (scaledLegendre d lam).frobeniusTrace =
      quadraticChar (ZMod p) d * (legendre lam).frobeniusTrace := by
  sorry

end TauCetiRoadmap.EllipticLegendreCharacterInterfaces
