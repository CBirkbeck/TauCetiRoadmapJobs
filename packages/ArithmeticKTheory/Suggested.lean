import Mathlib

/-!
# ArithmeticKTheory: target signatures

README.md is the roadmap; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti APIs: denominator
localization, eventual multiplication-intersection stabilization, certificate
soundness and the divided-Bernoulli consequence of cyclotomic class-number
regularity. CyclotomicClassGroupsAndStickelberger supplies the finite criterion
and prime-power class-number stability.

Quillen finite generation and ranks, Soule localization, the odd and even
integral tables, Harris–Segal detection, higher wild-kernel divisibility, Bott
descent, K₄(ℤ) = 0, the Vandiver K-group table and the Gaussian and golden
tame-kernel equivalences are not statable at the pins: their higher Quillen
K-group/spectrum carriers and comparison maps are missing. Hermitian finiteness
also lacks the required GW/L-spectrum carriers. Numerical rank or degree-slot
formulas do not state those theorems.
-/

noncomputable section

open IsDedekindDomain
open scoped Pointwise

namespace TauCetiRoadmap.ArithmeticKTheory

/-! ## Layer 1: S-integers and arithmetic functoriality -/

section SIntegers

variable {R : Type*} [CommRing R] [IsDedekindDomain R]
  (S : Set (HeightOneSpectrum R)) (F : Type*) [Field F]
  [Algebra R F] [IsFractionRing R F]

/-- The candidate denominators are the preimage of the units of the existing ring. -/
def sUnitSubmonoid : Submonoid R :=
  (IsUnit.submonoid (S.integer F)).comap (algebraMap R (S.integer F))

/-- The denominator criterion for arbitrary sets of primes; README §1.1. -/
theorem integer_isLocalization_iff (M : Submonoid R) :
    IsLocalization M (S.integer F) ↔
      M ≤ sUnitSubmonoid S F ∧ ∀ v ∈ S, ∃ m ∈ M, m ∈ v.asIdeal := by
  sorry

/-- Torsion of the class group suffices even when the set of inverted primes is infinite. -/
theorem integer_isLocalization_of_torsion_classGroup
    (htors : ∀ c : ClassGroup R, IsOfFinOrder c) :
    IsLocalization (sUnitSubmonoid S F) (S.integer F) := by
  sorry

end SIntegers

/-! ## Layer 6: even groups, divisibility and Bott degrees -/

section DivisibleElements

variable (A : Type*) [AddCommGroup A]

/-- The elements divisible by every positive integer. -/
def divisibleSubgroup : AddSubgroup A :=
  ⨅ (m : ℕ) (_ : 1 ≤ m), m • (⊤ : AddSubgroup A)

/-- A finite subgroup containing all infinite-height elements has an eventual
intersection bound; its exponent need not be such a bound. -/
theorem inter_mul_eventually_eq_divisibleSubgroup (T : AddSubgroup A)
    [Finite T] (hT : divisibleSubgroup A ≤ T) :
    ∃ m₀ : ℕ, 1 ≤ m₀ ∧ ∀ m : ℕ, 1 ≤ m → m₀ ∣ m →
      T ⊓ m • (⊤ : AddSubgroup A) = divisibleSubgroup A := by
  sorry

end DivisibleElements

/-- Matched upper and lower finite orders certify a presentation of an abelian group. -/
structure OrderCertificate (A : Type*) [AddCommGroup A] where
  /-- Finite linear generators and relations over the integers. -/
  rel : Module.Relations.{0, 0} ℤ
  /-- Finiteness of the generator index. -/
  [finiteGenerators : Finite rel.G]
  /-- Finiteness of the relation index. -/
  [finiteRelations : Finite rel.R]
  /-- The specified solution in the group to be presented. -/
  solution : rel.Solution A
  /-- The specified generator images span the group. -/
  span_eq_top : Submodule.span ℤ (Set.range solution.var) = ⊤
  /-- Finiteness of the upper presentation quotient. -/
  [finiteUpper : Finite rel.Quotient]
  /-- The lower quotient group. -/
  B : Type
  /-- The lower quotient's abelian group structure. -/
  [groupB : AddCommGroup B]
  /-- Finiteness of the lower quotient. -/
  [finiteB : Finite B]
  /-- The map realizing the lower quotient. -/
  lower : A →+ B
  /-- Surjectivity gives the lower order bound. -/
  lower_surjective : Function.Surjective lower
  /-- Equality of the two finite bounds. -/
  card_match : Nat.card B = Nat.card rel.Quotient

attribute [instance] OrderCertificate.finiteGenerators OrderCertificate.finiteRelations
  OrderCertificate.finiteUpper OrderCertificate.groupB OrderCertificate.finiteB

/-- The spanning solution in a matched certificate is its actual presentation. -/
theorem OrderCertificate.isPresentation {A : Type*} [AddCommGroup A]
    (cert : OrderCertificate A) : cert.solution.IsPresentation := by
  sorry

/-! ## Layer 7: Bernoulli numbers and regular primes -/

/-- If an odd prime does not divide the cyclotomic class number, it divides
no reduced numerator of B_(2k)/k for k >= 1; README §7.2. -/
theorem regularPrime_dividedBernoulli_num (p : ℕ) (hp : p.Prime) (hodd : Odd p)
    (hreg : ¬ p ∣ NumberField.classNumber (CyclotomicField p ℚ))
    (k : ℕ) (hk : 1 ≤ k) :
    ¬ (p : ℤ) ∣ (bernoulli (2 * k) / (k : ℚ)).num := by
  sorry

end TauCetiRoadmap.ArithmeticKTheory
