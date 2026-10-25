import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.QuadraticTwist.Basic
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Hom.Ring
import TauCeti.AlgebraicGeometry.EllipticCurve.ShortWeierstrass
import TauCeti.FieldTheory.SquareClassGroup.Basic

/-!
# CM rank-zero converses and twist nonvanishing: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems that can be expressed against the pinned APIs.

The signatures below state analytic-order doubling, the three congruent-number
density theorems, CM twist nonvanishing, cube-sum full CM, the descent-coset and
descent-count bounds, and non-descending nonvanishing. Entire continuation is
specified by agreement with the native elliptic L-series on Re(s) > 3/2;
uniqueness makes its value the arithmetic L-value. The remaining headlines
are not statable at the pins:
* Selmer-zero global H² vanishing and the global cohomology line need Kato's
  rational j_* complex and the Bloch–Kato Selmer carrier.
* Central H_g = H_f needs modular de Rham realizations and period functors.
* The central Kato basis theorem needs the actual zeta morphism and its complex.
* Reciprocity nonvanishing, the conditional rational Kato converse, and the
  all-prime CM newform converse need that morphism, its regulators, the
  Bloch–Kato Selmer carrier and the CM-newform predicate. The arithmetic newform
  L-function and its finite analytic order are available at the pins.
* The CM elliptic converses over the CM field and over ℚ, and Selmer-corank
  doubling, need classical p-infinity Selmer groups and their finite-cotype
  comparison. Non-scalar native endomorphisms express CM for the analytic
  headlines below, without constructing the general CM-order interface.

No abstract scalar functions or freely chosen Selmer predicates replace these
objects. Elementary sign and discriminant identities remain checks in README.md.
-/

namespace TauCetiRoadmap.CMRankZeroConverse

open Filter NumberField
open scoped Topology

/-! ## Layer 0: Central conventions and shared propositions -/

/-- Nonvanishing at one of the entire continuation of the actual Hasse–Weil
L-series. Agreement on a half-plane determines the entire function uniquely. -/
def ellipticLNonvanishingAtOne {K : Type*} [Field K] [NumberField K]
    (W : WeierstrassCurve K) : Prop :=
  ∃ F : ℂ → ℂ, Differentiable ℂ F ∧
    (∀ s : ℂ, 3 / 2 < s.re → F s = W.LSeries s) ∧ F 1 ≠ 0

/-! ## Layer 4: CM elliptic curves and quadratic descent -/

/-- For a rational CM elliptic curve, base change to its imaginary quadratic
endomorphism field doubles the central analytic order of its actual L-function.
CM is expressed by a non-scalar algebraic endomorphism after base change. -/
theorem cm_analyticOrder_double
    {K : Type*} [Field K] [NumberField K] [IsTotallyComplex K]
    (hK : Module.finrank ℚ K = 2)
    (A : WeierstrassCurve ℚ) [A.IsElliptic]
    (hCM : ¬ Function.Surjective (Int.castRingHom (TauCeti.Isogeny.Hom
      (A.map (algebraMap ℚ K)).toAffine (A.map (algebraMap ℚ K)).toAffine)))
    (F G : ℂ → ℂ) (hF : Differentiable ℂ F) (hG : Differentiable ℂ G)
    (hFL : ∀ s : ℂ, 3 / 2 < s.re → F s = A.LSeries s)
    (hGL : ∀ s : ℂ, 3 / 2 < s.re → G s = (A.map (algebraMap ℚ K)).LSeries s) :
    analyticOrderNatAt G 1 = 2 * analyticOrderNatAt F 1 := by
  sorry

/-! ## Layer 5: Congruent-number twists and even Goldfeld -/

/-- The signed quadratic twists of the congruent-number curve in short form,
y² = x³ − n²x. The singular value n = 0 is excluded by each counting family. -/
def congruentTwist (n : ℤ) : WeierstrassCurve ℚ :=
  WeierstrassCurve.shortCurve (-(n : ℚ) ^ 2) 0

open scoped Classical in
/-- Nonvanishing has relative density one among positive squarefree parameters
in residues 1, 2, 3 modulo eight (BT Theorem 1.2). -/
theorem congruentNumber_densityOne :
    Tendsto (fun X : ℕ =>
      (((Finset.Icc 1 X).filter (fun n : ℕ => Squarefree n ∧
        n % 8 ∈ ({1, 2, 3} : Finset ℕ) ∧
        ellipticLNonvanishingAtOne (congruentTwist (n : ℤ)))).card : ℝ) /
      ((Finset.Icc 1 X).filter (fun n : ℕ => Squarefree n ∧
        n % 8 ∈ ({1, 2, 3} : Finset ℕ))).card) atTop (𝓝 1) := by
  sorry

open scoped Classical in
/-- Exactly half of the positive squarefree congruent-number twists have
nonzero central L-value, in the parameter ordering. -/
theorem congruentNumber_half_positive :
    Tendsto (fun X : ℕ =>
      (((Finset.Icc 1 X).filter (fun n : ℕ => Squarefree n ∧
        ellipticLNonvanishingAtOne (congruentTwist (n : ℤ)))).card : ℝ) /
      ((Finset.Icc 1 X).filter (fun n : ℕ => Squarefree n)).card)
      atTop (𝓝 (1 / 2)) := by
  sorry

open scoped Classical in
/-- The even Goldfeld limit for the congruent-number curve, over both signs
of fundamental discriminants ordered by absolute value (including d = 1). -/
theorem congruentNumber_half_discriminants :
    Tendsto (fun X : ℕ =>
      (((Finset.Icc (-(X : ℤ)) (X : ℤ)).filter (fun d : ℤ => d ≠ 0 ∧
        ((d % 4 = 1 ∧ Squarefree d) ∨
          ∃ m : ℤ, d = 4 * m ∧ (m % 4 = 2 ∨ m % 4 = 3) ∧ Squarefree m) ∧
        ellipticLNonvanishingAtOne (congruentTwist d))).card : ℝ) /
      ((Finset.Icc (-(X : ℤ)) (X : ℤ)).filter (fun d : ℤ => d ≠ 0 ∧
        ((d % 4 = 1 ∧ Squarefree d) ∨
          ∃ m : ℤ, d = 4 * m ∧ (m % 4 = 2 ∨ m % 4 = 3) ∧ Squarefree m))).card)
      atTop (𝓝 (1 / 2)) := by
  sorry

/-! ## Layer 6: CM twists, cube sums and non-descent -/

/-- The odd-valuation support height on the native squareclass quotient.
The finite product uses the principal fractional ideal of a nonzero
representative; changing it by a square preserves every valuation parity. -/
noncomputable def squareclassHeight {K : Type*} [Field K] [NumberField K]
    (c : TauCeti.SquareClassGroup K) : ℕ :=
  ∏ᶠ v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers K),
    if Odd (FractionalIdeal.count K v
      (FractionalIdeal.spanSingleton (nonZeroDivisors (NumberField.RingOfIntegers K))
        ((Additive.toMul c.out : Kˣ) : K))) then Ideal.absNorm v.asIdeal else 1

/-- Over an imaginary quadratic field where three is not inert, at least half
of the quadratic twists of any CM elliptic curve have nonzero central L-value,
in the odd-support height ordering (BT Proposition 1.3). -/
theorem cmTwists_nonvanishing_lowerHalf
    {K : Type*} [Field K] [NumberField K] [IsTotallyComplex K]
    (hK : Module.finrank ℚ K = 2)
    (h3 : ¬ (Ideal.span {(3 : NumberField.RingOfIntegers K)}).IsPrime)
    (A : WeierstrassCurve K) [A.IsElliptic]
    (hCM : ¬ Function.Surjective (Int.castRingHom (TauCeti.Isogeny.Hom A.toAffine A.toAffine)))
    (ε : ℝ) (hε : 0 < ε) :
    ∀ᶠ X : ℝ in atTop,
      (1 / 2 - ε) * ({c : TauCeti.SquareClassGroup K |
        (squareclassHeight c : ℝ) < X}.ncard : ℝ) ≤
      ({c : TauCeti.SquareClassGroup K | (squareclassHeight c : ℝ) < X ∧
        ellipticLNonvanishingAtOne
          (A.quadraticTwistOf 0 (-((Additive.toMul c.out : Kˣ) : K)))}.ncard : ℝ) := by
  sorry

/-- The rational Weierstrass model of the pointed projective cube-sum curve
x³+y³=2n, with its five coefficients in the scale Y²=X³−27n². -/
def cubeSumModel (n : ℤ) : WeierstrassCurve ℚ :=
  WeierstrassCurve.shortCurve 0 (-27 * (n : ℚ) ^ 2)

/-- For every nonzero integer n the cube-sum model is elliptic, and its full
endomorphism ring over ℚ(ζ₃) is the maximal order of that field. This states full
CM on the native algebraic-morphism carrier, rather than an arbitrary action on
an abstract group of points. -/
theorem cubeSum_fullCM (n : ℤ) (hn : n ≠ 0) :
    ∃ h : (cubeSumModel n).IsElliptic,
      letI := h
      Nonempty ((NumberField.RingOfIntegers (CyclotomicField 3 ℚ)) ≃+*
        TauCeti.Isogeny.Hom
          ((cubeSumModel n).map (algebraMap ℚ (CyclotomicField 3 ℚ))).toAffine
          ((cubeSumModel n).map (algebraMap ℚ (CyclotomicField 3 ℚ))).toAffine) := by
  sorry

/-- A Weierstrass curve over a characteristic-zero field descends to ℚ as a
pointed elliptic curve when it is an admissible change of variables of the base
change of an elliptic Weierstrass curve over ℚ. -/
def descendsToRat {K : Type*} [Field K] [Algebra ℚ K]
    (W : WeierstrassCurve K) : Prop :=
  ∃ E : WeierstrassCurve ℚ, E.IsElliptic ∧
    ∃ C : WeierstrassCurve.VariableChange K,
      C • E.map (algebraMap ℚ K) = W

/-- Over an imaginary quadratic field, every descending twist lies in the
rational squareclass coset of any one descending twist, except that at j = 1728
there can be the additional coset multiplied by a square root of the defining
negative rational number. The native trace/norm twist at (0,-t) represents the
squareclass of t, since its discriminant parameter is 4t. -/
theorem descendingTwist_twoCosets
    {K : Type*} [Field K] [Algebra ℚ K] [Algebra.IsQuadraticExtension ℚ K]
    (D : ℚ) (hD : D < 0) (theta : Kˣ)
    (htheta : (theta : K) ^ 2 = algebraMap ℚ K D)
    (W : WeierstrassCurve K) [W.IsElliptic]
    (t₀ : Kˣ)
    (ht₀ : descendsToRat (W.quadraticTwistOf 0 (-(t₀ : K))))
    (t : Kˣ)
    (ht : descendsToRat (W.quadraticTwistOf 0 (-(t : K)))) :
    ∃ (q : ℚˣ) (u : Kˣ),
      (t : K) = (t₀ : K) * algebraMap ℚ K (q : ℚ) * (u : K) ^ 2 ∨
      (W.j = 1728 ∧
        (t : K) = (t₀ : K) * (theta : K) *
          algebraMap ℚ K (q : ℚ) * (u : K) ^ 2) := by
  sorry

/-- For any elliptic curve over an imaginary quadratic field, the number of
quadratic twists descending to ℚ below odd-support height X is O(sqrt X). -/
theorem descendingTwists_count_sqrt
    {K : Type*} [Field K] [NumberField K] [IsTotallyComplex K]
    (hK : Module.finrank ℚ K = 2) (A : WeierstrassCurve K) [A.IsElliptic] :
    ∃ C : ℝ, 0 < C ∧ ∀ᶠ X : ℝ in atTop,
      ({c : TauCeti.SquareClassGroup K | (squareclassHeight c : ℝ) < X ∧
        descendsToRat (A.quadraticTwistOf 0 (-((Additive.toMul c.out : Kˣ) : K)))}.ncard : ℝ) ≤
        C * Real.sqrt X := by
  sorry

/-- Under the CM twist hypotheses, non-descending twists with nonzero central
L-value have lower proportion at least one half among all squareclasses. -/
theorem cmTwists_nondescending_nonvanishing_lowerHalf
    {K : Type*} [Field K] [NumberField K] [IsTotallyComplex K]
    (hK : Module.finrank ℚ K = 2)
    (h3 : ¬ (Ideal.span {(3 : NumberField.RingOfIntegers K)}).IsPrime)
    (A : WeierstrassCurve K) [A.IsElliptic]
    (hCM : ¬ Function.Surjective (Int.castRingHom (TauCeti.Isogeny.Hom A.toAffine A.toAffine)))
    (ε : ℝ) (hε : 0 < ε) :
    ∀ᶠ X : ℝ in atTop,
      (1 / 2 - ε) * ({c : TauCeti.SquareClassGroup K |
        (squareclassHeight c : ℝ) < X}.ncard : ℝ) ≤
      ({c : TauCeti.SquareClassGroup K | (squareclassHeight c : ℝ) < X ∧
        ¬ descendsToRat (A.quadraticTwistOf 0 (-((Additive.toMul c.out : Kˣ) : K))) ∧
        ellipticLNonvanishingAtOne
          (A.quadraticTwistOf 0 (-((Additive.toMul c.out : Kˣ) : K)))}.ncard : ℝ) := by
  sorry

end TauCetiRoadmap.CMRankZeroConverse
