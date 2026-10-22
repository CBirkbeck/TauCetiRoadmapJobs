import Mathlib
import TauCeti.FieldTheory.FunctionField.RiemannRoch.ClassNumber

/-!
# FunctionFieldArithmetic: target signatures

The roadmap is README.md; this file is not the roadmap. It states its headline theorems
against the pinned Mathlib and Tau Ceti APIs, using the few simple definitions they need.

The finite-length Artin–Schreier–Witt character classification, degree-one divisor theorem,
divisor zeta identities and polynomial recovery are statable on native carriers below.
The other headline theorems are not statable at the pins: equal-characteristic local
abelian existence lacks the completed local reciprocity carrier; finite ray-cover
classification lacks generalized Picard schemes and their Lang covers; Harder finiteness
lacks the reductive adelic automorphic function module; unitary Eisenstein continuation
and the global Fourier coefficient formula lack smooth induced sections, Eisenstein series
and local representation densities. Their full statements are in the README.
-/

namespace TauCetiRoadmap.FunctionFieldArithmetic

open TauCeti

/-! ## Layer 0: finite constant fields, degrees and normalisations -/

section Constants

variable {k F : Type*} [Field k] [Field F] [Algebra k F]

/-- **Divisors of degree one** (README 0.2): the divisor form of F. K. Schmidt's theorem. No
place of degree one, and no rational point of the model, is asserted. -/
theorem exists_divisor_degree_eq_one [Finite k] (hF : IsFunctionField k F)
    (hk : IsIntegrallyClosedIn k F) : ∃ D : Divisor k F, Divisor.degree D = 1 := by
  sorry

end Constants

/-! ## Layer 3: Artin–Schreier–Witt theory -/

section ArtinSchreierWitt

variable (p : ℕ) [Fact p.Prime] (F : Type*) [Field F]

/-- **The Artin–Schreier–Witt operator** `℘ = Frob − id` on the Witt vectors of a field of
characteristic `p` (README 3.1). It is additive for the Witt group law. -/
noncomputable def artinSchreierWitt [CharP F p] : WittVector p F →+ WittVector p F :=
  (WittVector.frobenius : WittVector p F →+* WittVector p F).toAddMonoidHom -
    AddMonoidHom.id (WittVector p F)

/-- **The Artin–Schreier–Witt group of length `n`** (README 3.1):
`W_n(F) / ℘ W_n(F) = W(F) / (℘ W(F) + ker (truncate n))`. -/
abbrev aswQuotient [CharP F p] (n : ℕ) : Type _ :=
  WittVector p F ⧸ ((artinSchreierWitt p F).range ⊔
    (RingHom.ker (WittVector.truncate (p := p) (R := F) n)).toAddSubgroup)

variable [CharP F p]

/-- The finite-length Artin–Schreier–Witt quotient classifies continuous characters of the
absolute Galois group with values in `ℤ/p^n` (README 3.1; Kosters–Wan, Theorem 3.4).
This signature asserts the underlying group equivalence; the solution pairing and its
functorial and topological characterizations are specified in the README. -/
theorem artinSchreierWitt_galois (n : ℕ) :
    Nonempty (aswQuotient p F n ≃+
      Additive (ContinuousMonoidHom (Field.absoluteGaloisGroup F) (Multiplicative (ZMod (p ^ n))))) := by
  sorry

end ArtinSchreierWitt

/-! ## Layer 5: zeta functions and `L`-polynomials -/

section Zeta

variable (k F : Type*) [Field k] [Field F] [Algebra k F]

/-- The number of effective divisors of degree `n` (finite over a finite constant field by
`TauCeti.Divisor.finite_setOf_isEffective_degree_le`). -/
noncomputable def effectiveDivisorCount (n : ℕ) : ℕ :=
  Nat.card {D : Divisor k F // AlgebraicGeometry.WeilDivisor.IsEffective D ∧ Divisor.degree D = n}

/-- **The zeta function of a function field** (README 5.1): `Σ_n A_n T^n`, with `A_n` the number of
effective divisors of degree `n`. -/
noncomputable def zeta : PowerSeries ℤ :=
  PowerSeries.mk fun n => (effectiveDivisorCount k F n : ℤ)

/-- The number of places of degree `d`. -/
noncomputable def placeCount (d : ℕ) : ℕ :=
  Nat.card {P : Place k F // P.degree = d}

/-- The extension-field point count `N_r = Σ_{d ∣ r} d · #{places of degree d}` (README 5.1). -/
noncomputable def pointCount (r : ℕ) : ℕ :=
  ∑ d ∈ r.divisors, d * placeCount k F d

variable {k F}

open scoped PowerSeries.WithPiTopology

/-- The divisor zeta series is the coefficientwise convergent Euler product over all places
(README 5.1). Each factor is the geometric series in the place degree. -/
theorem zeta_eulerProduct [Finite k] (hF : IsFunctionField k F)
    (hk : IsIntegrallyClosedIn k F) :
    HasProd (fun v : Place k F =>
      PowerSeries.invOfUnit
        (1 - (PowerSeries.X : PowerSeries ℤ) ^ v.degree) (1 : ℤˣ))
      (zeta k F) := by
  sorry

/-- **Logarithmic derivative of the zeta function** (README 5.1):
`r A_r = Σ_{i=1}^{r} N_i A_{r−i}`, equivalently `T Z′/Z = Σ_r N_r T^r`. -/
theorem zeta_logDeriv [Finite k] (hF : IsFunctionField k F) (hk : IsIntegrallyClosedIn k F)
    (r : ℕ) (hr : 0 < r) :
    (r : ℤ) * PowerSeries.coeff r (zeta k F) =
      ∑ i ∈ Finset.range r,
        (pointCount k F (i + 1) : ℤ) * PowerSeries.coeff (r - 1 - i) (zeta k F) := by
  sorry

/-- **Effective divisors in large degree** (README 5.2): for `n > 2g − 2`,
`(q − 1) A_n = h (q^(n + 1 − g) − 1)`. -/
theorem effectiveDivisorCount_of_large [Finite k] (hF : IsFunctionField k F)
    (hk : IsIntegrallyClosedIn k F) (n : ℕ) (hn : 2 * genus k F ≤ n + 1) :
    ((Nat.card k : ℤ) - 1) * effectiveDivisorCount k F n =
      Divisor.classNumber hF * ((Nat.card k : ℤ) ^ (n + 1 - genus k F) - 1) := by
  sorry

/-- **Rationality, functional equation and the class number** (README 5.3). The `L`-polynomial
`(1 − T)(1 − qT) Z(T)` has degree `2g`, constant term `1`, leading coefficient `q^g`, the
reciprocal symmetry `a_{2g−j} = q^(g−j) a_j`, linear coefficient `N_1 − (q + 1)` and value `h`
at `1`. -/
theorem zeta_rationality [Finite k] (hF : IsFunctionField k F) (hk : IsIntegrallyClosedIn k F) :
    ∃ P : Polynomial ℤ,
      zeta k F * ((1 - PowerSeries.X) * (1 - PowerSeries.C (Nat.card k : ℤ) * PowerSeries.X)) =
        (P : PowerSeries ℤ) ∧
      P.coeff 0 = 1 ∧ P.natDegree = 2 * genus k F ∧
      P.leadingCoeff = (Nat.card k : ℤ) ^ genus k F ∧
      (∀ j ≤ genus k F,
        P.coeff (2 * genus k F - j) = (Nat.card k : ℤ) ^ (genus k F - j) * P.coeff j) ∧
      P.coeff 1 = (pointCount k F 1 : ℤ) - (Nat.card k + 1) ∧
      P.eval 1 = Divisor.classNumber hF := by
  sorry

end Zeta

/-! ## Layer 5.6: recovering the `L`-polynomial from `g` point counts -/

section LPolynomial

open Polynomial

/-- **`L`-polynomial data** (README 5.6) for `q`, `g` and counts `N`: constant term `1`, degree at
most `2g`, the reciprocal symmetry, and the first `g` Newton identities
`r a_r = Σ_{i=1}^{r} (N_i − q^i − 1) a_{r−i}`. -/
def IsLPolynomialData (q g : ℕ) (N : ℕ → ℤ) (P : Polynomial ℤ) : Prop :=
  P.coeff 0 = 1 ∧ P.natDegree ≤ 2 * g ∧
  (∀ j ≤ g, P.coeff (2 * g - j) = (q : ℤ) ^ (g - j) * P.coeff j) ∧
  ∀ r, 0 < r → r ≤ g →
    (r : ℤ) * P.coeff r =
      ∑ i ∈ Finset.range r, (N (i + 1) - (q : ℤ) ^ (i + 1) - 1) * P.coeff (r - 1 - i)

/-- The first `g` counts and the functional equation determine the polynomial (README 5.6). -/
theorem IsLPolynomialData.unique {q g : ℕ} {N : ℕ → ℤ} {P P' : Polynomial ℤ}
    (h : IsLPolynomialData q g N P) (h' : IsLPolynomialData q g N P') : P = P' := by
  sorry

/-- The `L`-polynomial of a function field satisfies the data with `N = pointCount`
(README 5.6). -/
theorem lPolynomial_isLPolynomialData {k F : Type*} [Field k] [Finite k] [Field F] [Algebra k F]
    (hF : IsFunctionField k F) (hk : IsIntegrallyClosedIn k F) (P : Polynomial ℤ)
    (hP : zeta k F * ((1 - PowerSeries.X) *
      (1 - PowerSeries.C (Nat.card k : ℤ) * PowerSeries.X)) = (P : PowerSeries ℤ)) :
    IsLPolynomialData (Nat.card k) (genus k F) (fun r => pointCount k F r) P := by
  sorry

/-- For `y² = x³ + x + 1` over `𝔽₅`, `N₁ = 9` gives `1 + 3T + 5T²` (README worked example 2). -/
example : IsLPolynomialData 5 1 (fun _ => 9) (1 + C 3 * X + C 5 * X ^ 2) := by
  refine ⟨by simp [coeff_X, coeff_X_pow], ?_, ?_, ?_⟩
  · compute_degree!
  · intro j hj
    interval_cases j <;> simp [coeff_X, coeff_X_pow, coeff_one]
  · intro r hr hr'
    obtain rfl : r = 1 := by omega
    simp [coeff_X, coeff_X_pow, coeff_one]

/-- A wrong count `N₁ = 8` is rejected for the same polynomial. -/
example : ¬ IsLPolynomialData 5 1 (fun _ => 8) (1 + C 3 * X + C 5 * X ^ 2) := by
  rintro ⟨-, -, -, h⟩
  have := h 1 one_pos le_rfl
  simp [coeff_X, coeff_X_pow, coeff_one] at this

end LPolynomial

end TauCetiRoadmap.FunctionFieldArithmetic
