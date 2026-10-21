import Mathlib

/-!
# QWittVectors: representative target signatures

The roadmap is README.md. This file records statements suggested against the pinned APIs
and is not exhaustive. Ghost polynomials can be stated on coordinate functions before the
big Witt ring structure is constructed. Their indices are positive members of a truncation
set; values of a coordinate function outside that set are irrelevant.
-/

namespace TauCetiRoadmap.QWittVectors.BigWitt

open scoped BigOperators

/-! ## Layer 1: Big Witt rings and shared homological algebra -/

/-- A truncation set is a set of positive natural numbers closed under positive divisors.
The empty truncation set is allowed (Hesselholt, §1). Positive-divisor closure
also underlies the roadmap's `TruncationSet.div_mem` API for the truncation set S/n. -/
structure TruncationSet where
  carrier : Set ℕ
  positive : ∀ n ∈ carrier, 0 < n
  divisor_closed : ∀ {n d : ℕ}, n ∈ carrier → 0 < d → d ∣ n → d ∈ carrier

/-- The integral big Witt ghost polynomial of positive index `n`, evaluated on coordinates.
The defining divisor sum is used only at positive indices in the target theorems. -/
def ghostPolynomial {R : Type*} [CommRing R] (n : ℕ) (x : ℕ → R) : R :=
  ∑ d ∈ n.divisors, (d : R) * x d ^ (n / d)

/-- The Dwork ghost-image criterion, with independently specified prime Frobenius lifts.
The lifts need not commute (Hesselholt, Lemma 1.1). -/
theorem ghost_image {R : Type*} [CommRing R] (S : TruncationSet)
    (φ : ℕ → R →+* R)
    (hφ : ∀ p, p.Prime → p ∈ S.carrier → ∀ a : R,
      φ p a - a ^ p ∈ Ideal.span ({(p : R)} : Set R))
    (b : ℕ → R) :
    (∃ x : ℕ → R, ∀ n ∈ S.carrier, ghostPolynomial n x = b n) ↔
      ∀ p, p.Prime → ∀ n ∈ S.carrier, p ∣ n →
        b n - φ p (b (n / p)) ∈
          Ideal.span ({(p : R) ^ padicValNat p n} : Set R) := by
  sorry

/-- Ghosts determine all coordinates in a truncation set when multiplication by each
index is injective. No Frobenius lifts are needed for this assertion. -/
theorem ghost_injective {R : Type*} [CommRing R] (S : TruncationSet)
    (hS : ∀ n ∈ S.carrier, Function.Injective (fun a : R => (n : R) * a))
    (x y : ℕ → R)
    (hxy : ∀ n ∈ S.carrier, ghostPolynomial n x = ghostPolynomial n y) :
    ∀ n ∈ S.carrier, x n = y n := by
  sorry

/-- If all truncation indices are units, every ghost sequence has a unique coordinate
sequence on that truncation set, including the empty set. -/
theorem ghost_equiv_of_units {R : Type*} [CommRing R] (S : TruncationSet)
    (hS : ∀ n ∈ S.carrier, IsUnit (n : R)) (b : ℕ → R) :
    ∃ x : ℕ → R, (∀ n ∈ S.carrier, ghostPolynomial n x = b n) ∧
      ∀ y : ℕ → R, (∀ n ∈ S.carrier, ghostPolynomial n y = b n) →
        ∀ n ∈ S.carrier, y n = x n := by
  sorry

/-- The empty set and the positive divisors of six both give truncation sets;
the empty coordinate product has exactly one element. -/
example :
    ((∃ S : TruncationSet, S.carrier = ∅) ∧
      Nonempty (Unique ((n : (∅ : Set ℕ)) → ℤ))) ∧
    (∃ S : TruncationSet, S.carrier = {n : ℕ | 0 < n ∧ n ∣ 6}) := by
  constructor
  · constructor
    · exact ⟨⟨∅, by simp, by simp⟩, rfl⟩
    · refine ⟨{ default := fun _ => 0, uniq := ?_ }⟩
      intro f
      funext n
      exact False.elim (by simpa using n.property)
  · refine ⟨⟨{n : ℕ | 0 < n ∧ n ∣ 6}, ?_, ?_⟩, rfl⟩
    · intro n hn
      exact hn.1
    · intro n d hn hd hdn
      exact ⟨hd, dvd_trans hdn hn.2⟩

/-- Omitting the divisor one prevents the singleton containing two from being a
truncation set. -/
example : ¬ ∃ S : TruncationSet, S.carrier = ({2} : Set ℕ) := by
  rintro ⟨S, hS⟩
  have h2 : 2 ∈ S.carrier := by simp [hS]
  have h1 : 1 ∈ S.carrier := S.divisor_closed h2 (by decide) (one_dvd 2)
  simpa [hS] using h1

/-- The symbolic divisor ghosts retain both prime divisors of six. Over the integers,
coordinates one and one give the compatible first two ghosts one and three. -/
example {R : Type*} [CommRing R] (x : ℕ → R) :
    (ghostPolynomial 1 x = x 1 ∧
      ghostPolynomial 2 x = x 1 ^ 2 + 2 * x 2 ∧
      ghostPolynomial 6 x = x 1 ^ 6 + 2 * x 2 ^ 3 + 3 * x 3 ^ 2 + 6 * x 6) ∧
    (ghostPolynomial 1 (fun _ : ℕ => (1 : ℤ)) = 1 ∧
      ghostPolynomial 2 (fun _ : ℕ => (1 : ℤ)) = 3) := by
  have h1 : Nat.divisors 1 = {1} := by decide
  have h2 : Nat.divisors 2 = {1, 2} := by decide
  have h6 : Nat.divisors 6 = {1, 2, 3, 6} := by decide
  constructor
  · refine ⟨?_, ?_, ?_⟩ <;> norm_num [ghostPolynomial, h1, h2, h6] <;> ring
  · norm_num [ghostPolynomial, h1, h2]

/-- Characteristic two permits a nonzero coordinate with zero ghosts. Over the integers,
the incompatible pair of ghosts zero and one has no coordinate preimage. -/
example :
    (ghostPolynomial 1 (fun n : ℕ => if n = 2 then (1 : ZMod 2) else 0) = 0 ∧
      ghostPolynomial 2 (fun n : ℕ => if n = 2 then (1 : ZMod 2) else 0) = 0 ∧
      (if (2 : ℕ) = 2 then (1 : ZMod 2) else 0) ≠ 0) ∧
    (¬ ∃ x : ℕ → ℤ, ghostPolynomial 1 x = 0 ∧ ghostPolynomial 2 x = 1) := by
  have h1 : Nat.divisors 1 = {1} := by decide
  have h2 : Nat.divisors 2 = {1, 2} := by decide
  constructor
  · norm_num [ghostPolynomial, h1, h2]
  · rintro ⟨x, hx1, hx2⟩
    have hx : x 1 = 0 := by simpa [ghostPolynomial, h1] using hx1
    have hx2' : 2 * x 2 = 1 := by simpa [ghostPolynomial, h2, hx] using hx2
    omega

end TauCetiRoadmap.QWittVectors.BigWitt
